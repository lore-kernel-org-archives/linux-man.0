Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C243939A2
	for <linux-man@vger.kernel.org>; Fri, 28 Aug 2026 19:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787946263; cv=none; b=G2+cWQSddH6YoZj7KqPZpd449PJIQqvwvHNfYqzD/ZNNLLiict6wIDuqN2cmV/pgWt5HmR5e/vHj2iSZ/JFJjRfcbYDdVB36OmxqhWJDiTZ25A3CwOQzGrHXGInuzhF8O0zrcESlmw2jAMBH3ieRsXn+I9ztoXzbyFWVgEILM68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787946263; c=relaxed/simple;
	bh=6Lt41znmjN3ZA9dYT+skQQ3NInm+PFF9h3YSOlWMiRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XImKdCS1ZzH69vM31TWaEn5FOMEmLlV/orNTyYN5ZXk45cTh6OZapJX5WUDIu3xF9fgfyM8UkLEj6tKTp2g9Y/N8o1haUHFDJXQytrowKGXzvZaLHxleB4qN2aTlz9x4ieYMTPzHPYDJmfqcFsbNzQbs9lJteiLMZvuR5g//Xnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AHhpCbfE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AHhpCbfE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A3A51F000E9;
	Fri, 28 Aug 2026 19:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787946262;
	bh=Nd/HmXGBL/vECp18JtumEaUZcSacGNAaz5W21Nfi1fw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AHhpCbfEOvn1JjWviuodGZCu7uM5OLYXhTTqaH3MGvzsBaqjRWvofbwGhCEyCNSK3
	 VifpKASkIEatXz90pYqUwqFsJZQCcG3bR0eVgbw5IevJyi9+4et1v6XJGGQwzBuYSo
	 SJH0EdZU9RE5TskrxoSQ7OJ49nxlfHwmXSSe445CQRKy/yZ1AIebrXyHw8Ql7IsKti
	 qqEkPp5g8AjoMU1K3YzDe6dt/XcRgFW+WQnrf52z+zgozl52ZfQ8pj9ZnPKcUJQPJ/
	 8TUOXwqZv5KIbjoFFU4DzwetJH5r7H63sq0CorYr8ps1uAngC2CiMTgYAPuN/1Tm6l
	 kQmGzneP3aghg==
Date: Fri, 28 Aug 2026 21:44:18 +0200
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
	linux-man@vger.kernel.org
Subject: Re: [PATCH] man/man7/landlock.7: Document whiteout object
 peculiarities
Message-ID: <apHkx3LvRyqYIB2F@devuan>
References: <20260828160340.11238-2-gnoack3000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="og3kuah644dhcznt"
Content-Disposition: inline
In-Reply-To: <20260828160340.11238-2-gnoack3000@gmail.com>


--og3kuah644dhcznt
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
	linux-man@vger.kernel.org
Subject: Re: [PATCH] man/man7/landlock.7: Document whiteout object
 peculiarities
Message-ID: <apHkx3LvRyqYIB2F@devuan>
References: <20260828160340.11238-2-gnoack3000@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260828160340.11238-2-gnoack3000@gmail.com>

Hi G=C3=BCnther,

> Date: 2026-08-28 18:03:41+0200
> From: G=C3=BCnther Noack <gnoack3000@gmail.com>
>
> Bring documentation for LANDLOCK_ACCESS_FS_MAKE_REG in line with the
> Landlock whiteout patch [1].
>=20
> Link: [1] <https://lore.kernel.org/all/20260813093157.1436894-3-gnoack@go=
ogle.com/>
> Link: [2] <https://github.com/landlock-lsm/linux/issues/66>
> ---
>  man/man7/landlock.7 | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/man/man7/landlock.7 b/man/man7/landlock.7
> index 880dd50582f3..3642a64ff1f6 100644
> --- a/man/man7/landlock.7
> +++ b/man/man7/landlock.7
> @@ -204,6 +204,9 @@ Create (or rename) a directory.
>  .TP
>  .B LANDLOCK_ACCESS_FS_MAKE_REG
>  Create (or rename or link) a regular file.
> +.IP
> +This also guards the creation of whiteout objects
> +as used in OverlayFS.

Reviewed-by: Alejandro Colomar <alx@kernel.org>


I guess this should not be applied yet, right?  If it's ready, please
let me know.


Have a lovely night!
Alex

>  .TP
>  .B LANDLOCK_ACCESS_FS_MAKE_SOCK
>  Create (or rename or link) a UNIX domain socket.
> --=20
> 2.55.0
>=20

--=20
<https://www.alejandro-colomar.es>

--og3kuah644dhcznt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqR5RIACgkQ64mZXMKQ
wqlApg//fJbmSFpBWAK6jq2UK6q3wEkoO5OIHvFqK0+hcsRASAaGI139E6xDvYzl
kyZ3F7CRaDu7iNabslQJv7ta9jZAzOT48Jy9VuAgasC2tZY05AS3Fc1k/BevsJd3
OO7n+ECQRSwm+huamAsL+O1C1eNEgu+ANVDDd/en9oJbNJK8jBqb/VdoPiCXSd/I
Nr46p3/MgjTjJPjlsXmyz/2k+IKqolToT1sHQJ4HJC2vGXis4DxGY4D8dy2uMHug
iLhpdindGAdW15MYgEn0AuevxAtkKgPdcrGpGnH2MIeySSpqgTBOTWsZcYRhcPqz
8DVdOOWWZT8WmsGCrdKQ1xXcRb2cH1NoRZacyOeMhLuMJADAHuy92QCEGPJmjP1V
NMREJVMLZLNH19dqbKLESl2YwLe9qODMNT2opksDUIP2BLDiRtsw5rcSq6Yx5TS2
UnLGDNrArovPC+9mBG7VUGrij++SQZNwx/mhboPqzP/8O9HTHQjxycymlQHnCh7M
KPZef9Z5+8o27vMXl3RY85XJ4eOU9GPLlEpNpL8yiZiI1dwdgv8ZiRjc2f8aFSQY
WObHCaGO27rXeuU7IIxEBPtYqxc7sBSBLHFKmVRY8ZI+PGO46UO7oMUvY4VMOLl5
Lu1ypyg+b/hdUwBDWQepXkWlHY4Iu0mP8Zws/io8FAb3zeP1kfk=
=PQv/
-----END PGP SIGNATURE-----

--og3kuah644dhcznt--
