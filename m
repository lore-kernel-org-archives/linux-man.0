From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Review request: revised bindresvport() man page
Date: Wed, 3 Dec 2008 22:17:42 -0500
Message-ID: <cfd18e0f0812031917t3554bc17uc7ebf3e8221ab3e1@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Wichmann, Mats D" <mats.d.wichmann-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Ulrich Drepper <drepper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Mats,

After your (offlist) bug report, would you care to review the
following revised bindresvport.3 man page?  I think the changes
address the points you raised.

Cheers,

Michael

.\" This page was initially taken from the 4.4BSD-Lite CDROM (BSD license)
.\" with substantial updates
.\" Copyright (C) 2007, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
.\"
.\" @(#)bindresvport.3n 2.2 88/08/02 4.0 RPCSRC; from 1.7 88/03/14 SMI
.\"
.\" 2007-05-31, mtk: Rewrite and substantial additional text.
.\" 2008-12-0, mt: Rewrote some pieces and fixed some errors
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
.\" Glibc actually starts searching with a port # the range 600 to 1023

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
All reserved ports are in use.
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
.LP
Only root can bind to a privileged port; this call will fail for any
other users.
.I sin
is not NULL and
.I sin\->sin_family
is not
.BR AF_INET .
.SH SEE ALSO
.BR bind (2),
.BR getsockname (2)
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
