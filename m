Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794219067;
	b=pFawzdW2JW4Jw7B58udvK1N5kLsulqFLPhrDtF//Z4Tkq/ytULvAHrSOdrOlXODyfWqd
	 aFzXhkEpPnVgqqV2qDuOA/rSldfsITmgfcrhUEIyViyIVBn4AFuRYMBE8neY+56budyEe
	 G3+7lvXFeBqUAFN5OaOmleSnVME2Vq+Vv5oXtnqZ7kBy3NhCH+/UuEQ/7zzkPYcGzN695
	 7p656B5ggCTWI2shtgwn323/L/1cUVGOBCtkSBFHbgpnoNcJ9TjiSFmkmL8j2baySnvEY
	 niVF7tJlj3NnnGbjl+y+Y59yAZUp48fNWUGtpjiSRZzXfmYLLn123O1BdSGnt4SDAdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794219067;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=UGK4KNPTPAwqenYNSaHDIW1coBVbYbvqaxb+pr+A5aw=;
	b=Fk4uL/tSjaYHBjFDSmcZ+CKkl45/k5prkGQtQvqKOI/Vu0KO2YuQhsPrpfVNmZrNgLRa
	 OLUjeWcLboJz47VUXEsZTQgaW13NZ55HBmwmh9JQqyIsbO96ANs6NLi1qFw+EmPRGJDM9
	 E1GyMnaTk+iILsqR8gSajJI2AOUAsU/lKlQrHO0JSUBQ6pM0R7fYZeCz1/dL18vq8m7qy
	 nM5Kv9mUGU4uFkoXe9SSS9xtBHT2WXvVny4PJhGWJgVc7NA+NdV/J0NFZHQC1Tyd88woQ
	 4dmVPpUIkmmUiAypMSYJXPo0S2/iCIonqXN9aPqJb/hFvYV7w3eha6VOAXZoXwFBkrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JgBon9+x;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35F8606A331
	for <linux-man@vger.kernel.org>; Mon,  9 Nov 2026 10:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JgBon9+x
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D0941F0089F;
	Mon,  9 Nov 2026 10:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794219066;
	bh=UGK4KNPTPAwqenYNSaHDIW1coBVbYbvqaxb+pr+A5aw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JgBon9+x8lp8ep/tsgJL7I0NkemiAiaT6emnxKauLOIIu9W+GBOOJy8Gkdem7oolf
	 VYcNahZAFs7j2MA/THx3oZG6JHLzr3ZGj+A74RnA/uhGcPasQZIf7GjoRRxcU2pbTm
	 BZgYgG94VflcZcgXHRRqtcL4Uw90GOlHIaQdMXvAPvaqW222jcmy2XEZ5D1hKKA3HK
	 qO/ezx7Wpmr1TSkPKzC9REkc41dw/ZKcmRvsuDZdZ3Ud6mmNtRz+NWZm7ALftYnxwG
	 UXOa8maBxXvb/995zQGxc5qXXvUTz2Z+/A4ibIunOP6Ph14JrynvCLKShpsAzd4U3M
	 BYhPvRIXW4NPw==
Date: Mon, 9 Nov 2026 11:10:56 +0100
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Walter Harms <wharms@bfs.de>
Cc: "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>, 
	Rich Felker <dalias@libc.org>, libc-alpha@sourceware.org, musl@lists.openwall.com, 
	~hallyn/shadow@lists.sr.ht
Subject: Re: RFC: how to document musl-crypt failure ?
Message-ID: <avGP3ZsVvX1mOirn@debian>
References: <ad592d57700043c181886d95b2564e6b@bfs.de>
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
	protocol="application/pgp-signature"; boundary="5qg6sdwofacglva7"
Content-Disposition: inline
In-Reply-To: <ad592d57700043c181886d95b2564e6b@bfs.de>


--5qg6sdwofacglva7
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Walter Harms <wharms@bfs.de>
Cc: "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>, 
	Rich Felker <dalias@libc.org>, libc-alpha@sourceware.org, musl@lists.openwall.com, 
	~hallyn/shadow@lists.sr.ht
Subject: Re: RFC: how to document musl-crypt failure ?
Message-ID: <avGP3ZsVvX1mOirn@debian>
References: <ad592d57700043c181886d95b2564e6b@bfs.de>
MIME-Version: 1.0
In-Reply-To: <ad592d57700043c181886d95b2564e6b@bfs.de>

Hi Walter,

> Date: 2026-11-09 08:59:19+0000
> From: Walter Harms <wharms@bfs.de>
>
> Hello list,
> in case someone missed it: musl crypt() had an documented but
> unexpected behavier that caused a lot of trouble.  See:
> <https://news.ycombinator.com/item?id=3D50377221>   SSHHole.com  CVE-2026=
-123158

Indeed, I also wondered if we should change something in the
documentation after it happened.  Unfortunately, the bug has been
treated with some secrecy in the first days (reasonable), so I couldn't
really understand what went wrong.

I've CCed Rich and also musl and glibc, since they probably want to
comment.  I've also CCd shadow-utils.

> Normaly i would step over it but in this special case ... it would
> like to start a discussion if we should mention that in a note to
> crypt().

Thanks!

> Perhaps recommending an additional check for '*' ?  I am not sure but
> this is a very special case ...

Rich, now that some time has passed and I guess everyone has a patched
SSH, would you mind clarifying what happened, and what should be
documented about it?


Have a lovely day!
Alex

> CU=20

--=20
<https://www.alejandro-colomar.es>

--5qg6sdwofacglva7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrxnCoACgkQ64mZXMKQ
wqmW0xAAjuUN8NNGhEI5hPCD5NNs7seN9XgEKfbOKf8OUeZay6VlDBVm2lhTaSG+
oLD3AwIG6w6Z0ZGWnNCUtCGM9GQZO8cKKaAkE2eZV81uRTxvvKdc6s0H755bC1+n
Cy/obuv9ecLhOfKq9bjvNo5Re7s6jXN24vpxkHXeGc2H+y8UmRs1gHZioXhKN+nv
njEBauSCqvBHl5qE6IPfBXsfvBQhk60xKj/AJDVCJb6dU6gxlBeWIQViDEj2Mxue
EdowglhhrjfrqsVKgZud5KvjOWYvZxdw/nG4KgszbZ9swjy3pE8cWx338Ygtxi2+
8GqG0MUjJyWV5DOqyMtf9TaPTvXmbfgdKYRJbjjDioSv6TlW7+Ss/bxFM3GE+rmN
lRARNytV4uJPTqzMNSB22LkVCaHJyQtzqMHhz58zVTwgF9TgxYCyD/p7MSS1MzgU
Er3ZkVuGdtg9qBzi0cBPBx2uCSEpI6Jr7edd//lD/oa/fxJ4sBfm5c7ryjU2p1dd
qZdvPgK0sEKQgZHr4jY5RDwAnND+cJN7gnrtpzT3kpv9U7Fp8TkIEV3ye/agOsax
OMHIsrnZqzo8BHLdtu3MxZkYIJ0wo3rHRFPFzo2VLKphmOzdzvSjDhzaeC1407TL
4qmHkDDwIMulbPoHsT8+CcGEW8c744SYvI1E2JmEkuKXC5dQgII=
=avXt
-----END PGP SIGNATURE-----

--5qg6sdwofacglva7--
