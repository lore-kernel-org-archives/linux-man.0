Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD532F619D
	for <linux-man@vger.kernel.org>; Sun,  2 Aug 2026 23:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785713412; cv=none; b=hBmL3uaQtYJm9yQ5eiUS2dJdmCWpAf0b5qko8WcVAILiVlvIM8BtU/5IXT78Ql5FPMfHNuYohrDzgvL3KBQAu7Mo5ePCgRAWpgBM/3XLo6bM3wY7j8g2gAUzExocOocu2IZmPEV/peRJDhfht4e3tnpFBuxkRBYEL/dLceZrC8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785713412; c=relaxed/simple;
	bh=SKbWmET3GHnIXnvNT1wo3ACdsGAcSPXB99Tqegl0nVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SYE9k3+ddMF0F/wWA7zNGTRYkJaRXZwt8iPJYPCczmV4wHiQ9Ds2kQa/9hWJAWkv1WgYqitE17e1cXFEWhxfmUzheNFelFWnKL6vwR0yZRoaMVUTHfujxybqmtyLIqC2Ie3lJkqGRJRFLDO6/fMD710yjsGqdC/pdPCTGlqdEhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oXTROUoR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oXTROUoR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D2361F000E9;
	Sun,  2 Aug 2026 23:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785713410;
	bh=lJf8RyAyI7Y7my+ipQrZSzBbKFE6cVDnHg8N4JjWqSc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oXTROUoRRqrus8DQdFsvQrLmuf37oTVxp5GDLM1oVcqVRWIbXtcQgI2eHWdRU0Crf
	 ocr4G5PDzdvkICc/DTDYe2ofXVP30N/UMDcJU5jis+QOKPpK68glYDftIqzzhx85wr
	 3PZ6noce1vHFAMmRTdYl68AhqnvImAgOPU0sMpr9Y900AuKt1szwbGIuuw9Osdfuln
	 dg8f2AVf6ayw8i9KzipK/80YxEYSwrrvlSLEV0OPoULLGVwOlMSeLXcM/Q9Znc58+n
	 Fxyfzmk2GN+/rzzEGk0JhQF5BgpKyvPNLzzIabOgC3FXY9GlDSVAv4L6vQKQgNY7Bq
	 0BozpD7fz8YMw==
Date: Mon, 3 Aug 2026 01:30:06 +0200
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Arsen =?utf-8?Q?Arsenovi=C4=87?= <arsen@aarsen.me>, 
	"Maciej W. Rozycki" <macro@orcam.me.uk>, Collin Funk <collin.funk1@gmail.com>, 
	Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org
Subject: Re: the Linux man-pages as an educational tool
Message-ID: <am_SYQV74iczZNax@devuan>
References: <f3f50282-8f40-449b-87c2-5df85fbfdc4e@cs.ucla.edu>
 <am6CnOddgaM10pry@devuan>
 <20260802000833.zpu27l7ibvrbouna@illithid>
 <am6PkypxYg-Fq4Iz@devuan>
 <87cxw1s58a.fsf@gmail.com>
 <am6X32HkGdm2xTd7@devuan>
 <alpine.DEB.2.21.2608022219530.55540@angie.orcam.me.uk>
 <am-2d02e1qq78Asv@devuan>
 <87ik5sunm7.fsf@aarsen.me>
 <20260802231058.o7gud4bd7co2nbhv@illithid>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hlrwzbr6k5hkll7q"
Content-Disposition: inline
In-Reply-To: <20260802231058.o7gud4bd7co2nbhv@illithid>


--hlrwzbr6k5hkll7q
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Arsen =?utf-8?Q?Arsenovi=C4=87?= <arsen@aarsen.me>, 
	"Maciej W. Rozycki" <macro@orcam.me.uk>, Collin Funk <collin.funk1@gmail.com>, 
	Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org
Subject: Re: the Linux man-pages as an educational tool
Message-ID: <am_SYQV74iczZNax@devuan>
References: <f3f50282-8f40-449b-87c2-5df85fbfdc4e@cs.ucla.edu>
 <am6CnOddgaM10pry@devuan>
 <20260802000833.zpu27l7ibvrbouna@illithid>
 <am6PkypxYg-Fq4Iz@devuan>
 <87cxw1s58a.fsf@gmail.com>
 <am6X32HkGdm2xTd7@devuan>
 <alpine.DEB.2.21.2608022219530.55540@angie.orcam.me.uk>
 <am-2d02e1qq78Asv@devuan>
 <87ik5sunm7.fsf@aarsen.me>
 <20260802231058.o7gud4bd7co2nbhv@illithid>
MIME-Version: 1.0
In-Reply-To: <20260802231058.o7gud4bd7co2nbhv@illithid>

Hi Branden,

> Date: 2026-08-02 18:10:58-0500
> From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
>
> At 2026-08-03T01:08:32+0200, Arsen Arsenovi=C4=87 wrote:
> > Alejandro Colomar <alx@kernel.org> writes:
> > > Most programmers can live in the safe bubble of <string.h>: those
> > > functions always require a string as input, and always provide a
> > > string as output.  Plain and simple.  It's difficult to write bugs
> > > when using those.
> > >
> > > That's the rationale.
> >=20
> > I do not follow.
> >=20
> > C has no namespaces, let alone qualified imports.
>=20
> That's true.
>=20
> > The name of a header providing some function is thus inconsequential.
>=20
> Then why not have one official big header file for the whole standard?
>=20
> #include <stdlibc.h>

Heh, curious thing: Plan9 did exactly this (actually, two headers).  :)

	#include <u.h>
	#include <libc.h>

Not that I support that idea, of course.

>=20
> When you answer that to your own satisfaction, I suspect you'll have
> little trouble following Alex's argument.

Indeed.  Thanks!  You've replied in less words than I would have, and
were more clear than I would have been.

> ...which doesn't mean you'll agree with it.
>=20
> Regards,
> Branden


Have a lovely night!
Alex

--=20
<https://www.alejandro-colomar.es>

--hlrwzbr6k5hkll7q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpv0vgACgkQ64mZXMKQ
wqm8rA/+IkdHG5OSmZF5sSk3kqIW0KdhuNHper+rd63nBxPHROkVFwYi3FQpMYtV
Kj94NdVghEDKZpP4GL5FkBaStPJSPqWnHAq1ZFA2CMsneRv2+uC88MBRvgZK8qAQ
zftIau/E3IHywheayU2ZX+HjmG7FdnAnyXM5tUim5dpj/JRxxs4vKNh0RfuBuMfY
wfuEdsVNh2Z+izwxeu/doykPOfyHHrE/iL79cJ9pfdp83FmoHo+wZ8wPmvqFL3LF
XIjPpyzYGrra4juPNR0Qg47VruWuq/LHdAY/f54cbpNxpax05P4RsU6wXMkZpN4e
GLxlT/mwhi7vOx6fZO4uyUSURMa720sCySTvuOYAJ+IFne2HmUkNiMMXzrHO9Enb
XEC7WnbkzvuXzAitHoX7KcpsqgFln5xYbWCyApMHp/YOkhW/gaO/0E+i21SpAFWM
A747CtsxCJvzwdwIqZD50EBqp5r77UBA4mD37u6uy7yRPI8fD1thKXti9qTN1tjc
DtMoAHegICT9gvBY2ErTUTbpeMml6ubkhlE+yOJVfEHrpHH3CC8bqWW+EZ5Nsl3w
k949WE3GBtjTf/p+L0rZp6KEgJ1PCFLkfclcXpCydaJ7hfcndCuokuFuXxoCIuiT
vXRluPLmc9veA0Rm3dVCWcOFoTJAPQBrsK1WUygfqZLboRtMoVA=
=oCnT
-----END PGP SIGNATURE-----

--hlrwzbr6k5hkll7q--
