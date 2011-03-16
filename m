From: Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
Subject: Re: aio manuals
Date: Wed, 16 Mar 2011 16:20:18 +0100
Message-ID: <20110316152018.GG2096@saboteur.suse.cz>
References: <20110309180600.GA14533@saboteur.suse.cz>
 <x49ei6gnpsx.fsf@segfault.boston.devel.redhat.com>
 <20110316104356.GB32095@saboteur.suse.cz>
 <x49pqpr9m5l.fsf@segfault.boston.devel.redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="3MwIy2ne0vdjdPXF"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <x49pqpr9m5l.fsf-RRHT56Q3PSP4kTEheFKJxxDDeQx5vsVwAInAS/Ez/D0@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org


--3MwIy2ne0vdjdPXF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!
> > So should we settle for memset()? I could update send updated patch
> > then.
> 
> Yeah, memset is what I typically have done.
> 

Here comes updated patch.

-- 
Cyril Hrubis
chrubis-AlSwsSmVLrQ@public.gmane.org

--3MwIy2ne0vdjdPXF
Content-Type: text/x-patch; charset=us-ascii
Content-Disposition: attachment; filename="0001-Fix-io_-manuals.patch"

>From 61ea8972c02120ed534554b134c45086243d911e Mon Sep 17 00:00:00 2001
From: Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
Date: Wed, 16 Mar 2011 16:14:19 +0100
Subject: [PATCH] Fix io_* manuals.

The manuals says that we should use aio_context_t as type for ctpx
handle. That is wrong as the functions are defined with io_context_t in
libaio.h.

Also as the io_context_t is opaque type, it should be initalized with:

memset(&ctpx, 0, sizeof(ctpx));

Signed-off-by: Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
---
 man2/io_cancel.2    |    2 +-
 man2/io_destroy.2   |    2 +-
 man2/io_getevents.2 |    2 +-
 man2/io_setup.2     |    8 ++++++--
 man2/io_submit.2    |    2 +-
 5 files changed, 10 insertions(+), 6 deletions(-)

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
index d9b5117..851b0c4 100644
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
@@ -42,8 +42,12 @@ Link with \fI\-laio\fP.
 .BR io_setup ()
 creates an asynchronous I/O context capable of receiving
 at least \fInr_events\fP.
-\fIctxp\fP must not point to an AIO context that already exists, and must
+The \fIctxp\fP must not point to an AIO context that already exists, and must
 be initialized to 0 prior to the call.
+
+Note that io_context_t is opaque type and thuss \fIctxp\fP should be zeroed
+with memset(&ctpx, 0, sizeof(ctpx)).
+
 On successful creation of the AIO context, \fI*ctxp\fP is filled in
 with the resulting handle.
 .SH "RETURN VALUE"
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
-- 
1.6.4.2


--3MwIy2ne0vdjdPXF--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
