Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E1518D62A
	for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 10:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792320412; cv=none; b=MjiDgxvQUlKZ2dEQZtXz2dkK6WJI7Rv7+XxusMo7kdnE5tHyAbosYGbxVCBbYkAkYll+Q37Yjsy7Jv2JE7/tUDJEK/U4LrVGUdMk9uzESO7Y0abuel0qvnNv+l8L3nRIwbWBOirQ5/XHkMW0iTSq3Y8VVuZrQExWYBXc70FLi/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792320412; c=relaxed/simple;
	bh=Q7I171tfZ0IEueuNpfZO8x/C0+fU2wR/abukwc6oErQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iqIUJkZVvcZItE2Nxj6KmcB6OIkfZXARUOxtIHklW6Vj9OFr4HTo+ljfHRx1pOsEgrBwu0usl98U2IXJaFrTxfoPyNsMkHupSW/XGVo0RToIylz1KaJW/KY2TpDTUeo1gIxfzUxnKa28Krsr+HUgcZFhXhso/4WjHv5oyguAuQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GOG3mBbE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GOG3mBbE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CB5A1F000C4;
	Sun, 18 Oct 2026 10:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792320410;
	bh=RqRxSXIRRYgjBckCbSd6XP47GzJvT7jDUIQ+08AANls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GOG3mBbEE3G2IEm0fTvHIlL6/4w1GaTQls1Ob4S3+iqimki+4Jo/lLa1gBZIUR+BX
	 18jN4BwGiGTr7kQKRWucZhPM1z52u49FFB86V+ZpAqPJ3gKw7AGQyI8XeMD7DcTOcs
	 9GzG9JUk+LU0RHogDXs87lR5vddBFXXX5aVMS4ePXVzjXlsQqTMElKMKBEsbyn5kO8
	 pa7+KXGC2JjrmFFFk2wCSSBIxwnlI4Nrb7ufNyPjoM4v9G0eIJXvH4gkftobVat7xh
	 aqiMHMBttBh8YVQj40P0P8k/cipSQs0kmjqB5eZDxnMXRvhN4QLLiMgIiwktDQCraw
	 h3TcclMUL3Psw==
Date: Sun, 18 Oct 2026 12:46:17 +0200
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH 01/24] man/man7/unix.7: ERRORS: EINVAL: The address field
 is sun_family, not sun_type
Message-ID: <atSgok2UDdYB3f2P@debian>
References: <20261016173139.13076-1-gnoack3000@gmail.com>
 <20261016173139.13076-2-gnoack3000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="btwaqiivtkucizbg"
Content-Disposition: inline
In-Reply-To: <20261016173139.13076-2-gnoack3000@gmail.com>


--btwaqiivtkucizbg
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH 01/24] man/man7/unix.7: ERRORS: EINVAL: The address field
 is sun_family, not sun_type
Message-ID: <atSgok2UDdYB3f2P@debian>
References: <20261016173139.13076-1-gnoack3000@gmail.com>
 <20261016173139.13076-2-gnoack3000@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20261016173139.13076-2-gnoack3000@gmail.com>

Hi G=C3=BCnther!

> Date: 2026-10-16 19:31:16+0200
> From: G=C3=BCnther Noack <gnoack3000@gmail.com>
>
> struct sockaddr_un has no sun_type field; the address family is in
> sun_family, as described in "Address format" above.  The check is done
> by unix_validate_addr() in linux.git net/unix/af_unix.c.
>=20
> Assisted-by: LLM
> Signed-off-by: G=C3=BCnther Noack <gnoack3000@gmail.com>
> ---

I'd like to understand the reason why the bogus documentation existed at
all.  For that, a 'Fixes:' tag would be necessary.  It'd also be
interesting to know whether .sun_type was a human hallucination, or it
existed at some point.

In this specific case, it seems to be:

	Fixes: 9d1fd1157306 (1999-06-15, 2022-12-19; "man-pages 1.24")

> Notes:
>     Fixes an obvious typo

Most likely; still worth having a Fixes:.  Since I don't see any
occurences of sun_type in glibc's or Linux's source code, let's assume
it is a typo.

Reviewed-by: Alejandro Colomar <alx@kernel.org>


Have a lovely day!
Alex

>=20
>  man/man7/unix.7 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/man/man7/unix.7 b/man/man7/unix.7
> index f9db05a71d93..75e125c61673 100644
> --- a/man/man7/unix.7
> +++ b/man/man7/unix.7
> @@ -663,7 +663,7 @@ Invalid argument passed.
>  A common cause is that the value
>  .B AF_UNIX
>  was not specified in the
> -.I sun_type
> +.I sun_family
>  field of passed addresses, or the socket was in an
>  invalid state for the applied operation.
>  .TP
> --=20
> 2.56.0
>=20

--=20
<https://www.alejandro-colomar.es>

--btwaqiivtkucizbg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrUo3kACgkQ64mZXMKQ
wqmqohAApkN5zBWl9/huH97yecFOwgnYM/sHGt86Bo7FEg57xRfjqRaTD7jNE3v5
k07j1sTtz/6LMX8ZRZFs0yJEgO7c3aCB3idvn3rEJ3ArL7GFRysOrAhvrEJNk9QC
qx20rH4yzq1sTBWI1G1bnjQx+nIS/s/e3L3AgrjgGjCTw9vDlbhJ9DYTEJHvuhFL
gC2+U8IhYslPpa3+Yr8cR0q5VUAPc0/b3pleyUpytSSoqyY2sQH0+RKp1la/3jQK
wHAly3OnOun2//2qAVgZvvvGhZCZ+cTcPVzSGFVerLdv/ak00AjCPcQDlk0R3/UP
/b66HS0aNZV+sfoSJSmtd/ctWoEIam1c9aBDF/REz7x0cTPUju4GkLnRJonLnr1E
kvHVMl/R5Bf4NjRxRrscV2NgZsT/bb4EpIxPGmc54o+Eym/oljCzKAQy0QWTZLfp
A0Jtj4ctsIOLvYaeYxrvvP/kVcfVEg1hhTshRq9ttPnqY4x/1A/Q6Rxwy78GWT6u
dblZevPOJlPjfej6GcEnKHbqYcQuyr56CbxTuMAzQhQ41T7H6hn4pxoKbnGwK2zy
jPwsFEAYJ4JonUNu50TZnaGUm79L0R4lUSY30W8TNxSWStnx/isanAkoEs9vcZ3s
FA1uGodQm9h0HSZIqHEyaf748amo3XEkxMuGTblll/I8ZrZGVog=
=hJKV
-----END PGP SIGNATURE-----

--btwaqiivtkucizbg--
