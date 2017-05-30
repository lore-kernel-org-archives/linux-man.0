From: Thomas Gleixner <tglx@linutronix.de>
Subject: signals: Bug or manpage inconsistency?
Date: Tue, 30 May 2017 15:21:34 +0200 (CEST)
Message-ID: <alpine.DEB.2.20.1705301402270.1950@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <libc-alpha-return-79821-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
To: LKML <linux-kernel@vger.kernel.org>
Cc: Oleg Nesterov <oleg@redhat.com>, Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, Michael Kerrisk <mtk.manpages@gmail.com>, linux-man@vger.kernel.org, libc-alpha@sourceware.org
List-Id: linux-man@vger.kernel.org

While trying to address the longstanding FIXME in the posix timer code
related to ignored signals, I stumbled over the following issue:

I blocked the signal of the timer, then installed the SIG_IGN handler,
created and started the timer. After a short sleep the timer has fired
several times, but it's still ignored AND blocked.

Calling sigpending() after that has the timer signal set. See test case
below.

But 'man sigpending' says:

   "If a signal is both blocked and has a disposition of "ignored", it is _not_
    added to the mask of pending signals when generated."

So something is clearly wrong here.

The same happens with sigwait() while the signal is still blocked and
ignored, it returns with that signal number and has the signal dequeued.


The whole blocked vs. ignored handling is inconsistent both in the posix
spec and in the kernel.

The only thing vs. ignored signals what the spec mandates is:

 SIG_IGN:

 Delivery of the signal shall have no effect on the process.

 ...

 Setting a signal action to SIG_IGN for a signal that is pending shall
 cause the pending signal to be discarded, whether or not it is blocked.

 ...

 Any queued values pending shall be discarded and the resources used to
 queue them shall be released and made available to queue other signals.

That's exactly what the kernel does in do_sigaction().

And for everything else the spec is blurry:

  If the action associated with a blocked signal is to ignore the signal
  and if that signal is generated for the process, it is unspecified
  whether the signal is discarded immediately upon generation or remains
  pending.

So the kernel has chosen to keep them pending for whatever reasons, which
does not make any sense to me, but there is probably a historic reason.

The commit which added the queuing of blocked and ignored signals is in the
history tree with a pretty useless changelog.

https://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git

 commit 98fc8ab9e74389e0c7001052597f61336dc62833
 Author: Linus Torvalds <torvalds@penguin.transmeta.com>
 Date:   Tue Feb 11 20:49:03 2003 -0800

     Don't wake up processes unnecessarily for ignored signals

It rewrites sig_ignored() and adds the following to it:

+       /*
+        * Blocked signals are never ignored, since the
+        * signal handler may change by the time it is
+        * unblocked.
+        */
+       if (sigismember(&t->blocked, sig))
+               return 0;

I have no idea how that is related to $subject of the commit and why this
decision was made.

Linus, any recollection?

IMO, it's perfectly reasonable to discard ignored signals even when the
signal is in the blocked mask. When its unblocked and SIG_IGN is replaced
then the next signal will be delivered. But hell knows, how much user space
depends on this weird behaviour by now.

Thanks,

	tglx
	
8<-------------

#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <unistd.h>
#include <signal.h>
#include <string.h>
#include <time.h>

#include <sys/types.h>
#include <sys/time.h>
#include <sys/syscall.h>

int main(void)
{
	struct itimerspec tspec;
	struct sigevent sigev;
	struct sigaction action;
	int signal, sig = SIGALRM;
	sigset_t set, pend;
	timer_t timerid;

	sigemptyset(&set);
	sigaddset(&set, sig);
	sigprocmask(SIG_BLOCK, &set, NULL);

	memset(&action, 0, sizeof(action));
	action.sa_handler = SIG_IGN;
	sigaction(sig, &action, NULL);

	memset(&sigev, 0, sizeof(sigev));
	sigev.sigev_notify = SIGEV_SIGNAL;
	sigev.sigev_signo = sig;
	sigev.sigev_value.sival_ptr = &timerid;
	timer_create(CLOCK_REALTIME, &sigev, &timerid);

	tspec.it_interval.tv_sec = 0;
	tspec.it_interval.tv_nsec = 100 * 1e6;

	tspec.it_value.tv_sec = 0;
	tspec.it_value.tv_nsec = 100 * 1e6;

	timer_settime(timerid, 0, &tspec, NULL);

	sleep(1);

	sigpending(&pend);
	if (sigismember(&pend, sig)) {
		/* This is reached */
		printf("Timer signal pending 1\n");
		sigwait(&set, &signal);
		printf("sigwait signal: %d\n", signal);
	}

	sleep(1);

	printf("Unblock\n");
	sigprocmask(SIG_UNBLOCK, &set, NULL);

	sigpending(&pend);
	if (sigismember(&pend, sig)) {
		/* This is not reached */
		printf("Timer signal pending 2\n");
		sigwait(&set, &signal);
		printf("sigwait signal: %d\n", signal);
	}

	sleep(1);

	sigpending(&pend);
	if (sigismember(&pend, sig)) {
		/* This is not reached */
		printf("Timer signal pending 3\n");
		sigwait(&set, &signal);
		printf("sigwait signal: %d\n", signal);
	}

	timer_delete(timerid);
	return 0;
}
