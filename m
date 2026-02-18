Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64857248F64
	for <linux-man@vger.kernel.org>; Wed, 18 Feb 2026 20:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771446817; cv=none; b=ryN4Ffzwt9yxZ7FDK7qnt9NXW6EgZQ2hlekzIj0H7IdBwBtuKVS0bthpHtikPg/FrhNAf9wsq5Gnlx2dHfSErSU5HDIw4DXi6GiEpOrVAO8VqmuUB6ebfTAyMoxz5oGji9AsE/31bKWBcYywYopbtt2fQDk2ah87u2bUNVL5XVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771446817; c=relaxed/simple;
	bh=JAeVCndWHRjNaNiFMfE3aSjqZzgrO7vKRTldJZ+mxJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MRd3K6pYlPYkrP6EKn0y62bTgfN5iaE6I9Kf3cRmMcn7+jhLDL6WaHAPWfTasgVhSuACz/pLx+ycb2fW4aejkaAyEtNwQuw/s5VrMcCQQ9KnSP6buUx8BsReRu+kZAJkEe79wHgLZFoD7MNU4tgC8PRJ+FhBS6idRFRIbJuD9vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CKtaKDmS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CKtaKDmS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41EDFC116D0;
	Wed, 18 Feb 2026 20:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771446816;
	bh=JAeVCndWHRjNaNiFMfE3aSjqZzgrO7vKRTldJZ+mxJY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CKtaKDmSy8Ze3sG6rmK4I+jHgqBUxkUSLamUfsp9IvhhsQwks6Jt+1l6YcFZfuxKa
	 pPrERNAcj1QAekkAebADXcwU/e0gnwxDz1AOiCmuOwN0wLWvRTD7s6COvVu9s8kSez
	 VxNCa3P9FR5Rtrj/wpMYb/31Sp/gkCxx/eabgL7PoYqyZu6rxe9H8WCIZrQ10ehU0C
	 5rSCoEUDrUEoRHcZBr+cHa8jJGYEU5K6TbT1NpDaWWB/lwrzYQxrO5SRs+HGwr1lwU
	 Y/gI/DZ5o73RyDdEDLkSzwujnhJZYRIhu3w+5bjeLDWyvmaTRvlysfFIvmuio7Tq1e
	 im5PebmhvMD2Q==
Date: Wed, 18 Feb 2026 21:33:33 +0100
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?B?0L3QsNCx?= <nabijaczleweli@nabijaczleweli.xyz>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v1 0/1] futex_waitv.2: Move text to a new PARAMETERS
 section
Message-ID: <aZYiAgnusB_xo82H@devuan>
References: <jpyv367v4jdxfxebxw6wh7rgqdfeswzp44dzsycfjt5k2pxe4j@tarta.nabijaczleweli.xyz>
 <cover.1771374933.git.alx@kernel.org>
 <wkb6g6eqsjol24fyermtgntg3yuzgrbs6z3bz5vfy5x6psy57r@tarta.nabijaczleweli.xyz>
 <aZYgLav9DxDExlQL@devuan>
 <cieq4a5bknvcu6oykfehgc76djihdiy6fuats2nqbcnznojdyx@tarta.nabijaczleweli.xyz>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4g4k7u6wv7v4l6am"
Content-Disposition: inline
In-Reply-To: <cieq4a5bknvcu6oykfehgc76djihdiy6fuats2nqbcnznojdyx@tarta.nabijaczleweli.xyz>


--4g4k7u6wv7v4l6am
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?B?0L3QsNCx?= <nabijaczleweli@nabijaczleweli.xyz>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v1 0/1] futex_waitv.2: Move text to a new PARAMETERS
 section
Message-ID: <aZYiAgnusB_xo82H@devuan>
References: <jpyv367v4jdxfxebxw6wh7rgqdfeswzp44dzsycfjt5k2pxe4j@tarta.nabijaczleweli.xyz>
 <cover.1771374933.git.alx@kernel.org>
 <wkb6g6eqsjol24fyermtgntg3yuzgrbs6z3bz5vfy5x6psy57r@tarta.nabijaczleweli.xyz>
 <aZYgLav9DxDExlQL@devuan>
 <cieq4a5bknvcu6oykfehgc76djihdiy6fuats2nqbcnznojdyx@tarta.nabijaczleweli.xyz>
MIME-Version: 1.0
In-Reply-To: <cieq4a5bknvcu6oykfehgc76djihdiy6fuats2nqbcnznojdyx@tarta.nabijaczleweli.xyz>

On 2026-02-18T21:30:53+0100, =D0=BD=D0=B0=D0=B1 wrote:
> On Wed, Feb 18, 2026 at 09:26:38PM +0100, Alejandro Colomar wrote:
> > On 2026-02-18T21:16:06+0100, =D0=BD=D0=B0=D0=B1 wrote:
> > > On Wed, Feb 18, 2026 at 01:41:38AM +0100, Alejandro Colomar wrote:
> > > > Please let me know what you think of this patch?
> > > > Here's how the patch changes the page:
> > [...]
> > > > What do you think?  I think the formatted page is more readable.
> > > I really hate it.
> > Okay.  Do you like any part, or is it all hateful?  :-)
> The format annoys me, the layout infuriates me,

Okay.

> I find the tone insulting.

Wut?


--=20
<https://www.alejandro-colomar.es>

--4g4k7u6wv7v4l6am
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmmWIh0ACgkQ64mZXMKQ
wqnAFg/7BcKC2/KzozUIaIQlo7mHyGoihLsi+nisDCDWX+QzBjU1DDl2MU9DZV3F
DQvT62q3Xhswuv+1ogmoj9Kh6ycyK/SG6To5cmgX1OjX/GOUlxasz3gZoCjCXw/p
51K7Ww1J4aKmepp8g18NI7BgF0qaQ9hUoZrrh1MzAtrqmnULRp1jhmzkzfhVrvkB
Z7JALPecjQYTfX6cgydO5gs3YhkjwOHGFSfHD0uTHTop89d1k9EPogq0DnpKJk4K
vzu0MqRI90FIUO6s8S4LcW7LX/V8S0pvTJurhmZAw9KbMvYGXygzbEKNEOaV0L1N
YNPUgcSJr2Zm+Y+XkUv9bvMRwNDa62iL6VC5NRrbFTp5Gln0r2NN+Vmuyk42kmAh
2HtIf1bsasE7Z/OU7ywo8vvYjwFr3VeMzh9rfJwB5NcdvyX6l7/dO4EuF9RCIWkP
JgQgl9283dMlP9cBDyXR48ozRhEKN1Y7E3fXIHFvjKE4aNwnJA62Yz5fqvQHgBZx
o7+kyUVQzllgeni3FhZud05dqR+NtxSnCbwGiISTvfBdZ80xfJv2cC5cggQKhhfM
Al051Eg4khmk2zHATW4rHVRT1oolZy0KPHWB9Tk5zVjUfCFVjXF2ZnZzU3UTKEtf
7AeyfEgIsoFdCVKiCB/mFpl8VGAqkteY4fPYUa2Wbsj6JxodXp4=
=5T5R
-----END PGP SIGNATURE-----

--4g4k7u6wv7v4l6am--
