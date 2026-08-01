Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47048264614
	for <linux-man@vger.kernel.org>; Sat,  1 Aug 2026 00:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785543175; cv=none; b=Az/7rNvMkq5UqTVFrDLWCpFGVcQFv9XHygPmEHxgzMoAzwSRb7rSYG/VbMzNAtS5NkR36M/kANquJK7JUKJZTuZPH5fxe833nhJGu/v6zEGK3YgYwUhTMwyrCHlwUyolvROxfaTT7Vq18nUTc0yOkftTekLIqRrZwZwiQjE8K0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785543175; c=relaxed/simple;
	bh=QXyrGISNU+KPhjgDmbXVQZ+zH+SoHD3n4FJKtvNwqm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VXQJuiYwnPVACF4+mMY5wiJWrT47D7CXID7ycACXBu8FFLsVgCUxgatpJaaybPqYHXYdSsjLmheSMuNxFsUrKgdZv9UqwAvJQJ3mVwgmOeo0z/UbZdSDfCRDSBTUZTDbjZn6nWxzLAzHRVpfslup4ku+MZ+2ajkPVtUbPQUUgsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HjF3SnEB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HjF3SnEB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 738D81F00AC4;
	Sat,  1 Aug 2026 00:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785543174;
	bh=FvoMq5C5Zqwyx/CVh+/50dHFIM+0d6IOfpSBKypnjy4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HjF3SnEB7R/HaHsmCZa2jYSPdyYQzpfxRLDjeFwhj4Ai02Pic9Tt9CDU8olXI79kP
	 vD0bPO/RcnAa7ssOyGNlNunmsF0sxDF83HfVqE+gOmZKc5Z1wV4APpptVoNB1uB+RT
	 gqfevUecD1KZI7lP6eTl0T0T/a9V1ny7ARhnFu1ArRQJjDmaAyj62fTxXzhKbtwMDY
	 KbKexX5lolaQtSeLzuGVJgzsP9iRM8c0ry5ueQkWwJRNJpSgfWhDHO4MeCzLTjUQwC
	 NxivXyinadOQsyEMOgVIvngzT7yJSm4IZzjTcMeZI/R0UXw1DUduCW1z93enE8X2WV
	 hdUoJxO/iBgMQ==
Date: Sat, 1 Aug 2026 02:12:49 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Sam James <sam@gentoo.org>
Cc: Joseph Myers <josmyers@redhat.com>, linux-man@vger.kernel.org, 
	Keith Bostic <keith@bostic.com>, Mark Harris <mark.hsj@gmail.com>, 
	Nevin Liber <nevin@cplusplusguy.com>, JeanHeyd Meneide <phdofthehouse@gmail.com>, 
	Christopher Bazley <chris.bazley.wg14@gmail.com>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Iker Pedrosa <ipedrosa@redhat.com>, "Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, 
	Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, libc-alpha@sourceware.org
Subject: Re: [PATCH 1/2] man/man3/{mem,strn}*(): SYNOPSIS, STANDARDS:
 Document these as provided by <memory.h>
Message-ID: <am04r4by8xhTKNqT@devuan>
References: <cover.1785532392.git.alx@kernel.org>
 <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
 <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
 <am0TUn55P7uNtTTh@devuan>
 <87ik5uesfg.fsf@gentoo.org>
 <am0dFT38yXK_ch_o@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jlaawasc4plsgybm"
Content-Disposition: inline
In-Reply-To: <am0dFT38yXK_ch_o@devuan>


--jlaawasc4plsgybm
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Sam James <sam@gentoo.org>
Cc: Joseph Myers <josmyers@redhat.com>, linux-man@vger.kernel.org, 
	Keith Bostic <keith@bostic.com>, Mark Harris <mark.hsj@gmail.com>, 
	Nevin Liber <nevin@cplusplusguy.com>, JeanHeyd Meneide <phdofthehouse@gmail.com>, 
	Christopher Bazley <chris.bazley.wg14@gmail.com>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Iker Pedrosa <ipedrosa@redhat.com>, "Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, 
	Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, libc-alpha@sourceware.org
Subject: Re: [PATCH 1/2] man/man3/{mem,strn}*(): SYNOPSIS, STANDARDS:
 Document these as provided by <memory.h>
Message-ID: <am04r4by8xhTKNqT@devuan>
References: <cover.1785532392.git.alx@kernel.org>
 <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
 <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
 <am0TUn55P7uNtTTh@devuan>
 <87ik5uesfg.fsf@gentoo.org>
 <am0dFT38yXK_ch_o@devuan>
MIME-Version: 1.0
In-Reply-To: <am0dFT38yXK_ch_o@devuan>

Hi Sam,

> Date: 2026-08-01 00:19:03+0200
> From: Alejandro Colomar <alx@kernel.org>
>
> > Date: 2026-07-31 22:54:27+0100
> > From: Sam James <sam@gentoo.org>
> >
[...]
> > People want it to reflect what the standard says.
>=20
> And it still does.

Hmmm, this has implications.  The functions that are non-standard, can
be changed as of now, because, well, there's no standard saying
otherwise.

Maybe that's a good move.  A commit now changing the following functions
the be documented as provided by <memory.h>, without any mentions to
<string.h>, simply because there's no standard mandating otherwise:

	-  strndupa(3)
	-  mempcpy(3)
	-  memrchr(3)
	-  memmem(3)
	-  memfrob(3)

Which is a nice introduction for this header file.

Then we can leave discussion of the standard functions for later.
If what the standard says is the problem, let's focus on what it doesn't
say.


Cheers,
Alex

--=20
<https://www.alejandro-colomar.es>

--jlaawasc4plsgybm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmptOgEACgkQ64mZXMKQ
wqnmOxAApec0DbaIVOm9AwskYWWUbsv6eMlTwOsWA/E6U0bPZ1XL+Y7PwiqdTXAX
OnY9VCGrDJpNn0krZ4y7qSURtTRdf0Bz8mMKIjv4JR/2v8fUhsKsuMENj49QMpMr
JLu4g+XCIu0qcDmdfJfVHuzQaIg1ekei748Ge3N5ychFPiZS8shtMmksfpK9GXib
CMAb+hPTLJrkn6Q3xw+w744LxQQgYsy0IBDx16aEHLGDJF1+4BHM4BASsHyJW+3G
+ORvyuNcKE28S9eZ/vOeM/hW7snyhaiH2IsftGwA/17xHlyd5zMHRnuBcSL6St3e
3syXMm3/Cf36y31Mo6Jg5V94bGC6GRlxx6hmd5BF4V1eu2esjccG+GJgOmwWz8BL
TZNpu5h2B4qEqVPqShlXSOHGsIZY07hOquwvaWJbVQAjQ3m5SeQInbgTrXV7cd5A
/MMRt9c7/Z64CKvJwyebh7hXdo/Rk2lp45QBaN2f8jNPJt//Y7wta/FtdSIyngLm
9Tv0cX6bsEtptxT1FfytB33R2wVG0VZp6GJiWO7tL4w9KKJD2zf/XhnlIz2mQETD
NUnoi2PY1UOld4uQUCXKn/ivyNMHW5/AqjiZqL5qXuyYl425DR0Atgp1kKqBdnLQ
at5Hzyk/Ihj736UMFB6TQPKHrf7hjvdNybvtSvElVvY026gc6Aw=
=KmvV
-----END PGP SIGNATURE-----

--jlaawasc4plsgybm--
