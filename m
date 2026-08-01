Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8693D23D7F4
	for <linux-man@vger.kernel.org>; Sat,  1 Aug 2026 23:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785626675; cv=none; b=HOvVcfPTZF9XAKunU7ilWyFNg4Gz3c0wl6GXBGtBkH/7tBtZxonjgd4koroe4dt/lK/x/HqRIIiyJep0Sn6ijOcAQltxCnK5H57MSJBlQded+lzon4OCvAUmZLJUWC2fdeZrh48OhnHYUQyd14Y2GmMASy0HbjcfZnOh40jjSdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785626675; c=relaxed/simple;
	bh=pBovAh84lH9MMe2Lp4+D6e7zrG3FJagE9wJRutVg6L8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W1OzGBo9+8vlJ9QpzjDIluqqAXwz05ClPOfnD1TuIc8oQxyZ7HLznuRbQ7mXT9g2UP/NYLPZW/pRYfDjZOtKVEwOJr0pRpp5jgSk6W801w2neY+8WDC9HDkLh5v+04EEFOoC5Y8F8X+a6Rc9rYKBY4uOr467Gp6oOcxpYMkwZrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vfj7hHdi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vfj7hHdi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ED151F00AC4;
	Sat,  1 Aug 2026 23:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785626674;
	bh=JxbPyP3oYrXwaQ3VMg7kntAJw4Lb+PvDEXrCuFNMdMI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Vfj7hHdiAOASobOgdrW+bVxT0ZHeQDD86ecSkYl2GIHTxyMRd23LPIZNJre2Hvovf
	 VpPA8FU5jSmT7M2A1+9TRYltAKt3b4xGLCXZCPFOTIXSHIXGQged2KJ04C+1YjyQFl
	 RVuN7P2Hr7pVc8mCRIbm3h6viWmYI9D4rdz1nn9FxozPhLEUimBo3TWTbF29xPyCE9
	 hz7seRhxH213whlHx/UwycwDzPZ0e47cf2GuPvaJAnzzoPxUpEGcf3pPsyzYMdwx17
	 ufgfYftvkSh3Xa2Hv/yfBK0+kbc5z2l5YzlUd8s0Lx4IQ8y5BgVsYWCx4QwRBm40mf
	 WSs+mn/zKwbrA==
Date: Sun, 2 Aug 2026 01:24:28 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Keith Bostic <keith@bostic.com>
Cc: Sam James <sam@gentoo.org>, 
	"G. Branden Robinson" <g.branden.robinson@gmail.com>, Joseph Myers <josmyers@redhat.com>, linux-man@vger.kernel.org, 
	Mark Harris <mark.hsj@gmail.com>, Nevin Liber <nevin@cplusplusguy.com>, 
	JeanHeyd Meneide <phdofthehouse@gmail.com>, Christopher Bazley <chris.bazley.wg14@gmail.com>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Iker Pedrosa <ipedrosa@redhat.com>, 
	"Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org, Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Subject: Re: on the irresponsibility of pursuing C language reform
Message-ID: <am5_uA4MSujYCS9X@devuan>
References: <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
 <20260731215122.4p4aepsbgeoibx74@illithid>
 <87a4r6es6k.fsf@gentoo.org>
 <am3XeGZyi1Pvr77-@devuan>
 <87y0epdhxp.fsf@gentoo.org>
 <am4GT1OkqNZD9FF9@devuan>
 <87zez5bz49.fsf@gentoo.org>
 <am4jxBOh_VRvhCQw@devuan>
 <CAETFuj2OwoyK9J85r2f0RoXbHbXKA4gQJ=JZ-7=QoqGcMwk0+Q@mail.gmail.com>
 <am51v4KmUmdzM-OT@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t3w6bondjdkqh4v2"
Content-Disposition: inline
In-Reply-To: <am51v4KmUmdzM-OT@devuan>


--t3w6bondjdkqh4v2
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Keith Bostic <keith@bostic.com>
Cc: Sam James <sam@gentoo.org>, 
	"G. Branden Robinson" <g.branden.robinson@gmail.com>, Joseph Myers <josmyers@redhat.com>, linux-man@vger.kernel.org, 
	Mark Harris <mark.hsj@gmail.com>, Nevin Liber <nevin@cplusplusguy.com>, 
	JeanHeyd Meneide <phdofthehouse@gmail.com>, Christopher Bazley <chris.bazley.wg14@gmail.com>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Iker Pedrosa <ipedrosa@redhat.com>, 
	"Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org, Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Subject: Re: on the irresponsibility of pursuing C language reform
Message-ID: <am5_uA4MSujYCS9X@devuan>
References: <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
 <20260731215122.4p4aepsbgeoibx74@illithid>
 <87a4r6es6k.fsf@gentoo.org>
 <am3XeGZyi1Pvr77-@devuan>
 <87y0epdhxp.fsf@gentoo.org>
 <am4GT1OkqNZD9FF9@devuan>
 <87zez5bz49.fsf@gentoo.org>
 <am4jxBOh_VRvhCQw@devuan>
 <CAETFuj2OwoyK9J85r2f0RoXbHbXKA4gQJ=JZ-7=QoqGcMwk0+Q@mail.gmail.com>
 <am51v4KmUmdzM-OT@devuan>
MIME-Version: 1.0
In-Reply-To: <am51v4KmUmdzM-OT@devuan>

Hi Keith,

> Date: 2026-08-02 00:44:46+0200
> From: Alejandro Colomar <alx@kernel.org>
>
[...]
> > Advocating for better usage in the documentation is a different thing, =
and
> > a good thing. The man pages can even go pretty hard, that=E2=80=99s the=
ir job:
> > =E2=80=9CNotice the include file is string.h. That=E2=80=99s an histori=
c accident
> > maintained for compatibility reasons; don=E2=80=99t let that fool you, =
this
> > function doesn=E2=80=99t operate on strings.=E2=80=9D
>=20
[...]
> I should probably expand the NOTES a little bit, to be more clear about
> why we ignore the standard in the SYNOPSIS.

I've put that text in a centralized place, in the memory.h(3head) manual
page:

	$ MANWIDTH=3D64 diffman-git HEAD
	--- HEAD^:man/man3head/memory.h.3
	+++ HEAD:man/man3head/memory.h.3
	@@ -10,6 +10,11 @@ SYNOPSIS
	      #include <memory.h>
	=20
	 DESCRIPTION
	+     These functions are also provided in <string.h>, as speci=E2=80=90
	+     fied by ISO C.  This is a historic accident maintained for
	+     compatibility reasons.  Don=E2=80=99t let that fool you; these
	+     functions don=E2=80=99t necessarily operate on strings.
	+
	    Write
	      bzero(3)
	      memset(3)
	@@ -38,6 +43,19 @@ DESCRIPTION
	      memrchr(3)
	      memmem(3)
	=20
	+STANDARDS
	+     BSD.
	+
	+HISTORY
	+     The <memory.h> header file is the original one which was
	+     added in System V (1983), and was later adopted by 4.3BSD
	+     (1986).  It contained the original mem* functions.
	+
	+     C89 didn=E2=80=99t standardize this header file, and instead
	+     crammed all these functions in <string.h>, resulting in
	+     confusing programmers about the real purpose of these
	+     functions.
	+
	 SEE ALSO
	      string(3), string_copying(7)
	=20

Cheers,
Alex

--=20
<https://www.alejandro-colomar.es>

--t3w6bondjdkqh4v2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpugCsACgkQ64mZXMKQ
wqmsRxAAop9BVkx0F7aSMM8fBE7JFeh4W5fGNOjxupaL4pQBmQCwZCMKMgnN4Cge
l7Rw3z48hJMLjkKqtDZZ8X9Gti4dkMrP/keA4noSZqmD31kUlw+hRO2kK5e45GQ8
Jj+KkP1pum8XIYsNeRw1QwYdn8vGEKgItAGeNIG/4Aq3PptHL1kNDi/E4pXeMHaL
7I/MBJYMPeKpMCx6hJKk7BZsmymslD+STHo0ytkjlNYPknyXvvY0lnA4aTJ5AhSw
oI2BMKQtR6gdG+0Gfff8oglJ9+7cXDkmcYf1IIrDWv6UWBz8CRmdiRkBOD9y9wzO
KWXEgQLeqvp/RrLy3odYyXPy/dIZ+WijuBlyn7vnqONwiCOFeHMzGtCk7yeKl1nX
aKsKX4XL1ZldUZYnzn0PiiJ+hB0y3xiF6UuLWZr5DQP+yuXSJtNXbEMUGvG5tGUp
QeEiechrgi2nmiVm3NzVuicTlmnjF4otjlF1xwT1YEDo8GeBH5wxVChC4bnn6K+V
vsLuQkXMu11Di4NlyFwTYUvfBlMCagdFbK4JCBUDTMgThYpn/qr79IG75AzXHIMc
szL8VEvH99/2juqcDGJ7upTVpLMf2J4mPWMWSNqoHNQ5vletV6rs7ssd26pm4Dt/
RyK/xy0V3atpSarcrzkBMU8wp9JCIUMh3bQjfS1GLcRnPrP6hWk=
=d3mx
-----END PGP SIGNATURE-----

--t3w6bondjdkqh4v2--
