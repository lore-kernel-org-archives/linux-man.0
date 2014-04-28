From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] libc.7: missing comma
Date: Tue, 29 Apr 2014 00:49:44 +0200
Message-ID: <1398725384-11703-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man7/libc.7 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man7/libc.7 b/man7/libc.7
index d8f8f0d..2bdf9ee 100644
--- a/man7/libc.7
+++ b/man7/libc.7
@@ -90,7 +90,7 @@ perhaps targeted at development for embedded Linux systems.
 Among such libraries are
 .UR http://www.uclibc.org/
 .I uClibc
-.UE
+.UE ,
 .UR http://www.fefe.de/dietlibc/
 .I dietlibc
 .UE ,
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
