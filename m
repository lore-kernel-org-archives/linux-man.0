Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13B83385AC
	for <linux-man@vger.kernel.org>; Sun, 11 Oct 2026 17:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791738791; cv=none; b=JBVlhzj2usVTJkvCmYrsJkE1+etzi6O58fSY+xRN/rRxgcsp3R6XQF8Z6vZCerTvFRt+OmpQRkDxcv4kwJ88Oi7/pOLKhqw2iqj1fntKVDGr1YFCELtiEFE0s/Ft+TwsGD4qMT0zzt3U2H3qPASesFtMz/p96JCinsZ7GZxzzIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791738791; c=relaxed/simple;
	bh=voAZ8lpfLvskfIVBSBIyfTMHXwQVyip+Wy8FrxQzgZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qmpl9/NL/iJU1RZdLowqnpc5nqCJHbl99myE5KReikHJuLTgaBCI0/B5v27mpX6T3Zct0jtfwgbucs/oQNNKMqIv9Qd4urICRMMnVNA+ASKKR+uZaxbWYG4t2hUf/dXQQVMI2sIzCANTs+74ydqnRAYr6j8kpz/66o8FjSczcY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BOuPWinU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BOuPWinU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62DE51F0089B;
	Sun, 11 Oct 2026 17:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791738790;
	bh=JqBdPrD4s3m6A4Aq2OO4eckSZLhXgAFUUPZ652+QJXg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BOuPWinUlQMTPyNABSaa4mUTEPp3g5U6T+OI8ZpYinNGL41cHEt0noyZhzfL0qfzx
	 cver1Bub7ECA/L+Ive88zS1renqxx3VqX0jKpG4W26GaBD/Kgjkt24uiaGb7hPc5Gc
	 YhaHujZIdG5aApHjb926XTuKZSb3XCFtydmuGK6OcF88zPbGhN6B0/1K0Og3fha+1P
	 fEurD1mcERXUp5/BpaRtihPPSlK//+NWTEv1J9saV0IpQZZ0EqvlHxxMEYAg9uLkYQ
	 QedZplAFbbSAUo1vKPQUa8iOcdsptUXTljR2IoUMQZ6qGatK+hAgDxhwTE7DRInbPC
	 24tHPTOhGOvtQ==
Date: Sun, 11 Oct 2026 19:13:06 +0200
From: Alejandro Colomar <alx@kernel.org>
To: astian <astian@memeware.net>
Cc: linux-man <linux-man@vger.kernel.org>
Subject: Re: [PATCH v2] man/man2/ioperm.2: wfix
Message-ID: <asvDg4Aix4UNOin6@debian>
References: <20260917062039.1365378-2-astian@memeware.net>
 <20260917195740.1380709-1-astian@memeware.net>
 <asvDZz1YFHM_Leg3@debian>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zafofquunfq76gbr"
Content-Disposition: inline
In-Reply-To: <asvDZz1YFHM_Leg3@debian>


--zafofquunfq76gbr
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: astian <astian@memeware.net>
Cc: linux-man <linux-man@vger.kernel.org>
Subject: Re: [PATCH v2] man/man2/ioperm.2: wfix
Message-ID: <asvDg4Aix4UNOin6@debian>
References: <20260917062039.1365378-2-astian@memeware.net>
 <20260917195740.1380709-1-astian@memeware.net>
 <asvDZz1YFHM_Leg3@debian>
MIME-Version: 1.0
In-Reply-To: <asvDZz1YFHM_Leg3@debian>

> Date: 2026-10-11 19:12:28+0200
> From: Alejandro Colomar <alx@kernel.org>
>
> Hi astian,
>=20
> > Date: 2026-09-17 19:57:28+0000
> > From: astian <astian@memeware.net>
> >
> > Signed-off-by: astian <astian@memeware.net>
> > ---
>=20
> Thanks!  I've applied the patch.

I think I've applied everything from you.  If there's anything else
pending, please let me know.


Cheers,
Alex

>=20
>=20
> Cheers,
> Alex
>=20
> >  man/man2/ioperm.2 | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/man/man2/ioperm.2 b/man/man2/ioperm.2
> > index e4a058164f6f..a0d7bcb1c99b 100644
> > --- a/man/man2/ioperm.2
> > +++ b/man/man2/ioperm.2
> > @@ -4,7 +4,7 @@
> >  .\"
> >  .TH ioperm 2 (date) "Linux man-pages (unreleased)"
> >  .SH NAME
> > -ioperm \- set port input/output permissions
> > +ioperm \- set I/O port permissions
> >  .SH LIBRARY
> >  Standard C library
> >  .RI ( libc ,\~ \-lc )
> > --=20
> > 2.55.0
> >=20
> >=20
>=20
> --=20
> <https://www.alejandro-colomar.es>



--=20
<https://www.alejandro-colomar.es>

--zafofquunfq76gbr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrLw6IACgkQ64mZXMKQ
wqkVBhAAtG8IREiMRX3LBqEJ0kWBAr2X7qAlMa8CR7Ah1HF0KJLgNqzap+dQmZqV
xYUwM966anwkoPcwm8R3VgVf8zA356LDnmnFsZ41VlFTgJ5LEYsTGYJnSqM8iips
tYtSzDJtK+v6Mm80I04eQ6bzF14oDHihWRSW84QqS2iLSKmwhLsCwVUKRj+/YCrM
0Lp7DEGm5J6yQq2d++4jBx9vIjPKKqdAZZchDqvcOdt9sELt28KOzp/l+CN7mV8H
IYVjFCb+gPcYwdb2+Co6lH6nQr1X3C0in/hidxKNcRubkAFOQ0toVjdwX4f4p9sl
cqeuvaRzHnTgLrmwolxKBJauMhhScPJDWNfvFctvXgajRd9gv5CDwmpZq55W0YYd
7nP2uHZUbZmvas5mnzHBH9erfbFCgKaSXR7nbLGViKEPapq9ssJru5+ghUtU/LNY
Hfq1T4PqYlZ+JcQ6wpNnnPXYpGZhGP4VcjABlLg85y07bxWuUmQGfiRT/llHznsV
q7Hnr1xE5C3xdEags1VBiZworaoCpGDr83WfDp6YtwmDqyhUn4OWaecjOWBUqR+o
FJig/AJ4zeju8Y+4Vp8KjqyGdVoCbGGMGJpxwtqJ6hGUcLWSdHZ0fb/64RhlT+Zm
8V0fEP/eEpVVtMlRsw4r1B79eezMOz8ttKBRJ7VQryKaq9dsl+o=
=MPz+
-----END PGP SIGNATURE-----

--zafofquunfq76gbr--
