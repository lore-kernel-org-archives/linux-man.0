Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589D12931D4
	for <linux-man@vger.kernel.org>; Mon,  3 Aug 2026 01:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785719566; cv=none; b=qfgKG7IzW9O5uWggiMO91ohoL+jZsnIrlQfdK8kRdnzkghocGfcqTEDedPSn8fk1cwmu8bzri1rxQTEWzUWdaDEKBbXyhq57P8jo1mrAAzLCpish/2mRGnmHOqAsaQs3J1tdtgFsOJI5FnoFh+HIfo8ROEUXoIk99NGLt0m0rNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785719566; c=relaxed/simple;
	bh=Gu504Hf5kGjQPejBeHmlO5ZHMAgGjkNZ1QUjbh/aT8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B/uRaCjKObtMXD1C9ClklGbFk3Z6WE0Rf/T900x49KrTA1d+l2feIi66oQi0dhwMB/ZzytawG0KSSgZL8+4rjKyCgTr3xMyJf3q/pBMukcMZCAOsd6GDteFY0mKUUT37xmJYocY01Ak+1gxS5TEnx79oF5d1o3pYTbiQ49Y3NFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ywhoh9HY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ywhoh9HY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EBF01F000E9;
	Mon,  3 Aug 2026 01:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785719565;
	bh=V2BoAr3wOLwlNy+csue/iOBWnc9yPMxyCzwXfZBcTPc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ywhoh9HYow8KyR3ZPzFMnJVqF2YSmBpqJRsp2ZmXT5iMH9u5Xczozgpj2uXYVVoTH
	 1NDW1csmRKNCm/ei+iK6lCTdoYNMORq7RLdIZtJdmp3ujgAe7YC7R63T0EkXwVS/9k
	 KLhkBkNOfplusjaN6O20j+CA5+BHxBS6Ina9rD9jaY9EGXGTuOKDB+aHMhVMkAgWz1
	 cu6N40RrdwFrJvBCIIGOPnFbpHaduht6e3KJCK6dAA0ZnXL+KphgGWtnVFy4w+r62t
	 EuDb5Mt8yBYmkZV6CFUxqqRi+6KNWZ97rTAcwDtEzmySb1SkNDXj+GtCRr0QpPPZzl
	 +mf1ndF+zE2Bg==
Date: Mon, 3 Aug 2026 03:12:41 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Collin Funk <collin.funk1@gmail.com>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	Arsen =?utf-8?Q?Arsenovi=C4=87?= <arsen@aarsen.me>, "Maciej W. Rozycki" <macro@orcam.me.uk>, 
	Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org
Subject: Re: the Linux man-pages as an educational tool
Message-ID: <am_qAgMNH18oZgqY@devuan>
References: <87cxw1s58a.fsf@gmail.com>
 <am6X32HkGdm2xTd7@devuan>
 <alpine.DEB.2.21.2608022219530.55540@angie.orcam.me.uk>
 <am-2d02e1qq78Asv@devuan>
 <87ik5sunm7.fsf@aarsen.me>
 <20260802231058.o7gud4bd7co2nbhv@illithid>
 <875x1sp0h2.fsf@gmail.com>
 <am_TTjDLlAI68zkp@devuan>
 <am_VUE1SzxqRkTAo@devuan>
 <am_V3bvOiH9TaJQW@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dfbk7oo67a3nt5fu"
Content-Disposition: inline
In-Reply-To: <am_V3bvOiH9TaJQW@devuan>


--dfbk7oo67a3nt5fu
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Collin Funk <collin.funk1@gmail.com>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	Arsen =?utf-8?Q?Arsenovi=C4=87?= <arsen@aarsen.me>, "Maciej W. Rozycki" <macro@orcam.me.uk>, 
	Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org
Subject: Re: the Linux man-pages as an educational tool
Message-ID: <am_qAgMNH18oZgqY@devuan>
References: <87cxw1s58a.fsf@gmail.com>
 <am6X32HkGdm2xTd7@devuan>
 <alpine.DEB.2.21.2608022219530.55540@angie.orcam.me.uk>
 <am-2d02e1qq78Asv@devuan>
 <87ik5sunm7.fsf@aarsen.me>
 <20260802231058.o7gud4bd7co2nbhv@illithid>
 <875x1sp0h2.fsf@gmail.com>
 <am_TTjDLlAI68zkp@devuan>
 <am_VUE1SzxqRkTAo@devuan>
 <am_V3bvOiH9TaJQW@devuan>
MIME-Version: 1.0
In-Reply-To: <am_V3bvOiH9TaJQW@devuan>

> Date: 2026-08-03 01:43:01+0200
> From: Alejandro Colomar <alx@kernel.org>
>
> > Date: 2026-08-03 01:41:39+0200
> > From: Alejandro Colomar <alx@kernel.org>
> >
> > > Date: 2026-08-03 01:37:30+0200
> > > From: Alejandro Colomar <alx@kernel.org>
> > >
> > > Hi Collin,
> > >=20
> > > > Date: 2026-08-02 16:27:21-0700
> > > > From: Collin Funk <collin.funk1@gmail.com>
> > > >
> > > [...]
> > > >=20
> > > > I can't help but wonder of what happens in WG 14 rejects this
> > > > controversial, as obvious by this thread, change. Will the man-pages
> > > > changes be reverted?
> >=20
> > > > Or will we slowly watch them document personal
> > > > preferences instead of existing standards?
> >=20
> > BTW, as I showed in another subthread, strncpy(3) did contain
> > opinionated comments well before I was involved.  If you're really
> > going to accuse me of that, better make sure you get the history right.
>=20
> Oh, and while at it, please also read my review of glibc's own
> opinionated and bogus documentation about string truncation.

<https://www.biblegateway.com/passage/?search=3DMatthew%207:3-5&version=3DN=
IV>


--=20
<https://www.alejandro-colomar.es>

--dfbk7oo67a3nt5fu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpv6wMACgkQ64mZXMKQ
wqmjFA//SZa9IUYCauTTg3kLV6j2WjGXBFWvKZjWTiGg6120dmyZBBafN9bNyaDM
0i/SIwUIrIav8N/jl6l1NVgI0UMW33zZWek5B3tOZI9yezvKHNuxrEGhJb/HexHW
b1K1tZ08WhgwRARSLXNSXbO43A2EC3gbMFOWcr1XMAnEllMF8QQLkbFdLB6dXlTo
j475ow+DzjgWRqdtAAK83zoArqb20eFdQCyaAuJMXVQQBRT/Nle/5CWO/IG39HYA
vjyHH50Ap3dfnBcY5LljDRrYqWDHVPeOq5A0e2TPOdTJAYCa9QrRwDmPzmAur2Wp
/4L4R7hzU5NQL+t8RLsrivppokeJuxpIvaxEEf6ILN+8xsvkQkuLAhejV1jHh2Bv
kPjK6xVQ2KlV53JyX0+MDZlgIZhHvcr7aTmXy6slLvZ/nRvEXzWCgmfnnwUvHQl9
+YgDJ1gJ6ZaOaHfiMXRKndsOHgaAN1ub1H/3dLkEwMrmbLwcBuHaDLajRHIj2pE7
YNV1L7/hJipzHTy5N2qDRhts7jZQdNS/TbadlpD9T3+waSsyErA21TQbVj5rQFq4
FHGkqm/1M3yJnNw46aa7pjmGflshAHPUSqGUbo0SvDDppK2NOTqcFpS00kKmMy/T
9kp0D3XMMLRGAc/kIzkun+SW1NdWk6AyTV/m0OBEqtizCTufzdA=
=NjQR
-----END PGP SIGNATURE-----

--dfbk7oo67a3nt5fu--
