From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] bootparam: ffix
Date: Mon,  8 Jul 2013 23:41:47 +0200
Message-ID: <1373319707-6413-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man7/bootparam.7 |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man7/bootparam.7 b/man7/bootparam.7
index 1c5bfe6..18a1410 100644
--- a/man7/bootparam.7
+++ b/man7/bootparam.7
@@ -324,7 +324,7 @@ This panic timeout can also be set by
 
 .in +4n
 .nf
-echo N > /proc/sys/kernel/panic".
+echo N > /proc/sys/kernel/panic
 .fi
 .in
 .TP
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
