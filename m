From: Ivan Shapovalov <intelfx-Imz0WJRl3c7a5EbDDlwbIw@public.gmane.org>
Subject: man-pages bug report: gettid(2)
Date: Sat, 13 Feb 2016 11:02:38 +0300
Message-ID: <1455350558.1727.3.camel@intelfx.name>
Reply-To: intelfx-Imz0WJRl3c7a5EbDDlwbIw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Wt4sSM/72TrcJsGARLfN"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--=-Wt4sSM/72TrcJsGARLfN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

the man page gettid(2) (as in
http://man7.org/linux/man-pages/man2/gettid.2.html), as well as in
release 4.04, in section "NOTES" says

-its thread group ID (the value returned by gettid(2))

which probably should be

+its thread group ID (the value returned by getpid(2))

--=20
Ivan Shapovalov / intelfx /


--=-Wt4sSM/72TrcJsGARLfN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJWvuMeAAoJEHveF8jk4w6dxagP/iOEk7lZOd+5hMdLIAMa0zyb
fOk8lPIGaJCkIu5sebYvJM8dTlPcSyGOW7gFOxI777z+QC4iXOSV7n0sOIZOiKed
todUlSw3k8cyFHWbOqMCdcV792DV1teQzRCUmmk41zm+q3M72Ft/XLUmETURa3hL
JP4X/9TTSO89hiEjz2tXuwovb9QEELK7AbnFhbzMrLJoLs2d0v4zRV90yEv7tqYw
QusPT9gemZiNuHLAivFMDOXfarWAsbaHta8A3B3lg1rNT2I90hzihJomMCJXx5J1
QbK3CnR7Y/QtXShobfdLyZugb9FcD0sAC7NR5pJIk6MPoFDBLIzxzIPyw5a64Mfw
9orD4Eon+Fiuosj27EEgrIa7huCc+vhxJA8SMutorylaGr9+OlARvP5Jj7KsDsi+
ciyrF0C68AGyBSxn00VQ/I+GwvpxCLHuAEzuD5cdT/c817MnSFxjw6uCm0IRsk9+
pHoZ8ZTpAh1USwKRhAJxrJ0+zTzr4JMdy385ESiju6yvbGhf3JtWYsMJFqs+YfMA
ReWBh70CbGkCzvUMe81hs2HZAM3n97P+b6h8Q+izz9C2nB5JxEpcQ24IJ7GlomQh
mbcHgovv0omHYoAjbNuvpi6DN8UOGA9WJwSV3cfKQgxfZ6mfPw45NhjUlVubALqP
5UK/KwK9aDQexHXpkzLZ
=hDRO
-----END PGP SIGNATURE-----

--=-Wt4sSM/72TrcJsGARLfN--

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
