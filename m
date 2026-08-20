Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6779D25228D
	for <linux-man@vger.kernel.org>; Thu, 20 Aug 2026 16:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787241746; cv=none; b=Aujk0sDrbOR3ENQ2BPrNRRMlp85IxktodUmvSSLDrLjz3LN8585HxPqQYBw9tQK45u1G2/dBo+hyI1KxMYseZXmlY4MO2l5+r0JdnuNcwvP0rPHHLR+d4JTxVVL7veXzlV7IcduPaT9XSMDRMZgkXHfiNtGSPrGyWtuzOzM6yEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787241746; c=relaxed/simple;
	bh=7UbFhhCi+Laj/iQ7K288G+wkpg8xM+aDewx8tJhE9UE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OVzdzAhwbew3Qb2N1Wvxi00Ju+988PL84SASrwpVwVszn/ifgUYMmB1gFLwwSonE/ss49QD1tkOGDRYYkch0wUtZiknOL1Vu5G5r4V7ALsKU+E/YaliOt0ykGqKttAS4YJb3Z2N779VahjyCSbjfzGu+ydziNkUBA2pWWYlYBAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h50yesmZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h50yesmZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8BC71F000E9;
	Thu, 20 Aug 2026 16:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787241745;
	bh=7UbFhhCi+Laj/iQ7K288G+wkpg8xM+aDewx8tJhE9UE=;
	h=Date:From:To:Cc:Subject;
	b=h50yesmZckJZOqO+CPgdrYN948hUiyVP9C1pHIUVLkEu+CPQy0evysMdlilT7Ok01
	 PW0Re1ozTwan/kl+pba8UrGDd+GYdloVSvAecYuRXfTvwfCKkDVmYFgEj7X4Kgdq6/
	 4O0xDGwbDG1QgGH1ohlbrW2z1xZHjSjJZZ9QdI9sfnD7hG8sbeJymO6b8KmpsyFVbK
	 dGJZzETu874SZBkBEcMNctsCHTAphu0KV3SO+bbZ3ahqCeNhLcjePUq7r1/nrbzlJI
	 y+gasZPXEtHvt0E8jYwpmbyKuxH2FP107B99E6cZfsQZ5BtMspqmkTIoUSHr+3glkk
	 Pz8Nemdujoujg==
Date: Thu, 20 Aug 2026 18:02:21 +0200
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org
Cc: vapier@gentoo.org
Subject: [vapier@gmail.com: man-pages-website: crush logo]
Message-ID: <aockPc7I9x7E2DXk@debian>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="snzn6blwavipuxmv"
Content-Disposition: inline


--snzn6blwavipuxmv
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org
Cc: vapier@gentoo.org
Subject: [vapier@gmail.com: man-pages-website: crush logo]
Message-ID: <aockPc7I9x7E2DXk@debian>
MIME-Version: 1.0

Hi!

I'd like to note that I've received a phishing attempt (or so I suspect;
if it's a real message, please confirm, Mike) from someone claiming to
be a usual contributor.

The message contained a compressed file, which for obvious reasons
I won't open (I can forward it if anyone wants to see it).

This is a reminder to be aware that people are doing these things, and
that I'd very much prefer to see PGP-signed email, especially from
frequent contributors.


Have a lovely day!
Alex

----- Forwarded message from Mike Frysinger <vapier@gmail.com> -----

Date: Thu, 20 Aug 2026 22:36:17 +0700
=46rom: Mike Frysinger <vapier@gmail.com>
To: alx@kernel.org
Subject: man-pages-website: crush logo
Message-ID: <CAL+h-jCujsyaHq+7V3D-M0PVqbHakp=3D+Z-Ag4nT_7xsESotocg@mail.gma=
il.com>





----- End forwarded message -----

--=20
<https://www.alejandro-colomar.es>

--snzn6blwavipuxmv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqHJQcACgkQ64mZXMKQ
wqk/MhAAvp25pgFS2GQ9TnicPKTZwYPxJbYdtEVBQ+EN64P+OCJ+f9/2VFvcjfjA
i5QKiX1m8MCSzp/SBJiWF9dx+MwfABysOUDBhzhW0f/NQMJ3o2XR7ZFXHSpLn10w
BgAzYjFQEcCdMtwzOlKjbTGJH5IzG/tC7qnZCMm7U9uS5SJ41QYXx8F6P04QoqhA
ubbUigF8oL3WRM6I+VEcCuSLS1ejhue/qbIak8Sgnexq3AB61JjLaH7V0R8NAui4
/mtz1KTqDGlJz90fOaQOmC6AxKdu92gO5JUv/p54SbtM3VJO4ROwgHhTPaWpW0uv
4CroGK78Gb0+BfXiiSQYmE17khlA7P4sQxgtF+DKwMHwtzXMS9H/6yGN9rcbEnfd
cSr+3JLurraMKHeUfNKBLRS0zf3ziztxXRILU9ie8V415fOGJB7ASmptIi+I8FL1
1B3mrlqEbDS5ZQ979sm2++lgKD+o++lNfUrq8KStG9/rVyd/1jIwBZiz+6+CzDpj
B+8a+3aIAF75RtURFqrTn+6iqXPvklqI/aVIMAga5DwwOzs4MdP9hlRzfBS5bMoO
fnPryVqh6V8qa+vE4O8IEr6WM+zMuTmuWGJR5PaaC/YncdsDG3HeYbxIRJ9IMf7n
HRlCZhhmXSGDhwDnO9G7bKoEBYNng51vRyYZWzSM/pMGfW7icd0=
=4tll
-----END PGP SIGNATURE-----

--snzn6blwavipuxmv--
