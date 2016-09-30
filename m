From: Waiman Long <Waiman.Long-ZPxbGqLxI0U@public.gmane.org>
Subject: [PATCH 1/2] futex.2: Add description about the FUTEX_LOCK/FUTEX_UNLOCK operations
Date: Fri, 30 Sep 2016 17:27:43 -0400
Message-ID: <1475270864-51787-2-git-send-email-Waiman.Long@hpe.com>
References: <1475270864-51787-1-git-send-email-Waiman.Long@hpe.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1475270864-51787-1-git-send-email-Waiman.Long-ZPxbGqLxI0U@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Davidlohr Bueso <dave-h16yJtLeMjHk1uMJSBkQmQ@public.gmane.org>, Mike Galbraith <umgwanakikbuti-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Low <jason.low2-ZPxbGqLxI0U@public.gmane.org>, Scott J Norton <scott.norton-ZPxbGqLxI0U@public.gmane.org>, Douglas Hatch <doug.hatch-ZPxbGqLxI0U@public.gmane.org>, Waiman Long <Waiman.Long-ZPxbGqLxI0U@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The FUTEX_LOCK and FUTEX_UNLOCK operation pair is for supporting the
new throughput-optimized futexes. The futex(2) manpage is extended
to include description about the operations.

Signed-off-by: Waiman Long <Waiman.Long-ZPxbGqLxI0U@public.gmane.org>
---
 man2/futex.2 |   49 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 49 insertions(+), 0 deletions(-)

diff --git a/man2/futex.2 b/man2/futex.2
index 5b0083e..6cf67cc 100644
--- a/man2/futex.2
+++ b/man2/futex.2
@@ -816,6 +816,55 @@ arguments are ignored.
 .\"
 .\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 .\"
+.TP
+.BR FUTEX_LOCK " (since Linux 4.X)"
+This operation is used for the locking part of contended userspace mutexes.
+The waiter will attempt to steal the lock once at the beginning of the system
+call. If it can't get the lock, it will be put into the waiting queue of
+a seralization kernel mutex. Once it becomes the owner of the mutex,
+it will spin on the futex owner while it is running until the owner releases
+the futex. The spinning is done without sleeping as long as the futex owner
+is running and the waiter hasn't run out its scheduling time slice.
+The same is true for those waiting within the serialization mutex.
+As a result, the unlock-to-lock latency is reduced leading to faster
+performance.
+
+As long as the serialization mutex owner is running, it won't cause
+the futex owner to release the futex by using the
+.BR FUTEX_UNLOCK
+operation. So more lock stealings can go on in userspace leading to
+better performance. When the mutex owner is sleeping, the futex owner will
+have to call into the kernel to wake up the mutex owner and release the futex.
+
+One consequence of this design is lock starvation as the kernel waiter has
+no guarantee that it will ever get the lock. This is counteracted by a
+lock hand-off mechanism where the futex owner is forced to call into
+the kernel to explicitly transfer the lock ownership to the mutex owner
+when the latter has waited too long without getting the futex.
+
+The
+.IR val ,
+.I uaddr2
+and
+.I val3
+arguments are ignored.
+.\"
+.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
+.\"
+.TP
+.BR FUTEX_UNLOCK " (since Linux 4.X)"
+This operation is used for the unlocking part of contended userspace mutexes.
+This call is only needed when the serialization mutex owner is sleeping
+or lock hand-off is activated. In this case, the sleeping waiter is woken
+up and the futex is either released or its ownership transferred to the
+mutex owner.
+
+All the arugments except
+.I uaddr
+are ignored.
+.\"
+.\""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
+.\"
 .SS Priority-inheritance futexes
 Linux supports priority-inheritance (PI) futexes in order to handle
 priority-inversion problems that can be encountered with
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
