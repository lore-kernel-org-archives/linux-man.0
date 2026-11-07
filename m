Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794050169;
	b=ClraBGeBmFzVmYQL8jqP/eVuVeZoHh4gN6Ddi8iXwRqwWivBAThGxBUBH+hg7GuiMj5z
	 3tE2gCdTDFGnBN15+9hSUUv+SVsqGL+wI5WFo6n6Vh1tb4Of+gHIlWdIebSVTvj5o6cUk
	 11QTDWjsMFSvXELgPK3Z099UZS1eB6ewUkkEhk0xfmbLjSvutwa5ssCQn9Awt/luuG7a9
	 DpSjDX1As/4lx0nOVpg3yTINRitSoycF3bUzhsCiz9T6zEcU0eS31lNxipVMYYARL5+hY
	 29NUye/pqPLsZ38Pkjc+5FqydpcFcFJ1I4MO0DLAuLYwgwod3UJye2BcOtBRxD9i2Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794050169;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=HAfTotWhUMFNxKcUDSCQs1C3+EdOXUWRdq3kn4EoGEg=;
	b=RyBzhaWYNqTmJsMFZ666GqP0kAMxR4QOzCwhSHqBK8tzL6nAoAc69c2IJ3lI9EHbFBKe
	 paHDTXmcq6KXEae7xfWSGj4FV/jgNoWkEfPlxNdK7wvzD0KvxO18vnSa2bAdv/fdPkM1K
	 cwAchg8cbgXtgdQmjzb/KHtTGnyWJ3qaS0gu2QTvRRY082beHUqdx0XWI8WslxXVRC7qO
	 Z4ntRqk6aYWAcHPmF9y9F8XqNNs+XR1iGusaPZREdjuc8/hTkUnT3BkizZRFPsZKJ+NHF
	 3TrTVg9NtW+AZ9TM9gJkyKzCmB2iUR4CgYd3vEfsMkuB0eP3dzZZQ7ch2QREsU17HUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BOSrGjPY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE96606A336
	for <linux-man@vger.kernel.org>; Sat,  7 Nov 2026 11:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BOSrGjPY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA6E61F008A4;
	Sat,  7 Nov 2026 11:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794050168;
	bh=HAfTotWhUMFNxKcUDSCQs1C3+EdOXUWRdq3kn4EoGEg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BOSrGjPYwd/gizLbATpAIqHBWxWiqiQ6rt8RuojVAeOvVaMxFE3hKE8gnmMe85VhE
	 MnLv0U0/CjLeRhzHbhkEkZqj0F/nBx4XsO3wbk78t+7D8gLase+OLXU0wO5JvJgqcz
	 ZyaJLwxZuEGg/6/hxnvIwLZDNq2cdCj5+a7uKqAwV0d+KLfkik9i7gqF7pf3FQhuJl
	 aJHjPg8FYOvFoZ2x12BzHkEC4k7QmO2SH8TaFyriYthLocD9dM7l5sN3Yc1g3FA287
	 ziQXEdyqNFAEJNlYGFZci3lIA6DOIdXl9SWkqWDy4tqu5neHmF9H3T/c3UNPn7HAeX
	 eUYEklYJgwQWA==
Date: Sat, 7 Nov 2026 12:15:46 +0100
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: Matthieu Buffet <matthieu@buffet.re>, 
	=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, linux-man@vger.kernel.org
Subject: Re: [PATCH v2 2/2] man/man?/landlock*.?: Document UDP support
Message-ID: <au8HcBs37d1yUkZ0@debian>
References: <e354fb0d-2173-4015-b945-c413bb1b1c44@buffet.re>
 <20261102233932.29912-1-matthieu@buffet.re>
 <20261102233932.29912-2-matthieu@buffet.re>
 <20261106.73089117d0af@gnoack.org>
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
	protocol="application/pgp-signature"; boundary="zaaaxircjmujmorz"
Content-Disposition: inline
In-Reply-To: <20261106.73089117d0af@gnoack.org>


--zaaaxircjmujmorz
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: Matthieu Buffet <matthieu@buffet.re>, 
	=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, linux-man@vger.kernel.org
Subject: Re: [PATCH v2 2/2] man/man?/landlock*.?: Document UDP support
Message-ID: <au8HcBs37d1yUkZ0@debian>
References: <e354fb0d-2173-4015-b945-c413bb1b1c44@buffet.re>
 <20261102233932.29912-1-matthieu@buffet.re>
 <20261102233932.29912-2-matthieu@buffet.re>
 <20261106.73089117d0af@gnoack.org>
MIME-Version: 1.0
In-Reply-To: <20261106.73089117d0af@gnoack.org>

Hi G=C3=BCnther, Matthieu,

> Date: 2026-11-06 23:02:40+0100
> From: G=C3=BCnther Noack <gnoack3000@gmail.com>
>
[...]
> > @@ -120,8 +120,13 @@ with
> >  A Landlock rule with port 0
> >  and the
> >  .B LANDLOCK_ACCESS_NET_BIND_TCP
> > -right means that requesting to bind on port 0 is allowed
> > -and it will automatically translate to binding on the related port ran=
ge.
> > +or
> > +.B LANDLOCK_ACCESS_NET_BIND_UDP
> > +right means that requesting to bind on port 0
> > +(explicitly, or implicitly
> > +for instance by sending a datagram on an unbound UDP socket)
> > +is allowed
> > +and it will automatically translate to binding on a kernel-assigned ep=
hemeral port.
>=20
> With the caveat of not being a native speaker either, the commas in
> this sentence feel wrong to me.
>=20
> Suggestion:
>=20
>   A Landlock rule with port 0 and the LANDLOCK_ACCESS_NET_BIND_TCP or
>=20
>   LANDLOCK_ACCESS_NET_BIND_UDP right means that requesting to bind to
>                                                                    ^^
>   port 0 (explicitly or implicitly, for instance, by sending a datagram
>                    ^^^           ^^^           ^^^
>   on an unbound socket) is allowed, and it will automatically
>                                  ^^^
>   translate to binding on a kernel-assigned ephemeral port.
>=20
>=20
> (You might also use the shorter "e.g.," instead of "for instance,".)
> I'm happy to stand corrected, Alejandro has a better grip on correct
> grammar than me. :)

Not a native speaker either, but I agree with G=C3=BCnther.


Have a lovely day!
Alex

--=20
<https://www.alejandro-colomar.es>

--zaaaxircjmujmorz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrvCGIACgkQ64mZXMKQ
wqntyhAAta8zTgUGDnD90SPspBlEoJSHzl4rYxJxgSXNmJBSUCF92wr1c5eug0cd
Ls4JkXXq17Lq09sbC6q42Mds9zQ8RiAk6at6ag9bq6Weqh+oznNB6PNpVsvA/EW5
7N7ANtIlZqBQQc20ecqTAZQuAMvcp9EmhdwWvMm2LJduhte1eAFVcsh/7F9IXWX0
ePdnIiMr5S1uTxp6aketQ2Ei3COggYQZecU0AGXouNVHktcDSMleyVumV6x2acI2
4ZEBkj0ABwhBMLbNcQILKNzdnIbfpxJuO/Qu1OxViY0XY1qnP6roaBZS6m/NQGEI
YODLYGL5iIKTbOChhaNLszZ6dR0GR/MSdTds7reHhhghx6Ai9nOXyNCqG98mqVJ3
/2zT9XWhMChcor9iYpyp5+FRfFh36oMa2Eh5Y+lI1fpI5xZdhPMSN/sndbX30MHT
CMdUhh95ffoz9vWzz42go7boguGTRAaXIw6qW3B0+9Y5h/MbFLWsM4xQIhJASf0X
Aiur6sURMmgkEesGd0w5EzoIH5P24G+Jot61eN/0nxxnHmH2xHAR7e+oEJFnRpZd
FqEVWKiHiEMtd6JLzVcYZ0oF3W4QrwQBPB/03PeWTSQXnbXEI4UMl8kVT69uy3Pj
qK2qzYYIKBAmR5S77VdtKoVqiDLXY8ziZXmFKI3rAjy1D730fYs=
=vii6
-----END PGP SIGNATURE-----

--zaaaxircjmujmorz--
