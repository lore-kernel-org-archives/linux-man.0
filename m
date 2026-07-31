Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BFD48989D
	for <linux-man@vger.kernel.org>; Fri, 31 Jul 2026 23:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785541958; cv=none; b=ItdbOf0/v/kvuBRpmjzU/Gr+gvotzipM9McmZOVwekW+cjU7EcYYYOYqEcMABgMEKARuTjzrtYmuXjT4k4X22eN+BhoKZDwxj6m2VZIxPsvxpa7BOl+BNDDA//j4VUCKs2dHjtRMrINUrk18nM1lj5ZDNdEH2SG5lJzQf9eE+fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785541958; c=relaxed/simple;
	bh=Oyk4SPIP/M45+b3LzfANMfmCa7xmqFCJG+gv4AH2aUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ic44a6Y/SVGYvyXNQKV4w1UOOSBMCsTQkbFCOGRCbgB5zYQQXELy4v1lIClSQShDguB1/8yj3VyGPdWU8LnnsFS3cjFj+cIpGb7+yOd8SByJ+xILyVqJcWu94FmOcrQvDlZDbtVpF3WCDQBrf5JnRgWZLqiTU1smP+s2HPwkDCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PcQ0HIcD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PcQ0HIcD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F7BC1F00AC4;
	Fri, 31 Jul 2026 23:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785541957;
	bh=uRPLkw8BGIeMGH5dLURg6NYiqur6xM5UdMPyc1yasio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PcQ0HIcDagqi7o6Eb7QAMtykmveBuFYgMglY+HWuX+Ab0rGifl0ONE6WoEsHWw669
	 HiZ0IcsRRy53+Bynd0IxQuK7YsQrlks3eIYnQuCBCaclTvp4OAgmLlV5kFJGYxoGXc
	 nZ5GsKYbx8SDIZZ/3tUPX+j2Fq5n9YFtf0N7S4xgLX2L64ntJIu3GJgCKn0pKsn240
	 4Z39I8y7qFhT887qyI8uZLok+snJMntTA69qunHtQ/m4CJAu2Tmaqc2fS88edbt333
	 L7u0qfbpEFlgXEX2vOe1i+GW/U5ywq5UXhS3OQVFaXnXQIudmxHgKq4d0iMKwipzov
	 YTlbWK7ONA6OQ==
Date: Sat, 1 Aug 2026 01:52:32 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Collin Funk <collin.funk1@gmail.com>
Cc: Joseph Myers <josmyers@redhat.com>, linux-man@vger.kernel.org, 
	Keith Bostic <keith@bostic.com>, Mark Harris <mark.hsj@gmail.com>, 
	Nevin Liber <nevin@cplusplusguy.com>, JeanHeyd Meneide <phdofthehouse@gmail.com>, 
	Christopher Bazley <chris.bazley.wg14@gmail.com>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Iker Pedrosa <ipedrosa@redhat.com>, "Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, 
	Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, libc-alpha@sourceware.org
Subject: Re: [PATCH 1/2] man/man3/{mem, strn}*(): SYNOPSIS, STANDARDS:
 Document these as provided by <memory.h>
Message-ID: <am01KjWKubOohd5r@devuan>
References: <cover.1785532392.git.alx@kernel.org>
 <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
 <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
 <m15x1u7max.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qgltpxcnmtcjiffe"
Content-Disposition: inline
In-Reply-To: <m15x1u7max.fsf@gmail.com>


--qgltpxcnmtcjiffe
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Collin Funk <collin.funk1@gmail.com>
Cc: Joseph Myers <josmyers@redhat.com>, linux-man@vger.kernel.org, 
	Keith Bostic <keith@bostic.com>, Mark Harris <mark.hsj@gmail.com>, 
	Nevin Liber <nevin@cplusplusguy.com>, JeanHeyd Meneide <phdofthehouse@gmail.com>, 
	Christopher Bazley <chris.bazley.wg14@gmail.com>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Iker Pedrosa <ipedrosa@redhat.com>, "Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, 
	Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, libc-alpha@sourceware.org
Subject: Re: [PATCH 1/2] man/man3/{mem, strn}*(): SYNOPSIS, STANDARDS:
 Document these as provided by <memory.h>
Message-ID: <am01KjWKubOohd5r@devuan>
References: <cover.1785532392.git.alx@kernel.org>
 <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
 <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
 <m15x1u7max.fsf@gmail.com>
MIME-Version: 1.0
In-Reply-To: <m15x1u7max.fsf@gmail.com>

Hi Collin,

> Date: 2026-07-31 16:48:38-0700
> From: Collin Funk <collin.funk1@gmail.com>
>
> Joseph Myers <josmyers@redhat.com> writes:
>=20
> > I'd rather we add a mandatory deprecation warning to memory.h in glibc.
>=20
> I would be for this change, and am surprised it has not already been
> done, to honest. The use of memory.h is a good indicator code hasn't
> been touched since the 80s.

Or that it has been touched in 2026.  :)


Cheers,
Alex

>=20
> Collin

--=20
<https://www.alejandro-colomar.es>

--qgltpxcnmtcjiffe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmptNT8ACgkQ64mZXMKQ
wqlWeQ/9FHEPqGFvFE6RgX8DZU3FVVHs4PKMI1PI/7PqMagExQRLKwyKY4feMGTu
zdCJOb4ViIxp6OniQWRGEaKVXXW1mgarfYTwBzN98JWavlPEEfvqWQbU6Ebiruh5
N2Ze7BXiXcAJFFAO+RZ536yJ4oxQSZAyDi2qqrn9L6EFAO/uCih9HSDfNEvbRy39
g5s3FHlZx6MArwmWiZqoa8fa8cbNkn02+amcD79TjI6n5Se/wRJI4ptBz/jcmsXV
/cLz+IL/WVZ9OMobEtvkZBntOqa46sVZWvgItMyxBVofdtns1SohOu/QofdTajWK
ANA7DKC6zqt87vHd5h46DWeQQyURoaqB5x245i1NmtbfGHQw6N/BAPSO9CSYWywr
1sybd2Be+8v4uItSyhGsBRckMLTwgCDJCd8vnAdVuA6jEsepRQrJGQQJhmmYuEbf
WIK2UYQkiX1c4N+amhKZlBGhSCb11lz7eWACAKg0lN4ho4H3gfDefTBa0uxAp60D
wLgX/MhgmO3wlfMvuLsqqQWZSLokEzcGSedn9CBCLQDjrzSszVj8o3B6jTixKGVi
VHpwvYvQxlh6gm1C6GNqY6npNQMV1vrl/4yH2A9sMk5TVk6M5BzpofVv199RNskN
cdIacXriDn/2WrprYd8v/gnerhl1SLalYXbWJw/M0wgowUX3bO4=
=WMA7
-----END PGP SIGNATURE-----

--qgltpxcnmtcjiffe--
