From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: signals: Bug or manpage inconsistency?
Date: Tue, 30 May 2017 22:54:38 +0200 (CEST)
Message-ID: <alpine.DEB.2.20.1705302241040.2356@nanos>
References: <alpine.DEB.2.20.1705301402270.1950@nanos> <alpine.DEB.2.20.1705301750390.1950@nanos> <20170530170414.GA22463@redhat.com> <CA+55aFygrsUhzQzEOX7YLzxMWE_GbKhJjQZ7nSDXnFFbRAWCJA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CA+55aFygrsUhzQzEOX7YLzxMWE_GbKhJjQZ7nSDXnFFbRAWCJA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, libc-alpha <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Tue, 30 May 2017, Linus Torvalds wrote:
> On Tue, May 30, 2017 at 10:04 AM, Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> > Obviously this is a user-visible change and it can break something. Say, an
> > application does sigwaitinfo(SIGCHLD) and SIGCHLD is ignored (SIG_IGN), this
> > will no longer work.
> 
> That's an interesting special case. Yes, SIG_IGN actually has magical
> properties wrt SIGCHLD. It basically means the opposite of ignoring
> it, it's an "implicit signal handler".  So I could imagine people
> using SIG_IGN to avoid the signal handler, but then block SIG_CHLD and
> using sigwait() for it.
> 
> That sounds nonportable as hell, but I could imagine people doing it
> because it happens to work.

Just that it does not work. See do_notify_parent()

	if (!tsk->ptrace && sig == SIGCHLD &&
	    (psig->action[SIGCHLD-1].sa.sa_handler == SIG_IGN ||
	     (psig->action[SIGCHLD-1].sa.sa_flags & SA_NOCLDWAIT))) {
		/*
		 * We are exiting and our parent doesn't care.  POSIX.1
		 * defines special semantics for setting SIGCHLD to SIG_IGN
		 * or setting the SA_NOCLDWAIT flag: we should be reaped
		 * automatically and not left for our parent's wait4 call.
		 * Rather than having the parent do it as a magic kind of
		 * signal handler, we just set this to tell do_exit that we
		 * can be cleaned up without becoming a zombie.  Note that
		 * we still call __wake_up_parent in this case, because a
		 * blocked sys_wait4 might now return -ECHILD.
		 *
		 * Whether we send SIGCHLD or not for SA_NOCLDWAIT
		 * is implementation-defined: we do (if you don't want
		 * it, just use SIG_IGN instead).
		 */
		autoreap = true;
		if (psig->action[SIGCHLD-1].sa.sa_handler == SIG_IGN)
			sig = 0;
	}
        if (valid_signal(sig) && sig)
                __group_send_sig_info(sig, &info, tsk->parent);

So if the oarent has SIG_IGN we do not send a signal at all. So it's not a
really interesting special case and the magic properties are not that magic
either. Test case below. The parent waits forever.

Thanks,

	tglx
---

#include <unistd.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/wait.h>

int main(void)
{
	struct sigaction action;
	sigset_t set;
	int signum;

	sigemptyset(&set);
	sigaddset (&set, SIGCHLD);

	memset(&action, 0, sizeof(action));
	action.sa_handler = SIG_IGN;
	sigaction(SIGCHLD, &action, NULL);

	sigprocmask(SIG_BLOCK, &set, NULL);

	if (fork() == 0) {
		sleep(1);
		printf("Child exiting\n");
		exit(0);
	}

	sigwait(&set, &signum);
	printf("Parent exiting\n");
	return 0;
}



--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
