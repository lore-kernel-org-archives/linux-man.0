From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: "Writing" instead of "Warning" in dlopen(3) manpage
Date: Tue, 31 Dec 2013 11:19:54 -0500
Message-ID: <201312311119.55754.vapier@gentoo.org>
References: <20131231124209.GA4814@darkstar>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1569038.sZ6tTpHMFC";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131231124209.GA4814@darkstar>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: noname-CuI0ZDT4mYnsrOwW+9ziJQ@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--nextPart1569038.sZ6tTpHMFC
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Tuesday 31 December 2013 07:42:09 noname-CuI0ZDT4mYnsrOwW+9ziJQ@public.gmane.org wrote:
> dlopen C code example contains following comment:
>=20
> /* Writing: cosine =3D (double (*)(double)) dlsym(handle, "cos");
>    ... */
>=20
> "Writing:" should be replaced with "Warning:".

both are correct

however, i wonder if the comment should be inverted.  the latest POSIX spec=
=20
requires that the natural cast work.
http://pubs.opengroup.org/onlinepubs/9699919799/functions/dlsym.html#tag_16=
_96_07

Linux man pages document the normal Linux environment, and that means POSIX=
,=20
not strict ISO C.
=2Dmike

--nextPart1569038.sZ6tTpHMFC
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJSwu6rAAoJEEFjO5/oN/WBytIP/2TZVvvv1pLDR2As1lvDeFOT
yLtGVV5xsdlT5OGUaP41CHKrRvrA3tluoaGhSHb1qodKWAnADZfrzTAJ2/Jjjp5D
JcP1ih2vsK6y1yCcJ3Rq0mOgCLvC9pDZpqn/NhfoChZvb9D84XRqEVpTygS3hmM+
yDei0EO5UwQO4MW78FEw7OZDug4+1fYuc1aWRKfeb/GzM1RQOlawX7zY3Q1ryy3c
jyaf2h0/s0iFVHNDkujxGa8FkujJvtN+yxk3ZigRK6MRsO+9oV++1N3w8XveJhQM
UWOcIuqSJYmsXqXa9TFCH8uEI+0CeOYH/JcPCsh4W1HFKn3owBMMBT9yyf9Kyx9+
lTVzdbR2rlKJlC3LYzjvMVXDbZE68fyg7jvLk6Urk0bLncLEwW+fzZoxaJCJMYUS
BfjSdHIae1oOgFAkykxpspBHaMcPX03aB48m6KmXXwBM8dBkxrP1BkAq0FV4T4QF
3pDlYGG/NW9U+ztjlLOt45WTCm/WY+hOis3ceSd+GYfLcl0jaiBLQ30x6A7b5d6R
gVBD6eCW4TLhAm2hL32eFH3r1wr3244he9Wh2TblsXMUXGjA7DD3JRG/rfjG5D1r
mIMPC3ftmViSrTfAb++fNvT0lLvY152M0kdlZtv9YklucW+bFOtxitGpKeP90oST
q2x8xpCH0cJwVfQUJq4Y
=4R1x
-----END PGP SIGNATURE-----

--nextPart1569038.sZ6tTpHMFC--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
