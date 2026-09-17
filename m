Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7071948489F
	for <linux-man@vger.kernel.org>; Thu, 17 Sep 2026 23:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789686972; cv=none; b=m1J+a7xhgVlt+7YGYSBXR0+7xyfAkUpc34iK9uECE7UR0mP1DqzUDUkVLxSeg05WOC41x86LTh+zb5tpD585005GySbA15A1ZQjSfcS2NRxv5L5yiEOdwITdkj6+tX0l0xw71398otB+VPsGx4oAE1qw+zWSIndoMzL4AmCqGtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789686972; c=relaxed/simple;
	bh=uoPJIDFzTzb/Esa8gMkzr3AMxRqii4OeVYuJrvgrFAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JS1qw1T7NtnL5E8EHyA15lut+AgjoGC8Wj6zmL5+YamzV+nFxdBsoYCNYevzQzzL7X1YIU/gv8l6L9f4J9AEq0FPrd5cLYyFiMPITECf+SMq2Yn8Ie1637VCyZT1j2SlydSVRe+q5GxTalOduMOdlITPkfWqEmskFkgpuwjE1vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KL/eRCMu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KL/eRCMu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF2C41F00893;
	Thu, 17 Sep 2026 23:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789686966;
	bh=1QtOn8k0iK7JSe4isNkw/nPgtD1tcmTiLNQNya6DM8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KL/eRCMuGLxaAnr+vqJtAQzE7tlGFnwJxhAY4AxyNkmgX9sAlbWeOxPJh9lyfVo2u
	 cnsy2n1RUO9vE4Hk0xsmy8WQDERB+Hy7oY7YkDAomkhAYVl7ygsDAC/trFJm70OJGQ
	 EaXy4FHIS+KRi1FJVl/+/ki1PFNlYI+L94o1a4PXidB7CLtJHah064eMuRB7TnF9Sn
	 zSVrgwJpa5IYxh529Zv+tESKXFpz0iB5F3YffV1a2+e2OIlkICAlSFu3c6Yk+Vy9C1
	 QYsZULg6HZeY88K9sn8kqmDpsg1TBRokkAVgr4yBtj4fBmrwyztHVCG62TypXZryl2
	 n0TTXBo5fkXiw==
Date: Fri, 18 Sep 2026 01:16:03 +0200
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: astian <astian@memeware.net>, linux-man <linux-man@vger.kernel.org>
Subject: Re: [PATCH] man/man5/proc_ioports.5: wfix
Message-ID: <aqx0jpX2tlKCsvNp@devuan>
References: <aqvVeSW_dHnYbwca@devuan>
 <20260917195829.1380868-1-astian@memeware.net>
 <20260917230917.v4m2hm7mma4k6gdq@illithid>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yzzk4rfbxaq7e6oy"
Content-Disposition: inline
In-Reply-To: <20260917230917.v4m2hm7mma4k6gdq@illithid>


--yzzk4rfbxaq7e6oy
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: astian <astian@memeware.net>, linux-man <linux-man@vger.kernel.org>
Subject: Re: [PATCH] man/man5/proc_ioports.5: wfix
Message-ID: <aqx0jpX2tlKCsvNp@devuan>
References: <aqvVeSW_dHnYbwca@devuan>
 <20260917195829.1380868-1-astian@memeware.net>
 <20260917230917.v4m2hm7mma4k6gdq@illithid>
MIME-Version: 1.0
In-Reply-To: <20260917230917.v4m2hm7mma4k6gdq@illithid>

Hi Branden,

> Date: 2026-09-17 18:09:17-0500
> From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
>
> At 2026-09-17T19:58:16+0000, astian wrote:
> > Signed-off-by: astian <astian@memeware.net>
> > ---
> >  man/man5/proc_ioports.5 | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/man/man5/proc_ioports.5 b/man/man5/proc_ioports.5
> > index 10d03f5aae7a..54854755c0a3 100644
> > --- a/man/man5/proc_ioports.5
> > +++ b/man/man5/proc_ioports.5
> > @@ -10,7 +10,7 @@ .SH NAME
> >  .SH DESCRIPTION
> >  .TP
> >  .I /proc/ioports
> > -This is a list of currently registered Input-Output port regions that
> > +This is a list of currently registered Input/Output port regions that
> >  are in use.
> >  .SH SEE ALSO
> >  .BR proc (5)
>=20
> There is no reason for "Input" and "Output" to be capitalized here, so
> I'd fix that as well.  I don't know if Alex would insist that change be
> a separate commit.

Being part of the wording fix of how to word I/O, I think it can go in
the same commit.  :)


Have a lovely night!
Alex

>=20
> Regards,
> Branden



--=20
<https://www.alejandro-colomar.es>

--yzzk4rfbxaq7e6oy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqsdLIACgkQ64mZXMKQ
wqm3mBAAmuRFsWj3NfMu81DqcNy+JpJZu05KyZN767zoW07fLuekJAMCqorCjCov
vspKyw18iqDkSe26JWHGLL9w16XY2KqscTi1Ui+6d06FWQxK3qWN5mYEpcegy3O+
kKGg44jbio2WWxKwBpNbJEKgAr1wkwAIQn25cS4N4wxgZHIg9t6xd3Cq1Lkww51b
QeouOHrELmO3hTy3l5ZG9PNvrCybfI/GcRi7IF1xvO5/fkWH3fLtk+AlXgaaLSXI
1o+uxPBXc20kqrhWHLwb1FpyIBge6vcYXAlPXAjbLIlwQIViLOOJHI801gZXndc1
68B6xikSsZY62K+KCEdrWr1DkZrxGR8xSYajfxP4NomDI80AH3jrtz9z8b9x2A3s
G7zowIrtLWF3foLx5vjczHxBFZ+B/I++bNa1flKd3mbQppljI9a/PSDd+UWB6zjG
nNF5PyeyuZu1iWkOzHZQAsE8j/EBhKJl3dzTmwzTQrqw15mb+Ul45gm4dnBgDyM9
4UQnHPxx8nEFurX6Zat3JgaJujytp399GST4h9A5mXtuzVPqxBVhj94cXdskqO7f
qe+MG90LZkresl9VX4UCB3gHLX0w0gmF4FCWH7cwyFw0fBRIu270Rf7KYYB1ghdm
KVBqTuudT+SMwYP/AUuYuJZXta892viRiBKAy1eWOQdh3CAoxXQ=
=Nr3S
-----END PGP SIGNATURE-----

--yzzk4rfbxaq7e6oy--
