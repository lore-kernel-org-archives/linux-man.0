From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: statfs.2: f_spare[4]  or f_spare[5]
Date: Fri, 31 Oct 2014 23:56:21 -0400
Message-ID: <20141101035621.GH26840@vapier.wh0rd.info>
References: <5453FE6F.3010501@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ewQ5hdP4CtoTt3oD"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5453FE6F.3010501-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jan Chaloupka <jchaloup-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--ewQ5hdP4CtoTt3oD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 31 Oct 2014 22:26, Jan Chaloupka wrote:
> there is probably a wrong number in description of statfs structure. In=
=20
> description section, struct statfs contains as a last field f_spare[5].=
=20
> But the /usr/include/bits/statfs.h itself contains f_spare[4]=20
> (glibc-headers-2.18 on f20).
>=20
> Looking into glibc-2.20, there is f_spare[6]. Looks like the structure=20
> is gradually evolving :).
>=20
> Inspecting upstream history (gitk statfs.h), it shows it was f_spare[6]=
=20
> since 1997.

i wonder if we should strip f_spare from the man page.  it's not really use=
ful.

the __SWORD_TYPE should probably be replaced with __fsword_t, and drop the=
=20
__WORDSIZE logic.  that gets ugly with syscall ABIs.
-mike

--ewQ5hdP4CtoTt3oD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUVFnlAAoJEEFjO5/oN/WBYQ4P/2LWCZGzG4sOPNhJZhzL11xM
Fu0F6eSJdHy6qeuiNGhZMNlyeME+OLLjvnGz3xi2bcs8gjyOhoyiHtXhziCUGVPM
JUAx7BNqu/tsxLm0SlJH+hiUZU8G9rLX4+u0L29sGLO4Mn7CgEnUCv0UJ+FaGuLQ
FGM1GS8T8H1QfFvD5DnFlDYcNn1LBmraHUrKYrijtwCOG0UcJEN5FNtjUaM0ssYc
TLEAWCB8KNjUNEmIbsjZMtDI2vINm9dn3X8FAY1aNhsEuPOyicSaunsIOSOlhMmu
ap/plMVB/QEuWjEbEzRPO6K878z1BdEXIUe2Za5Kvks7rAP4D0Z2Qa/seOJTczRs
780hoBrU7KGd2w/IFimJ1cJsku4ZvbrhEIv0DaMxCGcCWOuPsK4ZIVTsgyDFImRP
hS65e9gwkK5rwvRFBfmJ2YUl8F3KaeiQw/eJU80DllQGtQoJy4euHeGPZXVslAi9
v04gXGGCVtBAZWPh/L7SO6tdNrQkX23L8uHc9BTJgc/bQ6HykE7+khLpyEcBtG37
BqYeZpXigd9WwRWeMVT5dDO6KYskEzK/d8gzvEfnFdj+kXmMh1lEhnAHQnbBd7RE
/UiAphMgiYRW82Tyh2mlSoM52nQ3qedYtHeqMcsfsJKpibF2xpetvxR8hRpDqGUy
rf2hM2G3Nq3QT0f5w7g8
=bcoS
-----END PGP SIGNATURE-----

--ewQ5hdP4CtoTt3oD--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
