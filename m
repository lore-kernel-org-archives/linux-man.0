From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: [PATCH 1/3] sched: Make sched_setattr() correctly return -EFBIG
Date: Fri, 09 May 2014 16:54:15 +0200
Message-ID: <536CEC17.9070903@gmail.com>
References: <536CEAEE.4010609@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <536CEAEE.4010609@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Zijlstra <peterz@infradead.org>
Cc: mtk.manpages@gmail.com, lkml <linux-kernel@vger.kernel.org>, Juri Lelli <juri.lelli@gmail.com>, Dario Faggioli <raistlin@linux.it>, Ingo Molnar <mingo@kernel.org>, "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

From: Michael Kerrisk <mtk.manpages@gmail.com>

The documented[1] behavior of sched_attr() in your proposed man page text is:

    sched_attr::size must be set to the size of the structure, as in
    sizeof(struct sched_attr), if the provided structure is smaller
    than the kernel structure, any additional fields are assumed
    '0'. If the provided structure is larger than the kernel structure,
    the kernel verifies all additional fields are '0' if not the
    syscall will fail with -E2BIG.

As currently implemented, sched_copy_attr() returns -EFBIG for
for this case, but the logic in sys_sched_setattr() converts that
error to -EFAULT. This patch fixes the behavior.

[1] http://thread.gmane.org/gmane.linux.kernel/1615615/focus=1697760

Signed-off-by: Michael Kerrisk <mtk.manpages@gmail.com>
---
 kernel/sched/core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 268a45e..6c9ce28 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3650,8 +3650,9 @@ SYSCALL_DEFINE3(sched_setattr, pid_t, pid, struct sched_attr __user *, uattr,
 	if (!uattr || pid < 0 || flags)
 		return -EINVAL;
 
-	if (sched_copy_attr(uattr, &attr))
-		return -EFAULT;
+	retval = sched_copy_attr(uattr, &attr);
+	if (retval)
+		return retval;
 
 	rcu_read_lock();
 	retval = -ESRCH;
-- 
1.9.0
