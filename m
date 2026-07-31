Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3700825F7B9
	for <linux-man@vger.kernel.org>; Fri, 31 Jul 2026 22:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785536500; cv=none; b=O4PU17q3QvWbtGiGnWJAIsXKRtueSxD9QqUOXul1hBydbz4+MbUgdrdIHpUZIo9HfB05hFvuxOrbL4fSR8rOXm4HUnxpyvEK6rLRtUwk4Tckoh8UgtToCx2bsmgrbVl2GsjD5RXuSTpB4mJYA2q2i39aVAFUbCTwUdBW+l36DD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785536500; c=relaxed/simple;
	bh=abvZPl1Fe8Yfavd07Nb3WPbASojKmzDeHWqu1LEdlOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UjVHE8wf4SKZ2ByNHiv8Z25NsdAqK0pQsXdleKX1DUIzQyZ7/HYE+6ShUhlAmvycVE0sdM65M87qGtMi+vXbFFR4nX8upPl2ecX2l0pO74oV/VF0W99pyrs7YsOX1/ulHuhqJZFTP1OnqD+M4KvN9WgJdsDmmVdXh6k6LCVJ3Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F5ea60ot; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F5ea60ot"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29FC61F00AC4;
	Fri, 31 Jul 2026 22:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785536498;
	bh=e9vgyys2IdcEZybb8ncsBPw9GVWxOnMQtzTobLD28rs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F5ea60ot7U09zD8jVVdix0qKdPVWl+K9E7d17x4WXpaBaZs7uLig20HpCu9rYoTTb
	 4qtVXAD3eu9+d1YqFOeQWzaWXTuXUUC5AcXwwasfREdJR8d/txXyMDdiGnklEZMxOd
	 fRnDXk6vk60omx6CNAFrWnxGe11Lc0BWgvpPccu35romct6BcYPWCS35LcLdUde9pn
	 EsG+Rx1GnstyPL131CJo+BwVFJ3qrcLU7xT+GDBSuKF8jSGZGQjYRGBWHjl6I96mdb
	 XpodvXTReeH2xhAhdFcxKcoiyOT2DyWC346uMR3Lq5L1ZX6ob1kHK4AtX9L83C7zUF
	 5pq0z1eR7c3tw==
Date: Sat, 1 Aug 2026 00:21:34 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Joseph Myers <josmyers@redhat.com>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	linux-man@vger.kernel.org, Keith Bostic <keith@bostic.com>, 
	Mark Harris <mark.hsj@gmail.com>, Nevin Liber <nevin@cplusplusguy.com>, 
	JeanHeyd Meneide <phdofthehouse@gmail.com>, Christopher Bazley <chris.bazley.wg14@gmail.com>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Iker Pedrosa <ipedrosa@redhat.com>, 
	"Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org
Subject: Re: on the irresponsibility of pursuing C language reform (was:
 [PATCH 1/2] man/man3/{mem,strn}*(): SYNOPSIS, STANDARDS: Document these as
 provided by <memory.h>)
Message-ID: <am0fnb4BMRrTajqx@devuan>
References: <cover.1785532392.git.alx@kernel.org>
 <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
 <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
 <20260731215122.4p4aepsbgeoibx74@illithid>
 <89c9b877-54a8-6a7c-016d-51e4be210ad6@redhat.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="anj7cbhvpfwzxela"
Content-Disposition: inline
In-Reply-To: <89c9b877-54a8-6a7c-016d-51e4be210ad6@redhat.com>


--anj7cbhvpfwzxela
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Joseph Myers <josmyers@redhat.com>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	linux-man@vger.kernel.org, Keith Bostic <keith@bostic.com>, 
	Mark Harris <mark.hsj@gmail.com>, Nevin Liber <nevin@cplusplusguy.com>, 
	JeanHeyd Meneide <phdofthehouse@gmail.com>, Christopher Bazley <chris.bazley.wg14@gmail.com>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Iker Pedrosa <ipedrosa@redhat.com>, 
	"Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org
Subject: Re: on the irresponsibility of pursuing C language reform (was:
 [PATCH 1/2] man/man3/{mem,strn}*(): SYNOPSIS, STANDARDS: Document these as
 provided by <memory.h>)
Message-ID: <am0fnb4BMRrTajqx@devuan>
References: <cover.1785532392.git.alx@kernel.org>
 <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
 <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
 <20260731215122.4p4aepsbgeoibx74@illithid>
 <89c9b877-54a8-6a7c-016d-51e4be210ad6@redhat.com>
MIME-Version: 1.0
In-Reply-To: <89c9b877-54a8-6a7c-016d-51e4be210ad6@redhat.com>

Hi Joseph,

> Date: 2026-07-31 22:10:13+0000
> From: Joseph Myers <josmyers@redhat.com>
>
> On Fri, 31 Jul 2026, G. Branden Robinson wrote:
>=20
> > More to the point: what's a better forum for pursuing this attempt at
> > reform that will both (a) reach a significant population of stakeholders
> > who can variously red-team it and/or endorse it; and (b) has sufficient
> > visibility that it can't easily be ignored by people who oppose reform
> > in this area for whatever reason?
>=20
> man-pages should document the world of C APIs as it is, in a way that has=
=20
> broad community agreement; it should follow, not lead, on any changes.
>=20
> When an API has been in <string.h> since 1989, that means documenting=20
> <string.h> as the main location for that API - not some other location on=
e=20
> person thinks is better and that most of the community has never heard of.

FWIW, the APIs have been in <memory.h> since 1986 in 4.3BSD, and in
System V they go back further to 1983.


Have a lovely night!
Alex

--=20
<https://www.alejandro-colomar.es>

--anj7cbhvpfwzxela
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmptH+0ACgkQ64mZXMKQ
wqm7iBAAjosuxbPLweaHRwfIKHG7aR4a8C9E6WI/MfMgSGdb0I72zCkFUsHWyLoI
XMTpU99KKB2WBJkpf4dpgrxc50TyTCrJMmtmvWMf+SKvXVJ5BD0kDP0PqpQsgZv8
wk3T9AMr/V63ODNJ4H3IzE9dsdUoIDLJv3eACZTmkUsAmUfDhu2P6nKyf/UFcMzS
fd82X6BK4ggovt6Tz00dMqaBcihS+h38pyGcgxbHcil5ohdm4fE0gDwhC80S9WHT
ZpFFMDod5osTBrRyBkMbqgbi6oGFgbIdamYFPSomlJVp7x5Jasf7PYFCeGyvYGLU
RzX5MTn+KpMWgR0fBTBe65+qnlHSyNjbmhuEiPQouibcgoxr32I99OPFIWsGa4lW
U52GgzjEZG6cyooIwuqCQ+h3DJNKHxO8dzopVqQrPTQalIhO+i0A4U9RAlzzr5T1
jJ76/1SAKZJfpanDF7jJ3Mx5bb6LM6nEUhYvCyypK6gtRQ76oomoCtKHW4xDALfI
bD9Di4LBimTLINplnEHuRotAsL+/JtyJVsQY2t+0sluCrb8n31YovqS0pDyvW81D
vbajvjvrfCcdltaGuj/XPKr9RNr/BK466sSEIE1Wj9clRH35cgWStxPrNiF7GNKa
ve1K9MLSFfy1IBo49UNQzZPMPY16OzJwJCl7uqHn8Lql16dTZEA=
=aQCH
-----END PGP SIGNATURE-----

--anj7cbhvpfwzxela--
