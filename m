From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 4.8 13/33] sched/autogroup: Fix 64-bit kernel nice level adjustment
Date: Tue, 13 Dec 2016 09:16:14 -0800
Message-ID: <20161213171534.730737756@linuxfoundation.org>
References: <20161213171534.171564506@linuxfoundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161213171534.171564506@linuxfoundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, Michael Kerrisk <mtk.manpages@gmail.com>, Mike Galbraith <umgwanakikbuti@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, linux-man <linux-man@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>
List-Id: linux-man@vger.kernel.org

4.8-stable review patch.  If anyone has any objections, please let me know.

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
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

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
