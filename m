From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] getcpu(2): document return/error values
Date: Tue,  8 May 2012 18:36:07 -0400
Message-ID: <1336516567-21737-1-git-send-email-vapier@gentoo.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
---
 man2/getcpu.2 |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/man2/getcpu.2 b/man2/getcpu.2
index 03e724a..a9d0793 100644
--- a/man2/getcpu.2
+++ b/man2/getcpu.2
@@ -48,6 +48,15 @@ The caller must be prepared to handle the situation when
 and
 .I node
 are no longer the current CPU and node.
+.SH "RETURN VALUE"
+On success, 0 is returned.
+On error, \-1 is returned, and
+.I errno
+is set appropriately.
+.SH ERRORS
+.TP
+.B EFAULT
+Arguments point outside the calling process's address space.
 .SH VERSIONS
 .BR getcpu ()
 was added in kernel 2.6.19 for x86_64 and i386.
-- 
1.7.9.7

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
