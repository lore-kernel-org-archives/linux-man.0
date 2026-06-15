Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601CD3321A1
	for <linux-man@vger.kernel.org>; Mon, 15 Jun 2026 21:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781557609; cv=none; b=Ts38gq4M8UNOtgMyMzR/unERTZdjbqOukAkr0sFaUg5yJyj6rOPC9pdU0TW6414AFcbcN/6Xul5xxpSmC+2gZEiy3XuDwNa5+VhkAeFYUhKgBXKW1dWvpqPF5IuE30Cdm1USnzzeaJreErS2XYUKF48zLa+4u+kGt4Fe5ha24Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781557609; c=relaxed/simple;
	bh=1CDOZHva8L/5eUg6BmOoxwpQSB+uAnFlwUdPvKoCA9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FRw2geo8BApiEsG3TqaIquvoBzOEwEZRjgDVVyO34qSitwyhHOC3y7imglvHjX3zUNW0wORIGzwz9O/9xRFq4wO+xqXwYFkqObsWRX8qEG1XhmwsI3lUPuot0JUmUXz9AqgKRdVcdCJa11hLAKiDjaVqfHVTiBS0gSa11o6sicQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OgRv7law; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OgRv7law"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 048361F000E9;
	Mon, 15 Jun 2026 21:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781557608;
	bh=ef2pKlU2Bwk8Do/QQWBtgJkbrq4supmztdBfFaaAUFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OgRv7lawTsP5KddM+aiIZ0/fG1lamK5W4fU6KbcmcGCmg74pwqOPYlnABF0/4hGYN
	 bjGqhhNezN1ZOfwzBPYfutPBpOzovNRKgU/DH6RAKRcFTpBNK5vIc2ArsOGf6veV33
	 TinAGLe8iC4Q1SQ/NcaqmNcbSw0qweEIvCOG0lcHqAp8emj2pj0Yy7v+p4V7XpgkUH
	 CARrMo8lwhFJ65SAi2p051GhuQeQ6mjAK7vABlvpUWnEWSSurN5Aj91ZXb2LmnXBou
	 ro/A51zUpMFwOq42G/bdygFkl/EDnDOEAN6ENMVdJ2JJsBE5rZcCnOVH8K7vH5661G
	 2boSgIteAgfBQ==
Date: Mon, 15 Jun 2026 23:06:44 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Joseph Myers <josmyers@redhat.com>
Cc: libc-alpha@sourceware.org, gcc@gcc.gnu.org, linux-man@vger.kernel.org
Subject: Re: _ISOCxx_SOURCE
Message-ID: <ajBpIbEH_7KkJrld@devuan>
References: <ai1DVieT3gTr4J5S@devuan>
 <c357346a-ecd1-761e-47c4-5c1357b32c59@redhat.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="434t6xcoxsssvxwe"
Content-Disposition: inline
In-Reply-To: <c357346a-ecd1-761e-47c4-5c1357b32c59@redhat.com>


--434t6xcoxsssvxwe
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Joseph Myers <josmyers@redhat.com>
Cc: libc-alpha@sourceware.org, gcc@gcc.gnu.org, linux-man@vger.kernel.org
Subject: Re: _ISOCxx_SOURCE
Message-ID: <ajBpIbEH_7KkJrld@devuan>
References: <ai1DVieT3gTr4J5S@devuan>
 <c357346a-ecd1-761e-47c4-5c1357b32c59@redhat.com>
MIME-Version: 1.0
In-Reply-To: <c357346a-ecd1-761e-47c4-5c1357b32c59@redhat.com>

Hi Joseph,

On 2026-06-15T17:20:17+0000, Joseph Myers wrote:
> On Sat, 13 Jun 2026, Alejandro Colomar via Gcc wrote:
>=20
> > I was reviewing the feature_test_macros(7) page, and found the
> > documentation of the _ISOC{99,11,23,...}_SOURCE macros to be incorrect.
> > And thinking about fixing that led me to think that the design of those
> > macros is less than ideal.
>=20
> Users should normally use -std=3D options with the compiler to get matchi=
ng=20
> language and library features.  These feature test macros are mainly for=
=20
> niche cases with old compilers.  So I don't think any new user-facing=20
> design for them should be added (the C23 and later ones already use the=
=20
> newer __GLIBC_USE style of conditionals in the header implementation).

Makes sense.  Should I document that users should avoid setting them
directly (and that they should use the corresponding compiler flag)?


Have a lovely night!
Alex

--=20
<https://www.alejandro-colomar.es>

--434t6xcoxsssvxwe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmowaV0ACgkQ64mZXMKQ
wqn1Hw/+Ia9QB5ReK1aGVi8AZD10RqVsik9G5M2RX/lX/rsBh2I2O+qPjTT9MAKA
uJESJeWKGS1+CLZIRCuWUgmwf/IfFsaAJxDvB8u8A3yPcn1ra1GcZyu+f2NHu3S9
rGZOdwc+h6/uRgK2KsVl52AtKISbD7uAxOIdx5ECLQAkBFGaGsSdQj/CbrEOfYjm
9Y5NsOCmCKyjFy4PZKXyQvsVC42LL8GzW3MI5NvpQhQUXzDdrHmmRtAHhCOiU7oS
FaALVFlY3Iki3FrIclbHepN4VmslbLh0kW2tKYDIM/bcwrjGzF23V+HM7cGln2v5
I/4nBgMysG1qsIvcSDsgNqJ72tz/X2UEJZSdBjhyhBN37mn/36yi+KVI54eLH8RY
mH8vQQNhtX0jEkGwv/r9xnAGmzgdBar7sX4nFIZduH9riWQypOBb0fTVsa8jb8RV
Y+nIChuDKxzLwjYsOS/IJJD3GU2SjTqU3eexXPGNL8qhYzpHTZv2VT9nD+/YUi0/
KdZGwCaGIgo1/qU1hkXTl8O57r0fQJyzPvtZBrXX2b9dOIx1clzRDcqMgM5+M8aR
OWs8AWS8uxkIPM3vWrjKdbg9Eu3/uDu9QnGgZKF9PqNlTpX+ONIGIaIMvU09skFA
PkQrhag0ndSnSNi0yjTGFhvJNoyvjN7cYDhHWRiekxSblmbAUTs=
=ERG9
-----END PGP SIGNATURE-----

--434t6xcoxsssvxwe--
