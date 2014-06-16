From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] shmget.2: fix punctuation
Date: Mon, 16 Jun 2014 23:35:21 +0200
Message-ID: <1402954521-28630-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/shmget.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/shmget.2 b/man2/shmget.2
index f781048..bb8adab 100644
--- a/man2/shmget.2
+++ b/man2/shmget.2
@@ -294,7 +294,7 @@ and
 .B SHMMNI
 are not modified, this yields a limit for the
 total memory used by all shared memory segments of 8 GB:
-With a 4kB page size, this formula yields the value 2^21 (2,097,152),
+with a 4kB page size, this formula yields the value 2^21 (2,097,152);
 with 8kB page size, it yields 2^20 (1048576).
 
 On Linux, this limit can be read and modified via
-- 
2.0.0.rc2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
