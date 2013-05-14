From: chrubis-AlSwsSmVLrQ@public.gmane.org
Subject: Re: [PATCH] man: Add io_setup.3 and io_destroy.3
Date: Tue, 14 May 2013 18:04:30 +0200
Message-ID: <20130514160430.GC14418@rei.suse.cz>
References: <20130328105243.GA6202@rei.suse.cz>
 <x49li9022jm.fsf@segfault.boston.devel.redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="MGYHOYXEY6WxJCY8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <x49li9022jm.fsf-RRHT56Q3PSP4kTEheFKJxxDDeQx5vsVwAInAS/Ez/D0@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--MGYHOYXEY6WxJCY8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!
> > This is a second version that includes
> > fixes proposed by Michael Kerrisk.
> 
> Now that I see what this looks like, I think it's rather confusing to
> have the user reference both the .2 and .3 pages to write code for
> libaio.  I'd prefer to keep all of the text for how to use the library
> inside the .3 man pages.

Attached is a new version of the patch that adds io_setup and io_destroy
man pages.

The change agains previous version is that the functinonality of the
wrappper is described right in the manual page.

-- 
Cyril Hrubis
chrubis-AlSwsSmVLrQ@public.gmane.org

--MGYHOYXEY6WxJCY8
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: inline; filename="0001-man-Add-io_setup.3-and-io_destroy.3.patch"

>From b1211ceb3e774075b9abedef15434bd91cdc8fe4 Mon Sep 17 00:00:00 2001
From: Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
Date: Tue, 26 Mar 2013 18:00:31 +0100
Subject: [PATCH] man: Add io_setup.3 and io_destroy.3

Signed-off-by: Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
---
 man/io_destroy.3 |   46 ++++++++++++++++++++++++++++++++++++++++++++++
 man/io_setup.3   |   50 ++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 96 insertions(+), 0 deletions(-)
 create mode 100644 man/io_destroy.3
 create mode 100644 man/io_setup.3

diff --git a/man/io_destroy.3 b/man/io_destroy.3
new file mode 100644
index 0000000..10f0e85
--- /dev/null
+++ b/man/io_destroy.3
@@ -0,0 +1,46 @@
+.\" Copyright (C) 2013 Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
+.\"
+.\" This file is distributed according to the GNU General Public License.
+.\"
+.TH IO_DESTROY 3 2013-03-26 "Linux" "Linux AIO"
+.SH NAME
+io_destroy \- destroy an asynchronous I/O context
+.SH SYNOPSIS
+.nf
+.B #include <libaio.h>
+
+.BI "int io_destroy(io_context_t ctx)"
+.sp
+Link with \fI\-laio\fP.
+.fi
+.SH DESCRIPTION
+This is a wrapper for the
+.BR io_destroy (2)
+system call.
+.PP
+See
+.BR io_queue_release (3)
+for the
+.I libaio
+high-level interface.
+
+The \fBio_destroy\fP() will attempt to cancel all outstanding asynchronous I/O
+operations previously submitted to \fIctx\fP. It will block on completion of
+operations that could not be canceled. Upon sucessfull return the I/O context
+\fIctx\fP is destroyed.
+.SH RETURN VALUE
+On success,
+.BR io_setup ()
+returns 0. On failure, a negative error number is returned.
+.SH NOTES
+Note that the Linux system call uses a different type
+.RI ( "aio_context_t\ *" )
+for the
+.I ctx
+argument.
+.SH SEE ALSO
+.BR io_cancel (3)
+.BR io_getevents (3)
+.BR io_queue_release (3)
+.BR io_setup (3)
+.BR io_submit (3)
diff --git a/man/io_setup.3 b/man/io_setup.3
new file mode 100644
index 0000000..4b3704e
--- /dev/null
+++ b/man/io_setup.3
@@ -0,0 +1,50 @@
+.\" Copyright (C) 2013 Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
+.\"
+.\" This file is distributed according to the GNU General Public License.
+.\"
+.TH IO_SETUP 3 2013-03-26 "Linux" "Linux AIO"
+.SH NAME
+io_setup \- create an asynchronous I/O context
+.SH SYNOPSIS
+.nf
+.B #include <libaio.h>
+
+.BI "int io_setup(int maxevents, io_context_t *ctx)"
+.sp
+Link with \fI\-laio\fP.
+.fi
+.SH DESCRIPTION
+This is a wrapper for the
+.BR io_setup (2)
+system call.
+.PP
+See
+.BR io_queue_init (3)
+for the
+.I libaio
+high-level interface.
+
+The
+.BR io_setup ()
+creates an asynchronous I/O context suitable for concurrently processing
+\fImaxevents\fP operations.
+The \fIctx\fP must not point to allready existing I/O context and must be
+initialized to 0 prior to the call.
+
+On successful initialization the \fIctx\fP is filled with a handle.
+.SH RETURN VALUE
+On success,
+.BR io_setup ()
+returns 0. On failure, a negative error number is returned.
+.SH NOTES
+Note that the Linux system call uses a different type
+.RI ( "aio_context_t\ *" )
+for the
+.I ctx
+argument.
+.SH SEE ALSO
+.BR io_cancel (3)
+.BR io_destroy (3)
+.BR io_getevents (3)
+.BR io_queue_init (3)
+.BR io_submit (3)
-- 
1.7.8.6


--MGYHOYXEY6WxJCY8
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0001-man-Add-io_setup.3-and-io_destroy.3.patch"

>From b1211ceb3e774075b9abedef15434bd91cdc8fe4 Mon Sep 17 00:00:00 2001
From: Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
Date: Tue, 26 Mar 2013 18:00:31 +0100
Subject: [PATCH] man: Add io_setup.3 and io_destroy.3

Signed-off-by: Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
---
 man/io_destroy.3 |   46 ++++++++++++++++++++++++++++++++++++++++++++++
 man/io_setup.3   |   50 ++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 96 insertions(+), 0 deletions(-)
 create mode 100644 man/io_destroy.3
 create mode 100644 man/io_setup.3

diff --git a/man/io_destroy.3 b/man/io_destroy.3
new file mode 100644
index 0000000..10f0e85
--- /dev/null
+++ b/man/io_destroy.3
@@ -0,0 +1,46 @@
+.\" Copyright (C) 2013 Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
+.\"
+.\" This file is distributed according to the GNU General Public License.
+.\"
+.TH IO_DESTROY 3 2013-03-26 "Linux" "Linux AIO"
+.SH NAME
+io_destroy \- destroy an asynchronous I/O context
+.SH SYNOPSIS
+.nf
+.B #include <libaio.h>
+
+.BI "int io_destroy(io_context_t ctx)"
+.sp
+Link with \fI\-laio\fP.
+.fi
+.SH DESCRIPTION
+This is a wrapper for the
+.BR io_destroy (2)
+system call.
+.PP
+See
+.BR io_queue_release (3)
+for the
+.I libaio
+high-level interface.
+
+The \fBio_destroy\fP() will attempt to cancel all outstanding asynchronous I/O
+operations previously submitted to \fIctx\fP. It will block on completion of
+operations that could not be canceled. Upon sucessfull return the I/O context
+\fIctx\fP is destroyed.
+.SH RETURN VALUE
+On success,
+.BR io_setup ()
+returns 0. On failure, a negative error number is returned.
+.SH NOTES
+Note that the Linux system call uses a different type
+.RI ( "aio_context_t\ *" )
+for the
+.I ctx
+argument.
+.SH SEE ALSO
+.BR io_cancel (3)
+.BR io_getevents (3)
+.BR io_queue_release (3)
+.BR io_setup (3)
+.BR io_submit (3)
diff --git a/man/io_setup.3 b/man/io_setup.3
new file mode 100644
index 0000000..4b3704e
--- /dev/null
+++ b/man/io_setup.3
@@ -0,0 +1,50 @@
+.\" Copyright (C) 2013 Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
+.\"
+.\" This file is distributed according to the GNU General Public License.
+.\"
+.TH IO_SETUP 3 2013-03-26 "Linux" "Linux AIO"
+.SH NAME
+io_setup \- create an asynchronous I/O context
+.SH SYNOPSIS
+.nf
+.B #include <libaio.h>
+
+.BI "int io_setup(int maxevents, io_context_t *ctx)"
+.sp
+Link with \fI\-laio\fP.
+.fi
+.SH DESCRIPTION
+This is a wrapper for the
+.BR io_setup (2)
+system call.
+.PP
+See
+.BR io_queue_init (3)
+for the
+.I libaio
+high-level interface.
+
+The
+.BR io_setup ()
+creates an asynchronous I/O context suitable for concurrently processing
+\fImaxevents\fP operations.
+The \fIctx\fP must not point to allready existing I/O context and must be
+initialized to 0 prior to the call.
+
+On successful initialization the \fIctx\fP is filled with a handle.
+.SH RETURN VALUE
+On success,
+.BR io_setup ()
+returns 0. On failure, a negative error number is returned.
+.SH NOTES
+Note that the Linux system call uses a different type
+.RI ( "aio_context_t\ *" )
+for the
+.I ctx
+argument.
+.SH SEE ALSO
+.BR io_cancel (3)
+.BR io_destroy (3)
+.BR io_getevents (3)
+.BR io_queue_init (3)
+.BR io_submit (3)
-- 
1.7.8.6


--MGYHOYXEY6WxJCY8--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
