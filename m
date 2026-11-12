Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794522144;
	b=f/giyEw1D0HzdLEvLLWjjy7SIbPzXmru6g9IlI7SB18/VbcSFKpScUtYHBd3B9YnMiWv
	 WCWfDvnEoZ+aCBDg81VAPIBCXsd4hwRzJJ9uAmDvf4j5Tcr1fvO1Q+IjQjWwjs3zry+L7
	 iaoZB3qhj1dScy8GMViN7zxplsoUFiVRSL3M0+SQyj6Ok/pZVqZdle+LSGoL5n7sgLl3a
	 b+mhtcuqRy3zyQOeZzGSFO2eQ2soTgbJN/ErSJkYdL0I8/bz4Xx3/VewemGwMSdr+UkY5
	 99eQfslHV6YpVpeSedsuKMU0nzk9LL9eVK1m7Rqm5tMXR0d1l80zbMt6bV/sqQio/cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794522144;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=L+eZC+z6tRNbhRc4+n6Dwb545bLhGpc1eQj4/8zWMIM=;
	b=YI4K6rFlXLEbTh6Wcf01vk+mUxqu48Or/wKVJz/INCyUY+gHCnd1xLacLHsc0C6xtN7j
	 r+DQwjcznZDoZxToqGKK/zam+7Z4IsDFFaqF0NzETAtcRFjS7I8u7T1rwz0DPjzs1Ucmo
	 PoZCX0bQ2rvkWXlDtpYVGumB4512AennmwHeCFrHtiSEechRRv0dtPdpm7KbUc/rhr4yE
	 6nQbt9nxD4eg1lvtGYhulayoT5ckaU/2R9EmEtbX/rhALvu0bzVLkDI2bSIO0PfPgXAQi
	 Jeu1lB8VJWwukKVnEVvU80mVN9fMm7Es8eXn715xC1Vbfi2JMTY75ZP7ivhTN0kxqJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YvQwUu+t;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A547606A31C
	for <linux-man@vger.kernel.org>; Thu, 12 Nov 2026 22:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YvQwUu+t
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 490011F000C4;
	Thu, 12 Nov 2026 22:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794522144;
	bh=L+eZC+z6tRNbhRc4+n6Dwb545bLhGpc1eQj4/8zWMIM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YvQwUu+t0wndxeH6weJG8v+7iqV3YPzHSOF96v5d/fs13ndUmt5v8BMXBgsyPNyc1
	 gRyBwlxWrMw6l+15yZHCGxbRq7/hIXKv/yJLxvtdvWwjKcmMiLBoIRh4g6ZSgLtEgc
	 37hkOSUtsKz4T0b19qtU+wv+4shnwDFJg+f92Dk2j9WuGduR67criJZ6INy19ItCSP
	 edIj0LTF9fBbVoHDPygx2EBABLmPB7khva61xkMXT2qLyVBZhARTBc46cfl+GTyeSk
	 uFXkYcZcVWLJt48lDPzQYBZK93MQ2Ts2DgqCy0ozblybpjxMpn/us++hSkokIHwAaD
	 kiVlubsidZgPg==
Date: Thu, 12 Nov 2026 23:22:20 +0100
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Rich Felker <dalias@libc.org>
Cc: Vincent Lefevre <vincent@vinc17.net>, 
	Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org, libc-alpha@sourceware.org, 
	Walter Harms <wharms@bfs.de>, ~hallyn/shadow@lists.sr.ht, musl@lists.openwall.com
Subject: Re: [musl] Re: [PATCH v1] man/man3/crypt.3: These functions accept
 many algorithms, not only DES
Message-ID: <avY7qcV_W3ikoW07@devuan>
References: <20261112120831.GH5716@brightrain.aerifal.cx>
 <avWwXGpq1OLtNDSV@devuan>
 <20261112131737.GB1951@disset.lip.ens-lyon.fr>
 <avW9PMcZ6Hm26hl3@devuan>
 <20261112134516.GD1951@disset.lip.ens-lyon.fr>
 <20261112135501.GI5716@brightrain.aerifal.cx>
 <avXFw_RUi0C4Ta1V@devuan>
 <20261112144349.GO26138@brightrain.aerifal.cx>
 <avXSmj4FXqnwZTwK@devuan>
 <20261112180852.GO5716@brightrain.aerifal.cx>
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
	protocol="application/pgp-signature"; boundary="7gkaumqa2zo5zf5b"
Content-Disposition: inline
In-Reply-To: <20261112180852.GO5716@brightrain.aerifal.cx>


--7gkaumqa2zo5zf5b
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Rich Felker <dalias@libc.org>
Cc: Vincent Lefevre <vincent@vinc17.net>, 
	Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org, libc-alpha@sourceware.org, 
	Walter Harms <wharms@bfs.de>, ~hallyn/shadow@lists.sr.ht, musl@lists.openwall.com
Subject: Re: [musl] Re: [PATCH v1] man/man3/crypt.3: These functions accept
 many algorithms, not only DES
Message-ID: <avY7qcV_W3ikoW07@devuan>
References: <20261112120831.GH5716@brightrain.aerifal.cx>
 <avWwXGpq1OLtNDSV@devuan>
 <20261112131737.GB1951@disset.lip.ens-lyon.fr>
 <avW9PMcZ6Hm26hl3@devuan>
 <20261112134516.GD1951@disset.lip.ens-lyon.fr>
 <20261112135501.GI5716@brightrain.aerifal.cx>
 <avXFw_RUi0C4Ta1V@devuan>
 <20261112144349.GO26138@brightrain.aerifal.cx>
 <avXSmj4FXqnwZTwK@devuan>
 <20261112180852.GO5716@brightrain.aerifal.cx>
MIME-Version: 1.0
In-Reply-To: <20261112180852.GO5716@brightrain.aerifal.cx>

Hi Rich,

> Date: 2026-11-12 13:08:52-0500
> From: Rich Felker <dalias@libc.org>
>
[...]
> As an aside, can we please remove the language using nonstandard
> gnulib functions (streq) that are not part of any standard library?
> This is not doing anyone a service. Experienced C programmers will
> understand it as essentially pseudocode and write something correct
> themselves, but novices will be confused why their code doesn't work.

Okay.

> I assume you have some sort of thing against strcmp,

I do.

> but that kind of
> polemic treatment does not belong in descriptive documentation.

Ok.

As an aside, would you mind implementing streq(3) in musl?


Have a lovely night!
Alex

>=20
> Rich

--=20
<https://www.alejandro-colomar.es>

--7gkaumqa2zo5zf5b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmr2PBUACgkQ64mZXMKQ
wqnKrg/5AbQL7mDvYzgW6tAEr+IRU4JmHeUfxoFyZmbGC6znwQRvZiBvIKxJKxcT
qq+haaPQ/SJYl5nbM2iCD0SvxFBdS8rUmnqY+opxd9ziK53A/gQq025PjoiV82C4
qsu5mCCBdVFL300zZpxUZ0+K2gBPjZ7VeASumEc9myVRtECL23b7U5ZHNT5HcUXE
RmlPyXVdaoe1Ur0JQjgbTXzlkwfx+AePbFbYWMZwzKs0ihHeAUgyQGbjq+WpqsVy
JUYGqYPtCk1aWWlgUvl7nJ0ofr3AElutk32NbDa2YveA2C1BCXz3HWUjHUx9+vqS
z3jfDW73iBw9xThguP24mxrJjW5urT7V1JaZi84/BjnftFNXzd2YttE/lOoRSdK3
xmzh3KedVpqYRnZQRPR13FKRu7RJQRNhRqkFuq+cZwDOLRsVMWUazbA4Va9Zt8nI
bI62xmuO+qi15OARbj+raH9MI/8lerNXs8Ts0Rsr9IJ25oNJaKYjGFRd+51o6gXE
jegAyOWodCNhhj8EFhgI6rvhrHAX9YNf38ZHix349tR2+MfxJWN8ylysUOJH0zSw
DVWOGFJ2JH5eszaoxADIQy0x5nQQTm226EbfHBBCS1gemPGccCqQTntI6U0ONUmT
ARKIl1zH5BSupENMCTdsGgqH2l2ZBz1he8+R//YqqPiAay87kpg=
=6GDm
-----END PGP SIGNATURE-----

--7gkaumqa2zo5zf5b--
