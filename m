From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 1/1] futex.2: tfix
Date: Mon, 13 Apr 2015 19:49:45 +0200
Message-ID: <1428947385-32126-1-git-send-email-xypron.glpk@gmx.de>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
---
 man2/futex.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/futex.2 b/man2/futex.2
index 9bfd934..baf356d 100644
--- a/man2/futex.2
+++ b/man2/futex.2
@@ -93,7 +93,7 @@ The call to
 will block if and only if the lock is still acquired.
 When releasing the lock, a thread has to first reset the
 lock state to not acquired and then execute a futex
-operation that wakes threads blocked on the lock flag used as futex word.
+operation that wakes threads blocked on the lock flag used as futex word
 (this can be be further optimized to avoid unnecessary wake-ups).
 See
 .BR futex (7)
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
