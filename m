Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794873280;
	b=ysXuNim2wuHUjPMbLoaizcxwKp0EkFIgFOWKvrG4sJUCtjlRCD1BFhKYeIhmg9slwuQ1
	 CHWfFX5pmzRR6b4UY7/i8siED48cwXaEa8oegysjcFpNFIAtU3xSQGVZYv9yAd2XmbjyE
	 Gl94BqWTwbTk8EXP5yWYbta3t1gWJLw27rYXYiMdhSwTGB2QzN9F1HAcX/tUFO4AfNePt
	 KZwvfcwARv7QCBt6HFIUCpzXfIn+qkRQ1BixDEjJ90AT8ulOMJx05vm5UaP8aG0C9TxT9
	 JpKNVXfcevojmMOSldB5wb+XGMWHYiW6s0vNj6wIn6teekr62Y5AtoOhdyfi52yrGhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873280;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=b76LVHiSCISPES9U8FAuaAOaOaHjNVBG84bAuQX/cLQ=;
	b=YaooAl1rawgm2hZleEIzRbUnLHf5HSwAj1EcTH+EfXpIr7gq8r5RApHFJlNkclqtJ+uI
	 VswJrI/rHHHbubfYLzbIMnQiF05hQD/kynN3L5D3JfJgwOLWYoc0KZnM93M0urararxw8
	 Mkm4hmsrcPDp1ME/rtV3NGnNlPEZRsejAMxLu0cFjlrjUllCYSH/pUYTJ076v2uQOlSV0
	 fhBBVxYSBJxz8cgcqyU+VUWsHdKK2hNU5/gnbfZ6wwR6YDI2lGkn13e0Ye91CD7tbLVeU
	 7sdunDMo2r/I0d/rwXEsXK3uQGF8nx0owlDYikiTDezBVJqmTpOf8TCihvs3Yj8EGnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AEiBrzuw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2FD606A31C
	for <linux-man@vger.kernel.org>; Mon, 16 Nov 2026 23:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AEiBrzuw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92FA81F000C4;
	Mon, 16 Nov 2026 23:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794873280;
	bh=b76LVHiSCISPES9U8FAuaAOaOaHjNVBG84bAuQX/cLQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AEiBrzuweV6+aeDPpK3lOO1HMKMxceGjQ02FzyY5C7SOvPPcJXAPmJZcdjdIvbGrZ
	 4DA5NfysfOuPBE97qswsoL+FkGxxJPP4o4yhOCuphYayPRQp5OAyHUo2bPc1u/NlZX
	 iwq1hPyfOiKOmrvwht6jkDdydnZjtTOpfwVEdN6Tp66dF1exyR9yRkS8OaKiwdXNuo
	 AmCFtSzSiLF3QJ2Nh0Hz4MTmRdZyNVd28C32ZvgN+opX3jWVO/CmriBCcxPQzLG008
	 cHTWExmrQ+bLqAIniupXxTmMPblVvWoIf7POJmHAincNzywF+PWnEMYhs5Kj73ijH+
	 wjK5bP4i56T+A==
Date: Tue, 17 Nov 2026 00:54:37 +0100
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>, linux-man@vger.kernel.org
Subject: Re: [PATCH v2 0/6] {unix,socket,bind}.7: General Unix Domain Socket
 fixes
Message-ID: <avuXnvrwa00Ylil2@devuan>
References: <20261103202136.13574-1-gnoack3000@gmail.com>
 <au3Np8P5kn1EOFMc@devuan>
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
	protocol="application/pgp-signature"; boundary="fbnhks7wzecmvvvf"
Content-Disposition: inline
In-Reply-To: <au3Np8P5kn1EOFMc@devuan>


--fbnhks7wzecmvvvf
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>, linux-man@vger.kernel.org
Subject: Re: [PATCH v2 0/6] {unix,socket,bind}.7: General Unix Domain Socket
 fixes
Message-ID: <avuXnvrwa00Ylil2@devuan>
References: <20261103202136.13574-1-gnoack3000@gmail.com>
 <au3Np8P5kn1EOFMc@devuan>
MIME-Version: 1.0
In-Reply-To: <au3Np8P5kn1EOFMc@devuan>

Hi!

> Date: 2026-11-06 13:54:08+0100
> From: Alejandro Colomar <alx+linux-man@kernel.org>
>
[...]
> >=20
> >=20
> > G=C3=BCnther Noack (6):
> >   man/man7/socket.7: SO_PEEK_OFF: This option is no longer specific to
> >     unix(7)
> >   man/man7/unix.7: SO_PEERCRED: Also works for SOCK_SEQPACKET
> >   man/man7/unix.7: SIOCINQ: Document behavior for SOCK_SEQPACKET
> >   man/man7/unix.7: Explain Abstract UDS scoping to the network namespace
> >   man/man2/bind.2: ERRORS: EACCES: Write permission on the directory is
> >     required
> >   man/man7/unix.7: ERRORS: Document EACCES, EAGAIN, EMSGSIZE, ENOSPC,
> >     and EPERM
> >=20
>=20
> I've applied the patches reviewed by Kuniyuki.  Those are: 1, 2, and 5.

I've now applied patches 3 and 4, after the new reviews from K.


Have a lovely night!
Alex

>=20
>=20
> Have a lovely day!
> Alex
>=20
> --=20
> <https://www.alejandro-colomar.es>



--=20
<https://www.alejandro-colomar.es>

--fbnhks7wzecmvvvf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmr7l70ACgkQ64mZXMKQ
wqlVNA/+JYOmvsg+XSHV4LmK/eby8nG7xiEs1O4Usee2D22cDD46QhC5CtZ1t9cB
yNV+TNLsZPhfvG+6Es+Yc4XXQuiCv1czBIuc61d10BHHzPlKOzqatBej6vCxs9kr
ClNLKq7KbCwWxiwCfThRDW/FVwemp55BLRapba54dqnPidaT5qP+W2aWs4hRxURx
wAopnrULFuMB4T+u0gqGiTvQYHeJLCBMuxC2O6XhonUdASpRMVwENESmKGTpjo0M
AbrmchlVuRtUkrkRNAOIFSA4VWNM6PSwgvCFgZOuIPaumgYbSGxKy3LGS/IxZxUZ
c5zE00VryTTISnyItrOdxYRQUbUKwaIWO/DwCTBP9JOgmQggcWyR9beISGhTOiC7
4vsrFPISe3rOpPmJrJW/ht02Hkrn7oNcm8Zm2jhpDGiDqf8iOv5OX62TLKm26EIX
6m7vlTCjq8+i4d7imLPGZXzjwt8f9Nb8NVzhDjHe7Olh3DFwY6x3RyJeokrbcWlM
LAEJkCyNdvaVsCetuPasm9fF19Jj++BA28BYN5x8V3ng2oL3esbl49vpLdjDLyuN
EOolEgucSx7FU0VteWTEFtgi4pManwMNSFhXrnAYDbOuByT7PqmZpY7ukTR0Lh8I
3KTMzCvHWokOlF6fFsQyBl8Ganb0fuGUfKvQU3tDulzFwxjAQw4=
=HpIX
-----END PGP SIGNATURE-----

--fbnhks7wzecmvvvf--
