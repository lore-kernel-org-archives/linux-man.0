From: Mike Galbraith <efault@gmx.de>
Subject: [patch] sched/autogroup: Fix 64bit kernel nice adjustment
Date: Wed, 23 Nov 2016 11:33:37 +0100
Message-ID: <1479897217.4306.6.camel@gmx.de>
References: <41d802dc-873a-ff02-17ff-93ce50f3e925@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <41d802dc-873a-ff02-17ff-93ce50f3e925@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: Peter Zijlstra <a.p.zijlstra@chello.nl>, Ingo Molnar <mingo@kernel.org>, linux-man <linux-man@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>
List-Id: linux-man@vger.kernel.org

On Tue, 2016-11-22 at 16:59 +0100, Michael Kerrisk (man-pages) wrote:

>        ┌─────────────────────────────────────────────────────┐
>        │FIXME                                                │
>        ├─────────────────────────────────────────────────────┤
>        │Regarding the previous paragraph...  My tests  indi‐ │
>        │cate  that writing *any* value to the autogroup file │
>        │causes the task group to get a lower priority.  This │

Because autogroup didn't call the then meaningless scale_load()...


Autogroup nice level adjustment has been broken ever since load
resolution was increased for 64bit kernels.  Use scale_load() to
scale group weight.

Signed-off-by: Mike Galbraith <umgwanakikbuti@gmail.com>
Reported-by: Michael Kerrisk <mtk.manpages@gmail.com>
Cc: stable@vger.kernel.org
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
