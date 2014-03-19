From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: should "man feature_test_macros" mention _LARGEFILE_SOURCE?
Date: Wed, 19 Mar 2014 15:15:17 -0400
Message-ID: <10667348.a89NUKrILg@vapier>
References: <alpine.LFD.2.11.1403181544010.5574@localhost> <4257256.dYt9XWSnPY@vapier> <53299DAF.20201@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3650015.OlR1QXFGdH"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53299DAF.20201-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "Robert P. J. Day" <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--nextPart3650015.OlR1QXFGdH
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Wed 19 Mar 2014 14:37:51 Michael Kerrisk wrote:
> On 03/19/2014 03:48 AM, Mike Frysinger wrote:
> > On Tue 18 Mar 2014 15:46:43 Robert P. J. Day wrote:
> >>   just noticed under /usr/include on my fedora rawhide system the
> >>=20
> >> following:
> >>=20
> >> /usr/include/bits/environments.h:# define __ILP32_OFFBIG_CFLAGS=09=
"-m32
> >> -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=3D64"
> >> /usr/include/python3.3m/pyconfig-64.h:#define _LARGEFILE_SOURCE 1
> >> /usr/include/features.h:   _LARGEFILE_SOURCE=09Some more functions=
 for
> >=20
> > correct
> >=20
> >> standard I/O. /usr/include/features.h:#  undef _LARGEFILE_SOURCE
> >> /usr/include/features.h:#  define _LARGEFILE_SOURCE=091
> >> /usr/include/features.h:#ifdef _LARGEFILE_SOURCE
> >> /usr/include/python2.7/pyconfig-64.h:#define _LARGEFILE_SOURCE 1
> >>=20
> >> but there's no mention of "_LARGEFILE_SOURCE" in "man
> >> feature_test_macros". is that assumed to be implied by
> >> _LARGEFILE64_SOURCE? it's not clear.
> >=20
> > nope, none of the three LFS flags imply each other, nor should they=
.=20
> > they're related, but orthogonal by design.
> >=20
> > i could have sworn i saw a description of them in POSIX, but i can'=
t find
> > it now.  the GNU C library manual covers it though:
> > https://www.gnu.org/software/libc/manual/html_node/Feature-Test-Mac=
ros.htm
> > l
> >=20
> > here's a terse summary off the top of my head:
> >=20
> > _LARGEFILE_SOURCE: expose prototypes for new funcs which POSIX got =
wrong
> > originally.  e.g. fseek & ftell utilize "long", so fseeko & ftello =
were
> > added which use "off_t".
>=20
> Thanks, Mike. I'd forgotten those details.
>=20
> So, as far as I can see, _LARGEFILE_SOURCE is largely of (ancient)
> historical interest, so I don't think I'll bother adding it to the FT=
M(7)
> page.

would be nice to document it ... i tend to get more confused when somet=
hing is=20
left out entirely even if it was done on purpose.  especially since it'=
d give=20
us the opportunity to discourage people from using it and drive people =
towards=20
the One True Way when it comes to LFS flags.
=2Dmike
--nextPart3650015.OlR1QXFGdH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAABAgAGBQJTKezFAAoJEEFjO5/oN/WBjZgP/iV9NS20t6dYEuzKAApfYaNg
PZ4bayaDDdT57BimZ4xHzSFcL1W1lDPFc/Z9Y56QOdYrxFAi0/HRUegBX86kjAYD
3NVKucWWwFlmY32OA3OIBXelEUHFDHoyHCz4KrxpBhPK+UZ0p8X5qe8qn8RFYcEy
U3jX0EkGWojEu4sTQx4i5j1213apsvGFFnxhFn44UNwORi8TEyWOtRsL0JR1Xf2A
9Yjuj00UANFk2GMMzJRnO5Zgk1nbH3F/ZJa+7eExRT3uhu9TsaUaLBDskeKM57mv
YPV6PJz/oUTRXg24m4AaNP6fHwa88S7QCjJ+dBGBiBvfkhKd3HFdq/OTyA4zZ9ch
ATS/pSK2tCO+fMrm4qCharwXRM6xaraI5Xrk8JV7ijzzxY8Zp4jgpSwRQPX5XeTd
O+4UGlJSsgCuAq2h05J8tvIJkG7VCAl9jsKGO0hM/ogsfMvL9Zp3LcsR6fqbL7U9
cadDPvLMosStFmvY9bz6mLgKwjqr8U++esUjxGO91S4T1v0E49Ei3m3U2tW501Ax
D/2CvG6cKIzH4Oj2+ZzNFS9cIBRJHEilJ0teF0z0E/Fm72jW/S/EpRP33IiyES+n
M17mafdxCrSGCLINZFg/lUCqg5j7J3KiFyzOySiipyRYU2amVnfjOXW4AXYec577
uu0qgClg6J0+SGbdoMUt
=IgVV
-----END PGP SIGNATURE-----

--nextPart3650015.OlR1QXFGdH--

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
