Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792605998;
	b=AJAUlPn/IPpFpTf+ivwHqkwkuyABhfANYi9oTpQwqpS/NFo8SZtQsBlhXg5QpmYlFa1N
	 xhQwZKAcaSyV1R4kd/d+MnmLB7rxY9CUyL19rKJCSR4Kjrqi6YWMq6h5U3ItU062nrlt8
	 csbuOKSUC3GWE5W62zQBjq7qo6W6x/+RE0Ub7LrRBBergp8qJs1CwMtuyUeGAlQySqbbe
	 +V9x2U2bOjPsG4pbDm0ijzlSt9Rm0q01pUgjVuf1tqoEddcbufbavDYYHw18uANfMjb9j
	 y30Rvf1a579RBp3ySDdOy4QpZIRrZdbKt7EdiQEuIef3ugjxGcgMsTTDa3RhXoziRZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792605998;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=z6levTjimXz/DtmkxftiWEiK3Zm+n53RK4TQ2M0StMY=;
	b=negjEN01nMAFzDj80OIKY89i5mUEB+s80E3+6fMpi5TrYlTRW1KptCepMKiu2bBW14Z3
	 Q2URsV1cKtEMjh8evGH8KmbcNVSIuk0lk8a/GWjZn9Gluvb3M4cjPLpM80UtHNjJiU0gm
	 JBRiMEegxCx+qUpe+tTmc/D2sguUZfY4AUweR9Bo5lF5qUb0O7CStK/so8bwushKb0VLg
	 IaXmVC2ZNIQLONDyGWNOCaxAgwKVtBOW2K6H0se90n3bYn9a4CSgFtFoIXvNF+iJsLbNX
	 svum7NAx/wmPmTdPZwv1MTYAu/GYCEJEAlBJo9b6Zg6Nig34IxQli25aZji6fUi3y9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ngj0bzoB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A448606A31D
	for <linux-man@vger.kernel.org>; Wed, 21 Oct 2026 18:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ngj0bzoB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 362E31F000C1;
	Wed, 21 Oct 2026 18:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792605998;
	bh=z6levTjimXz/DtmkxftiWEiK3Zm+n53RK4TQ2M0StMY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ngj0bzoBwM8rEOeQSjYLE5nAyWcFjYhoxip2gxCrezjTfogNRZz8o1KDKvNTCxuPX
	 Hn+Fhfw1bhNBxJ7utqfgs7SLd00+e6oOBELuW4qq+NjBFRdrHp+FLRi+oaSNDH3Hbp
	 nwKFx1mgZumj5CuxGnO4eaHTI6ClLlpiTaAzd2/Qd0EFIlU+tibiakZ1hmjUCBpzdk
	 ojt1VdjVE4B7uMuIeaSXZKVBlBOWvj1kWDr8dQyVbCXdLK9roIx9+3LtB4RQUAtxVx
	 ZFGjjurup3sC+n2PAk36luev4SjeJ6M5uhw0wqV0Y9pxmbKkYy74/d/0YcIuYzZmTq
	 UtbUKTh6MIcjQ==
Date: Wed, 21 Oct 2026 20:06:33 +0200
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: linux-man@vger.kernel.org, "Dmitry V. Levin" <ldv@strace.io>, 
	Pavel Emelyanov <xemul@virtuozzo.com>, Michael Kerrisk <mtk.manpages@gmail.com>
Subject: Re: [PATCH v2 04/24] man/man7/sock_diag.7: Fix member order of
 struct unix_diag_vfs
Message-ID: <atj_FYYzjlaclaKS@debian>
References: <20261018173712.27670-1-gnoack3000@gmail.com>
 <20261018173712.27670-5-gnoack3000@gmail.com>
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
	protocol="application/pgp-signature"; boundary="uayah3kf27csiird"
Content-Disposition: inline
In-Reply-To: <20261018173712.27670-5-gnoack3000@gmail.com>


--uayah3kf27csiird
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: linux-man@vger.kernel.org, "Dmitry V. Levin" <ldv@strace.io>, 
	Pavel Emelyanov <xemul@virtuozzo.com>, Michael Kerrisk <mtk.manpages@gmail.com>
Subject: Re: [PATCH v2 04/24] man/man7/sock_diag.7: Fix member order of
 struct unix_diag_vfs
Message-ID: <atj_FYYzjlaclaKS@debian>
References: <20261018173712.27670-1-gnoack3000@gmail.com>
 <20261018173712.27670-5-gnoack3000@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20261018173712.27670-5-gnoack3000@gmail.com>

> Date: 2026-10-18 19:36:52+0200
> From: G=C3=BCnther Noack <gnoack3000@gmail.com>
>
> In the kernel's <linux/unix_diag.h>, udiag_vfs_ino comes before
> udiag_vfs_dev, and it has been that way since the structure was added
> in linux.git 5f7b0569460b (2011-12-16; "unix_diag: Unix inode info
> NLA").  Both members are __u32, so code written after the manual page
> would silently mix up the inode and the device number.
>=20
> Also reorder the member descriptions to match.
>=20
> Fixes: 4f6a0a4a909e (2016-12-07; "sock_diag.7: New page documenting NETLI=
NK_SOCK_DIAG interface")
> Cc: Dmitry V. Levin <ldv@strace.io>
> Cc: Pavel Emelyanov <xemul@virtuozzo.com>
> Cc: Michael Kerrisk <mtk.manpages@gmail.com>
> Assisted-by: LLM
> Signed-off-by: G=C3=BCnther Noack <gnoack3000@gmail.com>
> Reviewed-by: Alejandro Colomar <alx@kernel.org>

Hi!

Thanks!  I've applied patches 1..4.


Have a lovely night!
Alex

> ---
>=20
> Notes:
>     Compared against unix_diag.h header,
>     where the struct field order is different.
>=20
>  man/man7/sock_diag.7 | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/man/man7/sock_diag.7 b/man/man7/sock_diag.7
> index d4e78c46cc8d..35a6d5a80ffc 100644
> --- a/man/man7/sock_diag.7
> +++ b/man/man7/sock_diag.7
> @@ -180,8 +180,8 @@ structure:
>  .in +4n
>  .EX
>  struct unix_diag_vfs {
> -    __u32 udiag_vfs_dev;
>      __u32 udiag_vfs_ino;
> +    __u32 udiag_vfs_dev;
>  };
>  .EE
>  .in
> @@ -189,11 +189,11 @@ struct unix_diag_vfs {
>  The fields of this structure are as follows:
>  .RS
>  .TP
> -.I udiag_vfs_dev
> -The device number of the corresponding on-disk socket inode.
> -.TP
>  .I udiag_vfs_ino
>  The inode number of the corresponding on-disk socket inode.
> +.TP
> +.I udiag_vfs_dev
> +The device number of the corresponding on-disk socket inode.
>  .RE
>  .TP
>  .B UDIAG_SHOW_PEER
> --=20
> 2.56.0
>=20

--=20
<https://www.alejandro-colomar.es>

--uayah3kf27csiird
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrY/ykACgkQ64mZXMKQ
wqmX/hAAuBYlhfItbMT5VX9Re8puUD2a4e43/ovTcmm+XBdZsde7vVg5O7hVn92V
s1amPyPj7cKL0513i+trwjqNGoulPrY2a2IYpbBr0x6FQl+n9j6UyOBh3LJ7vHvj
Y7atEvf9HH+GN3SKRt/6NYzFmQHveiKymyjfGLCfzfpehmW7X5A6LVlAXOmZmQj7
XYxUBUQ4XNe1SgrWHMfgI6T6Md1bVJfX1DBB2Epy40U+p5iHrY1I8KHP6AbdtGBg
xS6B3ceM4OqWrwQfepGTfIVVFGR9RS+sl8b+lTYJewlN+YddfXBwfTmENqKMmIKL
WJVA3sJAy0X4nOttyv/7F6s+ZYVchERfGCFaIIwxyCtTuRDDXqhDlpGMWBcUY8cI
t4nV+jsMqg0r0iXIDkiUPZPWorTFyJwa45VX/6VlDId4JK2U8xBlqIVo8aGZSi1A
/sSm1Kx3ZKGsPprBS6tDKJzu62j5VdXQeXGx/CLqlOkWla8FDMHHJMHR2Utl7hd0
883aSWkxBGc548j0wd8DmY0tYjZP1rSQS82cUvS9uAGrFIwEZj0L2FqBX8firr+s
m7jCLPumX1bSPJO4RBLZMlxpvUNjqQgyD0HXXLHxBu0kIQHH3hgrZF6wcjCC99de
sfhbnx9lBE/v8fw6gHP6rMr5AkCnsWnkFe47c3qDscJ4pgiSa+s=
=TLEh
-----END PGP SIGNATURE-----

--uayah3kf27csiird--
