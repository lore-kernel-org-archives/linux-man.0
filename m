Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD50B34889F
	for <linux-man@vger.kernel.org>; Sat, 18 Jul 2026 15:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784387595; cv=none; b=W/7AXQ2EjyTx5BHzBxL9pu6q9eU55ePm87nZ6DC+Nz/m6DszWaqC7UAWT0ZjA2p/Fq73nuG4zj78LAQclPh4Rel2iXxZ9Z+dFCq1zZhPBUEe/GlVspomLrPvDVs7BHv2qZ9si6P1FrnuoLYNxrfMpcf9wm914sFiUXXMyDNuA2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784387595; c=relaxed/simple;
	bh=VUVDG4ekx1GRnGPjTUmqz6tmDuDzH3066oEWfyqEl5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JbqJPWfWesZOAqENF76RvfwpO1NxJ1lEefcKwEPPFJ6ZRW98HZEZoYBXw4PvVGnw6rjMaex+VZzMJs1JYVV14IP5iY20+csj0IbrOKdGKNT2YzmZLAasQZ5Df8w0Q617my3MS+BSVoVFwTjicDi5+4HV1VKKNRbI7xhkGF/YnNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nrdUv5mE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nrdUv5mE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9E321F000E9;
	Sat, 18 Jul 2026 15:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784387594;
	bh=LdZCEZoS8OP1LAFovX/Deq9DWC1O6zJg9EtsjJjoTmc=;
	h=Date:From:To:Cc:Subject;
	b=nrdUv5mEXQfGwfuCtrNhfQ7R3gN2QaVc2mEY0ON9TlnEtKDpggZsSsKEq7exDlfjR
	 ypmd8ArHCSZfi1HdiEFuUOpMYoTx/sA8UZEf40+obwn7cu/QtWmhbNgTkvdKI64RSy
	 wox5I6MBAqFFimUtCRHJFXwUzjcxHQK2zUeL4J+5UzDEEaxgaiI6Q0ZIrHXAlu9RDy
	 sAOO5TTccegCtn8mt2pNu86HpVMAfl4Yodp+f9h8MFZ3fj64Vq1Dg4GacyBM1XioUC
	 UtUjw2SXEQtEDyrHewxOB95nqBHlTzA9ii+1jbcKZ99yzQjeCq1zgleRN1euWiwa0w
	 6XkRseWEPSxCw==
Date: Sat, 18 Jul 2026 17:13:11 +0200
From: Alejandro Colomar <alx@kernel.org>
To: coreutils@gnu.org
Cc: linux-man@vger.kernel.org
Subject: Hand-written manual pages for GNU coreutils
Message-ID: <aluIbrKBtAxweITC@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bhkr32uiibof5p3t"
Content-Disposition: inline


--bhkr32uiibof5p3t
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: coreutils@gnu.org
Cc: linux-man@vger.kernel.org
Subject: Hand-written manual pages for GNU coreutils
Message-ID: <aluIbrKBtAxweITC@devuan>
MIME-Version: 1.0

Hi!

I've started working on improving the quality of the manual pages for
coreutils, as I promised some time ago I'd do.  The work is --for the
moment-- in the 'coreutils' branch of the Linux man-pages repo.  Once
I finish, they won't be auto-generated from --help anymore.

<https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/log/?h=3Dcoreu=
tils>

We'll talk about incorporation to the coreutils.git repo later.


Have a lovely day!
Alex

--=20
<https://www.alejandro-colomar.es>

--bhkr32uiibof5p3t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpbmAEACgkQ64mZXMKQ
wqmjGg//SmXcTkz9fuX6n/kr0JXCl+c+ogi+hWmjZqxyrDfaOS+4Tej2/jL6lpeh
RGuEO6X6ixhJ7rDw8oO5RNaZVSOBOY3BW5xuNaf3S15p5hU15/Yhgn3/4tw/b7py
iWehGHkU51EABDm8NI0GhWnOYWzlgEdLJMq2ALl83iATF/WaMlqXiURpLTMxj6Zd
q7YVTWyUH991PMC9GvAhTU8Rb5KoRjokIxThkyV0FTR4dvLyt53e6PE8pmnzR0Ws
esYBqM0uWphAAyNE8ArDWVyHj8QVtoxOeSXVb1UWQ6qYyVvi5gRvSLaIjFv34sne
J7maYiunDbK5nIUdt9npiSHFYWr8XVVZosnwycy5DTFV09gzSxxFw5sWEKf8p16d
g1qUArBZKoyejo6BxnpLP35ZMtcSvQEHs2jBFFrLiwW+TFsZQDfdXzB+ckY1xMjJ
gV5+XOfsqoOBH41aZE6dJUnX40fNLhUxHCm5XiDurtyndv0TNskCwB+vyD+JWyE4
IsVXI5QVnT657ci1sBJgRhBNAWY6V+KI022CwH2PoTX3jI3pBrG/maxjPXrScYqY
aDhzvGZIMXD6l5LXlwNY8LjakLvCiFEZtNmVxud42//Q+UpL3Gqnfevv9eSpzwQB
WTNt66wy8ZPFMRBsseLcBCPvSowC01REJEDGb6ea8NGLzAB8k0c=
=ETij
-----END PGP SIGNATURE-----

--bhkr32uiibof5p3t--
