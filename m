From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: signals: Bug or manpage inconsistency?
Date: Tue, 30 May 2017 18:14:26 +0200 (CEST)
Message-ID: <alpine.DEB.2.20.1705301750390.1950@nanos>
References: <alpine.DEB.2.20.1705301402270.1950@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.20.1705301402270.1950@nanos>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Tue, 30 May 2017, Thomas Gleixner wrote:
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

So I found at least some explanation by studying the spec some more.

There are two variants of ignored signals:

  1) handler is SIG_IGN

  2) handler is SIG_DFL and default action is 'ignore'

     These are the signals in SIG_KERNEL_IGNORE_MASK 

     #define SIG_KERNEL_IGNORE_MASK (\
       	rt_sigmask(SIGCONT)   |  rt_sigmask(SIGCHLD)   | \
        rt_sigmask(SIGWINCH)  |  rt_sigmask(SIGURG)    )

     These signals are not allowed to be discarded when the signal is
     blocked.

So my understanding of the spec is:

  #1 Can discard the signals as long as SIG_IGN is set whether the signal
     is blocked or not

  #2 Must queue them if the signal is blocked, otherwise discard

I changed the logic according to this with the patch below and a quick test
run of lpt and glibc test cases produces no failures.

Thoughts?

Thanks,

	tglx

8<--------------------
Subject: signals: Reduce scope of blocked signals in sig_handler_ignored()
From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Date: Tue, 30 May 2017 18:01:33 +0200

Add proper changelog and a big fat comment in the code.

Not-yet-signed-off-by: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
---
 kernel/signal.c |    9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

Index: b/kernel/signal.c
===================================================================
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -70,6 +70,13 @@ static int sig_handler_ignored(void __us
 		(handler == SIG_DFL && sig_kernel_ignore(sig));
 }
 
+static int sig_handler_is_sigign(struct task_struct *t, int sig)
+{
+	void __user *handler = sig_handler(t, sig);
+
+	return handler == SIG_IGN;
+}
+
 static int sig_task_ignored(struct task_struct *t, int sig, bool force)
 {
 	void __user *handler;
@@ -91,7 +98,7 @@ static int sig_ignored(struct task_struc
 	 * unblocked.
 	 */
 	if (sigismember(&t->blocked, sig) || sigismember(&t->real_blocked, sig))
-		return 0;
+		return sig_handler_is_sigign(t, sig);
 
 	if (!sig_task_ignored(t, sig, force))
 		return 0;
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
