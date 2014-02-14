From: Colin Watson <cjwatson-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: Re: Converting man-pages to UTF-8
Date: Fri, 14 Feb 2014 11:42:16 +0000
Message-ID: <20140214114216.GE6397@riva.ucam.org>
References: <CAKgNAkh5tHmJc2DrcoAJsDWWFao6bPckd2sN1dw-CZDSFNi5kQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkh5tHmJc2DrcoAJsDWWFao6bPckd2sN1dw-CZDSFNi5kQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bruno Haible <bruno-nWNVUoHt2MvYtjvyW6yDsg@public.gmane.org>, Werner Lemberg <wl-mXXj517/zsQ@public.gmane.org>, Peter Schiffer <pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Fri, Feb 14, 2014 at 11:43:30AM +0100, Michael Kerrisk (man-pages) w=
rote:
> At https://bugzilla.kernel.org/show_bug.cgi?id=3D60807 is a proposal =
to
> convert the pages of the the "man-pages" project to UTF 8. I thought
> it worthwhile bringing that topic to the list, and CCing a few people
> who may have some ideas about this step, since I'm not too sure of th=
e
> implications.
>=20
> Peter Schiffer has kindly written some some scripts to do the
> conversion, which would touch about 40 files. However, as far I can
> tell, many of the pages that have non-ASCII characters have inside
> groff comments (author's names, etc.). The only pages that have
> non-ASCII characters in the rendered source are various man7 pages on
> character sets. These were the pages to which I added a groff encodin=
g
> marker in response to Colin Watson's input on this Debian bug:
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D519209
>=20
> Moving to UTF-8 for the pages seems like a good idea, at least at som=
e
> point. However, I'm wondering whether there are any backward
> compatibility issues that I should need to worry about. As far as I
> know, groff added UTF-8 support back in Jan 2009, so, just over 5
> years ago. Perhaps that's long enough ago now, that any backward
> compatibility issues with old versions of groff would be minimal.
> (I.e., the number of people installing new man-pages on systems with
> old groff is likely to be very small, and anyway, only a dozen or so
> pages in Section 7 are affected. Furthermore, I'm assuming that Linux
> distros have been shipping groff v1.20+ for quite a long time now.)

I think for characters in comments you're probably fine, and any
problems you might have had should be gone as of groff 1.20.  Debian
switched to that in July 2009, and I think we were late to the party
because we had some difficult historical baggage to clean up at the sam=
e
time.  I'm not aware of anyone shipping older versions of groff any
more.

When you convert characters that show up in rendered source, I suspect
systems using the other man package (1.6g or similar versions) may
render them poorly, because it invokes nroff in some fairly na=EFve and
hardcoded ways.  However, they already break in various related ways,
and most distributions have switched to man-db now, or dealt with thing=
s
some other way.  My rough survey of the major distributions for this is=
:

  Arch has been good since about 2009

  Debian and descendants are good as of late 2007 / early 2008 (additio=
n
  of manconv to man-db)

  Fedora is definitely good as of 2010 (switch to man-db), and I think
  was good before that as IIRC they did a flag day to switch everything
  to UTF-8 with man

  Gentoo switched to man-db at the end of 2013, so should be good now

  Mageia has a current groff, but uses man 1.6g with a stack of patches
  (some encoding-related)

  openSUSE has been fine for about the same length of time as Debian

  Slackware has a current groff, but uses man 1.6g without much in the
  way of special patches (just one to make things work for UTF-8
  *output*)

My guess is that Mageia and Slackware may find that things only work
properly for users in UTF-8 locales, but most other major distributions
should be fine.  You won't be the first author to switch to UTF-8 manua=
l
pages; all you'll be doing is making existing shortcomings perhaps
marginally more obvious.  In any case, the pages currently encoded in
ISO-8859-1 won't be very seriously affected, and users of problematic
systems will only have been able to read the other pages with good luck
and a following wind anyway; switching to UTF-8 will probably actually
improve things for them if they're using a UTF-8 locale.  (That is, the
problems that the affected systems have generally relate to attempting
to read pages whose encoding doesn't match that of their locale.)  They
might possibly need to add the -k option to their nroff invocation in
man.conf.

If I were you I would just go ahead.

Regarding your questions in the bug, please do keep the "coding:" tag i=
n
there; man-db will figure this out by brute force, but if left to its
own devices I think groff's preconv will default to the locale's
encoding, so it will only work for some people.

Cheers,

--=20
Colin Watson                                       [cjwatson-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org=
]
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
