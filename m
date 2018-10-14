From: Ben Hutchings <ben@decadent.org.uk>
Subject: [PATCH 3.16 262/366] sched/autogroup: Fix 64-bit kernel nice
 level adjustment
Date: Sun, 14 Oct 2018 16:25:41 +0100
Message-ID: <lsq.1539530741.563310568@decadent.org.uk>
References: <lsq.1539530740.755408431@decadent.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <lsq.1539530740.755408431@decadent.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: akpm@linux-foundation.org, Mike Galbraith <efault@gmx.de>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Linus Torvalds <torvalds@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>, linux-man <linux-man@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, Mike Galbraith <umgwanakikbuti@gmail.com>, Michael Kerrisk <mtk.manpages@gmail.com>
List-Id: linux-man@vger.kernel.org

3.16.60-rc1 review patch.  If anyone has any objections, please let me know.

------------------

From: Mike Galbraith <efault@gmx.de>

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

Reported-by: Michael Kerrisk <mtk.manpages@gmail.com>
Tested-by: Michael Kerrisk <mtk.manpages@gmail.com>
Signed-off-by: Mike Galbraith <umgwanakikbuti@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Peter Zijlstra <a.p.zijlstra@chello.nl>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-man <linux-man@vger.kernel.org>
Link: http://lkml.kernel.org/r/1479897217.4306.6.camel@gmx.de
Signed-off-by: Ingo Molnar <mingo@kernel.org>
[bwh: Backported to 3.16: s/sched_prio_to_weight/prio_to_weight/]
Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
 kernel/sched/auto_group.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

--- a/kernel/sched/auto_group.c
+++ b/kernel/sched/auto_group.c
@@ -197,6 +197,7 @@ int proc_sched_autogroup_set_nice(struct
 {
 	static unsigned long next = INITIAL_JIFFIES;
 	struct autogroup *ag;
+	unsigned long shares;
 	int err;
 
 	if (nice < MIN_NICE || nice > MAX_NICE)
@@ -215,9 +216,10 @@ int proc_sched_autogroup_set_nice(struct
 
 	next = HZ / 10 + jiffies;
 	ag = autogroup_task_get(p);
+	shares = scale_load(prio_to_weight[nice + 20]);
 
 	down_write(&ag->lock);
-	err = sched_group_set_shares(ag->tg, prio_to_weight[nice + 20]);
+	err = sched_group_set_shares(ag->tg, shares);
 	if (!err)
 		ag->nice = nice;
 	up_write(&ag->lock);
