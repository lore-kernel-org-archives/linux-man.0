From: Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
Subject: aio manuals
Date: Wed, 9 Mar 2011 19:06:00 +0100
Message-ID: <20110309180600.GA14533@saboteur.suse.cz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="SLDf9lqlvOQaIe6s"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org


--SLDf9lqlvOQaIe6s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!
The io_* manuals says that we should use aio_context_t as type for aio
handle. That is wrong as the functions are defined with io_context_t
(libaio.h). Patch attached.

The only oustanding issue is that manual for io_setup says that we must
set the io_context_t to 0 before use. And as the io_context_t is defined
as opaque type (and it's defined as pointer now) the only way to
initalize it without warnigs is memset(&ctxp, 0, sizeof(ctxp));. Perhaps
this is not needed at all, as the ctpx is passed to the syscall and then
initalized in the kernel (at least I haven't seem any checks in the
codepath).

-- 
Cyril Hrubis
chrubis-AlSwsSmVLrQ@public.gmane.org

--SLDf9lqlvOQaIe6s
Content-Type: text/x-patch; charset=us-ascii
Content-Disposition: attachment; filename="io_context_t.patch"

diff --git a/man2/io_cancel.2 b/man2/io_cancel.2
index a3fc213..1e21869 100644
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
index 6a165e1..47d031a 100644
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
diff --git a/man2/io_getevents.2 b/man2/io_getevents.2
index e990f6d..a337404 100644
--- a/man2/io_getevents.2
+++ b/man2/io_getevents.2
@@ -32,7 +32,7 @@ io_getevents \- read asynchronous I/O events from the completion queue
 .\" #include <linux/aio.h>
 .sp
 .\" .HP 19
-.BI "int io_getevents(aio_context_t " ctx_id ", long " min_nr ", long " nr ,
+.BI "int io_getevents(io_context_t " ctx_id ", long " min_nr ", long " nr ,
 .BI "                 struct io_event *" events \
 ", struct timespec *" timeout );
 .\" .ad
diff --git a/man2/io_setup.2 b/man2/io_setup.2
index d9b5117..ea84cb9 100644
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
index 1eae429..3b6bbf2 100644
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

--SLDf9lqlvOQaIe6s--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
