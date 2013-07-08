From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] bootparam.7: tfix
Date: Mon,  8 Jul 2013 23:46:01 +0200
Message-ID: <1373319961-7322-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man7/bootparam.7 |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man7/bootparam.7 b/man7/bootparam.7
index 18a1410..fa4c5c3 100644
--- a/man7/bootparam.7
+++ b/man7/bootparam.7
@@ -466,7 +466,7 @@ a "normal" ramdisk, which is mounted read-write as root device;
 then
 .I /linuxrc
 is executed; afterward the "real" root file system is mounted,
-and the initrd file system is moved over tocw
+and the initrd file system is moved over to
 .IR /initrd ;
 finally
 the usual boot sequence (e.g., invocation of
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
