From: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Subject: Re: Review request: revised bindresvport() man page
Date: Thu, 4 Dec 2008 04:46:23 +0100
Message-ID: <20081204034623.GT10491@machine.or.cz>
References: <cfd18e0f0812031917t3554bc17uc7ebf3e8221ab3e1@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <cfd18e0f0812031917t3554bc17uc7ebf3e8221ab3e1-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: "Wichmann, Mats D" <mats.d.wichmann-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Ulrich Drepper <drepper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

On Wed, Dec 03, 2008 at 10:17:42PM -0500, Michael Kerrisk wrote:
> .\" This page was initially taken from the 4.4BSD-Lite CDROM (BSD license)
> .\" with substantial updates
> .\" Copyright (C) 2007, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> .\"
> .\" @(#)bindresvport.3n 2.2 88/08/02 4.0 RPCSRC; from 1.7 88/03/14 SMI
> .\"
> .\" 2007-05-31, mtk: Rewrite and substantial additional text.
> .\" 2008-12-0, mt: Rewrote some pieces and fixed some errors
> .\"
> .TH BINDRESVPORT 3  2008-12-03 "" "Linux Programmer's Manual"
> .SH NAME
> bindresvport \- bind a socket to a privileged IP port
> .SH SYNOPSIS
> .nf
> .B #include <sys/types.h>
> .B #include <netinet/in.h>
> .LP
> .BI "int bindresvport(int " sockfd ", struct sockaddr_in *" sin );
> .fi
> .SH DESCRIPTION
> .LP
> .BR bindresvport ()
> is used to bind a socket descriptor to a privileged anonymous IP port,
> that is, a port number arbitrarily selected from the range 512 to 1023.

the range of?

> .\" Glibc actually starts searching with a port # the range 600 to 1023

I think this is confusing, since it will still try 512..600 if nothing
above is available. "Glibc will start searching from number 600 above
and try lower port numbers only if no higher port is free." perhaps?
Though that feels like quite an implementation detail, I would
personally expect this in the NOTES section.

> .I sin
> can be NULL, in which case
> .I sin\->sin_family
> is implicitly taken to be
> .BR AF_INET .
> However, in this case,
> .BR bindresvport ()
> has no way to return the port number actually allocated.
> (This information can later be obtained using
> .BR getsockname (2).)
> .SH RETURN VALUE
> .BR bindresvport ()
> returns 0 on success; otherwise \-1 is returned and
> .I errno
> set to indicate the cause of the error.

Maybe it would be better to maintain consistent wording with other
manpages, e.g. bind(2)?

"On success, zero is returned.  On error, -1 is returned, and errno is
set appropriately."

> .SH ERRORS
> .BR bindresvport ()
> can fail for any of the same reasons as
> .BR bind (2).
> In addition, the following errors may occur:
> .TP
> .BR EACCES
> The caller did not have superuser privilege (to be precise: the
> .B CAP_NET_BIND_SERVICE
> capability is required).
> .TP
> .B EADDRINUSE
> All reserved ports are in use.
> .TP
> .BR EAFNOSUPPORT " (" EPFNOSUPPORT " in glibc 2.7 and earlier)"
> .I sin
> is not NULL and
> .I sin->sin_family
> is not
> .BR AF_INET .
> .SH "CONFORMING TO"
> Not in POSIX.1-2001.
> Present on the BSDs, Solaris, and many other systems.
> .SH NOTES
> .LP
> Only root can bind to a privileged port; this call will fail for any
> other users.
> .I sin
> is not NULL and
> .I sin\->sin_family
> is not
> .BR AF_INET .

Leftover from older version?

> .SH SEE ALSO
> .BR bind (2),
> .BR getsockname (2)

-- 
				Petr "Pasky" Baudis
People who take cold baths never have rheumatism, but they have
cold baths.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
