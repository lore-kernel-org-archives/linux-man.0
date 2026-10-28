Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793150152;
	b=hSPZGsjstJebQOUMoTRdTq/ns8vX3y2jWzYzjkLsfa/GbVq3MdEUOm+WIKS4Zg+zMdsS
	 ULEqvILqOLCnv0iKVL4RL5cJgNH05xHRSnZ08lFUJdHeai2pm9KSvzTkD8v1GUdqvCaOy
	 BUU5Zyz0scpwhu+AWwL3rMKp+zFPKoY4qlvr6/oNhQZNoYFM/uymXMuLpv123VOHGk9sA
	 ppNAVpsKRlhCB/bRFmsX+EJI0ntpz8nRH6cfB6K/mPNdFF1A7rGfdE2hg3KuPqdbcyvPo
	 eKvcNCjThc25Z15nXu/BBdPBFhbFOTxNoz8nn4dFBA9DUMIkfhatFnVDYk2IUZmapeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793150152;
	h=Received:DKIM-Signature:Date:From:To:Subject:Message-ID:MIME-Version:
	 Content-Type:Content-Disposition;
	bh=X/JaV/lfxJAEfsB6oKBfrE/E3a+t9sj98kA5N6J58g8=;
	b=2oKchYSvS5rfK0D4gLwscYr4VAje4tXhg8ZFbyr9qw4YB5Mo64pKYdMTGjTYAoKBH2eA
	 RV5NuT4xRQ2I0k3ysMUxS9MFdr1N13CFloQYU01/30zxO4AwZo2akNsi995T8NonbRH8j
	 Y7jzwUt36E49pPI2IUHTveclnVVSrqBGJhXxQ36qBEyf04tK9iiO0Ok6CAkSHMXKOgGvk
	 QuD3VsO8doDXGTFJBLCr9Uz1v0LtJRNX5g8yd+dYyF8YVU4RroaCvB/lae9pkyhtqSW0x
	 QAPsoSgBXgOFOzSDbQJ3j0hB25CjXs8flBmR84fQGIpanZHwOKjZGmeB6HusXn+STKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FZkWuPDT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA1D606A31A
	for <linux-man@vger.kernel.org>; Wed, 28 Oct 2026 01:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FZkWuPDT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57B8B1F01825
	for <linux-man@vger.kernel.org>; Wed, 28 Oct 2026 01:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793150151;
	bh=X/JaV/lfxJAEfsB6oKBfrE/E3a+t9sj98kA5N6J58g8=;
	h=Date:From:To:Subject;
	b=FZkWuPDT9s1y9bmfAfLZIY+f5pjoI4jZ6Q/RuVly4kjR34K3sZ0AJptekABnWRprK
	 BItGcS2Znu2x+SZ+P3jzs7lkl8a8nvCC/+9IdFxI5GA96InH/tJOWt7+uBQH4IJdES
	 jKazPl2L/s37cjYJHuO2dfN40xWcWbQucDgnTmatENL/tqeKo3e/32ON616+mDmJN9
	 iEzeCz1JwA44NqZO1tROy/2p+B0o3PCo3wM2yWCQZqgsy4tPLRTAJlaY4v02xahL/j
	 TqOF7K9fmXSiit9T7bnq1zCo4fCtMT87sLoJBK75K60SEr/lvjd5eR+7INzSlmuIFO
	 7x4ZUujj7mADA==
Date: Wed, 28 Oct 2026 02:15:49 +0100
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: linux-man@vger.kernel.org
Subject: Serbia
Message-ID: <auFA7dfNv4jk3R9e@devuan>
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
	protocol="application/pgp-signature"; boundary="zk64fhrwq5l5yidw"
Content-Disposition: inline


--zk64fhrwq5l5yidw
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: linux-man@vger.kernel.org
Subject: Serbia
Message-ID: <auFA7dfNv4jk3R9e@devuan>
MIME-Version: 1.0

Hi all,


I travelled through many countries in Europe earlier this month, after
attending a few conferences in Paris and Prague, using an interrail
ticket.

One of the countries I visited is Serbia.  Because the interrail ticket
covered Serbia, I thought it would be a regular European country, but
it isn't.

While inflating my bicycle in a gas station, a police car stopped me,
and the only reason I can imagin for them to stop me is that I have a
dark skin and hair.  I wasn't doing anything wrong.

After they stopped me, they searched me and all of my stuff, for at
least half an hour in the street.  Even the boss of the police station
came to the place.  They claimed there was a problem with my passport
and had to bring me to the police station.  They also looked at my
phone; they asked me to show them the pictures, but I didn't have any
recent ones.

Once in the police station, they searched me again even deeper, and
after some more time, some new people came to the police station.  These
seemed spies (intelligence agents would be the technical term, but they
lacked intelligence, so let's just call them spies), and took an SD card
with my keyring (made me questions about it), took my laptop, and also
took my phone, and ordered me to give them the PIN.  I gave it to them,
since I don't keep any personal information on the phone, precisely
because I expected this to eventually happen.  The few contacts I keep
on my phone have one or two letter names, so they can't get much from
that.  And the laptop and SD card were fully encrypted, so they couldn't
do much with them.

After around 3 hours with the laptop, SD card, and the phone, they
returned it all to me, saying "oh, btw, the phone turned off" (lol!).

Of course, they had hacked the phone.  The fact that they handled it off
already hits that they've been playing with the bootloader.  But I did
see evidence of hacked apps "calling home" to their servers after that.
I won't tell exactly how I discovered it, since it might help them
improve their hacking.  (I will tell details if you ask me in person, or
through encrypted mail.)

At first, I distrusted all of the hardware they took, so I didn't use
the laptop for a few days.  However, after seeing how simple their
attack on the phone was, and after looking at the laptop inside to see
if there was any obvious chip that shouldn't be there, I came to the
conclusion that they haven't done anything to it.  After booting, I also
didn't notice anything wrong in the software.  They could have tampered
with the bootloader or the kernel, or perhaps the hardware, but at least
it wasn't obvious.  Since the quality of the attack on the phone was
really childish, and they seem to do it often (so they should be good at
it by now; they're even using Israeli technology), I very much doubt
they could have done anything to the laptop without me noticing, so I
started using it again.

So, now the Serbian authorities have probably cloned my SSD drive, my
PGP and SSH keyrings, and my .password-store/.  I doubt they have the
ability to break the layers of encryption that protect them, so I won't
revoke my keys for now.  Maybe in 10 years or so I should.  I assume
these might end up in the hands of other countries with more interest in
breaking them.

After all this, they set me free, and in fact, one of the spies seemed
to be interested in me going out to the street.  They probably wanted to
follow where I was going, since they had my phone hijacked.

Near the border with Hungary, another policeman in the street saw me,
and quickly moved his hand to his gun, just in case, and it remained
them until well after I crossed past him.  It seems Serbian policemen
have a problem with people with dark skin, hair, and beard.

After crossing the border with Hungary, I told this experience to the
border patrol in Hungary, and they laughed between them and said this is
usual in Serbia.  It seems the country is deeply corrupt.

I'm leaving quite a few details out of this report, since I don't want
some information to reach them, in case it's useful to them.  But I'll
happily share the full story in person.  :-)

I had been curious for a long time of how indetectable these attacks
with Israeli technology on phones really are.  After this 1st person
experience, I can say that if your phone is ever hacked, you'll most
likely notice.  It was an interesting experience; it probably gave me
more information about them, than to them about me, after all.

I've updated my threat model and protections after this, to be even more
strict on not having anything on the phone.  I've bought a new cheap
phone, and this time I'm being even more strict on my policy of having
no names, no pictures, and no PI at all in it.  Just CoMaps, weather,
offline translation, and a few one-to-three letter contacts.


Have a lovely night!
Alex

--=20
<https://www.alejandro-colomar.es>

--zk64fhrwq5l5yidw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrhTL4ACgkQ64mZXMKQ
wqk39BAAiKeIMC4OrzqnaNeDGfmDpFJ10EYB/l4WRGUDGb/Spk02x3ralBvsO0mh
W6xjD12dnmpp4rHSEna5kr0XedlMr5WVK0b4Ubmi48FzshnUDQXxdhGslLFUAhwb
iMMHgubij4gaGFxR+ETbVS8FJPyKSESMtbgsfNKRhr3zxC7SM7qw3ZZembaHf7JF
cGXaCzWfJU417BQv0p0roQyl7uSmNL+GOD7w7lEO1LzBSEA8dzsCFv+Gm7nBHpHv
DtRYIWMQ383r6XVdKB7NVFViNZRBVjFie9FXQm/sYTxTPXc8QNbaCEsjveMDH44M
1FABVphdS0BrrnSxVFH2/T0Y78DwY9vtUiah743sY4J7hsMlwQq58+261kzihymw
aDMmywmgvU60ZBgvcTowrPlg47+pwPQj5MP49r+h12jGv/qNRhd6/3EyvQpqKw2H
GEWYTn7i8SPSvJiIOqz1WGG0W9TEIuot4y+y7waLjD1lmoG5H3htjAWG+dNy9VgZ
weyA8ceBGDoyCGPwl+6myUElSmqJsgWCNO1VxvZMJM3BW9ImGjecZJZJTkGzDzfc
Ll+suffMLtY0M2kX8bxg/69XR32Pio8jU0dZPWquN9XAWKzhF2cP/13pt1Tyg4qz
IIvSc2+PxEtbAmgXfeQF+gg/fP6LcRMukH2RuVhkRobtJnz+Jbc=
=ihdC
-----END PGP SIGNATURE-----

--zk64fhrwq5l5yidw--
