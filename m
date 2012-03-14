From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] fchmodat: split kernel/C library documents
Date: Tue, 13 Mar 2012 22:42:27 -0400
Message-ID: <1331692947-15879-1-git-send-email-vapier@gentoo.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The fchmodat(2) syscall has diff arguments than fchmodat(3), so move the
existing fchmodat.2 to fchmodat.3 (since the current page is documenting
the C library API), and extract the kernel-specific pieces into a new
fchmodat.2.

Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
---
 man2/fchmodat.2 |   48 ++++--------------
 man3/fchmodat.3 |  150 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 161 insertions(+), 37 deletions(-)
 create mode 100644 man3/fchmodat.3

diff --git a/man2/fchmodat.2 b/man2/fchmodat.2
index 94e0b3c..015d948 100644
--- a/man2/fchmodat.2
+++ b/man2/fchmodat.2
@@ -28,33 +28,14 @@
 fchmodat \- change permissions of a file relative to a directory \
 file descriptor
 .SH SYNOPSIS
-.nf
-.B #include <fcntl.h>           /* Definition of AT_* constants */
-.B #include <sys/stat.h>
-.sp
-.BI "int fchmodat(int " dirfd ", const char *" pathname ", mode_t " \
-mode ", int " flags );
-.fi
-.sp
-.in -4n
-Feature Test Macro Requirements for glibc (see
-.BR feature_test_macros (7)):
-.in
-.sp
-.BR fchmodat ():
-.PD 0
-.ad l
-.RS 4
-.TP 4
-Since glibc 2.10:
-_XOPEN_SOURCE\ >=\ 700 || _POSIX_C_SOURCE\ >=\ 200809L
-.TP
-Before glibc 2.10:
-_ATFILE_SOURCE
-.RE
-.ad
-.PD
+.BI "int fchmodat(int " dirfd ", const char *" pathname ", mode_t " mode );
 .SH DESCRIPTION
+This is not the function you are interested in.
+Look at
+.BR fchmodat (3)
+for the POSIX conforming C library interface.
+This page documents the bare kernel system call interface,
+
 The
 .BR fchmodat ()
 system call operates in exactly the same way as
@@ -88,16 +69,6 @@ If
 is absolute, then
 .I dirfd
 is ignored.
-
-.I flags
-can either be 0, or include the following flag:
-.TP
-.B AT_SYMLINK_NOFOLLOW
-If
-.I pathname
-is a symbolic link, do not dereference it:
-instead operate on the link itself.
-This flag is not currently implemented.
 .SH "RETURN VALUE"
 On success,
 .BR fchmodat ()
@@ -136,7 +107,9 @@ which is not supported.
 .BR fchmodat ()
 was added to Linux in kernel 2.6.16.
 .SH "CONFORMING TO"
-POSIX.1-2008.
+This system call is Linux-specific, but
+.BR fchmodat (3)
+is POSIX compliant..
 .SH NOTES
 See
 .BR openat (2)
@@ -145,5 +118,6 @@ for an explanation of the need for
 .SH "SEE ALSO"
 .BR chmod (2),
 .BR openat (2),
+.BR fchmodat (3),
 .BR path_resolution (7),
 .BR symlink (7)
diff --git a/man3/fchmodat.3 b/man3/fchmodat.3
new file mode 100644
index 0000000..fe7563e
--- /dev/null
+++ b/man3/fchmodat.3
@@ -0,0 +1,150 @@
+.\" Hey Emacs! This file is -*- nroff -*- source.
+.\"
+.\" This manpage is Copyright (C) 2006, Michael Kerrisk
+.\"
+.\" Permission is granted to make and distribute verbatim copies of this
+.\" manual provided the copyright notice and this permission notice are
+.\" preserved on all copies.
+.\"
+.\" Permission is granted to copy and distribute modified versions of this
+.\" manual under the conditions for verbatim copying, provided that the
+.\" entire resulting derived work is distributed under the terms of a
+.\" permission notice identical to this one.
+.\"
+.\" Since the Linux kernel and libraries are constantly changing, this
+.\" manual page may be incorrect or out-of-date.  The author(s) assume no
+.\" responsibility for errors or omissions, or for damages resulting from
+.\" the use of the information contained herein.  The author(s) may not
+.\" have taken the same level of care in the production of this manual,
+.\" which is licensed free of charge, as they might when working
+.\" professionally.
+.\"
+.\" Formatted or processed versions of this manual, if unaccompanied by
+.\" the source, must acknowledge the copyright and authors of this work.
+.\"
+.\"
+.TH FCHMODAT 3 2009-12-13 "" "Linux Programmer's Manual"
+.SH NAME
+fchmodat \- change permissions of a file relative to a directory \
+file descriptor
+.SH SYNOPSIS
+.nf
+.B #include <fcntl.h>           /* Definition of AT_* constants */
+.B #include <sys/stat.h>
+.sp
+.BI "int fchmodat(int " dirfd ", const char *" pathname ", mode_t " \
+mode ", int " flags );
+.fi
+.sp
+.in -4n
+Feature Test Macro Requirements for glibc (see
+.BR feature_test_macros (7)):
+.in
+.sp
+.BR fchmodat ():
+.PD 0
+.ad l
+.RS 4
+.TP 4
+Since glibc 2.10:
+_XOPEN_SOURCE\ >=\ 700 || _POSIX_C_SOURCE\ >=\ 200809L
+.TP
+Before glibc 2.10:
+_ATFILE_SOURCE
+.RE
+.ad
+.PD
+.SH DESCRIPTION
+The
+.BR fchmodat ()
+system call operates in exactly the same way as
+.BR chmod (2),
+except for the differences described in this manual page.
+
+If the pathname given in
+.I pathname
+is relative, then it is interpreted relative to the directory
+referred to by the file descriptor
+.I dirfd
+(rather than relative to the current working directory of
+the calling process, as is done by
+.BR chmod (2)
+for a relative pathname).
+
+If
+.I pathname
+is relative and
+.I dirfd
+is the special value
+.BR AT_FDCWD ,
+then
+.I pathname
+is interpreted relative to the current working
+directory of the calling process (like
+.BR chmod (2)).
+
+If
+.I pathname
+is absolute, then
+.I dirfd
+is ignored.
+
+.I flags
+can either be 0, or include the following flag:
+.TP
+.B AT_SYMLINK_NOFOLLOW
+If
+.I pathname
+is a symbolic link, do not dereference it:
+instead operate on the link itself.
+This flag is not currently implemented.
+.SH "RETURN VALUE"
+On success,
+.BR fchmodat ()
+returns 0.
+On error, \-1 is returned and
+.I errno
+is set to indicate the error.
+.SH ERRORS
+The same errors that occur for
+.BR chmod (2)
+can also occur for
+.BR fchmodat ().
+The following additional errors can occur for
+.BR fchmodat ():
+.TP
+.B EBADF
+.I dirfd
+is not a valid file descriptor.
+.TP
+.B EINVAL
+Invalid flag specified in
+.IR flags .
+.TP
+.B ENOTDIR
+.I pathname
+is relative and
+.I dirfd
+is a file descriptor referring to a file other than a directory.
+.TP
+.B ENOTSUP
+.I flags
+specified
+.BR AT_SYMLINK_NOFOLLOW ,
+which is not supported.
+.SH VERSIONS
+.BR fchmodat ()
+was added to Linux in kernel 2.6.16.
+.SH "CONFORMING TO"
+POSIX.1-2008.
+.SH NOTES
+See
+.BR openat (2)
+for an explanation of the need for
+.BR fchmodat ().
+.SH "SEE ALSO"
+.BR chmod (2),
+.BR fchmodat (2),
+.BR openat (2),
+.BR path_resolution (7),
+.BR symlink (7)
-- 
1.7.8.5

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
