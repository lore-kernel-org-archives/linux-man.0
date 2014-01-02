From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: "Writing" instead of "Warning" in dlopen(3) manpage
Date: Thu, 2 Jan 2014 14:45:16 -0500
Message-ID: <201401021445.17586.vapier@gentoo.org>
References: <20131231124209.GA4814@darkstar> <201401020733.11627.vapier@gentoo.org> <CAKgNAkjeDs21b36mULBF6VFQeoKeVOEDnRj=7GPTmchci-xDzA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart3710963.biXFmdzYSt";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkjeDs21b36mULBF6VFQeoKeVOEDnRj=7GPTmchci-xDzA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: noname <noname-CuI0ZDT4mYnsrOwW+9ziJQ@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

--nextPart3710963.biXFmdzYSt
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Thursday 02 January 2014 14:20:50 Michael Kerrisk (man-pages) wrote:
>     /* According to the ISO C standard, casting between function
>        pointers and 'void *', as done above, produces undefined results.
>        POSIX.1-2003 and POSIX.1-2008 accepted this state of affairs and
>        proposed the following workaround:
>=20
>            *(void **) (&cosine) =3D dlsym(handle, "cos");
>=20
>        This (clumsy) cast conforms with ISO C standard and will avoid
>        any compiler warnings.

"with the ISO C standard"

>        The 2013 Technical Corrigendum to POSIX.1-2008 (a.k.a.
>        POSIX.1-2013)

i thought you wanted to avoid "a.k.a." ?  or does that not apply to=20
parenthetical asides too ?

should all these random preferences be added in man-pages(7) ?  off the top=
 of=20
my head:
	- userspace vs user space vs user-space
	- a.k.a. / e.g. / i.e. usage
	- NUL usage (or lack thereof)
	- HISTORY should be a .SS of NOTES
	- wrapping based on periods/commas
	- preference for 75 cols

some of these could even be checks added to scripts/ ...
=2Dmike

--nextPart3710963.biXFmdzYSt
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJSxcHNAAoJEEFjO5/oN/WBzgYQAN8502xxwqOWSZu7gbnXIVB7
BYWaWK6OICZjjQwu4zmidiY3/jxeHwSzwvH4GqLYNExGzUXs/HHI6sMAW9PXxET2
OtHWAfqDJeoUSLGK4pe0CdQ8jBZZu+zv1z6JiOFt3EbI3bDOHoNTRv7x0iWdaQiQ
OvQgWhCmG8mjsG4myTv191//cpICk83cKuze5cKjDRjRK3W1cI98hs4Rs7rfAJhm
I4M2LzG/X67U7RJDjMAlu76Zj1pXekTqFyOjzc5FoEKMGBGYufXL9BHpG9Q1V39x
u8YoJlVCrXgs/lcZt/TImL32skkuABD1Zd5Agko/I79fQ+MyeovwIUtByGV3GHoS
L+NgeauAfkp5PMP1ZSktsQkvNvCpahr6nUUA3m8ldpOB/FiWBgiIXbkhkFzn9I9X
wxh2BDL3z6HPbFH0j+yB9Zz/lKng5GSXL3DG149e6ca0nWKmoZv9ivNzANRbnKTt
n8dENMJFrEy1XyrjksmqRdPFIwI/q68sjpxr2g4w9ZfcnZ7AdaZZFKoNtGlI0+MD
dWokYEzqGIVcczYShc1QBshq2i+E5vl7sqk6jhB1F1UqzXu0PScRjl+KqhlS4w6X
1CkCCmj8SEen4wzmRc0PJr1Fv0LHpQsN+3ZiQRM5QsBe/N7WB2SgUS9iOGdO0uym
8W0mrpZ3z/v4aMh7Qt/P
=NTh9
-----END PGP SIGNATURE-----

--nextPart3710963.biXFmdzYSt--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
