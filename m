From: =?UTF-8?B?RGF2aWQgUHLDqXZvdA==?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: Re: Duplicate utf8 and utf-8 man page
Date: Sun, 18 Dec 2011 13:17:14 -0400
Message-ID: <jcl76v$29s$1@dough.gmane.org>
References: <4EEE1366.3020705@jguk.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------enig3FB7AFCCF9EA17DE54E6CFE0"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4EEE1366.3020705-hus3n9K41k0@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig3FB7AFCCF9EA17DE54E6CFE0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

Le 18/12/2011 12:23, Jon Grant a =C3=A9crit :

> I noticed there are two identical man pages:

There are more.

> Could the utf-8 one be removed? Or put in a simple re-direct perhaps

It's already a redirect (but the other way around, thankfully since it
documents the UTF-8 encoding):

$ cat man-pages/man7/utf8.7
=2Eso man7/utf-8.7

Maybe the web interface could be improved to use actual redirect like
the real man-pages does.

Regards

David


--------------enig3FB7AFCCF9EA17DE54E6CFE0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBCAAGBQJO7iAdAAoJELgqIXr9/gny8PcP/0F/pXKXp4DlgOhxIX14YdGB
TDqjmMmr8BxjtEN+tnGCOlC9MUhLADx/79pC8d/ohXrv4uym11jFv2hdKF40OKQu
xiPAaAt0gl3wYN5j83vr35ZRCc6uosBCvIomAzzZRnk+G8kfawt+1FRtBClWNILp
vPPQFTb2riE1qSbs1RGFZXy3sjAnnom49YaG+nnYCi9tG4Zsx7qcLOVWBEQ/+V/d
qqhkSzG+GEsW8FUFr7xyaMovLIPbfBaXP8w4I2ztbTyaSxbP569omzjinZvaEivL
VIZNmmJrVb5iR1MZgdvMVGxTSg+pmzQITPYJa/2OAM3jn9Sg3xdVy01/S9cj1xv1
4MsUynboItOXbPSsD/MP0p1/SQLBr+MnhQdT4m+B6HDS5i2dIueKa/ubrT6Osxxw
MtuX0Efwaey9Q2JtJBBisrEYfiG1Gubosl6X3qCjPD3S9vbD6Eb/y+aexR+ZGiFj
oG/ONw7r8erMPxZT76ocua7fY1RpkvhtXI5T4UgGemYYcAoQPsuk9EvzObJm6n/i
kq5CaSoOhmOePWbvfeoAvxTIe8a2vOK0d+rz2Wow9vvtSqpQ7/UNyWPVAB4S/LiM
T7vIbdpEZ2grwHRap6uGiLrqvQmtQ02VcTXj4VcyYohQCGtbrsxA9Vi4pcSedbLm
6S2HXH3gUIDJ5zhnqxGf
=lUHJ
-----END PGP SIGNATURE-----

--------------enig3FB7AFCCF9EA17DE54E6CFE0--

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
