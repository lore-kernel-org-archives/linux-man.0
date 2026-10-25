Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792913951;
	b=Fil06Uc7TRzAPlZCcTg3bcl81gvaDNp0YilaSPmcpodHUA0EhE0Tn2iOulhiMiDr6T72
	 E4Jy2DgTl2K7DxdNmvNGRbVrBSPL5vGVMmh541Trknv2G7IX9UEYMGtXUhpv7H6RY2KOu
	 M9pQbxAZ/1062n3G+IWYSH8E9WCFBnY/Zoo60thJaL+k0EHzxRdXpoEO+79FLJIz+aWPq
	 IJDoP00depe0RAjI5qRC5E5jVctJT0ryasbAp4fv2IYOosLSMbLIbnZmw+uu8TNyB+SOj
	 HaBuQW8mOJ2NbGIt4vpguV+7D/MIcOeHUFoX1Y48xjPIN9Ph2usceEwR7LnHE9LaSxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792913951;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=1siaCn5BTaFtn6d9X1QQU51ZmlaAadYhlVB28PN0Y7o=;
	b=nwapiBUIFfFdi6jJ6FUKBQqdR0S2S7lbH0YCtD+c1OeVh1e40rRPSsB+VlL7hjya/Df/
	 vY4Cy5mZwAJGRQc6ZBk3CWllcxWBkobP6ASschGHjpp/HD6RGuzloMkEn5B8O33wtbe3W
	 jIVqHTTn3bXRHZka8vvfY8NdENPojK7B3w+mAm81z7b09FoJ7v5FJNaysGvVN2QDFIkxY
	 dRbufqWMTBU6MGEXGo99ebPuQUG4h9/UIGQ0XX6eyylm25bLj/UTfA8vW4Nzwlsguv99Q
	 ZUKog6n02mTSinrBcltqa8/zlGJfJ3J1bSKY5AK9NvFI7Gj6zdhsZH1IJAVZctyo6kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D8fcGocX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D829606A31A
	for <linux-man@vger.kernel.org>; Sun, 25 Oct 2026 07:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D8fcGocX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3A6D1F01825;
	Sun, 25 Oct 2026 07:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792913950;
	bh=1siaCn5BTaFtn6d9X1QQU51ZmlaAadYhlVB28PN0Y7o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D8fcGocXUVkuEsp2NGo8PN6fHv5tvxqlFkyVf2DL2kI2RiLTQJL8mDKrFN3dyUYAa
	 YDNShUL4w3bcVDQGZxT0rjXXG+/IYrMmQ1zvFOi8/tzohUFyQ69usZn9LTc/qbhl15
	 xJshWHmuMidTN0LVY9k24PjH2xsw8nibHLKv7vuz4g6gwJZ+pGp8PY6ndVv4wrQHFM
	 KyrSmfRiap1iyVn8aH5dX4OCF4G9Q4T+nAdUKafMAUAm8jkDxNchzjptNVIsc1tT4i
	 xZjIF4yiZoqTVkbyBEx0qjqs+Lsg1ymsP9aPPNp/okXV5AJ1Nqay5MTCh82phtYm9d
	 1aCTVXzkolSfg==
Date: Sun, 25 Oct 2026 08:38:55 +0100
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Martin Uecker <uecker@tugraz.at>
Cc: Christopher Bazley <chris.bazley.wg14@gmail.com>, 
	"Michael Kerrisk (man7.org)" <mtk@man7.org>, linux-man@vger.kernel.org, 
	Michael Kerrisk <mtk.manpages@gmail.com>, Sam James <sam@gentoo.org>, Carlos O'Donell <carlos@redhat.com>, 
	"Joseph S. Myers" <josmyers@redhat.com>, corbet@lwn.net
Subject: Re: [PATCH] man/: SYNOPSIS: Remove GNU forward-declarations of
 parameters for lengths of array parameters
Message-ID: <at2vv1isjbPZ6-34@debian>
References: <atpnWiYQzs_HZ1Q7@debian>
 <CAFs=pgZZeOg7vmkyTjwZdnafYFxn+Yogd9usEzX9Bmv87Z-P4A@mail.gmail.com>
 <CAEHU8x-Zs8E=e5qoJYRB2ecunpcZWoazsj9Pnxq5bn6bS4ndMQ@mail.gmail.com>
 <CAFs=pga6UWmH6FJZcf0wRi2S3PdbrJWNFeVbkQVVmncB3Ni=-g@mail.gmail.com>
 <atyxz7Uj4rue8HjP@debian>
 <CAEHU8x9P3PLFAMpJ7wfYapvJkEt4b09KR9sypjUuONRniAQT3w@mail.gmail.com>
 <atzcMTC3Hl4GPD39@debian>
 <fbd4d03cbaf3e0b3a978ca3ff3902103ed954a87.camel@tugraz.at>
 <at2l_NpU28j3n6L0@debian>
 <dd9ca27e6b4c227c08cd707aab9b0b5d495c203c.camel@tugraz.at>
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
	protocol="application/pgp-signature"; boundary="kdv6g2jf5upiutjd"
Content-Disposition: inline
In-Reply-To: <dd9ca27e6b4c227c08cd707aab9b0b5d495c203c.camel@tugraz.at>


--kdv6g2jf5upiutjd
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Martin Uecker <uecker@tugraz.at>
Cc: Christopher Bazley <chris.bazley.wg14@gmail.com>, 
	"Michael Kerrisk (man7.org)" <mtk@man7.org>, linux-man@vger.kernel.org, 
	Michael Kerrisk <mtk.manpages@gmail.com>, Sam James <sam@gentoo.org>, Carlos O'Donell <carlos@redhat.com>, 
	"Joseph S. Myers" <josmyers@redhat.com>, corbet@lwn.net
Subject: Re: [PATCH] man/: SYNOPSIS: Remove GNU forward-declarations of
 parameters for lengths of array parameters
Message-ID: <at2vv1isjbPZ6-34@debian>
References: <atpnWiYQzs_HZ1Q7@debian>
 <CAFs=pgZZeOg7vmkyTjwZdnafYFxn+Yogd9usEzX9Bmv87Z-P4A@mail.gmail.com>
 <CAEHU8x-Zs8E=e5qoJYRB2ecunpcZWoazsj9Pnxq5bn6bS4ndMQ@mail.gmail.com>
 <CAFs=pga6UWmH6FJZcf0wRi2S3PdbrJWNFeVbkQVVmncB3Ni=-g@mail.gmail.com>
 <atyxz7Uj4rue8HjP@debian>
 <CAEHU8x9P3PLFAMpJ7wfYapvJkEt4b09KR9sypjUuONRniAQT3w@mail.gmail.com>
 <atzcMTC3Hl4GPD39@debian>
 <fbd4d03cbaf3e0b3a978ca3ff3902103ed954a87.camel@tugraz.at>
 <at2l_NpU28j3n6L0@debian>
 <dd9ca27e6b4c227c08cd707aab9b0b5d495c203c.camel@tugraz.at>
MIME-Version: 1.0
In-Reply-To: <dd9ca27e6b4c227c08cd707aab9b0b5d495c203c.camel@tugraz.at>

Hi Martin,

> Date: 2026-10-25 08:22:23+0100
> From: Martin Uecker <uecker@tugraz.at>
>
> Am Sonntag, dem 25.10.2026 um 07:59 +0100 schrieb Alejandro Colomar:
> > Hi Martin,
> >=20
> > > Date: 2026-10-24 20:11:10+0200
> > > From: Martin Uecker <uecker@tugraz.at>
> > >=20
[...]
> > > [static ...] implies that the pointer is not null, this is
> > > a standard compliant way to express this (it implies a bit
> > > more as nonnull, but compilers do not support more).  Still,
> > > it gives you a real practical security benefit.
> >=20
> > I know you can get usefulness out of it, but the fact that you must
> > express a bound and that it doesn't mean what everyone would expect it
> > to mean makes it a broken feature, unless and until we fix the second
> > bullet by making [static n] mean the same as [[gnu::nonnull]] [n], which
> > is n3801 <https://www.open-std.org/jtc1/sc22/wg14/www/docs/n3801.txt>.
>=20
> I know. Is this on the agenda?

No; it has wording issues pointed out by Joseph, and I don't have the
time or energy to address them at the moment.  See [SC22WG14.36403] in
the mailing list.

Feel free to take over the paper if you have a good idea for those.
I plan to come back to it, but not this year.

[...]
> > > > > > The committee was clearly confused when they added this feature.
> > > > > > It was around the time when 'restrict' was added, which is anot=
her
> > > > > > historical mistake of the committee.  In general, every feature=
 they
> > > > > > added thinking of optimizations (and that includes these two) h=
as
> > > > > > resulted in a mistake.
> > >=20
> > > It was not a mistake, it was a different set of priorities
> >=20
> > It was a mistake.  They thought it would provide room for optimizations,
> > but nobody checked whether it was actually useful in the real world.
> > This seems to me a clear example of a design looking for users, which is
> > precisely what the C Committee should *not* do.
>=20
> I would assume it came from cray and they had real world
> use case for this at that time.

What is 'cray'?

[...]
> > > I think the idea of limiting access to the rest of the array did
> > > not occur to them, as this feature was only for optimization.
> >=20
> > And that's what I call a mistake; a big one.
> >=20
> > > > And indeed, I agree.  This seems a case of bad design, wishing that=
 it
> > > > might eventually be optimizable, while it wasn't and still isn't, a=
nd
> > > > also while ignoring the safety issues caused by it.  We should just
> > > > pretend that the feature doesn't exist.
> > >=20
> > > It would potentially be useful for optimization, but I think there
> > > was a chicken-and-egg problem.  Nobody used [static] and then
> > > people worked on instead optimizations more useful for existing code,
> > > so [static] also never become useful for programmers.
> >=20
> > That's the right approach.
> >=20
> > > Much later it become useful to express non-null pointers.
> >=20
> > It still hasn't.  It will once we get rid of the bound.  That is, it
> > will be useful when one can do [static] or [static *].  And even then,
> > the fact that it can't be used on function pointers makes it a bad patch
> > in the language.  We need a feature that is consistent.
>=20
> Yes, but we do not even have a proposal and [static 1] exists today.

Actually, we do have one: n3803.
<https://www.open-std.org/jtc1/sc22/wg14/www/docs/n3803.txt>

The wording on this one is good.  I think I forgot some trivial
duplication of the diff for both the non-abstract and the abstract
declarators, but I can fix that when I arrive home, so we could have it
in time for the next meeting.

> >=20
> > And we also have the issue that it changes the meaning of the bound.
> > It's just terrible.
>=20
> The bound in [1] has no meaning in parameters,

This is not true.  ISO C is just toilet paper in this regard.
It has a meaning in SDCC and GCC, and every programmer that ever wrote
[1] assigned a meaning to it.  Moreover, I'm using [1] myself to express
pointers to exactly 1 element.

> so [static 1] changes
> the meaning only in a sense that that it has a stricter meaning
> that is still only a subset of what we want.=20

This is just not true.  The standard is meaningless when it clashes with
reality and common sense.  As Capt. Barbossa would say, "the [standard]
is more what you'd call "guidelines" than actual rules.  Welcome aboard
the Black Pearl, Miss Turner!"


Cheers,
Alex

--=20
<https://www.alejandro-colomar.es>

--kdv6g2jf5upiutjd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrdsggACgkQ64mZXMKQ
wqlZ4RAArv2sqRUaz1+cefBhCI8m9lAJSBu7sw9mwyrt57jKnjUKDNWmyAf7SoEd
6jqxaqawsO4w4t4rtaO40aklGyKyjnXK4MmcqTIt5r0vS1zTUwFmx9oFdsuWnLNy
v9AHS2+kA30vfMBs2ME34ZJ5auwLUUNFnNevZlQ+tdckRpNF6TePlyfXPpVf9+Ru
KKqgx2JVir5/uMdKLYPsiwMgQGMLrLbdvxyn+NQbyWKRfrhPf5sJzCT0FD0D6SIP
73oDpGn20PDML8uZEcwUyXggno3QrGOpHZaqKIcg/j+g9FUZ+WQdOzA2zBkJbyV8
9dHc4IAJ8MDVCzaJVesE5ziJmZl/Zs0/TjIJAi0miF9HdEtJYkRtYuzyw6YouND9
FZ4T/ilpUp7m9i63LgBXEEyZeY+OBng+qLfnTbZ89F8C0NjB78YAsCzEnhJ1yBCo
2+RM7kbsQKfci9exuN88xfrqbGxEfUTSK+qqOezFmLR4G72dGkjmQSLdIYnf+uFo
IWxPfXddStkQ/tuNQuMjE9Rb9w4KK9qJYMAXNnGuzfMKzzNT4G7efMk8J8hGSn7b
uT9rxTEKMx3LgV0qfyRJzOv1ZLEVRpDnhN5TvHxxqo7wvUJGsH2ssFnKUnQSJVKw
Wl+4SdCerYjOM91SloXtauRzdgMCRXSGZS6OirzEOgIrnWarDtc=
=y60W
-----END PGP SIGNATURE-----

--kdv6g2jf5upiutjd--
