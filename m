Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375CD2E8DEC
	for <linux-man@vger.kernel.org>; Sun, 19 Jul 2026 09:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784454841; cv=none; b=Ig1FmpUMGkOe0KLPVP2lhvjytisaL2OZdA7BzlOjcwcKEi0dl5E18Z2u9ThAVKYXej3msUlsjnmUok5I2pxEwGtMxo9gXeHUx8wbv/h+8nXHwo98/6iF1vrrbpsW/60SNr2z9+Qb+X5FdRFPrr7KQmCOlUro6pcv0I+hmTMQx+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784454841; c=relaxed/simple;
	bh=s7InUnCouhcMD/WKDPRTtOmd2tz+kYjdCHI1b/o55lg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CJ3jYwI7ZtFK0L1bs95qWUMnrnPa1p2x9INB/i4rqgGKBWe02+g4VkWeYUWymaONCJWriey5DeHtODJQ/i7ZijEe40kl3Iha/U5TV9TPbgV90MB1VYtUDYkD7GGmqiSbNorgq+rWvIPLkeg9wFummd9RQIqewsHKnDZALDp4k/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aarsen.me; spf=pass smtp.mailfrom=aarsen.me; dkim=pass (2048-bit key) header.d=aarsen.me header.i=@aarsen.me header.b=OzXwjUfO; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aarsen.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aarsen.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aarsen.me header.i=@aarsen.me header.b="OzXwjUfO"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4h2zW723yqz8tZw;
	Sun, 19 Jul 2026 11:53:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aarsen.me; s=MBO0001;
	t=1784454835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hHdnE5z3G43WpmTbT/7/oPc0IqaF8Z8B0Hd2AgFvUBE=;
	b=OzXwjUfOjQruca+6aEaQzu+N1ty/M4fXeDydgmS1lP8vbr0MRWiuy+xJvmBNuO19Y4jgxc
	oyU/S7Jnz5YwtU6bq4n7AC3VgY7otWFljov3CId7NEzrlQCYPKshKSvI38eqDR/huuENe1
	1ihoCdafniF7UQJin79sy1zXH41gjOGcljjPzoob7MNWZhowNzOIAVwpoy8Kds/gZiEHDj
	bFWRHSsTNSs67v5Lq5GNYA32iUlzKikI0zLZVEkG2HVmuB9XRtK/o/t/q5+H96d/nG1Btv
	lD0oFiKYR7GE3/KMJdKb6tjuf/W8HvD8mYTaIFoHV5C3+TWNrpZobmgVHFSFTQ==
From: =?utf-8?Q?Arsen_Arsenovi=C4=87?= <arsen@aarsen.me>
To: Alejandro Colomar <alx@kernel.org>
Cc: coreutils@gnu.org,  linux-man@vger.kernel.org
Subject: Re: ls/dir/vdir(1)
In-Reply-To: <alueABs-ZbwayZdu@devuan>
References: <aluIbrKBtAxweITC@devuan> <alueABs-ZbwayZdu@devuan>
Date: Sun, 19 Jul 2026 11:53:52 +0200
Message-ID: <86qzkzpaof.fsf@aarsen.me>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Alejandro Colomar <alx@kernel.org> writes:

> [[PGP Signed Part:No public key for EB89995CC290C2A9 created at 2026-07-1=
8T17:42:18+0200 using RSA]]
> Hi,
>
> I have some doubts about specific pages; let's start with ls/dir/vdir.
>
> Experimentally, ls(1) and dir(1) seem to be exactly the same.  I'd like
> to document dir(1) with a short page saying that it's equivalent to
> ls(1).  Is this correct, or is there any subtle difference?

Quoting the documentation:


> 10.2 =E2=80=98dir=E2=80=99: Briefly list directory contents
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> =E2=80=98dir=E2=80=99 is equivalent to =E2=80=98ls -C -b=E2=80=99; that i=
s, by default files are
> listed in columns, sorted vertically, and special characters are
> represented by backslash escape sequences.
>=20
>    *Note =E2=80=98ls=E2=80=99: ls invocation.

> 10.3 =E2=80=98vdir=E2=80=99: Verbosely list directory contents
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> =E2=80=98vdir=E2=80=99 is equivalent to =E2=80=98ls -l -b=E2=80=99; that =
is, by default files are
> listed in long format and special characters are represented by
> backslash escape sequences.
>=20
>    *Note =E2=80=98ls=E2=80=99: ls invocation.
=2D-=20
Arsen Arsenovi=C4=87

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQECBAEWCgCqFiEE/uKz0RP8AKMWLWBhUsKUMB6ixJMFAmpcnrAbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25z
Lm9wZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRGRUUyQjNEMTEzRkMwMEEzMTYyRDYw
NjE1MkMyOTQzMDFFQTJDNDkzEBxhcnNlbkBhYXJzZW4ubWUACgkQUsKUMB6ixJPf
UgD/de660y5y1Vem1Ubpmgyzl03o6n49Iw2hGY1nPXdwbYIA+gMh8RMo7QSwYasz
d5dVeioKTBEkZcmi2LwKovhXxioN
=05mM
-----END PGP SIGNATURE-----
--=-=-=--
