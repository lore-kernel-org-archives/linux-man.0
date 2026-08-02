Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD11139989B
	for <linux-man@vger.kernel.org>; Sun,  2 Aug 2026 23:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785714182; cv=none; b=LSAa2LsYaJuCjPAWmg4UmGW6kUWZHKCZ2H5Gc8fy9aFl77Dacl9E6n3IHTe9ZPRm/aW/4iuTxxv4uCydzwmiRCWRKk+8tWM/XiqOy5TehwqYw0evxX/aiwKiih4W6pkxqAG9dxdHqChp3jzV451YBAKtN6Ca4I5yjT3LFRh2DSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785714182; c=relaxed/simple;
	bh=EnoKXkOj2HqUZlu5cKkzIxD8OrLTsh01Fuqj9r76fBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j4teClPgZoMShFRw5xH/RoGHdKwzaUqhF0zxFaR/AnPWdlyU0EzNCNG65QL7x9G/IbZbAWddVslEEMrT9fkBLdotiAswmWa4ETrIGKunclDio7s2k+iBL14NSFRcawDM5nn9/uaq3Jwv9/uBZ35aTpMkvDXyrYhjlLdvfdPvpZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UCbbUlNw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UCbbUlNw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D5761F000E9;
	Sun,  2 Aug 2026 23:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785714181;
	bh=Bj+8CuDbMu1KbF29lyIRN8Q0Ihcd9+4mW43toih9Y5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UCbbUlNwGv84J91T6RYxrh3eFcgrA0z+FH93ls6JVxqYqb1iZ3RyAsvkQs+hQhBxC
	 obVHiDZ90LLq6aabmVJjSL3rhIyt8zMYIyTOqWPMKPMdskosdNHInLTyOSO0TEccs9
	 wcXp1xJCJojib7fWNg07PT2fqEdbtkAn9Mpsdn2BTmELRrGDAp++aE1JjPCEFewOTh
	 vRxNj8jnX1m+5xGvkWWcscRlIzaZYanRJcX2QsdRaN/eAPp6SLFq4qWf3qQjGhKDvL
	 K/pIZJJR2TkgBil54+QNzgeiz8aJYTy9pMrERWcOAuqx/ZAxx8wN4BGFuODATWVDie
	 s1gvfc1O33HYg==
Date: Mon, 3 Aug 2026 01:42:57 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Collin Funk <collin.funk1@gmail.com>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	Arsen =?utf-8?Q?Arsenovi=C4=87?= <arsen@aarsen.me>, "Maciej W. Rozycki" <macro@orcam.me.uk>, 
	Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org
Subject: Re: the Linux man-pages as an educational tool
Message-ID: <am_V3bvOiH9TaJQW@devuan>
References: <am6PkypxYg-Fq4Iz@devuan>
 <87cxw1s58a.fsf@gmail.com>
 <am6X32HkGdm2xTd7@devuan>
 <alpine.DEB.2.21.2608022219530.55540@angie.orcam.me.uk>
 <am-2d02e1qq78Asv@devuan>
 <87ik5sunm7.fsf@aarsen.me>
 <20260802231058.o7gud4bd7co2nbhv@illithid>
 <875x1sp0h2.fsf@gmail.com>
 <am_TTjDLlAI68zkp@devuan>
 <am_VUE1SzxqRkTAo@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4hy4u22inef4bky5"
Content-Disposition: inline
In-Reply-To: <am_VUE1SzxqRkTAo@devuan>


--4hy4u22inef4bky5
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Collin Funk <collin.funk1@gmail.com>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	Arsen =?utf-8?Q?Arsenovi=C4=87?= <arsen@aarsen.me>, "Maciej W. Rozycki" <macro@orcam.me.uk>, 
	Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org
Subject: Re: the Linux man-pages as an educational tool
Message-ID: <am_V3bvOiH9TaJQW@devuan>
References: <am6PkypxYg-Fq4Iz@devuan>
 <87cxw1s58a.fsf@gmail.com>
 <am6X32HkGdm2xTd7@devuan>
 <alpine.DEB.2.21.2608022219530.55540@angie.orcam.me.uk>
 <am-2d02e1qq78Asv@devuan>
 <87ik5sunm7.fsf@aarsen.me>
 <20260802231058.o7gud4bd7co2nbhv@illithid>
 <875x1sp0h2.fsf@gmail.com>
 <am_TTjDLlAI68zkp@devuan>
 <am_VUE1SzxqRkTAo@devuan>
MIME-Version: 1.0
In-Reply-To: <am_VUE1SzxqRkTAo@devuan>

> Date: 2026-08-03 01:41:39+0200
> From: Alejandro Colomar <alx@kernel.org>
>
> > Date: 2026-08-03 01:37:30+0200
> > From: Alejandro Colomar <alx@kernel.org>
> >
> > Hi Collin,
> >=20
> > > Date: 2026-08-02 16:27:21-0700
> > > From: Collin Funk <collin.funk1@gmail.com>
> > >
> > [...]
> > >=20
> > > I can't help but wonder of what happens in WG 14 rejects this
> > > controversial, as obvious by this thread, change. Will the man-pages
> > > changes be reverted?
>=20
> > > Or will we slowly watch them document personal
> > > preferences instead of existing standards?
>=20
> BTW, as I showed in another subthread, strncpy(3) did contain
> opinionated comments well before I was involved.  If you're really
> going to accuse me of that, better make sure you get the history right.

Oh, and while at it, please also read my review of glibc's own
opinionated and bogus documentation about string truncation.


Cheers,
Alex

>=20
>=20
> Cheers,
> Alex
>=20
> >=20
> > This patch set is quite independent of the standard.  It documents a
> > header file that has been provided since forever in glibc and most other
> > POSIX-ish systems, so changes to the standard are unlikely to have any
> > effects.  I've clarified this extensively.  If you want to discourage me
> > from applying the change, you should rather bring up technical reasons.
> >=20
> > This passive-aggressive message is not something that will have the
> > desired effects you could possibly reach with technical arguments.
> >=20
> >=20
> > Have a lovely night, please!
> > Alex
> >=20
> > > After seeing weekly threads
> > > about the prototype changes, I don't think it is an unreasonable
> > > concern.
> > >=20
> > > Collin
> > >=20
> >=20
> > --=20
> > <https://www.alejandro-colomar.es>
>=20
>=20
>=20
> --=20
> <https://www.alejandro-colomar.es>



--=20
<https://www.alejandro-colomar.es>

--4hy4u22inef4bky5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpv1gAACgkQ64mZXMKQ
wqnXTg/9HvqrTOC6Zb58HZz1ktb+lBOlIP78NXDlGLe0e91kVOjO6jIGioA/9Vx3
Mud2Q3rz1RI8gEqjlx8BPmNJjmCRne4xW4SMf63YO2Vw+xHjRP2TEARaSQuQbXCe
p7tyfDen9/Nd5qejw19Q2QzHPHs4lvs9kgdAxp7yub4e7YQgIPFumXR6aHWomJFE
xdtA2ZCnQrxNcyKDMH2f2QeUJe8YOv+EPHh/zCDpN1ZnBHKGGTwU1US/06uv0US2
c9O2rb43FAl2vOAibnCedlPzO8nVSxoadZLAk/15g6N+fn9gUd6g1PepViWjga3x
0cSWMyg3t3DbkBD9IHNH1Cop5fRe/cLy5pXQvY4sDv2Vt4JoTvaRLs+L9sQNSwLq
PT4pDE8Q/ceaPFzL3S1wDh+lz9GvpqBhfZ4vME7DLzCbg3Mw+I0EYjxV7qx/Na6g
dCmSndPQssiT5PyE/Ghnm5sObkfbMTzFOSE7biVhPvi16WJRFFWRBFNjk6OHFqFz
SV4nZvMasns0ePw97QpXEJ6vz3qOIY7hw1I5eMD3uVKGd+2LUN2QJfHG3xY/oJmB
uHnWG3E2w/UYwToXVwFeEgCCuNtQHadoxfAPrh0wcqTM5o7K2G8LeG8g5zFs4kMa
T+Ide+2Od2KM/Dbc9+lqHGfF+sxc1ymBFzaJSiS9afelCOqKU54=
=pLwp
-----END PGP SIGNATURE-----

--4hy4u22inef4bky5--
