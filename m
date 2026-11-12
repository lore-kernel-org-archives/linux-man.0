Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794494235;
	b=JhthLupK3jQwkel3XSxavh3QlmYhXGHKoJFSXm2e29ZHJVWzFzSOP1RYKyiHQEuDwQR8
	 H1LS7L4fzIADYrFey4OMCYcM9eYIHfgiRI8ihJLQuVUGZ/opO/veWGV/DSSxGJeYlHs/Y
	 +SLD++0GqYWsET/HnrIIMnLOddGt02FhgrXUb2PcRg9ymCCeS2nkwRClU78EUIHkaCyIC
	 C89pAyQeNO308DnDt2Es0Ky3Ev6lVUZAZv0XJ4hRk7cAlbbaBH8FrYLJtm9bFlVs4ksbS
	 /QvPaZv3W9avmU52/O57TWtDhjRBVoCj2ka2BEuh1ICOr6IDuvkErkxBfaWK3GC/sDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794494235;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=bNMVJHxsL7oI2ww4QGXTga8MU1smE1qv2PSpSOB/Aow=;
	b=s3/4fleQi+/5MEelWqOvBHKBrQ78jMBpep3xevRTzzX5NAn1H/oqnAtJgTM9tWrGwmyR
	 U0VR2+Eio4beDPt8KYYvseJcC9wPmwN8Kpj+nE5PtLE5oPN8u/NqaLJ281RViOCGh4HR4
	 EUrWIUKyHscFEfZq6yRuAv2S55VSwmkgs8DlxZ8sEO1lIDxplP/PgON6jsbHUDWmj0Ig4
	 4EZDJE7LXIDyy4YWLKcJdEDtGoxohbHfnGQhiLbxbL2/13TgNg14qLSC8M30w325srJqz
	 GmiRKzjTIuxvJHPe2YDs5C9S3anFmZVHYMvGxXXBghkKXKpo3RTSKUxXC1goA1w3jmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cu+yXRPK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A04606A31C
	for <linux-man@vger.kernel.org>; Thu, 12 Nov 2026 14:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cu+yXRPK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F38A81F00A06;
	Thu, 12 Nov 2026 14:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794494235;
	bh=bNMVJHxsL7oI2ww4QGXTga8MU1smE1qv2PSpSOB/Aow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cu+yXRPKTWuZF0x0dse9cU3hix33r9RVhKhhyXcvUQmLfU+iTlys7dkn+yg5Yhzpv
	 3mocSJ2tZbRxZdLdJxUgpuD652/UqpoNmUaLmw0B+YxB5gUFF7/mxAOhf8PwHBtDYx
	 eP68+4cIUmlTsS2QPJGC9pX67UuwG5FOc147JyhYE3zrJqZUDb83vvgih15E/4mbDv
	 0s0l8H/V32Lr/bi8rSpRpL7STiGvm+lgHR6rajTnousavm0OB6GCZIxW5iK5Ni07qa
	 E37H6f/CLiTNKlLgbfS/ZnN2E8l7PCBivh1iTE+0xnCgJa7u+C2U6+B0OorBiWeMtX
	 MjoG1Ox0bTh9w==
Date: Thu, 12 Nov 2026 15:37:11 +0100
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Rich Felker <dalias@libc.org>
Cc: Walter Harms <wharms@bfs.de>, 
	"linux-man@vger.kernel.org" <linux-man@vger.kernel.org>, libc-alpha@sourceware.org, musl@lists.openwall.com, 
	~hallyn/shadow@lists.sr.ht
Subject: Re: [musl] Re: RFC: how to document musl-crypt failure ?
Message-ID: <avXOTLv8xJqyy5qh@devuan>
References: <ad592d57700043c181886d95b2564e6b@bfs.de>
 <avGP3ZsVvX1mOirn@debian>
 <20261109131732.GM23438@brightrain.aerifal.cx>
 <avHqKtsxQQDkZX90@devuan>
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
	protocol="application/pgp-signature"; boundary="szd7t3ott7dlsav4"
Content-Disposition: inline
In-Reply-To: <avHqKtsxQQDkZX90@devuan>


--szd7t3ott7dlsav4
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Rich Felker <dalias@libc.org>
Cc: Walter Harms <wharms@bfs.de>, 
	"linux-man@vger.kernel.org" <linux-man@vger.kernel.org>, libc-alpha@sourceware.org, musl@lists.openwall.com, 
	~hallyn/shadow@lists.sr.ht
Subject: Re: [musl] Re: RFC: how to document musl-crypt failure ?
Message-ID: <avXOTLv8xJqyy5qh@devuan>
References: <ad592d57700043c181886d95b2564e6b@bfs.de>
 <avGP3ZsVvX1mOirn@debian>
 <20261109131732.GM23438@brightrain.aerifal.cx>
 <avHqKtsxQQDkZX90@devuan>
MIME-Version: 1.0
In-Reply-To: <avHqKtsxQQDkZX90@devuan>

Hi Rich,

> Date: 2026-11-09 16:51:02+0100
> From: Alejandro Colomar <alx+linux-man@kernel.org>
>
[...]
> > I would not document future behavior, and would document existing
> > behavior only as an implementation detail, not an application-facing
> > contract. The only contract with the application is that crypt(P,H)
> > will never return a string identical to H except on valid password (in
> > the absence of theoretical hash collisions) regardless of the validity
> > of P and H.
>=20
> Okay.  Thank you very much!  I'll work on a patch, and CC you when it's
> ready.

What do you think of this?

	diff --git i/man/man3/crypt.3 w/man/man3/crypt.3
	index e0a74b955b3e..4a75fac2f627 100644
	--- i/man/man3/crypt.3
	+++ w/man/man3/crypt.3
	@@ -259,6 +259,28 @@ .SS salt
	 is equal to
	 .I xxx
	 otherwise.
	+.SH EXAMPLES
	+When comparing a password against an existing hash,
	+that hash (and no other) must be passed as
	+.IR salt .
	+If and only if
	+.I salt
	+compares equal
	+(see
	+.BR streq (3))
	+to the returned string,
	+the password matches the existing hash specified by
	+.IR salt .
	+.P
	+.in +4n
	+.EX
	+if (streq(H, crypt(P, H))) {
	+       // good password
	+} else {
	+       // bad password
	+}
	+.EE
	+.in
	 .SH SEE ALSO
	 .BR login (1),
	 .BR passwd (1),

which reads as:

	--- HEAD:man/man3/crypt.3
	+++ ./man/man3/crypt.3
	@@ -152,6 +152,19 @@ NOTES
	      than 1000, 999999999 if xxx is greater than 999999999, and
	      is equal to xxx otherwise.
	=20
	+EXAMPLES
	+     When comparing a password against an existing hash, that
	+     hash (and no other) must be passed as salt.  If and only
	+     if salt compares equal (see streq(3)) to the returned
	+     string, the password matches the existing hash specified
	+     by salt.
	+
	+         if (streq(H, crypt(P, H))) {
	+              // good password
	+         } else {
	+              // bad password
	+         }
	+
	 SEE ALSO
	      login(1), passwd(1), encrypt(3), getpass(3), passwd(5)
	=20

Cheers,
Alex

--=20
<https://www.alejandro-colomar.es>

--szd7t3ott7dlsav4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmr1zwYACgkQ64mZXMKQ
wqkBPQ//dDFT1St8opjgraH6kJHTHxwZHbrBFlpagx9bD/zvnMvvkeiI8yCnxU9j
B7IwRrg/Vvar1S0Xj/qU5BPb0G1Iw82wcLrBdDuJduEHpOHdEZ41wMgz8vjOY96n
sIlhPwirl3sN3HHvQF5wa89wruR3n3InJPk7T0DXjIPEzMlSKq9I1Jg3JYE63KvS
TrD/Bc3HAtz21+I0vSnTv8NyYPXoG7Z3yhQFuq4FAWZ9KS0qjmjudNbUyHtAHfDl
S1hztHOH3aih03vuH0wymDEpb/bTvp827lqbuum9pZxEEYu/I+ESjeGo2bpBGz8p
ps+Ca0+2BI4YnxF1thuZX2Js+Km9A47J7K3gpFBnCSyNjNHVgvv3SzO/MsAks8pB
fTEXeEIaqeKA/4lbKt0sQ/6vdvKFbJnnQg3KuNErd/zIrDCujh1KhSjU7Y/bSQvh
8wBXxOgTIJ7/d8NmM+TRKIb3TijeeT3FLaVoennUL+7NbCSL+0e7YpwS1QsUt8Au
dMC7LIIt+bXXHga4O4OOjCQbxkXzz9y9F4vB1jCYB5GRrKrNK/mD/hdOyWzaHAi+
MY4YBlozaD1CuHN6sEngF8zNQ5y7nVRhFQrs9v2gpLClBcNx+q2pt4pMlQq0d9y/
cEpiVx80xZGTuftjdvu1kpxfsGzNcFgCzAZp/tk4rPWrlaVWOBI=
=b+ez
-----END PGP SIGNATURE-----

--szd7t3ott7dlsav4--
