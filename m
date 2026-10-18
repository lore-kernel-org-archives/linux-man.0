Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE7B3F4DFE
	for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 11:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792322549; cv=none; b=Pvd/88pxGq1JHnM7SKne0iIHeUM8WtE8WXwV8SZbvPqZjjwXZs1uVj7Z/5aiIE1SXbw0y/aWq5gVeAoEHQcfbc2epoLJhdjyomQQmRdjOpNMH8OPP2jx4mbdp3DToRicmC98yhpVXPeOyZds0tjZHNjJlZZiEv9BnPih/rVXsT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792322549; c=relaxed/simple;
	bh=T5XTWcUT7oyyfrz4PAo40dpbRTnD6JkZ9iVF81AArUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A9CBFmv1lozmzOtXQgaAqMLc/6rHkHjXOfriLLBeEJug7DcbLCPXrvhS2LcIXaqqz78lIXT+VL6Q7c7CpQxU0plnXlIifF4x2AN/W66or/8cg6U/kgx1PhKHnLMjCtN7t/jIAX3ZzNZh9VzeG4nh84hu1Kp8HnThcZcPEqxxX74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iUrhS62B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iUrhS62B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97E041F000C4;
	Sun, 18 Oct 2026 11:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792322548;
	bh=o9ky+po+viZEaQsxJg6zSPbW9TG2LLoFTTPUtBjaryc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iUrhS62Ba3Sg5WqtzST25mJm/ik1TeqVYoHysQTsgNYjH1QCvSFkoXlpH5B027lKd
	 46+kxKpAkS5hUzPSiwc8d8I9uWne2vYTL8yd+8w+1Qp/YsIWCRBgOD1qg7S/BRptXw
	 fCfP/HRltCr3mHFPp1mD5W1OfuqfPy6mCWGpzcXPugAQN0NJgN171P05ZVwjcQJYy0
	 xFbiydNC8dxx2DA15DOTSqSneg49bIA9k4ULbKI6ovvEBKREAOmRIsrLC6Tds6sUtl
	 DWeF9iRkEuMj40NBpn3shlcAQBiQBWiVLn6GcZQ18kzDLCX8IekIfKwsJZYjDnvNp1
	 HjVyhzWXpAA0w==
Date: Sun, 18 Oct 2026 13:19:34 +0200
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH 06/24] man/man7/unix.7: ERRORS: EPROTONOSUPPORT: Protocol
 0 is also accepted
Message-ID: <atSqLSOUOfSB8lFn@debian>
References: <20261016173139.13076-1-gnoack3000@gmail.com>
 <20261016173139.13076-7-gnoack3000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y33hoi2vddlnmpbj"
Content-Disposition: inline
In-Reply-To: <20261016173139.13076-7-gnoack3000@gmail.com>


--y33hoi2vddlnmpbj
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH 06/24] man/man7/unix.7: ERRORS: EPROTONOSUPPORT: Protocol
 0 is also accepted
Message-ID: <atSqLSOUOfSB8lFn@debian>
References: <20261016173139.13076-1-gnoack3000@gmail.com>
 <20261016173139.13076-7-gnoack3000@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20261016173139.13076-7-gnoack3000@gmail.com>

Hi,

> Date: 2026-10-16 19:31:21+0200
> From: G=C3=BCnther Noack <gnoack3000@gmail.com>
>
> unix_create() in linux.git net/unix/af_unix.c only fails if
> 'protocol && protocol !=3D PF_UNIX'.  0 is the usual value, and the one
> used in the SYNOPSIS.

The commit message seems bogus.  What does that 'only' intend to mean?
The actual diff seems better than the commit message, but I'm not taking
it.  This is an example of the nonsense produced by LLMs.  I'm NAKing
the remainders of the patch set; that is, for patches 06..24/24:

	Nacked-by: Alejandro Colomar <alx@kernel.org>

The exception for LLM use is explicitly terminated.

The patches I've already reviewed seem okay, although please have
another look at them, especially at their commit messages, in case I
missed anything.  Please resend the patches that I've reviewed,
including my review tags and any other tags, and I'll apply them.


Cheers,
Alex

>=20
> Assisted-by: LLM
> Signed-off-by: G=C3=BCnther Noack <gnoack3000@gmail.com>
> ---
>=20
> Notes:
>     I double checked it in the code.
>=20
>  man/man7/unix.7 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/man/man7/unix.7 b/man/man7/unix.7
> index 1054d7f52a30..9df4d3b6f635 100644
> --- a/man/man7/unix.7
> +++ b/man/man7/unix.7
> @@ -708,7 +708,7 @@ or
>  .BR sendmsg (2).
>  .TP
>  .B EPROTONOSUPPORT
> -Passed protocol is not
> +Passed protocol is neither 0 nor
>  .BR AF_UNIX .
>  .TP
>  .B EPROTOTYPE
> --=20
> 2.56.0
>=20

--=20
<https://www.alejandro-colomar.es>

--y33hoi2vddlnmpbj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrUq0UACgkQ64mZXMKQ
wqn2nxAAgrlYHtQtBbrujrry+zAMy/z21PKrZF/3vlO/r1jaJjf17TCn/jkg/RyM
4CLAaB/mXKn9gIJEQsf95wPG1DOJZ4w6HOo9CBilk65laa4luDYDBGpB0n17IP9T
6CB+VZTASd4NaiqcA5TNTlRZMPYhUor0Bzp306aBVL2FJZCDLWMrtTkvksvYSxgv
0MqVOstpejCgcpSx88Yt+4+xqsV/U9Z+fW6TcKHsKe7f9mzQ3ctkxoubGvSL7rnd
+2Xnx2rbEu+PKN1VNm6xxXetEJwro6M6+5BZRrc3SlPssufKZH0GQPIQlbgl1/mA
h3ZmQpJIL06OxTSWgnUWuscyM1u27VvnSIsDUFdtlJ2y3qNZU7VllKoaaCcL3oai
aTA0LCu7hgg13MjLvzhNWupZYNUrTI7vCzV/J+k9AEAsBr80fZ+BTPplTBmzTA/j
siIYS/eY7JLrPFMgy2CfMCFUZjzLy90shpKWjd9ZAgHbhu/4ASumXoChUiM/6wCq
t881s1ExWh0mYioUhjMMebKh3fVRsu+jHYSjwBoIh7lLpeWy17kUNTeU+TORW3+8
GXjMz6p9KjMQzC4MD9oGjBzyKvQ0/M3wqcJMtGwywnlaVibM2HGvGyoo6zydLE5C
maGYsy5tvEjjKs1enCYC7vxKI5DRAu4B13B3ZNqvzHGQf6eoexE=
=/O/d
-----END PGP SIGNATURE-----

--y33hoi2vddlnmpbj--
