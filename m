From: ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org (Eric W. Biederman)
Subject: Re: signals: Bug or manpage inconsistency?
Date: Thu, 01 Jun 2017 02:01:38 -0500
Message-ID: <87y3tcgpil.fsf@xmission.com>
References: <alpine.DEB.2.20.1705301402270.1950@nanos>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.20.1705301402270.1950@nanos> (Thomas Gleixner's
        message of "Tue, 30 May 2017 15:21:34 +0200 (CEST)")
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org> writes:

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
>
> The same happens with sigwait() while the signal is still blocked and
> ignored, it returns with that signal number and has the signal dequeued.
>
>
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
>
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

I just looked through the history and the commit you point to looks like
it was either code motion or a regression fix.  The change to ignore
blocked signals actually came in between 1.2 and 2.0.  It looks like the
relevant diff was:

commit 886bad3fe1fe0c67208f15a02047e450e30f2b3a
Author: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Date:   Mon Apr 1 16:00:00 1996 -0800

    Linux version 1.3.82

diff --git a/kernel/exit.c b/kernel/exit.c
index 2b8e6d13ba1f..329d0b36bb08 100644
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@ -23,25 +23,28 @@ extern void kerneld_exit(void);
 
 int getrusage(struct task_struct *, int, struct rusage *);
 
-static int generate(unsigned long sig, struct task_struct * p)
+static inline void generate(unsigned long sig, struct task_struct * p)
 {
        unsigned long mask = 1 << (sig-1);
        struct sigaction * sa = sig + p->sig->action - 1;
 
-       /* always generate signals for traced processes ??? */
-       if (!(p->flags & PF_PTRACED)) {
+       /*
+        * Optimize away the signal, if it's a signal that can
+        * be handled immediately (ie non-blocked and untraced)
+        * and that is ignored (either explicitly or by default)
+        */
+       if (!(mask & p->blocked) && !(p->flags & PF_PTRACED)) {
                /* don't bother with ignored signals (but SIGCHLD is special) */
                if (sa->sa_handler == SIG_IGN && sig != SIGCHLD)
-                       return 0;
+                       return;
                /* some signals are ignored by default.. (but SIGCONT already did its deed) */
                if ((sa->sa_handler == SIG_DFL) &&
                    (sig == SIGCONT || sig == SIGCHLD || sig == SIGWINCH || sig == SIGURG))
-                       return 0;
+                       return;
        }
        p->signal |= mask;
        if (p->state == TASK_INTERRUPTIBLE && (p->signal & ~p->blocked))
                wake_up_process(p);
-       return 1;
 }
 
 int send_sig(unsigned long sig,struct task_struct * p,int priv)



Eric
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
