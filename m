Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792757479;
	b=xUAO3+dfbEA3pOUJtS7ZSlHiP1qRZm0VBPMMeEqBhuhaGHCycfQFYNNz/jfP9Ny4K/Tk
	 NyZwP6mppzbdBMx5kqsDziQsildQZLQeQXX+NHkbWHpKXTyLrwukDD/rdFWNGbItBHbS8
	 kGws+AFdACRaWyt3e0NDZEdSaPD1dZ6/QIvpYCfJ9CNoabYEhtyYyH9BvN/vQKqZMaQIs
	 Zd3NpKf8EVBbcJDuJvQljDjYkIFEndKJaAHKGeN1uz3nV1uylAeHf+jiPGALYqa/YFPQs
	 S8jEolreCowjTfzX3tL0NHuIIlK3ZKIYK8zCmkSviqWywpTwBN7saf4CUh0JNnPTOSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792757479;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=G/eHKpjaAWIo29awBiOREzvyosH8ngXWE6JNsU7v+J0=;
	b=Z9RqpoLyQs+//HjZXjwPu44KSPE2qFw0TS+V3Bpc4+YuM2WJ53BthBYYZdoPUmTDfvnu
	 JtCk0dqJKW2RCjO42S30igiueFsxe+ZgbO+NJgXAxgSa7XcnF6nRrQ2i2ujxVYu9f959D
	 NRXYXYHqqIpIMNWPbcZEtmsDJpqBt/mr3cjqDqa+wSQrk37CRwnzhPxsnbI1V4n5tLNza
	 0E7i3Gu45Dsz5DmeUP5NOHgcO0jp2QCf7/o9Apun8jkjTxzhJJvQDeXPmtn0sNDbIGIWt
	 awJJlzyZWwV6pckq+clama40eYxXZjnTW1u07LcaGWIoBr/JSknM5ifPltk8zPVnwpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gSHGRtYm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A128606A31D
	for <linux-man@vger.kernel.org>; Fri, 23 Oct 2026 12:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gSHGRtYm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C69431F01829;
	Fri, 23 Oct 2026 12:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792757479;
	bh=G/eHKpjaAWIo29awBiOREzvyosH8ngXWE6JNsU7v+J0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gSHGRtYmCZID0fBzL/BGqd/HCuCSUd09BBFGOSO6AUOKRuRlmWONXy2oJDOlAycBR
	 EXHvmum0iu1/xzXtnnIiWk9thzuljdVbbii2f+rH1XJVzVjx5Oo2fOQRJmIxuSVlUv
	 OPafr5Q5RgJAbpJhBjMOOHjSyTfmPYokiWx/Upib94S0YcAZGk7ZLCxFVA7x9fFXMW
	 NnCGN0CReUHB6g+5TS3qYfISAA8ja5Ib1nI5XjxhFm3/eAEPUl6jdHPMaT5+7Y2Pa8
	 aHwAN5k3SdgiC+oE5rSkwoXBnVHvupYaeQBtHM/C9YhLkXJXKu9ZI9NWo68Pww859b
	 xqjIqJYdiPlsQ==
Date: Fri, 23 Oct 2026 14:11:12 +0200
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Christopher Bazley <chris.bazley.wg14@gmail.com>
Cc: linux-man@vger.kernel.org, Michael Kerrisk <mtk.manpages@gmail.com>, 
	Sam James <sam@gentoo.org>, Carlos O'Donell <carlos@redhat.com>, 
	"Joseph S. Myers" <josmyers@redhat.com>, Martin Uecker <uecker@tugraz.at>
Subject: Re: [PATCH] man/: SYNOPSIS: Remove GNU forward-declarations of
 parameters for lengths of array parameters
Message-ID: <attOh6Rt65MavbuK@debian>
References: <79b27ba6d0eb7a511f23607a4f3612d4f6911f24.1792687206.git.alx@kernel.org>
 <CAEHU8x9jET+vcrR0NpDz6t57egQG8TZqx5XtV52srH9ZRvdxSQ@mail.gmail.com>
 <atpnWiYQzs_HZ1Q7@debian>
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
	protocol="application/pgp-signature"; boundary="yej22zauqcbprqzc"
Content-Disposition: inline
In-Reply-To: <atpnWiYQzs_HZ1Q7@debian>


--yej22zauqcbprqzc
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Christopher Bazley <chris.bazley.wg14@gmail.com>
Cc: linux-man@vger.kernel.org, Michael Kerrisk <mtk.manpages@gmail.com>, 
	Sam James <sam@gentoo.org>, Carlos O'Donell <carlos@redhat.com>, 
	"Joseph S. Myers" <josmyers@redhat.com>, Martin Uecker <uecker@tugraz.at>
Subject: Re: [PATCH] man/: SYNOPSIS: Remove GNU forward-declarations of
 parameters for lengths of array parameters
Message-ID: <attOh6Rt65MavbuK@debian>
References: <79b27ba6d0eb7a511f23607a4f3612d4f6911f24.1792687206.git.alx@kernel.org>
 <CAEHU8x9jET+vcrR0NpDz6t57egQG8TZqx5XtV52srH9ZRvdxSQ@mail.gmail.com>
 <atpnWiYQzs_HZ1Q7@debian>
MIME-Version: 1.0
In-Reply-To: <atpnWiYQzs_HZ1Q7@debian>

> Date: 2026-10-22 21:54:09+0200
> From: Alejandro Colomar <alx+linux-man@kernel.org>
>
> > Date: 2026-10-22 18:29:31+0100
> > From: Christopher Bazley <chris.bazley.wg14@gmail.com>
> >
[...]
> > but the fact that there are no useful ISO C
> > semantics for parameters of pointer type declared using array syntax
> > weakens my concern. (If the parameters actually had variably-modified t=
ypes
> > then the change would be far worse, from my point of view, because the
> > parameter types would no longer be expressed correctly.)
>=20
> We don't care about what ISO C says.  GNU C clearly assigns semantics to
> array parameters, and that means we have to be careful about them here.
> If this can result in sanitizers breaking code, it is something to be
> careful about.  Moreover, I hope ISO C eventually catches up.

Moreover, there's GCC discussing at the moment a patch of mine to have
_Countof(parameter) work, which would be an even larger risk: it would
produce different values in code, and not just sanitizers aborting some
program.


Have a lovely day!
Alex

--=20
<https://www.alejandro-colomar.es>

--yej22zauqcbprqzc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrbTuAACgkQ64mZXMKQ
wqk6og/+NVsuLCuEn/tapV5VGC34qEccSIFGqSO1LzCM7HrA4E3tzF7GqZZxjg8r
W5VWqL8c9kVgAqOxuzTbjO6xXPDDH/b+bKbH21xf+mToGVXpWUfp67tyfhOKq55m
qTBpzFKKzvnQ7NrW9Gz2pPHyd6driwONhIWi6BebqE7UXS9wtyXwnqiTlYfRtwsw
5GvkTN7oI6xQ2VQx8x3Bmknxh1xgQIZDgmFDUGre9n5j0vUiIgyJewGIXKZ4mU0n
9XCdjRgpviE/M8g7dedGiESA82W6+lOvD1cuY7jRrTbl3vG0j/AZ35nZ+ZBS+OtF
6GCd+neyWynW8mu51UI3HFDUKh5oMCUwXrPMVpEcUzU91CXmrwmxwEcUBRxYk0rw
39miXX3ZJJ+56s85ciQ1aL2TEHQMuXWVIIKRIq9x0yItm6Wq7fUVTJ+1Lr9pLjFf
Ei1VXMfTGmZSzwU54mk/mCt4TG+J6B/14Wd7AYCf5Aho3iID8vr3tWre8ShQuK+U
UwM3H2fqFJ3UYKWP6NAuRJX5lw4QToIEvdnEiMpFkzy/ec5hzMtl6YLA4tBkghAg
iXrDwKJjrHZHDT+RGagrCvL3hG6NCr2heD1KrqErCvVhzNNyLvJZQg41yhfo6a7I
W2t+tUYMyvaZ6RykyOD//uIXeHQP35ns6CQ/BiP7SBxhDXO78F8=
=EsOv
-----END PGP SIGNATURE-----

--yej22zauqcbprqzc--
