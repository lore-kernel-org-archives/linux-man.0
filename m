From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: Issue with asprintf()
Date: Mon, 11 May 2015 22:58:11 -0400
Message-ID: <20150512025811.GA2965@vapier>
References: <CANSoFxs8XW6Z7ph2Uy1wFdeQPOGb7zvwJKExSLoUrMQ94b-8XA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PEIAKu/WMn1b1Hv9"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CANSoFxs8XW6Z7ph2Uy1wFdeQPOGb7zvwJKExSLoUrMQ94b-8XA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Archie Cobbs <archie.cobbs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk-manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 11 May 2015 17:46, Archie Cobbs wrote:
> There seems to be an issue with the asprintf() man page and underlying
> implementation (I'm using openSUSE 13.1 - man-pages-3.53).
>=20
> Since asprintf() is not POSIX, the man page effectively becomes the
> specification of its behavior.

not really.  glibc specifies its behavior in its manual:
	https://www.gnu.org/software/libc/manual/html_node/Dynamic-Output.html

any behavior not covered in the manual is unspecified.  if you want to clar=
ify=20
it, you should start with the glibc lists.
-mike

--PEIAKu/WMn1b1Hv9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVUWxDAAoJEEFjO5/oN/WB4osQAMRhso7DVAFaOoJRSE3nDJfo
qLKeDCm/n3tBCJf9lQZyqmkH2AiJoabJe4o+IaxbDpUkCUNDmMNy9kisZ3gupK+j
MiX0qW/XrBq0lbzWYY7h42nmL17uYh5kE7dwIodIcfCy+KABmLF1TnzsKCPTiwxr
Q3D7JEJ2uIC8vmWU+9EEAlrDHXLmC9cvm898cmAW8lvywiWP76uBY25xW7+MiGQh
VGmWQkfB4d4J9PJZa4M59Uer/y4aLQd/wuFJ3WQPGqccT4ncz/ejK8usnyDJJjbs
AU3fmG+PlRtmmho74uXJ982bEdkDIbySXVcKPPulsMiORHh+aSuMtBRaMndyfuFX
2389wTzIf1b/9GOx7rjumJg2/CbDe2bLQLY8ARWsD0BxV3v2f9mBWvdzKr/Sa9Vz
yW+KUn0T6ktm0FD/FjziAmJPII//mjH0FAoVzS8ZsvRGYOdlBj6Tpo0PyI5Dyb77
9I0XTmTiTBAVTo6YqKOjaAcFq3LtfwIsiS47tAZDOuLKY6trzNrvFHK07RFRZOol
lPTsdPPQOfcr07XIPrpWqVq79iSLBldHJrc7zEDcY1j+snLurj0WhRUcaFUcE63j
TAog45wQ67iOdJS1Bd6pwWLwDGT7K+fnwOBiB0FjOZVvj3qL/L5x0OAnilP9WWFY
md+ID4eYGSPpbOP2PzJJ
=k8HJ
-----END PGP SIGNATURE-----

--PEIAKu/WMn1b1Hv9--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
