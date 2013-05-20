From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] stdio_ext.3: ATTRIBUTES: Note functions that are not thread-safe
Date: Mon, 20 May 2013 13:42:10 +0800
Message-ID: <1369028530-12542-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions __fbufsize(), __fpending(), __fpurge() and
__fsetlocking() are not thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/stdio_ext.3 | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/man3/stdio_ext.3 b/man3/stdio_ext.3
index fb5767a..d2578fe 100644
--- a/man3/stdio_ext.3
+++ b/man3/stdio_ext.3
@@ -129,6 +129,25 @@ output to a terminal is forced out, say before reading keyboard input.)
 The
 .BR __fpurge ()
 function discards the contents of the stream's buffer.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR __fbufsize (),
+.BR __fpending (),
+.BR __fpurge ()
+and
+.BR __fsetlocking ()
+functions do not lock the stream, so they are not thread-safe.
+.LP
+The
+.BR __flbf (),
+.BR __freadable (),
+.BR __freading (),
+.BR __fwritable (),
+.BR __fwriting ()
+and
+.BR _flushlbf ()
+functions are thread-safe.
 .SH SEE ALSO
 .BR flockfile (3),
 .BR fpurge (3)
-- 
1.8.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
