From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] fchmodat: split kernel/C library documents
Date: Sun, 15 Apr 2012 23:15:27 +1200
Message-ID: <CAKgNAkiACOdmvpr+tyVx-j=twG2Dtp1rNn=km4jR7vvc53K24g@mail.gmail.com>
References: <1331692947-15879-1-git-send-email-vapier@gentoo.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1331692947-15879-1-git-send-email-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Mike,

On Wed, Mar 14, 2012 at 3:42 PM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wro=
te:
> The fchmodat(2) syscall has diff arguments than fchmodat(3), so move =
the
> existing fchmodat.2 to fchmodat.3 (since the current page is document=
ing
> the C library API), and extract the kernel-specific pieces into a new
> fchmodat.2.
>
> Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
> ---
> =A0man2/fchmodat.2 | =A0 48 ++++--------------
> =A0man3/fchmodat.3 | =A0150 +++++++++++++++++++++++++++++++++++++++++=
++++++++++++++
> =A02 files changed, 161 insertions(+), 37 deletions(-)
> =A0create mode 100644 man3/fchmodat.3
>
> diff --git a/man2/fchmodat.2 b/man2/fchmodat.2
> index 94e0b3c..015d948 100644
> --- a/man2/fchmodat.2
> +++ b/man2/fchmodat.2
> @@ -28,33 +28,14 @@
> =A0fchmodat \- change permissions of a file relative to a directory \
> =A0file descriptor
> =A0.SH SYNOPSIS
> -.nf
> -.B #include <fcntl.h> =A0 =A0 =A0 =A0 =A0 /* Definition of AT_* cons=
tants */
> -.B #include <sys/stat.h>
> -.sp
> -.BI "int fchmodat(int " dirfd ", const char *" pathname ", mode_t " =
\
> -mode ", int " flags );
> -.fi
> -.sp
> -.in -4n
> -Feature Test Macro Requirements for glibc (see
> -.BR feature_test_macros (7)):
> -.in
> -.sp
> -.BR fchmodat ():
> -.PD 0
> -.ad l
> -.RS 4
> -.TP 4
> -Since glibc 2.10:
> -_XOPEN_SOURCE\ >=3D\ 700 || _POSIX_C_SOURCE\ >=3D\ 200809L
> -.TP
> -Before glibc 2.10:
> -_ATFILE_SOURCE
> -.RE
> -.ad
> -.PD
> +.BI "int fchmodat(int " dirfd ", const char *" pathname ", mode_t " =
mode );
> =A0.SH DESCRIPTION
> +This is not the function you are interested in.
> +Look at
> +.BR fchmodat (3)
> +for the POSIX conforming C library interface.
> +This page documents the bare kernel system call interface,
> +
> =A0The
> =A0.BR fchmodat ()
> =A0system call operates in exactly the same way as
> @@ -88,16 +69,6 @@ If
> =A0is absolute, then
> =A0.I dirfd
> =A0is ignored.
> -
> -.I flags
> -can either be 0, or include the following flag:
> -.TP
> -.B AT_SYMLINK_NOFOLLOW
> -If
> -.I pathname
> -is a symbolic link, do not dereference it:
> -instead operate on the link itself.
> -This flag is not currently implemented.
> =A0.SH "RETURN VALUE"
> =A0On success,
> =A0.BR fchmodat ()
> @@ -136,7 +107,9 @@ which is not supported.
> =A0.BR fchmodat ()
> =A0was added to Linux in kernel 2.6.16.
> =A0.SH "CONFORMING TO"
> -POSIX.1-2008.
> +This system call is Linux-specific, but
> +.BR fchmodat (3)
> +is POSIX compliant..
> =A0.SH NOTES
> =A0See
> =A0.BR openat (2)
> @@ -145,5 +118,6 @@ for an explanation of the need for
> =A0.SH "SEE ALSO"
> =A0.BR chmod (2),
> =A0.BR openat (2),
> +.BR fchmodat (3),
> =A0.BR path_resolution (7),
> =A0.BR symlink (7)
> diff --git a/man3/fchmodat.3 b/man3/fchmodat.3
> new file mode 100644
> index 0000000..fe7563e
> --- /dev/null
> +++ b/man3/fchmodat.3
> @@ -0,0 +1,150 @@
> +.\" Hey Emacs! This file is -*- nroff -*- source.
> +.\"
> +.\" This manpage is Copyright (C) 2006, Michael Kerrisk
> +.\"
> +.\" Permission is granted to make and distribute verbatim copies of =
this
> +.\" manual provided the copyright notice and this permission notice =
are
> +.\" preserved on all copies.
> +.\"
> +.\" Permission is granted to copy and distribute modified versions o=
f this
> +.\" manual under the conditions for verbatim copying, provided that =
the
> +.\" entire resulting derived work is distributed under the terms of =
a
> +.\" permission notice identical to this one.
> +.\"
> +.\" Since the Linux kernel and libraries are constantly changing, th=
is
> +.\" manual page may be incorrect or out-of-date. =A0The author(s) as=
sume no
> +.\" responsibility for errors or omissions, or for damages resulting=
 from
> +.\" the use of the information contained herein. =A0The author(s) ma=
y not
> +.\" have taken the same level of care in the production of this manu=
al,
> +.\" which is licensed free of charge, as they might when working
> +.\" professionally.
> +.\"
> +.\" Formatted or processed versions of this manual, if unaccompanied=
 by
> +.\" the source, must acknowledge the copyright and authors of this w=
ork.
> +.\"
> +.\"
> +.TH FCHMODAT 3 2009-12-13 "" "Linux Programmer's Manual"
> +.SH NAME
> +fchmodat \- change permissions of a file relative to a directory \
> +file descriptor
> +.SH SYNOPSIS
> +.nf
> +.B #include <fcntl.h> =A0 =A0 =A0 =A0 =A0 /* Definition of AT_* cons=
tants */
> +.B #include <sys/stat.h>
> +.sp
> +.BI "int fchmodat(int " dirfd ", const char *" pathname ", mode_t " =
\
> +mode ", int " flags );
> +.fi
> +.sp
> +.in -4n
> +Feature Test Macro Requirements for glibc (see
> +.BR feature_test_macros (7)):
> +.in
> +.sp
> +.BR fchmodat ():
> +.PD 0
> +.ad l
> +.RS 4
> +.TP 4
> +Since glibc 2.10:
> +_XOPEN_SOURCE\ >=3D\ 700 || _POSIX_C_SOURCE\ >=3D\ 200809L
> +.TP
> +Before glibc 2.10:
> +_ATFILE_SOURCE
> +.RE
> +.ad
> +.PD
> +.SH DESCRIPTION
> +The
> +.BR fchmodat ()
> +system call operates in exactly the same way as
> +.BR chmod (2),
> +except for the differences described in this manual page.
> +
> +If the pathname given in
> +.I pathname
> +is relative, then it is interpreted relative to the directory
> +referred to by the file descriptor
> +.I dirfd
> +(rather than relative to the current working directory of
> +the calling process, as is done by
> +.BR chmod (2)
> +for a relative pathname).
> +
> +If
> +.I pathname
> +is relative and
> +.I dirfd
> +is the special value
> +.BR AT_FDCWD ,
> +then
> +.I pathname
> +is interpreted relative to the current working
> +directory of the calling process (like
> +.BR chmod (2)).
> +
> +If
> +.I pathname
> +is absolute, then
> +.I dirfd
> +is ignored.
> +
> +.I flags
> +can either be 0, or include the following flag:
> +.TP
> +.B AT_SYMLINK_NOFOLLOW
> +If
> +.I pathname
> +is a symbolic link, do not dereference it:
> +instead operate on the link itself.
> +This flag is not currently implemented.
> +.SH "RETURN VALUE"
> +On success,
> +.BR fchmodat ()
> +returns 0.
> +On error, \-1 is returned and
> +.I errno
> +is set to indicate the error.
> +.SH ERRORS
> +The same errors that occur for
> +.BR chmod (2)
> +can also occur for
> +.BR fchmodat ().
> +The following additional errors can occur for
> +.BR fchmodat ():
> +.TP
> +.B EBADF
> +.I dirfd
> +is not a valid file descriptor.
> +.TP
> +.B EINVAL
> +Invalid flag specified in
> +.IR flags .
> +.TP
> +.B ENOTDIR
> +.I pathname
> +is relative and
> +.I dirfd
> +is a file descriptor referring to a file other than a directory.
> +.TP
> +.B ENOTSUP
> +.I flags
> +specified
> +.BR AT_SYMLINK_NOFOLLOW ,
> +which is not supported.
> +.SH VERSIONS
> +.BR fchmodat ()
> +was added to Linux in kernel 2.6.16.
> +.SH "CONFORMING TO"
> +POSIX.1-2008.
> +.SH NOTES
> +See
> +.BR openat (2)
> +for an explanation of the need for
> +.BR fchmodat ().
> +.SH "SEE ALSO"
> +.BR chmod (2),
> +.BR fchmodat (2),
> +.BR openat (2),
> +.BR path_resolution (7),
> +.BR symlink (7)
> --
> 1.7.8.5

Take a look at http://www.kernel.org/doc/man-pages/todo.html#migrate_to=
_kernel_source,
which covers what your patch is trying to do. In general, I'm not in
favor of patches like this; rather, I try to have a single page where
differences (if any) between the system call and libc wrapper are
noted. Thus, I'd propose the patch below instead. Seem okay?

Cheers,

Michael

--- a/man2/fchmodat.2
+++ b/man2/fchmodat.2
@@ -141,7 +141,16 @@ POSIX.1-2008.
 See
 .BR openat (2)
 for an explanation of the need for
-.BR fchmodat ().
+
+This page documents the interface provided by the
+glibc wrapper function for the
+.BR fchmodat ()
+system call.
+The underlying system call does
+.I not
+have a
+.I flags
+argument.
 .SH "SEE ALSO"
 .BR chmod (2),
 .BR openat (2),



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
