From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] scandir(3): add ENOENT/ENOTDIR errors
Date: Thu,  1 Sep 2011 11:07:07 -0400
Message-ID: <1314889627-26260-1-git-send-email-vapier@gentoo.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
---
 man3/scandir.3 |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/man3/scandir.3 b/man3/scandir.3
index 8ea5fec..46eaa73 100644
--- a/man3/scandir.3
+++ b/man3/scandir.3
@@ -102,8 +102,14 @@ or greater than zero if the first argument is considered to be
 respectively less than, equal to, or greater than the second.
 .SH ERRORS
 .TP
+.B ENOENT
+The path in \fIdirp\fR does not exist.
+.TP
 .B ENOMEM
 Insufficient memory to complete the operation.
+.TP
+.B ENOTDIR
+The path in \fIdirp\fR is not a directory.
 .SH VERSIONS
 .BR versionsort ()
 was added to glibc in version 2.1.
-- 
1.7.6

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
