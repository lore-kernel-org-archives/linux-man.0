Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793466905;
	b=LA89d9zHtcjCWc9dic6pnpUOPp+OTj8qKsUnSctftjEGiSlZ2G3vBku5uFN0Zwz9Rh0t
	 9LeO9XtEX+FniKUE3JGVbBDpZwlNJVGVt1c2U4Ye+tOuXE7mzEAz9+bjZe32jdiLz6vKV
	 +Hz2Kig8JONbUZHdhn5m1liKohSXfSh2kn637/mZCxxxsGswr4OeDmjNE6fGXkY4XtNnY
	 Mx8jwZGf3uet3pwHJA2CUQEzN4MoJGYpZTskBCK9If8ToLdiEWIiQm1+3CnF0/EuNNxF3
	 7Gd6spx+QdSyzhFCLgzv3R3yVzIKllo0mtiES4xe1t0eP7ZaGaQTREqYbNC/kbOwuqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793466905;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=zdUksmP8g0byaseX53LpuhPgRmtjgKd+VSO+/rNNLUs=;
	b=cY1/HFLIV+nail+8rEMbYQMnFm4twE90RypxCKE2mQuLUBZWcQdUcbhV9+5uP9dXdvM3
	 Fwod6eb3F8ZyOio+D0ksCx5ZxVckjBnKoK3JeICFf+B+qsA2q+1ymj5+ow3bVZu/cllKw
	 RH0rN9ledIUMHogvtvNDSHgOCVIaS7toyayxxWHRoqAkB4OyJDjKGsAgJM4xtuJ4MXYBc
	 nSa66MTgikDEeK8epxlJKAZ+LlUoOmcFPtPFkvx2rH+w5eVbpHyag85s3frhcFMHtVF3q
	 AxRTfv4iudw5ZBmQtUfVy0U5OwHuCTc7drdSnO/pGjixutrMRG1Psf+iRB5yKEPN0wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DmPO2VMf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9567606A31F
	for <linux-man@vger.kernel.org>; Sat, 31 Oct 2026 17:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DmPO2VMf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A76101F000C1;
	Sat, 31 Oct 2026 17:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793466904;
	bh=zdUksmP8g0byaseX53LpuhPgRmtjgKd+VSO+/rNNLUs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DmPO2VMfBERTGDZBmrVJV0lWjyRJSPzRnlDUUjFjJbrm7u8RIYBX4jrDAEqBWgBFm
	 +SslbMAhVfig2m6KGhs7ncFlzkW0IpHAfn4Ky8k5Dph2ZRr+mjistUtkWrZ2Ut69nE
	 VXYHRWn1bw4UUUUkx1xn1wzL+90UFg1R5sc4FLtA3ferUyDIo5Ngco4nsQbVhUoIWv
	 azUxjyV/2RVt+mJvnH2+4ETAIw8xZOOe+/RvzGHIFSpci18e/rycDeSPrW1S4brbmR
	 Qi1pxFVdUmIU4dGloYxMqyqZ9ugq/9sd3pWa6kWBQ1HzFI09imJPRt2X2wyC2Lw16O
	 DT0Y/IZK7+2pw==
Date: Sat, 31 Oct 2026 18:14:59 +0100
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Georg Sauthoff <mail@gms.tf>
Cc: Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org
Subject: Re: [PATCH v2 2/2] man/man2/adjtimex.2: Add error for clock_adjtime
Message-ID: <auYiAfs_HcbVnwS0@devuan>
References: <20261025125656.877530-1-mail@gms.tf>
 <20261027003712.905789-1-mail@gms.tf>
 <20261027003712.905789-3-mail@gms.tf>
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
	protocol="application/pgp-signature"; boundary="nko7rn4eu4j23tdp"
Content-Disposition: inline
In-Reply-To: <20261027003712.905789-3-mail@gms.tf>


--nko7rn4eu4j23tdp
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Georg Sauthoff <mail@gms.tf>
Cc: Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org
Subject: Re: [PATCH v2 2/2] man/man2/adjtimex.2: Add error for clock_adjtime
Message-ID: <auYiAfs_HcbVnwS0@devuan>
References: <20261025125656.877530-1-mail@gms.tf>
 <20261027003712.905789-1-mail@gms.tf>
 <20261027003712.905789-3-mail@gms.tf>
MIME-Version: 1.0
In-Reply-To: <20261027003712.905789-3-mail@gms.tf>

Hi Georg,

> Date: 2026-10-27 01:37:12+0100
> From: Georg Sauthoff <mail@gms.tf>
>
> The ERANGE error can be verified either via trying to adjust the
> frequency of a PHC by a value that is outside of [-X,X],
> where X=3D`cat /sys/class/ptp/ptpX/max_adjustment`,
> or via checking the kernel source code:
>=20
> <https://elixir.bootlin.com/linux/v7.2.2/source/drivers/ptp/ptp_clock.c#L=
164>
>=20
> Signed-off-by: Georg Sauthoff <mail@gms.tf>

Thanks!  I've applied the patch.


Cheers,
Alex

> ---
>  man/man2/adjtimex.2 | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/man/man2/adjtimex.2 b/man/man2/adjtimex.2
> index 5b9a0667b..6b6ee98b0 100644
> --- a/man/man2/adjtimex.2
> +++ b/man/man2/adjtimex.2
> @@ -537,6 +537,12 @@ .SH ERRORS
>  Under Linux, the
>  .B CAP_SYS_TIME
>  capability is required.
> +.TP
> +.B ERANGE
> +The frequency offset supplied with
> +.BR clock_adjtime ()
> +is outside of the range clock clk_id supports.
> +See also /sys/class/ptp/ptpX/max_adjustment when adjusting a PTP hardwar=
e clock.
>  .SH ATTRIBUTES
>  For an explanation of the terms used in this section, see
>  .BR attributes (7).
> --=20
> 2.55.0
>=20
>=20

--=20
<https://www.alejandro-colomar.es>

--nko7rn4eu4j23tdp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrmIhMACgkQ64mZXMKQ
wqlKJw//Zda+j1t7MJwLWQVSxDSc9c4gvixRx2eZLxL0jPHhWlZOizYTD/p3qnli
zoCUm/hPVvs9suOHBelaqaYEzYKVtQbj67Jmb0tGeca4mcqSrE4RCpTIR4P8bSfE
xWzy2GDUABCDtuUUxn/KX7fYFmvKXMqhFfs1+6d+q7HTED+vNGDGtKgsMY6Q1KVu
fNyFD2awGNdZ1mzzujIYZ7Ji9uj8v08oxOb0sU6Na1TzdbgZ3q9D+sYrkxMsZ7/d
Mc4i9xvLKgkd9AL9363VtSbWip2nQfxMm7SZUJRvCzuUoV0C+XSvM8dPMIEPHiie
7qt6XFy2pBVyyr2Y3iBeRbC6JRmIQ6nLjC3/gxh0bWqSBF5j+3mOVVf74SsVTBjj
k7YondOyuDg0vHw5q0gBWzD3XGQTFG03tTrmRBZB+OJvoyzMgXM2Je1U3d25YRhY
Vc1No95s18/PX3hu01G9BlcnpnNK7FZg2GajkhsNZAPybAA4/R2d3je6M66WGSou
yBx90As9l9FQeIaA8g2YUcWst1i8R+hU5gv/KI35Xt/hxfU2mNDlJiCGhlTv0MX0
czW3WHuZvixy7z4PBB0WoNjYtbMdvX+tUUzgcSQJcPE3SHkmJ/A1S5jOWzoJfIy2
/fWXfUhE8MxZIFXaPJ4TA6XV6Jg9vYEO496VrWDNcD8mu8/jSRI=
=Fw1J
-----END PGP SIGNATURE-----

--nko7rn4eu4j23tdp--
