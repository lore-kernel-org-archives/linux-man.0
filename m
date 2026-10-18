Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEDD45D92B
	for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 11:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792321224; cv=none; b=NLs9sOCE6XYDfhfz9h7fa7wR8leOaApWn3r0YTk1Xzr0WA+V4QQLJ/PZtf47nJ6xrJK5/BZdYz0Th3xzUswyh/NtmEvc1IMt3H9/V7bp3tqBMSAeDG/te2gtwo6zNNidP4nh2TUsEajcVMViqOu2/k3E/zqBkKPXpswLsDLF6k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792321224; c=relaxed/simple;
	bh=grQ5sBCao+H+5QFdvLx8SMdjPgccOll8ujs3MOA/69M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oVVWgNq6ri/V4LySQ/4mYyln3CJIK3h78UAUcxrjY2BkitysY1R1v1wlY8nzmJ3CRtGu9juwn7iFws9gO4xVl2xl/wflMPQqS+hPM3R6mkeo/Brq8ORbVKg8/V4aviQ4rH/ZgEfqtXq1WzCX8ToeBGmn3aD//FrApymnSpKM/SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aF31I24N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aF31I24N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABD521F000C4;
	Sun, 18 Oct 2026 11:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792321222;
	bh=nOiQ3SWvkhTdMp400w+I8/p94OgP65k/bJCiFH18Vtk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aF31I24N4lZzxn/CPxhMoNpGoyvwQtvbvpq6jXe3mTulpPt9xINB0jC+fw3qaEA/Z
	 CrRx32Qp5TmaRCyUIA9TV9wWp81lvMBMP3hzOsen66xTBqReyyigqGzyVsM6FknLmd
	 CFC3rIBQdFfpiGls9KYmvOZ2RR7HZA/nbNbpq0jspOACaHpt6qLQt4rcSI3W++TRVg
	 4eGBn2xA/5Wpaln5K4iXJ8lZLSY+orFPqorLdI92PWF9Yn4OJG5gfXIpTdd/HEoZZF
	 Hyikalu+SE8dSwuAe2kwK/5aFYGuw2qburGEyXAjkA8TZOojaaXSdosSBHLH8qBQhp
	 vNYI2IRSyxU4Q==
Date: Sun, 18 Oct 2026 13:00:11 +0200
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH 03/24] man/man7/unix.7: SO_PASSCRED: ffix
Message-ID: <atSmo4XkjXWk9dRV@debian>
References: <20261016173139.13076-1-gnoack3000@gmail.com>
 <20261016173139.13076-4-gnoack3000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rhhzdlan4qwday5g"
Content-Disposition: inline
In-Reply-To: <20261016173139.13076-4-gnoack3000@gmail.com>


--rhhzdlan4qwday5g
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH 03/24] man/man7/unix.7: SO_PASSCRED: ffix
Message-ID: <atSmo4XkjXWk9dRV@debian>
References: <20261016173139.13076-1-gnoack3000@gmail.com>
 <20261016173139.13076-4-gnoack3000@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20261016173139.13076-4-gnoack3000@gmail.com>

> Date: 2026-10-16 19:31:18+0200
> From: G=C3=BCnther Noack <gnoack3000@gmail.com>
>
> Only SCM_CREDENTIALS should be set in bold, not the following word.
>=20
> Assisted-by: LLM
> Signed-off-by: G=C3=BCnther Noack <gnoack3000@gmail.com>
> ---

Fixes: 421d34c63217 (2018-12-23; "unix.7: Clarify that SO_PASSCRED behavior=
")
Reviewed-by: Alejandro Colomar <alx@kernel.org>


Cheers,
Alex

>=20
> Notes:
>     This looked unintended.
>=20
>  man/man7/unix.7 | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/man/man7/unix.7 b/man/man7/unix.7
> index 1a94b00c6783..1054d7f52a30 100644
> --- a/man/man7/unix.7
> +++ b/man/man7/unix.7
> @@ -276,7 +276,8 @@ as the level.
>  .B SO_PASSCRED
>  Enabling this socket option causes receipt of the credentials of
>  the sending process in an
> -.B SCM_CREDENTIALS ancillary
> +.B SCM_CREDENTIALS
> +ancillary
>  message in each subsequently received message.
>  The returned credentials are those specified by the sender using
>  .BR SCM_CREDENTIALS ,
> --=20
> 2.56.0
>=20
>=20

--=20
<https://www.alejandro-colomar.es>

--rhhzdlan4qwday5g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrUprsACgkQ64mZXMKQ
wqkAqhAAqKP65p7fFHlOoyeuB93MDYWiTJTEPKhOFh6u9X/lFAirqIrolw6BDVQW
GA988kM/rhfhpZ9BP0kZiygV+v4GK530P+vNe784f48k9i6FfAhB4Jb3lUBteYOr
w30B+KZ+iIGLHZfuHd4SBajMD8QBdtCq1XPDpMPC+H026oao9uar0MWXFtKOKcuk
Ka4kuLmHk962m513/nytpV3doYn0P9pNmufYoFK/U2fnopkTBg5xs9vXgVs628jE
Cmo475GXWILYy4E+tPTrHKmVshdVbbvfHT4e0VbLEWQdk8Qx0ORs36VuWiu9NQWW
RhvORITqOuaSpCdZjSXeQd2ITEl79GI3QGaZxOdKgUrYCnIWR9+lOPvnoKSVab9Q
x0KepShJLVdLX7Sfzvi7SgEdsyIniN1QVitWZAwV97XxoJs9MUsqSabW6MtQZkv2
P8sVJhVjs7sYWrFgcBpN24uXlx5kZE4+SklX75wjaomoFoqHuU12GACVw5cN3T3r
0/o6Us5NBH3nPqbJAyWbx6jGmxCjsXjiKpxPlr+c9AhT7DNlMiw/Hwbpl5+3nLh3
KwfDz6VGe9Ej8DiDc46AOlQzuuG5ig/xiKscUe9Ux66gSZMRnBYcARYT727QXAUg
imR6+3bQMhkiz0VwAct6fEMJz2A269DmgrpxzuETKZgTOsG+QSU=
=FTHm
-----END PGP SIGNATURE-----

--rhhzdlan4qwday5g--
