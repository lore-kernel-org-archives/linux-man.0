Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792840735;
	b=NlpVTVTkE6xfkjNnWM9m2KQDNbX66znCmJFSx69NwndXSvykqNMaTR/YkbZbC8B66ZHm
	 5sEvHyNDV+ByApdjNF6hhrYey4BcCDzxtEc1TWNUjmcSX9PbsWc2KPgBXF46aN7VESq6K
	 DOUb0qlOILFT9Hk0N33TUNhgQTwbaykrma07/V1z+Ij3eZt33vcb2+rSl1fHq2MH7aQPL
	 QgwgZz0D2dhtbwoHksGXNHksVjXsz2cSf7aXwHnIZR1tW56DGlIhX3B6psgJSB94WwZEW
	 eO9UNe4FRUdIaNiYeFlkizN3Gr9AY2lvgcCWZKm/aIGjnnLKvu53T2obW/orWaBK4kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792840735;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Ndo/fDByUGd6ZZveshAzVI52dgFynG++H2VKZO3mrtk=;
	b=fb0pN+2qXOF/h6kECSRxO3dsxqmQXVsTRIpjFTBXi2sV8BS6u5pgnsOo2kT3qdVBhmX4
	 PcmazK5nooDXtOtAMuUTIl8/JlmpovOZoOHyWDt5oNYBAcMkz8vdVzFz2YJYqQ2VqFHSI
	 VCM8OAd8Tks3zeY0PORSfdYhUWWNv6QotGllnkbuQL9r8rWtkHywy0cnc6aW5oxfqPTS5
	 DS/6dDKxljGg3TNRvFsA9/vi9sOyOB8i1O1ZEJhLJ8jPWxDVP5onjQN3eAujMzgrzybUG
	 1vm6jTbjiXCIllIGjc6aZCexipllWiVurcJ4xEc66n0IAwbFwB9a4N38mDLYyvjkhaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KcY7XI+R;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232D5606A320
	for <linux-man@vger.kernel.org>; Sat, 24 Oct 2026 11:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KcY7XI+R
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 463E51F01825;
	Sat, 24 Oct 2026 11:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792840734;
	bh=Ndo/fDByUGd6ZZveshAzVI52dgFynG++H2VKZO3mrtk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KcY7XI+RNVPO/l8pPRjkpOm4mAqefaVwllRm4f9YpcMCHEzNZs1NlTmvyqBy2nb3E
	 TgVJnY7AmUkPVqx2xUWxWrmTVX/JaYAArwSczayJOohSap6M3Tyo/pTWSvOwIbjnCA
	 21C34rnOZSkSY68L5jWFCx2OglpaY0m5YZAMoEZps8xZxpxoZJD4IhfYYQLPqqB28V
	 298TyB1TUOx9dRLKAeGX9tpotrzsgCM3JUIyc02XLkbGL6ee3xWe65kSa8wjj0fmAl
	 WxjP75FR+Qhh3hDaDtXeof3JxCyHDnDS2kdFkuSA41W/guIgyJ0U5ExCmWzWBR/eWc
	 /GwvYgTM9NZxA==
Date: Sat, 24 Oct 2026 13:18:50 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Yannick Le Pennec <yannick.lepennec@live.fr>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v1 3/3] man/man2/fcntl.2: Add section
Message-ID: <atyUAAHC8e_pOTAW@debian>
References: <AS2PR02MB973752AF8D9D44AE6CB2DB629B9F2@AS2PR02MB9737.eurprd02.prod.outlook.com>
 <AS2PR02MB97374BDC938ACE0D9CFA5A529B9F2@AS2PR02MB9737.eurprd02.prod.outlook.com>
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
	protocol="application/pgp-signature"; boundary="yg25nemcp5f5lanx"
Content-Disposition: inline
In-Reply-To: <AS2PR02MB97374BDC938ACE0D9CFA5A529B9F2@AS2PR02MB9737.eurprd02.prod.outlook.com>


--yg25nemcp5f5lanx
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Yannick Le Pennec <yannick.lepennec@live.fr>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v1 3/3] man/man2/fcntl.2: Add section
Message-ID: <atyUAAHC8e_pOTAW@debian>
References: <AS2PR02MB973752AF8D9D44AE6CB2DB629B9F2@AS2PR02MB9737.eurprd02.prod.outlook.com>
 <AS2PR02MB97374BDC938ACE0D9CFA5A529B9F2@AS2PR02MB9737.eurprd02.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <AS2PR02MB97374BDC938ACE0D9CFA5A529B9F2@AS2PR02MB9737.eurprd02.prod.outlook.com>

Hi Yannick,

> Date: 2026-10-12 23:08:16+0200
> From: Yannick Le Pennec <yannick.lepennec@live.fr>
>
> Add a new fcntl.2 section, 'Open file description queries', listing
> F_DUPFD_QUERY and F_CREATED_QUERY.
>=20
> Signed-off-by: Yannick Le Pennec <yannick.lepennec@live.fr>

Thanks!  I've applied this 3rd patch (not 1 nor 2).


Cheers,
Alex

> ---
>  man/man2/fcntl.2 | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/man/man2/fcntl.2 b/man/man2/fcntl.2
> index 446411a06e..521a4ddd09 100644
> --- a/man/man2/fcntl.2
> +++ b/man/man2/fcntl.2
> @@ -112,6 +112,11 @@ indicating that the kernel does not recognize this v=
alue.
>  .BR F_GET_FILE_RW_HINT (2const)
>  .TQ
>  .BR F_SET_FILE_RW_HINT (2const)
> +.SS Open file description queries
> +.TP
> +.BR F_DUPFD_QUERY (2const)
> +.TQ
> +.BR F_CREATED_QUERY (2const)
>  .SH RETURN VALUE
>  For a successful call, the return value depends on the operation.
>  .P
> --=20
> 2.55.0
>=20

--=20
<https://www.alejandro-colomar.es>

--yg25nemcp5f5lanx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrclBkACgkQ64mZXMKQ
wqlGeRAAkUm3jZ+ktKi8dYUhw6V8EWTcODOeJWi2nCMNxTM+CsWHkRR/hqqpdJSg
wk6rOUmV6wVWFXW8seNGkOfjJMNARYMftAFaJ9NlbmKGsBGx4N5OTWs7ODY7H3Gu
8ysnEAtzpo+J4K3GHmNtWUJF46I+vZtVIbxjDYXamODybpqZ0qWrUahuktcA2Hpv
hgPrJHmF5IwYIqVrJ7YrPJNlmYkkhUAppQpSJ3XS7cYD9s3SDJIyz+BCkmaBH6Le
ZRi55mM6TEVR2lWSf2OptWKF63Qm3slrAmgmCPp9ud6tU7uHUT6MU2aBPvcQQ1xZ
tVSA7Nuy0x8vx09/M5D+HRwCRZUmTjcRiSAvuLy4r6H3v/BIrvp2fzECEHa8kpG3
0ZreqK7h/FxiHPZ1koIs7mVYRJU8PzWiGPH1k70DbotknvlM6V2J6m4IK1GbWoeU
8gXC/YTncF72lRqFpKo4SB/R4OB7RgAPHvh36mzPpXv9vJWUl1XiqJWZri3N8Kt3
5QG9i1k4L0KPUXMLhfAmZMrihCbCA5L/PjvVKhFCxloORfP5YcTboysPllg6cDn6
J3mJXb54Z82pFbYAHxE/KpBc51vUhKHwWxWvnLiIRTg7H4raasBoLZpQrivf6Nr5
zRRyRvOb83gNwSjQiVbOypPKlIkDsqI2jYz2KXxo1d/RcgWEEXM=
=Grj9
-----END PGP SIGNATURE-----

--yg25nemcp5f5lanx--
