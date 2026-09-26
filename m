Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5122DCBE3
	for <linux-man@vger.kernel.org>; Sat, 26 Sep 2026 13:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790428491; cv=none; b=ji6tKDJK5Lel+AFKIu1LWaU90h5nkKj9aqq59gFpYY0WB+sRhNRRq9M5uZ4W00uNeJROCsSPvI0lDiyALrKxhqrHwi1sJM9gR/C0LDg0tIT+syD7GQ0agXFNzWvedxDojLMjNsgkf/Rp+cwOpFHwLmzfHOobHcP2xxmYIYDA1CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790428491; c=relaxed/simple;
	bh=l874mApT2A9iBd4wybAiaCEsRS7BXHNS/V//HdWdv7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gOuRyrsDs6WtX2ncY/dFzPQikweT3ZLg3g9MU++up26Anx5CHwDVtoFDr8W+O0LuKs8H7fN9oVwGPlKTQUBClz4hZnse1eWETI+dOh0HSdhXCR9SfocJ8/R2XrfRm1uGxHYp3JLlnzYV7/Q7nqUw8xam1FU8NB62tgena2ZT3Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dfWWVyX/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dfWWVyX/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9E9A1F000FF;
	Sat, 26 Sep 2026 13:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790428490;
	bh=LPIokbp1xZliQoGrQSeExf4ieRuT89FslmV+7FeaOUw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dfWWVyX/Ml1+hVvpnfXBAe/31fNj+NsBLaYadiaxheygbD5OFIv860dC3vBBNkXR0
	 NOD99qzIam6tDfhH1RmTIUMT3uFNx4j+MVGPQtrWCMdFBg746HVTM1f33Wh5cPtoe2
	 J+1IPYTByDeIDExqzHs0VuJn++Lpo8dU7Apyln0BPimN0zI0zc5xkbl1GjeZN6Os5f
	 Gcf4mB+R/X4+FCSSQ+O/h3cijY3EXwg/ArXAmiD652iJMno4g+qvOSQdDPNgbRnP6U
	 CzQ25YGr7u74oyonsBLEyM+OX4R17zuA1stH9HK7hgbP1PV+5u22D8G5QjId9JaGUp
	 Rm8AfQYo8mTYA==
Date: Sat, 26 Sep 2026 15:14:43 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Ethan Ferguson <ethanf108@gmail.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH] Changed wording in userfaultfd.2
Message-ID: <arfFMMOrtYwfEqnc@debian>
References: <20260925172440.24358-1-ethan.ferguson@str.us>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rtivt2hxnvdvwnt2"
Content-Disposition: inline
In-Reply-To: <20260925172440.24358-1-ethan.ferguson@str.us>


--rtivt2hxnvdvwnt2
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Ethan Ferguson <ethanf108@gmail.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH] Changed wording in userfaultfd.2
Message-ID: <arfFMMOrtYwfEqnc@debian>
References: <20260925172440.24358-1-ethan.ferguson@str.us>
MIME-Version: 1.0
In-Reply-To: <20260925172440.24358-1-ethan.ferguson@str.us>

Hi Ethan,

> Date: 2026-09-25 13:24:40-0400
> From: Ethan Ferguson <ethanf108@gmail.com>
>
> From: Ethan Ferguson <ethanf108@gmail.com>
>=20
> A fourth userfaultfd mode was added in commit aa7589c9ffce, but this
> wording wasn't changed.
>=20
> Signed-off-by: Ethan Ferguson <ethanf108@gmail.com>
>=20
> ---

Thanks!  I've applied the patch.  Have a lovely day!
Alex

>  man/man2/userfaultfd.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/man/man2/userfaultfd.2 b/man/man2/userfaultfd.2
> index 23ae53890..c765b64c0 100644
> --- a/man/man2/userfaultfd.2
> +++ b/man/man2/userfaultfd.2
> @@ -75,7 +75,7 @@ all memory ranges that were registered with the object =
are unregistered
>  and unread events are flushed.
>  .\"
>  .P
> -Userfaultfd supports three modes of registration:
> +Userfaultfd supports four modes of registration:
>  .TP
>  .BR UFFDIO_REGISTER_MODE_MISSING " (since Linux 4.10)"
>  When registered with
>=20
> base-commit: 227f4c2fd6c421ad8e4f81ccf1acad1a139fe3a7
> --=20
> 2.55.0
>=20
>=20

--=20
<https://www.alejandro-colomar.es>

--rtivt2hxnvdvwnt2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmq3xUMACgkQ64mZXMKQ
wqkmWg/+LtP3JxHCKFRtGNLpZD4oPwhdCpVPLPt5LpFjeCc1BdVcf/d0pskV7rrX
gyXJPpriN4vBuWvtV7zULrjJ0ZED32OaL2c9UxihUw+0dSjI1rC6hFyNrL2piQ0X
Ipc1AV6mdJ82JjXgy/2LqfGihoWLgab3A8/UkYxW7BCrxKj2BeoUSb+qdV4X5Xgq
F0tBQjAStU9Yzfm/MNnxS9aK32K4sMfkKw4rDWQ12muqEd2VixEUPqh1HffF+eW6
A9sQNOTBHye4mvsOKVZaT/zpJYv+T5WEOjnO3CvdvPwMtN6VxLOkFVoABoo2cOgb
oJSnBbXuA78UCkkUp9/hNRb2vUyf1IVRICLE7OKkMU45ojKQN/3r/IW06KBvMkFA
E/EDVsVCVObJRxZcN6MY0BcAKbfEqTY1UI/t+iDJeUqgRzWwgjZHiKXvpMBxH7KV
01NNX4sgloTx084776Jt8Meb0XFnCwAZv3khZswk5jVDN3wG3aYb1VKQkfek7T3e
lMFhESdXJ1gSsncm4CFXwZ5M+Lmq+C7RqYzxztNRLmyCvKHRnJbe3YYlAmCDz/x2
wW2wDeawY33n8yISOXpNVzhRFQ+QRbWBIFURp+OoiLhbSRbvH+SCYzm6hzJmvy/H
aQTsUZdSNQcnW1tCKvVBU0yAi3eGVkgvc6mhPcg/2RxnraGbSlM=
=EA6n
-----END PGP SIGNATURE-----

--rtivt2hxnvdvwnt2--
