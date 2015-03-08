From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] iconv.1, localedef.1, access.2, execveat.2, fanotify_init.2,
 futex.2, ioctl_fat.2, mount.2, ftw.3, sd.4, tty_ioctl.4, fanotify.7, futex.7,
 posixoptions.7, iconvconfig.8: Remove useless quotes form .SS and .SH sections
Date: Sun, 08 Mar 2015 08:54:56 +0100
Message-ID: <54FC0050.9060500@gmail.com>
References: <1425780232-29602-1-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425780232-29602-1-git-send-email-saulery-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?U3TDqXBoYW5lIEF1bGVyeQ==?= <saulery-GANU6spQydw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/08/2015 03:03 AM, St=C3=A9phane Aulery wrote:
> Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>

Thanks, St=C3=A9phane. Applied.

Cheers,

Michael

> ---
>  man1/iconv.1         |  2 +-
>  man1/localedef.1     |  2 +-
>  man2/access.2        |  6 +++---
>  man2/execveat.2      |  2 +-
>  man2/fanotify_init.2 |  4 ++--
>  man2/futex.2         |  2 +-
>  man2/ioctl_fat.2     |  4 ++--
>  man2/mount.2         |  6 +++---
>  man3/ftw.3           |  2 +-
>  man4/sd.4            |  2 +-
>  man4/tty_ioctl.4     |  2 +-
>  man7/fanotify.7      |  4 ++--
>  man7/futex.7         |  2 +-
>  man7/posixoptions.7  | 12 ++++++------
>  man8/iconvconfig.8   |  2 +-
>  15 files changed, 27 insertions(+), 27 deletions(-)
>=20
> diff --git a/man1/iconv.1 b/man1/iconv.1
> index 54e2655..92542a5 100644
> --- a/man1/iconv.1
> +++ b/man1/iconv.1
> @@ -196,7 +196,7 @@ $ \fBecho abc =C3=9F =CE=B1 =E2=82=AC =C3=A0=E1=B8=
=83=C3=A7 | iconv \-f UTF\-8 \-t ASCII//TRANSLIT\fP
>  abc ss ? EUR abc
>  .fi
>  .in
> -.SH "SEE ALSO"
> +.SH SEE ALSO
>  .BR locale (1),
>  .BR iconv (3),
>  .BR nl_langinfo (3),
> diff --git a/man1/localedef.1 b/man1/localedef.1
> index bb1e158..2996f91 100644
> --- a/man1/localedef.1
> +++ b/man1/localedef.1
> @@ -362,7 +362,7 @@ contain a slash):
>  .RS
>  localedef \-f UTF\-8 \-i fi_FI ./fi_FI.UTF\-8
>  .RE
> -.SH "SEE ALSO"
> +.SH SEE ALSO
>  .BR locale (1),
>  .BR charmap (5),
>  .BR locale (5),
> diff --git a/man2/access.2 b/man2/access.2
> index ad39b85..04560f9 100644
> --- a/man2/access.2
> +++ b/man2/access.2
> @@ -181,7 +181,7 @@ See
>  .BR openat (2)
>  for an explanation of the need for
>  .BR faccessat ().
> -.SH "RETURN VALUE"
> +.SH RETURN VALUE
>  On success (all requested permissions granted, or
>  .I mode
>  is
> @@ -274,7 +274,7 @@ is a file descriptor referring to a file other th=
an a directory.
>  .BR faccessat ()
>  was added to Linux in kernel 2.6.16;
>  library support was added to glibc in version 2.4.
> -.SH "CONFORMING TO"
> +.SH CONFORMING TO
>  .BR access ():
>  SVr4, 4.3BSD, POSIX.1-2001, POSIX.1-2008.
> =20
> @@ -402,7 +402,7 @@ the underlying filesystem.
>  Since kernel 2.6.20, the
>  .B MS_NOEXEC
>  is honored
> -.SH "SEE ALSO"
> +.SH SEE ALSO
>  .BR chmod (2),
>  .BR chown (2),
>  .BR open (2),
> diff --git a/man2/execveat.2 b/man2/execveat.2
> index 85d460f..e5562a3 100644
> --- a/man2/execveat.2
> +++ b/man2/execveat.2
> @@ -105,7 +105,7 @@ and a non-NULL
>  .I pathname
>  is a symbolic link, then the call fails with the error
>  .BR ELOOP .
> -.SH "RETURN VALUE"
> +.SH RETURN VALUE
>  On success,
>  .BR execveat ()
>  does not return.
> diff --git a/man2/fanotify_init.2 b/man2/fanotify_init.2
> index 348383b..790bbe2 100644
> --- a/man2/fanotify_init.2
> +++ b/man2/fanotify_init.2
> @@ -234,7 +234,7 @@ capability.
>  .BR fanotify_init ()
>  was introduced in version 2.6.36 of the Linux kernel and enabled in =
version
>  2.6.37.
> -.SH "CONFORMING TO"
> +.SH CONFORMING TO
>  This system call is Linux-specific.
>  .SH BUGS
>  As of Linux 3.17,
> @@ -257,6 +257,6 @@ such as
>  .BR FMODE_EXEC ,
>  can be set, and will consequently be set for the file descriptors
>  returned when reading from the fanotify file descriptor.
> -.SH "SEE ALSO"
> +.SH SEE ALSO
>  .BR fanotify_mark (2),
>  .BR fanotify (7)
> diff --git a/man2/futex.2 b/man2/futex.2
> index efa8057..64dd7fb 100644
> --- a/man2/futex.2
> +++ b/man2/futex.2
> @@ -309,7 +309,7 @@ for end-users.
>  (There is no wrapper function for this system call in glibc.)
>  Implementors are expected to be assembly literate and to have
>  read the sources of the futex user-space library referenced below.
> -.\" .SH "AUTHORS"
> +.\" .SH AUTHORS
>  .\" .PP
>  .\" Futexes were designed and worked on by
>  .\" Hubertus Franke (IBM Thomas J. Watson Research Center),
> diff --git a/man2/ioctl_fat.2 b/man2/ioctl_fat.2
> index dbb83b8..4ae0e5d 100644
> --- a/man2/ioctl_fat.2
> +++ b/man2/ioctl_fat.2
> @@ -22,7 +22,7 @@
>  .\" the source, must acknowledge the copyright and authors of this w=
ork.
>  .\" %%%LICENSE_END
>  .TH IOCTl-FAT 2 2015-02-21 "Linux" "Linux Programmer's Manual"
> -.SH "NAME"
> +.SH NAME
>  ioctl_fat \- manipulating the FAT filesystem
>  .SH SYNOPSIS
>  .nf
> @@ -241,7 +241,7 @@ in Linux 2.6.12.
>  was introduced in version 3.11
>  .\" commit 6e5b93ee55d401f1619092fb675b57c28c9ed7ec
>  of the Linux kernel.
> -.SH "CONFORMING TO"
> +.SH CONFORMING TO
>  This API is Linux-specific.
>  .SH EXAMPLE
>  .SS Toggling the archive flag
> diff --git a/man2/mount.2 b/man2/mount.2
> index c3d810c..b081ba1 100644
> --- a/man2/mount.2
> +++ b/man2/mount.2
> @@ -308,7 +308,7 @@ understood by this filesystem.
>  See
>  .BR mount (8)
>  for details of the options available for each filesystem type.
> -.SH "RETURN VALUE"
> +.SH RETURN VALUE
>  On success, zero is returned.
>  On error, \-1 is returned, and
>  .I errno
> @@ -418,7 +418,7 @@ and
>  were added to glibc headers in version 2.12.
>  .\" FIXME . Definitions of the so-far-undocumented MS_UNBINDABLE, MS=
_PRIVATE,
>  .\" MS_SHARED, and MS_SLAVE were (also) only added to glibc headers =
in 2.12.
> -.SH "CONFORMING TO"
> +.SH CONFORMING TO
>  This function is Linux-specific and should not be used in
>  programs intended to be portable.
>  .SH NOTES
> @@ -483,7 +483,7 @@ file exposes the list of mount points in the moun=
t
>  namespace of the process with the specified ID; see
>  .BR proc (5)
>  for details.
> -.SH "SEE ALSO"
> +.SH SEE ALSO
>  .BR umount (2),
>  .BR namespaces (7),
>  .BR path_resolution (7),
> diff --git a/man3/ftw.3 b/man3/ftw.3
> index b043ab8..959d370 100644
> --- a/man3/ftw.3
> +++ b/man3/ftw.3
> @@ -26,7 +26,7 @@
>  .\"
>  .\" Modified Sun Jul 25 11:02:22 1993 by Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org=
)
>  .\" 2006-05-24, Justin Pryzby <justinpryzby-iA+eEnwkJgzk1uMJSBkQmQ@public.gmane.org>
> -.\"  	document FTW_ACTIONRETVAL; include .SH "RETURN VALUE";
> +.\"  	document FTW_ACTIONRETVAL; include .SH RETURN VALUE;
>  .\" 2006-05-24, Justin Pryzby <justinpryzby-iA+eEnwkJgzk1uMJSBkQmQ@public.gmane.org> and
>  .\"	Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>  .\" 	reorganized and rewrote much of the page
> diff --git a/man4/sd.4 b/man4/sd.4
> index b8fdaa1..4a7f26d 100644
> --- a/man4/sd.4
> +++ b/man4/sd.4
> @@ -132,5 +132,5 @@ will fail with the error
>  /dev/sd[a\-h]: the whole device
>  .br
>  /dev/sd[a\-h][0\-8]: individual block partitions
> -.\".SH "SEE ALSO"
> +.\".SH SEE ALSO
>  .\".BR scsi (4)
> diff --git a/man4/tty_ioctl.4 b/man4/tty_ioctl.4
> index 27af773..29fceb9 100644
> --- a/man4/tty_ioctl.4
> +++ b/man4/tty_ioctl.4
> @@ -428,7 +428,7 @@ Get the
>  corresponding to
>  .IR fd .
>  .\"
> -.\" .SS "Serial info"
> +.\" .SS Serial info
>  .\" .BR "#include <linux/serial.h>"
>  .\" .sp
>  .\" .TP
> diff --git a/man7/fanotify.7 b/man7/fanotify.7
> index 25b9bd0..e867b78 100644
> --- a/man7/fanotify.7
> +++ b/man7/fanotify.7
> @@ -447,7 +447,7 @@ written.
>  The fanotify API was introduced in version 2.6.36 of the Linux kerne=
l and
>  enabled in version 2.6.37.
>  Fdinfo support was added in version 3.8.
> -.SH "CONFORMING TO"
> +.SH CONFORMING TO
>  The fanotify API is Linux-specific.
>  .SH NOTES
>  The fanotify API is available only if the kernel was built with the
> @@ -748,7 +748,7 @@ main(int argc, char *argv[])
>      exit(EXIT_SUCCESS);
>  }
>  .fi
> -.SH "SEE ALSO"
> +.SH SEE ALSO
>  .ad l
>  .BR fanotify_init (2),
>  .BR fanotify_mark (2),
> diff --git a/man7/futex.7 b/man7/futex.7
> index 2c5b56c..7342bc4 100644
> --- a/man7/futex.7
> +++ b/man7/futex.7
> @@ -105,7 +105,7 @@ below.
>  This man page illustrates the most common use of the
>  .BR futex (2)
>  primitives: it is by no means the only one.
> -.\" .SH "AUTHORS"
> +.\" .SH AUTHORS
>  .\" .PP
>  .\" Futexes were designed and worked on by Hubertus Franke
>  .\" (IBM Thomas J. Watson Research Center),
> diff --git a/man7/posixoptions.7 b/man7/posixoptions.7
> index 6ab4df6..8ca0ce7 100644
> --- a/man7/posixoptions.7
> +++ b/man7/posixoptions.7
> @@ -97,9 +97,9 @@ The following functions are present:
>  .in -4
>  .br
>  .fi
> -.\" .SS "BE"
> +.\" .SS BE
>  .\" Batch environment.
> -.\" .SS "CD"
> +.\" .SS CD
>  .\" C development.
>  .SS --- - POSIX_CHOWN_RESTRICTED
>  If this option is in effect (as it always is under POSIX.1-2001),
> @@ -138,9 +138,9 @@ option.
>  The function
>  .IR clock_getcpuclockid ()
>  is present.
> -.\" .SS "FD"
> +.\" .SS FD
>  .\" Fortran development
> -.\" .SS "FR"
> +.\" .SS FR
>  .\" Fortran runtime
>  .SS --- - _POSIX_FILE_LOCKING - _SC_FILE_LOCKING
>  This option has been deleted.
> @@ -233,7 +233,7 @@ Affected functions are
>  .SS --- - _POSIX_MULTI_PROCESS - _SC_MULTI_PROCESS
>  This option has been deleted.
>  Not in final XPG6.
> -.\" .SS "MX"
> +.\" .SS MX
>  .\" IEC 60559 Floating-Point Option.
>  .SS --- - _POSIX_NO_TRUNC
>  If this option is in effect (as it always is under POSIX.1-2001)
> @@ -359,7 +359,7 @@ Affected functions are
>  .br
>  .in -4
>  .fi
> -.\" .SS "SD"
> +.\" .SS SD
>  .\" Software development
>  .SS SEM - _POSIX_SEMAPHORES - _SC_SEMAPHORES
>  The include file
> diff --git a/man8/iconvconfig.8 b/man8/iconvconfig.8
> index dcc9299..738bcd9 100644
> --- a/man8/iconvconfig.8
> +++ b/man8/iconvconfig.8
> @@ -97,6 +97,6 @@ Usual system default gconv module configuration fil=
e.
>  .TP
>  .I /usr/lib/gconv/gconv-modules.cache
>  Usual system gconv module configuration cache.
> -.SH "SEE ALSO"
> +.SH SEE ALSO
>  .BR iconv (1),
>  .BR iconv (3)
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
