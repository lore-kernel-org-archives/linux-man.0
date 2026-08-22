Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B18937F01C
	for <linux-man@vger.kernel.org>; Sat, 22 Aug 2026 13:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787407142; cv=none; b=IrEn47/8iiCuBWD5S57dUjFQQeRowgnelqJBXIiHT0vmbY5Ux1m7mYyXWVCwWi+UrsKFmVY/9PuQoxw1oiOY97x4bXRn1OlwVwU106m9z0SKD54jFoB3HwCNU55VyFhMmpxoMm7Ps0PgyKZfFog8k8SwJM9YU2ntK6d4fVsfsJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787407142; c=relaxed/simple;
	bh=2U/7NZD11HIFsY9RKWfdin8hW5czr8Tadmgw4Y/iQOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BwAqitPqJXGEmTjU5QNwwAjedurFsUC343z2gd7HfUQM9/PYZgUhgPVa9FmoRuklAUQh8Bujl6jQTj2UGLgEAHZLW/+MaaYclW+tRs2bF/nZP+SSuuiJOYaZGReqYIDR3338CtvjUBWtt6wzc3eYxrHPgqks4DDBqRhr2ScQ1uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HxuncOQ7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HxuncOQ7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06F081F000E9;
	Sat, 22 Aug 2026 13:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787407139;
	bh=/O1sgk983YC/nmgw0vtRsWGCoAdhlim6B8XAiNgDsww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HxuncOQ7ouW6qvVrZWsmXE3M1/T5BpMXfJLZPWksBub//MaVZt9+Uy2fQiT7c7JMt
	 ltdDtfI62wJhLEEeHJKzbPNTuDABnsIFw01V8Lns3tPO8bEA1JbycZkhxq9P6WreYN
	 1hoXBl7fW+n8xgIM2EYsTrZObtSFCrPdVB0h5XFQ2TjMYyGpjWASoiemORoMsUx5HQ
	 YW45MzxW6VbNwYLHE5UNZOe19Qoxf7zx+FxD1INKUhE29riWs45fJeqdckSbTtPHK0
	 UGIpyGslojvbe7plgmmQLYDCyucwgPZ5bmHCkUGoP9NU7l3e+FIEzyL7xSSpts+SzZ
	 BAtXfFalvysiw==
Date: Sat, 22 Aug 2026 15:58:56 +0200
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Cc: linux-man@vger.kernel.org, nabijaczleweli@nabijaczleweli.xyz
Subject: Re: [PATCH] man/man2/futex_waitv.2: Fix example compilation
Message-ID: <aomqlZqj26mroz96@devuan>
References: <20260813160619.52416-1-andrealmeid@igalia.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kwtdm3hjhvfwuend"
Content-Disposition: inline
In-Reply-To: <20260813160619.52416-1-andrealmeid@igalia.com>


--kwtdm3hjhvfwuend
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Cc: linux-man@vger.kernel.org, nabijaczleweli@nabijaczleweli.xyz
Subject: Re: [PATCH] man/man2/futex_waitv.2: Fix example compilation
Message-ID: <aomqlZqj26mroz96@devuan>
References: <20260813160619.52416-1-andrealmeid@igalia.com>
MIME-Version: 1.0
In-Reply-To: <20260813160619.52416-1-andrealmeid@igalia.com>

Hi Andr=C3=A9,

> Date: 2026-08-13 13:06:19-0300
> From: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
>
> The example doesn't compile because it calls the undefined function
> my_futex_wait_private(), which should be my_futex_wake_private().
>=20
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>

Thanks!  I've applied the patch.


Have a lovely day!
Alex

> ---
>  man/man2/futex_waitv.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/man/man2/futex_waitv.2 b/man/man2/futex_waitv.2
> index 9dfad84ce..4158f297d 100644
> --- a/man/man2/futex_waitv.2
> +++ b/man/man2/futex_waitv.2
> @@ -352,7 +352,7 @@ worker(void *arg)
>  \&
>  	usleep(*futex * 10000);
>  	*futex *=3D 2;
> -	my_futex_wait_private(futex, 1);
> +	my_futex_wake_private(futex, 1);
>  	return NULL;
>  }
>  \&
> --=20
> 2.55.0
>=20
>=20

--=20
<https://www.alejandro-colomar.es>

--kwtdm3hjhvfwuend
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqJqyAACgkQ64mZXMKQ
wqmg7w//fCKDvNjgAWhgWnowjXjD13C95xLMqoXfJn4mVFPVY9hM+4wTrI9ducoT
8PC5D1ekq9DjUShS1+sxuPBAJZXNSwS7F2MAzji7j6L2vRXsH55LpIBiGf56sXDI
PfKhgtVyx82k4EHxAc+CCta7q6QpCx2bWyYwM3olLVr57nUXm3wZlXnDyHTHCXXt
RbYKkrWFnt61tLiNveUCPGWTpLXvVo9crV0N/s+NqO5wRF2Qbic115OenFYVXtNc
cNrHplBei0m5DJ8PgCSN4cx6KP26BGdoq2fGykNTy3G1/jAUk1d/VEtaWD0xm1TK
555uZDoenFDIyuyqy39WzWn2dSrKOapFK43NCZFgTpe2n6OVUJ/iawqJ6CjY94My
RJFBDiVMZ8LfiNUvyEfctr4sFILhkrO7C6MK7FMP1GX+3vp5yB5fR6GhhCXp5HLO
teqVAp7fP/0yvFzJUvMMVdSWmslwbDeYM6G8EL+C6rH9xRMK9J1ZUyQ2ecp8PwTc
b0wAtsVfAA/0mKBZUnoWyRlLAjqxhVfBWDXX4maDz2Yj5Hz6fpn6W5T5mzkvtSny
KP2QxigdbevBAev3089/cx4FGQjWLUF6z7ssKagrfPuzyaqcHQG8VUZKh3tKapXe
RKpSu2jrNPaKJTieVD43eOQRDMWgx1rwUKTpQh0SE0ctDdfCSqs=
=Us5K
-----END PGP SIGNATURE-----

--kwtdm3hjhvfwuend--
