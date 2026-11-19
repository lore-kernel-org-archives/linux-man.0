Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795131426;
	b=ytdm6GhgngGo7CuwlWqmOhyOgaobhQQM4vTMvtHC3kf+bFOAcumEFrCsFVNMhylPiofp
	 p/G9xtstuT4xCS59xtbLjT86rx7K0stYmLagqCDB+362kmsLp3Okk4nAyz0PvWJs0MfQ2
	 DIae21ZOrxjPFEhDw5dF1IiaYCIcwLPa8QeyRri+1a1EJSFPXn9b/zCwksA/bD+12NIE4
	 ubhlMLP9c2riVe7N8l31imdtcf6d631Ji8Xkosi4A52AT8K3/i2jDcG0bDi0pOMk0fJLD
	 xPQ73HwcW7FANF1fFUbfOgXEwA/gORE7KiCk31fyDKODQdXcKR8Epicd1XgAowdMoow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795131426;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Kr/6yQRjSlu4tKVFRCt4seSQ2jeg5CzOi03C+Tv930k=;
	b=E7jrJmj7XOH08/FQumy3eDrUsUmleMTUTRL+/gCtoVlvHva8DTKiZfnZmj4/B8CqgTyN
	 ttmNrfz9TLkOyL1YLA6AJTUVGcyZvXTDMCqPa1VqWZrMfQqySNRIKoEeIviHgpCqnvxVg
	 UAodRlVE6rGp09FAqaUll1knW+TZI1/MN7iCpTlPSu8WNWWz+4+uzSUEcs9S8ibueyTHf
	 Np4UqepoPzwSt0fPwE4njiwBpFXF68hVBKWnt5wPnFS7c8jzireuVIETGGRBbkP/4Q+UG
	 xzgjYtg/lquK02+Tmm3iCf8QBEFQE8yyWQTSJdinr7nxKekwG3RjRatcU5M+gMLU78Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JRmg73TG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84906606A320
	for <linux-man@vger.kernel.org>; Thu, 19 Nov 2026 23:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JRmg73TG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 421F91F000C6;
	Thu, 19 Nov 2026 23:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795131426;
	bh=Kr/6yQRjSlu4tKVFRCt4seSQ2jeg5CzOi03C+Tv930k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JRmg73TGYI5K0FGmBSg5B3Yk6DW/s38pMR/RtzWp7QrxL+erGnbls1ZqcyFT3kXfF
	 5UERp6tByWKGt41q0vFH9YABJDwxP0eobtgXz5u6Ryn1f7jVgS/zD9Kj7TIFT/GEDn
	 r2icuC7eyLJUCqTgGEqLwZvvpIw0pSJ0FH9u77Uzb6fB9CBiiw9yC5pggpOKCH/U8q
	 azsXFDCXMKZBiUvr94CVnVBzYw9twah420Te9sDbgCwyMyTqkylhZ1E/wXp/Tdz9DT
	 QeW4tfbHMsLziNwCPPRu4F4fc0LqFOWrl4koqZ5OtuBPB5yPD11c7KnIoeH+f1ZQO1
	 W6/pQajtf2ujg==
Date: Fri, 20 Nov 2026 00:37:03 +0100
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>, linux-man@vger.kernel.org
Subject: Re: [PATCH v2 0/8] unix.7: Socket Options and SCM_* fixes
Message-ID: <av-HtwHXlZBTpzZc@devuan>
References: <20261103202211.13820-1-gnoack3000@gmail.com>
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
	protocol="application/pgp-signature"; boundary="zudpfyxifzfaxzyx"
Content-Disposition: inline
In-Reply-To: <20261103202211.13820-1-gnoack3000@gmail.com>


--zudpfyxifzfaxzyx
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>, linux-man@vger.kernel.org
Subject: Re: [PATCH v2 0/8] unix.7: Socket Options and SCM_* fixes
Message-ID: <av-HtwHXlZBTpzZc@devuan>
References: <20261103202211.13820-1-gnoack3000@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20261103202211.13820-1-gnoack3000@gmail.com>

Hi G=C3=BCnther,

> Date: 2026-11-03 21:22:02+0100
> From: G=C3=BCnther Noack <gnoack3000@gmail.com>
>
> Hello!
>=20
> This is patch set (B) spun off from the "Documentation fixes in
> unix(7)" patch set [1], which is now split into these three parts:
>=20
>  (A) Miscellaneous fixes, mostly in unix.7, one in socket.7
>  (B) Socket options and Socket-level Control Messages (SCM_*) <-- this one
>  (C) sock_diag.7

Would you mind rebasing and sending a revised patch set?
There are some patches which I'd like to apply, but they don't apply
cleanly.

There's also some patches which I haven't applied yet (I commented on
them).


Have a lovely night!
Alex

>=20
> This patch set fixes unix(7) documentation related to socket options
> and SCM_* control messages.  The first 5 commits are fixes and factual
> corrections, the last two commits are documenting two relevant new
> features (PIDFD passing and SO_PASSRIGHTS).
>=20
> The patch set is based on the "miscellaneous" patch set (A) ("General
> Unix Domain Socket fixes"), since it is touching some error code
> documentation in the same corner as what is getting changed in (A).
>=20
> Thank you for your reviews of v1 and v2 of the still-joined patch set,
> as well as of v1 of the split patch set.
>=20
> Changes in v2 (split):
>=20
> * Mention commit hashes in commit messages, not in groff comments
> * Reword __scm_send() code snippet in commit message
> * s/the last one takes effect/the last one is sent/
> * Rewrite SCM_SECURITY section to be about byte buffers
>   and independent of the LSM
> * New commit:
>   * Remove mentions of "namespace" in the general sense
>=20
> Changes in v1 (split):
>=20
> * Some commit message rewording (especially quoted the kernel code
>   more directly).
> * I removed the commit that changed the wording about Out-of-Band
>   messaging, per Kuniyuki's suggestion in [2].
> * The ETOOMANYREFS commit is a SCM_RIGHTS-specific error; the Autobind
>   documentation change is included here because it refers to
>   SO_PASSPIDFD.
> * I am not 100% happy with how verbose the SCM_SECURITY change has
>   become, but I don't see a good way to shorten it without cutting
>   away from the substance.
>=20
> v1: https://lore.kernel.org/all/20261021212256.27961-1-gnoack3000@gmail.c=
om/
>=20
> More details are attached in the commit notes.
>=20
> This patch set has been produced with the help of a LLM, which was
> helpful for spotting a long list of inaccuracies, comparing the
> documentation with the kernel implementation.  (More details in [1])
>=20
> =E2=80=93G=C3=BCnther
>=20
> P.S.: Part (C) will come soon, but not today any more. :)
>       That part is more independent again and, being about "sock_diag",
>       it is outside of the main unix(7) documentation.
>=20
>=20
> G=C3=BCnther Noack (8):
>   man/man7/unix.7: ERRORS: ETOOMANYREFS: Fix the conditions
>   man/man7/unix.7: Multiple same-typed SCM_* messages may be sent in one
>     message
>   man/man7/unix.7: Autobind: Clarify when it happens, and mention
>     SO_PASSPIDFD
>   man/man7/unix.7: SCM_SECURITY: Generalize to other LSMs, not just
>     SELinux
>   man/man7/unix.7: SO_PASSSEC: wfix
>   man/man7/unix.7: Document SO_PASSPIDFD, SO_PEERPIDFD, and SCM_PIDFD
>   man/man7/unix.7: Document SO_PASSRIGHTS
>   man/man7/unix.7: Remove mentions of "namespace" in the general sense
>=20
>  man/man7/unix.7 | 215 +++++++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 195 insertions(+), 20 deletions(-)
>=20
> --=20
> 2.56.0
>=20
>=20

--=20
<https://www.alejandro-colomar.es>

--zudpfyxifzfaxzyx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmr/iBMACgkQ64mZXMKQ
wqm5kQ//ZQuwy4iuGxvi/G/Mo9AF6ZtYhs1BVDIJn3AARW5bU+b/djKClGbBG7bp
KTfe6eQasdGdijyOv475Hz2NzuxBT/PqsesR1+ar/vdfMA8eHv3YV3nK0UFcB0b6
L0wWpbYv25v/rgQQ00ynRkLMbW079f+ZpulcLgu8dAP0kLxseWzH4WmmDutjH+fG
kLUkW0DwdQ4fg1OjnZr3XYIlqxgOxrLHkaHutGC6JAZPekU2/xknRS9GRoHRKVqM
AGohTZmRdO9XU67noxvnQ1K0Yg9azrCiSwX8KS/eDmvPFiUQd3binsdQWFHixs57
ol5BY7AIyg5XVVIude6y+KLvwP9Xw1MWPz4CqNM2khe4qK3XH9C+rqzbvQCSpQJ6
2D5JP0z+uc3omXb5HCugyu1gXnASO++IpygtlQvxmPlxyJLkA08xu0CMAtF3+zjv
11at3MQbjfaY+3Ent+pWV6YAorlJPmupGVd4P58N35YiDjGo3HoVwRLW/aY/P1bZ
CC8vvGk6b2NqREk61swYyGIRna0yIm0lTaCKfySeLYebvVTSLKQ4U1RcgVB68REY
I6VnVM7aLO6loff0OE36fvEshzyrsilY1ptE96rNaQA1v/E9n+pAC/ZQWYqSE2k+
tpVa8Tvf98vwA2yLzzxzWiVN9g+Iu/vBmjXsO7NwWXMZTNSmhqk=
=GGXt
-----END PGP SIGNATURE-----

--zudpfyxifzfaxzyx--
