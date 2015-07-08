From: =?UTF-8?q?Ville=20Skytt=C3=A4?= <ville.skytta-X3B1VOXEql0@public.gmane.org>
Subject: [PATCH] ldconfig.8: wsfix
Date: Wed,  8 Jul 2015 10:14:58 +0300
Message-ID: <1436339698-19824-1-git-send-email-ville.skytta@iki.fi>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

---
 man8/ldconfig.8 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man8/ldconfig.8 b/man8/ldconfig.8
index 14956bd..233647e 100644
--- a/man8/ldconfig.8
+++ b/man8/ldconfig.8
@@ -131,7 +131,7 @@ instead of
 .IR /etc/ld.so.conf .
 .\" FIXME glibc 2.7 added -i
 .TP
-.BR \-i ", " \-\-ignore\-aux\-cache	
+.BR \-i ", " \-\-ignore\-aux\-cache
 (Since glibc 2.7)
 .\"             commit 27d9ffda17df4d2388687afd12897774fde39bcc
 Ignore auxiliary cache file.
-- 
2.4.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
