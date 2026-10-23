Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792784267;
	b=Bg+SmfoTG39mjD5IAfj3wd0ORQuinc+q9Jb6Py/Cp6jLkiDFRhUM9syTglIlxi6N+Sxs
	 Z0oT8AB81fAVxrMbRzFyoqEErfmzQXDvukAdKYf1KUSZzyDUhdRebiZ9EzV0evn0mMzAr
	 UIsNjmZM7l2D6UKaDmuuyxzUz6gEL82Oqaz0FF+VEgYJw8l8AYDGyeNw9S3RI3NtgcBXM
	 743YC1DaCkGmAL0fysc+vfOlsCIUn0yGHt7PbRidvR8+KTND43O8LqQ0KHPkML9Um7Xxz
	 iJGYcvCD92qFvMBNx7FnDcaIco0RVUhGPAd/kXogHiUvzxWSfd3EqdtCDccBz+5iHTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792784267;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=+DdL0Kx+r/wZYNrbRlMieEri6X7T3AbIc7xc8mfJJGA=;
	b=WuMhkP9sj3Wzq4Ls6pOxe+reRR9JUQylO5YRvw851IQ7o0klAo8qhtK3cs1E6CeKwsVM
	 rvNnIzT5HXMTrwgquhm+JMeebXHWbhiwYTBGgw5Mk7Lm2itpp57q1lsQ574pCCCxhb8zs
	 vo+w4O7xMigKfCp65nxnHb9RtpmLsqFcYLgAm9jkxtxnyikuPWKmzyoyFEFKe0OYk/kX1
	 qfVPAs0QK5M77SQbmmaTMMJG082Gv7ipLDyUozSXldSLHQHtAG/qiUkO1HLvjHqGVA4qn
	 SVTth27yqRRwrd7TIxABCMsaxR0nX94VurDvjx+myVMsMnzxpIberJumfPq9vVBpD2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gacuAVj2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6AD606A31A
	for <linux-man@vger.kernel.org>; Fri, 23 Oct 2026 19:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gacuAVj2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D2EA1F01825;
	Fri, 23 Oct 2026 19:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792784267;
	bh=+DdL0Kx+r/wZYNrbRlMieEri6X7T3AbIc7xc8mfJJGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gacuAVj2ZeOAB01OWFslGz7J+BvXz3d6lOC1vMJf5SDyhL8/ZVFtGyJa661saac6T
	 /P7CwaOiNB3ruDvrImmLEjCvi/dbUUWp3REY6H6fAdRNZD4EcfddDdGEWKus+efuU7
	 qbjlSZ6lLYjyUxrfUCcRgIJ/n6fMbRJfYjHjYq9P07wEoMqpj6hIseTLtCBzKOc0wd
	 i3lSu4goUIXs6kNOGDp4Q3U22euC2SOivmeiDd4x1sJPUtzHfe7TONCLhT/7nDXVQJ
	 bd3RbuKiGyg5ctANylTIeEJ/4PXOpRu8FCXRzIwc4KqCjy/1JBZ74UY+WqJP1BGaRF
	 +/pLTbM9tQABQ==
Date: Fri, 23 Oct 2026 21:37:43 +0200
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: "Enji Cooper (yaneurabeya)" <yaneurabeya@gmail.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH] man/man2/sched_setattr.2: update `EINVAL` case with
 `.sched_flags`
Message-ID: <atu28R9-CdAtoz-V@debian>
References: <A89056FB-15B8-454D-9C6F-9EEB75965302@gmail.com>
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
	protocol="application/pgp-signature"; boundary="c3onucmipvxslkue"
Content-Disposition: inline
In-Reply-To: <A89056FB-15B8-454D-9C6F-9EEB75965302@gmail.com>


--c3onucmipvxslkue
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: "Enji Cooper (yaneurabeya)" <yaneurabeya@gmail.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH] man/man2/sched_setattr.2: update `EINVAL` case with
 `.sched_flags`
Message-ID: <atu28R9-CdAtoz-V@debian>
References: <A89056FB-15B8-454D-9C6F-9EEB75965302@gmail.com>
MIME-Version: 1.0
In-Reply-To: <A89056FB-15B8-454D-9C6F-9EEB75965302@gmail.com>

Hi Enji,

> Date: 2026-10-23 11:58:57-0700
> From: "Enji Cooper (yaneurabeya)" <yaneurabeya@gmail.com>
>
> In more recent versions of the kernel, `.sched_flags` is a treated as a
> bitmask that supports values like `SCHED_FLAG_UTIL_CLAMP_MIN`, etc.
>=20
> Account for the additional flags so the documentation is up to date with
> the kernel implementation of `sched_setattr`.
>=20
> Ref: linux.git 480a6ca2dc6e ("sched/uclamp: Allow to reset a task uclamp =
constraint value")
>=20
> Signed-off-by: Enji Cooper <yaneurabeya@gmail.com>
> ---
>  man/man2/sched_setattr.2 | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/man/man2/sched_setattr.2 b/man/man2/sched_setattr.2
> index 80a0ac726dcf..64acdd88884f 100644
> --- a/man/man2/sched_setattr.2
> +++ b/man/man2/sched_setattr.2
> @@ -417,7 +417,10 @@ .SH ERRORS
>  .B EINVAL
>  .I attr.sched_flags
>  contains a flag other than
> -.BR SCHED_FLAG_RESET_ON_FORK .
> +.BR SCHED_FLAG_RESET_ON_FORK ,
> +.BR SCHED_FLAG_UTIL_CLAMP_MIN ,
> +or
> +.BR SCHED_FLAG_UTIL_CLAMP_MAX .

Why does this list not include flags such as SCHED_FLAG_RESET_ON_FORK?
It is documented in the same manual page, so I expect it's valid here,
right?


Have a lovely night!
Alex

>  .TP
>  .B EINVAL
>  .I attr.sched_priority
> --  2.50.1 (Apple Git-155)
>=20





--=20
<https://www.alejandro-colomar.es>

--c3onucmipvxslkue
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrbt4cACgkQ64mZXMKQ
wqm7zw/+I2zMJ5XZs9STH4F0F4s5SKZlciDSZ3+RvE0hJlBYmNtgzzlCd+i6LTMS
zpLpPUePifz+/ATUE3DvVtDdRbXRIQrnWQC7rZr7RwovQlRJX6fS51nMI/u/k2hT
rDy1XJu1xwJcJOXe1K37jfNwJUImfiR+qsNCkFEqdvzbFlUsy6EEzzsScQg22L1+
ROcNArQkkeI/cfkG9VRJ7al4S2OIIxILh7FgRXWBQshvfTjyEf+Zt851cZoE4MCu
HF7M7jZKHVcemM/WLTFmdbgm/gejhjAquPN9MflLxE7HRgxSIr6RxNgAdDAKPCbS
qDngTXVYULQ9hXjIDGF+2aNrn4SO8AYg8E9DvfKUnUfENJyF/45UWE+sVTmK9Dx6
OgrZQ+ZKTdHIsjaanKH2zZk3fOh7O+t2iZcBSDF7PyczzSzxCvsUBmsKrofp+fq3
dPVDdbyA+Bs+GLitJcTfiII8FOQb2IxnCrQcvkc4uJR1e3O7DfhZVW09zQtVDckD
HNRdOpejhgPRqk0Jzw8OcZhwmadCOTA1YGWtG8jxBX62P61ImNcAnhYdZoVHJ8ao
AnQ/c5qF2eXSGQ03G0LK/iRQHWELW++Px1UfaTQqoIekDYJU27YVnn+Hc6pFwS7W
iRQ6tmpsNilcIIA/4BfWsRxvYUJA45yLRmLofu72s3FYCZIuRwk=
=pfDc
-----END PGP SIGNATURE-----

--c3onucmipvxslkue--
