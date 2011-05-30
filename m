From: ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org (Eric W. Biederman)
Subject: [PATCH 1/2] setns.2: Initial man page
Date: Sun, 29 May 2011 20:16:46 -0700
Message-ID: <m1r57gj2sh.fsf@fess.ebiederm.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


Signed-off-by: Eric W. Biederman <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>
---
 man2/setns.2 |   88 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 88 insertions(+), 0 deletions(-)
 create mode 100644 man2/setns.2

diff --git a/man2/setns.2 b/man2/setns.2
new file mode 100644
index 0000000..8b48e14
--- /dev/null
+++ b/man2/setns.2
@@ -0,0 +1,88 @@
+.\" Copyright (C) 2011, Eric Biederman <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>
+.\" Licensed under the GPLv2
+.\"
+.TH SETNS 2 2011-05-28 "Linux" "Linux Programmer's Manual"
+.SH NAME
+setns \- reassociate parts of the process execution context
+.SH SYNOPSIS
+.nf
+.BR "#define _GNU_SOURCE" "             /* See feature_test_macros(7) */"
+.B #include <sched.h>
+.sp
+.BI "int setns(int " fd ", int " nstype );
+.fi
+.SH DESCRIPTION
+Given a file descriptor referring to a namespace reassociate the
+current process with that namespace.
+
+The
+.I nstype
+argument is an enumeration that specifies which type of namespace
+the current process may be reassociated with.  This argument can
+have one of the following values:
+
+.TP
+.BR 0
+Allow any namespace to be joined.
+.TP
+.BR CLONE_NEWIPC
+Only allow joining an ipc namespace.
+.TP
+.BR CLONE_NEWNET
+Only allow joining a network namespace.
+.TP
+.BR CLONE_NEWUTS
+Only allow joining a uts namespace.
+.PP
+If
+.I flags
+is specified as zero, then
+.BR setns ()
+is a no-op;
+no changes are made to the calling process's execution context.
+.SH RETURN VALUE
+On success, zero returned.
+On failure, \-1 is returned and
+.I errno
+is set to indicate the error.
+.SH ERRORS
+.TP
+.TP
+.B EBADF
+A bad file descriptor was passed to setns.
+
+.TP
+.B EINVAL
+A file descriptor that does not match the specified nstype.
+
+Attempting to change the mount namespace and the filesystem
+is shared between multiple tasks.
+
+.TP
+.B ENOMEM
+Cannot allocate sufficient memory to change the specified namespace.
+
+.TP
+.B EPERM
+The calling process did not have the required privileges for this operation.
+.SH VERSIONS
+The
+.BR setns ()
+system call first appeared in Linux in kernel 3.0
+.SH CONFORMING TO
+The
+.BR setns ()
+system call is Linux-specific.
+.SH NOTES
+Not all of the process attributes that can be shared when
+a new process is created using
+.BR clone (2)
+can be changed using
+.BR setns ().
+.SH BUGS
+The pid namespace and the mount namespace are not currently supported.
+.SH SEE ALSO
+.BR clone (2),
+.BR fork (2),
+.BR vfork (2),
+.BR setns(2)
-- 
1.7.5.1.217.g4e3aa

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
