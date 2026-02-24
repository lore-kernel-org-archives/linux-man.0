Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23691DA0E1;
	Tue, 24 Feb 2026 00:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771892488; cv=none; b=WUwjfbm8YPjdswrvTuvKZ9+ipKtJ4QEB3zSTPUwQHMdBuvfSKBVTiCeW6LtZXR43kAjsdFfboCcv77x0DEucQw4QbYrzlKQJo/DGZE2YubzU1aQbDjAsyxGr+ShldSunMkXNGLarX9Nix/RIZ0qTUWf4Sz/EL4cFnELBZ77y/w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771892488; c=relaxed/simple;
	bh=MMMhkd33YJZrOlAzw/e+SKjsKAkJ2Dokk+GmA7qJ9dE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YqXeh8vdaujeYfV1ia2qkqPlkS52W8Uj40fuw3lt1MpspzLeIKBvCZboSsaD3LnBfhwqHm7PrW75430eDrBhNjuz40W+MHOLFBAyBlh8Ro1lJ5cZIZqb9B1LmBc+KDkiF0nTYMF7ekb5Wk3uz2gZCWSSDrK/V28Xe34P4/X/3HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jKZreMnF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jKZreMnF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1A5AC116C6;
	Tue, 24 Feb 2026 00:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771892487;
	bh=MMMhkd33YJZrOlAzw/e+SKjsKAkJ2Dokk+GmA7qJ9dE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jKZreMnFc2NR8xo7NHrBNZQaaubr4HkM4qKEpmoPcgRV9uOYdJoMVQNT5tyMccRqM
	 sQU0z5eGOH6DkTBhcqiutEmiOQe1I5qyCbMjbGag7l7TRpgsD7bUeC9L832v3sfJIA
	 KYnEHPLATHIR/wgdwetEjbxY55cSd2pVRclaX992yl7NczECAdjg9OIqMSokjVercY
	 mTIq7GY4tMoTztz+Icu2Vc89bkqsf9FYPRG8csvGM76G36zqUUKnF2eXH2ea7bGQTQ
	 MhDAzAczVzCPInFUECMz6DOn3vwRHQQScwy0uYXnPRyIL1H+j/fjqrx6V00IHArKJP
	 96TDbjCR4P4EQ==
Date: Tue, 24 Feb 2026 01:21:23 +0100
From: Alejandro Colomar <alx@kernel.org>
To: Bhavik Sachdev <b.sachdev1904@gmail.com>
Cc: avagin@gmail.com, brauner@kernel.org, criu@lists.linux.dev, 
	jlayton@kernel.org, josef@toxicpanda.com, linux-man@vger.kernel.org, 
	miklos@szeredi.hu, ptikhomirov@virtuozzo.com
Subject: Re: [PATCH v2] man/man2/statmount.2: Document STATMOUNT_BY_FD
Message-ID: <aZzuI5pPe19gFvPf@devuan>
References: <aZx02VGlW2GfBdce@devuan>
 <7d4b22c595feeadb3be6df8a8781344597120f7e.1771870502.git.b.sachdev1904@gmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k3hsmvwmdtwrh4gy"
Content-Disposition: inline
In-Reply-To: <7d4b22c595feeadb3be6df8a8781344597120f7e.1771870502.git.b.sachdev1904@gmail.com>


--k3hsmvwmdtwrh4gy
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Bhavik Sachdev <b.sachdev1904@gmail.com>
Cc: avagin@gmail.com, brauner@kernel.org, criu@lists.linux.dev, 
	jlayton@kernel.org, josef@toxicpanda.com, linux-man@vger.kernel.org, 
	miklos@szeredi.hu, ptikhomirov@virtuozzo.com
Subject: Re: [PATCH v2] man/man2/statmount.2: Document STATMOUNT_BY_FD
Message-ID: <aZzuI5pPe19gFvPf@devuan>
References: <aZx02VGlW2GfBdce@devuan>
 <7d4b22c595feeadb3be6df8a8781344597120f7e.1771870502.git.b.sachdev1904@gmail.com>
MIME-Version: 1.0
In-Reply-To: <7d4b22c595feeadb3be6df8a8781344597120f7e.1771870502.git.b.sachdev1904@gmail.com>

Hi Bhavik,

On 2026-02-23T23:47:03+0530, Bhavik Sachdev wrote:
[...]
> diff --git a/man/man2/statmount.2 b/man/man2/statmount.2
> index 5ac96796c..a5b135bee 100644
> --- a/man/man2/statmount.2
> +++ b/man/man2/statmount.2
> @@ -24,7 +24,10 @@ .SH SYNOPSIS
>  .EX
>  .B struct mnt_id_req {
>  .BR "    __u32  size;" "        /* sizeof(struct mnt_id_req) */"
> -.BR "    __u32  mnt_ns_fd;" "   /* fd of mnt_ns to query the mnt_id in *=
/"
> +.BR "    union {"
> +.BR "           __u32  mnt_ns_fd;" "   /* fd of mnt_ns to query the mnt_=
id in */"
> +.BR "           __u32  mnt_fd;" "      /* fd on the mount being queried =
*/"
> +.BR "    };"
>  .BR "    __u64  mnt_id;" "      /* The mnt_id being queried */"
>  .BR "    __u64  param;" "       /* ORed combination of the STATMOUNT_ co=
nstants */"
>  .BR "    __u32  mnt_ns_id;" "   /* The id of mnt_ns to query the mnt_id =
in */"
> @@ -89,7 +92,7 @@ .SH DESCRIPTION
>  .I bufsize
>  with the fields filled in as described below.
>  .I flags
> -must be 0.
> +must either be 0 or STATMOUNT_BY_FD.

The macro should go in bold (.B, .BR) here and elsewhere.

Also, should we say the same as elsewhere?:

	"It is an ORed combination of the following constants"

and then a list which contains only STATMOUNT_BY_FD?


Have a lovely night!
Alex

>  .P
>  (Note that reserved space and padding is omitted.)
>  .SS The mnt_id_req structure
> @@ -110,6 +113,25 @@ .SS The mnt_id_req structure
>  .I req.mnt_id
>  (since Linux 6.18).
>  .P
> +.I req.mnt_fd
> +is a file descriptor on a mount.
> +If STATMOUNT_BY_FD flag is specified,
> +.I req.mnt_id
> +and
> +.I req.mnt_ns_id
> +are zeroed, the function will return information about the mount the fd =
is on
> +(Since Linux 7.0).
> +.P
> +The fd can also be on a mount that has been lazily unmounted (see
> +.BR umount2 (2)
> +with
> +.BR MNT_DETACH ).
> +In this case,
> +.BR STATMOUNT_MNT_POINT
> +and
> +.BR STATMOUNT_MNT_NS_ID
> +will be unset, since an unmounted mount is no longer a part of the files=
ystem.
> +.P
>  .I req.mnt_id
>  can be obtained from either
>  .BR statx (2)
> @@ -392,6 +414,17 @@ .SH ERRORS
>  .I req.mnt_ns_fd
>  were set.
>  .TP
> +.B EINVAL
> +.I req.mnt_id
> +or
> +.I req.mnt_ns_id
> +was specified alongside
> +.IR req.mnt_fd .
> +.TP
> +.B EBADF
> +.I req.mnt_fd
> +is an invalid file descriptor.
> +.TP
>  .B E2BIG
>  .I req
>  is too large.
> --=20
> 2.53.0
>=20

--=20
<https://www.alejandro-colomar.es>

--k3hsmvwmdtwrh4gy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmmc7wMACgkQ64mZXMKQ
wql+/RAAqryzGdIji6M+3G8Tu+zvk4658+Ku7udijh3x4E/XySiyjfpTkumwyTWT
lW88GPVWO1u5sweQGjpyN53Zlb48w5lle0oibZCVAHcioM+yvHaCFMhzDJL6N5eI
RQhrp3kz3glwPMsNb8/YK8H0xdQ8Mva81Eb1/dnm2Ek4rUrFJz92gXxmowgl2+ox
Jl4KWeWmzAsr6AYJJs3RAuePDrowZad5mA4eoL8EY2ncylMzAofF6nES3UjoD3Ef
Q2STz2/q9kWJbomTKwez3uLhms+aGuAeGKoqcVxAT9E3ltfHJrYcyjpIuBzjzdgD
4DJbHKCjlRifCV4Ucc8icMRzjKRC4i1gqREJK7UY9UD5scFAux98u5iq7IoMym68
xSWFzZrtY3GpohXBcvlzu5esCCXpFfkXhtIoPjvUKwube/s8SBRSb6xqxooS1eiw
9vSQ0rm2HQAURmsUZhz+tCF9GclzswR+X6GjG0EW3WT4LTdWAdhLRNUaHWVPEZIj
+uxuuZyASl83GOtlTAzDCLNyIT9td3IFGdg4wfdsXBjpEiEFlMJlBiziNPx5l/uq
9t4Fat0QLHRlGhAjD9A30WG8ZvjpgJTxNTL8hsCKabhHSjjWxfvSMQwKFIXDCqJT
fII4MGcpJl2vGGN5hP9c05OIQ39vM+eleUdAW+S1L0OFHqgPDvE=
=qrJT
-----END PGP SIGNATURE-----

--k3hsmvwmdtwrh4gy--
