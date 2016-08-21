From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 1/1] fanotify_init.2: update BUGS information
Date: Sun, 21 Aug 2016 12:43:08 +0200
Message-ID: <1471776188-9184-1-git-send-email-xypron.glpk@gmx.de>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Patch 0b37e097a648aa71d4db1ad108001e95b69a2da4 was included
in Linux 3.18.

Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
---
 man2/fanotify_init.2 | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/man2/fanotify_init.2 b/man2/fanotify_init.2
index 5883573..96b6aea 100644
--- a/man2/fanotify_init.2
+++ b/man2/fanotify_init.2
@@ -241,10 +241,9 @@ was introduced in version 2.6.36 of the Linux kernel and enabled in version
 .SH CONFORMING TO
 This system call is Linux-specific.
 .SH BUGS
-As of Linux 3.17,
-the following bug exists:
+The following bug was present in Linux kernels before version 3.18:
 .IP * 3
-.\" FIXME . Patch proposed: https://lkml.org/lkml/2014/9/24/967
+.\" Fixed by commit 0b37e097a648aa71d4db1ad108001e95b69a2da4
 The
 .B O_CLOEXEC
 is ignored when passed in
-- 
2.8.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
