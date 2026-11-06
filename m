Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793969648;
	b=ewObbbCBDAsZe9BeoUi/KmMwWyJ03ap5/PYelXsO53n8cpH7eYw1XrnW62NHCT3S+xvw
	 es8cBPsXeYYEkuaybQ951TFJG4YM1aK/l/12qk9H5f5C/NxVOIqAfFICf1rpRJedHWJUB
	 DYK2T/oMnMOqH/QtB0evnGy4uF+gopZC4msPQZeUBj5eWZ+3I1jvqXK4BXzYP8kGEvjgj
	 6dZMCcHcsYbJ/XdF/1gG0Kt9zab5K8TCqkyFiJTn08iigdY7B0AJSMJ0clj8sT6ZgDL+1
	 pKgF1nqw0O3gIoYBQFcH3ObM2WPciXgrehQ7exeSSOkD/LobOm9u4upw0ajwDbaz3VQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793969648;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=d8/YY2LcB875sumV63053IaPLgeOTCPMyO5MqkjCLgM=;
	b=ThktO8vRxudqCvqg4SUTc8+MfZslpoQoH173y8xGlSByqtqAEMbAa1gr0NNXasVyPSNP
	 GMpx5lyKDwh/WWzX1liJBnxl07R3/tIWtT39sZyZzsh1e92yyLlRZAz35atbwVsDuTENu
	 efBSHzOS+3WwTM726A1XTD25shvQWWa3JsQxd1q0nafcStV8ctmChR30VGqtrVVYz/gjV
	 G0fcvL9YkXbJRyoOVd8HxY5BYkprIRJ78pFVtEAF8wD6GoNWe5utqU2mzx3nl89Kp0Vsp
	 9Z4QvpV1AbW5aHafG9St6xVh7jgEixgNNMPp7iiJCC0AHztMpk+04PpZnqr+qL9YYNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZSilCOct;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580DE606A326
	for <linux-man@vger.kernel.org>; Fri,  6 Nov 2026 12:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZSilCOct
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 634181F0089F;
	Fri,  6 Nov 2026 12:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793969648;
	bh=d8/YY2LcB875sumV63053IaPLgeOTCPMyO5MqkjCLgM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZSilCOctL/j5/xP1nGY0N3dYmh3DQvr+N+/clOWN93cKY1aoWt61fZEkTDzeQQB+e
	 EqbbNbV4fr8gBSn+UQykB10hmQcI4MX+iTNJdwUveIgFcKDix0z2INUkUeixFkPQkv
	 or43Apn7Bnq4T7j+K3Pt4Vsm5ARXu+Jfvol3n+HfoxXwENX0veOfVPA8Cy7RV5z4C3
	 mHzvu4gMTicyixGFjpeFnk1gbi+twApLyANDJuwMu/ugBTo+IQMjy3IzKTy1wSUFbE
	 WCb9joLj+2d70uD5sJlBcyC/cp32t0JQgd/R1u1wyEVYwGQwhRCY1cOriECwdX43AR
	 t1rp7VX/zYXYQ==
Date: Fri, 6 Nov 2026 13:54:04 +0100
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>, linux-man@vger.kernel.org
Subject: Re: [PATCH v2 0/6] {unix,socket,bind}.7: General Unix Domain Socket
 fixes
Message-ID: <au3Np8P5kn1EOFMc@devuan>
References: <20261103202136.13574-1-gnoack3000@gmail.com>
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
	protocol="application/pgp-signature"; boundary="iqu3bzrfcirg5ho2"
Content-Disposition: inline
In-Reply-To: <20261103202136.13574-1-gnoack3000@gmail.com>


--iqu3bzrfcirg5ho2
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>, linux-man@vger.kernel.org
Subject: Re: [PATCH v2 0/6] {unix,socket,bind}.7: General Unix Domain Socket
 fixes
Message-ID: <au3Np8P5kn1EOFMc@devuan>
References: <20261103202136.13574-1-gnoack3000@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20261103202136.13574-1-gnoack3000@gmail.com>

Hi!

> Date: 2026-11-03 21:21:30+0100
> From: G=C3=BCnther Noack <gnoack3000@gmail.com>
>
[...]
>=20
>=20
> G=C3=BCnther Noack (6):
>   man/man7/socket.7: SO_PEEK_OFF: This option is no longer specific to
>     unix(7)
>   man/man7/unix.7: SO_PEERCRED: Also works for SOCK_SEQPACKET
>   man/man7/unix.7: SIOCINQ: Document behavior for SOCK_SEQPACKET
>   man/man7/unix.7: Explain Abstract UDS scoping to the network namespace
>   man/man2/bind.2: ERRORS: EACCES: Write permission on the directory is
>     required
>   man/man7/unix.7: ERRORS: Document EACCES, EAGAIN, EMSGSIZE, ENOSPC,
>     and EPERM
>=20

I've applied the patches reviewed by Kuniyuki.  Those are: 1, 2, and 5.


Have a lovely day!
Alex

--=20
<https://www.alejandro-colomar.es>

--iqu3bzrfcirg5ho2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrtzewACgkQ64mZXMKQ
wqlGbw/8D2CpBDKn4q06e/GG10mQE+jxnI6hUL3y/FS0NeiZkf4Jcpj3rPghE2St
iQPByjIHWuQowJhvIsLVS4r0TYYRILC9daJaF4mlIhNUwoe3O9yvEooMq6lzeSdb
hvaStyka2TYQwzfGVObp8vpnjmlcGe8KePY4jajgb38tk6abH/tsEdfidejm3n7w
4c3cTAveZFloROT7IMy8EKFDriipz2BE4nu4gIaYjpRvT6aj7F8K5lFxNboatZv8
XywgP67YIy1cN2Npxpi+pJPPe8oCUWmX2cZjlSqkQtDGqMo7sWcWTMK4VydVGrE0
K/L6zb4BnGLc/HIwRaoicDRidTkcadE8ucegKbL3JOMhyTGBhcX3ItYWjAigXv2c
1R8QoEQenbLSTvdy8ecpOsv3oc7g70vzXTVdvmDC1yyXzNrQnEjjq/klyfpUGKxZ
oagQDTMfyaqUw6RHtHdpl0uOWMsQBAOt6s/M611yuC0Zpe1FFLlAlLjTyl05xnYU
NOrpNWFNR9Io/QVj3vMvDEaJ/QN9JJQ5uyzE/cAu8p2k1vaWUGixQBN8H+VIoUeb
qpP3YbAkMr2rbzgFfjXjMZiDBoij+nbBHJo1gUOffT+YbKIHFQj0D0e+VX9EDRlQ
a/NMM40wLLjETlZp9K7tOVBY7Nukxj7p5hSxiVvZgudrEe2AmI8=
=Mr+Q
-----END PGP SIGNATURE-----

--iqu3bzrfcirg5ho2--
