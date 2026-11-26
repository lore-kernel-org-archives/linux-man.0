Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795733958;
	b=s7u8UQSTdd5kEI1s6LDdP5EpyDzTPZrp01CGi82X+mIXfzF/O+hU6c7l3MEEBuCtQHhW
	 4NFA+RQOKqutR57eVB9u08omW4nlGBa+m93sxVdziITJrDxpVytGLay4ZPm9xBqFn+Msn
	 jJInbYlk6PuFnRMijkDhW/Y4bHtPTxDNi8uXOrNaiVhCHH+4K6Ftnx3ZTdcUbPs8RamNl
	 ALkqY4E2Mqhj80ucJ6zM4WjCkewO1al139Sc60UT8w9u7s5Z/Do8HCBfI1uQ6Cjg5DMGW
	 kDKYemXxAliDMcY0nTdB7AaSEcZMobq/ENDEchmmaYaH4nDDyBw5TlfttyZpDZXXNCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795733958;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=WzHUg1uSTpKfSutsUOV8ZSgWjmfrr64b0AjA6F+CE8Q=;
	b=LBDViOPR1ggWia+qL5ctw0/qHv6F+tfqgF6tI4DfSDfZ08LOcZ6wPqH5aFc+x/KgXQpA
	 pIoQgqargPKWQYb++8tF/V+/24ldKSTBtg+nQLABQNlpGp97JUZ3FEBKSenNS5/Sg0NrV
	 PxzJU3IuOHXXg9MqMEs1e7R4KpXLLoEp2mf/csAhQNh5C4aNSQUCdRjH3UNvOdDyAviFE
	 CJo8MCWrrNAds95gT1ZVilVPXb8NcVSYSql3rNf8eW/j7qBcOeuO1K5huyoQXj+4fkCAz
	 DOVZtiz+nl5aF0Zyofmdbx6dhJ/YlIgoaxqb5LMzHGTWp3xkNlE7+N/jwt1NatpFdFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WycLBatj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F132C606A31E
	for <linux-man@vger.kernel.org>; Thu, 26 Nov 2026 22:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WycLBatj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06AA91F000C1;
	Thu, 26 Nov 2026 22:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795733957;
	bh=WzHUg1uSTpKfSutsUOV8ZSgWjmfrr64b0AjA6F+CE8Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WycLBatj/EUmqSyerlLUHNNCK44zHuU+P28NT8+tstkkc0QFGeiA7bKrSKrc6ybhZ
	 9D88B1kZnViN2DPvZYkTfTFpUegFW2C5UsmaQc0J+bHH6MYg8tO0PzHFPosm++6EUS
	 ju5LFe6aQ1vpOwQO4qyMCQR5U8u6bGLSJ2P3lpYg0Aj9acHDZh5YHbklnmzrKQQcpN
	 zNHVrFuGLLsgVsCdEYdnWVki9iA3sQJr+hBUWN43XqM9sSpjzTXs05/tKJzDGRul0m
	 UC2aXx6lv3nkQX3qfn6C0iNW3FW1xOR+q2kvdSZXQaiQKLN4pHapUqivfHjH+1/Zn/
	 xzHVpnzFzyIig==
Date: Thu, 26 Nov 2026 23:59:15 +0100
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: linux-man@vger.kernel.org, Kuniyuki Iwashima <kuniyu@google.com>
Subject: Re: [PATCH v3 2/5] man/man7/unix.7: SO_PASSSEC: wfix
Message-ID: <awi5uDaPCumqqMuS@devuan>
References: <20261120161202.27163-1-gnoack3000@gmail.com>
 <20261120161202.27163-3-gnoack3000@gmail.com>
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
	protocol="application/pgp-signature"; boundary="64hlz32336vabx6b"
Content-Disposition: inline
In-Reply-To: <20261120161202.27163-3-gnoack3000@gmail.com>


--64hlz32336vabx6b
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: linux-man@vger.kernel.org, Kuniyuki Iwashima <kuniyu@google.com>
Subject: Re: [PATCH v3 2/5] man/man7/unix.7: SO_PASSSEC: wfix
Message-ID: <awi5uDaPCumqqMuS@devuan>
References: <20261120161202.27163-1-gnoack3000@gmail.com>
 <20261120161202.27163-3-gnoack3000@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20261120161202.27163-3-gnoack3000@gmail.com>

> Date: 2026-11-20 17:11:59+0100
> From: G=C3=BCnther Noack <gnoack3000@gmail.com>
>
> Use "security context", as in the description of SCM_SECURITY.
>=20
> Cc: Kuniyuki Iwashima <kuniyu@google.com>
> Assisted-by: LLM
> Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
> Signed-off-by: G=C3=BCnther Noack <gnoack3000@gmail.com>

Patch applied; thanks!


Cheers,
Alex

> ---
>  man/man7/unix.7 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/man/man7/unix.7 b/man/man7/unix.7
> index 3322d915f1bb..532c50b94ec3 100644
> --- a/man/man7/unix.7
> +++ b/man/man7/unix.7
> @@ -312,7 +312,7 @@ .SS Socket options
>  is an integer boolean flag.
>  .TP
>  .B SO_PASSSEC
> -Enables receiving of the security label of the peer socket
> +Enables receiving of the security context of the peer socket
>  in an ancillary message of type
>  .B SCM_SECURITY
>  (see below).
> --=20
> 2.56.1
>=20

--=20
<https://www.alejandro-colomar.es>

--64hlz32336vabx6b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmsIucIACgkQ64mZXMKQ
wqkENQ//Q+3TK80jz4nGxPFqj7GNehz5vK46YvnliExjUeHp32/5i8yDFXQAgt1G
PpqH+uE4XboG8n54+C7LVFYBltN7F0D/wYgT2U4OWZwYHwPgU75law8aWxhxSOqq
e9sGrRxNA/PuX5oFoq4UOdEaTPyR9ptv8vuhVa5vLblQvxJdHnA73p1rbueuzfg2
DLsgQRfYDn9g0sR0hS8Qe0LDLS35KidqxpOtKL6Ynb0BjwNmGn8Mwf0q9T2q+jZc
8WboUuqo5UkKewwRtO56t+J+rwR+bWrB7PZUIpBjK7vzDY4LNfgfG+dzFshkDZt1
82sj2tC4dPUu1WHCEPC+PTpmH5j2qhVgjn4XzHpfsTQOjN8VADJvOh6chU0lVuim
A67L1gL9L7iEOelNeeuqJX0jt9GfvcSxXwAUqt455OzAGwT0ciYRyjWPEkS3pbw9
RAnIK7ycA9WQldYhpI39DPDfHGVLByIkQmTx3TOr2c11rtPKqBJXVH+SCQZ0Gbsf
iCgBxN2DjqbKsUctQmEMuoIu14e2XqOrI6B+PeoYZ7XnJliekM0rs8pYUTOMbYCZ
YDb6vvsG1WzJT3GrIvTuhdR0/0pWRygaMckkePDxvXJWrX1fwAc32RxR8A26QypN
euPlSSw4y4AnM1/9DNVt9KEY1F9N/mSSeST093q0ExNz+rm9zyE=
=ZK4z
-----END PGP SIGNATURE-----

--64hlz32336vabx6b--
