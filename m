Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42DF2D2397
	for <linux-man@vger.kernel.org>; Fri,  7 Aug 2026 23:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786145166; cv=none; b=hI3xM86S2Mhz4c0u+si72X8R9vAbssPi9pl/HBPJHyEBv/zwEcyad/P9nvg99KyNKxSNH1y6zlTOBEt6miEIennfMpsNwsmNW0+hU59/WReY17Wv4f5Hr3e0g1zUjE1/oQW2K6+c4J9ed96ROuNIPWhudC0DcIoOHXhMyOex9WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786145166; c=relaxed/simple;
	bh=H2fqTztlOlOB/MKO/yUi3p14Qu/SnZ+hcDYCNNP3gqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BlpfuLnhsANl3Bm1JCjRMAVa3/NN+yRqmr4bsO1kaZ4ysUbuQWQr84jBvXBuzdFelGF2tvX/ZkYCOe3AAudmSpDxON8f3lh6ZQfaXmMK1yvGfJfmmk4/QcKaKvdpbGTV/voYmMDD0MZjkVVopMDugLW1JxM65Gh28wQZw1CZH50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e83NioPm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e83NioPm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCEF41F000E9;
	Fri,  7 Aug 2026 23:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786145165;
	bh=Cb6XTqDK2AROpUZ3YoS2qk9+nByLo7JcPqn7yJ6iRKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e83NioPm8EedKA4HDJs0wOUoaF1nj0YoKmDcZ3AAg2+f8t/fr3DNl82jtI+IUqpRM
	 CcGNuk3MasqKUJaWNcPnPSpPXGshLkgGJUP6ulACXOL3EpzC1x67EPDW0vvB+X8RIh
	 pK0dwuLIUnO7mOi7deqt9ugFCntkak6TozehadyqXXtLY6kt+vuytZ2xmjhg1JlbSl
	 O6tcSlPuGEDTbgBPBaNrobyMbbR9Mw+Ew+1EGuxLTACuuOY0oPvO3BkBgYC4IvyrCj
	 cMkjPmTF3PcdJ0U75/hEEPp7k9Jzvh8XDPZMScRpu5mjHUlVIBlK6UndcRx/I4Q/3U
	 kOPgxc8G5uwLQ==
Date: Sat, 8 Aug 2026 01:26:01 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Masanari Iida <standby24x7@gmail.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH] resolv.conf: Update MAXNS header reference for
 resolv.conf(5)
Message-ID: <anZpIHHNt96X2Ybv@devuan>
References: <20260807124916.18007-1-standby24x7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wk6xpdfr3gwihqmo"
Content-Disposition: inline
In-Reply-To: <20260807124916.18007-1-standby24x7@gmail.com>


--wk6xpdfr3gwihqmo
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Masanari Iida <standby24x7@gmail.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH] resolv.conf: Update MAXNS header reference for
 resolv.conf(5)
Message-ID: <anZpIHHNt96X2Ybv@devuan>
References: <20260807124916.18007-1-standby24x7@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260807124916.18007-1-standby24x7@gmail.com>

Hi Masanari,

> Date: 2026-08-07 21:49:16+0900
> From: Masanari Iida <standby24x7@gmail.com>
>
> The MAXNS limit mentioned in resolv.conf.5 now points
> to <res_state.h> instead of <resolv.h>, matching the
> change in glibc headers.

Would you mind providing a reference to that change?  When did it
happen?

Could you provide a specific glibc commit?


Have a lovely night!
Alex

>=20
> Signed-off-by: Masanari Iida <standby24x7@gmail.com>
> ---
>  man/man5/resolv.conf.5 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/man/man5/resolv.conf.5 b/man/man5/resolv.conf.5
> index 8e914f12a18d..89f9d903a1e3 100644
> --- a/man/man5/resolv.conf.5
> +++ b/man/man5/resolv.conf.5
> @@ -50,7 +50,7 @@ or an IPv6 address in colon (and possibly dot) notation=
 as per RFC 2373.
>  Up to
>  .B MAXNS
>  (currently 3, see
> -.IR <resolv.h> )
> +.IR <res_state.h> )
>  name servers may be listed,
>  one per keyword.
>  If there are multiple servers,
> --=20
> 2.25.0
>=20

--=20
<https://www.alejandro-colomar.es>

--wk6xpdfr3gwihqmo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmp2aYkACgkQ64mZXMKQ
wqmfeg/+LWPWGus1lLJz19BCmUA8PwspJu1UVcr+UUv+QCTPe/+1OMrWipSgsiFn
6XhU5XCDhNQJ9vNDNM9DHJlIwiXbbKck1dxcR50MGjNSiYSuFjdI2JC8re+mGwS6
efDmd6E5wiXv3uhFaMuHL9f9weo5o9zBiqTYASDCHfwkbK1LZKeDu/y45CZG+/jZ
i+XdtD/WIFen3srvqrLuVAzH/Zolp1hV47OvKDrF6c6AN/MEuqH/RtJHUBVsqNNs
WX5aJDyIH4+HZVEYuI+lBZLGkoXhg4PGZg9aB/ED2nOQGATI5u7KqnL1rM9CvyND
MszS3D++7PDlju0vHvRQ7+sGKBYGbSP6xdaDp2K5dM892BCSG6SZtY2gsdUBvDNV
qUz7T5hotUJEecVuTJ0DnB6ybCbHkt28ujNmiWGxHq6Tg3syj3kcIcjv76hR336k
27jFtdG9TFKvOiXoplvUhAsKRJgZ12mS3wynqlyf2visQOOr6qWYjrGhB6OJClgS
6DAl959MHkOqgVE6cNoHRZcJ73e79plujkDbjzDwViRXk0mOcvgoaoY1J6OdsB+G
hENAseeF7tLVzl81SM7bLWsloZ8ZttOfXWZWEhnRAh4A/7OwofnFpd6Bgt8WRyVT
W1e3mimlUM8Exk4gsQtNs4KjAJpQ9w8A53q52Q4QVLU1hsijNN8=
=SdPo
-----END PGP SIGNATURE-----

--wk6xpdfr3gwihqmo--
