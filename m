From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] fchmodat.2: ffix
Date: Tue,  1 May 2012 22:06:40 -0400
Message-ID: <1335924400-6720-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The intended d660ffd fix was not correct.
---
 man2/fchmodat.2 |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/fchmodat.2 b/man2/fchmodat.2
index 2086bf4..db9512f 100644
--- a/man2/fchmodat.2
+++ b/man2/fchmodat.2
@@ -29,7 +29,7 @@ fchmodat \- change permissions of a file relative to a directory \
 file descriptor
 .SH SYNOPSIS
 .nf
-.BR #include <fcntl.h> "           /* Definition of AT_* constants */"
+.BR "#include <fcntl.h>" "           /* Definition of AT_* constants */"
 .B #include <sys/stat.h>
 .sp
 .BI "int fchmodat(int " dirfd ", const char *" pathname ", mode_t " \
-- 
1.7.10

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
