From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: "Writing" instead of "Warning" in dlopen(3) manpage
Date: Thu, 2 Jan 2014 07:33:10 -0500
Message-ID: <201401020733.11627.vapier@gentoo.org>
References: <20131231124209.GA4814@darkstar> <201401012306.40108.vapier@gentoo.org> <CAKgNAkjYTw3_BGQKwVNyfs-rLmxgVMiH4hBy_gBm=9DpvSHnFA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1647523.FDlxenBaCB";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkjYTw3_BGQKwVNyfs-rLmxgVMiH4hBy_gBm=9DpvSHnFA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: noname <noname-CuI0ZDT4mYnsrOwW+9ziJQ@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

--nextPart1647523.FDlxenBaCB
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Thursday 02 January 2014 04:33:30 Michael Kerrisk (man-pages) wrote:
> On Thu, Jan 2, 2014 at 5:06 PM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrote:
> > On Wednesday 01 January 2014 20:46:59 Michael Kerrisk (man-pages) wrote:
> >> Nevertheless, some compilers
> >> (e.g., gcc with the '-pedantic' option) may complain about the cast
> >> used in this program. */
> >=20
> > three things:
> >  - i think the ISO C standard is required to at least emit a warning
>=20
> Yes, but it's not quite clear to me if the POSIX.1-2013 is meaning
> that compilers should not issue a warning in this case. Maybe I'm
> misunderstanding something, though.

true.  in this particular case, it's probably not worth being super pedanti=
c=20
since we covered our bases earlier on.

overall question: should the new comment block live above or below the exam=
ple=20
call ?  it's currently below, but i kind of favor putting it before.  i kno=
w=20
as the content flows, the current one makes a bit of sense (show the right=
=20
answer, and then as an aside, mention the portability issue), but the comme=
nt=20
is specifically covering this line, so putting it above the line it is=20
discussing is a bit more standard i think in the coding world.
=2Dmike

--nextPart1647523.FDlxenBaCB
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJSxVyHAAoJEEFjO5/oN/WB3LQP/R71w2F5KC3cZiZ+MH/UieNk
xM4rCpdzZH6u5LPFp/tXj1D7SpFAWDIyGd5IlFyHESrEGIRAgfGBzIzj/W/sgaxm
iNyAjWwkdbLkySjuGu6b3V56kHc+VS1nfQxuFup/zw9MLNmFpNFtb6KE9jhqj6Ul
e4vmK5KNzPngHa51DJ7F4UmCu6tQeQmgMXNZToH8bTg3sQPahPSNaERD6S62HpIF
WlPa6cF2rZhqBhldV+PxpTltoQS4W7p2/UaizB1hxkGuqmlHdF4DY2w7VPRWikrw
60HM3sYxxS5qC09P5H2YoCOJHRbEGpd0EFFu2q2pRxHSqqLSE6GVNhROnDLDlHuf
PgoLmJIpKH4il1BFd3CcvXUn867+889SO4pCO4cvdPX4aIq9DYbM3vGNQVj4g6rr
7eEUQ+oaaXM3Y1+Zi1o+kI+Gshl4N7fMyY9jcVvS/71yxJ/s63DuW13b3QBBkiZG
EavM50iWKCbsBw9cQsGqEg+m8g8cgOMookX951MoDfHGEIvAs+E03v/LWmN4EZmV
mZkirClNVKGpJ3wREZE4RmcofuaHimDm/IBkpyOHrtYyASFIRLJDN/dJ5h3QsT9B
aIAi2b6lFZgWu7rbS49QnfpvK5eBOp1epyX53RlN00UKMMjaXtnoky0f3eF9bl/F
AR4oM9qYlL4UBYdiaOjV
=ZcAh
-----END PGP SIGNATURE-----

--nextPart1647523.FDlxenBaCB--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
