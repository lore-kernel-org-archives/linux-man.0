Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D8D418A4F
	for <linux-man@vger.kernel.org>; Mon, 14 Sep 2026 11:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789386248; cv=none; b=YK6txV1g73rXwmdhSqPfEpFdPGzFlruj56U0YJYv9zWlOcKOVoXeLDMofWONSnIavmO/BFGX4e9hDAjwWN4MIgCoK2XREX+zzVRKiwOHKg+gj1+JkKpwntMR2u4l62Ecp1U55j1uQt2il930ZJdWKG7gEkdpA9YZH4OB80Mqymg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789386248; c=relaxed/simple;
	bh=WozLLgjwBB7pOTudqxm5u6CApMAwpxtLQYoFGql1gzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NlzQqGn8DHRNGqo1rL/mJpVl1KOfFW3RjVZMuo1Px4qmCFk0Lh/jG/fVoHSofQUuENNQzp5nDqts8o1vmOmGmZ6ioTIbH1V80qdgH67ZtXBYVZNh+7rYqs36S74Wbtnn/iAPQX7FDrzZW3kiQh6WuBGfg+F67v81fY9N5FMU2Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gR+Gvgtq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gR+Gvgtq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A4CD1F000FF;
	Mon, 14 Sep 2026 11:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789386247;
	bh=AKnumAbTg9YdoCfASvEkKupJbfLZBe4UGXQHoHFVYuQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gR+GvgtqhVgljQnkHpK2mwsqRsBXpqPNkt2Dtw+tg8uNyP4iQ6lq/39kNfxEd/UJI
	 hNCnGzNUcifB/DZyUbKPUn+HU3eCJIJdKeM4/5GEM50Q7/gjK4MLEdZ0o7kuX9XojA
	 D/IEhGGpnm+5Aslbz/tO4mCYM5rNhCf/2Iu1bH/4V/Ldg575oNI9rDWGW78INxnD/v
	 fubGRyrw7qdfTgsbpYVoDmGrDJdG9C1yidt0QGGzOemPR8P9Z4Djsw8sIAmLYeJrYM
	 UB55TZMwXE06KcFD2A7G+MvONyrKl6xsn0kFqXVtbRDuaTBsw1L+McA26NgVPqvPnN
	 PWaqZelqdaF9Q==
Date: Mon, 14 Sep 2026 13:44:04 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Petr Vorel <pvorel@suse.cz>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH 1/1] man/man2/request_key.2: Add missing GNU size
 forward-declarations
Message-ID: <aqfd1_Xa_TbzE1ML@devuan>
References: <20260914111511.1610878-1-pvorel@suse.cz>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lzcfro4yixxcu4vq"
Content-Disposition: inline
In-Reply-To: <20260914111511.1610878-1-pvorel@suse.cz>


--lzcfro4yixxcu4vq
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Petr Vorel <pvorel@suse.cz>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH 1/1] man/man2/request_key.2: Add missing GNU size
 forward-declarations
Message-ID: <aqfd1_Xa_TbzE1ML@devuan>
References: <20260914111511.1610878-1-pvorel@suse.cz>
MIME-Version: 1.0
In-Reply-To: <20260914111511.1610878-1-pvorel@suse.cz>

Hi Petr,

> Date: 2026-09-14 13:15:11+0200
> From: Petr Vorel <pvorel@suse.cz>
>
> request_key was left from GNU forward-declarations of parameters for
> sizes of array parameters.
>=20
> Fixes: d2c2db883 ("man/: SYNOPSIS: Use GNU forward-declarations of parame=
ters for sizes of array parameters")
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Hi Alejandro,
>=20
> although I don't like N3207 GNU forward-declarations of parameters for
> sizes of array parameters syntax (I'd prefer to have the signatures
> which are in the headers) and I don't think it's practical (before one
> could copy paste the signature from man page), I understand it's a
> wanted feature. Therefore I fixed missing size parameter in request_key.
>=20
> I suppose more functions were left in d2c2db883.
>=20
> Kind regards,
> Petr
>=20
>  man/man2/request_key.2 | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/man/man2/request_key.2 b/man/man2/request_key.2
> index 3bb52f31b..d16642d9f 100644
> --- a/man/man2/request_key.2
> +++ b/man/man2/request_key.2
> @@ -14,7 +14,8 @@ Linux Key Management Utilities
>  .nf
>  .B #include <keyutils.h>
>  .P
> -.BI "key_serial_t request_key(const char *" type ", const char *" descri=
ption ,
> +.BR "key_serial_t request_key(" "size_t size;"
> +.BI "                         (const char *" type ", const char *" descr=
iption ,
>  .BI "                         const char *_Nullable " callout_info ,
>  .BI "                         key_serial_t " dest_keyring );

I don't see the 'size' being a parameter of this function at all.  Am
I missing something?


Have a lovely day!
Alex

>  .fi
> --=20
> 2.55.0
>=20

--=20
<https://www.alejandro-colomar.es>

--lzcfro4yixxcu4vq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqn3gMACgkQ64mZXMKQ
wqkNwBAAjonVoS4N3nkfcfmW7lZTQ3YYQRT9q4jPWFii27JfxHsG8pqJc39OlBQP
T5SRsx+gT/GWe4Uyj9/aEOIqmDa8V6NQT4Y33XY3uoYTL3fg7dQomwthcu/ddHmE
74U+s+lg8OevPrYuz7fhxYiqsy2uDUBtbSjhtikRZPULU0wz02VlLsqMDr5Af3uE
PBxrbq0q9IudeqnRTwFIaA3qMjN8B9ax9W4iJNJ+mqNvowAeoPXGbBpxMS0LutS7
lUe7E7iJ684U9yejq+K+S9g8Xw/lzhnPI4XR9Oqel9/gQIYZSIzTNkyUyTJK1nx3
47divlhJY4ej7nSQpJX9m+xgRUTpTgJQIhImEch/b2v6HH3qzffhXslpuTz0u5AT
9yDJLIeruG/TrR5JP1sXam0VrUe57sKVqqM5//RI6iKV3BKfRouM8WJl6kQj1y9e
9j3k+AjtUmDS0wuWBCJVSZ22yhNVbQnd2mVtWhL86k1re8b7MasTcaYA/QbZPHkI
AStD2QifScN88HPsxqzIWRm7fmZjHwCWFa19h6lF+BXPSDBZDb6tyeRyDSFrgsd2
ftOYVZXaJLRe3xeWD2xUikNakk8CJ08J0FOb0aCz+iywPT/aSyIUyqODidErIHWH
HKZUZ1R67xHpNtog7iJ7LHHVRXnf8uJXu6BUH5c3x2cQsVugiYM=
=V5xz
-----END PGP SIGNATURE-----

--lzcfro4yixxcu4vq--
