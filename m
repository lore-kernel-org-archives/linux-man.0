From: Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
Subject: [PATCH] man: Add io_setup.3 and io_destroy.3
Date: Tue, 26 Mar 2013 18:06:26 +0100
Message-ID: <20130326170626.GA11360@rei.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This patch adds two missing manual pages.

I've tried to format them in accordance with
Linux man-pages project. If these are acked
I'll reformat the rest of the io_* system call
wrappers man pages to match.

Signed-off-by: Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
---
 man/io_destroy.3 |   45 +++++++++++++++++++++++++++++++++++++++++++++
 man/io_setup.3   |   45 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 90 insertions(+), 0 deletions(-)
 create mode 100644 man/io_destroy.3
 create mode 100644 man/io_setup.3

diff --git a/man/io_destroy.3 b/man/io_destroy.3
new file mode 100644
index 0000000..6d84213
--- /dev/null
+++ b/man/io_destroy.3
@@ -0,0 +1,45 @@
+.\" Copyright (C) 2013 Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
+.\"
+.\" %%%LICENSE_START(GPL_NOVERSION_ONELINE)
+.\" This file is distributed according to the GNU General Public License.
+.\" %%%LICENSE_END
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
+.BR io_destroy
+system call, see
+.BR io_destroy (2)
+for more information.
+.PP
+See
+.BR io_queue_release (3)
+for
+.I libaio
+highlevel interface.
+.SH "RETURN VALUES"
+On success
+.BR io_setup ()
+returns 0. On failure negative error number is returned.
+.SH NOTES
+Note that Linux system call uses different type
+.RI ( "aio_context_t\ *" )
+for the
+.I ctx
+argument.
+.SH "SEE ALSO"
+.BR io_queue_release (3)
+.BR io_setup (3)
+.BR io_submit (3)
+.BR io_cancel (3)
+.BR io_getevents (3)
diff --git a/man/io_setup.3 b/man/io_setup.3
new file mode 100644
index 0000000..626e954
--- /dev/null
+++ b/man/io_setup.3
@@ -0,0 +1,45 @@
+.\" Copyright (C) 2013 Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
+.\"
+.\" %%%LICENSE_START(GPL_NOVERSION_ONELINE)
+.\" This file is distributed according to the GNU General Public License.
+.\" %%%LICENSE_END
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
+.BR io_setup
+system call, see
+.BR io_setup (2)
+for more information.
+.PP
+See
+.BR io_queue_init (3)
+for
+.I libaio
+highlevel interface.
+.SH "RETURN VALUES"
+On success
+.BR io_setup ()
+returns 0. On failure negative error number is returned.
+.SH NOTES
+Note that Linux system call uses different type
+.RI ( "aio_context_t\ *" )
+for the
+.I ctx
+argument.
+.SH "SEE ALSO"
+.BR io_queue_init (3)
+.BR io_destroy (3)
+.BR io_submit (3)
+.BR io_cancel (3)
+.BR io_getevents (3)
-- 
1.7.8.6


-- 
Cyril Hrubis
chrubis-AlSwsSmVLrQ@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
