Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B133D955F
	for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 10:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792320558; cv=none; b=Mzu3TrNYbico7ida2HWkHzHq5ZulGppPkKB3CxFR42MySdgH+1uvcADrpBSl5f3hLg8wPT28m6CgUOX6xqfnjuBWUNwNdHct3xw1lMMeONb2fD1ChMF/PMz1CDB/z+RB/cdjrUHOn6Xgs+cfnt1M1OdGAu0MRvXStqzlaGeHJeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792320558; c=relaxed/simple;
	bh=MCsgwhFdA3EETHlioiU1KV/bTnO8+zqrSC+QkGnPiSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YNsWalcLkJEUCRkGFXPz/uMZE0u2ovm1B7kpunDUEr58ed4KzCQk5/nC0tBWyXtHmBMt5Z4rW/k5oYTON9Phq8vbBu64QUtRe2RXjD4HhIAQ59ktJkWVj8mPkKyzYXOT18DAgcHGo/d29A5o+meToMZZI6vNGbpaUKo0n2Y/W+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ihbrTxyG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ihbrTxyG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E67F1F000C4;
	Sun, 18 Oct 2026 10:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792320557;
	bh=gnhX+05HZUhqezVh0kg7Oavdh3mixcx/1eLaOh1/6to=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ihbrTxyGqJ/Gz65M6oyrl9C+Fn/+XEy/7cB4GiTxWjdvYMjyz+4k2GXfvUDlZeKaf
	 moCyEoHH3QJjfbw3JqAMUNf0RXLZtZrTeAzMxp622JYKo4Cj2U/BKPiZxJ7UtGbPgY
	 F/XZQ65rg6ozX7xJoktsJsGfXzXMlX9ERDwHb+w6F9DRh+MczSNU0IgiQNJBuYX2El
	 QNv5sfRXxLgQYndSvBoXykew6IzeNLeTWhGRpW9v0Hffahpxrkbl4VbMNh++GFB2N+
	 Psyq66ArjzJaDYpy7WLy/RFJOAu1XMaVtT35eVcas+2d5SyFWscnI7a5qs7/xgLlul
	 pMPCursxE+3Pg==
Date: Sun, 18 Oct 2026 12:49:01 +0200
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH 02/24] man/man7/unix.7: Socket options: SOL_SOCKET is a
 level, not a family
Message-ID: <atSkB9UmUd7mWOXU@debian>
References: <20261016173139.13076-1-gnoack3000@gmail.com>
 <20261016173139.13076-3-gnoack3000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ja5disagp6uja62z"
Content-Disposition: inline
In-Reply-To: <20261016173139.13076-3-gnoack3000@gmail.com>


--ja5disagp6uja62z
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH 02/24] man/man7/unix.7: Socket options: SOL_SOCKET is a
 level, not a family
Message-ID: <atSkB9UmUd7mWOXU@debian>
References: <20261016173139.13076-1-gnoack3000@gmail.com>
 <20261016173139.13076-3-gnoack3000@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20261016173139.13076-3-gnoack3000@gmail.com>

> Date: 2026-10-16 19:31:17+0200
> From: G=C3=BCnther Noack <gnoack3000@gmail.com>
>
> SOL_SOCKET is passed as the "level" argument of getsockopt(2) and
> setsockopt(2); it is not a socket family.  See setsockopt(2).
>=20
> Assisted-by: LLM
> Signed-off-by: G=C3=BCnther Noack <gnoack3000@gmail.com>
> ---

Reviewed-by: Alejandro Colomar <alx@kernel.org>

>=20
> Notes:
>     Obvious terminology confusion, compare getsockopt(2)
>=20
>  man/man7/unix.7 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/man/man7/unix.7 b/man/man7/unix.7
> index 75e125c61673..1a94b00c6783 100644
> --- a/man/man7/unix.7
> +++ b/man/man7/unix.7
> @@ -271,7 +271,7 @@ and read with
>  .BR getsockopt (2)
>  by specifying
>  .B SOL_SOCKET
> -as the socket family.
> +as the level.
>  .TP
>  .B SO_PASSCRED
>  Enabling this socket option causes receipt of the credentials of
> --=20
> 2.56.0
>=20

--=20
<https://www.alejandro-colomar.es>

--ja5disagp6uja62z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrUpB0ACgkQ64mZXMKQ
wqnsUw//XsSDv/Ys2nf7dDmHMPSZqwaYFC0tM6OILyAi7g+Ryjc8BDBnwWqBQJ8R
ME88Fbq+d/7LnfzlW+aNkVSoKPFnjJgTIaYyJSZtDm1kavj2QNKpiCNYzUk96d8k
ywZQM0KhkizCTBRgEPEYHR7N0XRPLGcIEsXTtE+84TjizHCu95f+GdpUMezYes9x
nmXK2WcuPuI9yW7J7N4fkJ0L68G+WVFLb2xyalnobAmYdD60dazCrBaYyLL55Pld
g+Moql3N08b7HtDGZKYEMHfYvOY1JcLOZFj9bD5VZGjCp9arWONVcOK/Sj3Cajgq
YO7BYdbU1xUo59ZyDBs7MQI6vKR0xtZVbFLUEIPL1aOyYAxKDr1FOFbz5typ1BSu
qtpmwkoXbjPFr0uPLm/Nsw0TwwxANs/crMCAQKW5BJcPz7voGvgwuhu5G3u0qSj5
YgyuFHd4EpWC+lvydnyvli0HTcuYFuk8YdNB/bw5WbVRoAmhcmFIGfER6D3utZfk
DQrBRqzFrgG/QTbAbpgfdXHV/e1KVmpmUEGqTNCCwquU9CiwsLqOltFvueIRJUqW
Is9vFZnwC6U8R6ASxGTQXAnsgN8iRIXUagPGLF60zBjPbnqm93DgYkRoSITccomi
PX/klXDBZtP2wii9bypfuBqIYmWbshIEemPEEAhHW8JxH4Mu9Po=
=eXOh
-----END PGP SIGNATURE-----

--ja5disagp6uja62z--
