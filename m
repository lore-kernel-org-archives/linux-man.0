From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: For review: uselocale(3)
Date: Fri, 14 Mar 2014 12:21:00 +0100
Message-ID: <CAKgNAkj=gL0=K4q4KwRPwiH+oQ4f-tJX7eGXwt=aaNWRzSs03w@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Comments on this new page welcome.

Thanks,

Michael

'\" t
.\" Copyright (C) 2014 Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
.\"
.\" %%%LICENSE_START(VERBATIM)
.\" Permission is granted to make and distribute verbatim copies of this
.\" manual provided the copyright notice and this permission notice are
.\" preserved on all copies.
.\"
.\" Permission is granted to copy and distribute modified versions of this
.\" manual under the conditions for verbatim copying, provided that the
.\" entire resulting derived work is distributed under the terms of a
.\" permission notice identical to this one.
.\"
.\" Since the Linux kernel and libraries are constantly changing, this
.\" manual page may be incorrect or out-of-date.  The author(s) assume no
.\" responsibility for errors or omissions, or for damages resulting from
.\" the use of the information contained herein.  The author(s) may not
.\" have taken the same level of care in the production of this manual,
.\" which is licensed free of charge, as they might when working
.\" professionally.
.\"
.\" Formatted or processed versions of this manual, if unaccompanied by
.\" the source, must acknowledge the copyright and authors of this work.
.\" %%%LICENSE_END
.\"
.TH USELOCALE 3 2014-03-10 "Linux" "Linux Programmer's Manual"
.SH NAME
uselocale \- set/get the locale for the calling thread
.SH SYNOPSIS
.nf
.B #include <locale.h>

.BI "locale_t uselocale(locale_t " newloc );
.fi
.sp
.in -4n
Feature Test Macro Requirements for glibc (see
.BR feature_test_macros (7)):
.in
.sp
.BR uselocale ():
.PD 0
.RS 4
.TP
Since glibc 2.10:
_XOPEN_SOURCE\ >=\ 700
.TP
Before glibc 2.10:
_GNU_SOURCE
.RE
.PD
.SH DESCRIPTION
The
.BR uselocale ()
function sets the current locale for the calling thread,
and returns the thread's previously current locale.
After a successful call to
.BR uselocale (),
any calls by this thread to functions that depend on the locale
will operate as though the locale has been set to
.IR newloc .

The
.I newloc
argument can have one of the following values:
.TP
A handle returned by a call to \fBnewlocale\fP(3) or \fBduplocale\fP(3)
The calling thread's current locale is set to the specified locale.
.TP
The special locale object handle \fBLC_GLOBAL_LOCALE\fP
The calling thread's current locale is set to the global locale determined by
.BR setlocale (3).
.TP
.I "(locale_t) 0"
The calling thread's current locale is left unchanged
(and the current locale is returned as the function result).
.SH RETURN VALUE
On success,
.BR uselocale ()
returns the locale handle that was set by the previous call to
.BR uselocale ()
in this thread, or
.BR LC_GLOBAL_HANDLE
if there was no such previous call.
On error, it returns
.IR "(locale_t)\ 0",
and sets
.I errno
to indicate the cause of the error.
.SH ERRORS
.TP
.B EINVAL
.I newloc
does not refer to a valid locale object.
.SH VERSIONS
The
.BR uselocale ()
function first appeared in version 2.3 of the GNU C library.
.SH CONFORMING TO
POSIX.1-2008.
.SH NOTES
Unlike
.BR setlocale (3),
.BR uselocale ()
does not allow selective replacement of individual locale categories.
To employ a locale that differs in only a few categories from the current
locale, use calls to
.BR duplocale (3)
and
.BR newlocale (3)
to obtain a locale object equivalent to the current locale and
modify the desired categories in that object.
.SH EXAMPLE
See
.BR newlocale (3)
and
.BR duplocale (3).
.SH SEE ALSO
.BR locale (1),
.BR duplocale (3),
.BR freelocale (3),
.BR newlocale (3),
.BR setlocale (3),
.BR locale (5),
.BR locale (7)


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
