Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792581787;
	b=PIA7zFco3z6YmCnHqzf6YOvsssfID3X9qoSG2ZYSGMkVak9DmvrK/hA/+SPr9IZHxQWX
	 SfK/Yizzya1mZslEEsCd7icRxNAHuLCnsPq686lPI7KMmoXiOcE/pBE38SCbSWKdjZybm
	 lHOXQ7eWDTqQjGQpfzjRoc3diMbCao9cn1HhdYiP1dC1808sJ1hPqWNqHbeSvFR2ku0BB
	 V2tTTHxV0Z3OHkBqjWELoL184fgUtH95+kKMOeQSVlpjVo4kbdDW6KpHRnvdSfEzP3kMR
	 Yh+6Q6PMp/X5RebxIFkRmIretG0igwGOuyXIb+qbsWC1WNTppMcoIdLmjgYcObnBPPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792581787;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=PjkL/xO4NENDt4oH1Fq7u/3z65vHJN1SaWhH+ywvAjM=;
	b=xro+aR4PXjA2BKcbdscWEjd3ndF4ITZ0bxWKifab2Tl1THsPL+haG58iTM6gVcGH6ZXC
	 F9YQ3LgXOzj1IXaCpxXAdIjlaxpD1Ez5PWHR+b5uP8+YDQLY26JwaK/bJy8zUcIQHtYwF
	 9PCICEwq3NMN4dnb25+lHgiqXbdtzA1RJkk65Ybi+BGXvetH1ZAQur8fD7Cuxtpz5dyq7
	 SsfG0XaswLNZ6ZIWQx9BujMOKv/ly3CX3DUK4vKprRdxzIkYvMX45h/bEeI+l4p3mCVoI
	 51GSpXP6Rb7qZ1LXIEmNCDserFpi4nWP3A0gQ+F3vAQW/OOvpulUt90nMoOuL1lh0iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T18VooFP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6792E606A31D
	for <linux-man@vger.kernel.org>; Wed, 21 Oct 2026 11:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T18VooFP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 806481F000C5;
	Wed, 21 Oct 2026 11:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792581786;
	bh=PjkL/xO4NENDt4oH1Fq7u/3z65vHJN1SaWhH+ywvAjM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T18VooFPeLdnVhN2XHxR+WPXOp22w5Vw0m7mTKEBid6ti4YnyAowEI78UDqzLzDxn
	 w6xCjS9qYXYSCpS30299WZuUh9o5Kbef01CRCickc0A0B/R/7+nb630vZRxo0zuEZx
	 pKbr7YIWrZ6hfXozu3QBnuiVOLbjV2A6Z4RnfSQS3FNaKSNPZpa+7/8p+B5aOAyeGa
	 RSLcPCUVORu19ZxeqHWOl7N4hfhDnWBAeSL4EPsUzqJiimDXm5vL4Le+AjBTbPS87O
	 nYnIUFREHkpP6MSeQfNOPKoxVdyYHo1vumtExqw7tYU//pmeZyoXLDzXBnialKgG+l
	 yPQ2LCw278D2Q==
Date: Wed, 21 Oct 2026 13:23:02 +0200
From: Alejandro Colomar <alx@kernel.org>
To: David <davidhu0903ex3@gmail.com>
Cc: linux-man@vger.kernel.org
Subject: Re: man-pages bug report: qsort.3
Message-ID: <atigDBJr6krOG9Vd@debian>
References: <CALAj+JbRE6K3mbps9+s4KigF-spW2pQZN6nLNyWYeHy6t_OT+g@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="k2mzkp47lqd4fqvl"
Content-Disposition: inline
In-Reply-To: <CALAj+JbRE6K3mbps9+s4KigF-spW2pQZN6nLNyWYeHy6t_OT+g@mail.gmail.com>


--k2mzkp47lqd4fqvl
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: David <davidhu0903ex3@gmail.com>
Cc: linux-man@vger.kernel.org
Subject: Re: man-pages bug report: qsort.3
Message-ID: <atigDBJr6krOG9Vd@debian>
References: <CALAj+JbRE6K3mbps9+s4KigF-spW2pQZN6nLNyWYeHy6t_OT+g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALAj+JbRE6K3mbps9+s4KigF-spW2pQZN6nLNyWYeHy6t_OT+g@mail.gmail.com>

Hi David,

> Date: 2026-10-21 11:35:17+0800
> From: David <davidhu0903ex3@gmail.com>
>
> Hi Alejandro Colomar,
>=20
> I would like to report a typo in the qsort (
> https://man7.org/linux/man-pages/man3/qsort.3.html) man page.
> The first argument of `qsort` should be `base`, but there seem to be two
> `size_t` types incorrectly inserted there. The argument for `qsort_r` also
> seems to be corrupted.

It is actually valid and correct GNU C (albeit relatively unknown).
See <https://lore.kernel.org/linux-man/aqqih5uGqYP0D_db@devuan/>.


Have a lovely day!
Alex

>=20
> Regards,
> David

--=20
<https://www.alejandro-colomar.es>

--k2mzkp47lqd4fqvl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrYoF4ACgkQ64mZXMKQ
wqkR6RAAsE9nOIZkHCajwgTqFhUpCsxicr615U93PS6ktgsJ8PlFUWl5cvFX8rYC
y5QUJzk6wmRco/uACjfS0ONBRjP0RXWM6knzAQ+cljLuYrUp1MlG24AjbzRzLrnK
TmuIMCVKPahiO/cQepqxzDmEwpayv6JY95E6MgFVlwqQW0WJ1mczL10H25Go7ykq
dlgA4ahtG5FonK8KvftfOblnDZC/G/BNkXg/Wp5nyYsXZCN2AIXuC6raMJYGc6mg
S2r0SzKfCjwq7sPpmnA+vQFwZMSxUA3YsdXqItXpBUm81aSU1JlnJo9iDjGNYPpC
aVKGvvB21BbfKSbnhG3zc8NkQCnq8ALg5iButgDTJHfEarwuY40UOfdnjLEIW7gf
5OgWR2vqn3G/VPOqh/UKyYvrn7m7fdwLyFF1VUc0c0+YWQErYaq3vz+wQLPiHYCe
WBAlvFHAbRoPnkbPQ/NCjD5k1CERa5drv8eI5edfxd/XdFTGTDx5ArW49TGMd2NE
uLKFoua6BFYQNhoORTIeogSZRyF1vTQ0hfpjjb9EG/Ns4T10Qe0Jl3/TPp0ALIbE
xKaX4zL8+LP1Gi2DHOpcR5S9I1Dc3ZvRR35SDCGpk7ccHbfAmBS8bSY8ZHEhqFqq
8ptcla2dWBuJFuVD/AwpWOZ9iRGaLrzWSmFKRyB4DBunzAshz88=
=+yE3
-----END PGP SIGNATURE-----

--k2mzkp47lqd4fqvl--
