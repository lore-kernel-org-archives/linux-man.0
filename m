Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31C5331EBD
	for <linux-man@vger.kernel.org>; Sun, 11 Oct 2026 16:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791737078; cv=none; b=EK+T4R65A2GbZIJdLkSq7aQPC2oZHLMgPPnyES+yizInIgo7XoN56aLsluX/qk6TO/pqX1WPiV0lmBqwHpqV6wwjDGRegkcUz9EAUgTNsnU7a9CJ5XvwGZN3z5G7H2hTsaW3LbnKUpESf5XbrHlVAeK12IIXqo+O1pyxW2Gg1IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791737078; c=relaxed/simple;
	bh=yiPBMNymJ1vYa2WrtSvwhQIwGFWcXPTyNWI/j/g2Tzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c4YvXpGdk3Huq/vDWs7NbDsrNA7yubjjOxVzfPQna0OVOmlC4ZKbtUucwW8oIetPBxP1pioYvLir/NZYTKfy2j9E/OLxiHYipUxjbQqyhM65Jm1VRpLAA9mcTzW87nWmUTkuytXIRpa24gCAR7Fu7qqOKxehB9CdMylHE6o6xE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gEjLGoZt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gEjLGoZt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73ADC1F0089B;
	Sun, 11 Oct 2026 16:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791737077;
	bh=4M+R3DbUiYrt73jFRwCiw/mSlchexensTqTGN0qRnnU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gEjLGoZtoB7RvU+1sbRYKgoCRWtbVG82l9vFFabN8M11974t+t2N8oj7MeEv+Vv/m
	 Hy92n2guaOaXC+fhTA9ELHuEwcsfa8A2sBX+4XBMI8JwDlXhdLNemRUqoC4++6mtiv
	 j23ZKOradNjyaQiOJAoZr0H0p7Ry4bl9L4EQjYvRhSr//Col1guRmJLcSgg/XwISiR
	 iJ5JFqMfj3ZgufAWfzt3X5Bq8ZFk2yYJy0m7X9lrDNrFSyKWxohDWfVORm1utEe15k
	 8NRi3q9px0d82t7CJJO30A0nqjA1Xwn+4nCXHoyoPvCCxO5BmNpJ7Xm0123Y4DeCMJ
	 oxDNZLopV6P9Q==
Date: Sun, 11 Oct 2026 18:44:33 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Roger Olsson <master_pumpkin_@hotmail.com>
Cc: "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>
Subject: Re: Copy-paste error in sysexits.h.3head
Message-ID: <asu8zPOpYc6UK3_I@debian>
References: <GVZP280MB1343F3F7699675A1220DF744A7892@GVZP280MB1343.SWEP280.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sql4nnzjuzllvpzm"
Content-Disposition: inline
In-Reply-To: <GVZP280MB1343F3F7699675A1220DF744A7892@GVZP280MB1343.SWEP280.PROD.OUTLOOK.COM>


--sql4nnzjuzllvpzm
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Roger Olsson <master_pumpkin_@hotmail.com>
Cc: "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>
Subject: Re: Copy-paste error in sysexits.h.3head
Message-ID: <asu8zPOpYc6UK3_I@debian>
References: <GVZP280MB1343F3F7699675A1220DF744A7892@GVZP280MB1343.SWEP280.PROD.OUTLOOK.COM>
MIME-Version: 1.0
In-Reply-To: <GVZP280MB1343F3F7699675A1220DF744A7892@GVZP280MB1343.SWEP280.PROD.OUTLOOK.COM>

Hi Roger,

> Date: 2026-10-02 18:55:58+0000
> From: Roger Olsson <master_pumpkin_@hotmail.com>
>
> Hi,
>=20
> On line 170 of /man/man3head/sysexits.h.3head, the name of the exit code
> macro should probably be EX_NOPERM instead of EX_OSFILE, which is listed
> twice.
>=20
> EX_NOPERM (77) is listed correctly in the synopsis section.

Thanks!  I've applied a fix.

	commit 58f6956b30e53fee2412f317f471f1ad1ea12442
	Author: Alejandro Colomar <alx@kernel.org>
	Date:   2026-10-11 18:43:48 +0200

	    man/man3head/sysexits.h.3head: tfix
	   =20
	    Reported-by: Roger Olsson <master_pumpkin_@hotmail.com>
	    Signed-off-by: Alejandro Colomar <alx@kernel.org>

	diff --git a/man/man3head/sysexits.h.3head b/man/man3head/sysexits.h.3head
	index f104ad74bff6..fa88e88047a1 100644
	--- a/man/man3head/sysexits.h.3head
	+++ b/man/man3head/sysexits.h.3head
	@@ -167,7 +167,7 @@ .SH DESCRIPTION
	 The remote system returned something that
	 was "not possible" during a protocol exchange.
	 .TP
	-.B EX_OSFILE
	+.B EX_NOPERM
	 You did not have sufficient permission to perform the operation.
	 This is not intended for file system problems,
	 which should use


Have a lovely day!
Alex

>=20
> Regards,
> Roger

--=20
<https://www.alejandro-colomar.es>

--sql4nnzjuzllvpzm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrLvPEACgkQ64mZXMKQ
wqkZ1w//d7d/pskvIdd0hXRDfz9xebUVo965OIAKBkzyk77EsoJHRPYLDRawL8Gz
0qZYXSW0JYRq/rRTP/rMLv4L39fZj8VN/gxx6qRpR+bJt5ETHvkhKxHPHC5q18qb
NHVilcSKQu9thFxrNyjpdRinRhUWPQEYbGPxOepeGi9JxbHNFDOcqo1TaqQe3+CE
+95TGrfQ2jnyt1GX5IgqXFd2YQN+KODGivntzBIrjkb9A6e9msVsh/D7mBvapkaZ
L+m2SAOLG5WwfwHnb6o0SV8RBthMea25bePLXMEEiw9JROD0KI7VSzyAY2ofZjsp
vxC7kn+p7mrBwqqcP7CFbKm9cJ/6dUfX1DBZ9hBEGRHDDwktbr2UZQGywCEd9iD5
ekPmEceDpDvU2UyEkcluLwyWWMzAnnwM6etT6TzhouyKUkaiwuaacCKm/lcJLSfy
qHSgnvo08kAJNoTjkbKU2cJtrRTYXqLr/uJobtcQDQhgHDxVC0OrFEs43cN1yh52
zX1tsjeD88qL751Wj7Xr1qK3wILDo+uaZYsn6lY7QTOhPKD6lOhFve8MvFoGNPNZ
fJHCbKr9t5mD2779uix2R3zz4ztEu5Wr3IujYGEua93+hBrVr3/8j4jnoAinm071
OMwx1iN5ikB5PFGtmll88Fp9/Pn5W+28QkfQBWld41z7d6vcCGk=
=iZ6/
-----END PGP SIGNATURE-----

--sql4nnzjuzllvpzm--
