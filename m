From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] fts.3 is not available in LFS builds
Date: Wed, 19 Mar 2014 01:56:23 -0400
Message-ID: <8628933.tn1CQP9rHn@vapier>
References: <20140315135416.GA10430@infradead.org> <CAKgNAkinnsvoXT_FNxaS7L5Umo6va8OCVnTv-gZ5vvVSFi2--w@mail.gmail.com> <10506751.CXtlUKOUPc@vapier>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1519992.1NLCRh2DvF"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <10506751.CXtlUKOUPc@vapier>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org


--nextPart1519992.1NLCRh2DvF
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Tue 18 Mar 2014 23:12:45 Mike Frysinger wrote:
> maybe we just ignore the issue since fts.h is dead anyways ?  just ad=
d a
> section to the fts(3) page recommending people use ftw(3) instead ?

i might be completely off on fts vs ftw.  there's discussion on glibc l=
ists=20
about maybe fixing fts to not suck.  perhaps we just link to the existi=
ng bug=20
on the topic ?
https://sourceware.org/bugzilla/show_bug.cgi?id=3D11460
=2Dmike
--nextPart1519992.1NLCRh2DvF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAABAgAGBQJTKTGHAAoJEEFjO5/oN/WBJwoP/0qA2dR8OIyczG0oCYfXmFG1
wKWfx9l6K2qj46E3xBGCwgNn8En4qpNbYvK4+8Ufqme4yApxm/CtlPYdC5z6DM6U
CDP53UA0Hilz5P6+8rYc7ppm/MJtiU+JWR/nTN6AGJlNJd1d0zgtwqu1nKpLrjhd
1HXGwrGPsR805zo7iU6JVfZGphSyu7lsnyrBzsKQjqHy/dBAnJnCa4y+bUiZsl+1
1VQvLPj0PDi3XSs1I3QcV2L3goSg6WeMCmcK114ON6QZ/ezaUe1FaZQvZNl+oNmv
l59dUAXy9I5nUOo/V4YpkLHH37qqIqwma9Em5KA2cLgf0sr+SPXYulTfoqEXlcEI
5OE3V0l8Jxy/tL6sHaWko+TQbL8Rrr8eTB21U4za64dHktmdiYC/wxe1gPlKn4Nq
nt1U4wbMZCSHXMuccoRcsFhVTwfcw1QzLqRuZij3czaWj4rFR5TeaMOXO1DQGRVz
FhllHh8+cQR+lZaTVeZ+lxTa+IXuR0BHE5aHKb04dwukAYnkiYdvVyPXCn10GYqZ
cCBveQjtT8sC3eouLMChP3AHvZJ5qTtMxs0vPR4+OdjMU9cvVlZoO6/kqIN0MYWT
MX0DxPCGylIKvO6rmgMIn6KPLmqgBiwLiuABA6kYnqSrwrhk2wgPUuNbA4QRagD0
JV8KPMGXmYfMiK9SmS7a
=cMhh
-----END PGP SIGNATURE-----

--nextPart1519992.1NLCRh2DvF--

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
