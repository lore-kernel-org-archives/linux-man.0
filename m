Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DB23DC852
	for <linux-man@vger.kernel.org>; Sat, 18 Jul 2026 15:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784389360; cv=none; b=LKECjihylAXzai3NlSxq73gMtk5hTywnqRKaX4a4XoAqb+hVFAxJuNj0tT1NOe0sHivbj967D8I9DbEsg92IBSp13S3HCykkMcl+GZ2ZXIJQ5vZ8UzIaEg6gCGF0meCbDbsfdU8qCFjhKVlmHtrEVJNL/VDj90RDsoA6+voNvw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784389360; c=relaxed/simple;
	bh=ptNaSWYPYUm2E6HGFxXft6Lh9S4RChPAwkSXIZPP2jg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MWqM3zBWZejmI6MeBKkIJ+E81pGEM+RlAPD14CZqV0Pue2F+mQurC/h1lAwi9oW3XRLTY2wfK/4ZiMDQlN0vNPSBSXd7+OOrSJOW5bgNk3T1UdnbJYAx21K75kjNyj9pWZnRUHa06eTMEgndmJPzfaoflPaOlUtCpS6lbSiqKA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iFBRs5V2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iFBRs5V2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19CEA1F000E9;
	Sat, 18 Jul 2026 15:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784389347;
	bh=iUCTzFyUW3vwaUGPp6JHfwiOOOAROZCGn0rReILekdQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iFBRs5V2/5ByxebLj6aqZ+2FusOg57m7BQOMw0pMXqoQtaPM2EPbo0Re/7ZGuH9N6
	 CgPyO/77sHllH5atQGI0GUbVgG1EBTQDufy7QXKcbL+uT4mEtHPDNTRJI7wybKttQT
	 bfHOy4Yim/cgkhWYF16BgslcnlQ6ynrLFb0S1AVfx5gnbk1Hr+FDgK4WGUARgI2Tbl
	 EIsl+jN/tQSBx63zYzIESUHrlr3Mo8hrSef1mh5btQNiF60TwG+jL34giN8xDtfxG5
	 I0+nLK7BORCJ/pCwUbIVf2oWujGnUKWmVXS3/UNb4GGcsEBdVlTDro59+5E1yQB7A8
	 TGg3wo76rKa0g==
Date: Sat, 18 Jul 2026 17:42:24 +0200
From: Alejandro Colomar <alx@kernel.org>
To: coreutils@gnu.org
Cc: linux-man@vger.kernel.org
Subject: ls/dir/vdir(1)
Message-ID: <alueABs-ZbwayZdu@devuan>
References: <aluIbrKBtAxweITC@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="udips244yo5clnvg"
Content-Disposition: inline
In-Reply-To: <aluIbrKBtAxweITC@devuan>


--udips244yo5clnvg
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: coreutils@gnu.org
Cc: linux-man@vger.kernel.org
Subject: ls/dir/vdir(1)
Message-ID: <alueABs-ZbwayZdu@devuan>
References: <aluIbrKBtAxweITC@devuan>
MIME-Version: 1.0
In-Reply-To: <aluIbrKBtAxweITC@devuan>

Hi,

I have some doubts about specific pages; let's start with ls/dir/vdir.

Experimentally, ls(1) and dir(1) seem to be exactly the same.  I'd like
to document dir(1) with a short page saying that it's equivalent to
ls(1).  Is this correct, or is there any subtle difference?

vdir(1) seems to be `ls -l`.  Is this also correct?  Or is there any
other subtle difference?


Are there any other coreutils commands that are similarly equivalent and
whose page could be similarly simplified?


Have a lovely day!
Alex

--=20
<https://www.alejandro-colomar.es>

--udips244yo5clnvg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpbntoACgkQ64mZXMKQ
wqljdg//fKtJ34HgvFyTU/xNAt9H6PKNdjzDVFNp6FuUS84xlUFxerxgSIhmj2Z4
WkUbiDfez6K8COfJ2z+YwvWcukmgUA7EfCyEjMqIRRU0kDvCA7SUiUzhD8eud8wr
LSyK3aokWfx9AosROTbC/0t7fdHSwXjpZItZy2lYqmSQ+6SLzCNdFxk0e8fD7IcW
frTXL8iWk1QQXFN2UDq+ZKzn5RC0Ow4jQF79fEhbU5V9XYkHylWakqqsiw0ZllJY
X1X3o/kmwra6c9Md8vIWkpGGdS+S3ri4Ic+HtocJcW9ZxgDpFBDLSXy6JvSRFpzo
fO0N4nPhIHiZ8aZ31rgN5qS04PsFP31QcI+0hNrGJSeRJfGtPxGCHNRVmzKCnr8s
X4OftfUlTjNMvK038xykd/SzpruA4BxQVpxGtxOkyPntSryIHMJy9I3VpDvgQf1Q
kN3DmxXeKJAbDXCe5kB+IMVQ0iT0D85asPVsoCPltvwZFnYoK/ABGBFLdU86RTLh
gU18u49xKOGh4mI0/JLhrsMgIf75go5rJ3ggq9sDxRi8zdx/SeZpydFt0MzRIh5C
oYs/0bv1I9y6Oj2TcOfOHUJDH/XVL8uq+acV/OuTqzp5kRHyDOdcGkCZ7VHk2KEX
71Z2FXNMyH/hpJQuIo3Knbb3RChZml4YQmOEuULpnMcRf2enLQE=
=we5j
-----END PGP SIGNATURE-----

--udips244yo5clnvg--
