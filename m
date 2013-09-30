From: Andreas Johansson <andjo-5UnqSh4Icw/LoDKTGw+V6w@public.gmane.org>
Subject: [PATCH] crypt.3: Describe additional errno values
Date: Mon, 30 Sep 2013 22:36:40 +0200
Message-ID: <5249E0D8.20207@nsc.liu.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Glibc 2.17 introduced two additional errno values that can be set by
crypt() and crypt_r(), EINVAL and EPERM.

Signed-off-by: Andreas Johansson <andjo-5UnqSh4Icw/LoDKTGw+V6w@public.gmane.org>
---
 man3/crypt.3 | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/man3/crypt.3 b/man3/crypt.3
index c3bad3e..8035d7c 100644
--- a/man3/crypt.3
+++ b/man3/crypt.3
@@ -122,10 +122,17 @@ On success, a pointer to the encrypted password is returned.
 On error, NULL is returned.
 .SH ERRORS
 .TP
+.B EINVAL
+The string used for the salt is not valid for the encryption method.
+.TP
 .B ENOSYS
 The
 .BR crypt ()
 function was not implemented, probably because of U.S.A. export restrictions.
+.TP
+.B EPERM
+The encryption algorithm specified is not allowed by the FIPS
+standard.
 .\" This level of detail is not necessary in this man page. . .
 .\" .PP
 .\" When encrypting a plain text P using DES with the key K results in the
-- 
1.8.4.rc3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
