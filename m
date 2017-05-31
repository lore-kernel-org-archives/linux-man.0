From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: signals: Bug or manpage inconsistency?
Date: Wed, 31 May 2017 08:51:11 +0200
Message-ID: <47e4e2e5-dfb7-5309-a8af-5a9e269d051c@gmail.com>
References: <alpine.DEB.2.20.1705301402270.1950@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.20.1705301402270.1950@nanos>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Thomas,

On 05/30/2017 03:21 PM, Thomas Gleixner wrote:
> While trying to address the longstanding FIXME in the posix timer code
> related to ignored signals, I stumbled over the following issue:
> 
> I blocked the signal of the timer, then installed the SIG_IGN handler,
> created and started the timer. After a short sleep the timer has fired
> several times, but it's still ignored AND blocked.
> 
> Calling sigpending() after that has the timer signal set. See test case
> below.
> 
> But 'man sigpending' says:
> 
>    "If a signal is both blocked and has a disposition of "ignored", it is _not_
>     added to the mask of pending signals when generated."
> 
> So something is clearly wrong here.

Yes. I confirm the behavior you saw with your test program. And, I'm a little
surprised by the man page text (mainly because I wrote it :-}).

Here's what I understand as longstanding UNIX behavior: if a blocked signal
is pending, and then we set the disposition to SIG_IGN, the signal is
removed the pending set.

The reason I'm surprised about the man page text is because I think I wrote
it (in 2013) while thinking about that case. I don't recall ever much thinking
about the case "signal is generated while it is blocked and its disposition
has been explicitly set to SIG_IGN" (and the commit message that goes with
the man page change isn't really enlightening as to my thinking either...)

> The same happens with sigwait() while the signal is still blocked and
> ignored, it returns with that signal number and has the signal dequeued.

Yes. And one can also see that the signal is pending in the ShdPnd field
of /proc/PID/status.

> The whole blocked vs. ignored handling is inconsistent both in the posix
> spec and in the kernel.
>
> The only thing vs. ignored signals what the spec mandates is:
> 
>  SIG_IGN:
> 
>  Delivery of the signal shall have no effect on the process.
> 
>  ...
> 
>  Setting a signal action to SIG_IGN for a signal that is pending shall
>  cause the pending signal to be discarded, whether or not it is blocked.

Yes, that's the bit I knew.
 
>  ...
> 
>  Any queued values pending shall be discarded and the resources used to
>  queue them shall be released and made available to queue other signals.
> 
> That's exactly what the kernel does in do_sigaction().
> 
> And for everything else the spec is blurry:
> 
>   If the action associated with a blocked signal is to ignore the signal
>   and if that signal is generated for the process, it is unspecified
>   whether the signal is discarded immediately upon generation or remains
>   pending.
> 
> So the kernel has chosen to keep them pending for whatever reasons, which
> does not make any sense to me, but there is probably a historic reason.
> 
> The commit which added the queuing of blocked and ignored signals is in the
> history tree with a pretty useless changelog.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git
> 
>  commit 98fc8ab9e74389e0c7001052597f61336dc62833
>  Author: Linus Torvalds <torvalds-ZsETY1VsSgIuF7duwytmx4H6Mc4MB0Vx@public.gmane.org>
>  Date:   Tue Feb 11 20:49:03 2003 -0800
> 
>      Don't wake up processes unnecessarily for ignored signals
> 
> It rewrites sig_ignored() and adds the following to it:
> 
> +       /*
> +        * Blocked signals are never ignored, since the
> +        * signal handler may change by the time it is
> +        * unblocked.
> +        */
> +       if (sigismember(&t->blocked, sig))
> +               return 0;
> 
> I have no idea how that is related to $subject of the commit and why this
> decision was made.
> 
> Linus, any recollection?
> 
> IMO, it's perfectly reasonable to discard ignored signals even when the
> signal is in the blocked mask. When its unblocked and SIG_IGN is replaced
> then the next signal will be delivered. But hell knows, how much user space
> depends on this weird behaviour by now.

Clearly, something needs to be fixed in the man page. I want to do
a little more investigation first though.

Cheers,

Michael

> 
> Thanks,
> 
> 	tglx
> 	
> 8<-------------
> 
> #define _GNU_SOURCE
> #include <stdint.h>
> #include <stdio.h>
> #include <unistd.h>
> #include <signal.h>
> #include <string.h>
> #include <time.h>
> 
> #include <sys/types.h>
> #include <sys/time.h>
> #include <sys/syscall.h>
> 
> int main(void)
> {
> 	struct itimerspec tspec;
> 	struct sigevent sigev;
> 	struct sigaction action;
> 	int signal, sig = SIGALRM;
> 	sigset_t set, pend;
> 	timer_t timerid;
> 
> 	sigemptyset(&set);
> 	sigaddset(&set, sig);
> 	sigprocmask(SIG_BLOCK, &set, NULL);
> 
> 	memset(&action, 0, sizeof(action));
> 	action.sa_handler = SIG_IGN;
> 	sigaction(sig, &action, NULL);
> 
> 	memset(&sigev, 0, sizeof(sigev));
> 	sigev.sigev_notify = SIGEV_SIGNAL;
> 	sigev.sigev_signo = sig;
> 	sigev.sigev_value.sival_ptr = &timerid;
> 	timer_create(CLOCK_REALTIME, &sigev, &timerid);
> 
> 	tspec.it_interval.tv_sec = 0;
> 	tspec.it_interval.tv_nsec = 100 * 1e6;
> 
> 	tspec.it_value.tv_sec = 0;
> 	tspec.it_value.tv_nsec = 100 * 1e6;
> 
> 	timer_settime(timerid, 0, &tspec, NULL);
> 
> 	sleep(1);
> 
> 	sigpending(&pend);
> 	if (sigismember(&pend, sig)) {
> 		/* This is reached */
> 		printf("Timer signal pending 1\n");
> 		sigwait(&set, &signal);
> 		printf("sigwait signal: %d\n", signal);
> 	}
> 
> 	sleep(1);
> 
> 	printf("Unblock\n");
> 	sigprocmask(SIG_UNBLOCK, &set, NULL);
> 
> 	sigpending(&pend);
> 	if (sigismember(&pend, sig)) {
> 		/* This is not reached */
> 		printf("Timer signal pending 2\n");
> 		sigwait(&set, &signal);
> 		printf("sigwait signal: %d\n", signal);
> 	}
> 
> 	sleep(1);
> 
> 	sigpending(&pend);
> 	if (sigismember(&pend, sig)) {
> 		/* This is not reached */
> 		printf("Timer signal pending 3\n");
> 		sigwait(&set, &signal);
> 		printf("sigwait signal: %d\n", signal);
> 	}
> 
> 	timer_delete(timerid);
> 	return 0;
> }
> 
> 
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
