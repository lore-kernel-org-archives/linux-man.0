Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01AC390C8A
	for <linux-man@vger.kernel.org>; Wed, 27 May 2026 23:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779922976; cv=none; b=ZnzqYftNADOxQ31YMioOIOC9StdGP77WjlmOvH7a5288JcE1RSIcgv+5UGdXFPSJXkN0Vpv2v2AaRW3psqI138dRFSy/COiOYz1twsZWeT+hyLBS4JfDSeNZwoL7fCKtCAvtLwvAGCgUZeyHjcuxFeYkL9yuaSh/7gf1hu57vu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779922976; c=relaxed/simple;
	bh=w0M5s3FZMTblcvqe5MWSJIS400s+LXPGpCiQaWnZ/lU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UhWnUjS/PYiNE6Qj4rDIl8xDuySRkcZlFeAp1/9JOQpS9AvwCqXRxXrf1q1gu3sEhpVrpE+3KYTtvEEN0y4zLbp2T/H4XpH1hl9/YRoFZaVmyqxrDp2DMNxCYMa7M4ARwI1Zb5P2jZC5fLHTg3VqQ1s+S/fGYccNzlDmOaUjTWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ixj/S1/S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ixj/S1/S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC3BA1F000E9;
	Wed, 27 May 2026 23:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779922975;
	bh=NsCBk4jmhoOvugqFXbOhg59P6HKKUgRuzqnZe5b4zlo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ixj/S1/SMHjRxxwvf1k9CBGxQonlIOl+6ozxa7SBD7nuVF3VTEDR9PTXcZp6Anaqp
	 3VK+8EbJLjdKY7kryp4jdrbRt4Gbs+9vG9R8vOvbknsIqm0ac86bmGNKDqfdD3qeyh
	 05JHCs51T4DB3prMHUVaxnpGW/VqJQ5YzQ2EksUHjHYkJ9gr7nwDFfCoOmfRvPqJH2
	 nycwNiyAjgsuGVzuh07koP6a8prTPY+wBlZwmaww312RgVTqKKTkCo9n3NgYsITbiG
	 KX49GENE+CFxM1xDkcVMdhTpK9iPOll8kfh2QmFf7BFjMLMIcu0a+noLBtFPYdLitT
	 Kc1qW/miFmhBg==
Date: Thu, 28 May 2026 01:02:52 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Evan <felisevan@protonmail.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v1] man7/feature_test_macros.7: tfix
Message-ID: <ahd4Bw0Mdc-X0IKF@devuan>
References: <NVnggFXrKY_T_kEGNivWpJI-z3Ztwoyzp3gqTE22JG1-JQfhpNY42bISSPC2fhr90tzYI0QguUcNn3kD0ugpFcI6p-Q8G7KUknOfxOPRGAw=@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wb5dbrctlk2ew6jv"
Content-Disposition: inline
In-Reply-To: <NVnggFXrKY_T_kEGNivWpJI-z3Ztwoyzp3gqTE22JG1-JQfhpNY42bISSPC2fhr90tzYI0QguUcNn3kD0ugpFcI6p-Q8G7KUknOfxOPRGAw=@protonmail.com>


--wb5dbrctlk2ew6jv
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Evan <felisevan@protonmail.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v1] man7/feature_test_macros.7: tfix
Message-ID: <ahd4Bw0Mdc-X0IKF@devuan>
References: <NVnggFXrKY_T_kEGNivWpJI-z3Ztwoyzp3gqTE22JG1-JQfhpNY42bISSPC2fhr90tzYI0QguUcNn3kD0ugpFcI6p-Q8G7KUknOfxOPRGAw=@protonmail.com>
MIME-Version: 1.0
In-Reply-To: <NVnggFXrKY_T_kEGNivWpJI-z3Ztwoyzp3gqTE22JG1-JQfhpNY42bISSPC2fhr90tzYI0QguUcNn3kD0ugpFcI6p-Q8G7KUknOfxOPRGAw=@protonmail.com>

Hi Evan,

On 2026-05-25T16:35:05+0000, Evan wrote:
> Fixed two typos in the _REENTRANT description under the "Feature test
> macros understood by glibc" section.  Changed "199606L" to "199506L".
> For the corresponding glibc source code, see:
>=20
> <https://sourceware.org/git?p=3Dglibc.git;a=3Dblob;f=3Dinclude/features.h=
;h=3Dc080ad4260f40e633f6df951408d0a822ac2fb3d;hb=3DHEAD#l350>
>=20
> Signed-off-by: felisevan <felisevan@protonmail.com>

Thanks!  I've applied the patch.


Have a lovely night!
Alex

--=20
<https://www.alejandro-colomar.es>

--wb5dbrctlk2ew6jv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmoXeBwACgkQ64mZXMKQ
wqmt3RAAhYdh5FrdfHFDPJLcgdlyY5c8IYvn9IehCLOiApx4ny+KcHtuDp/tvVLK
DJ/c9UT4wd5xMs+SzqqkSqsoHDRP5pBnx5BkRx6pF0XuEEsYpqiy8jhOzE6RRQf6
0OEk4gPymyhqv0zWpBRy+wovgHGItsTUlsCgnZJEuaA9elApWLJx+5rXYpsTdQ5K
pCfGNiGr1t14QnuRyssH+HdkKoxjhgi9g5vm2w0QgKgMxvonaPFRCro+9f4H9fYl
mmInAxD77j2pDAi2GUMZELXirWtZyPBusGQ9xp9WA0b2lJo1pWdCrCEB9gHircdQ
AERHNxWCkRpAy94h0v+8k479m0q2Zb893DyxYOEpLjWSj1O39x4AX5Eaw8LimXUe
GpUSZgIMXEN/3TeLh8l/65RTfKDCOT4ZkRawHu33Rim9MTi21txRcQfV63vYMveu
hwriNv45canCNG6/zgwzBFG9hesbIrgMuurx8Zv4ZWuke/jM91QhL+jcsKhr5tn7
ncR1fX6Wqo9/IdT4X/iaQoMcD//+BeyjWh+uJcRgD9X6YQZy7aUN+IHexcR8468C
Rd2Ugpy27vZ/SoWQA50x/Iv0ySkfO0d2lb8Gv6P/Mwa+xyVdJgpSlPKQLzAZipqh
Yc1TFENRVKrahQKJngV+lIrLH4+B0642+vrmAitD032SEOP2tAM=
=+Yos
-----END PGP SIGNATURE-----

--wb5dbrctlk2ew6jv--
