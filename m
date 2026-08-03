Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026ED2F83B5
	for <linux-man@vger.kernel.org>; Mon,  3 Aug 2026 19:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785786425; cv=none; b=ZMHa6pQKv2Wtz9/SUJw3pk3aPJfDet8j60OZMgzhpixRhHd5+I/I1Ffy1FwCyVEKag65hTKvJ8dOMXgk7bH7XSAqLO2S9VoDkuyKptndMdRvsJZFN89clsuFsh0BmiW7kZZoKSsUkxvW9H+9keL+aFUdcEOy8q/PoPtqvk3BDfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785786425; c=relaxed/simple;
	bh=b+76ez+/tgdvSxR74qGRuxeo8IYWMwMKafvjv4+FutQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PKcgEsncYygdfjJxbDnFTOZFwFld1e6ESw8fRJ8iTGcd/zuESSdnqJnHSIXOrsNBfLfvHuHkeGxWfNKfxp14ULxn25EPMpsftVV1PDwL+RS7j+lRoi1z97t7JTy8jxz5CvtUeWw8Co5G8eravGKLw49a1mgdtX1vWTjx6M5TbvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IRH6/i2c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IRH6/i2c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29AA61F000E9;
	Mon,  3 Aug 2026 19:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785786423;
	bh=XtKEKIt3TkTBWWtJabtgT656SNnfUO6PldGMW8bXnio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IRH6/i2cekL7U/u83CRz/KowkfKWRq51x4fYDaUjpmI4pEdwg5pBp2X9m6N6zKxvx
	 RYdQFbZiPUBKhy6GWwnTWD3HvcytGh3bAY1HyUbPlEvmwSB2MGIrdV5Vx2t9BjKvaz
	 zlQ3XCahSRUQuFPLhrvIk/jpu6q2V7GhRPyrQKPGhSTEUzQjBNPl2UIfB9yvwpo0W0
	 IbHLhJGtq8WOCHHRO2vybcvDrELfd1beU5qU04xN9l2LA1hhiDuIOMVLpBOrXQkE7i
	 LAyW6bX79E0HuH35zl7Bu7ZlVXvKKLGpFQltcPrJySDxoX/SA4OB9M9DSK9yKD+mdo
	 mM9rTxl09sWpQ==
Date: Mon, 3 Aug 2026 21:47:00 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Joseph Myers <josmyers@redhat.com>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, 
	Collin Funk <collin.funk1@gmail.com>, "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org
Subject: Re: the Linux man-pages as an educational tool
Message-ID: <anDuf9i_NyYjvPie@devuan>
References: <am56ZBzNM5J07AUa@devuan>
 <f3f50282-8f40-449b-87c2-5df85fbfdc4e@cs.ucla.edu>
 <am6CnOddgaM10pry@devuan>
 <20260802000833.zpu27l7ibvrbouna@illithid>
 <am6PkypxYg-Fq4Iz@devuan>
 <87cxw1s58a.fsf@gmail.com>
 <am6X32HkGdm2xTd7@devuan>
 <alpine.DEB.2.21.2608022219530.55540@angie.orcam.me.uk>
 <am-2d02e1qq78Asv@devuan>
 <e286f321-28bd-4085-7fb8-20d103cb21a2@redhat.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rinfocppc5bsqgpr"
Content-Disposition: inline
In-Reply-To: <e286f321-28bd-4085-7fb8-20d103cb21a2@redhat.com>


--rinfocppc5bsqgpr
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Joseph Myers <josmyers@redhat.com>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, 
	Collin Funk <collin.funk1@gmail.com>, "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org
Subject: Re: the Linux man-pages as an educational tool
Message-ID: <anDuf9i_NyYjvPie@devuan>
References: <am56ZBzNM5J07AUa@devuan>
 <f3f50282-8f40-449b-87c2-5df85fbfdc4e@cs.ucla.edu>
 <am6CnOddgaM10pry@devuan>
 <20260802000833.zpu27l7ibvrbouna@illithid>
 <am6PkypxYg-Fq4Iz@devuan>
 <87cxw1s58a.fsf@gmail.com>
 <am6X32HkGdm2xTd7@devuan>
 <alpine.DEB.2.21.2608022219530.55540@angie.orcam.me.uk>
 <am-2d02e1qq78Asv@devuan>
 <e286f321-28bd-4085-7fb8-20d103cb21a2@redhat.com>
MIME-Version: 1.0
In-Reply-To: <e286f321-28bd-4085-7fb8-20d103cb21a2@redhat.com>

Hi Joseph,

> Date: 2026-08-03 19:31:19+0000
> From: Joseph Myers <josmyers@redhat.com>
>
> On Sun, 2 Aug 2026, Alejandro Colomar wrote:
>=20
> > If <string.h> was described as providing functions that exclusively
> > handle strings, then programmers that only need to handle strings would
> > naturally self-limit to functions from this header file.
>=20
> A one-line change to the description of <string.h> in the C standard, fro=
m=20
> "String handling" to "String and memory utilities" or similar, to make=20
> clear it's *not* (and never has been) exclusively handling strings, might=
=20
> well make sense.  That's all the change that I think makes sense in this=
=20
> area.

Please propose it.  I'd likely vote for it; it can be a positive change.

It certainly wouldn't be a one-line change, given that you'd also have
to change things like '7.28.1  String function conventions', and quite
a few others, but yeah, I get and support your idea.

I believe adding <memory.h> can be even better than that, but at least
your proposal is in the good direction.

As I said in my last message to Sam, if the currnt man-pages change
proves to be problematic contrary to my expectations, I will revisit
this and revert the documentation change.

We can also improve the wording in the meantime if the current man-pages
text is sub-optimal.


Have a lovely day!
Alex

--=20
<https://www.alejandro-colomar.es>

--rinfocppc5bsqgpr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpw8DMACgkQ64mZXMKQ
wqm+/A//WjocKPsYb8WIWT6vu6l/z/xoeYq34/cTwJxp3tLq1QDwbA1ipsi1wDe/
+7sA3Rb7bxsf7B+wP0I0fjERrUl+6krrWM2Va1OgR4jX6gO3KUhW9qmZCiwI7boR
MLUy+AgetOlRa6VJs9tCrZ2M+JPyQifjcYSZYh+tZ/e9aHVe0xCxUGiVTxPzCBSC
608hOAyoL/Jp800qxmmK/6gRuS8T/u6A4yp6qcOUPrChM/ka63FshwyvhJtjGMYt
cqxg90jSRjcoaQpy6NAddmqDrF8572/AO4UxVG72uCCgO6kOAv4dcFPLC51qaIjD
+TGm+rYI5+JHeuWvtj7HqFScNSMLyqrZMzb8r1+qcL5hMP5n6vbEXSyACEHJ4wTr
oMDwpsjws9XZuF2laGMvFqx7HT/IsEd4kqyXj5pgovEcilEGGiehkdhMlDX9AaDb
blDyo/Hu9ajp1CUtP0V0QNdPwLH26IllXZo4bNbzSuxbHJV0rRstIWHL1BixMZK4
Ts+ahsnXc+33YtcWMwYZQAI63arF32PXMQfHrkmQHsazeUJGGigLc2QJ8/0gGFnL
Eq71n9Y6rKqlZfWxw8Qzt1C2h4CykZ1aemtIeJOYSxNHPBlJfdJuBkVm11Tammkq
VTWk8Jkf3kyw4JFUOfciPWD0rv5M+5KidcidCtYFgTZdQ5xnnYI=
=M8Be
-----END PGP SIGNATURE-----

--rinfocppc5bsqgpr--
