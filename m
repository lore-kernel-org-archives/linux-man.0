Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122673AB47E
	for <linux-man@vger.kernel.org>; Mon, 17 Aug 2026 09:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786960397; cv=none; b=YMqsICk4qO9KUJm1pBtrttmdVTkEEQOGFncylTmOQ7x3VS0TVQW3yymw85rDt0AVhJk1TU+Px3xZ/fsPaIruRjFpq68ANylzPHzul5NP952eOvDJiZgFsck5sBJQPBgB2PajPlRMYof02Y8YKIZ38xbxU/NHp9NyasRiHYQfKbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786960397; c=relaxed/simple;
	bh=t1lSHLWCCVatD5coP1dXEmKfWXMOKSVq0gp+tnv23mY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jPutLQDlL9D2sRYujNDToPyWqPZFuVp9m6uXvsOCwYQALOqQzrxid0RyJJPFjuyKoJRmkHniF/dfd8DoLXHilprAD+s+2hSbiyZL3oY+Rxdix7q8oXQSRB/rvMh0163JNRzRCvEO57yub5khYpxYtlWuWA0Gn+cWj7yoXtea16E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MfmW3OPa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MfmW3OPa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F20AA1F000E9;
	Mon, 17 Aug 2026 09:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786960395;
	bh=xKcLPjLuR+t91O4SpWm87xynU7bHlT2vPKxhCLj5OC8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MfmW3OPaVSJwlukPTlCbP3OJ1cKv/9t4zhfKpdJ2SkVxBUPUU21hfcOY5KhkLLTDT
	 ifZYmx55cFnWg5SErfC5XtWYAXA/iPoPuvroqIqElSaFjjyCgoAyDERC5osMJ8Y+x9
	 ePhSz2FfI6ofWFtaU+SPdbh7GMoXULlNEpIc8AaYFx+b9i6L28a1WTp79LX/bk08yZ
	 Mhzc/UcDskoBn67qLyb/f1rERVvHa1ZDne1DHHP2vMsBaCeGI2iiEXBMBSOvezN/GQ
	 hLoBYlrk2EVELSsoeYujsfGIxk6J7nknQpgLbCPrmAar2e/BuFcSXvZ36+3IzHrHeM
	 AFdVTXEsGSybw==
Date: Mon, 17 Aug 2026 11:53:09 +0200
From: Alejandro Colomar <alx@kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, 
	Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>, Guillem Jover <guillem@debian.org>, linux-man@vger.kernel.org, 
	libc-alpha@sourceware.org
Subject: Re: On <asm/termbits.h> and <asm/termios.h> usage in man pages
Message-ID: <aoLY9Oko02NzSsuV@debian>
References: <aoGk8FSBlwYAmvu8@thunder.hadrons.org>
 <20260816121505.jyz3ynrb3rxlvq6h@pali>
 <61b8b3f7-9c33-4704-a0ba-29e77a5e3cba@linaro.org>
 <20260816131955.lbuwrp32eyq4rt4b@pali>
 <83BA7F0B-7318-4F8B-B59B-1F508750E276@zytor.com>
 <aoLOL-1JRTElewuP@debian>
 <919B6782-3170-4A69-8431-1576526CA33A@zytor.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jngtsmc5nnzen244"
Content-Disposition: inline
In-Reply-To: <919B6782-3170-4A69-8431-1576526CA33A@zytor.com>


--jngtsmc5nnzen244
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, 
	Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>, Guillem Jover <guillem@debian.org>, linux-man@vger.kernel.org, 
	libc-alpha@sourceware.org
Subject: Re: On <asm/termbits.h> and <asm/termios.h> usage in man pages
Message-ID: <aoLY9Oko02NzSsuV@debian>
References: <aoGk8FSBlwYAmvu8@thunder.hadrons.org>
 <20260816121505.jyz3ynrb3rxlvq6h@pali>
 <61b8b3f7-9c33-4704-a0ba-29e77a5e3cba@linaro.org>
 <20260816131955.lbuwrp32eyq4rt4b@pali>
 <83BA7F0B-7318-4F8B-B59B-1F508750E276@zytor.com>
 <aoLOL-1JRTElewuP@debian>
 <919B6782-3170-4A69-8431-1576526CA33A@zytor.com>
MIME-Version: 1.0
In-Reply-To: <919B6782-3170-4A69-8431-1576526CA33A@zytor.com>

Hi H. Peter,

> Date: 2026-08-17 02:23:39-0700
> From: "H. Peter Anvin" <hpa@zytor.com>
>
[...]
> >So, any suggested changes to the manual pages?
> >
> >
> >Have a lovely day!
> >Alex
> >
>=20
> Didn't we talk about this about two months ago?

Yes, I pushed an extensive set of changes to the manual pages, splitting
termios(3) into many small pages.

I'm now waiting for your patches to the smaller pages.  I've replied to
that old thread too.


Cheers,
Alex

>=20

--=20
<https://www.alejandro-colomar.es>

--jngtsmc5nnzen244
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqC2gQACgkQ64mZXMKQ
wqkM1RAAluRIraVu3gFc4k8MNM/tPiHIan3h+4eVVYUEEmaHv0oYZ2yZXp/rnQqT
npujQcX5gj2pJsd/JyuXSODHPwQDbgCo5XWjlKWnvDXvAzK0ZLrvzKoJxS1Ctb7W
CViUZa/nY4EXt7BAziguG4F86r932gIDbFl8QghkbT53dT8XtesDisgd62ZTHINp
OyfSqiUoCXeq1JyCaTEvZcsWaxOXJnifiNXKxK4p//ZDctKRlnOzUayQS68ZrXrc
cyR7LPp5c86SABk3ECRx82FsxHNAGBEE5b/a3AIAncm3yN3J7B1k2K8tst3Y+4wS
WjOnsitdVB9Sn6LO6gl6HwJl3vapbcwffZXJIATGbA8hW3N9CioWLnDfDUMLAtf0
/YuhAD0E1G9Gavw3/ciLUn74NO7T9ArwzgSMNro6heksSMzxcdUv9NBWHJFy1IJU
Fz/B5SfM9hg6PXakiMo6LML4JRhi4+HHKyHpmTNKk0HU68coiEODMaq3PSzP9KeS
SrSfEqHb/T6Rm5H6vbhd4ZxvAh/MwDxfFslCYPsQjDHpj1xuPny2p35St59kDHOG
3myY5xuT/TDzoQo7wv0Kw6t4hQ/eX0fK4d/P9YoGkqRulAYldE0uJaOcn0OmhbJb
R/1ENV4QjYBevW7liRivVpMOTJCveAE1/X2hV6Hk9C0oGdlFuRA=
=Jkm2
-----END PGP SIGNATURE-----

--jngtsmc5nnzen244--
