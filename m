From: Kamal Mostafa <kamal-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: [3.8.y.z extended stable] Patch "sched/deadline: Change sched_getparam() behaviour vs SCHED_DEADLINE" has been added to staging queue
Date: Mon, 23 Jun 2014 14:17:41 -0700
Message-ID: <1403558261-28734-1-git-send-email-kamal@canonical.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dario Faggioli <raistlin-k2GhghHVRtY@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Juri Lelli <juri.lelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kamal Mostafa <kamal-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, kernel-team-nLRlyDuq1AZFpShjVBNYrg@public.gmane.org
List-Id: linux-man@vger.kernel.org

This is a note to let you know that I have just added a patch titled

    sched/deadline: Change sched_getparam() behaviour vs SCHED_DEADLINE

to the linux-3.8.y-queue branch of the 3.8.y.z extended stable tree 
which can be found at:

 http://kernel.ubuntu.com/git?p=ubuntu/linux.git;a=shortlog;h=refs/heads/linux-3.8.y-queue

This patch is scheduled to be released in version 3.8.13.25.

If you, or anyone else, feels it should not be added to this tree, please 
reply to this email.

For more information about the 3.8.y.z tree, see
https://wiki.ubuntu.com/Kernel/Dev/ExtendedStable

Thanks.
-Kamal

------

>From 681b217f7186127edf50a39d2e2e8fdc003fbef5 Mon Sep 17 00:00:00 2001
From: Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Date: Mon, 12 May 2014 22:50:34 +0200
Subject: [PATCH 47/66] sched/deadline: Change sched_getparam() behaviour vs
 SCHED_DEADLINE

commit ce5f7f8200ca2504f6f290044393d73ca314965a upstream.

The way we read POSIX one should only call sched_getparam() when
sched_getscheduler() returns either SCHED_FIFO or SCHED_RR.

Given that we currently return sched_param::sched_priority=0 for all
others, extend the same behaviour to SCHED_DEADLINE.

Requested-by: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Acked-by: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Dario Faggioli <raistlin-k2GhghHVRtY@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Juri Lelli <juri.lelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Link: http://lkml.kernel.org/r/20140512205034.GH13467-RM5+C6weyIYnLiPH7yDmwOa11wxjtiyuLtmvbW2Dspo@public.gmane.org
Signed-off-by: Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
[ kamal: backport to 3.8-stable: context ]
Signed-off-by: Kamal Mostafa <kamal-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
---
 kernel/sched/core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 5e2f7c3..8188769 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -4039,7 +4039,7 @@ SYSCALL_DEFINE1(sched_getscheduler, pid_t, pid)
  */
 SYSCALL_DEFINE2(sched_getparam, pid_t, pid, struct sched_param __user *, param)
 {
-	struct sched_param lp;
+	struct sched_param lp = { .sched_priority = 0 };
 	struct task_struct *p;
 	int retval;

@@ -4056,7 +4056,8 @@ SYSCALL_DEFINE2(sched_getparam, pid_t, pid, struct sched_param __user *, param)
 	if (retval)
 		goto out_unlock;

-	lp.sched_priority = p->rt_priority;
+	if (task_has_rt_policy(p))
+		lp.sched_priority = p->rt_priority;
 	rcu_read_unlock();

 	/*
--
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
