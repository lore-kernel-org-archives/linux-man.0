Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DBC23ED6A
	for <linux-man@vger.kernel.org>; Sun, 11 Oct 2026 17:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791738697; cv=none; b=txhP2KeSS2KEYhJ8/TAvFf3prsa0gzuMp0RwxsWQlTa1kOTGb5Y4BlNjFqUoRu+hX7GmhlBK1g1dqFCu61ej3TaYcjscdGlgBqDW3XWgH8drdFJfcDMGas9NLEsMGAvU+bmQi+Pm13aqtusC3rDKJ6rbgZX24j/ONuHgGZVeA2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791738697; c=relaxed/simple;
	bh=VLVEK3zx19hVxtF1Loe5bwW0jpEJZHUxCxaQDAfbBlo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V4ZvVPFnZ7jFbGnYMBPwKHVYE2wwqCH+BWKWqTLJ3lppqE2X9qQuAkwkHhUB0DhpFe2yYeQTAi59oUQsibfGI67uHlPppU3k0cjs7qlNptfKd6+4aXY9mdPFNQ2qwkq0JO47TSTFU/V4R4Ylae0VWcABIW3kP5QCvfm84qdGt/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jQj4GOmA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jQj4GOmA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AEF91F0089B;
	Sun, 11 Oct 2026 17:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791738695;
	bh=eK+IyyP7/GjbM5M75J4CdvL9z8mRXklXpZWiFZT7g/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jQj4GOmAJ70KlDnHkBfmptaaV4rIMMVf3XhuS0ll3qvT3/QEii6wdBGqwt25zFbQ4
	 kHBgF219M2gly+f7V5xOvEkILZse49TcjdIhSQixGKO/7gflVkoOS7wxfcTokQY16P
	 2J2EWdbHBeN5TAG76qc9B4UCgOBkh6Thggpq8U+5D3B/G0h39lJh2g2CslRrQJsoeO
	 hlcaGSVbGBsFWmvyp1MaoVbRO4s7F49asiHmEI/fWvSjgBiHiwBnkHRcjwVFIsxkiO
	 6HG7wz7g4ew6+XvGXDem7DBMaaFpVN2fvfL02gf3w9zNaNzRQwRQz8qAh5eswnPwbq
	 bzgPVptpETMiQ==
Date: Sun, 11 Oct 2026 19:11:31 +0200
From: Alejandro Colomar <alx@kernel.org>
To: astian <astian@memeware.net>
Cc: linux-man <linux-man@vger.kernel.org>
Subject: Re: [PATCH v2] man/man5/proc_ioports.5: wfix
Message-ID: <asvDL7IokH085ojJ@debian>
References: <20260917195829.1380868-1-astian@memeware.net>
 <20260918070346.1407544-1-astian@memeware.net>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bm3p6ijke7h2e7jb"
Content-Disposition: inline
In-Reply-To: <20260918070346.1407544-1-astian@memeware.net>


--bm3p6ijke7h2e7jb
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: astian <astian@memeware.net>
Cc: linux-man <linux-man@vger.kernel.org>
Subject: Re: [PATCH v2] man/man5/proc_ioports.5: wfix
Message-ID: <asvDL7IokH085ojJ@debian>
References: <20260917195829.1380868-1-astian@memeware.net>
 <20260918070346.1407544-1-astian@memeware.net>
MIME-Version: 1.0
In-Reply-To: <20260918070346.1407544-1-astian@memeware.net>

Hi astian,

> Date: 2026-09-18 07:03:12+0000
> From: astian <astian@memeware.net>
>
> Signed-off-by: astian <astian@memeware.net>
> ---

Thanks!  I've applied the patch.


Have a lovely night!
Alex

>  man/man5/proc_ioports.5 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/man/man5/proc_ioports.5 b/man/man5/proc_ioports.5
> index 10d03f5aae7a..6729a7b98054 100644
> --- a/man/man5/proc_ioports.5
> +++ b/man/man5/proc_ioports.5
> @@ -10,7 +10,7 @@ .SH NAME
>  .SH DESCRIPTION
>  .TP
>  .I /proc/ioports
> -This is a list of currently registered Input-Output port regions that
> +This is a list of currently registered input/output port regions that
>  are in use.
>  .SH SEE ALSO
>  .BR proc (5)
> --=20
> 2.55.0
>=20
>=20

--=20
<https://www.alejandro-colomar.es>

--bm3p6ijke7h2e7jb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrLw0IACgkQ64mZXMKQ
wqmiXBAAs8DA4mmlxT/p24V9TpSwjJMmFk52OnsEfDoC7o+OTZmlAGl1FzcfSGEt
FhUBFQWCr2HHdQBX2tieXfdShZE36V2FBh7DxISOwD73lSnxLDB9U5uBw/4Lxa0+
yzBoIWDF48MCt2Tx2hAUXDkBpiTuI69Wppg42/pGCvgY21gLpevLKNa3KLnq5Xq8
iobJbd/H7YEeCG0+C1n9FeaxFBN+u/tmo2C/nHZXHEfvWw+qOMcaqReub8EyZ2mb
xN4DO/85uSClNUswvh/9HEaLiyDGkZ2NA8fUQlRqzHqOWvHLimlJjkCY73R5WK4O
r5GL9XT+CvM9BWcbEXPYWtSVs3u4N1+5AjpI7Dft+Kp8H06wI/Zsymf0zfO6s+Uv
Q/T4OPPOxovNm5RmWFYoQ75cWHZ7KTZhsQRGfmXP6kLS9dgX4T+rB/Q4VChXstxZ
ObTKrZjDQ0rJhbEGTSzavlfN8v5fEPKqukJk0pAelCOjF+PVD7gDB9fSXSbJc7YP
J409sqY1BNjuB+Kd/JhWm4tEuF8exnPfL7Yotuwf5mGCRMhe+OpE0i7tbTnP+Zzk
y2wckYrsT1X4awR1ZvWr89whlJu8MwvjKyiY9xv0A2WlVvwzYdbSud3+ZjWymnks
BddnMMgkfpVyoJy6JZOPfuc+0vp/rQNXJp17ao3oXZpqzSvo3jE=
=WSs9
-----END PGP SIGNATURE-----

--bm3p6ijke7h2e7jb--
