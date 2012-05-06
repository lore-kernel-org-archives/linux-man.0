From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] endian.3: tfix
Date: Sun,  6 May 2012 12:47:20 -0400
Message-ID: <1336322840-14233-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man3/endian.3 |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/endian.3 b/man3/endian.3
index e654a5a..ecd0ff6 100644
--- a/man3/endian.3
+++ b/man3/endian.3
@@ -70,7 +70,7 @@ from big-endian order to host byte order.
 The functions with names of the form "le\fInn\fPtoh" convert
 from little-endian order to host byte order.
 .SH VERSIONS
-These function were added to glibc in version 2.9.
+These functions were added to glibc in version 2.9.
 .SH "CONFORMING TO"
 These functions are nonstandard.
 Similar functions are present on the BSDs,
-- 
1.7.10

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
