From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] getenv.3, ld.so.8: ffix
Date: Thu,  8 Nov 2012 19:11:56 -0400
Message-ID: <1352416316-13010-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man3/getenv.3 |    2 +-
 man8/ld.so.8  |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/man3/getenv.3 b/man3/getenv.3
index e10b287..ffb0af9 100644
--- a/man3/getenv.3
+++ b/man3/getenv.3
@@ -126,7 +126,7 @@ is controlled by the
 flag contained in the auxiliary vector passed from the kernel to user space.
 .SH "SEE ALSO"
 .BR clearenv (3),
-.BR getauxval (3)
+.BR getauxval (3),
 .BR putenv (3),
 .BR setenv (3),
 .BR unsetenv (3),
diff --git a/man8/ld.so.8 b/man8/ld.so.8
index fb7b581..88bc76b 100644
--- a/man8/ld.so.8
+++ b/man8/ld.so.8
@@ -420,7 +420,7 @@ functionality is available for executables compiled using libc version
 ELF functionality is available since Linux 1.1.52 and libc5.
 .SH SEE ALSO
 .BR ldd (1),
-.BR getauxval (3)
+.BR getauxval (3),
 .BR rtld-audit (7),
 .BR ldconfig (8)
 .\" .SH AUTHORS
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
