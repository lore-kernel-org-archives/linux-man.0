From: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Subject: Re: man stdint.h
Date: Fri, 13 Nov 2009 17:41:33 +0100
Message-ID: <20091113164133.GT3708@machine.or.cz>
References: <4AFD2EC2.60000@alpha-bit.de>
 <200911131020.00356.vapier@gentoo.org>
 <4AFD80E1.2090108@alpha-bit.de>
 <200911131126.19495.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <200911131126.19495.vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: Martin Gebert <martin.gebert-TAFHyoIWub4hFhg+JK9F0w@public.gmane.org>, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Fri, Nov 13, 2009 at 11:26:18AM -0500, Mike Frysinger wrote:
> On Friday 13 November 2009 10:53:05 Martin Gebert wrote:
> > >> I just found this ambiguities in stdint.h(0p) (from package
> > >> man-pages-posix-2003a on a current Gentoo system):
> > >
> > > the posix man pages are not maintained here.  they're maintained by the
> > > austin/posix group
> > 
> > FYI, Gentoo portage reports http://www.kernel.org/doc/man-pages/ as the
> > homepage for this package, which finally redirects bug reports to you.
> > I'm still trying to find a contact to POSIX/Austin...
> 
> that's because this place converts the posix pages into man page form.  but it 
> doesnt manage the actual content.

But actually, the bug reported here _is_ a conversion issue - the
superscript is transcribed inline without any delimitation, while it
should probably have additional parentheses. The original has no issue
since the proper part of the formula is superscripted unambiguously.

-- 
				Petr "Pasky" Baudis
A lot of people have my books on their bookshelves.
That's the problem, they need to read them. -- Don Knuth
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
