Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794054121;
	b=4wVGgHvVu1sl2fXru3b20rdYyqP1gxbMRXOEnanTbMLeK3QLGCIJgl5V3QEKPQFri44V
	 Knw4DZmwFyUe7ddyfXoUaAodOHsuOHJ7ByRv3TR/NSNMIiEMKnilAnjBVpnDWAFog28ak
	 /7ASAhUUpJZx/LLR7r8ghiaD+GX7J8szYmMudEmpNhglRpblxsR0kcq/ZNmHPJU1LFH9U
	 m5We7scKonUa7xX86HvVrDHVb1D3jx47z1hkJ53C0Xwtd2QDXK2NtBJFeaeGzuunp0+YX
	 y/kr0yNSbuLEP/9rvP9tvr2Yz7qglrI8RuwBQbqbmGvPR0ma80P9nyR0EAAXEkcqilg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794054121;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=BPOy3Mxit3gC4RGsHWwgik82rOLdc0qt1ROsYHsIFJM=;
	b=LK0OepHtNGR7AesrmqxBM88BjZ5PfuxV6/s2RO2yQv4u4mKKr5e2o9JCkV+aqpSbq709
	 Za/xdufjg3EjFlARLuEyiIG3hQtBb2aRgZ0O0cTmSonzBpFV7OeOSM7A6dhX3itPVBtb8
	 dClTlXWXLjOxDB8fQeg+Ok/oWVPq0RKWAO48flUJJPgTo8winyrv0uy0uW1Kzn0tVi+Ih
	 C76qFQe6RgWnctp1UanEnyO+NuWTSlHGjIAw64R7qkYlnr0OUDuwcFgPGurYQ5L5hyU8G
	 MEKcjGYFSoEdZDmmQ92yQyR+9UYZdzkMtM4ZGC6h3ZVQ6KeXFK+Wlya2EYauga0BgqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cRHi6+Mq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61854606A326
	for <linux-man@vger.kernel.org>; Sat,  7 Nov 2026 12:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cRHi6+Mq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34F4D1F0089F;
	Sat,  7 Nov 2026 12:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794054121;
	bh=BPOy3Mxit3gC4RGsHWwgik82rOLdc0qt1ROsYHsIFJM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cRHi6+MqDW/WYkuhSjc334/NFUHl0xqq1TBx+IRGjLyQJmjYdONqftQ1bbeKIGv4x
	 HFlV9R/zfcLoqMELUQvklPH6NJxXg/Qr0klhfV1Z8VjVzD1XJgBRy5sBIyHqGbn2fr
	 uxD0iG0b1sGdyYJ/8CbffyiohxzRE31ry7JB7itP5RrVuoOHPU6GZiBT+YqL83/Yz1
	 jsm06vabmiEwjvt6damg5EMtDypixJYAmGdVIvGdngPOcocZmXy0TBE7gbmO5NUyz5
	 i5EXlko4TWv8PNqoar2zf7f1WiU11v7C2FNLIdbWH5dlB/KuTQn5c2lVuXVVOyVgZz
	 uAnxs40EzjS/Q==
Date: Sat, 7 Nov 2026 13:21:54 +0100
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
	linux-man@vger.kernel.org
Subject: Re: [PATCH] man/man7/landlock.7: Document whiteout object
 peculiarities
Message-ID: <au8XyqGFBra7QR9O@debian>
References: <20260828160340.11238-2-gnoack3000@gmail.com>
 <apHkx3LvRyqYIB2F@devuan>
 <20260926.919c130a1a6b@gnoack.org>
 <asvCjvg6nGJafgdv@debian>
 <20261011.6395f139dd17@gnoack.org>
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
	protocol="application/pgp-signature"; boundary="6gbvplgke2wva2tp"
Content-Disposition: inline
In-Reply-To: <20261011.6395f139dd17@gnoack.org>


--6gbvplgke2wva2tp
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
	linux-man@vger.kernel.org
Subject: Re: [PATCH] man/man7/landlock.7: Document whiteout object
 peculiarities
Message-ID: <au8XyqGFBra7QR9O@debian>
References: <20260828160340.11238-2-gnoack3000@gmail.com>
 <apHkx3LvRyqYIB2F@devuan>
 <20260926.919c130a1a6b@gnoack.org>
 <asvCjvg6nGJafgdv@debian>
 <20261011.6395f139dd17@gnoack.org>
MIME-Version: 1.0
In-Reply-To: <20261011.6395f139dd17@gnoack.org>

Hi!

> Date: 2026-10-11 21:44:08+0200
> From: G=C3=BCnther Noack <gnoack3000@gmail.com>
>
[...]
>=20
> I think it is fine to pick it as it is.

Thanks!  I've applied the patch.


Cheers,
Alex

>=20
> It was a bugfix and it is available on all Landlock ABI versions
> exposed by stable kernels.  So the described behaviour applies on all
> supported kernels and Landlock ABI versions.
>=20
> Because it is a behavioural change, callers can probe for the presence
> of the fix with Landlock's "errata" mechanism, as documented in
> landlock_create_ruleset(2).  The list of the existing errata is best
> checked in the most up-to-date source in the kernel documentation,
> which we are also linking from landlock_create_ruleset(2), so that
> users are encouraged to look for the most up to date list there.
>=20
> =E2=80=93G=C3=BCnther
>=20

--=20
<https://www.alejandro-colomar.es>

--6gbvplgke2wva2tp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrvF+EACgkQ64mZXMKQ
wqnVBBAAqaUwK3ZTTUe5bxyqsIkgv2aeouOEjWW1ZYYx1pWciuBdyYbhCSv8N9d7
e7D0GbkfUj63j+KnRy7lQ1PRfANUgbJLBg5wamb4fD5cJNnuXlxvnxkAKjvJM8+9
Wr9R1akvbFSjBCIDi9rA5NWsP8WFibZJ/ipPj0iTy6Z9UIt10//IloYwgDTirRQK
xHYno9xQGMjeiHPj5a1yj9BcZrHnR8gheRmu9J5ob+gllju+fWEdV0+tV06BeFx4
jhFh9TXDZtt0vWqEsFdiG/fWKw0C1zKpZ3j6E/VCH5Ba1uhgs2T4ARY/Zw3Z6Xkm
3U+wLvrabEGbJbueAFDTh+1eaWrFhqTEJajhmO3F4nSfdIfa6P0Uxst7D3rmR4kb
+f8/9cmwN6bYuB6PJOxCLwLF88VGRb0sy45y9TXEUtbIO1FjnGXUGio1Fr0g+Vnv
u78IOnL2JdVdQiNS+Gi7HcMUnzInqodamTe/RIZiOmRW10/EVDPUNwHYKu9OyATp
wPmMKa9d3FQtM89zrEfHzI1ttoavg7bTF2cioGC0QNYGEJenqNoGzOSqTVk7T5vf
SOZo+BUhLAtamlwu0ErNACqVdqlncAEvbZa4+vN+gMZ6QMrPa3TmnhgqhXr8MXdK
4p5AIZD1gr76CXoOKDfS2p4SppxxkFUSjO4HD606L/TkSupKlU4=
=jLzg
-----END PGP SIGNATURE-----

--6gbvplgke2wva2tp--
