From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 1/1] futex.2: explanation of blocking
Date: Sun, 29 Mar 2015 21:13:03 +0200
Message-ID: <1427656383-8779-1-git-send-email-xypron.glpk@gmx.de>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Use shorter sentences.

Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
---
 man2/futex.2 | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/man2/futex.2 b/man2/futex.2
index dea50ea..6a4d45c 100644
--- a/man2/futex.2
+++ b/man2/futex.2
@@ -85,14 +85,18 @@ In the uncontended case,
 a thread can access or modify the lock state with atomic instructions,
 for example atomically changing it from not acquired to acquired
 using an atomic compare-and-exchange instruction.
-If a thread cannot acquire a lock because
-it is already acquired by another thread,
-it can request to block if and only the lock is still acquired by
-using the lock's flag as futex word and expecting a value that
-represents the acquired state.
+A thread maybe unable acquire a lock because
+it is already acquired by another thread.
+It then may pass the lock's flag as futex word and the value
+representing the acquired state as expected value to a
+.BR futex ()
+wait operation.
+.BR futex ()
+will block if and only if the lock is still acquired.
 When releasing the lock, a thread has to first reset the
-lock state to not acquired and then execute the futex operation that
-wakes one thread blocked on the futex word that is the lock's flag
+lock state to not acquired and then execute a
+.BR futex ()
+operation that wakes threads blocked on the lock flag used as futex word.
 (this can be be further optimized to avoid unnecessary wake-ups).
 See
 .BR futex (7)
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
