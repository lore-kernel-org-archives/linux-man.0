From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 1/1] fanotify_init(2): BUG O_CLOEXEC ignored
Date: Sat, 27 Sep 2014 11:17:01 +0200
Message-ID: <1411809421-5012-1-git-send-email-xypron.glpk@gmx.de>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The bug section should describe that O_CLOEXEC is ignored.
A patch is pending.

Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
---
 man2/fanotify_init.2 | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/man2/fanotify_init.2 b/man2/fanotify_init.2
index 8539325..9d42fa5 100644
--- a/man2/fanotify_init.2
+++ b/man2/fanotify_init.2
@@ -237,10 +237,18 @@ was introduced in version 2.6.36 of the Linux kernel and enabled in version
 .SH "CONFORMING TO"
 This system call is Linux-specific.
 .SH BUGS
-As of Linux 3.15,
+As of Linux 3.17,
+the following bug exists:
+.IP * 3
+.\" FIXME . Patch proposed: https://lkml.org/lkml/2014/9/24/967
+.B O_CLOEXEC
+passed in
+.I event_f_flags
+is ignored.
+.PP
+Up to Linux 3.15,
 the following bug exists:
 .IP * 3
-.\" FIXME . Patch accepted to mm tree.
 The
 .I event_f_flags
 argument is not checked for invalid flags.
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
