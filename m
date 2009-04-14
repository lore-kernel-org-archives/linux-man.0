From: Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [patch] Change uses of aio_context_t to io_context_t in the Linux Native AIO man pages
Date: Tue, 14 Apr 2009 13:51:57 -0400
Message-ID: <x49vdp7xgw2.fsf@segfault.boston.devel.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, zach.brown-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

Users of the Linux native AIO subsystem #include <libaio.h>, which
defines io_context_t, and this is the data structure that should be used
by programs.

Signed-off-by: Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Programs should use io_context_t, as defined in libaio.h.
diff --git a/man2/io_cancel.2 b/man2/io_cancel.2
index d7b56ac..5ef5a29 100644
--- a/man2/io_cancel.2
+++ b/man2/io_cancel.2
@@ -32,7 +32,7 @@ io_cancel \- cancel an outstanding asynchronous I/O operation
 .\"#include <linux/aio.h>
 .sp
 .\" .HP 16
-.BI "int io_cancel(aio_context_t " ctx_id ", struct iocb *" iocb ,
+.BI "int io_cancel(io_context_t " ctx_id ", struct iocb *" iocb ,
 .BI "              struct io_event *" result );
 .\" .ad
 .\" .hy
diff --git a/man2/io_destroy.2 b/man2/io_destroy.2
index d7e5361..19a5e25 100644
--- a/man2/io_destroy.2
+++ b/man2/io_destroy.2
@@ -31,7 +31,7 @@ io_destroy \- destroy an asynchronous I/O context
 .\" #include <linux/aio.h>
 .sp
 .\" .HP 17
-.BI "int io_destroy(aio_context_t " ctx );
+.BI "int io_destroy(io_context_t " ctx );
 .\" .ad
 .\" .hy
 .sp
diff --git a/man2/io_setup.2 b/man2/io_setup.2
index c62a81e..a4ca4e6 100644
--- a/man2/io_setup.2
+++ b/man2/io_setup.2
@@ -31,7 +31,7 @@ io_setup \- create an asynchronous I/O context
 .\" #include <linux/aio.h>
 .sp
 .\" .HP 15
-.BI "int io_setup(unsigned " nr_events ", aio_context_t *" ctxp );
+.BI "int io_setup(unsigned " nr_events ", io_context_t *" ctxp );
 .\" .ad
 .\" .hy
 .sp
diff --git a/man2/io_submit.2 b/man2/io_submit.2
index f113c51..c64dbf5 100644
--- a/man2/io_submit.2
+++ b/man2/io_submit.2
@@ -31,7 +31,7 @@ io_submit \- submit asynchronous I/O blocks for processing
 .\" #include <linux/aio.h>
 .sp
 .\" .HP 16
-.BI "int io_submit(aio_context_t " ctx_id ", long " nr \
+.BI "int io_submit(io_context_t " ctx_id ", long " nr \
 ", struct iocb **" iocbpp );
 .\" .ad
 .\" .hy
@@ -63,7 +63,7 @@ The file descriptor specified in the first \fIiocb\fP is invalid.
 One of the data structures points to invalid data.
 .TP
 .B EINVAL
-The \fIaio_context\fP specified by \fIctx_id\fP is invalid.
+The \fIio_context\fP specified by \fIctx_id\fP is invalid.
 \fInr\fP is less than 0.
 The \fIiocb\fP at *iocbpp[0] is not properly initialized,
 or the operation specified is invalid for the file descriptor
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
