From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: Review request: revised bindresvport() man page
Date: Thu, 4 Dec 2008 06:59:48 -0500
Message-ID: <cfd18e0f0812040359y16117d71q2fb1ef7dca915903@mail.gmail.com>
References: <cfd18e0f0812031917t3554bc17uc7ebf3e8221ab3e1@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cfd18e0f0812031917t3554bc17uc7ebf3e8221ab3e1-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Wichmann, Mats D" <mats.d.wichmann-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Ulrich Drepper <drepper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Mats,

I fixed the page after Petr's comments, and also added a note to
explicitly say that the implementation doesn't use sin->sin_port.
Revised version of the page below.

Cheers,

Michael

.\" Copyright (C) 2007, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
.\" and Copyright (C) 2008, Linux Foundation, written by Michael Kerrisk
.\"     <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
.\" 2007-05-31, mtk: Rewrite and substantial additional text.
.\" 2008-12-03, mtk: Rewrote some pieces and fixed some errors
.\"
.TH BINDRESVPORT 3  2008-12-03 "" "Linux Programmer's Manual"
.SH NAME
bindresvport \- bind a socket to a privileged IP port
.SH SYNOPSIS
.nf
.B #include <sys/types.h>
.B #include <netinet/in.h>
.LP
.BI "int bindresvport(int " sockfd ", struct sockaddr_in *" sin );
.fi
.SH DESCRIPTION
.LP
.BR bindresvport ()
is used to bind a socket descriptor to a privileged anonymous IP port,
that is, a port number arbitrarily selected from the range 512 to 1023.
.\" Glibc actually starts searching with a port # in the range 600 to 1023

If the
.BR bind (2)
performed by
.BR bindresvport ()
is successful, and
.I sin
is not NULL, then
.I sin\->sin_port
returns the port number actually allocated.

.I sin
can be NULL, in which case
.I sin\->sin_family
is implicitly taken to be
.BR AF_INET .
However, in this case,
.BR bindresvport ()
has no way to return the port number actually allocated.
(This information can later be obtained using
.BR getsockname (2).)
.SH RETURN VALUE
.BR bindresvport ()
returns 0 on success; otherwise \-1 is returned and
.I errno
set to indicate the cause of the error.
.SH ERRORS
.BR bindresvport ()
can fail for any of the same reasons as
.BR bind (2).
In addition, the following errors may occur:
.TP
.BR EACCES
The caller did not have superuser privilege (to be precise: the
.B CAP_NET_BIND_SERVICE
capability is required).
.TP
.B EADDRINUSE
All privileged ports are in use.
.TP
.BR EAFNOSUPPORT " (" EPFNOSUPPORT " in glibc 2.7 and earlier)"
.I sin
is not NULL and
.I sin->sin_family
is not
.BR AF_INET .
.SH "CONFORMING TO"
Not in POSIX.1-2001.
Present on the BSDs, Solaris, and many other systems.
.SH NOTES
Unlike some
.BR bindresvport ()
implementations,
the glibc implementation ignores any value that the caller supplies in
.IR sin\->sin_port .
.SH SEE ALSO
.BR bind (2),
.BR getsockname (2)
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
