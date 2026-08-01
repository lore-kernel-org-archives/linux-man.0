Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B4A2F28EA
	for <linux-man@vger.kernel.org>; Sat,  1 Aug 2026 23:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785627275; cv=none; b=shhyGU2vOliUU8/c2DcfKxsYtSgNfKyu1kBY8UV+6hoqxsQ5TIYInmZO+EBgQAVruabTNR1BpRB2WDsWfALzISoY9SMtjvXEqIbjxzj5I2HJMnWIthIaoMPGjCqyDjUf0Ve4ZWNXYDtQ7vV584UZaLGKMcadRskFPgCBfxJhueE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785627275; c=relaxed/simple;
	bh=smv70eWO4ITVSXWi6ziIjvQGv8OWn+Gy1unYIdMsMIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ued2A2tIu6RlYV9xY3V96OSQaBAK8Tmr10bkNSHsifj1Lz+03+DU1jmqmpCZwhXLE6zY3NxLmVDM53MkMEzzAT9fq8X76IDt51y8JznpyG3r4szgM6L+jRiRNbEW0stxtzkqHxXuWaZqV/L8n7DgIIoYLVhGA7fS0Se7ewriM4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=acQhkdwN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="acQhkdwN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C43C1F00AC4;
	Sat,  1 Aug 2026 23:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785627273;
	bh=OaKOLvFbZd+mLtdNH4g+NsQ6JWiaOiHIQfYBL22/Syw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=acQhkdwNFtitrmi5L1ZgIXK9lAu2fEcRPa+ZTe45CbfdqKIipshDc8ETjqsF5JIDd
	 OdWSpEXzZsgbdmjZWm04zTUdsmaMZICF9vM0uGOoC+ikh5VEjEu5PY+PO+iIaKqeh2
	 n36xDrRz5+Carz/Rqha+2xBDE+F+Z31J3pe3jK7ex/rzvIc56kjhA7irIjF4+Mj8ps
	 nOekpC7BNx0ZjBmU0/rkxxvvybnjJPLP6VoFgIVmO0Hr7vUarRTCBK6hR2avM+YicE
	 yW1zjA1pgiFDzL5nJVFh/u7NNxJxhVs77ZSyQ1vXSVE89SC11gc8GVFTPC21HvkJa2
	 jt0f0xUEBzC7A==
Date: Sun, 2 Aug 2026 01:34:28 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Collin Funk <collin.funk1@gmail.com>
Cc: Bruno Haible <bruno@clisp.org>, linux-man@vger.kernel.org, 
	Sam James <sam@gentoo.org>, "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	Joseph Myers <josmyers@redhat.com>, Keith Bostic <keith@bostic.com>, 
	Mark Harris <mark.hsj@gmail.com>, Nevin Liber <nevin@cplusplusguy.com>, 
	JeanHeyd Meneide <phdofthehouse@gmail.com>, Christopher Bazley <chris.bazley.wg14@gmail.com>, 
	Serge Hallyn <serge@hallyn.com>, Iker Pedrosa <ipedrosa@redhat.com>, Evgeny Grin <k2k@drgrin.dev>, 
	Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, libc-alpha@sourceware.org
Subject: Re: [PATCH v2] man/man3/mem*(): SYNOPSIS: Document non-standard
 mem*() functions as provided by <memory.h>
Message-ID: <am6Bzu98mVTgO1Qv@devuan>
References: <cover.1785532392.git.alx@kernel.org>
 <3556566.BddDVKsqQX@cagnes>
 <am50AM0bdufHa9W3@devuan>
 <15288158.RDIVbhacDa@cagnes>
 <am56ZBzNM5J07AUa@devuan>
 <87ik5ts9r9.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="67qw2vvqfgxjjh2t"
Content-Disposition: inline
In-Reply-To: <87ik5ts9r9.fsf@gmail.com>


--67qw2vvqfgxjjh2t
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Collin Funk <collin.funk1@gmail.com>
Cc: Bruno Haible <bruno@clisp.org>, linux-man@vger.kernel.org, 
	Sam James <sam@gentoo.org>, "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	Joseph Myers <josmyers@redhat.com>, Keith Bostic <keith@bostic.com>, 
	Mark Harris <mark.hsj@gmail.com>, Nevin Liber <nevin@cplusplusguy.com>, 
	JeanHeyd Meneide <phdofthehouse@gmail.com>, Christopher Bazley <chris.bazley.wg14@gmail.com>, 
	Serge Hallyn <serge@hallyn.com>, Iker Pedrosa <ipedrosa@redhat.com>, Evgeny Grin <k2k@drgrin.dev>, 
	Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, libc-alpha@sourceware.org
Subject: Re: [PATCH v2] man/man3/mem*(): SYNOPSIS: Document non-standard
 mem*() functions as provided by <memory.h>
Message-ID: <am6Bzu98mVTgO1Qv@devuan>
References: <cover.1785532392.git.alx@kernel.org>
 <3556566.BddDVKsqQX@cagnes>
 <am50AM0bdufHa9W3@devuan>
 <15288158.RDIVbhacDa@cagnes>
 <am56ZBzNM5J07AUa@devuan>
 <87ik5ts9r9.fsf@gmail.com>
MIME-Version: 1.0
In-Reply-To: <87ik5ts9r9.fsf@gmail.com>

Hi Collin,

> Date: 2026-08-01 16:26:18-0700
> From: Collin Funk <collin.funk1@gmail.com>
>
> Alejandro Colomar <alx@kernel.org> writes:
>=20
> >> Still, for the next 10 years, C programmers would debate whether they =
should
> >> #include <string.h> or #include <memory.h>. Different C programmers in=
 the
> >> same team will have different personal opinions. Thus, programmer team=
 leads
> >> will have to establish coding styles/guidelines which say which header=
 to
> >> include in this case.
> >
> > I find that an acceptable result.
>=20
> But you aren't the only one who uses or references the man pages. From
> this thread, many people are not happy with the change.
>=20
> > #include's aren't that important. When reading code, the section of
> > #include's is unimportant as long as it works.
>=20
> In this case they won't "always work", hence your request that gnulib
> and illumos make changes to accommodate your preferences.

I've now carefully documented that gnulib and Illumos don't provide this
header.  Thanks!


Have a lovely night!
Alex

--=20
<https://www.alejandro-colomar.es>

--67qw2vvqfgxjjh2t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpugoQACgkQ64mZXMKQ
wqkMfQ//VrELPo5bM/U3mp+uYxFfyhpw0zhZX4rjnetaBw7LOegaSCXIacodoYoB
rd6jU4pat10Sm9dfR21qluEmXKSM7z27bFLNkjOwd0f3cFaidgEL5Kle8Q3YobsF
5Hrsc6f8SD3qmBKl7VopQkHoG0TB0z+EZmureAV11EW7uQwiycFeyTP3ODRTfG5o
cP5uZL2NtqcuedRX7lcHPBbaJr5HAWUUkVJlqtOXtZ3Uc3jV4+tpDBfIhdvwcLmG
hZaqk04bZe84gjXeg0a/dc6CtOFH2Zvg5b8MeZl9T5TyyDTQ/Fnvv/Nukh8JvArS
T26U0i5tBgys/8sgaPPpPkY6bmyGQJx8leQdNCroQjQzoiVGtS8jwKLYOxvuQ/An
WuxqPSw05rx2TmE0pQNkoGi5GLlVMngMQJEoHZsW1AeELmIc96AdSGPcJ+AfshCg
YETZ/GsZO/m82UWXP2BvAekwOFzT/BhKXDCUZqHsE3Kf540yTbRkZ8yTzyFMUMBY
+vG04GBVMgvKp1iwD8OswEsvd41ikTr8W7P7G64AjBc91Iy5vcBs+DrpZS6m0f2h
lCp7EH/qNMzdyeQp4j3u+4BFBNzR/78Pa/7oknsRafmkNJaLNXHyAUM94GoZlOVc
iQutdD4JlsnnsbEV5tAnkPwSJH7gHCNG3lWRI85irE7hVuvZVE0=
=jvTS
-----END PGP SIGNATURE-----

--67qw2vvqfgxjjh2t--
