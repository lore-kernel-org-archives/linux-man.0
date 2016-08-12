From: Vegard Nossum <vegard.nossum-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/2] pipe.2: document sysctls
Date: Fri, 12 Aug 2016 17:35:12 +0200
Message-ID: <1471016112-18025-2-git-send-email-vegard.nossum@oracle.com>
References: <1471016112-18025-1-git-send-email-vegard.nossum@oracle.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1471016112-18025-1-git-send-email-vegard.nossum-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vegard Nossum <vegard.nossum-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Willy Tarreau <w@1wt.eu>, Jens Axboe <jens.axboe-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Cc: Willy Tarreau <w@1wt.eu>
Cc: Jens Axboe <jens.axboe-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Vegard Nossum <vegard.nossum-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
---
 man2/pipe.2 | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git man2/pipe.2 man2/pipe.2
index e817ba9..ecf2f34 100644
--- man2/pipe.2
+++ man2/pipe.2
@@ -184,6 +184,35 @@ POSIX.1-2001, POSIX.1-2008.
 
 .BR pipe2 ()
 is Linux-specific.
+
+.SH FILES
+On Linux, the following files control how much memory can be used for pipes:
+.SS /proc/sys/fs/pipe-max-pages " (since Linux 2.6.34)"
+.\" commit b492e95be0ae672922f4734acf3f5d35c30be948
+Deprecated since Linux 2.6.35.
+.SS /proc/sys/fs/pipe-max-size " (since Linux 2.6.35)"
+.\" commit ff9da691c0498ff81fdd014e7a0731dab2337dac
+The maximum size (in bytes) of individual pipes created or set by users
+without the
+.B CAP_SYS_RESOURCE
+capability.
+.SS /proc/sys/fs/pipe-user-pages-hard " (since Linux 4.4)"
+.\" commit 759c01142a5d0f364a462346168a56de28a80f52
+The combined maximum size (in pages) of all pipes created or set by a
+single user without both the
+.B CAP_SYS_RESOURCE
+and
+.B CAP_SYS_ADMIN
+capabilities.
+.SS /proc/sys/fs/pipe-user-pages-soft " (since Linux 4.4)"
+.\" commit 759c01142a5d0f364a462346168a56de28a80f52
+The combined size (in pages) of all pipes created or set by a single
+user (without both the
+.B CAP_SYS_RESOURCE
+and
+.B CAP_SYS_ADMIN
+capabilities) after which individual pipes will be limited to 1 page.
+
 .SH EXAMPLE
 .\" fork.2 refers to this example program.
 The following program creates a pipe, and then
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
