Received: from tarta.nabijaczleweli.xyz (tarta.nabijaczleweli.xyz [139.28.40.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF8E265CDD
	for <linux-man@vger.kernel.org>; Sat,  7 Feb 2026 19:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.28.40.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770491800; cv=none; b=kR8xRpfw5/Cs2g6pT1L3e+6AawwKfrXSr6isBzqbfSxmvEwO/pb542nAMCZqjl1IAaxA4YNvzF63i3OdO761BuMK8nx1gqO0F0rVxhf0t+wm15etRaNvWMuRpxjWQ9KrxtIlZYnmapgL0VX3mRiPMtBKUDlTtXJZyUvcFRLZQrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770491800; c=relaxed/simple;
	bh=C7Sx/MdAfVWFY8/XGnKgXbMJA4XNTx901lg/NtD9fWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uGht3JshmRfguVbOSdwskAhk7Qesc6zMK8ryzZAMhchzuKUGlcUIVQUwcRQHuATzN8zEj9xXWrJbgNR0DEOmUd5nRdJj0p/z8rfwu63T1IJd4KgAxSNHIin1fedgNFCnlf10u0pdUp8hp/JTOXWzEqio8v4oy8mP3RiWZvtBIvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nabijaczleweli.xyz; spf=pass smtp.mailfrom=nabijaczleweli.xyz; dkim=pass (2048-bit key) header.d=nabijaczleweli.xyz header.i=@nabijaczleweli.xyz header.b=kx4iJ1lX; arc=none smtp.client-ip=139.28.40.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nabijaczleweli.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabijaczleweli.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabijaczleweli.xyz header.i=@nabijaczleweli.xyz header.b="kx4iJ1lX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nabijaczleweli.xyz;
	s=202505; t=1770491796;
	bh=C7Sx/MdAfVWFY8/XGnKgXbMJA4XNTx901lg/NtD9fWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kx4iJ1lXo1C+Zw1erFBXfxFF7/a/CHHESN2aulOgf1kP8X2NOMhQz6KTPU2rDtdp9
	 O2BiwviD9q8KSSWE7x8zNoeRMGy/UIOgTo7VPuueefS85erVzFUIzGYR2Gff19BIwR
	 a0QhTlPkLM52vgYgipGwOM47/GxpxKudXbOjbpuMeCz1kA7dhZEWQGXawVzIcNxEGr
	 VmuLi9zA1uJ0v7ZaS6zFJ/MHTnVBiTN1tF6MGPHxuwjN9NWn05jg6fp9E4jXYIC20L
	 RIpdzKIVTUnxdUxBPuqrIh7m9Aec+Ok4YNXaS/ILfO8t5AEy+GHWIlR1HlJfEet7k1
	 OAq18A4MX+dUQ==
Received: from tarta.nabijaczleweli.xyz (unknown [192.168.1.250])
	by tarta.nabijaczleweli.xyz (Postfix) with ESMTPSA id 96346221A;
	Sat,  7 Feb 2026 20:16:36 +0100 (CET)
Date: Sat, 7 Feb 2026 20:16:36 +0100
From: =?utf-8?B?0L3QsNCx?= <nabijaczleweli@nabijaczleweli.xyz>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH] futex_waitv.2: new page
Message-ID: <3en4ifc2b6upp4ufedhajhyikvmpc2yrosl5hpftszlzsdy3b4@tarta.nabijaczleweli.xyz>
References: <jpyv367v4jdxfxebxw6wh7rgqdfeswzp44dzsycfjt5k2pxe4j@tarta.nabijaczleweli.xyz>
 <aYeDkRWB2ZxYutG1@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y47ngeprmmrusasm"
Content-Disposition: inline
In-Reply-To: <aYeDkRWB2ZxYutG1@devuan>
User-Agent: NeoMutt/20231221-2-4202cf-dirty


--y47ngeprmmrusasm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

On Sat, Feb 07, 2026 at 07:57:03PM +0100, Alejandro Colomar wrote:
> On 2026-02-07T13:49:12+0100, =D0=BD=D0=B0=D0=B1 wrote:
> > +.TP
> > +.B EINVAL
> > +.I nr_futexes
> > +was not between 1 and
> > +.B FUTEX_WAITV_MAX
> > +(128).
>=20
> In this case I would like to see a range.  "Between" doesn't make it
> clear whether the bounds are inclusive or exclusive or combined.

"nr_futexes was not in [1, FUTEX_WAITV_MAX (128)]."?

> > +.TP
> > +.B EAGAIN
> > +The value pointed to by
> > +.I uaddr
> > +was not equal to the expected value
> > +.I val
> > +at the time of the call.
> > +.IP
> > +.BR Note :
> > +on Linux, the symbolic names
> > +.B EAGAIN
> > +and
> > +.B EWOULDBLOCK
> > +(both of which appear in different parts of the kernel futex code)
> > +have the same value.
>=20
> Should we use wording like in read(2)?  It uses
>=20
> 	.TP
> 	.BR EAGAIN " or " EWOULDBLOCK
>=20
> Or do you have reasons to prefer your wording?

That's what FUTEX_WAIT(2const) says and that's the most-sister page
I copied this from (it is pretty crazy wording). But
  $ git grep 'hich appear in different'
  man/man2/futex_waitv.2:(both of which appear in different parts of the ke=
rnel futex code)
  man/man2const/FUTEX_WAIT.2const:(both of which appear in different parts =
of the kernel futex code)
  man/man2const/FUTEX_WAIT_BITSET.2const:(both of which appear in different=
 parts of the kernel futex code)
  man/man2const/FUTEX_WAIT_REQUEUE_PI.2const:(both of which appear in diffe=
rent parts of the kernel futex code)
so those want to get those gone as well.

> > +.SH NOTES
>=20
> Maybe CAVEATS?

idk if it's a caveat... the futex(2) API family functionally hard-codes
FUTEX2_SIZE_U32 into every operation and it's not a caveat there.
And, having just seen a lot of futex kernel code, it abuses futexes
being 4 bytes /so much/. I don't think anyone's expecting to have
non-4-byte futexes any time soon. So this is more like a notable curio
to explain why you need FUTEX2_SIZE_U32 at all than "beware this missing AP=
I".
Y/N?

> > +#include <linux/futex.h>
> > +#include <sys/syscall.h>
> > +#include <time.h>
> > +#include <unistd.h>
> > +\&
>=20
> What's the distinction between the two include groups?
Top 4 are for the syscall from SYNOPSIS,
rest are for application code.

Best,

--y47ngeprmmrusasm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEfWlHToQCjFzAxEFjvP0LAY0mWPEFAmmHj44ACgkQvP0LAY0m
WPGKMQ//WETQPqPXHwjQYOFja7TjHZmAI55zJgB+vVnm6bIFc/j7rU6XYkk1EgL5
oZWFij+43B07WxTiwMhTtzhTv6PEV/G1uFuH4kwm+CTApo74SyGnDWGxgbGt1+Kz
H9kySFEkkNq2g8fw/N0p7Lq/6cpxOmOSwNIjXSDoSI1WgBT5U7H9bhrs9Fj/6DKS
SyJMIgZC8O70hbMzJ/hsFmWiu4llfY22/R09ndc/vWM0nyWHBeGXd/8J2q0xJDPu
zssMPgPE3HaPtkwqouVGSOaXHuNlN59b8XtXUJPExCSn67crn8RJ2HC95A5fOzCY
Z9avzbURAIOpx7LOmfojKk3B4Ela4A4IEiZ7UusHiSlKmTGYb336yh7W7Kh5UNLX
IGMyfCQ6fEkLHQh+MWNzDKTyEt0xzv/NhO+MWx6f4tawPoUWbyBYUP+UIO5J97+B
iHrQytviP1QAivAcx1OCXNis2CW4gOHloUZ+baY7SOBqFYK5I89kksomZm7dAEXz
qpBGHvzhy6HyPBS75ce9KlyTJlcchEECzzFKn4rowyVAlM1wXNIFV4EIdENsn5wl
rjMGmvxSkr6MNmPjNDBddl81Bl59erxunHum/+4sTI87PacGIA//bwihzwSz20mU
2oaDhzT2aPf3OISRqGkkSzk5jh4vnyxeFcj7YbvqPLWQBcTwvFE=
=Epv/
-----END PGP SIGNATURE-----

--y47ngeprmmrusasm--
