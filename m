Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0805126056C
	for <linux-man@vger.kernel.org>; Fri, 31 Jul 2026 22:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785537199; cv=none; b=SJWaL/MIbPDi7H9bh2NEE1unSz1UizdxQQnQF3shpxQYPW6MxUIQq/hlvW3cMdoq9HHIIoumTOwYFUtWKaLoufybyE91+A6D7AuKI7s5k17jsqLgwFwDT6A05ZIv+FVNus6mMfh4AhATwIsV+ck9ejq8gBuEkXg2DXEFrcY6kL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785537199; c=relaxed/simple;
	bh=hhjhuSfg19TbGZ+prUqlW0Mzjzzym0guoDJhWfqU87Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TVCbaccNkorvPUf86n1UuOQe0RZGKHGKzuKkDesSs1Rs+dEsVqKpb/9v2fbAiCWsGjyt6uGVBWNBrQTqyGHQ4uY33uohqm4ZUeNk2KHOnC/S+qNaPRrHyZimEshH4gUrm3vmS96DozFJlM067wTYro6A+yVdjlGuTz9PmW16ZNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HnXS5wyc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HnXS5wyc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FC311F00AC4;
	Fri, 31 Jul 2026 22:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785537197;
	bh=+sdKfuKn9MjHcLR5vDgbtYsF+Wmk3XzwtgXUXTJDIH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HnXS5wyc+oKTykCDFCu15v3MNddl7fdmawGUIOhBP3tREhts+At4BPF3xCTAaSV+G
	 97NxaqAyxJ26TFAO5+aM2daHKHfTjkxLcPytf1NQb8wwVUkTuMpCWfL1awvXdO8V8J
	 UcfMuL90O1fYXhtDik5IXwDO4C6fKBTwSWApl8zbd2kuWm99y9XxRIuX21kFIGQJDT
	 2WUkwtsOTG58ZPVVvjqmfYtlHsTnCjvrNbmda9e7aX0j2a95oV9UoW52xL9qjLp7+J
	 pH3Y2n1QaXeQet7EfSa84SxvtnVXpOVhmXZFgitdCXADTtlPdcJBiaZN38aO9L3yZ7
	 a3E9PGJd4aoiA==
Date: Sat, 1 Aug 2026 00:33:12 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Joseph Myers <josmyers@redhat.com>
Cc: linux-man@vger.kernel.org, Keith Bostic <keith@bostic.com>, 
	Mark Harris <mark.hsj@gmail.com>, Nevin Liber <nevin@cplusplusguy.com>, 
	JeanHeyd Meneide <phdofthehouse@gmail.com>, Christopher Bazley <chris.bazley.wg14@gmail.com>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Iker Pedrosa <ipedrosa@redhat.com>, 
	"Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org
Subject: Re: [PATCH 1/2] man/man3/{mem,strn}*(): SYNOPSIS, STANDARDS:
 Document these as provided by <memory.h>
Message-ID: <am0h6_aBF2iEvpu5@devuan>
References: <cover.1785532392.git.alx@kernel.org>
 <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
 <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
 <am0ax4Oe6--0Deco@devuan>
 <5cfbb530-6abc-9fb9-7df0-0b5a6c942325@redhat.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u52srvamseyyv3op"
Content-Disposition: inline
In-Reply-To: <5cfbb530-6abc-9fb9-7df0-0b5a6c942325@redhat.com>


--u52srvamseyyv3op
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Joseph Myers <josmyers@redhat.com>
Cc: linux-man@vger.kernel.org, Keith Bostic <keith@bostic.com>, 
	Mark Harris <mark.hsj@gmail.com>, Nevin Liber <nevin@cplusplusguy.com>, 
	JeanHeyd Meneide <phdofthehouse@gmail.com>, Christopher Bazley <chris.bazley.wg14@gmail.com>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Iker Pedrosa <ipedrosa@redhat.com>, 
	"Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org
Subject: Re: [PATCH 1/2] man/man3/{mem,strn}*(): SYNOPSIS, STANDARDS:
 Document these as provided by <memory.h>
Message-ID: <am0h6_aBF2iEvpu5@devuan>
References: <cover.1785532392.git.alx@kernel.org>
 <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
 <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
 <am0ax4Oe6--0Deco@devuan>
 <5cfbb530-6abc-9fb9-7df0-0b5a6c942325@redhat.com>
MIME-Version: 1.0
In-Reply-To: <5cfbb530-6abc-9fb9-7df0-0b5a6c942325@redhat.com>

Hi Joseph,

> Date: 2026-07-31 22:16:14+0000
> From: Joseph Myers <josmyers@redhat.com>
>
> On Sat, 1 Aug 2026, Alejandro Colomar wrote:
>=20
> > That's 37 years.  During these 37 years we have gathered a lot of
> > experience and data about this.  And the conclusion is that it was
> > a huge mistake.  Programmers have struggled to understand this, and
>=20
> No, there's no such conclusion.  Two functions, strncpy and strncat, are=
=20
> with hindsight confusing (but it's the names and semantics rather than th=
e=20
> header that are confusing).

Those are the most misused, indeed.

>  I don't think there's any kind of community=20
> consensus at all that there's any problem with mem* being in <string.h>,=
=20
> or any functions other than those two.

But it's a consistent solution that keeps all existing functions (thus,
not a breaking change), and puts them in a header file that is
appropriate (and which has been their header since 1986).

> The committee writing C89 had to come up with a compromise between=20
> functions such as memcpy and strchr and functions such as bcopy and index=
=2E =20
> They chose to adopt memcpy and strchr,

This was a good choice.  mem*() were more portable back then.

> and chose to put them in=20
> <string.h>,

This wasn't a good choice.  They were already in <memory.h> in existing
systems.

> and there's no evidence since then to suggest a problem with=20
> either choice.

We disagree.


Cheers,
Alex

--=20
<https://www.alejandro-colomar.es>

--u52srvamseyyv3op
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmptIqMACgkQ64mZXMKQ
wqkgIw//YZrXoP8T3hdgRvd3mLy00t4tYe0KQbAlv06JqfO/5DdRrV6bkX2L+HVM
g1CiVU7OoMBgII4UZVbPWGYFknM/+ednzUzRn6axVKpkw022gmMRnuT751gssH/z
bReFD8XdyWWr1pc/CnPJLoBTnq+imZyJLi91r98lX+IQ58RjO+4Zn84SwpOea7Lc
CIM+UT+qVSVfIgzX7s582qujydRhsFqa/ppY6j5DD0U4iAiIfO8nbAgZknbo2vwp
TjEQdo08uLe6whtuFPn+6NxyZCekK0RP+RfzUSHo/k2IfQyE0opt8vVbGmPGpCDw
vO3QfVD93vyGCj3YuzFXMWnWrZhmM5+tdns42pQYIQU9NCmXa9B2/OP3YVjBRQtP
T3wR24Gn4m8CqSFwa+UleClpXApoXytrev2haprhuUqWDo1raZ4i48X9qzQKbFoM
nogNLSe9TIeGGwkUcQSODKQJ8ozRTRl/JyPdLFeL1lF7hkWlkmo4I2kMwWpidaF3
dqPKEs/HGjkcgQXkEn74mqaLu/jtqovPp8DCwTSg/N4lVJHxiAoRKVCbRG6McBV9
2T69knm8D5kyXgKFLU28vPi1t/BtSyoS7OBKOs2mizx8YDnEaI1xNGMFu06ouMGV
PURxuu7Ky48Re+20LAbNW5pmK0R+bXIYVWlRqk/YSLtSFdzsmcQ=
=Rzxw
-----END PGP SIGNATURE-----

--u52srvamseyyv3op--
