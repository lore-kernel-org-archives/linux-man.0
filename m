Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795130576;
	b=MREXDkox/cvoxY3g69eD/6Q40mJ1key1Z4jJdR6NVW3S9K/TMg+n/CfkSS67k8yMox4x
	 YfuYMEV0/w1YC2HhOa2Zg8uUw0MgMv6/2PNQbjGsn2AUtcQvgii5YQAyBOadteECe8Qjz
	 BtwAjDDU9tAL0gAOXj4GscJJeAKShisNVk3WD6v60ayXx9LLWIGTHU2NWzJSdair3Dpnm
	 uAA+NPA/uIil6wyddyvpH9Fb4C52R6wEvM2qpB1YLIZIwbtinSBZ/Safu9NJzKNcS1LxS
	 Id+AHJpaxaY98Ys/18hmUbVHn4yKIJZelymWu+akCGR2MpSCx1d1XXINzLJEFxUzhmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795130576;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=3lbXIBNmUn1Zy+5qrZJpwgKNlT7cGaK0P9VXIOL3BVI=;
	b=cmY90nF+RtBQIsy87+WkweeGMtfIgIFLVq5KuTZ+pbuU2T9MIOjLoLMzeLx9AF2N0ds5
	 X+ZsBmpCO/i557M8iQMb3RB0XIp2cS//rSSj0VsFEppQ+X2FLEv94P3XqQVgfG9rCjgdZ
	 +W1lCMxsqwUJ0/2heavFek8p01KRUAGa2kbfxRCIrxukrXiI+H33idY68bV7Tbk4+Vv/L
	 qg/8IB1CFGF9C+RPdqMpa0wMQEwuTTYXrTTld7uj3Ryby4dQChZCZ1b6emhl6OI3HmWz6
	 vK/fHhJLqDoa1KwFHw4oFbnRgboTP/tRNFqlz2+sqwWS41MIw84yoXZE5fKjrVxLhMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vlng+jsK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212B5606A320
	for <linux-man@vger.kernel.org>; Thu, 19 Nov 2026 23:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vlng+jsK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A9E41F000CA;
	Thu, 19 Nov 2026 23:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795130576;
	bh=3lbXIBNmUn1Zy+5qrZJpwgKNlT7cGaK0P9VXIOL3BVI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Vlng+jsK3SS3FIIyvfsTgS7iTtsStcVwmC4da1vQp6OmHIAH3llwGP6dkaRnf4qYc
	 07fYEAet25UcemdrhTjB+rsQ9gkI6Bz7SSz7ZJ+oEK1YQZq9iJUk6Y9Y6LkQQNS/Fx
	 YXWwdeHxIpWMOCa/+UzOr6+r5xv2CgElntP5CPEwFCl5Cih6+DqjWD9dYkpsS8znEy
	 3bNJgPG8zdavH5Aa3VHjIEAz8a7Bs7JqzalFPd9CL+KzMNZzu7ySFGyMUFibcmkzA1
	 /nQ7zcsboGlY5y2KXwTVo+7CRqPs1utoENEKrv6RhJ2G2GBpKVRQoHNpCzVJXRPfCp
	 +GpohxVEqSEfg==
Date: Fri, 20 Nov 2026 00:22:52 +0100
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Niklas =?utf-8?Q?Hamb=C3=BCchen?= <mail@nh2.me>
Cc: linux-man@vger.kernel.org, Christian Brauner <brauner@kernel.org>
Subject: Re: man 2 unshare: UNSHARE_EMPTY_MNTNS
Message-ID: <av-DinDzrAeN_1mU@devuan>
References: <64fb02fd-0ffa-4311-bf21-a3211e9d599e@nh2.me>
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
	protocol="application/pgp-signature"; boundary="4jhelst7tm3ddhus"
Content-Disposition: inline
In-Reply-To: <64fb02fd-0ffa-4311-bf21-a3211e9d599e@nh2.me>


--4jhelst7tm3ddhus
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Niklas =?utf-8?Q?Hamb=C3=BCchen?= <mail@nh2.me>
Cc: linux-man@vger.kernel.org, Christian Brauner <brauner@kernel.org>
Subject: Re: man 2 unshare: UNSHARE_EMPTY_MNTNS
Message-ID: <av-DinDzrAeN_1mU@devuan>
References: <64fb02fd-0ffa-4311-bf21-a3211e9d599e@nh2.me>
MIME-Version: 1.0
In-Reply-To: <64fb02fd-0ffa-4311-bf21-a3211e9d599e@nh2.me>

Hi Niklas, Christian,

> Date: 2026-11-12 17:42:33+0100
> From: Niklas Hamb=C3=BCchen <mail@nh2.me>
>
> Dear man pages maintainers,
>=20
> I just want to point out that unshare has a new flag in Linux >=3D 7.1:
> UNSHARE_EMPTY_MNTNS
>=20
> See e.g.
> https://github.com/torvalds/linux/commit/9d4e752a24f740b31ca827bfab07010e=
4e7f34b0#diff-871f39f0834631ea368e8539ee88840ade11866cd6104e91543f9387dd1b8=
386R39-R52
>=20
> "
> This is useful for containers and sandboxes that want to
> start with a minimal mount table and populate it from scratch rather
> than inheriting and then tearing down the full mount tree.
> "
>=20
> Note a little quirk caused by this change:
>=20
> This is the first `unshare` flag that isn't a `CLONE_*` one, so it breaks=
 the existing invariant that all `unshare` flags are also valid `clone3` fl=
ags.
> The commit remarks:

That same commit also adds CLONE_EMPTY_MNTNS (according to the commit
message, for clone3(2)).  Could you explain why there are two separate
flags?  Would you mind writing a patch for the manual pages?

>=20
> "
>  * unshare flags share the bit space with clone flags but only apply to t=
he
>  * unshare syscall:
> "
>=20
> I guess that part isn't really relevant for the man page, but I
> thought to point it out on this list, for searchability of this fact.

It's probably relevant, I'd say.


Have a lovely night!
Alex

>=20
> Cheers,
> Niklas
>=20

--=20
<https://www.alejandro-colomar.es>

--4jhelst7tm3ddhus
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmr/hMYACgkQ64mZXMKQ
wqmDMw/6AqvaWSBpqOKoUhzG21+hXIMqW+d4gaViBvEmzuaqidB6hg0DSqzBc5gZ
Y+iy+Ebt5BPQu1tbUfuawWsJmdkNdcyimtIQnQX7tbJ04O6rERMahyHdsBoEjeEh
mXziYNF0BHo7LDPTFLqm1eDu3OCXit5L7IT5IB5fReP2qNT8byINQoiO9587gXUG
7HlinzUPrnyWxgaM5SC85GnBnIn7wwZhF/CWlTGcN8wNqx9Oz6hzoCnXwIX4Sm0n
2g/37wZer/hMDHJf+Ln1ihnQ/LyWnwFkKk9q9Fo3otGXKTNojjHEHvj3uYRA0gPU
v0qQbZnyE/fB4XKeijB55DzzlkmegnSAmAWxF7op4bjjf6XqGx+GZ8Dh5q0SeL95
3sxntTcYXr/1I0/amJ6rYqWB47UBvuy7TjhhjGCv+6xBm/iDyF3agkxdHKmNwNGm
mjT/5paK47SvqPJN/zqx9kUdzEJuAf9odlOlMzddkPDQCCGMsTJaLn5wLEtxakW1
t5S2mTHkgU1TzKEN5gUVLOkK4WSi9tK8LGjcMOcvYJYxvB6/MAuEi4DDc0KmGbgu
A8/mNw7CIPa68s07h66hu1lMpMbQybu1ulyXYWmZo9a+BmJMjJyKkUKyMWgiqYP0
J/BUaD3JzcymnxJ1sVzeOVssku6I3zPpmLHKQncFaI/T2wP0Vn4=
=nnp9
-----END PGP SIGNATURE-----

--4jhelst7tm3ddhus--
