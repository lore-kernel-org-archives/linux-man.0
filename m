From: <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Patch "sched/autogroup: Fix 64-bit kernel nice level adjustment" has been added to the 4.8-stable tree
Date: Mon, 12 Dec 2016 14:47:24 -0800
Message-ID: <148158284417581@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: efault-Mmb7MZpHnFY@public.gmane.org, a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, umgwanakikbuti-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stable-commits-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


This is a note to let you know that I've just added the patch titled

    sched/autogroup: Fix 64-bit kernel nice level adjustment

to the 4.8-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     sched-autogroup-fix-64-bit-kernel-nice-level-adjustment.patch
and it can be found in the queue-4.8 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> know about it.


>From 83929cce95251cc77e5659bf493bd424ae0e7a67 Mon Sep 17 00:00:00 2001
From: Mike Galbraith <efault-Mmb7MZpHnFY@public.gmane.org>
Date: Wed, 23 Nov 2016 11:33:37 +0100
Subject: sched/autogroup: Fix 64-bit kernel nice level adjustment

From: Mike Galbraith <efault-Mmb7MZpHnFY@public.gmane.org>

commit 83929cce95251cc77e5659bf493bd424ae0e7a67 upstream.

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
Link: http://lkml.kernel.org/r/1479897217.4306.6.camel-Mmb7MZpHnFY@public.gmane.org
Signed-off-by: Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>

---
 kernel/sched/auto_group.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

--- a/kernel/sched/auto_group.c
+++ b/kernel/sched/auto_group.c
@@ -192,6 +192,7 @@ int proc_sched_autogroup_set_nice(struct
 {
 	static unsigned long next = INITIAL_JIFFIES;
 	struct autogroup *ag;
+	unsigned long shares;
 	int err;
 
 	if (nice < MIN_NICE || nice > MAX_NICE)
@@ -210,9 +211,10 @@ int proc_sched_autogroup_set_nice(struct
 
 	next = HZ / 10 + jiffies;
 	ag = autogroup_task_get(p);
+	shares = scale_load(sched_prio_to_weight[nice + 20]);
 
 	down_write(&ag->lock);
-	err = sched_group_set_shares(ag->tg, sched_prio_to_weight[nice + 20]);
+	err = sched_group_set_shares(ag->tg, shares);
 	if (!err)
 		ag->nice = nice;
 	up_write(&ag->lock);


Patches currently in stable-queue which might be from efault-Mmb7MZpHnFY@public.gmane.org are

queue-4.8/sched-autogroup-fix-64-bit-kernel-nice-level-adjustment.patch
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
