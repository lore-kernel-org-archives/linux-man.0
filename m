From: "Carlos O'Donell" <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [patch 2/7] fclose.3: wfix
Date: Thu, 15 Jan 2015 22:18:18 -0500
Message-ID: <54B882FA.9070500@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Harmonize all the manual pages to use "stream" for FILE*
instead of randomly using "fp" or "stream." Choosing something
and being consistent helps users scan the man pages quickly
and understand what they are looking at.

Patch against master.

diff --git a/man3/fclose.3 b/man3/fclose.3
index 28c0d00..b07d444 100644
--- a/man3/fclose.3
+++ b/man3/fclose.3
@@ -47,12 +47,12 @@ fclose \- close a stream
 .SH SYNOPSIS
 .B #include <stdio.h>
 .sp
-.BI "int fclose(FILE *" fp );
+.BI "int fclose(FILE *" stream );
 .SH DESCRIPTION
 The
 .BR fclose ()
 function flushes the stream pointed to by
-.I fp
+.I stream
 (writing any buffered output data using
 .BR fflush (3))
 and closes the underlying file descriptor.
@@ -71,12 +71,12 @@ to the stream results in undefined behavior.
 .TP
 .B EBADF
 The file descriptor underlying
-.I fp
+.I stream
 is not valid.
 .\"  This error cannot occur unless you are mixing ANSI C stdio operations and
 .\"  low-level file operations on the same stream. If you do get this error,
 .\"  you must have closed the stream's low-level file descriptor using
-.\"  something like close(fileno(fp)).
+.\"  something like close(fileno(stream)).
 .PP
 The
 .BR fclose ()
---

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
