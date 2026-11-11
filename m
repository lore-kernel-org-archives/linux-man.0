Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794433402;
	b=RH2zAO//VwUL+msgthmN6XMfoHdB7FA/NvleN95X1UzIayhRz9Bh/b1GuqZg7ctIGBDL
	 pUwnpCcmezcDHKAGn8tt2Nv+4FPiC2ybt8trx1M1VjH/8KgjLyA6oLgOsIPcw5O2go30d
	 Lg2i7ekf5XNviZ4ylXxTnnZN/wEgZymHLmALtWdlMGS/XySw2PfVgYWvh9U5fc4ylgzBw
	 QXmt7hsb8ian3m9g7sO2FsjvLhoumlx+OzKELv1mKNlVx1B6UmefvRiFslLwQ5fR3+tsR
	 +WgJzDEmRIJxqnDBfe2/+W8/9BMZM5zu/RDWC3j/tLvsXIEFwwuHY5XsDe8MZnUoJSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794433402;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=JkBIBVA0CnKPh/KuAz4XDhL+2kAFtQwWfNLlpm5qtdc=;
	b=OV+JDHtz29JCXZ8H7BchHx/zqdkJN3lqTJMBMS0vFrP8efd5pMHdR8YQQ2D49JVvteRl
	 37kq0ioXwvvhUlBfq0V8LAi4zs3hSIas5leyGABJ/uPYVgh4/qF5+lCZdmQdBY4GhqxLq
	 utgMFdR/Sy63uUBZ74QgJb+RbvfSdzyK1J0tzEke1+Mov/Sfm3BiJKKWNW1HXpIg914/M
	 6KSDw/24JGV9YvGqgpzKYiNWGRTpgAe25VF3KJV5Ctw71yUSD7lGjRSxbVo0XzXuC0CXE
	 /VkfwMZ5e5r7tLCza2esG7idHm+mNtKbuq7ZwcXCITILsyyYBmUe36klsyhScCnhqkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hyNweR8d;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F95606A32E
	for <linux-man@vger.kernel.org>; Wed, 11 Nov 2026 21:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hyNweR8d
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDC431F00A05;
	Wed, 11 Nov 2026 21:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794433401;
	bh=JkBIBVA0CnKPh/KuAz4XDhL+2kAFtQwWfNLlpm5qtdc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hyNweR8dztSWs9txGaZwTjVOFAkgeQhL+1kDoLm6rP/Af7HAJ7nH13aGG8M95mVzc
	 m2K2n0uMaqYNEj1LAEmMPKmL2LbjHUkvpRhCPlVDrnDNXdWmVE7A6HIquTWWBzrJft
	 HkiLOPxxYe/mH+cUKdDIQLme5hkT6On2eHZNAMNalu/51zHhL3Tp9csGaImHs90RUu
	 JYCV6CdmeNKaXOHxVsvV8f+iIlh6olx7Fio3wttmGaZjQNhqwsX3ZYUKwtTHnYKZRU
	 bkpD8Dj4iGyHzpAGYoiwqFwoH9a3TJIas0PElElxb4yi9FkxX9mGfT+foiDHhrgT3t
	 vQOtdDbEBtbAA==
Date: Wed, 11 Nov 2026 22:43:17 +0100
From: Alejandro Colomar <alx@kernel.org>
To: Rich Felker <dalias@libc.org>
Cc: Alejandro Colomar <alx+linux-man@kernel.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, linux-man@vger.kernel.org, libc-alpha@sourceware.org, 
	Walter Harms <wharms@bfs.de>, ~hallyn/shadow@lists.sr.ht, musl@lists.openwall.com
Subject: Re: [musl] Re: [PATCH v1] man/man3/crypt.3: These functions accept
 many algorithms, not only DES
Message-ID: <avThPiJtvcO-eHiR@devuan>
References: <313da4c4e217a58e49e981f62d16bd15c97352bf.1794268615.git.alx@kernel.org>
 <avJeq6_q5rpqoGlW@devuan>
 <avSERDjw/CeqN60U@hallyn.com>
 <avS4ybx_EfRvGsw1@devuan>
 <20261111211313.GF5716@brightrain.aerifal.cx>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4idsqdxu7om5uu2a"
Content-Disposition: inline
In-Reply-To: <20261111211313.GF5716@brightrain.aerifal.cx>


--4idsqdxu7om5uu2a
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Rich Felker <dalias@libc.org>
Cc: Alejandro Colomar <alx+linux-man@kernel.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, linux-man@vger.kernel.org, libc-alpha@sourceware.org, 
	Walter Harms <wharms@bfs.de>, ~hallyn/shadow@lists.sr.ht, musl@lists.openwall.com
Subject: Re: [musl] Re: [PATCH v1] man/man3/crypt.3: These functions accept
 many algorithms, not only DES
Message-ID: <avThPiJtvcO-eHiR@devuan>
References: <313da4c4e217a58e49e981f62d16bd15c97352bf.1794268615.git.alx@kernel.org>
 <avJeq6_q5rpqoGlW@devuan>
 <avSERDjw/CeqN60U@hallyn.com>
 <avS4ybx_EfRvGsw1@devuan>
 <20261111211313.GF5716@brightrain.aerifal.cx>
MIME-Version: 1.0
In-Reply-To: <20261111211313.GF5716@brightrain.aerifal.cx>

Hi Rich,

> Date: 2026-11-11 16:13:13-0500
> From: Rich Felker <dalias@libc.org>
>
[...]
>=20
> I'm not sure where you're getting this from. All implementations of
> the same password hash function need to produce the same result, or
> user credentials would not be portable between different ones. And a
> password hash that does not use any salt would not be fit for purpose.
>=20
> In musl's crypt_sha512.c, the salt is isolated from the setting string
> in lines 262-266 and used in the sha512_update operations that follow.

I'm not a cryptographer, so my reading of that code isn't very good.
Thanks for correcting me!


Have a lovely night!
Alex

>=20
> Rich

--=20
<https://www.alejandro-colomar.es>

--4idsqdxu7om5uu2a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmr04XAACgkQ64mZXMKQ
wqnSGg//dSZp5/0P+UK01Aafu3iS9FFFuLrCzfe55SyI9SoC3BGQQxcNm3x6SsRN
Hwo+KSOSBQCZ9u3NXLs5+CXfkPLivyQgZ0oACe9UZIXPjyjTiV9l5Y380pNmrF1D
0sVVNXNWVAHy2eu7NHH1r4v9jhZ2O73Kfng8DrfzdpWPn6dvnpxfyijhL82Hd/wd
kq2MXISpxeUyTvojCHadhrGFQ0PdvOq4Ttn9CUeh9G8jaDbZi2UHgNkwBoiSkc5t
8y0dI1HzYIpYqU30rHMwLpMxa5sLDHQyc7MGgrRV/pCTjREd6CbSkzGigi6sCIsZ
drftzqUGzYUR7lfB6n0aG9cAhJ8B1BAckpqp+qFcEM2E1ehTojSx/UQXM4r0yCmq
S3PQZqeMgJU5gNjFPYr1nXRPhTG+9pN2FkkuYnFmr09fQT+nwgavYwz4lbP7SFz6
DDT5HL+CA5Ov9kky8Cp/Bo26knCnVaGmQgjI1zQm2W80mi/iyslJH40lZHPULEu9
iT+P4j9vhwUsbl5WYPT9zf6ehAB+l+njfUwumzXOZvbvy4xX0F7AIYMorDUVHMYu
GHx8VhsTmzczMNtGdz544XK4/7xFBzBpK0cWEVgPDzikeQwkJ7Jw6lI0tGUPk2Dr
sxRXfcO2yCwG8EVVRjpeeZQf/mDdaDhhtWH2CjPmfj4nHzwQ8y4=
=HsNe
-----END PGP SIGNATURE-----

--4idsqdxu7om5uu2a--
