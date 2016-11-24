From: tip-bot for Mike Galbraith <tipbot-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>
Subject: [tip:sched/urgent] sched/autogroup: Fix 64-bit kernel nice level
 adjustment
Date: Wed, 23 Nov 2016 22:24:48 -0800
Message-ID: <tip-83929cce95251cc77e5659bf493bd424ae0e7a67@git.kernel.org>
References: <1479897217.4306.6.camel@gmx.de>
Reply-To: torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, umgwanakikbuti-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org,
          efault-Mmb7MZpHnFY@public.gmane.org, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org,
          linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org,
          mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org,
          linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1479897217.4306.6.camel-Mmb7MZpHnFY@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tip-commits-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: efault-Mmb7MZpHnFY@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, umgwanakikbuti-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org, hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: linux-man@vger.kernel.org

Commit-ID:  83929cce95251cc77e5659bf493bd424ae0e7a67
Gitweb:     http://git.kernel.org/tip/83929cce95251cc77e5659bf493bd424ae0e7a67
Author:     Mike Galbraith <efault-Mmb7MZpHnFY@public.gmane.org>
AuthorDate: Wed, 23 Nov 2016 11:33:37 +0100
Committer:  Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
CommitDate: Thu, 24 Nov 2016 05:45:02 +0100

sched/autogroup: Fix 64-bit kernel nice level adjustment

Michael Kerrisk reported:

> Regarding the previous paragraph...  My tests indicate
> that writing *any* value to the autogroup [nice priority level]
> file causes the task group to get a lower priority.

Because autogroup didn't call the then meaningless scale_load()...

Autogroup nice level adjustment has been broken ever since load
resolution was increased for 64-bit kernels.  Use scale_load() to
scale group weight.

Michael Kerrisk tested this patch to fix the problem:

> Applied and tested against 4.9-rc6 on an Intel u7 (4 cores).
> Test setup:
>
> Terminal window 1: running 40 CPU burner jobs
> Terminal window 2: running 40 CPU burner jobs
> Terminal window 1: running  1 CPU burner job
>
> Demonstrated that:
> * Writing "0" to the autogroup file for TW1 now causes no change
>   to the rate at which the process on the terminal consume CPU.
> * Writing -20 to the autogroup file for TW1 caused those processes
>   to get the lion's share of CPU while TW2 TW3 get a tiny amount.
> * Writing -20 to the autogroup files for TW1 and TW3 allowed the
>   process on TW3 to get as much CPU as it was getting as when
>   the autogroup nice values for both terminals were 0.

Reported-by: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Tested-by: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Mike Galbraith <umgwanakikbuti-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>
Cc: Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Link: http://lkml.kernel.org/r/1479897217.4306.6.camel-Mmb7MZpHnFY@public.gmane.org
Signed-off-by: Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 kernel/sched/auto_group.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/auto_group.c b/kernel/sched/auto_group.c
index f1c8fd5..da39489 100644
--- a/kernel/sched/auto_group.c
+++ b/kernel/sched/auto_group.c
@@ -212,6 +212,7 @@ int proc_sched_autogroup_set_nice(struct task_struct *p, int nice)
 {
 	static unsigned long next = INITIAL_JIFFIES;
 	struct autogroup *ag;
+	unsigned long shares;
 	int err;
 
 	if (nice < MIN_NICE || nice > MAX_NICE)
@@ -230,9 +231,10 @@ int proc_sched_autogroup_set_nice(struct task_struct *p, int nice)
 
 	next = HZ / 10 + jiffies;
 	ag = autogroup_task_get(p);
+	shares = scale_load(sched_prio_to_weight[nice + 20]);
 
 	down_write(&ag->lock);
-	err = sched_group_set_shares(ag->tg, sched_prio_to_weight[nice + 20]);
+	err = sched_group_set_shares(ag->tg, shares);
 	if (!err)
 		ag->nice = nice;
 	up_write(&ag->lock);
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
