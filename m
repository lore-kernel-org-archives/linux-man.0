Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794054024;
	b=OifuUy5ivdPjNL2xfECx+Cg/hcHL8kPDlsicuDYqZtaEHrOZd1etbrRdLb0kLnB3ejT3
	 SF8/UkNmg9Nr0fQRXB9ipZaP4zYbC9ax69Y+Pc9VwfoBCPexbqVNA0dWqrngxdkFwNdGZ
	 f2GTkGEIsT1Zklh/aejiUIWLxpwMkURDGNOIcSwu35rNFY8ZdhmbpPMBKXb5CF/uokIKU
	 A74h0kO8TOX25m0Zxhz/NCIdxZ9rTyJt1RI+BCKIIPTVeLjtcR4L0XKm//GFSNn1BAVrD
	 zAqH2w8dHsOcNixo6NrQc5hc9x/YgVQ3bb0hLi3FbFhHuI4D9GyRUHrcMdmmPe3daiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794054024;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=6GPexMMN9A0Nh9V5zcALDwZhI/Mn7NknnJYcpoF03bQ=;
	b=ieE1o8qx5yGCFQl0P01HTuS9JBaH92KmrE0hQHKw29f6fqYv83ssfEDzJTcnNaK+AzUp
	 TAy4vcnVskNu0CDE4NppdabVkuuSIkQkqswg2cbdVC36NJF8tLXCbk/LNYdBJgqczbwYf
	 eio39XBKZfLIw9k1Bca3IqMtTXxgRJhNif4QwpkRnkb5OwXD4iv335CgrrSP6vrevIf9p
	 FVmeN9IjP1Yy8g4C5q4/GSXmrlmVj1p9B0bxu3/JI9vQS8ECXUPKSK0BJgIASEOV0f9h8
	 qv25fLnqmSiIs+YbeuRbho+RxhdCyicXpaMPAx3KqgmcQwbzzv/6ISpDxf6CTKO19kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TndEMi4b;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF228606A326
	for <linux-man@vger.kernel.org>; Sat,  7 Nov 2026 12:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TndEMi4b
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAAE61F0089F;
	Sat,  7 Nov 2026 12:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794054023;
	bh=6GPexMMN9A0Nh9V5zcALDwZhI/Mn7NknnJYcpoF03bQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TndEMi4be3QAx8x0c255hooGMt+4HU33t/Q4D+Z88sc15xK7lnvlPytpsrltTe0ON
	 V02AVHIZm68TjRMpZ6PTAPv2ETXcY2M84J1Py7RISDeI3g/sGdl9v3SbSgDF36OFhT
	 svYQ2pcoMbZrv2prwr+8HLdlg83lLTrLvkAwdf6rB3Q9sJXVjl+JUhKZE5PUbGwb2b
	 dGLxBtuc9AYn67UBhZjXz+X/IfQn6n0IgTrdAbV8PlZHnvxF9Ptfriqy5WhO46P8s4
	 2lrqSWb0vf5Oq0gt2KvI6z0a4Jx0h6n/k5pAbch0oK9XbPvC0w0cuVWOqHnFSgKF5r
	 NnoAWpWmpVoNg==
Date: Sat, 7 Nov 2026 13:20:18 +0100
From: Alejandro Colomar <alx@kernel.org>
To: Yannick Le Pennec <yannick.lepennec@live.fr>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v1 0/3] man/man2const: Document fcntls F_DUPFD_QUERY,
 F_CREATED_QUERY
Message-ID: <au8XYpm0YiqKNUmG@debian>
References: <AS2PR02MB973752AF8D9D44AE6CB2DB629B9F2@AS2PR02MB9737.eurprd02.prod.outlook.com>
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
	protocol="application/pgp-signature"; boundary="bs4e4fu77hntgga6"
Content-Disposition: inline
In-Reply-To: <AS2PR02MB973752AF8D9D44AE6CB2DB629B9F2@AS2PR02MB9737.eurprd02.prod.outlook.com>


--bs4e4fu77hntgga6
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Yannick Le Pennec <yannick.lepennec@live.fr>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v1 0/3] man/man2const: Document fcntls F_DUPFD_QUERY,
 F_CREATED_QUERY
Message-ID: <au8XYpm0YiqKNUmG@debian>
References: <AS2PR02MB973752AF8D9D44AE6CB2DB629B9F2@AS2PR02MB9737.eurprd02.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <AS2PR02MB973752AF8D9D44AE6CB2DB629B9F2@AS2PR02MB9737.eurprd02.prod.outlook.com>

Hi Yannick,

> Date: 2026-10-12 23:08:13+0200
> From: Yannick Le Pennec <yannick.lepennec@live.fr>
>
> Linux 6.10 and 6.12 added two new fcntl(2) operations, respectively:
>=20
>   F_DUPFD_QUERY
>     since linux 6.10  c62b758bae6a ("fcntl: add F_DUPFD_QUERY fcntl()")
>     since glibc 2.41  28f8cee64a32 ("Add F_DUPFD_QUERY from Linux 6.10 to
>                                     bits/fcntl-linux.h")
>     Checks whether two fds point to the same open file description.
>=20
>   F_CREATED_QUERY
>     since linux 6.12  820a185896b7 ("fcntl: add F_CREATED_QUERY")
>     since glibc 2.41  322e9d4e4430 ("Add F_CREATED_QUERY from Linux 6.12 =
to
>                                     bits/fcntl-linux.h")
>     Checks whether a file was created by a call to open(2) with O_CREAT.
>=20
> This patch series documents both operations individually, with usage exam=
ples,
> then adds a new category in fcntl.2 that references them.
> I hesitated somewhat on whether F_DUPFD_QUERY should belong in the
> 'Duplicating a file descriptor' section of fcntl.2, or whether it should =
go with
> F_CREATED_QUERY in a separate 'Open file description queries' section, th=
is
> series proposes the latter.
>=20
> Link: <https://lore.kernel.org/dri-devel/CAHk-=3DwixO-fmQYgbGic-BQVUd9RQh=
wGsF4bGk8ufWDKnRS1v_A@mail.gmail.com/>
> Link: <https://lore.kernel.org/all/20240724-work-fcntl-v1-1-e8153a2f1991@=
kernel.org/>
> Link: <https://sourceware.org/git/gitweb.cgi?p=3Dglibc.git;h=3D28f8cee64a=
3223636d15c78f69432503d8ef1c22>
> Link: <https://sourceware.org/git/gitweb.cgi?p=3Dglibc.git;h=3D322e9d4e44=
3084336ea41a8e7bf72456ab273b73>
>=20
> Yannick Le Pennec (3):
>   man/man2const/F_DUPFD_QUERY.2const: Add page
>   man/man2const/F_CREATED_QUERY.2const: Add page
>   man/man2/fcntl.2: Add section

Thanks!  I've applied the 3 patches, with some amendments.


Have a lovely day!
Alex

>=20
>  man/man2/fcntl.2                     |   5 ++
>  man/man2const/F_CREATED_QUERY.2const | 107 +++++++++++++++++++++++++++
>  man/man2const/F_DUPFD_QUERY.2const   | 105 ++++++++++++++++++++++++++
>  3 files changed, 217 insertions(+)
>  create mode 100644 man/man2const/F_CREATED_QUERY.2const
>  create mode 100644 man/man2const/F_DUPFD_QUERY.2const
>=20
> Range-diff against v0:
> -:  ---------- > 1:  8fc8c6255e man/man2const/F_DUPFD_QUERY.2const: Add p=
age
> -:  ---------- > 2:  a29379d2a6 man/man2const/F_CREATED_QUERY.2const: Add=
 page
> -:  ---------- > 3:  fcc62e822a man/man2/fcntl.2: Add section
> --=20
> 2.55.0
>=20

--=20
<https://www.alejandro-colomar.es>

--bs4e4fu77hntgga6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrvF3sACgkQ64mZXMKQ
wqlzHRAAkzD40AF+5sFsjxGoR4EVTkD4gc5uG4l1E27zekDXoFWKjHHkqDjEJbvi
CFPSKdcmqtpUIK2xnmaAOm1p2tTVx5MKEcE3IwrfRZFWkKhtUlflU3oFlE288iSc
g7y0AESd3gzjS3d3g734qG8aeIO/FmRsPSjdBQEHBl2fi24spyEaE6C0Hq2PmrrF
C0vv1OMCrY/gGYr36/2K2sucH4Y+nET8VAHKgYzdlnTRu3ql6/z/3UtbyqvKQiAy
5Jra8HdiwJMelMCR00LwBrgMuNV7mVb2XSu0ehCGdNeOV397k41eUV9EApMi8FQe
D5CQ3owvrGoQijOsauqDqRq94W4OiUrbD15c+vqC5SYgAXvGVH1GEKKjfklwx7hM
KsXkPtTDDtUSaBj26skjSe8D+n5tZP7ul528lgYPIFJdU3QEFcGYxgq2LTwVZ1J0
0ny0UEIAwOtbrPFFUvfCQO+F5/ah4phPN7/DN7iMHCzo6gtKvC87++6gvmws7jBi
3k7YL6PeLn4WD1xONsfQgea+X7XVQZpCjfxQ3c7ZyQ+IF/zgXxWWbGGmmlJkWHau
ZjO8tHMRP/oPl25EHLP+3r8Q71OotpDiwSIqw3u/yu7QZxqyAvpKDRsPs3nxf4jV
8aCXtbls37U+SqEq862DQIgMOBcJRm26SpWOSSYbLCldsScOjIs=
=+tUV
-----END PGP SIGNATURE-----

--bs4e4fu77hntgga6--
