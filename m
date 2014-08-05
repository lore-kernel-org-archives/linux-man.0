From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] stdio_ext.3: Reformat thread-safety information
Date: Tue, 5 Aug 2014 17:52:56 +0800
Message-ID: <1407232376-3331-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/stdio_ext.3 | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/man3/stdio_ext.3 b/man3/stdio_ext.3
index ef052ea..bdf6194 100644
--- a/man3/stdio_ext.3
+++ b/man3/stdio_ext.3
@@ -130,24 +130,31 @@ The
 .BR __fpurge ()
 function discards the contents of the stream's buffer.
 .SH ATTRIBUTES
-.SS Multithreading (see pthreads(7))
-The
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw28 lb lb
+l l l.
+Interface	Attribute	Value
+T{
 .BR __fbufsize (),
 .BR __fpending (),
-.BR __fpurge ()
-and
+.br
+.BR __fpurge (),
 .BR __fsetlocking ()
-functions do not lock the stream, so they are not thread-safe.
-.LP
-The
+T}	Thread safety	MT-Unsafe
+T{
 .BR __flbf (),
 .BR __freadable (),
+.br
 .BR __freading (),
 .BR __fwritable (),
-.BR __fwriting ()
-and
+.br
+.BR __fwriting (),
 .BR _flushlbf ()
-functions are thread-safe.
+T}	Thread safety	MT-Safe
+.TE
 .SH SEE ALSO
 .BR flockfile (3),
 .BR fpurge (3)
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
