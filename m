Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C58383C92
	for <linux-man@vger.kernel.org>; Thu,  6 Aug 2026 23:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786057698; cv=none; b=jYVgejVpY+O0avMzuUGjjLoWdVfQUiqpufAHfIDSuFJK/Xtj2AEhpPuWw4PGez6YZciZrQick/c1G27a4OEcIT6cO2IlIuw+MYcJwav3I2OgUP3tUDBICf+wmvGQv33L1tqwp/IUTTnEz2pVuFjx6uOs9nttZhTgJeu/YPa7hp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786057698; c=relaxed/simple;
	bh=whsWdLEoiQeN33MRu64JmID6yePHACsgn8nbH0XZtu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k9G5YLIfxnSoR/Glsa6PqAPMEsO66RWpoiqfH0Nun0v3fShTcVPV9hr6X47T9d5svfSi9Uf0HX+axkvjCBuGC8aW3QccE2oHo8zzm/7Rw8dGOjC+7V9zotGsxDyrYR9pNmtU+wSeentl+ou4GMCG1/P8fNNymr81Oz6wXsHnRCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CJxPY2J4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CJxPY2J4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80BF91F000E9;
	Thu,  6 Aug 2026 23:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786057697;
	bh=iL/IcdhZmzMGVplEmQblqD8WTtUd8MaBtPoQMqmOhLo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CJxPY2J4Z1QAtKJEqXpDtJFLn2KbQu9ycz/cqterL46Zv89sSRavyQw+0iohG1RSZ
	 S1/UGQfsIqSagOn3p8iHtYoKw2Ht6t57Du9bYMG0Gd/vQbQYUSRCzs0yQRQ0k1vSSP
	 RMhm205HMvxbT5RMeqT5qIL7v9n7hqKqaHxFIm9zvbN4KY5+ltUjavj4eq20OEWvN2
	 7aPrJeo19XD8XdDcQnlBBhzT+8hZ+uCOyGAUAowY3QedNtaOfO9SvpiMM7Mj3IJhqE
	 LdBJRSkrkc8KyNPa07ddExqYUB4KGITljWRosuufKcKgweToIGWr4yURmkj2A+PHYT
	 KpaNzVt2rHHVw==
Date: Fri, 7 Aug 2026 01:08:14 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Ryota Saito <saito.ryota.23@shizuoka.ac.jp>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH] man/man5/elf.5: Fix description of e_flags
Message-ID: <anUTx56mkeaPujq1@devuan>
References: <20260803130543.590173-1-saito.ryota.23@shizuoka.ac.jp>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dfyb7rpomzizbhym"
Content-Disposition: inline
In-Reply-To: <20260803130543.590173-1-saito.ryota.23@shizuoka.ac.jp>


--dfyb7rpomzizbhym
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Ryota Saito <saito.ryota.23@shizuoka.ac.jp>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH] man/man5/elf.5: Fix description of e_flags
Message-ID: <anUTx56mkeaPujq1@devuan>
References: <20260803130543.590173-1-saito.ryota.23@shizuoka.ac.jp>
MIME-Version: 1.0
In-Reply-To: <20260803130543.590173-1-saito.ryota.23@shizuoka.ac.jp>

Hi Ryota,

> Date: 2026-08-03 22:05:43+0900
> From: Ryota Saito <saito.ryota.23@shizuoka.ac.jp>
>
> Processor-specific e_flags are defined by the ABI supplements of many
> architectures (e.g., EF_RISCV_RVC, EF_ARM_EABI_VER5), and glibc's
> <elf.h> currently defines over 150 EF_* constants.  Replace the
> incorrect statement with one that does not depend on the current set
> of defined flags.
>=20
> Signed-off-by: Ryota Saito <saito.ryota.23@shizuoka.ac.jp>

Thanks!  I've applied the patch.


Have a lovely night!
Alex

> ---
> Range-diff:
> -:  --------- > 1:  06a472163 man/man5/elf.5: Fix description of e_flags
>=20
>  man/man5/elf.5 | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/man/man5/elf.5 b/man/man5/elf.5
> index 67544f4e6..ab5d2a21f 100644
> --- a/man/man5/elf.5
> +++ b/man/man5/elf.5
> @@ -509,7 +509,8 @@ file has no section header table, this member holds z=
ero.
>  .I e_flags
>  This member holds processor-specific flags associated with the file.
>  Flag names take the form EF_`machine_flag'.
> -Currently, no flags have been defined.
> +The defined flags and their meanings
> +depend on the target architecture and its ABI.
>  .TP
>  .I e_ehsize
>  This member holds the ELF header's size in bytes.
> --=20
> 2.43.0
>=20

--=20
<https://www.alejandro-colomar.es>

--dfyb7rpomzizbhym
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmp1E90ACgkQ64mZXMKQ
wqkXShAAl7Wyxjt0EHNLFIXsIhLayvORin5715BKBoFWcfhjCsFFBsWM5wGhsBrf
syOUJHdJ2cvnyDKVSeVMbQ/uKtUo/cpTzQosO3Kq5/M+koc9EIyjTDFljcbUZnZ7
oVJiwVnChl5mzIimprnkjbRyBIsYPA0gT6uWBQRMOQXpwaOLk0ESG9NU3mJCX/78
dSuhySWMl22fqzY2bqfpfVXePbVKXKDmBTQtKwCu6uSZDcrNxGHRHYavLgXM5Fbn
hCXDqYxkvRQ+H0baEQp6RY0mXRaeZslLYgA1dKOf1yMX5u8VOI0RGQWIa9ZIiQBC
UDsLlg6QFTebx5C1Qimqe8IPiZkfYyOh6hhHck3kL1ejiYp3tTOzWSwJFVIF1JaF
DAdKW6DQgbN4fMV9v5mwFHVjMC2JwmX3Q6MmxXCujaWOlhumFFGYEgA3SCD8WRQM
wcLgej4p10b/pqOD9GiSTee8Wap2b6cX7DZBRb3OFlYWzTnmkiIPOQiMweQkwwiw
TkKgxx+AYZ6tuB2cO1t1y0y8kZmwyTJ1tagMPIImDFsUT5GK6eeoZl3HyWnUrOwh
7alDbt+epWtsP3F2JVPK3OMC/isjzbXygpE8+pR3yrYHs9JU0GI51KEkD1T9rQWw
2lTo+TgxPaUtJyPQ625wwFQw+a6zdcPMHDAVlzt7CtuoyJwmWJc=
=Faf6
-----END PGP SIGNATURE-----

--dfyb7rpomzizbhym--
