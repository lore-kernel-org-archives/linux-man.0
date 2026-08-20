Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D413C479861
	for <linux-man@vger.kernel.org>; Thu, 20 Aug 2026 19:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787253768; cv=none; b=iDTjE++M7vJVdrwqXfKCSU05sjqXxR+6A0eL5oeZ7nFcBKrNC4ZyNU9NpbXF26DzRbN7HBfYyZpVAVKm7QUFBmfU4UHyKJJbA7Npx3BXysIoju8o7ISrulQBg39pKBpDE1eGCHrS7tRPHhiOelUXxNwqwjPx7lPov3RAtm0CF68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787253768; c=relaxed/simple;
	bh=huBM7zkdR+Kte1jP0gO3h4+S1W2SZaYFG8hf+7CI5Zc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ewz4ElbeRWsE95Ev0uRIiuubGrZBPAdvC1Ku0glzFnz1nsi9SKMQrswyIKuAP/bY+x7Qzn3mZCw0efhHwSUG2LTAogIBlAvQG54wHJdghQr3BumexbSIlvhSSc1ylSz5Mzl5wfsC1cuu/PzKTTtYGgwX+AUggdPW+oriMYKvMt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OLiEttHX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OLiEttHX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B3D71F000E9;
	Thu, 20 Aug 2026 19:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787253753;
	bh=faC9L5Xe48Ea4JLjpr6QgKzLZEVw5UhtJEJbJk/OVgc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OLiEttHXTePcMDqBj8bWeQ2J/l4P+CJ5aIJdzQHilSaulWV1rzIVgo3JyUwusa9We
	 rjWHaQ8bP1FBqqPvGAZ20Je+vrhqM5zkE0QmI9+j+ZkpY56YcL6JwFiTPNa9LYSX6z
	 DxTIE+DIyUvTtGeMw9dHK8Y4vGavOZ1ICXDhxuBJXzUL4NXBSiMUliypex2PT6G1vm
	 g041f8WmfVw7c8evwxVpxKcvnCUhM6cguPpC0qxVSxcwE9LxWrHiksmA53PQor3oa3
	 go5miqGGEsu+KIcRlhjoiJJPkdqmptY4JLPmaFK1Oex4lvJevmJSpLlMukMSwwUgew
	 LJEdaAoWc6JkA==
Date: Thu, 20 Aug 2026 21:22:31 +0200
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org
Cc: vapier@chromium.org
Subject: Re: [vapier@gmail.com: man-pages-website: crush logo]
Message-ID: <aodTg9n__Xq_0BXg@debian>
References: <aockPc7I9x7E2DXk@debian>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xbnuorqjooprwyqs"
Content-Disposition: inline
In-Reply-To: <aockPc7I9x7E2DXk@debian>


--xbnuorqjooprwyqs
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org
Cc: vapier@chromium.org
Subject: Re: [vapier@gmail.com: man-pages-website: crush logo]
Message-ID: <aodTg9n__Xq_0BXg@debian>
References: <aockPc7I9x7E2DXk@debian>
MIME-Version: 1.0
In-Reply-To: <aockPc7I9x7E2DXk@debian>

Hi Mike,

I just learnt you had a gmail account (first email I receive from that
address), and also just learnt you don't have a @gentoo address anymore.

Could you confirm whether that mail from you is authentic?  (And if
possible, it would be ideal if it were done in a signed email.)


Have a lovely night!
Alex

> Date: 2026-08-20 18:02:25+0200
> From: Alejandro Colomar <alx@kernel.org>
>
> Hi!
>=20
> I'd like to note that I've received a phishing attempt (or so I suspect;
> if it's a real message, please confirm, Mike) from someone claiming to
> be a usual contributor.
>=20
> The message contained a compressed file, which for obvious reasons
> I won't open (I can forward it if anyone wants to see it).
>=20
> This is a reminder to be aware that people are doing these things, and
> that I'd very much prefer to see PGP-signed email, especially from
> frequent contributors.
>=20
>=20
> Have a lovely day!
> Alex
>=20
> ----- Forwarded message from Mike Frysinger <vapier@gmail.com> -----
>=20
> Date: Thu, 20 Aug 2026 22:36:17 +0700
> From: Mike Frysinger <vapier@gmail.com>
> To: alx@kernel.org
> Subject: man-pages-website: crush logo
> Message-ID: <CAL+h-jCujsyaHq+7V3D-M0PVqbHakp=3D+Z-Ag4nT_7xsESotocg@mail.g=
mail.com>
>=20
>=20
>=20
>=20
>=20
> ----- End forwarded message -----
>=20
> --=20
> <https://www.alejandro-colomar.es>



--=20
<https://www.alejandro-colomar.es>

--xbnuorqjooprwyqs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqHU/YACgkQ64mZXMKQ
wqmYOA/8DrJHCrxIy3btVtdWE06TWN9vhJZ4mStUStEoX8x+lgx5J9SqEmA1Q5S9
wVZhv/xi8EsXFNCgn49VaRYa7xfm33HsEisO/D3OYL7v+SYuWr86cC1bfohxQI2D
G8Z2q52JAKWYeOL9ROXxVOpA41cZE5SR29y4logCPUGHV+deupZdtahzZZOe8bDo
382p25Orv9JMhJpbdiXHegOSpkMb1Z4c5ntuc9Vl+ROxymWDnH64JpNhmVdLeMQv
CtOpclwNs4rkAsAOiNy/3btEmXVracepVuNMbbIhBAYdqBsAnOQdAATT3s8bPYZm
QC+Mh4xrt3B8tuV/P2UiRXkWR1KIOIYw2dXaFg9XBwlPtFmAnTLlt3Tv1+O7Zr4Z
XdPWcLemnOFFL5bq1oK/Zlel/cBmRxWoUp4gEEw35tmUy3VLttkivC2W0glm9Jvs
ym0ozuQYyyr7zZ+DAdkU8scBgh3yl4W1gr1g3AYmBxTGaQHtbSwpCzq9QKZn6Gee
dHEadjalned5Eye57FsqYDNp1cqaSi3c6PhU/pPS68FzHWpoFCguJjKbEqxbZosy
VroP/1ARBuVTd9UBdBQ7vCNKEclYPIxtIZmqnKMZF6Q2NfLv2JjQAZOd1AOVPpji
RQrjGRBgBWjCx4tIc/rh+3Dgtse6E6NR4KU/4mtJNgQNiPO+4WQ=
=2prq
-----END PGP SIGNATURE-----

--xbnuorqjooprwyqs--
