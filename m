From: <gregkh@linuxfoundation.org>
Subject: Patch "sched/deadline: Change sched_getparam() behaviour vs SCHED_DEADLINE" has been added to the 3.14-stable tree
Date: Mon, 09 Jun 2014 12:14:41 -0700
Message-ID: <14023412812007@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: peterz@infradead.org, gregkh@linuxfoundation.org, juri.lelli@gmail.com, linux-man@vger.kernel.org, mingo@kernel.org, mtk.manpages@gmail.com, raistlin@linux.it, torvalds@linux-foundation.org
Cc: stable@vger.kernel.org, stable-commits@vger.kernel.org
List-Id: linux-man@vger.kernel.org


This is a note to let you know that I've just added the patch titled

    sched/deadline: Change sched_getparam() behaviour vs SCHED_DEADLINE

to the 3.14-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     sched-deadline-change-sched_getparam-behaviour-vs-sched_deadline.patch
and it can be found in the queue-3.14 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


>From ce5f7f8200ca2504f6f290044393d73ca314965a Mon Sep 17 00:00:00 2001
From: Peter Zijlstra <peterz@infradead.org>
Date: Mon, 12 May 2014 22:50:34 +0200
Subject: sched/deadline: Change sched_getparam() behaviour vs SCHED_DEADLINE

From: Peter Zijlstra <peterz@infradead.org>

commit ce5f7f8200ca2504f6f290044393d73ca314965a upstream.

The way we read POSIX one should only call sched_getparam() when
sched_getscheduler() returns either SCHED_FIFO or SCHED_RR.

Given that we currently return sched_param::sched_priority=0 for all
others, extend the same behaviour to SCHED_DEADLINE.

Requested-by: Michael Kerrisk <mtk.manpages@gmail.com>
Signed-off-by: Peter Zijlstra <peterz@infradead.org>
Acked-by: Michael Kerrisk <mtk.manpages@gmail.com>
Cc: Dario Faggioli <raistlin@linux.it>
Cc: linux-man <linux-man@vger.kernel.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: Juri Lelli <juri.lelli@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Link: http://lkml.kernel.org/r/20140512205034.GH13467@laptop.programming.kicks-ass.net
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 kernel/sched/core.c |    9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3735,7 +3735,7 @@ SYSCALL_DEFINE1(sched_getscheduler, pid_
  */
 SYSCALL_DEFINE2(sched_getparam, pid_t, pid, struct sched_param __user *, param)
 {
-	struct sched_param lp;
+	struct sched_param lp = { .sched_priority = 0 };
 	struct task_struct *p;
 	int retval;
 
@@ -3752,11 +3752,8 @@ SYSCALL_DEFINE2(sched_getparam, pid_t, p
 	if (retval)
 		goto out_unlock;
 
-	if (task_has_dl_policy(p)) {
-		retval = -EINVAL;
-		goto out_unlock;
-	}
-	lp.sched_priority = p->rt_priority;
+	if (task_has_rt_policy(p))
+		lp.sched_priority = p->rt_priority;
 	rcu_read_unlock();
 
 	/*


Patches currently in stable-queue which might be from peterz@infradead.org are

queue-3.14/sched-deadline-fix-memory-leak.patch
queue-3.14/sched-use-cpupri_nr_priorities-instead-of-max_rt_prio-in-cpupri-check.patch
queue-3.14/perf-prevent-false-warning-in-perf_swevent_add.patch
queue-3.14/sched-dl-fix-race-in-dl_task_timer.patch
queue-3.14/perf-fix-race-in-removing-an-event.patch
queue-3.14/sched-fix-hotplug-vs.-set_cpus_allowed_ptr.patch
queue-3.14/sched-deadline-restrict-user-params-max-value-to-2-63-ns.patch
queue-3.14/sched-make-sched_setattr-correctly-return-efbig.patch
queue-3.14/perf-limit-perf_event_attr-sample_period-to-63-bits.patch
queue-3.14/sched-disallow-sched_attr-sched_policy-0.patch
queue-3.14/sched-deadline-change-sched_getparam-behaviour-vs-sched_deadline.patch
queue-3.14/sched-sanitize-irq-accounting-madness.patch
