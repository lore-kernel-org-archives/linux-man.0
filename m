From: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Subject: Re: Review request: rtld-audit(7)
Date: Tue, 13 Jan 2009 18:08:39 +0100
Message-ID: <20090113170839.GD21648@machine.or.cz>
References: <cfd18e0f0901112107h4bfe3f64pa6e46136e2cc1e17@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <cfd18e0f0901112107h4bfe3f64pa6e46136e2cc1e17-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ulrich Drepper <drepper-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

  Hi!

  I'm sorry, I won't have time to review the manpage in detail in the
nearest future. :-( So three nits is all I can offer...

On Mon, Jan 12, 2009 at 06:07:14PM +1300, Michael Kerrisk wrote:
> .TH RTLD-AUDIT 7 2009-01-12 "Linux" "Linux Programmer's Manual"
> .SH NAME
> rtld-audit \- auditing API for the dynamic linker
> .SH SYNOPSIS
> .B #define _GNU_SOURCE
> 
> .B #include <link.h>
> .SH DESCRIPTION
> The GNU dynamic linker (run-time linker)

The parentheses look awkward, is it necessary to have?

> provides an auditing API that allows an application
> to be notified when various dynamic linking events occur.
> This API is very similar to the auditing interface provided by the
> Solaris run-time linker.

So there _are_ differences? "compatible with", maybe?

> The necessary constants and prototypes are defined by including
> .IR <link.h> .
> 
> To use this interface, the programmer creates a shared library
> that implements a standard set of function names.
> Not all of the functions need to be implemented: in most cases,
> if the programmer is not interested in a particular class of auditing event,
> then no implementation needs to be provided for the corresponding
> auditing function.
> 
> To employ the auditing interface, the environment variable
> .BR LD_AUDIT
> must be defined to contain a colon-separated list of shared libraries,
> each of which can implement (parts of) the auditing API.
> .\" FIXME Does specifying multiple audit libraries actually work
> .\" on GNU?  My simple tests on Solaris work okay, but not on
> .\" Linux -- mtk, Jan 2009
> .\" glibc bug filed: http://sourceware.org/bugzilla/show_bug.cgi?id=9733

Make a BUGS section for this?

-- 
				Petr "Pasky" Baudis
The average, healthy, well-adjusted adult gets up at seven-thirty
in the morning feeling just terrible. -- Jean Kerr
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
