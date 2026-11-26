Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795733941;
	b=kEAwuSR50JDlytgTemI8j9cmlM+cgCgZfo8iFZKueAbl4rkKtbcgWsRC73QQll9hGhk2
	 pnb9F4XuAGCiC34H4tKXSwVRKHWO4h95f1blrbyABWnQKOOTo+hHD8BApCAPmReTs7yUj
	 6jk2fEKSajxJD6oKa7Vri1m8kLoZP9U8In4/l9TUm7imV9AbD+DTlGpdQy+hdbXQImmHc
	 ug60FccS/hYmVEQfCcW/R/ngkBoiy4Lh9aj7fUkPQ8EeDkdZLDW50gjO1pmxfX2Nsn+5R
	 kxXlUNx4Gln+UlrORugKKyNHRAkX0GDb++uoW52a/nfWh7RwbZM3YgCAL/Zih9mdTHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795733941;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=r8/d1JEFUXJHjlT09eBfphlN9FD8n0wa63vyPWgxTkk=;
	b=XJWvhfaNmkA/9n5Uu8219bslVcdgHC7f/YSV0Zh6YisLMg5Uloxv0ZpHLXXOyShwi8zH
	 B6hCWAXeejUj6GOfwHQ5noC7aALDne3b43flCJBW0I9OfSmp1ynkuqpHxtuEFwtXN3fRU
	 OwNAySJOcGxcFMtMvhQKBDG4hExCdZLlSFT4YvDB/hlUiL4i8fpXw5KnEcy83hCeuPCBW
	 pxfoZhqWxDNTFQvFF+ybu3ifcgLfXHRiGFybw3HDvQoDPgYb7mG4huU+DRwy05TEaiBXc
	 Lk4vUAvgyewRQArZ9xq6IcsmaBSeE1yTPlXsdO/ag7Z5Ym3nQzWCJNNfozIpk04IDFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DzLZbsgu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3EE606A326
	for <linux-man@vger.kernel.org>; Thu, 26 Nov 2026 22:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DzLZbsgu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04F7F1F00896;
	Thu, 26 Nov 2026 22:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795733940;
	bh=r8/d1JEFUXJHjlT09eBfphlN9FD8n0wa63vyPWgxTkk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DzLZbsguuO68lcVvPFwZYu5Swv0zalAbUV62svbJMMimH8vdWzaiL57bSd0GNtMYd
	 Ra5F0GjtwocWnuvDMpI8dX7nPFxh5zJTqS3/LDDF6rOHDh27oKKwQuYMStJBAL3cd9
	 wzdI/7bFwjI34kgeEhjN3Vor16HkGQoDjbtUdilSWZqAuH7Xg0rdS3ApXU+PqMprVD
	 Yqu+ScgjdToijp+EenRNFwTEV6NnXjvruFgNeoINH3DdocWjnLcG02i7JkJZ8lUokV
	 EWrga7E9/IdHFnMM3vlRqg86qISJDWg9+h9zVVAqMMOVzzSc15kTDRj1UbSXrHZ14S
	 hNJ+meyZkGjbA==
Date: Thu, 26 Nov 2026 23:58:56 +0100
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: linux-man@vger.kernel.org, Michael Kerrisk <mtk.manpages@gmail.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>
Subject: Re: [PATCH v3 1/5] man/man7/unix.7: SCM_SECURITY: Generalize to
 other LSMs, not just SELinux
Message-ID: <awi5ncjq0qTWo5cK@devuan>
References: <20261120161202.27163-1-gnoack3000@gmail.com>
 <20261120161202.27163-2-gnoack3000@gmail.com>
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
	protocol="application/pgp-signature"; boundary="khb5ldtlmlhvejgv"
Content-Disposition: inline
In-Reply-To: <20261120161202.27163-2-gnoack3000@gmail.com>


--khb5ldtlmlhvejgv
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: linux-man@vger.kernel.org, Michael Kerrisk <mtk.manpages@gmail.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>
Subject: Re: [PATCH v3 1/5] man/man7/unix.7: SCM_SECURITY: Generalize to
 other LSMs, not just SELinux
Message-ID: <awi5ncjq0qTWo5cK@devuan>
References: <20261120161202.27163-1-gnoack3000@gmail.com>
 <20261120161202.27163-2-gnoack3000@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20261120161202.27163-2-gnoack3000@gmail.com>

Hi G=C3=BCnther,

> Date: 2026-11-20 17:11:58+0100
> From: G=C3=BCnther Noack <gnoack3000@gmail.com>
>
> Reword the description of SCM_SECURITY to not be specific to SELinux.
>=20
> The security context is populated in scm_passec() in linux.git
> net/core/scm.c, through the security_secid_to_secctx() LSM hook, which
> is currently implemented by SELinux, Smack and AppArmor.
>=20
> As clarified in [1], the returned security context is in the general
> case a byte buffer, not a null-terminated string.  The only LSM that
> returns a buffer with trailing null byte is SELinux, but even that is
> not guaranteed in case that the message is truncated.
>=20
> Link: [1] <https://lore.kernel.org/all/auZcwYWv0NeiIR8d@google.com/>
> Fixes: ffad6a017f91 (2018-07-28; "unix.7: Document SCM_SECURITY ancillary=
 data")
> Cc: Michael Kerrisk <mtk.manpages@gmail.com>
> Cc: Kuniyuki Iwashima <kuniyu@google.com>
> Cc: Eric Dumazet <edumazet@kernel.org>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: Willem de Bruijn <willemb@google.com>
> Reported-by: LLM
> Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
> Signed-off-by: G=C3=BCnther Noack <gnoack3000@gmail.com>

Thanks!  I've applied the patch.


Have a lovely night!
Alex

> ---
>  man/man7/unix.7 | 22 ++++++++++++++--------
>  1 file changed, 14 insertions(+), 8 deletions(-)
>=20
> diff --git a/man/man7/unix.7 b/man/man7/unix.7
> index 61f06a74359b..3322d915f1bb 100644
> --- a/man/man7/unix.7
> +++ b/man/man7/unix.7
> @@ -312,7 +312,7 @@ .SS Socket options
>  is an integer boolean flag.
>  .TP
>  .B SO_PASSSEC
> -Enables receiving of the SELinux security label of the peer socket
> +Enables receiving of the security label of the peer socket
>  in an ancillary message of type
>  .B SCM_SECURITY
>  (see below).
> @@ -538,13 +538,19 @@ .SS Ancillary messages
>  option must be enabled on the socket.
>  .TP
>  .B SCM_SECURITY
> -Receive the SELinux security context (the security label)
> -of the peer socket.
> -The received ancillary data is a null-terminated string containing
> -the security context.
> -The receiver should allocate at least
> -.B NAME_MAX
> -bytes in the data portion of the ancillary message for this data.
> +Receive the security context (the security label)
> +of the peer socket,
> +as provided by the active Linux Security Module (LSM).
> +The received ancillary data is a byte buffer.
> +.IP
> +The exact format of the security context buffer
> +is defined by the active major LSM.
> +If the caller does not provide sufficient buffer space,
> +the buffer is truncated in a format-unaware manner
> +and
> +.B MSG_CTRUNC
> +is set in
> +.IR msg.msg_flags .
>  .IP
>  To receive the security context, the
>  .B SO_PASSSEC
> --=20
> 2.56.1
>=20

--=20
<https://www.alejandro-colomar.es>

--khb5ldtlmlhvejgv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmsIubAACgkQ64mZXMKQ
wqlGahAAuLA7LmBi1UDt0fCtn/zo7Zecr31BPHDoXWu4v5OjostLkwV+Z4InuMg6
ozmBR2pVc3TLNxoukY2GjreVhW7SnhpSc3P/pJAZLJIjs7/KrR9inWpvSyRcCUyn
CqDB6NXD3/2nVVe6ZoH83hedTjEc10zWfjSFvl4rtMCDElbFvXxNVBEvGOZuYunX
N4O1GWWO2wGBvppfnxUoC4cr7EPKkVtzMHl8txct1q8N5hLwrNRScrhKLEssA8XC
ZmXCUg2ZPRcSaJ+ZEsmRkVhBC2TadI24mPfPSXNJAc907NiFm0ciNGiv21CZFoMW
QwlrZwoRO7LE/5WZFz/4e52Jv07UP/OCdPxmYxBsZl42mtFAlLDeluLxQLDHfNDl
9S/rz+scGp4fcT7MZ76SGAe96+3tM7BE4UO1HAAqRjAFex1G08hicVgLaR6fOsSz
FjcSfH6gETOO1K/lYnsWgXVZFxzdP+4ACeK7mF12YpyFNwvwxsUOD5EqDv31XO8V
E3cIw9TJGplZo0fy+Kd6PoA8wijz+o8Ugwd3Eth7V4VdU3D9Tcw7JBbQ3CXBy8jK
PPCUKLXcvmJZhfigWDjdQq9ZtI8t9+QojQz5e01vJ34fOAihbfXcVWVJrTFCFPOi
z7ckf+MY9sD6HURYQzGidr+K8sbpJvakeK7trvR2OBhmF78kVkg=
=XZzq
-----END PGP SIGNATURE-----

--khb5ldtlmlhvejgv--
