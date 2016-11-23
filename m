From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] sched/autogroup: Fix 64bit kernel nice adjustment
Date: Wed, 23 Nov 2016 14:47:21 +0100
Message-ID: <d21cf0b2-5c62-5a49-8758-58793c454cc2@gmail.com>
References: <41d802dc-873a-ff02-17ff-93ce50f3e925@gmail.com>
 <1479897217.4306.6.camel@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-2022-jp
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1479897217.4306.6.camel-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Galbraith <efault-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Mike,

On 11/23/2016 11:33 AM, Mike Galbraith wrote:
> On Tue, 2016-11-22 at 16:59 +0100, Michael Kerrisk (man-pages) wrote:
> 
>>        ┌─────────────────────────────────────────────────────┐
>>        │FIXME                                                │
>>        ├─────────────────────────────────────────────────────┤
>>        │Regarding the previous paragraph...  My tests  indi‐ │
>>        │cate  that writing *any* value to the autogroup file │
>>        │causes the task group to get a lower priority.  This │
> 
> Because autogroup didn't call the then meaningless scale_load()...

So, does that mean that this buglet kicked in starting (only) in 
Linux 4.7 with commit 2159197d66770ec01f75c93fb11dc66df81fd45b?

> Autogroup nice level adjustment has been broken ever since load
> resolution was increased for 64bit kernels.  Use scale_load() to
> scale group weight.

Tested-by: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Applied and tested against 4.9-rc6 on an Intel u7 (4 cores).
Test setup:

Terminal window 1: running 40 CPU burner jobs
Terminal window 2: running 40 CPU burner jobs
Terminal window 1: running 1 CPU burner job

Demonstrated that:
* Writing "0" to the autogroup file for TW1 now causes no change
  to the rate at which the process on the terminal consume CPU.
* Writing -20 to the autogroup file for TW1 caused those processes
  to get the lion's share of CPU while TW2 TW3 get a tiny amount.
* Writing -20 to the autogroup files for TW1 and TW3 allowed the
  process on TW3 to get as much CPU as it was getting as when
  the autogroup nice values for both terminals were 0.
   
Thanks,

Michael

> Signed-off-by: Mike Galbraith <umgwanakikbuti-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Reported-by: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
>  kernel/sched/auto_group.c |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> --- a/kernel/sched/auto_group.c
> +++ b/kernel/sched/auto_group.c
> @@ -192,6 +192,7 @@ int proc_sched_autogroup_set_nice(struct
>  {
>  	static unsigned long next = INITIAL_JIFFIES;
>  	struct autogroup *ag;
> +	unsigned long shares;
>  	int err;
>  
>  	if (nice < MIN_NICE || nice > MAX_NICE)
> @@ -210,9 +211,10 @@ int proc_sched_autogroup_set_nice(struct
>  
>  	next = HZ / 10 + jiffies;
>  	ag = autogroup_task_get(p);
> +	shares = scale_load(sched_prio_to_weight[nice + 20]);
>  
>  	down_write(&ag->lock);
> -	err = sched_group_set_shares(ag->tg, sched_prio_to_weight[nice + 20]);
> +	err = sched_group_set_shares(ag->tg, shares);
>  	if (!err)
>  		ag->nice = nice;
>  	up_write(&ag->lock);
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
