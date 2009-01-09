From: Simon Oosthoek <simon-Hf+EfML1qzhUecB6AVeNQA@public.gmane.org>
Subject: regex.7 manpage is awful
Date: Fri, 9 Jan 2009 11:22:09 +0100
Message-ID: <20090109102208.GA22747@atcmpg.ATComputing.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Jan Christiaan van Winkel <jc-Hf+EfML1qzhUecB6AVeNQA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi

The manpage regex(7) is explcitly mentioned in the new LPI objectives,
but in preparation to make study material for this subject, I feel a
strong sense of repulsion to even mention this page, as I cannot
understand what anyone would learn from it...

Probably the source of the problem lies with POSIX.2, as this has
apparently an ambiguous definition of the "extended" regular
expressions and (IMO erroneously) defines the basic regular
expressions as obsolete, though they are used in many many programs,
including grep, vim, sed, etc.

I may be wrong, but when I see so many (!)'s in the manpage,
indicating that this is not implemented equally, the whole definition
is broken and there is no such thing as "extended" or "modern" REs,
but a bunch of varying implementations of roughly similar extended RE
rules.

Also, if I interpret the page correctly, "modern" REs don't have
backreferences? They are mentioned as a new item for BASIC REs. While
they are bothersome to use, backreference are useful and would be
missed in an extended RE implementation without them. (certainly,
egrep /did/ implement them)

To me, the "modern" REs are a simplification of the syntax with bounds
and () enclosures without preceding '\'s and adding a bunch of weirdly
long character class notations that I doubt anyone uses frequently,
since they are too long to type and remember ([. [= [:) 

If I were on the POSIX committee, I'd propose perl REs as the next
"modern" RE, but I'd not obsolete the basic RE at all, because in 95%
of the uses they are sufficient.
Perl REs are easy to type, well documented and powerful. Also
implementations already exist and are very well tested on probably all
Unix platforms.

Anyway, the point of this e-mail:
- the current page is awful, hard to read and ambiguous
- the implied POSIX decision to obsolete basic REs is bad
- I would not recommend this manpage to anyone trying to understand
  REs

If possible I'd like to change the world ;-) but failing that, a less
ambiguous (and easier to read) version of the regex(7) manpage would
be greatly appreciated!

Cheers

Simon

PS, speaking on personal title, not for my employer AT Computing

PPS, I'd love to be proved wrong on any of my statements, so please
correct me if I'm wrong.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
