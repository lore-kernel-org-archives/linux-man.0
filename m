Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792749468;
	b=bwdpNn16oHBi1cLCGn/28BOGKGVwC92rJzxFAXuQqmh6UKaUo2SMjRBhSkuMP5EQrlIm
	 KzRJTn+ILxUPBXUPrDS0M6yb+pTgyk0jLRQwS2wk/G8IJiEqWEqUGDpKRuLZq6ro42U+8
	 YPI0tqQ0YfjQdqUcvwQtREAjJyV6phRU1VRLUnDjRIGBOKibWCdgL4nQBEM0qqFg450W7
	 qoMSIOfDj039DkwQ1G52F8JszUTddZFnPDViPSDn1fjnUwVOjOIln/w/8WJyZKFZv0pBN
	 T2Sx19GYd4zBQqB9kkFjkKxI0bRoNDTvNcIlO1fL6c8jy+hd2Hhz3bN5aLOBicNnX0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792749468;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=+FOqBF9+9e1CGIofy0RDCOPjrCet66xsYDzIokfdNM0=;
	b=2YvB7GBvEdBRlIBiFmYcpUPjS20OkvkoknsQMe5SCuKDubTG9QPtn4fBUpWtzn3PnLYr
	 8NZXT3tBjisqPr/7lROxjK+Zkhy+gl7s+hR5yXAzb4abxX8sLVT3KA6y9A2UHgfNj6N9k
	 sDKK2pSSROi27fFrxfu17ixk9cqA0zALgtfBX2Cm5Ozm08ZKAB2pNxfY8FDMvtYur5V2+
	 1RE7uPyqUtKZG2uF/gUGEsm7eHTqvHMNIo4dIFQu419CR0vFizOKBFT6It2giLLhJPCYw
	 a0ULLVPyrKw4QC+JAh4snMJ2bITdh/9oGe88PdYiLETGSYeUBBWuniHWZXsV2J+Qdyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MwiY4Osl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23243606A321
	for <linux-man@vger.kernel.org>; Fri, 23 Oct 2026 09:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MwiY4Osl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4387D1F01825;
	Fri, 23 Oct 2026 09:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792749467;
	bh=+FOqBF9+9e1CGIofy0RDCOPjrCet66xsYDzIokfdNM0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MwiY4Oslv2LwrWg1OVnCjdjF+jc2F7s1UMb9uYaK9SHUNbOKNQgyPJRU/U5jhovtB
	 dI9u/SVmv1qZhtGghdd95hAVkummd/P8H5UcREyC6kefcQ1+L+9gESETYUkPeb5ZGM
	 MSc+Q+a64Bxd/EIOflNaeGi7aS0K+AZBKv+ifmLgqrO0goftYYnsIWtlG+zk9bOtuH
	 +kUJUJDd/K/MmEYQb7KCRDeTkVXEtgYI20gMHgZKPHS/yQ5XicKdSkH0TUqiNppX50
	 zqjTpiawuTV0LEm9xc8Gbd1+UIj97dHphYXkiWAKNcDFEA04vWkp5KkU/xpfHm+nF8
	 eFlgTtu+0VSog==
Date: Fri, 23 Oct 2026 11:57:41 +0200
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: linux-man@vger.kernel.org, Michael Kerrisk <mtk.manpages@gmail.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>
Subject: Re: [PATCH 4/7] man/man7/unix.7: SCM_SECURITY: Generalize to other
 LSMs, not just SELinux
Message-ID: <atsufiZwUg3d-cKs@debian>
References: <20261021212256.27961-1-gnoack3000@gmail.com>
 <20261021212256.27961-5-gnoack3000@gmail.com>
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
	protocol="application/pgp-signature"; boundary="7gx4jq2do7gf4w53"
Content-Disposition: inline
In-Reply-To: <20261021212256.27961-5-gnoack3000@gmail.com>


--7gx4jq2do7gf4w53
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: linux-man@vger.kernel.org, Michael Kerrisk <mtk.manpages@gmail.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>
Subject: Re: [PATCH 4/7] man/man7/unix.7: SCM_SECURITY: Generalize to other
 LSMs, not just SELinux
Message-ID: <atsufiZwUg3d-cKs@debian>
References: <20261021212256.27961-1-gnoack3000@gmail.com>
 <20261021212256.27961-5-gnoack3000@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20261021212256.27961-5-gnoack3000@gmail.com>

Hi G=C3=BCnther,

> Date: 2026-10-21 23:22:53+0200
> From: G=C3=BCnther Noack <gnoack3000@gmail.com>
>
> Reword the description of SCM_SECURITY to not be specific to SELinux.
>=20
> The security context is populated in scm_passec() in linux.git
> net/core/scm.c, through the security_secid_to_secctx() LSM hook, which
> is currently implemented by SELinux, Smack and AppArmor.
>=20
> Also clarify the properties of the returned string:
>=20
> * There is no NAME_MAX limit on the length; SELinux contexts can be
>   longer than that.  If the control buffer is too small, put_cmsg()
>   truncates the data and sets MSG_CTRUNC.
>=20
> * Whether the string is null-terminated also depends on the LSM:
>   SELinux includes the null byte in the length, but smack_to_secctx()
>   in security/smack/smack_lsm.c uses strlen() and doesn't.

=2E..

> Fixes: ffad6a017f91 (2018-07-28; "unix.7: Document SCM_SECURITY ancillary=
 data")
> Cc: Michael Kerrisk <mtk.manpages@gmail.com>
> Cc: Kuniyuki Iwashima <kuniyu@google.com>
> Assisted-by: LLM
> Signed-off-by: G=C3=BCnther Noack <gnoack3000@gmail.com>
> ---
>=20
> Notes:
>     This feature is also available in other LSMs.  Unfortunately, they
>     implemented it inconsistently and that complicates the description of
>     how string boundaries are handled.  Linux does indeed neither
>     guarantee that this terminates with a NUL byte, nor that NAME_MAX is
>     large enough to hold it.

=2E..

>    =20
>     This is the verbose variant, but I am open for suggestions regarding
>     what level of detail is appropriate here.
>=20
>  man/man7/unix.7 | 25 +++++++++++++++++++------
>  1 file changed, 19 insertions(+), 6 deletions(-)
>=20
> diff --git a/man/man7/unix.7 b/man/man7/unix.7
> index ded82768322b..4abd216d19c7 100644
> --- a/man/man7/unix.7
> +++ b/man/man7/unix.7
> @@ -317,7 +317,7 @@ and returned as the result of
>  is an integer boolean flag.
>  .TP
>  .B SO_PASSSEC
> -Enables receiving of the SELinux security label of the peer socket
> +Enables receiving of the security label of the peer socket
>  in an ancillary message of type
>  .B SCM_SECURITY
>  (see below).
> @@ -544,13 +544,26 @@ message, the
>  option must be enabled on the socket.
>  .TP
>  .B SCM_SECURITY
> -Receive the SELinux security context (the security label)
> -of the peer socket.
> -The received ancillary data is a null-terminated string containing
> +Receive the security context (the security label)
> +of the peer socket,
> +as provided by the active Linux Security Module (LSM),
> +such as SELinux or Smack.
> +The received ancillary data is a string containing
>  the security context.
> -The receiver should allocate at least
> +Whether the string includes a terminating null byte
> +depends on the LSM;

This seems to contradict the commit message.  The commit message says
that the string is terminated, but that the reported length might or
might not be off-by-one (i.e., not count or count the '\0').

This text, however, is saying that in some cases there might not be
a '\0' at all.

Am I missing something?


Have a lovely day!
Alex

> +the length of the data is given by the
> +.I cmsg_len
> +field.
> +There is no fixed limit on the length of the security context;
> +allocating
>  .B NAME_MAX
> -bytes in the data portion of the ancillary message for this data.
> +bytes in the data portion of the ancillary message
> +is usually enough.
> +If the buffer is too small,
> +the data is truncated and the
> +.B MSG_CTRUNC
> +flag is set (see below).
>  .IP
>  To receive the security context, the
>  .B SO_PASSSEC
> --=20
> 2.56.0
>=20
>=20

--=20
<https://www.alejandro-colomar.es>

--7gx4jq2do7gf4w53
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrbL48ACgkQ64mZXMKQ
wqnJUhAArjaTo5UcyrXsOzxtT5nuo6ODsZ+HEjoW+o1M1ZqBzyRq1kDkYaNGxK//
yMVBkw9JgcSdB/UtvWVTgofm4kbplP3STfDEcuptysgGm78qeUbS5lse8XEp6NT4
ka7EJytpHFnYDOIaTu1NvqMCtN5xhnxXCzDZr2p9SPg8zrGs3BjqVGQHuCf6Yp0j
VxrqgiTzr6iSXC6N8jt05stFn32Oam8HGeAXyiJlRPlPmycpp9MKR0/WJ+nL/+kW
enmInWdEvqF2bp+pDa1tGdKwdp21IVPNTQjZRFJSNQWebUqi1jPYmEDGIsccvIz5
lv0HYbxUBXx118AzMN1q39+hofSFm+ce7wBcwQGhNTDy71VQPnAaIpAETabfJDsk
ogx7LpMx7Zf7aTQbaW6cb0Fe8pD6fEZaai8WsO0TpJK3a2cYMsjBvV3M9lwBD9JE
RURcslGo7pBPvOClHA3Gc5fiEKnjWPUe5R6wSBkcsCI0fcZ9stOf7gt8nj4hfhJn
6CBTCjwpW1dw7uvAOatWUPpwKUP+eofxcNZsGh7DQvILyqJCG1RRzsSpdKoK5gbC
gF8uBtK5O+kW7RYu06KykpFez5sLUOai6qpnlQGsnfSXj8u2CDwqDxm78ck1yWPr
upe5nzT/vOzCAWvr52gZGeBtpSXiL8b7NVJu5ksqWUQ30tV7wXI=
=XibY
-----END PGP SIGNATURE-----

--7gx4jq2do7gf4w53--
