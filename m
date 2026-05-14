Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A4A3BF69D
	for <linux-man@vger.kernel.org>; Thu, 14 May 2026 11:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778758164; cv=none; b=cUIrxiIE+dVfVQ1SzgcLLTsBuYfiF6K+0QUyudm68xq7sIjE1S4s7Ax7dKpZVPErko6+uEN5GlC5AXjoShjZDMMc5LUOmIIQ1uMTN0PZNbA8ef3WKYpe69/563NM3dgOM+ukZjzySxU404YYb/g2zvGTrj4ZLveei3ZKlx6PgGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778758164; c=relaxed/simple;
	bh=JXyvWvEdSr9RTp+sc8Pq4yNkqBX+AUPV8lB0Or6ZsnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nhTIe/gTUJHtEn0GA2iqFr3x07hLuYh0/JY1qAmqFZG0GTC3/hZBAygJriWfwDvG5yo2xEG8Iv0pTsV6rAAYP3h5zJ9r3pccBLvrdjRvPdL/0L2LlIzeo/n3ghoiToVPFsHzvOvSGPCF+B1YHu5ZK2kuqHN2iTElsmW3BGjp9/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PP1o4WM7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PP1o4WM7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18B42C2BCB3;
	Thu, 14 May 2026 11:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778758163;
	bh=JXyvWvEdSr9RTp+sc8Pq4yNkqBX+AUPV8lB0Or6ZsnE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PP1o4WM7gdTxbNUfCyWhRxJwKt4aDdAk3bxkFPnCCqWCfHlvomCqB+VEjhJkcKYQv
	 3SALXrt87WFO1Ge9EilSVz3nfhkukJi6v/ajVb1YVx/hjdYI8u0yfjjPHsSA6kl3iB
	 90Ja9mgJPcZKDkVEx12cCuwBC+rHiGjh6kBikp05Cgf9i8jnKrSUxGkiBOMLGpGf06
	 s4htW/Sz6Rkc+ZeWxwuq9SfgExfOrsAety6fFuRGefTPgQNPP5H2XmPJNlLey0lLY1
	 b9evJRR0/yktGAP4Xd1hQFWZ5JKp3Mj8v7TNuCi9PKp4h91Z/GNSiv8YA2GUy7deUf
	 OBYwsDnRc+eRg==
Date: Thu, 14 May 2026 13:29:20 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Bruno Haible <bruno@clisp.org>
Cc: linux-man@vger.kernel.org, Martin Uecker <uecker@tugraz.at>
Subject: Re: clumsy cast in dlopen.3
Message-ID: <agWw2-7U82vIKSWI@devuan>
References: <21436742.Yz81rIOvuz@nimes>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tn5vpzbgdcnnitpy"
Content-Disposition: inline
In-Reply-To: <21436742.Yz81rIOvuz@nimes>


--tn5vpzbgdcnnitpy
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Bruno Haible <bruno@clisp.org>
Cc: linux-man@vger.kernel.org, Martin Uecker <uecker@tugraz.at>
Subject: Re: clumsy cast in dlopen.3
Message-ID: <agWw2-7U82vIKSWI@devuan>
References: <21436742.Yz81rIOvuz@nimes>
MIME-Version: 1.0
In-Reply-To: <21436742.Yz81rIOvuz@nimes>

Hi Bruno,

On 2026-05-14T12:56:55+0200, Bruno Haible wrote:
> The dlopen.3 man page contains this text:
>=20
>                   *(void **) &cosine =3D dlsym(handle, "cos");
>=20
>               This (clumsy) cast conforms with the ISO C standard and will
>               avoid any compiler warnings.
>=20
> However, such a cast violates the strict aliasing rules of ISO C, no?

I think I agree.  Dereferencing the pointer &cosine with a type
different than the type of the object is not allowed.  I've CCed Martin,
who might be able to confirm.

>=20
> The proper workaround is to use a union:
>=20
>   union { double (*cosine) (double); void *pointer; } u;
>=20
>   u.pointer =3D dlsym(handle, "cos");
>   ...
>   printf("%f\n", u.cosine(2.0));

This is seems much better, indeed.


Have a lovely day!
Alex

>=20
> Bruno
>=20
>=20
>=20
>=20

--=20
<https://www.alejandro-colomar.es>

--tn5vpzbgdcnnitpy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmoFsgkACgkQ64mZXMKQ
wqkI4g//dgh59KPQypAztvMDhS+MIRPOnr8g+NkXn3Zcr136+cjb1gJXFUCjHBkH
3W6G/vv3sbUK4MoqJNyG2jsRMQYKHUvlmDQarjSJAB3gTrS0j8a3MW6O2Qv4XcjG
MyIkZbKMppQWuAcXy8q7sUHxO24qqqVD2RuEkSM+JltCMuGQLRxxGRqUVCOHOSdM
3nJTW6plLGioSFzRD+kB4mGoqfPNZfxYcUbjYncZV3ksXUZ1GSZ9Js0Yl+PcTpmy
gU2T+yjD0CQUdoDsA+W04aTFCm98Ui2TXOfbdI2HTKc9tQq1ka0jHXkhm7vHKTJK
cWC6JDkJLNV7jEEO2aD51P6m8jmZ1tx0D7zL6AP2MV6yzZa1DmBYZDaImEZN/DXS
oQTQfx4KPQYXdsBC8zUXpVeud2A2uOhQXu8yZCGZ7aEYqBe9W5XMG/Weak00+IYg
QHv1MibkcgpalOQcWOi9WLrkuJ9V5L/mM5bIF3t/PH1NtqzCeuNDv4iaW+zz6TC9
dW1RvPY02b1ai5jFlaV69xwq0tKWD/SLMdNfy28VYLwheLENShDa47eDDXoqry/R
2SoOw3fO4MVs0FjA9uXheD/te/pUuTjb11gd1M+6SiDsSvL6ABb0OYW+DIEadxI5
0nyWbkEAd3Nx20FF0A+OHrftHMgaE018F1EAU46wDZVuswNnGwc=
=dV4j
-----END PGP SIGNATURE-----

--tn5vpzbgdcnnitpy--
