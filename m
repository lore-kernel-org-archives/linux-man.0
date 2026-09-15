Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563842F290A
	for <linux-man@vger.kernel.org>; Tue, 15 Sep 2026 10:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789469823; cv=none; b=m3JuxiSgbX0gs3QiVRkWRJU3eUfGcNSECC7/NlFmFvqLlNTLu/he+YQLqNDRPaQsCPuCCTVAxuuTbrgzJOeyYblDGkBlHFNvrHbUAK5P/qU/Oz8h2yD5UyRPuoEvMHBDqaFZrpzvoeTiHB3Y4QRB3qAnlB3BL51/yGXIdY7nmCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789469823; c=relaxed/simple;
	bh=pfDwzVfxHc1t97qqe6NFdzv14fzyBPwojKs3laOefhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rg9c1uSo27b8BT251CB08hmr09HuvUK1Kwap6jGapTdinlI5ZOmry3SZUY32wjbpPjUs2uDs5pHXrJfx3nijz81TDtAyPbJ1AVkVIou/zzQm2vNDs/Mr0kT2W9AwoSDessz8AwEPgZNAVJiz92h92pZkFkhwJFiUya89v+C1Yn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O4TyrqBh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O4TyrqBh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82C0A1F000FF;
	Tue, 15 Sep 2026 10:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789469821;
	bh=itV5L0X6m019BUysowzQWPguKZUig8pCfSzIW7NVCu8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O4TyrqBhj3KlE1/GZCH5+7SxXagI/fL5Xyb86gI6tYea5eZOHKp2UZKkj+4I0aanX
	 pDw0RFcjiJaS4J9wUqJnHAfuEdCzh5tQryIe0G9L9FwG2/LtUd+WQY4HExhUFcSOD+
	 lInDQ0HQe6S61tsqbuwirrVyzrdiL8vhtY/KEmRJupDz6SrNskcpaUj5ZcVJLUO8Nr
	 +4iDDCz7n3fe1wDzU9rIMkxUoRulGHMWdqxd6Xk1kalKHxZ9jSxGhWQ/IJSzQfNykw
	 ySgJjvpfCq34j70KgsGGc20sWAMe+WLzpfXRJTSKwjouUdNgTpwxb4P8baSCBmjfXr
	 ALTE4Dy26P1GA==
Date: Tue, 15 Sep 2026 12:56:57 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Martin Uecker <uecker@tugraz.at>
Cc: Mark Harris <mark.hsj@gmail.com>, Petr Vorel <pvorel@suse.cz>, 
	linux-man@vger.kernel.org, Yeoul Na <yeoul_na@apple.com>, John McCall <rjmccall@apple.com>
Subject: Re: [PATCH 1/1] man/man2/request_key.2: Add missing GNU size
 forward-declarations
Message-ID: <aqkjVw72crIamoKm@devuan>
References: <aqf1jJ1qxsTdw6kE@devuan>
 <CAMdZqKFVE-1-LkBR+ei77rd4dwXXS2AG_nySx5ACi61whtxG1g@mail.gmail.com>
 <aqg0173m_lx_UB4G@devuan>
 <4ec579cb8963a7221ee833dda507d062a787fd47.camel@tugraz.at>
 <aqhfPJo4BBnXn2I-@devuan>
 <1f86348ce948d9e8899b8abaffb8eac0e86b244f.camel@tugraz.at>
 <aqkDizAvyqOLJw-g@devuan>
 <856e88cd5491195531ad21d6b338620a29d18af6.camel@tugraz.at>
 <aqkVrTjkEDcSHK7h@devuan>
 <1bb001e8c067ac5f91ff7765979289f1bb8f8628.camel@tugraz.at>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="elj45axzjee2i5us"
Content-Disposition: inline
In-Reply-To: <1bb001e8c067ac5f91ff7765979289f1bb8f8628.camel@tugraz.at>


--elj45axzjee2i5us
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Martin Uecker <uecker@tugraz.at>
Cc: Mark Harris <mark.hsj@gmail.com>, Petr Vorel <pvorel@suse.cz>, 
	linux-man@vger.kernel.org, Yeoul Na <yeoul_na@apple.com>, John McCall <rjmccall@apple.com>
Subject: Re: [PATCH 1/1] man/man2/request_key.2: Add missing GNU size
 forward-declarations
Message-ID: <aqkjVw72crIamoKm@devuan>
References: <aqf1jJ1qxsTdw6kE@devuan>
 <CAMdZqKFVE-1-LkBR+ei77rd4dwXXS2AG_nySx5ACi61whtxG1g@mail.gmail.com>
 <aqg0173m_lx_UB4G@devuan>
 <4ec579cb8963a7221ee833dda507d062a787fd47.camel@tugraz.at>
 <aqhfPJo4BBnXn2I-@devuan>
 <1f86348ce948d9e8899b8abaffb8eac0e86b244f.camel@tugraz.at>
 <aqkDizAvyqOLJw-g@devuan>
 <856e88cd5491195531ad21d6b338620a29d18af6.camel@tugraz.at>
 <aqkVrTjkEDcSHK7h@devuan>
 <1bb001e8c067ac5f91ff7765979289f1bb8f8628.camel@tugraz.at>
MIME-Version: 1.0
In-Reply-To: <1bb001e8c067ac5f91ff7765979289f1bb8f8628.camel@tugraz.at>

Hi Martin,

> Date: 2026-09-15 12:28:31+0200
> From: Martin Uecker <uecker@tugraz.at>
>
[...]
> > > But then again, it seems very unlikely that writes
> > >=20
> > > enum { MAX_DIMS =3D 100 };
> > >=20
> > > void i(int a[MAX_DIMS], int MAX_DIMS);
> > >=20
> > > with the intention that the first MAX_DIMS actually
> > > refers to the global variable and not to the parameter.
> > > If such code exits, it is=C2=A0 almost certainly already an
> > > unintentional error.
> >=20
> > And you would not diagnose such an unintentional error?
>=20
> This would not be a new error, but an old one.
> Nobody felt the need to diagnose this in the last four decades.
> And after the change, it would not be an error, so there seems
> even less reason to diagnose it.

If retroactive scoping is added but optional (to allow small compilers
to live without it), then it might become a problem.  Porting code using
it to compilers not supporting it might successfully compile, but have
different semantics.

[...]
>=20
> QoI might result in diagnostic if it turns out to be a problem.

But I would be okay, since indeed QoI would come to save us.

> But if it were a real issue, we would have the diagnostic already.


Cheers,
Alex

>=20
> Martin

--=20
<https://www.alejandro-colomar.es>

--elj45axzjee2i5us
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqpJHkACgkQ64mZXMKQ
wql8FxAAr6tu3H/D8AgUX+2o7hu4X4kkVg7G9FsRdxYZijkKenUa+gc9Xo0Ybwjz
MnhNjjs64BsZU9LHXHMSl5dh2u3mw6z6ZtpfxzWEZyCUMo5H7I94QDTfBTx84IpI
/OnJax+Mh6pmWAVz+pvKOXhGEAYCSap8E2lTyqwmubcyT4l/0OFQZH+F91GeoqUi
ZjMScNz6WTv5AcGMyyRgcd36bnauylTbFnKFbawjcQ43TwkKEkZ/8H/2Gm4ob4HC
st1i8Zf3BmFXxaWQpq4oZb2czNf0+ZX5EJve3dc+eOo7pnGEdhWnbAqbA7bgsEFD
FKXhf7PK4LkxjZKlO1BwV/TSVJw3pd+E3F1QuZZY1Raax/ET/hG5c7caLUbzz5LX
nB7di2G/gCB0cR9VZImbjfQm9qKx2Lp8VWPEEILZCykWtIkS6O5zLBfnS7tRPcm+
wWRgjzZ8v5nYPgn1BzzD0ZavMD/RXGvToCAjbD/DktuTX1cIxu0tiYqOVQN2dMt4
dU240+KpOLLx6H53/EZlorr9+mjnQDOL6kL2eG+Vp3Y/XBx6YoreJk+zTG183O6n
6s0iZW1MKNWLWO59F7B0YgdxV50AteJUV8GB3FUo2o32OPKGs/wYRyrSfx7x2UAM
R6yVAqsNheVpmloFNjFyH3wFGZcG6Q7OXQLtHQOqyo/TKwfnKtM=
=vn6h
-----END PGP SIGNATURE-----

--elj45axzjee2i5us--
