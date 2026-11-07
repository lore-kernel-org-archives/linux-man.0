Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794054188;
	b=Li6kfVfZVvdI8+Nb7It9VHScG8Fa8Z6V1Ja/Z9qVZRd19npQcc+KHodRgwa4HAd3fpSz
	 GgxFyD88KpIRYTWcSmISQ/3ATdKMYvsndzOJktczW/UPsLaYDeQKCly5DC362qx6SWQXv
	 W94RknkWeSzSbBX0is0M1qBI18R7t2ShGBM6X8STAoG+LEpR1b0qtec5VG5qqDHirHZMZ
	 eETVyX4pNtqfEtmax7g9iJMIylpGsxSR8/d/37bNiIZHiFRnVY1KcV1igUbaEWA6SY+eO
	 JT59H17KCrkNbiTC8n7tknx2h0oYYrCdQLX21fVEz4E1KKeFMvj2MMkAZF0u43v+f/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794054188;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Ch+GpNnjs+auXp+VAPNViG9XzOKkVHHqg0qV13URXsM=;
	b=RPsGgayHCKJZxmocVZf9KRGIO7yCX8d/ua8icbupANGws559GP2K3QsVherjF/Y01rNa
	 Qy9s1vOl+iSOq8WlDAttFDRiasrxh91AuFkPJn/slva7uNFv6Kpc1k9tLL6HvHdWZfEWC
	 CX1Iga8xDf4xSZfBm2TxcWl/3ov/v4nmL8DkktHxtdzoNdS8o9vzGO+Aid4hcd93TnaFW
	 /jlFieNzLOZzi3gayA32/Sih2NnQ6DvTML3nwur6C+U/Ld5MKRtNNJFCaPISqNLoCFYf4
	 L8H9Fl6iJyLm6ktsZrVdGgHKKB91z3gBobxd4OttkM+ujY3T7uT1FNGveTj3o+mtKdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i69Th05m;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B6F606A32E
	for <linux-man@vger.kernel.org>; Sat,  7 Nov 2026 12:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i69Th05m
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 561D31F008A1;
	Sat,  7 Nov 2026 12:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794054188;
	bh=Ch+GpNnjs+auXp+VAPNViG9XzOKkVHHqg0qV13URXsM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i69Th05mkYRLIYCN6rgN5FN/6i3b5nlILub490zv9/+QsCiKxtBXVIYwmhSACBhBB
	 MyMi8wBERp8fxu+4y5SiKaPw6Iw0JOM4YPoT0/8mkzxNOHYUaws0iIYfMzP/vxRuz2
	 DATlR+gRisE7n9fkxeHBP9ag6ijAm6Yt4MgckmVyYq226JIO37kLKYhraoTrqY/Ak/
	 akqO01p6P6Aulo0ETGpyRf4ArYwnbMlhn4NNZwJRnzIl+UhCZmyg+AkG9/1uyqgH/V
	 ZgimMkhbRrxdY/hVJQ7UGqgP+gBlKhkXYgF512i88vqLO8MbD3ce+QMpv2WiiNoIC1
	 mzuCTNpPhOBSg==
Date: Sat, 7 Nov 2026 13:23:01 +0100
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: Miklos Szeredi <mszeredi@redhat.com>, linux-man@vger.kernel.org
Subject: Re: [PATCH] man/man2/rename.2: Remove CAP_MKNOD remark about
 whiteout creation
Message-ID: <au8YEwtmpAMwwcmr@debian>
References: <20261009143656.4884-1-gnoack3000@gmail.com>
 <ask-80Zlt0ygw0pk@debian>
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
	protocol="application/pgp-signature"; boundary="be54cgnuz5ypvqnx"
Content-Disposition: inline
In-Reply-To: <ask-80Zlt0ygw0pk@debian>


--be54cgnuz5ypvqnx
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: Miklos Szeredi <mszeredi@redhat.com>, linux-man@vger.kernel.org
Subject: Re: [PATCH] man/man2/rename.2: Remove CAP_MKNOD remark about
 whiteout creation
Message-ID: <au8YEwtmpAMwwcmr@debian>
References: <20261009143656.4884-1-gnoack3000@gmail.com>
 <ask-80Zlt0ygw0pk@debian>
MIME-Version: 1.0
In-Reply-To: <ask-80Zlt0ygw0pk@debian>

Hi,

> Date: 2026-10-09 21:27:05+0200
> From: Alejandro Colomar <alx@kernel.org>
>
> Hi G=C3=BCnther,
>=20
> > Date: 2026-10-09 16:36:56+0200
> > From: G=C3=BCnther Noack <gnoack3000@gmail.com>
> >
> > Whiteout objects do not count as device files and do not require
> > CAP_MKNOD since linux.git a3c751a50fe6 (2020-05-14; "vfs: allow
> > unprivileged whiteout creation").
>=20
> Thanks!  I checked the referenced commit, and it seems correct.
>=20
> Reviewed-by: Alejandro Colomar <alx@kernel.org>
>=20
> (I'm not taking the patch yet, in case Miklos wants to comment, but
>  I will take it eventually.)

I've applied the patch.  Thanks!


Cheers,
Alex

>=20
> > Signed-off-by: G=C3=BCnther Noack <gnoack3000@gmail.com>
>=20
> You forgot to CC the list.  :)
>=20
>=20
> Have a lovely night!
> Alex
>=20
>=20
> > ---
> >  man/man2/rename.2 | 5 -----
> >  1 file changed, 5 deletions(-)
> >=20
> > diff --git a/man/man2/rename.2 b/man/man2/rename.2
> > index 14be6b20d3c9..7e5c02797230 100644
> > --- a/man/man2/rename.2
> > +++ b/man/man2/rename.2
> > @@ -250,11 +250,6 @@ is ignored by the kernel's whiteout support code,
> >  as of Linux 4.19, at least.)
> >  .IP
> >  .B RENAME_WHITEOUT
> > -requires the same privileges as creating a device node (i.e., the
> > -.B CAP_MKNOD
> > -capability).
> > -.IP
> > -.B RENAME_WHITEOUT
> >  can't be employed together with
> >  .BR RENAME_EXCHANGE .
> >  .IP
> > --=20
> > 2.56.0
> >=20
>=20
> --=20
> <https://www.alejandro-colomar.es>



--=20
<https://www.alejandro-colomar.es>

--be54cgnuz5ypvqnx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrvGCQACgkQ64mZXMKQ
wqmXwQ//TvHP2+5O3FonS9CjMTUrn34Am/kmaVWHfGbqhBOMYnBm+kEFTkHuHa6C
CPhfbS5KkqLPSJ0DTrLcxlxYQX7sqVbQ2aj46T8pIukjGa9QICm/IkDsW8eSuBwe
QxWmnLS9nqun601AvpfABCZN07FhzSEftbC1x7Al01JMacjQu68dVHBAfvHfAO++
eT+UP+X3dwXCBiRoAJtsEXi7n5B0Eq+fdAhQDLDAdYwFXbgEn015uo758qlLFdD4
/XXqTPC88TY3EGXf/or30zS8/dMRFYqD5UeUhS64LY0z8uOUd+oxRCQx87NfrHN3
ht12Yz0jNTFwYovCKL4KgfIobb/kt2KaahP2cBrA3SHBMhVoUhHl4yqN8Xpi78X3
fIgO1NHtGtMPXGlZ5zjbPdKlIXSlOX09x9I+SyW6FgLCgM4cQXClz+KcpCwCM5cN
ThIIgeB/IjqKSULJD4doLUT4t0nz+USyJdDqt9pNgxRVe0i+S9ofBEH2DzlqUBxA
/GGKP2l5tC1GvGek5gZ+zSxL5ejxVKQuH0257+FHk4LvxuYRfqmsSUD3DFL9r/Nc
ARGuz0UJG2d8QEnqPntm7jNcZPlqchZ+ZcJ6yanPoax8kLPtIESgKoV1wGyI5upW
M2ltgk8239xiLZWhaDUP0bE19XvUpPXtoByHBEmLS+wGsow8I64=
=hpOY
-----END PGP SIGNATURE-----

--be54cgnuz5ypvqnx--
