From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: For review: newlocale.3
Date: Thu, 13 Mar 2014 04:13:14 -0400
Message-ID: <5663087.ED3DXCYTiR@vapier>
References: <CAKgNAkhAR_LSqav=Lz_u+xJarZgBr4ft-NBeJirmCw7rd4LFSA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart10196815.O4VNCWg1EX"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkhAR_LSqav=Lz_u+xJarZgBr4ft-NBeJirmCw7rd4LFSA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org


--nextPart10196815.O4VNCWg1EX
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Wed 12 Mar 2014 16:47:43 Michael Kerrisk wrote:
> .SH DESCRIPTION
> The
> .BR newlocale ()
> function creates a new locale object, or modifies an existing object,=

> returning a reference to the new or modified object as the function r=
esult.
> Whether the call creates a new object or modifies an existing object
> is determined by the value of
> .IR base :

you discuss the value of |base| first ...

> .PP
> The
> .I category_mask

... then the |category_mask| ...

> The following preset values of
> .I locale

... then the |locale| ...

(side note: shouldn't there be a .PP to start this portion ?)

> .PP
> If
> .I base

... then back to |base| ?  generally i expect the discussion of each ar=
gument=20
to be together rather than split across paragraphs.  if i were referrin=
g to=20
this for programming, i probably wouldn't have even made it this far.

> .B EINVAL
> One or more bits in
> .I category_mask
> does not correspond to a valid locale category.

does->do

> Having created and initialized the locale object,
> the program then applies it using
> .BR uselocale (),

shouldn't that be (3) ?

> Te Paraire, te 07 o Pout=C5=AB-te-rangi, 2014 00:38:44 CET
> .fi
> .in
>=20
> .in +4n
> .nf
>=20
> .fi
> .in
> .SS Program source

this ends up rendering 3 blank lines before "Program source" when reall=
y only=20
one is needed

> .nf
> #define _XOPEN_SOURCE 700
> #include <stdio.h>
> #include <stdlib.h>
> #include <locale.h>
> #include <time.h>
>=20
> #define errExit(msg)    do { perror(msg); exit(EXIT_FAILURE); \\
>                         } while (0)

not sure what standard you're aiming for, but if you include err.h, you=
 don't=20
need this macro.  you can just call err(1, msg).

>     if (argc > 2) {
>         nloc =3D newlocale(LC_TIME_MASK, argv[2], loc);
>         if (loc =3D=3D (locale_t) 0)

shouldn't you be testing nloc ?

if you're just going to exit on error, i wonder why even bother with nl=
oc=20
indirection

>     s =3D strftime(buf, BUF_SIZE, "%c", tm);

why not sizeof(buf) ?  avoids needing BUF_SIZE at all.
=2Dmike
--nextPart10196815.O4VNCWg1EX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAABAgAGBQJTIWiaAAoJEEFjO5/oN/WBMj8QAJHdDBLM74Rhi17xifWQkgfB
lmLuCzKIQzXlr5hSVCv/+9DZznAmdrjFW18vT3w4if3ogQzlp8sxaAK3ebw2nbON
aLG8EyixaO0ve03JtT6n1oL1oba+G+EvDzKR+msjXo5hCKSuqbdS+2nTChkks+wR
2b/lI9pfigqt0lR2RXWHNDCt3lnevd6vwEh4TeCgNUx8p7aPfUNgLiibohzrP62n
IvBFazpUWM5jAZeMzazZzG0a2yxHvQsb8V2hUrq3fLcotObMa4jX5K70gvU6sOha
xrGIWqMJPn+RllwPZrP+valuD8v7L9L7RRQOEnMk4ZuE6AGWuHYNaKQFbxwHmoLE
oQC59OwBZa+ugb7GL3dX/FVajvCeGuOuIHSJ71WMdsEgp1Z8f0xRRRMD6dx+Ihsx
z9jkaMN9gFWSrNBvlp/PB+RpyPjLaEPu0+0mmgiRlw3qLCrgvgY7k2u4H5OPdBTx
QZFnIfsPf/Tz6BwBx05v1qCn37sMIMVQWhQZXMoWipEhYXaXi2v9+OtKtwnP4+mx
F/b9XLusSXAtD7U0hdW0IK6+nfmDvMTVNBrytvN95eISGjtiwIxQs+hoIWO1P9OB
460sNIUCkS+VpyTAqC73KQpSLqn6K1M5EDv3u8w8AXWAWqKhAdOvqEdWsBsdnNE1
D672evRb58YWKShyzEd8
=R1ld
-----END PGP SIGNATURE-----

--nextPart10196815.O4VNCWg1EX--

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
