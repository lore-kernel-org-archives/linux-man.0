From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: bug in dlopen(3) man page
Date: Sun, 09 Mar 2014 19:25:20 -0400
Message-ID: <15509951.scfVQB3357@vapier>
References: <20140308213059.GA25275@danbala.tuwien.ac.at>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5239035.qHUVBHDG72"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140308213059.GA25275-k3ZVrZPR2RPzPE21tAIdciO7C/xPubJB@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Klausner <tk-JlXkzPh5ucKzZXS1Dc/lvw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--nextPart5239035.qHUVBHDG72
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Sat 08 Mar 2014 22:30:59 Thomas Klausner wrote:
> There is a bug in dlopen(3). The NOTES section claims:
>=20
> "The symbols RTLD_DEFAULT and RTLD_NEXT are defined by <dlfcn.h> only=

> when _GNU_SOURCE was defined before including it."
>=20
> However, this is not correct.
>=20
> From dlfcn.h on a "Gentoo Base System release 2.1":
> #ifdef __USE_GNU
> ...
> # define RTLD_NEXT      ((void *) -1l)
> ...
> # define RTLD_DEFAULT   ((void *) 0)
> ...
>=20
> You can verify this by compiling the attached program. For me it give=
s:
> test.c: In function `main':
> test.c:8: error: `RTLD_NEXT' undeclared (first use in this function)
> test.c:8: error: (Each undeclared identifier is reported only once
> test.c:8: error: for each function it appears in.)
>=20
> It works if I set "__USE_GNU_" instead.
>=20
> Please also check the "Glibc extensions: dladdr() and dlvsym()"
> section, it also mentions _GNU_SOURCE.

the man page is correct.  you must define _GNU_SOURCE before including =
any=20
headers.  you must never use the __USE_XXX defines directly.

see feature_test_macros(7) for details as the dlopen() man page referen=
ces.
=2Dmike
--nextPart5239035.qHUVBHDG72
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAABAgAGBQJTHPhgAAoJEEFjO5/oN/WBHiIP/jOYareX4EV33bjVdCL1j4g3
/Qnih98RnLkmtDTfp3jqo8a9PtftgVSZfKwBP+qwppLSh6nI/gIbvRCi90u4YA7S
nrnI6o9knG1IeLR1emC/1DP2i1OZKfeikFmoWi6V/XjqzTZTIk5y+YPCqHglNL0I
QR2iNp5YKsftdrHqmwzI+RkDqCbd2Qs4NDFFFZFBDgo63CmxjzjBYxXMck138x2r
RHgVPQpI2wIsEO5aIBe468vL918X0VlKMjwQ0aouwW6ZNfmULPiBrLpKHy4ojnHY
ivvEV1ghmasg/Y/z8g0pWCqiMQqfGxTu8jIDBZXUKefX15osHPPg5UrqjMNdKOZi
0sRwRCtzg18OviubgUwkovtsIge/7/un8M8nyrdZNWmgfmDOMPwBX8COB5JkMG7H
NEHIrlELssR3hY2lxSGliCxg3KkzPbW6EwRNB7JZeoP1CE0cjoMDkcKrmo94OyF/
VVXKPSPPURwIPqcj6vQs5Sm68kiSZtPTOnOJ9r4UzNuROejH6g3Wrd1AhKNIuafK
VDaXTtYRTlk18xNC12Hx1/Y+oW55NNdT3iSReqarj/ZqRD/BFUlyIXAUrDqoxI9Q
CmElNx9KPJ8eyRiYXFrXwOTYMsvmE9zEIeRoUc1vUagnvx+HO+b3N3W0TJXdxGam
gJN6XlV3FYSu8pTypOAA
=xhXT
-----END PGP SIGNATURE-----

--nextPart5239035.qHUVBHDG72--

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
