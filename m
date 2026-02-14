Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FCE3EBF2D
	for <linux-man@vger.kernel.org>; Sat, 14 Feb 2026 12:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771072395; cv=none; b=RN40hey/EYRjRk42tUYHQEriT5JxvJrkmpYk91JQKDCSF/5LKqNuOhyy3Cxjwx7xJeQSwY3Dnjinl3VTo1QkRCD6vIzoit1UicXuC5szA+/zWe4/gxS1zIF0x5N4qzK/50fvBQeJnoW8HWZyvoSJmmd6rO9cx4S5aYquz3TsEkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771072395; c=relaxed/simple;
	bh=qN9r7eo9JebyBxQna5Wei4HMOpXO5cx0XwFv2PxyZso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BGQqT7ziE85MZ6cjiSLxro0CnqlZ4KajpIQADCFJEIZExvhuEq8WpipwAjQf90HpCg/3ca0xQI1fpVpsqT1KPAOM1cELvh5C7oAcBtEqqSBYP5S/1+0XiV/5RmO3xkYW7/tlRU8gOPMA0sF+6poocnAOQ6SdIy6ZV13d3tpR1wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CP8ZgTbC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CP8ZgTbC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2607FC16AAE;
	Sat, 14 Feb 2026 12:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771072394;
	bh=qN9r7eo9JebyBxQna5Wei4HMOpXO5cx0XwFv2PxyZso=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CP8ZgTbCr5XJAmwx9MpE7wapeY97JuJKgiwo8+/2QRNpU45U2AZuAoiON41femuP9
	 JybHjiHdC1jfFw2h/u+I95B33iBDKRDVSOPVBfNK5gYem4VLhqL0JPouvjb+QWc/0E
	 pTgemx5F37QEoS+nZIBsoPUX5SGQIncrGtpr6lSfsExf4QEX1twxtagm6+yGokJr4H
	 V/PXEIOEPtjs/7J66kd2og2XlFNzQpGErI7j8MmssthpW+z5V4QDLvvstBo5PtV3Qa
	 icoIni0iFVVV/0+upniXFsqM5FuHLjO6AMaUqamS2SUeLlRDHvv/hpg2a70rcMeXwt
	 ZX9ivy4bkhT5w==
Date: Sat, 14 Feb 2026 13:33:11 +0100
From: Alejandro Colomar <alx@kernel.org>
To: Jonathan Wakely <jwakely@redhat.com>
Cc: linux-man@vger.kernel.org
Subject: Re: Should aiocb(3type) say something about the order of fields?
Message-ID: <aZBreHEOOKWUGWVN@devuan>
References: <CACb0b4=GZ_pCtuVNTmo9v3XhKVzBB-08xm=af+Ju=iE4Uc_uWQ@mail.gmail.com>
 <aZBoYIj4D_jcMjDO@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ds5gbqim24w6iger"
Content-Disposition: inline
In-Reply-To: <aZBoYIj4D_jcMjDO@devuan>


--ds5gbqim24w6iger
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Jonathan Wakely <jwakely@redhat.com>
Cc: linux-man@vger.kernel.org
Subject: Re: Should aiocb(3type) say something about the order of fields?
Message-ID: <aZBreHEOOKWUGWVN@devuan>
References: <CACb0b4=GZ_pCtuVNTmo9v3XhKVzBB-08xm=af+Ju=iE4Uc_uWQ@mail.gmail.com>
 <aZBoYIj4D_jcMjDO@devuan>
MIME-Version: 1.0
In-Reply-To: <aZBoYIj4D_jcMjDO@devuan>

On 2026-02-14T13:30:05+0100, Alejandro Colomar wrote:
> Hi Jonathan,
>=20
> On 2026-02-14T11:51:36+0000, Jonathan Wakely wrote:
> > https://man7.org/linux/man-pages/man3/aiocb.3type.html doesn't tell
> > you that the order shown there is not the real order used on linux.
>=20
> Hmmm, this was explained in system_data_types(7).  When the page was
> split into many, that information remained there (and I still have
> pending the move of the remaining two types in that page).
>=20
> That page says:
>      The structures described in this manual  page  shall  contain,  at
>      least, the members shown in their definition, in no particular or=E2=
=80=90
>      der.
>=20
> My intention was (and still is) to move that page to intro(3type), and
> keep system_data_types as a link page to intro(3type).
>=20
> > It
> > does tell you to look at aio(7), which says:
> >=20
> >     struct aiocb {
> >        /* The order of these fields is implementation-dependent */
>=20
> How about '/* members in no particular order */'?
>=20
> >        ...
> >        /* Various implementation-internal fields not shown */
>=20
> I'd replace the second comment by '/* ... */'

How about this?

	$ diffman-git=20
	--- HEAD:man/man3type/aiocb.3type
	+++ ./man/man3type/aiocb.3type
	@@ -10,6 +10,7 @@ SYNOPSIS
	      #include <aio.h>
	=20
	      struct aiocb {
	+         /* members in no particular order */
		  int             aio_fildes;     /* File descriptor */
		  off_t           aio_offset;     /* File offset */
		  volatile void  *aio_buf;        /* Location of buffer */
	@@ -17,6 +18,7 @@ SYNOPSIS
		  int             aio_reqprio;    /* Request priority offset */
		  struct sigevent aio_sigevent;   /* Signal number and value */
		  int             aio_lio_opcode; /* Operation to be performed */
	+         /* ... */
	      };
	=20
	 DESCRIPTION

>=20
> >     };
> >=20
> > I think it would be helpful to repeat that in aiocb(3type) so you
> > don't need to go to a second page to get that info. If aiocb(3type)
> > shows actual C code with a struct definition it's reasonable to assume
> > that it is accurate, which isn't the case here. The comments in the
> > aio(7) page make that clearer.
> >=20
> > The Glibc manual
> > <https://sourceware.org/glibc/manual/latest/html_node/Asynchronous-I_00=
2fO.html>
> > just names the fields (not showing an actual struct definition) and
> > doesn't imply anything about the order.
>=20
> I prefer the actual struct definition.  I think it's more readable.
>=20
>=20
> Have a lovely day!
> Alex
>=20
> --=20
> <https://www.alejandro-colomar.es>



--=20
<https://www.alejandro-colomar.es>

--ds5gbqim24w6iger
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmmQa4cACgkQ64mZXMKQ
wqmRRw/+L03rP3TKxQhLjNJVMDyakJv7tQZSIWeYQRVKSro8wXKOcrGO1Nm307HZ
6DM7f+r2M+I2ka8JWK7mbuAiELnZAwZD6LoyAzrxHwnH5laWSHAzqABjwOXvcoaz
mG2Z4ErWdJbvqkV/HVams6QRR9VIf6kzp0Y9ZHvdnBpTs4t8IdkGqZFGKMwe7euM
aR5cv0FuxVk/mdbgFVss5NwofXAfTiRhc8rtGghBtuYUjYe+FJq/2JZeL7QHR2Eu
0CqiZt7gJH9OSXSC9HQOM06kn9hh4xU2VN+g0OhbZe4Q5ryroQ5WDpflI+bxCQpR
lIczm1PSz39heXbp6rqx8gKy6u7CkcBanTu1XVwTfR3M2zk+aZ32L6ILZAcrtrtN
QgD8YSkrRwJRBlDdyRdsFGdTigFeagvrxiXsVerJk0qnoGwS+jLwuIttHS6Am3Ba
pCBhYL+deJb6jslIsPZbOomL/liJT/LRTRwblaA6l0txk3x6D6DCHqME8zd7fG6M
F45GduQCdKT5QJ6oPwi6GdswCGW15rUg0Q3qRsII/COEEJ3984RIMUZa5iD4a4IT
wyBHwovHFf6dbc+aKhcz89j/dyY/pgwQXaSkkiSROF9K9w15XHfDeigw811HuyW4
OZqrXxpGDkDjsU2AwXkVQMopqMHzYTfqv60CxZxGxz4UTrovD5U=
=0csq
-----END PGP SIGNATURE-----

--ds5gbqim24w6iger--
