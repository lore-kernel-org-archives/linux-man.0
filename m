From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Revised abort(3) man page
Date: Thu, 06 Dec 2007 10:02:12 +0100
Message-ID: <4757BA94.1090406@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: atuninga-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hey Alex,

After your comments I did a fairly substantial rewrite of the abort(3) man
page.  The revised text is below; let me know what you thing.

Cheers,

Michael

.\" Copyright 2007 (C) Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
.\" some parts Copyright 1993 David Metcalfe (david-GnUU2o3JqewCqOQrDF6SL1pr/1R2p/CL@public.gmane.org)
.\"
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
.\"
.\" References consulted:
.\"     Linux libc source code
.\"     Lewine's _POSIX Programmer's Guide_ (O'Reilly & Associates, 1991)
.\"     386BSD man pages
.\" Modified Sat Jul 24 21:46:21 1993 by Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
.\" Modified Fri Aug  4 10:51:53 2000 - patch from Joseph S. Myers
.\" 2007-12-06, mtk, Mostly rewritten
.\"
.TH ABORT 3  2007-12-06 "GNU" "Linux Programmer's Manual"
.SH NAME
abort \- cause abnormal process termination
.SH SYNOPSIS
.nf
.B #include <stdlib.h>
.sp
.B void abort(void);
.fi
.SH DESCRIPTION
The
.BR abort ()
first unblocks the
.B SIGABRT
signal, and then raises that signal for the calling process.
This results in the abnormal termination of the process unless the
.B SIGABRT
signal is caught and the signal handler does not return
(see
.BR longjmp (3)).
.PP
If the
.BR abort ()
function causes process termination,
all open streams are closed and flushed.
.PP
If the
.B SIGABRT
signal is ignored, or caught by a handler that returns, the
.BR abort ()
function will still terminate the process.
It does this by restoring the default disposition for
.B SIGABRT
and then raising the signal for a second time.
.SH "RETURN VALUE"
The
.BR abort ()
function never returns.
.SH "CONFORMING TO"
SVr4, POSIX.1-2001, 4.3BSD, C89, C99
.SH "SEE ALSO"
.BR gdb (1),
.BR sigaction (2),
.BR exit (3),
.BR longjmp (3),
.BR raise (3)


-
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
