From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] getmntent.3: tfix
Date: Wed, 17 Jul 2013 23:24:41 +0200
Message-ID: <1374096281-19350-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man3/getmntent.3 |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/getmntent.3 b/man3/getmntent.3
index e8ca467..29de035 100644
--- a/man3/getmntent.3
+++ b/man3/getmntent.3
@@ -66,7 +66,7 @@ _BSD_SOURCE || _SVID_SOURCE
 These routines are used to access the file system description file
 .I /etc/fstab
 and the mounted file system description file
-.IR etc/mtab .
+.IR /etc/mtab .
 .PP
 The
 .BR setmntent ()
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
