From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] sched: Make sched_setattr() correctly return -EFBIG
Date: Wed, 14 May 2014 05:23:50 +0200
Message-ID: <5372E1C6.5070109@gmail.com>
References: <536CEAEE.4010609@gmail.com> <536CEC17.9070903@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <536CEC17.9070903-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Juri Lelli <juri.lelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dario Faggioli <raistlin-k2GhghHVRtY@public.gmane.org>, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Peter,

In the title of this patch, EFBIG should have been E2BIG. Shall
I resubmit a corrected version?

Cheers,

Michael

On 05/09/2014 04:54 PM, Michael Kerrisk (man-pages) wrote:
> From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> The documented[1] behavior of sched_attr() in your proposed man page text is:
> 
>     sched_attr::size must be set to the size of the structure, as in
>     sizeof(struct sched_attr), if the provided structure is smaller
>     than the kernel structure, any additional fields are assumed
>     '0'. If the provided structure is larger than the kernel structure,
>     the kernel verifies all additional fields are '0' if not the
>     syscall will fail with -E2BIG.
> 
> As currently implemented, sched_copy_attr() returns -EFBIG for
> for this case, but the logic in sys_sched_setattr() converts that
> error to -EFAULT. This patch fixes the behavior.
> 
> [1] http://thread.gmane.org/gmane.linux.kernel/1615615/focus=1697760
> 
> Signed-off-by: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  kernel/sched/core.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 268a45e..6c9ce28 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -3650,8 +3650,9 @@ SYSCALL_DEFINE3(sched_setattr, pid_t, pid, struct sched_attr __user *, uattr,
>  	if (!uattr || pid < 0 || flags)
>  		return -EINVAL;
>  
> -	if (sched_copy_attr(uattr, &attr))
> -		return -EFAULT;
> +	retval = sched_copy_attr(uattr, &attr);
> +	if (retval)
> +		return retval;
>  
>  	rcu_read_lock();
>  	retval = -ESRCH;
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
