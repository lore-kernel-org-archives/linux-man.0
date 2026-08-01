Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25347273D77
	for <linux-man@vger.kernel.org>; Sat,  1 Aug 2026 01:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785546080; cv=none; b=LegVuCbNJWPrewBtia4HdlJdz7abF4nlaBwvWDQxiVlzFWC0fitix/WRGWDdQvG/0QfQ27wS8qFtIfAclmvyE25R9njrfKHiDy4MdWRiAYEeKUixICb4HKXCZAIuL+ffDw8M5oKdXTnp94ooMMxDs4slRUKqvAhSkQtjPspFyNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785546080; c=relaxed/simple;
	bh=VfUT0xQ3/G2nlayILyER2HNyLOMpgFraq6alypVb7ug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SjUw68Cq4L4pAD9Ds1mL4JZhDtHYadFBh0sctF7XSi/4Iy3g1+8XSZ/2ZaZT358QLNs3fLlgikIjZF5v30MdBFQt7Ql5lR6bDqIuzanS0WrEoaV86D77LdW/KA1jXGE6vtEQKKeyCTnIau8Zx8xX15Ct4mqZ0DkcizcRyqAKDc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z0AjiGEJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z0AjiGEJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E8F31F00AC4;
	Sat,  1 Aug 2026 01:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785546078;
	bh=BtihhqFwfjtS4UW+J3Ds46j2hKJqdm6o1F4N03PPd9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z0AjiGEJUUKBEw1snWP8i57akwdWast8DuDVhSUOFAcohsMYVxAxXoNwPAeTUda2a
	 U2Lo+Az+CyBEfOTu4Ov5yf2bc6szW47DfFpF+BXFkc8reqkbJQ+3p6xpUL1Ogde80S
	 IvaN9wpxtPcS75UNDFjgI7aOzU3A6mRKhlhjzZ7FkZ9oLJw/7FVYm7JN5a22rO39lM
	 7KNXvyx0ZonG3Ew04iDThDyYw7L70kprjYcFsHpXZRn7FHKjeGAnG8cUMrLB3o7WIz
	 bLvX+9JGmeG/i1GFApcUgvhZxfyBF6vdc1wfChfMokgi96xQBjOY137RmFasPHVuIi
	 nnaHwJWFIg4lg==
Date: Sat, 1 Aug 2026 03:01:16 +0200
From: Alejandro Colomar <alx@kernel.org>
To: DJ Delorie <dj@redhat.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v3 1/4] man/man5/ld.so.conf.5: document include syntax
Message-ID: <am1FSNl_WjnaHI0-@devuan>
References: <cover.1785522144.git.dj@redhat.com>
 <ae9c2cc67047902f68f64d05ca454da0e6d008b3.1785522144.git.dj@redhat.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tpofmuxqrnvo57bd"
Content-Disposition: inline
In-Reply-To: <ae9c2cc67047902f68f64d05ca454da0e6d008b3.1785522144.git.dj@redhat.com>


--tpofmuxqrnvo57bd
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: DJ Delorie <dj@redhat.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v3 1/4] man/man5/ld.so.conf.5: document include syntax
Message-ID: <am1FSNl_WjnaHI0-@devuan>
References: <cover.1785522144.git.dj@redhat.com>
 <ae9c2cc67047902f68f64d05ca454da0e6d008b3.1785522144.git.dj@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ae9c2cc67047902f68f64d05ca454da0e6d008b3.1785522144.git.dj@redhat.com>

Hi DJ,

> Date: 2026-07-31 14:22:24-0400
> From: DJ Delorie <dj@redhat.com>
>
> ---

Thanks!  I've applied the patch.


Have a lovely night!
Alex

>  man/man5/ld.so.conf.5 | 24 ++++++++++++++++++++++++
>  man/man8/ldconfig.8   |  2 --
>  2 files changed, 24 insertions(+), 2 deletions(-)
>=20
> diff --git a/man/man5/ld.so.conf.5 b/man/man5/ld.so.conf.5
> index 481cf9152..d9fae3c1f 100644
> --- a/man/man5/ld.so.conf.5
> +++ b/man/man5/ld.so.conf.5
> @@ -9,8 +9,32 @@ .SH DESCRIPTION
>  This file contains a list of directories,
>  one per line,
>  in which to search for libraries.
> +.P
> +The file is parsed by
> +.BR \%ldconfig (8)
> +and the results stored in
> +.IR /etc/ld.so.cache .
> +.P
> +The syntax allows lines to start with the keyword
> +.B include
> +followed by a
> +.BR glob (7)
> +pattern.
> +Files matching that pattern will be processed
> +as if their contents were included at that point.
>  .SH FILES
>  .I /etc/ld.so.conf
> +.SH EXAMPLES
> +Example config file:
> +.P
> +.in +4n
> +.EX
> +/lib
> +/usr/lib
> +/usr/local/lib
> +include /etc/ld.so.conf.d/*.conf
> +.EE
> +.in
>  .SH SEE ALSO
>  .BR ld.so (8),
>  .BR ldconfig (8)
> diff --git a/man/man8/ldconfig.8 b/man/man8/ldconfig.8
> index 9ac146b44..cb7d62ccc 100644
> --- a/man/man8/ldconfig.8
> +++ b/man/man8/ldconfig.8
> @@ -178,8 +178,6 @@ .SH OPTIONS
>  is also specified,
>  the cache is still rebuilt.
>  .SH FILES
> -.\" FIXME Since glibc-2.3.4, "include" directives are supported in ld.so=
=2Econf
> -.\"
>  .\" FIXME Since glibc-2.4, "hwcap" directives are supported in ld.so.conf
>  .PD 0
>  .TP
> --=20
> 2.47.3
>=20
>=20

--=20
<https://www.alejandro-colomar.es>

--tpofmuxqrnvo57bd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmptRVsACgkQ64mZXMKQ
wqlrQw/+Mzbi6LpPXVdHqO5Kkj834JJ+sYoAoUUFDMmXGC7Wcw3UuTZflVTrRpFG
GWAo4pOAgo/TVbZvn7KAB9Jk0fFsWY7RQEv/eDCgFabstRSRQAl9twjrbAG4ro4q
3W0fDLB3puzFhdMXpJQaNSM6mgcNeG9bZjBRkbsmq5ZsiPrvR6HZcNE6yKqFB1IV
bICR6En2eLhchRHAACAEIMFoWc/tHEfNR30TsDjOYOw6fTOo+yBHLwJp2ooHccVl
iZ+1rLoAsPmcTInob8gXO1GFnhqLekLjaWY1r6PLsoqAUvQuBJr5M33r0b4hQ5sD
s5+8OZS2r+Lug2dZVx2tcf58/ecZvXj2EJOXKE+4FILO6K56rqNyVicaym1FTsHy
ifoEN+IRx+5aY+mXazrwd/70MrBk4hsEY+Pw1d2Ba5KtlelvCXVdn4ktR/UvPK1H
VNUfJREzPa1ciY8CZ2wClT28iZ1hv951YJAGhxjH2JpuT8I0OFcdohSDfTHnYw02
JuwnY2Bfb3HxPiHsf6DqYB4lJMduKMXujN4N7UeEp4gPjiw0JuiZLW4dJAdlItVl
F7gjkmz/woy9xZ5g0s6jhRhNp5TDUhmMyhQA+Ddy1iqZaUQ6Abq+a3T99qptLi0I
cCkg8Mbhs0BZSZCksGCJOGB4xbIOF+kxesLawIE45V507svwEX4=
=XmPA
-----END PGP SIGNATURE-----

--tpofmuxqrnvo57bd--
