From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/4] signal: add a helper for dequeuing signals from a
 specified queue
Date: Mon, 24 Dec 2012 21:52:22 +0100
Message-ID: <CAHO5Pa16cZeVV7_awtv8BJbSVmgJXz6d2HeqtrEoN-Yj96+e8w@mail.gmail.com>
References: <1356336807-5517-1-git-send-email-avagin@openvz.org> <1356336807-5517-3-git-send-email-avagin@openvz.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1356336807-5517-3-git-send-email-avagin-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrey Vagin <avagin-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, criu-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Serge Hallyn <serge.hallyn-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "Eric W. Biederman" <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, Al Viro <viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org>, Pavel Emelyanov <xemul-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org>, Cyrill Gorcunov <gorcunov-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

[CC+=linux-api]

On Mon, Dec 24, 2012 at 9:13 AM, Andrey Vagin <avagin-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org> wrote:
> Cc: Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Cc: Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
> Cc: Serge Hallyn <serge.hallyn-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
> Cc: Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Cc: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
> Cc: "Eric W. Biederman" <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>
> Cc: Al Viro <viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org>
> Cc: Pavel Emelyanov <xemul-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org>
> CC: Cyrill Gorcunov <gorcunov-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Andrey Vagin <avagin-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
> ---
>  include/linux/sched.h |  9 ++++++++-
>  kernel/signal.c       | 13 +++++++++----
>  2 files changed, 17 insertions(+), 5 deletions(-)
>
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index 0dd42a0..de9a4bf 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -2159,7 +2159,14 @@ extern void flush_signals(struct task_struct *);
>  extern void __flush_signals(struct task_struct *);
>  extern void ignore_signals(struct task_struct *);
>  extern void flush_signal_handlers(struct task_struct *, int force_default);
> -extern int dequeue_signal(struct task_struct *tsk, sigset_t *mask, siginfo_t *info);
> +extern int do_dequeue_signal(struct task_struct *tsk,
> +                               sigset_t *mask, siginfo_t *info, int queue);
> +
> +static inline int dequeue_signal(struct task_struct *tsk,
> +                                       sigset_t *mask, siginfo_t *info)
> +{
> +       return do_dequeue_signal(tsk, mask, info, 0);
> +}
>
>  static inline int dequeue_signal_lock(struct task_struct *tsk, sigset_t *mask, siginfo_t *info)
>  {
> diff --git a/kernel/signal.c b/kernel/signal.c
> index 0af8868..91bb76f2 100644
> --- a/kernel/signal.c
> +++ b/kernel/signal.c
> @@ -597,17 +597,22 @@ static int __dequeue_signal(struct sigpending *pending, sigset_t *mask,
>   * Dequeue a signal and return the element to the caller, which is
>   * expected to free it.
>   *
> + * @queue: dequeue from a private queue, if a value is not positive

if a value is not positive ==> if value is nonpositive

> + *        dequeue from a shared queue, if a value if not negative

if a value is not negative ==> if value is nonnegative

Thanks,

Michael



-- 
Michael Kerrisk Linux man-pages maintainer;
http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface", http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
