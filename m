Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594F33AE1AD
	for <linux-man@vger.kernel.org>; Mon, 17 Aug 2026 21:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787001742; cv=none; b=q3c785mRjl/roEzK0EZLYTsXZIOpEh+n9FTaAHkeietkeszwv1OH6Hhu0GBDz6MGBUgOoqWVwCk2yoq1MhvjhDRZWR6kIaRIxQ8HiIy0Rhc0iaqW/n/VGcoxwEXfyTRoGWlMO29oHwsSX0XTW5+yEY3m0KAwRGJgN7vnIwO0Yv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787001742; c=relaxed/simple;
	bh=AORLw41wgsrMMaKuh6G1IkE82aDLSdLhjtxulfiSTvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TgQJi3ZYIxvw5HX21+v6vgb5Wbml7xsbjjzNHeTyosvlyIzkYN5iW9t2Q+PddrV5eKzOgzZDyZslq+LijW8ujXZaoFLKWId88c1ZKQMFM48+bGIaxQp2FFktMmZ3f0H5gMGMZW6crDjzSd6dxjJ0XY/J1KCpL7YQHIG3D5GuObs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DII5OX8H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DII5OX8H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B04EF1F000E9;
	Mon, 17 Aug 2026 21:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787001741;
	bh=m4LnJ8bzMroUNS6d4wZQixI47voCWbX4+WPNEls0guw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DII5OX8HNa5GqrpgMhyHbe/6W44f6O4OmeBZbf8KPG7AHOuFRKbOhEyEMp2W2svcO
	 /epiBp2GsXExzEmwuUIvgfwb4/Q/hPTm8WGmewh6/EOuatt9cXSg8RWVO7JaSmqJle
	 xeAovrXdNQAj+lmBVjyEzy+EnBvCgh5c+KPwAH2eWud6Sj+/m2tpQ5sNs/yKHHsGod
	 CEEktyDXpm6yeQA2KVzfJEnHReDJSzHxP42OK1dJlBFzwmNc/C3qV/9EDyHRqCf1w/
	 9hSzFVQBXNHMb5Q+jxLyVfrTCmKOZzlVy5Yr/8XH4VqAkOuidBVDDiSelkUYOc0muh
	 PNYvts+z2QPxQ==
Date: Mon, 17 Aug 2026 23:22:16 +0200
From: Alejandro Colomar <alx@kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, 
	Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>, Guillem Jover <guillem@debian.org>, linux-man@vger.kernel.org, 
	libc-alpha@sourceware.org
Subject: Re: On <asm/termbits.h> and <asm/termios.h> usage in man pages
Message-ID: <aoN7GsYixm0fBKdX@debian>
References: <aoGk8FSBlwYAmvu8@thunder.hadrons.org>
 <20260816121505.jyz3ynrb3rxlvq6h@pali>
 <61b8b3f7-9c33-4704-a0ba-29e77a5e3cba@linaro.org>
 <20260816131955.lbuwrp32eyq4rt4b@pali>
 <83BA7F0B-7318-4F8B-B59B-1F508750E276@zytor.com>
 <aoLOL-1JRTElewuP@debian>
 <919B6782-3170-4A69-8431-1576526CA33A@zytor.com>
 <aoLY9Oko02NzSsuV@debian>
 <A09427A1-AD92-41CE-B0E7-C7D97C401AF0@zytor.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jzrc6chxlngn3zrz"
Content-Disposition: inline
In-Reply-To: <A09427A1-AD92-41CE-B0E7-C7D97C401AF0@zytor.com>


--jzrc6chxlngn3zrz
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, 
	Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>, Guillem Jover <guillem@debian.org>, linux-man@vger.kernel.org, 
	libc-alpha@sourceware.org
Subject: Re: On <asm/termbits.h> and <asm/termios.h> usage in man pages
Message-ID: <aoN7GsYixm0fBKdX@debian>
References: <aoGk8FSBlwYAmvu8@thunder.hadrons.org>
 <20260816121505.jyz3ynrb3rxlvq6h@pali>
 <61b8b3f7-9c33-4704-a0ba-29e77a5e3cba@linaro.org>
 <20260816131955.lbuwrp32eyq4rt4b@pali>
 <83BA7F0B-7318-4F8B-B59B-1F508750E276@zytor.com>
 <aoLOL-1JRTElewuP@debian>
 <919B6782-3170-4A69-8431-1576526CA33A@zytor.com>
 <aoLY9Oko02NzSsuV@debian>
 <A09427A1-AD92-41CE-B0E7-C7D97C401AF0@zytor.com>
MIME-Version: 1.0
In-Reply-To: <A09427A1-AD92-41CE-B0E7-C7D97C401AF0@zytor.com>

Hi H. Peter,

> Date: 2026-08-17 14:12:44-0700
> From: "H. Peter Anvin" <hpa@zytor.com>
>
> On August 17, 2026 2:53:09 AM PDT, Alejandro Colomar <alx@kernel.org> wro=
te:
> >Hi H. Peter,
> >
> >> Date: 2026-08-17 02:23:39-0700
> >> From: "H. Peter Anvin" <hpa@zytor.com>
> >>
> >[...]
> >> >So, any suggested changes to the manual pages?
> >> >
> >> >
> >> >Have a lovely day!
> >> >Alex
> >> >
> >>=20
> >> Didn't we talk about this about two months ago?
> >
> >Yes, I pushed an extensive set of changes to the manual pages, splitting
> >termios(3) into many small pages.
> >
> >I'm now waiting for your patches to the smaller pages.  I've replied to
> >that old thread too.
> >
> >
> >Cheers,
> >Alex
> >
> >>=20
> >
>=20
> Ah, ok.
>=20
> Things have been a bit insane here because of an unexpected event...
>=20
> <https://m.facebook.com/story.php?story_fbid=3Dpfbid02XCTWizxhQ8EfouxWt1T=
DnUPjM6HEZFwe2hVxreFa7gkVi1hhNWm4uvEaVDVhzrm6l&id=3D740261238&mibextid=3DNi=
f5oz>

Oh, I hope you find a good place to work that you like!  :)
Things are indeed insane these days.


Have a lovely night!
Alex

--=20
<https://www.alejandro-colomar.es>

--jzrc6chxlngn3zrz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqDe4gACgkQ64mZXMKQ
wqmqdxAAi8q5O1V/lAFKzA8hIZEoPPynFKz0f5Lh/pBiXVHf0ltTgXjEGslqCJiY
66EJD+d5QscaXSl9IhVvzqsOkrRqpXusgXk9pw4Xw2LB78eoOtULo8gk4yOK7riG
gclgqJHXIBmua62I18H8Sc7qMT6JVV+PUBHfWiQKp96xM68Obz9Kwlt+KnESbWGh
acYRaniwRVirPzLEs+BgLtzrER11fMTwTrHnLSFAWyP/GWcCh/oz88lcxqYa4Zy/
byPvqRrjESdMV2dtajY/S3X5tpJyzL2FrcSwnG1I9Z8X08/u547S+VCzF54m1Ap7
FtfayMjGovml7oPyGDsGAZAmXjIyv6sz4fQnafALOlTgJ+GXJJnttGWSViQ0HKMn
TlZ8ZsbnGYMizkiuIyFZEQk3oLpQcXKYvLUZSqhjgCNBMgl/LLS+DSlCnkdWxSQy
pxD8X0uWhFjLzlehgTk2k/FpGFJDJgjpPTBBZzmUBZ6tzTu5viddcMc1l37CREHb
YQVDCyQYWXbM2Z/i/t0GZW25CD0WqYg+T7kdrgvvDi0j3CUR3TmMWuBeoI6Dxb3E
lrDWypdZlY0prr1VhlUzr6HbOtkyWWc+KoaVMHF5e10SqJ2u2NO2kZ6NegPbt/uf
dsEwDz3HOeJOHKEkqiQWT1+RaPvFXdXdTrhc4TDsPlfJUrAuMXc=
=5qwM
-----END PGP SIGNATURE-----

--jzrc6chxlngn3zrz--
