Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2493B0583
	for <linux-man@vger.kernel.org>; Wed, 29 Jul 2026 15:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785338125; cv=none; b=ovKiwSLGJlrjfseUe4PhdAEtBeSzt9CiCC2RG5tQAZUzUcB72tyhaHIGMVIYrdcLfl1cyFGZZTf7l8WFVG/fOcKXdL4shWtFgydb4ehnFPwZt2ou01Gl+bDaVL1AGjQVf3b4zPEv/8XaqGHmAX8wbU5Z+HW+X49lJ7fvTCbp21Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785338125; c=relaxed/simple;
	bh=X2I2YF7kDwX0jDWOCAtKOMBgXzPsbbeN8d2na83AvIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dNI7liw3lFN2rTBtZN+f61MwEKhCCcdf4OIm1h7C5HS4tvQKeA3FTAug08frxVbZA2N3SAinPVm/jaTcm7ZWYpqTATSgDRyfgkLO6DiroXwFtoqTsIOLqCD93l9V9cl+NbcjO2zaCrtjwRKm/dxR/ibhwHhiyoDYm1X8L0A8k9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hi24auRi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hi24auRi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D74411F000E9;
	Wed, 29 Jul 2026 15:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785338124;
	bh=dkfqAE2DZ7UFVi/iWaf6+XQigXEdHANNDmLMCzJ3f5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Hi24auRir5P5oMaSoM+oGxRy+bu7okUZt7gwbrswVtA04UnhwXojHpJ5/V6Lhma6U
	 gwmfJW+QCTVFgFzqYNnL6X7SP1zlNdcqypRnGvrsLTEi8n12mf99CxXf1x57Dp7K1O
	 Yy0FTBHV4mWkWBw35fJ6ShBQYtI18GqPxwmRBp9aAR44bZ0liiyq/rlzGnyZtXzMkc
	 2fhUelo6TBwqSQj3QVtka56tUEoOT8L6vy9hisAWkCcKxnwue59y/0uSu2T1NypqE2
	 9yG3sqI3Arh/N9+35gPklNQOmjhedJez8XcvHxMpfnMuGI9kubpsZMjB89gjpbrFXn
	 RbOOoIgKuWh3w==
Date: Wed, 29 Jul 2026 17:15:19 +0200
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org
Cc: "Serge E. Hallyn" <serge@hallyn.com>, Mark Harris <mark.hsj@gmail.com>, 
	"G. Branden Robinson" <g.branden.robinson@gmail.com>, Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Subject: Re: [PATCH v3 0/4] str*.3, mem*.3: NAME: Explain the names
Message-ID: <amoYh7wx6-viteDz@devuan>
References: <e1446fbce9d76cea797cf058f74ab0a63b744205.1782995502.git.alx@kernel.org>
 <cover.1785023118.git.alx@kernel.org>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ozndbo5axuqt6ixe"
Content-Disposition: inline
In-Reply-To: <cover.1785023118.git.alx@kernel.org>


--ozndbo5axuqt6ixe
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org
Cc: "Serge E. Hallyn" <serge@hallyn.com>, Mark Harris <mark.hsj@gmail.com>, 
	"G. Branden Robinson" <g.branden.robinson@gmail.com>, Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Subject: Re: [PATCH v3 0/4] str*.3, mem*.3: NAME: Explain the names
Message-ID: <amoYh7wx6-viteDz@devuan>
References: <e1446fbce9d76cea797cf058f74ab0a63b744205.1782995502.git.alx@kernel.org>
 <cover.1785023118.git.alx@kernel.org>
MIME-Version: 1.0
In-Reply-To: <cover.1785023118.git.alx@kernel.org>

Hi,

> Date: 2026-07-26 01:49:50+0200
> From: Alejandro Colomar <alx@kernel.org>
>
> Here's v3 of this patch set.  Changes:
>=20
> -  Move change that accidentally was in patch 2/4 into patch 1/4.
> -  Also add strndup expansion in strdup/strndup(3)
> -  Clarify what 'fry' means in strfry(3).
> -  Add Acked-by Serge.
>=20
> Alejandro Colomar (4):
>   man/man3/str*.3: NAME: Explain the names
>   man/man3/strpbrk.3: BUGS: Clarify the NAME
>   man/man3/mem*.3: NAME: Explain the names
>   man/man3/[b]string.3: Rewrite and merge

I've applied this patch set.


Cheers,
Alex


--=20
<https://www.alejandro-colomar.es>

--ozndbo5axuqt6ixe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpqGQEACgkQ64mZXMKQ
wqlC2w/9GKGBa6vBfaadNJ4JOAjKWeAFImy+Wuxp1/W9QmtOpYOzARB5a56Oge4g
Wb9dqpFiQLQIOstcVifstkLu3JPYRQnRaKP+6jZmBPFal/3y36gZulcO/7g+9m4Z
Yl6CbF73sgJSjklLnZ57zdayiCKebq2oqHfMqKfEq5aItQS1xs/D2sYPTl5k68s/
aYEOrznukMFuVXUVdN/A1/s2+CzbspJONODhdDdSbd14qik0I0K6wX64illpIxh8
tU8DIeTT4NnrWKtcuprju0aZGJfrPQAqCuixwawxqNpqBRJ/lAFE1aZxcMt4JBp4
W5fj2yNJSkvflYYUGX/T5MVQhl+yX8nPN/S1UvUrCbyEFNdlBTEbL/3NE9X65AjK
Fxw6SDNV9E0m916FSbKLlJEjdfOElVTwfbNrFbhr8qssOwLgOY7Q/Dfubu/YTkVj
IaczQ9h6cOzDZYO5DgRKx/M6PWy4UKn3mH5msrWZLmyKnLD1kgcOX8lEYzdl/EXZ
3zk/zSkCaLdyWrnfTmD4R3T80vpMQIEmKmpm/kLrH1Aie9rm7Rkx+hxKSQaps9tk
5x7rKjQAgtLc/583B/znPqzcD7gxTgUhBhZvyn/6j5XcZYyRJL1heO8J2cMOS0pK
pfVJEdzuCzSMvrCUDO8OBQcr9gUYPzLpbpxSpKY2je+YSbSKVFo=
=AAy+
-----END PGP SIGNATURE-----

--ozndbo5axuqt6ixe--
