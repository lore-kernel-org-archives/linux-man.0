Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495694;
	b=jgHxWXc6Xz3ZQZgBPCbEYKTx03ScC5a5UndMtS8hwt+SJfcNzRkHve4R0rGu+xhRs8wC
	 ihory8aOsQ82RZk13APCPxdQz1St8g/rlVy88ykdCjoasX+Ud4hZ7/4LKJWaro+DWNHFJ
	 Tb+8SniUrUyQa6OB/7gR6N5kGfPK8odDL5yj9lH/X1LpLrCWQf84JsexJ7TB/4Y2mPtTK
	 hiVej8PXsaOrolBeGV8o90NM03IDjzZ6xgJRTfEIT+Ruqdr79dpo8/3b/ecaJDWzg13S7
	 iZ8GzSuLdT81OaG8Htlz3XX8R3NZS5vsnewzKoJmTWWItgQDBnnrzAIHHadLN5tS6JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495694;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=EeRrwA+AC0ktZRp7qT0PFFw7HV5WGc25k0IBY/RUdT0=;
	b=DH5jOaWy4RHCyGtYpeH+uOO0EYDYyg27dO/aokNopEAS58sJsUwu145N7QfJ9rk4AsPi
	 ofAwdCKVQZXH3iv+ON7Wd7QuDNLMn+BerNHfvT2CXIOSvy3lPBjfXMYApMcJStHDDCMtA
	 hGVOKP6jqoeADUYyUD445EKBQ+RG5WfHbGeil+kY5GgrO8TzA6f81k/F3gxtiOu0Y1c1b
	 L1MBF+UWeLenj8D6OlW0QIdSBWdQJe0A1Z4uv5dbApB678jgGiwpFFwlPf7yjTm/I/Xje
	 u3lLhSJpn7ZwgcapfIyuE+zVF+Vbpr/qPLQKogbW/WurXsl45aV3OBIZ+oIJfryEXiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k9iuwLqs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4906C606A31C
	for <linux-man@vger.kernel.org>; Thu, 12 Nov 2026 15:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k9iuwLqs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B94D81F00A05;
	Thu, 12 Nov 2026 15:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794495694;
	bh=EeRrwA+AC0ktZRp7qT0PFFw7HV5WGc25k0IBY/RUdT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=k9iuwLqsY9lKF6XSZnmZgK+gOWTUVo6XWM6cztiXHczk7F1pQPvFY7fH9nKK5kTbj
	 XKZYW4ETQ+PvJCqrgRR2nX5B5Vw2mQi0fPNZhixhNtBla1Gpn89fglJJPk9tIiPrb7
	 bdo5R4Bbasbi46/b7mHmbHXhLtEi9Q9ODOzRjcpsQL+2MlJE3oxplMN9FH/cJzx8xh
	 B45Dyx5JLwt1Jsh4dBE90Zp3z3Q6WVlwYRIMsmwVDwMXDXIfq8/D8y+DniaaMKvFCJ
	 TijRH+Y6thnL1P8VAl9ApcRgNhwKVpS852zdv45kJKiMnTrFh5n4JWPqA9PG6d19cr
	 r+rZ567u8lnTw==
Date: Thu, 12 Nov 2026 16:01:30 +0100
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Rich Felker <dalias@libc.org>
Cc: Walter Harms <wharms@bfs.de>, 
	"linux-man@vger.kernel.org" <linux-man@vger.kernel.org>, libc-alpha@sourceware.org, musl@lists.openwall.com, 
	~hallyn/shadow@lists.sr.ht
Subject: Re: [musl] Re: RFC: how to document musl-crypt failure ?
Message-ID: <avXUkpcnCLdIREEN@devuan>
References: <ad592d57700043c181886d95b2564e6b@bfs.de>
 <avGP3ZsVvX1mOirn@debian>
 <20261109131732.GM23438@brightrain.aerifal.cx>
 <avHqKtsxQQDkZX90@devuan>
 <avXOTLv8xJqyy5qh@devuan>
 <20261112144550.GJ5716@brightrain.aerifal.cx>
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
	protocol="application/pgp-signature"; boundary="y3ylh3vzfeiqvrq5"
Content-Disposition: inline
In-Reply-To: <20261112144550.GJ5716@brightrain.aerifal.cx>


--y3ylh3vzfeiqvrq5
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Rich Felker <dalias@libc.org>
Cc: Walter Harms <wharms@bfs.de>, 
	"linux-man@vger.kernel.org" <linux-man@vger.kernel.org>, libc-alpha@sourceware.org, musl@lists.openwall.com, 
	~hallyn/shadow@lists.sr.ht
Subject: Re: [musl] Re: RFC: how to document musl-crypt failure ?
Message-ID: <avXUkpcnCLdIREEN@devuan>
References: <ad592d57700043c181886d95b2564e6b@bfs.de>
 <avGP3ZsVvX1mOirn@debian>
 <20261109131732.GM23438@brightrain.aerifal.cx>
 <avHqKtsxQQDkZX90@devuan>
 <avXOTLv8xJqyy5qh@devuan>
 <20261112144550.GJ5716@brightrain.aerifal.cx>
MIME-Version: 1.0
In-Reply-To: <20261112144550.GJ5716@brightrain.aerifal.cx>

Hi Rich,

> Date: 2026-11-12 09:45:53-0500
> From: Rich Felker <dalias@libc.org>
>
[...]
> > 	--- HEAD:man/man3/crypt.3
> > 	+++ ./man/man3/crypt.3
> > 	@@ -152,6 +152,19 @@ NOTES
> > 	      than 1000, 999999999 if xxx is greater than 999999999, and
> > 	      is equal to xxx otherwise.
> > 	=20
> > 	+EXAMPLES
> > 	+     When comparing a password against an existing hash, that
> > 	+     hash (and no other) must be passed as salt.  If and only
> > 	+     if salt compares equal (see streq(3)) to the returned
> > 	+     string, the password matches the existing hash specified
> > 	+     by salt.
> > 	+
> > 	+         if (streq(H, crypt(P, H))) {
> > 	+              // good password
> > 	+         } else {
> > 	+              // bad password
> > 	+         }
> > 	+
> > 	 SEE ALSO
> > 	      login(1), passwd(1), encrypt(3), getpass(3), passwd(5)
>=20
> Missing null return check.

Ouch!  Thanks!

	--- HEAD:man/man3/crypt.3
	+++ ./man/man3/crypt.3
	@@ -152,6 +152,20 @@ NOTES
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
	+         const char  *h =3D crypt(P, H);
	+         if (h !=3D NULL && streq(h, H)) {
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

--y3ylh3vzfeiqvrq5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmr11MoACgkQ64mZXMKQ
wqkn0hAAmifrmywv7f0isRMBwTMzhQFt8idWBr3rQRkftruVYtgSsYypRGYDNu8X
dC5qQwt3qGKCgwAOr1XLs84BvkR8pj8LMwdAWyMp4/LdfF6LznSQkCq41TMMbMrs
w2vT9kH/yRfCk+5nr5+0kR2YuiIkO3EFudyhaYt6MDc8PJPkayASFMEYXCmkh7iH
5NpfLnG1yTuARA5EmW+msWIIDFKBl792WrzcMmSYmRr3SOCrT5duGjZuamq2fwYC
2DhNThARd9TfHnxgZ/iPL2i208n/d3FETyvpl31hr+MqD71LJfdGOTMYlwakI/dL
WG3eTrkhHxASNmbhDhmQVrAhGgWEVUnaQQxxMo4f4qPHHBX45B4pyfHIwj3OsI8s
kUkTBE2nkmbWGf54BxyHec2EQwnzyEAkI8PrG+BnS874W/43eZgWhV8c7IFd9URM
82J6BLMyNdioQmUtER31Co612mP5ZaxoEkY0QSy91Ykr7sz9etBQxHlAnOJ3xf5s
auVxLyNtVH8d5IF1ba7bDyz3hIKQUU3XLconvfZ8GVTRo+1XEA1o899lC27rZ02H
EPX9pDcUvxrW0RGKM+JSELX27Efyu+SjulKSgKdC7xgBX2NYaPDXwAQnVRj0Vstw
D2LW74z2AuGX5CSHV/imQUeMycW44cc9qdCRKAEJKCCG+7sNUV8=
=J7ci
-----END PGP SIGNATURE-----

--y3ylh3vzfeiqvrq5--
