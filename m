Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793191734;
	b=1MOXsXOyAKaCvCby/u4a48FRTFdf08nodwh71IYzl6ZYtqVsCpnmjJFrIhPHMSSW/7um
	 TW+/x7O8cAwIbyzOrtcxJwFA+Z2B2OncVTNjP97JflY2DJfNokuRhgRleVJYbBDv8f6TI
	 VggevKzalQjptru4GbLMTXShgpRS05wIVgUVEAFylF0KAqZEf1kMZ95l9h2eqrlU4TSog
	 da6XQYJ4jJp1rmn0WU923De+M3rGWfTkzSUajO27nqWJ4Karc+8FGOphNdZHnF/sV0YMM
	 rhDvzO1FrV1g7WCBXqsNQq8wm4C6oUfJjH1mZyxU/Smqcxgf8lsWpcz7snY+sqyPzIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191734;
	h=Received:DKIM-Signature:Date:From:To:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=QRwRFAaXBHfSE6oHkNKPGSJ+BCe2TjNz3LUE8uqy4d0=;
	b=r02tg0LQPVXV3z2Icbn/rgktD+xiiuP772BHsZg/4m2kQhQQywBPclWuSMe882kRLmte
	 PPyKPM3K83Ss4MhY5c89fSKqLgO2T4i6PfnEH+wyIsr0n1gGL81/ECIcpMnJU80t9s6II
	 994TvQ342h6jhg7PZHWvoRlNB/MNqW+1KIQZRhlAoCuDezUXMgF1de0eN3vQ4jW3RSbpO
	 UBUMp7/tKX8oQcPla2xGiwfopjxI17pj9KojXOcxB2ig0ElUXf4T9GeuAw1hZ7Tidhgxc
	 QlPsksu1ELZeV7EVd9+kSXeNEYdkAR04aefKKEm0dLj2TX3bpFJmEZn6xfIANq23Qog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=liu2BzHe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48809606A31C
	for <linux-man@vger.kernel.org>; Wed, 28 Oct 2026 12:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=liu2BzHe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ED6E1F01825
	for <linux-man@vger.kernel.org>; Wed, 28 Oct 2026 12:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793191734;
	bh=QRwRFAaXBHfSE6oHkNKPGSJ+BCe2TjNz3LUE8uqy4d0=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=liu2BzHeioV+QoxEsw3QcPD42jnTtCA6CvGUFB3ePaZiQEKGgUjzlgD6lRacUYwra
	 bkCr71s9+eV4ZOP+yyd7PwC4y7K9224lWjsIG3V1Pb1oE9pbRq5F4Lcfr8J1GerDvj
	 Z5sfPAPCzKlcEOSF/EFbhYywoX5GNRLbbkZoGmInUcZDBrfq72XJtHmRpZAWTY3uh8
	 WLuzXg9N1HYjAN2WIbSZtsvgoa2gxTK/OSnaOUdOyyAsGJgvsj1W5uLDrbhht2VrPH
	 C8f8jyX8QZH1Og1m7CcuDtBCZLqF9EQOeB6AqXWACi83n5Ux62WBzXTK6R/lSysBoT
	 YqlTP+SrOBuOw==
Date: Wed, 28 Oct 2026 13:48:51 +0100
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: linux-man@vger.kernel.org
Subject: Re: Serbia
Message-ID: <auHu-XoGs3jufdhY@devuan>
References: <auFA7dfNv4jk3R9e@devuan>
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
	protocol="application/pgp-signature"; boundary="qlcqyduexswdtu2j"
Content-Disposition: inline
In-Reply-To: <auFA7dfNv4jk3R9e@devuan>


--qlcqyduexswdtu2j
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: linux-man@vger.kernel.org
Subject: Re: Serbia
Message-ID: <auHu-XoGs3jufdhY@devuan>
References: <auFA7dfNv4jk3R9e@devuan>
MIME-Version: 1.0
In-Reply-To: <auFA7dfNv4jk3R9e@devuan>

BTW, I keep the hacked phone, turned off, just in case Google or anyone
else wants to have their hands on it to learn how they hacked it, in
case this helps improve the security of Android phones.


Cheers,
Alex

> Date: 2026-10-28 02:15:52+0100
> From: Alejandro Colomar <alx+linux-man@kernel.org>
>
> Hi all,
>=20
>=20
> I travelled through many countries in Europe earlier this month, after
> attending a few conferences in Paris and Prague, using an interrail
> ticket.
>=20
> One of the countries I visited is Serbia.  Because the interrail ticket
> covered Serbia, I thought it would be a regular European country, but
> it isn't.
>=20
> While inflating my bicycle in a gas station, a police car stopped me,
> and the only reason I can imagin for them to stop me is that I have a
> dark skin and hair.  I wasn't doing anything wrong.
>=20
> After they stopped me, they searched me and all of my stuff, for at
> least half an hour in the street.  Even the boss of the police station
> came to the place.  They claimed there was a problem with my passport
> and had to bring me to the police station.  They also looked at my
> phone; they asked me to show them the pictures, but I didn't have any
> recent ones.
>=20
> Once in the police station, they searched me again even deeper, and
> after some more time, some new people came to the police station.  These
> seemed spies (intelligence agents would be the technical term, but they
> lacked intelligence, so let's just call them spies), and took an SD card
> with my keyring (made me questions about it), took my laptop, and also
> took my phone, and ordered me to give them the PIN.  I gave it to them,
> since I don't keep any personal information on the phone, precisely
> because I expected this to eventually happen.  The few contacts I keep
> on my phone have one or two letter names, so they can't get much from
> that.  And the laptop and SD card were fully encrypted, so they couldn't
> do much with them.
>=20
> After around 3 hours with the laptop, SD card, and the phone, they
> returned it all to me, saying "oh, btw, the phone turned off" (lol!).
>=20
> Of course, they had hacked the phone.  The fact that they handled it off
> already hits that they've been playing with the bootloader.  But I did
> see evidence of hacked apps "calling home" to their servers after that.
> I won't tell exactly how I discovered it, since it might help them
> improve their hacking.  (I will tell details if you ask me in person, or
> through encrypted mail.)
>=20
> At first, I distrusted all of the hardware they took, so I didn't use
> the laptop for a few days.  However, after seeing how simple their
> attack on the phone was, and after looking at the laptop inside to see
> if there was any obvious chip that shouldn't be there, I came to the
> conclusion that they haven't done anything to it.  After booting, I also
> didn't notice anything wrong in the software.  They could have tampered
> with the bootloader or the kernel, or perhaps the hardware, but at least
> it wasn't obvious.  Since the quality of the attack on the phone was
> really childish, and they seem to do it often (so they should be good at
> it by now; they're even using Israeli technology), I very much doubt
> they could have done anything to the laptop without me noticing, so I
> started using it again.
>=20
> So, now the Serbian authorities have probably cloned my SSD drive, my
> PGP and SSH keyrings, and my .password-store/.  I doubt they have the
> ability to break the layers of encryption that protect them, so I won't
> revoke my keys for now.  Maybe in 10 years or so I should.  I assume
> these might end up in the hands of other countries with more interest in
> breaking them.
>=20
> After all this, they set me free, and in fact, one of the spies seemed
> to be interested in me going out to the street.  They probably wanted to
> follow where I was going, since they had my phone hijacked.
>=20
> Near the border with Hungary, another policeman in the street saw me,
> and quickly moved his hand to his gun, just in case, and it remained
> them until well after I crossed past him.  It seems Serbian policemen
> have a problem with people with dark skin, hair, and beard.
>=20
> After crossing the border with Hungary, I told this experience to the
> border patrol in Hungary, and they laughed between them and said this is
> usual in Serbia.  It seems the country is deeply corrupt.
>=20
> I'm leaving quite a few details out of this report, since I don't want
> some information to reach them, in case it's useful to them.  But I'll
> happily share the full story in person.  :-)
>=20
> I had been curious for a long time of how indetectable these attacks
> with Israeli technology on phones really are.  After this 1st person
> experience, I can say that if your phone is ever hacked, you'll most
> likely notice.  It was an interesting experience; it probably gave me
> more information about them, than to them about me, after all.
>=20
> I've updated my threat model and protections after this, to be even more
> strict on not having anything on the phone.  I've bought a new cheap
> phone, and this time I'm being even more strict on my policy of having
> no names, no pictures, and no PI at all in it.  Just CoMaps, weather,
> offline translation, and a few one-to-three letter contacts.
>=20
>=20
> Have a lovely night!
> Alex
>=20
> --=20
> <https://www.alejandro-colomar.es>



--=20
<https://www.alejandro-colomar.es>

--qlcqyduexswdtu2j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrh7zMACgkQ64mZXMKQ
wqn5Mw//Vp8GVcICPxDcJwnAphz1ePyM5vPg/CMpTOl+yKmeyqLEUH/W/4lAnZCO
T8cRVraChGdW2QiuydQ72Mgyq66QmD/eRGxjFFJw8zFXYNomLqj09ZVY3p3ZQx8T
4uw//qjAid/8GLuhtFwWv2c4BdwG3/SiQgVO9JqKDl7Ok17333W9RsS4Opoqiq8T
MvpmzfDAu7jD4Xmc1acDpKWA4wwbjUrxlPwKdlrGR4e2g95VwW4Og0FWRT/zUWL8
/a3aCi5MxCgCDB2hXLD4whCZrdPgdU32UBsPrjDst/W50q9rKBcvGBossCbQ7ZpW
3Psr7ia4x/TUyp+IpFUnhQ8AL/aH3fEMWtFkiyJKxbws5Eqw+054OjffWR1IF55t
25J1Jrchj5AFolHpNltr8yXtm6g7RgqGvJc87r9siitkaiUyjc/HA5WGjk/QJZar
KVVmC1NIwi7/vvRzZ+5kDQ3g5CXBwp8BatbMxWDHjTRZNxcviLUVHUbKtWN4jWLA
LZDDlb+jQGVBl4GvXZ5HQBI/TCQnHmK/DeIsfZLJg8XXQYgyl4Iu/jCXKn9QuCaD
26o/bI4D+bDCZkOYn0KApDAuIAYF96LB0fgt7Th5/bHus7WXo2qCVt5fqwM3x1zd
srMGgJI0HhZeBxA3o/p87kDGy54w+6XDSpA2GWwvJJglVLUy3Pg=
=qaSG
-----END PGP SIGNATURE-----

--qlcqyduexswdtu2j--
