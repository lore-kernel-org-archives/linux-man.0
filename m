Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBE842FCA7
	for <linux-man@vger.kernel.org>; Thu, 16 Jul 2026 14:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784213127; cv=none; b=TSGxPijOYVL2xbvuM8GiF9JGhTyTfSHy+YPHuIyWVrFKIxDTht/AMGknNKo2dPTzQ3vXXhnjiul4fF5GRI0dvdORaVT3r2BD1L2+1Y7D7eMIZQ2I8NEN96v5ZtTVWfYlfjYViJUVla9MDoYf+lwxn9nWWjQtQ1NTviQtotuPQEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784213127; c=relaxed/simple;
	bh=WFEUcanCYCKuryGhz4Sfn9t50YZXdflKKC1pzghHE3A=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=crj3Bx0JGen+icKMQ2Lh4Pp+tDPHyh43IePRWOrj6FQ8rgbHukg6OP7w6ew8XCnyJD0+OOJZ1LHsqdJTWsfsjhdsLf5HGNZvkH827weeMwadI+O9yQlOaROZuhNUkdei70wguMrUM3DwsFm/6fFrfYmLE0Fp1jcMleRSXfss6WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NiR21L7c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NiR21L7c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 387C71F00A3E;
	Thu, 16 Jul 2026 14:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784213119;
	bh=5GQ+Yw8BDCtz3MkqHbD9BciZq/qAW8QMbrr75JKTVpY=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=NiR21L7cxNtRW9GonQ8/4KJDm2HpNRR5K6C5Z4XT3GxPHOcHvWhWgQIlP/eE/pRsH
	 dpJ8uY/GAirF2w/As1bc6uJkDpHLfmXcdk9eTqkmNSrtKbA+8x63L4mtbqYDa12TjS
	 W3Viv9/fRluNCIIwXD8Dg77YmDHvec/fKGJIhGplufszaNZjOfw+fEga9pBqYD8+Qu
	 rLZPuF1MmE3htKzwsw3gUtMaYNkmUBX4ic2HbssEXG+eY2pZYa9/0oMHI1G/x8VOOj
	 pJx0hzZrHm/z0RDspBdo+oQko4LzPIToLMt8xpPztfHHDjyvRJF88Be5jdNpp6ANr5
	 l8jkOU1/SdDdw==
Date: Thu, 16 Jul 2026 16:45:16 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Douglas McIlroy <douglas.mcilroy@dartmouth.edu>, 
	linux-man@vger.kernel.org
Subject: Re: syntax of options in man1
Message-ID: <aljtsrJVLTN6qlxP@devuan>
References: <CAKH6PiXDGL658h1t_bstW0Z+MjjJfcNmcde-DA3QNOYKc0TTGg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q7m4m7rsyrkm42gb"
Content-Disposition: inline
In-Reply-To: <CAKH6PiXDGL658h1t_bstW0Z+MjjJfcNmcde-DA3QNOYKc0TTGg@mail.gmail.com>


--q7m4m7rsyrkm42gb
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Douglas McIlroy <douglas.mcilroy@dartmouth.edu>, 
	linux-man@vger.kernel.org
Subject: Re: syntax of options in man1
Message-ID: <aljtsrJVLTN6qlxP@devuan>
References: <CAKH6PiXDGL658h1t_bstW0Z+MjjJfcNmcde-DA3QNOYKc0TTGg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKH6PiXDGL658h1t_bstW0Z+MjjJfcNmcde-DA3QNOYKc0TTGg@mail.gmail.com>

[Added linux-man@]

Hi Doug,

On 2026-07-16T09:46:25-0400, Douglas McIlroy wrote:
> Here's a typical option heading (from tail(1))
>   *    -n, --lines=3D[+]NUM*
>=20
> It is tempting to assume (incorrectly) that the short alternative is -n=
=3D4.
> As far as I can tell, the convention that "=3D" is part of only the long
> alternative is described nowhere.

Agree.  I've had that concern for a long time.

> I think the description belongs in intro(1).

Agree.

> Incidentally, the actual content of intro(1) is absurdly bloated and much
> of it is way off topic.

Agree.

I think there should be a separation between an introduction to the
entire system (maybe this could be intro(0)), and an introduction to the
first section of the manual (intro(1)).

What do you think?


Have a lovely day!
Alex

> Doug

--=20
<https://www.alejandro-colomar.es>

--q7m4m7rsyrkm42gb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpY7nYACgkQ64mZXMKQ
wqncUBAAtKvn6AbMtY8Klx1wUiAprtlktrBdO5rd9mCQWpcuE+F8nw28awFF5Cza
KItadKdFBPwuYpwprOWHLsc9ar69QTgb4pK/hUrV/jDqKRzrRU1lf5pA1jjMHXCf
YVz+rfrKSiEq1HLndfUZAEoXYVTnFnU01HdxhVLXd15HsHXne6APF4aITRtgeGGQ
1r4kWT80jklndUmwtPT4oLUiqCpf/xd5rY2PorAo/M7QGWSjDg7P6vahXCC5uQzk
IUp7i1SzOyioztSZ+SLb3a+8CgA9q/JJ+t5CSezl0WigPl3Z4DSeSRf8cdmc9gMe
UEuUamcFElBWiSqOVAIHVOvil/8fsUWfGZ37zlsz46PEtKIInMqkWHr+Tcm4SKlz
tpeir08gktw0hdw1QvgJdjcmW5SbPeE5qhZ41y6XjW33X4kd8+zbih4hpebCpb4y
iHJaRpaS2BtUGtzOiyFvTvm++V5QY5tD+y4t9LNvaxkQTI6WY+U+i2TBD0MUXbfa
jDIwyMLQg5M5xBa2FLfp2SaZVvwe/MhyMM2whCx4b18dE4/4I45QAahlz9h1Cbbs
RI7pmXAZH9/oQ4oPOEOxrT5YQoeXrZaarD+GLoGvTbVAPpTQvbmAOM+gUm7GQZxl
WHbLZFpohy785SwUJYRq5Hh1szPCQp8fVJEapEM0UTluQ86v+ho=
=ZmdV
-----END PGP SIGNATURE-----

--q7m4m7rsyrkm42gb--
