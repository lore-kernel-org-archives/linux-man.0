Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719687;
	b=pnkeMc3GK9+ximhAXJxMHLRFs4TmJqyPA9r/yzs98molh8VyKmJ8VhzpRuUKD2lazZj9
	 UALOr5fiMvJhWW95F2gu2166jA0kvbVRzM8Flnktpo7qgglPFVoxl/jO5sQXEoM66UiWm
	 /dP5GBVZXJhoM+AGuF+E00MqGjg1hmcPEiPBdanx1wPMY4XQnnwph8nIKzDaYFvzNDq47
	 13OOLccKsz658xP2dpgepHlky3SvHodwWvvW8m68zYVn08DNyU1DrepU6pgTmrzm8AV2t
	 2auEq0PS7Yn/dAvJxKmNiUnzLmG+Erm8WF1Bxn6xXK4uL2huJvrwuqCcKQtrsztofFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719687;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=rsK2/NPD1MMNn6BApapZYNtPVl7AQKqlWe7/ap1guVg=;
	b=w7y9r2NMw6NoJ9erWcvTfHZO9dVnD9qoKiMPiFTyOht6GsOSNnSiNiGaGlcIg2X2cUkl
	 kY96/FWzEOEVmdtaJ1ZGdxORrYrhNBC9mty8amWYZqtsH7r6nKiC1nOi5I3+80WQqVbG7
	 uqeJM64ue4vGf7NZOhJCI79eulQjHIjJ5zzGj0gKEQNstU9RbC111D7n/jzkBj4POHqjp
	 NbNOL4euaj+naLRjskGYnpcynH9foMh1LZHRsPRd4aGxadWxp86Ov912+x/s5EZpvGKRR
	 j07u2nmTdobswP2kDNtV3qASBLUf5tbLbiu3eI536VpGQSuVdKzH2oyXu8n8w6bB/uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oIznWMRW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9880606A326
	for <linux-man@vger.kernel.org>; Tue,  3 Nov 2026 15:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oIznWMRW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C7D41F000C1;
	Tue,  3 Nov 2026 15:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793719686;
	bh=rsK2/NPD1MMNn6BApapZYNtPVl7AQKqlWe7/ap1guVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oIznWMRW7I3c9FVvt3Z7LhYxGw8s7RJSgEaSUwU3UxD9+OSKMugwMrxLCiJ475aeu
	 trBp3uco3OQnZ/b7wb0wBam0ui9pLQF6BQVv0kqYgvpI7u9mXPufu7iHHPMnDgCaGJ
	 BJMV1MceABwC5GRgnTES+B7R8InF3XuU+Sq8AEeg58f1gyhx5P4Uf9/9WA2Fwk539i
	 sInfKp1xFOYNtSqw7T1+pNh4e7PsJEe3fWuOtq2O3BYP5onvGPCLCT+MYUCHRMiabt
	 BNIg0V1TLnYq1DKj4JOcv9RlZStiyOsMomXaVKK9eZS4qYz1b1eNfSMld5Xn557flo
	 bNmkneFtOEDkg==
Date: Tue, 3 Nov 2026 16:28:02 +0100
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Carlos O'Donell <carlos@redhat.com>
Cc: Alejandro Colomar <alx@kernel.org>, 
	Xavier Leroy <Xavier.Leroy@inria.fr>, linux-man <linux-man@vger.kernel.org>, 
	Michal Schorm <mschorm@redhat.com>
Subject: Re: Two copyright notices missing in 6.20?
Message-ID: <aun6mEuYKQG-1IKv@devuan>
References: <9d4eec62-bfab-4cf9-ac48-c77dd57b60ac@redhat.com>
 <aukT75oZFuvhwiEd@devuan>
 <0b9233b7-3c3f-4209-9d01-a1c94aaa8439@redhat.com>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3eea2bqcl46ozo75"
Content-Disposition: inline
In-Reply-To: <0b9233b7-3c3f-4209-9d01-a1c94aaa8439@redhat.com>


--3eea2bqcl46ozo75
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Carlos O'Donell <carlos@redhat.com>
Cc: Alejandro Colomar <alx@kernel.org>, 
	Xavier Leroy <Xavier.Leroy@inria.fr>, linux-man <linux-man@vger.kernel.org>, 
	Michal Schorm <mschorm@redhat.com>
Subject: Re: Two copyright notices missing in 6.20?
Message-ID: <aun6mEuYKQG-1IKv@devuan>
References: <9d4eec62-bfab-4cf9-ac48-c77dd57b60ac@redhat.com>
 <aukT75oZFuvhwiEd@devuan>
 <0b9233b7-3c3f-4209-9d01-a1c94aaa8439@redhat.com>
MIME-Version: 1.0
In-Reply-To: <0b9233b7-3c3f-4209-9d01-a1c94aaa8439@redhat.com>

Hi Carlos,

> Date: 2026-11-03 09:55:31-0500
> From: Carlos O'Donell <carlos@redhat.com>
>
[...]
> > Did I miss any?
>=20
> Yes, 3, but I will also note the remaining 4 topics that came from the au=
dit.
>=20
> (1) Copyright statements for Michael Kerrisk
>=20
> sync.2:
> \" Copyright (c) 1992 Drew Eckhardt (drew@cs.colorado.edu), March 28, 1992
> .\" and Copyright (c) 2011 Michael Kerrisk <mtk.manpages@gmail.com>
>=20
> select.2:
> .\" This manpage is copyright (C) 1992 Drew Eckhardt,
> .\"     copyright (C) 1995 Michael Shields,
> .\"     copyright (C) 2001 Paul Sheer,
> .\"     copyright (C) 2006, 2019 Michael Kerrisk <mtk.manpages@gmail.com>
>=20
> epoll_ctl.2:
> .\"  Copyright (C) 2003  Davide Libenzi
> .\"  Davide Libenzi <davidel@xmailserver.org>
> .\" and Copyright 2009, 2014, 2016, 2018, 2019 Michael Kerrisk <tk.manpag=
es@gmail.com>
>=20
> May you please add these 3 back for Michael?

Sure; thanks!  Will do tonight.

> (2) Removal of Linux Foundation copyright statements
>=20
> There were ~116 of Linux Foundation copyright notices present that were r=
emoved.

I'm waiting for them to approve it formally.  I expect they will.

> e.g.
> a1eaacb1a5 man7/signal.7     (Alejandro Colomar    2022-11-09 16:36:36 +0=
100    1) '\" t
> ^fea681daf man7/signal.7     (Michael Kerrisk      2004-11-03 13:51:07 +0=
000    2) .\" Copyright (c) 1993 by Thomas Koenig (ig25@rz.uni-karlsruhe.de)
> f527d6fe30 man7/signal.7     (Michael Kerrisk      2020-11-12 16:36:34 +0=
100    3) .\" and Copyright (c) 2002, 2006, 2020 by Michael Kerrisk <mtk.ma=
npages@gmail.com>
> 743bc3957a man7/signal.7     (Michael Kerrisk      2008-07-04 14:36:28 +0=
000    4) .\" and Copyright (c) 2008 Linux Foundation, written by Michael K=
errisk
> 743bc3957a man7/signal.7     (Michael Kerrisk      2008-07-04 14:36:28 +0=
000    5) .\"     <mtk.manpages@gmail.com>
>=20
> a1eaacb1a5 man7/signal.7     (Alejandro Colomar    2022-11-09 16:36:36 +0=
100    1) '\" t
> 73ec1f03be man/man7/signal.7 (Alejandro Colomar    2025-11-21 01:08:05 +0=
100    2) .\" Copyright 1993, Thomas Koenig <ig25@rz.uni-karlsruhe.de>
> 73ec1f03be man/man7/signal.7 (Alejandro Colomar    2025-11-21 01:08:05 +0=
100    3) .\" Copyright 2002-2020, Michael Kerrisk <mtk.manpages@gmail.com>
> f99f884ddb man/man7/signal.7 (Alejandro Colomar    2025-05-17 15:18:26 +0=
200    4) .\" Copyright, the authors of the Linux man-pages project
> ^fea681daf man7/signal.7     (Michael Kerrisk      2004-11-03 13:51:07 +0=
000    5) .\"
>=20
> Did the project get permission from the foundation for the removal?

Not yet.

> (3) Collapsed years
>=20
> Michael's copyright status collapsed from 2002, 2006, 20220 to 2002-2020.
>=20
> Were additional contributions made in the intervening years?

I don't know.  I suspect there are, even though he probably didn't
consider them worthy of copyright.

> If there were no such contributions then the years should be kept distinc=
t.

I think I disagree.  The copyright dates are only meaningful as a start
and an end.  One could also argue that 2005 means 2005-01..2005-12, but
there might have been contributions only in 2005-07.  Is it legally
meaningful to say 2002, 2004 in a way that 2002-07, 2002-09, 2004-05
isn't?  And is it legally meaningful to say 2002-2004 instead of any of
the above?

>=20
> Only ranges like 2002, 2003, 2004, 2005 etc. should be collapsed into a c=
ontiguous range e.g. 2002-2005.
>=20
> May you please correct the collapsed ranges?

I'd really like to avoid this.

> (4) SPDX identifiers
>=20
> With Linus' clause restored, the SPDX identifier for setreuid.2 is not co=
rrect.
>=20
> The original text read:
> .\" Portions extracted from linux/kernel/sys.c:
> .\"             Copyright (C) 1991, 1992  Linus Torvalds
> .\"             May be distributed under the GNU General Public License
>=20
> Which makes this SPDX identifier incorrect:
> .\" SPDX-License-Identifier: BSD-4-Clause-UC
>=20
> Should include GPL?

Indeed.

> Likewise bind.2.
>=20
> Likewise connect.2.
>=20
> Likewise iopl.2 implied GPL.
>=20
> Likewise subpage_prot.2 implied GPL.
>=20
> May you please update 5 pages with GPL notices?

Thanks!  I'll GPL these files tonight.

>=20
> Likewise signbit.3, significand.3, and memcpy.3 are GFDL derivatives.
> - These should be rewritten from scratch or GFDL front-matter invariant r=
equirements apply.

Ouch!  Indeed.

>=20
> The man-pages project should not copy from the glibc manual
> due to the GFDL front-matter invariant requirements, and that
> GFDL cannot be combined with GPL.

Agree.  I'll try to rewrite them from scratch.

memcpy(3) will be easier, because I know the page very well (and I've
already rewritten most of it from scratch; I guess the only remnants are
in CAVEATS).  The others, I'll need to learn about them before
rewriting.  I'll use the BSD pages to learn about these APIs.

> (5) Uncertain provenance
>=20
> Restore the des_crypt.3 uncertain provenance header:
>=20
> .\" However, the above header line suggests that this file in fact is
> .\" Copyright Sun Microsystems, Inc (and is provided for unrestricted use,
> .\" see other Sun RPC sources).
>=20
> Or conclusively resolve the provenance issue.
>=20
> I'd leave the SPDX-header as-is because Eric's statement can be seen as a=
uthoritative
> over the uncertain provenance.
>=20
> Likewise login.3 uncertain GFDL.
>=20
> Likewise remove.3 which should include copyright notices from unlink.2 as=
 a derived work.
>=20
> May we please add back the uncertain text notes?

Okay.

>=20
> Were any of these uncertain notices resolved?

Some of them might have been resolved due to the affected text being
removed.  It's probably not worth the effort, so I think it might be
easier to just restore them (even if maybe not relevant anymore).


Cheers,
Alex

>=20
> --=20
> Cheers,
> Carlos.
>=20
>=20

--=20
<https://www.alejandro-colomar.es>

--3eea2bqcl46ozo75
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrp/X0ACgkQ64mZXMKQ
wqkqaQ//XOSnzygIqRmiyvrzxcAvBp3KH75h3Iwx2RDJhbBsk/mMljHZ0JAfl4M/
qdIe88dNKS/i1ylcrKeSMTNJ+AxmP1EaWUqW6SbtJwNXtAmWijL7oBOs3S6P7wSg
oZLFtctqIEhweC4/ZikBOdTjnKe/tukZ1WQZVpqnBei0RB0S7qNhJMAlGqx6Ga0Y
Uvyo2VpOh73Iy8pIx5H9fR2zoNmBW5qpzgVC9Wo68/NSesu5hFNHDfNgrAWDk+FV
RIu0k9nx23KjOr6NyTZBVxySArrSRMGVSQyb55Z3GTyRD9GjhJwsR1O0JzzMM1yb
ID0bMMtUXoDkZP8mYevOrX33UOFDpMr0d85S/eUZfOgsauOmj2Y/SVNWc9EqdGLB
EilP3mvAzmlyLmntbzJV6+/r9Ez536iALOdVdjl1JA0mhwik0gCpSyj/5/hDo9WF
uz0VgFnj5HaJqbgKHrI/1Zwnng5zm1HKzzPmJ99YgmBoVll6JYdgqOCPwuZI58WT
7Gk93TDzXQUlS2ZhsIryKVIyJAak1Pp7HCzwLGpVRscGSDct+8ti1Y1mqwcqKpYo
nrd+gpETpcv8NFyRLdSqypFOIytaMTKoVpnr35cLSocSv6TYgu2TL9a6p2BSUR4Q
Dr7glNyguEYM/givlumufZnIQzk0I1N0gzvpzQpOtxFk0sSl7/k=
=5QmV
-----END PGP SIGNATURE-----

--3eea2bqcl46ozo75--
