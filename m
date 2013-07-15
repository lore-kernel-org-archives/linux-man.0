From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] getpwnam.3: tfix
Date: Mon, 15 Jul 2013 20:43:00 +0200
Message-ID: <1373913780-25846-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man3/getpwnam.3 |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/getpwnam.3 b/man3/getpwnam.3
index 9ee31d6..ae986a8 100644
--- a/man3/getpwnam.3
+++ b/man3/getpwnam.3
@@ -220,7 +220,7 @@ The functions
 .BR getpwnam ()
 and
 .BR getpwuid ()
-are not thread_safe.
+are not thread-safe.
 .LP
 The functions
 .BR getpwnam_r ()
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
