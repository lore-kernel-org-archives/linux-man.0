From: Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
Subject: [PATCH] libaio: man: Remove the syscalls man pages.
Date: Mon, 25 Mar 2013 16:38:17 +0100
Message-ID: <20130325153816.GA3963@rei.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Remove the kernel syscalls man pages.

These are unfinished, wrongly categorized and correct ones are provided
by the man-pages project.

Signed-off-by: Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
---
 man/io_cancel.1    |   21 ----------
 man/io_destroy.1   |   17 --------
 man/io_getevents.1 |   29 --------------
 man/io_setup.1     |   15 -------
 man/io_submit.1    |  109 ----------------------------------------------------
 5 files changed, 0 insertions(+), 191 deletions(-)
 delete mode 100644 man/io_cancel.1
 delete mode 100644 man/io_destroy.1
 delete mode 100644 man/io_getevents.1
 delete mode 100644 man/io_setup.1
 delete mode 100644 man/io_submit.1

diff --git a/man/io_cancel.1 b/man/io_cancel.1
deleted file mode 100644
index 16e898a..0000000
--- a/man/io_cancel.1
+++ /dev/null
@@ -1,21 +0,0 @@
-.\"/* sys_io_cancel:
-.\" *      Attempts to cancel an iocb previously passed to io_submit.  If
-.\" *      the operation is successfully cancelled, the resulting event is
-.\" *      copied into the memory pointed to by result without being placed
-.\" *      into the completion queue and 0 is returned.  May fail with
-.\" *      -EFAULT if any of the data structures pointed to are invalid.
-.\" *      May fail with -EINVAL if aio_context specified by ctx_id is
-.\" *      invalid.  May fail with -EAGAIN if the iocb specified was not
-.\" *      cancelled.  Will fail with -ENOSYS if not implemented.
-.\" */
-.\"
-.TH io_cancel 2 2002-09-03 "Linux 2.4" "Linux AIO"
-.SH NAME
-io_cancel \- cancel io requests
-.SH SYNOPSIS
-.B #include <errno.h>
-.br
-.B #include <libaio.h>
-.LP
-.BI "int io_submit(io_context_t " ctx ", struct iocb *" iocb ", struct io_event *" result ");"
-
diff --git a/man/io_destroy.1 b/man/io_destroy.1
deleted file mode 100644
index 177683b..0000000
--- a/man/io_destroy.1
+++ /dev/null
@@ -1,17 +0,0 @@
-.\"/* sys_io_destroy:
-.\" *      Destroy the aio_context specified.  May cancel any outstanding 
-.\" *      AIOs and block on completion.  Will fail with -ENOSYS if not
-.\" *      implemented.  May fail with -EFAULT if the context pointed to
-.\" *      is invalid.
-.\" */
-.\" libaio provides this as io_queue_release.
-.TH io_destroy 2 2002-09-03 "Linux 2.4" "Linux AIO"
-.SH NAME
-io_destroy \- destroy an io context
-.SH SYNOPSIS
-.B #include <errno.h>
-.br
-.B #include <libaio.h>
-.LP
-.BI "int io_destroy(io_context_t " ctx ");"
-
diff --git a/man/io_getevents.1 b/man/io_getevents.1
deleted file mode 100644
index 27730b9..0000000
--- a/man/io_getevents.1
+++ /dev/null
@@ -1,29 +0,0 @@
-./"/* io_getevents:
-./" *      Attempts to read at least min_nr events and up to nr events from
-./" *      the completion queue for the aio_context specified by ctx_id.  May
-./" *      fail with -EINVAL if ctx_id is invalid, if min_nr is out of range,
-./" *      if nr is out of range, if when is out of range.  May fail with
-./" *      -EFAULT if any of the memory specified to is invalid.  May return
-./" *      0 or < min_nr if no events are available and the timeout specified
-./" *      by when has elapsed, where when == NULL specifies an infinite
-./" *      timeout.  Note that the timeout pointed to by when is relative and
-./" *      will be updated if not NULL and the operation blocks.  Will fail
-./" *      with -ENOSYS if not implemented.
-./" */
-./"asmlinkage long sys_io_getevents(io_context_t ctx_id,
-./"                                 long min_nr,
-./"                                 long nr,
-./"                                 struct io_event *events,
-./"                                 struct timespec *timeout)
-./"
-.TH io_getevents 2 2002-09-03 "Linux 2.4" "Linux AIO"
-.SH NAME
-io_getevents \- read resulting events from io requests
-.SH SYNOPSIS
-.B #include <errno.h>
-.br
-.B #include <libaio.h>
-.sp
-.BI "int io_getevents(io_context_t " ctx ", long " min_nr ", long " nr ", struct io_events *" events "[], struct timespec *" timeout ");"
-
-
diff --git a/man/io_setup.1 b/man/io_setup.1
deleted file mode 100644
index 68690e1..0000000
--- a/man/io_setup.1
+++ /dev/null
@@ -1,15 +0,0 @@
-./"/* sys_io_setup:
-./" *      Create an aio_context capable of receiving at least nr_events.
-./" *      ctxp must not point to an aio_context that already exists, and
-./" *      must be initialized to 0 prior to the call.  On successful
-./" *      creation of the aio_context, *ctxp is filled in with the resulting 
-./" *      handle.  May fail with -EINVAL if *ctxp is not initialized,
-./" *      if the specified nr_events exceeds internal limits.  May fail 
-./" *      with -EAGAIN if the specified nr_events exceeds the user's limit 
-./" *      of available events.  May fail with -ENOMEM if insufficient kernel
-./" *      resources are available.  May fail with -EFAULT if an invalid
-./" *      pointer is passed for ctxp.  Will fail with -ENOSYS if not
-./" *      implemented.
-./" */
-./" -- note: libaio is actually providing io_queue_init and io_queue_grow
-./" as separate functions.  For now io_setup is the same as io_queue_grow.
diff --git a/man/io_submit.1 b/man/io_submit.1
deleted file mode 100644
index f66e80f..0000000
--- a/man/io_submit.1
+++ /dev/null
@@ -1,109 +0,0 @@
-.TH io_submit 2 2002-09-02 "Linux 2.4" "Linux AIO"
-.SH NAME
-io_submit \- submit io requests
-.SH SYNOPSIS
-.B #include <errno.h>
-.br
-.B #include <libaio.h>
-.LP
-.BI "int io_submit(io_context_t " ctx ", long " nr ", struct iocb *" iocbs "[]);"
-.SH DESCRIPTION
-.B io_submit
-submits to the io_context
-.I ctx
-up to
-.I nr
-I/O requests pointed to by the vector
-.IR iocbs .
-
-The
-.B iocb
-structure is defined as something like
-.sp
-.RS
-.nf
-struct iocb {
-    void    *data;
-.\"    unsigned    key;
-    short    aio_lio_opcode;
-    short    aio_reqprio;
-    int      aio_fildes;
-};
-.fi
-.RE
-.sp
-.I data
-is a an opaque pointer which will upon completion be returned in the
-.B io_event
-structure by
-.BR io_getevents (2).
-.\" and io_wait(2)
-Callers will typically use this to point directly or indirectly to a
-callback function.
-.sp
-.I aio_lio_opcode
-is the I/O operation requested.  Callers will typically set this and the
-arguments to the I/O operation calling the
-.BR io_prep_ (3)
-function corresponding to the operation.
-.sp
-.I aio_reqprio
-is the priority of the request.  Higher values have more priority; the
-normal priority is 0.
-.sp
-.I aio_fildes
-is the file descriptor for the I/O operation.
-Callers will typically set this and the
-arguments to the I/O operation calling the
-.BR io_prep_ *(3)
-function corresponding to the operation.
-.sp
-The caller may not modify the contents or resubmit a submitted
-.B iocb
-structure until after the operation completes or is canceled.
-The implementation of
-.BR io_submit (2)
-is permitted to modify reserved fields of the
-.B iocb
-structure.
-.SH "RETURN VALUES"
-If able to submit at least one iocb,
-.B io_submit
-returns the number of iocbs submitted successfully.  Otherwise, 
-.RI - error
-is returned, where 
-.I error
-is one of the Exxx values defined in the Errors section.
-.SH ERRORS
-.TP
-.B EFAULT
-.I iocbs
-referenced data outside of the program's accessible address space.
-.TP
-.B EINVAL
-.I nr
-is negative,
-.I ctx
-refers to an uninitialized aio context, the iocb pointed to by 
-.IR iocbs [0]
-is improperly initialized or specifies an unsupported operation.
-.TP
-.B EBADF
-The iocb pointed to by
-.IR iocbs [0]
-contains a file descriptor that does not exist.
-.TP
-.B EAGAIN
-Insufficient resources were available to queue any operations.
-.SH "SEE ALSO"
-.BR io_setup (2),
-.BR io_destroy (2),
-.BR io_getevents (2),
-.\".BR io_wait (2),
-.BR io_prep_pread (3),
-.BR io_prep_pwrite (3),
-.BR io_prep_fsync (3),
-.BR io_prep_fdsync (3),
-.BR io_prep_noop (3),
-.BR io_cancel (2),
-.BR errno (3)
-- 
1.7.8.6


-- 
Cyril Hrubis
chrubis-AlSwsSmVLrQ@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
