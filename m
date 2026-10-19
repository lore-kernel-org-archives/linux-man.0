Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578E744C4EB
	for <linux-man@vger.kernel.org>; Mon, 19 Oct 2026 06:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792392944; cv=none; b=K1kT+Pt3vwsT6a9yFU2cgti0tdrXX+M/vtSqCzBueppHT0Go1ajPDa6uMr/K14ZiY7l8nnea5mr8cZIq0zGQKpRshYKsoWTPGbfLkbxV0050aFz1/wNfVAU0/b89C7XDWEn1g6o30FvSj7vc0cIaLeInqKNLXFbpouo740AKIlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792392944; c=relaxed/simple;
	bh=Miq/edsxXcFBzAg3vXQ7IMprEQ/Z47SOZ6aT0FBoE8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qlbXMBnP5ezkRZwhUsyhHxTpUYpOHpqSvpyu04Qoqm9akBBqapiR/JPSU9yVeVh7XN0Rz/ld1kU0R2J0Po87vIUG0/HzifhdoIr+pWtUjk6U6xBFXQub5L+YoQR5ogbHTtArKlOl4RYZzbUE9UnT5wor/6OT80AJj6MLTD3Km6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kPltQ8Fu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kPltQ8Fu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 583691F000C4;
	Mon, 19 Oct 2026 06:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792392943;
	bh=eee7wEVVJty7azyTqp92oIX6WNSC79vozt4bynJL/QA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kPltQ8FuEUkzIONhDr+WgZhAnoJ07mkUYiu0FqFyBZyPneiDD8urwQPMeUCMU+EuW
	 /e/Xp59Ym1mLvcODzayJzct8zSLkRv8qKcQ9riMmn/BPbKAy40fTa4biyOdxkAMjXV
	 SVsk+sPa8UuqrllMOKDbi7hthOlHeMDow+51ttnj4Be5PYqp15zadvguA8KT9nhIh/
	 DXiNr4LpAFjJgy6QM4wVSpc2TE2yWjiIy0GgADiFxCV3xZBgnO4Wc06MijY3prazHO
	 LqvPd9QfaT6Qkma4ZaAJw2Ee9FDVnpeF/9hOHf7VcyniHS0FU0blWFfUM/SodPiBV5
	 NrYK7ROiLvbpQ==
Date: Mon, 19 Oct 2026 08:55:39 +0200
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH 06/24] man/man7/unix.7: ERRORS: EPROTONOSUPPORT: Protocol
 0 is also accepted
Message-ID: <atW-XL6H72Nyy3N3@debian>
References: <20261016173139.13076-1-gnoack3000@gmail.com>
 <20261016173139.13076-7-gnoack3000@gmail.com>
 <atSqLSOUOfSB8lFn@debian>
 <20261018.221f6e5361f0@gnoack.org>
 <20261018.fddfdfcb83bf@gnoack.org>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5anqwkh7tg2lxbty"
Content-Disposition: inline
In-Reply-To: <20261018.fddfdfcb83bf@gnoack.org>


--5anqwkh7tg2lxbty
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH 06/24] man/man7/unix.7: ERRORS: EPROTONOSUPPORT: Protocol
 0 is also accepted
Message-ID: <atW-XL6H72Nyy3N3@debian>
References: <20261016173139.13076-1-gnoack3000@gmail.com>
 <20261016173139.13076-7-gnoack3000@gmail.com>
 <atSqLSOUOfSB8lFn@debian>
 <20261018.221f6e5361f0@gnoack.org>
 <20261018.fddfdfcb83bf@gnoack.org>
MIME-Version: 1.0
In-Reply-To: <20261018.fddfdfcb83bf@gnoack.org>

Hi G=C3=BCnther,

> Date: 2026-10-18 16:40:53+0200
> From: G=C3=BCnther Noack <gnoack3000@gmail.com>
>
> On Sun, Oct 18, 2026 at 02:37:49PM +0200, G=C3=BCnther Noack wrote:
> > On Sun, Oct 18, 2026 at 01:19:34PM +0200, Alejandro Colomar wrote:
> > > Hi,
> > >=20
> > > > Date: 2026-10-16 19:31:21+0200
> > > > From: G=C3=BCnther Noack <gnoack3000@gmail.com>
> > > >
> > > > unix_create() in linux.git net/unix/af_unix.c only fails if
> > > > 'protocol && protocol !=3D PF_UNIX'.  0 is the usual value, and the=
 one
> > > > used in the SYNOPSIS.
> > >=20
> > > The commit message seems bogus.  What does that 'only' intend to mean?
> > > The actual diff seems better than the commit message, but I'm not tak=
ing
> > > it.  This is an example of the nonsense produced by LLMs.  I'm NAKing
> > > the remainders of the patch set; that is, for patches 06..24/24:
> > >=20
> > > 	Nacked-by: Alejandro Colomar <alx@kernel.org>
> > >=20
> > > The exception for LLM use is explicitly terminated.
> >=20
> > The commit message may be short, but it is factually correct: The
> > referenced unix_create() function starts with this guard at the
> > beginning:
> >=20
> >   if (protocol && protocol !=3D PF_UNIX)
> >   	return -EPROTONOSUPPORT;
> >=20
> > It rejects the creation with EPROTONOSUPPORT (only) if the condition
> > "protocol && protocol !=3D PF_UNIX) is met.  That is, protocol must be
> > either 0, or it must be PF_UNIX (a.k.a. AF_UNIX) to pass the check.
>=20
> To answer your question about "only" more directly:
>=20
> The existing man page makes it sound as if the error was returned in
> the case where protocol !=3D AF_UNIX.
>=20
> But in the implementation, the error does get returned when
>=20
>   protocol !=3D 0  *and*  protocol !=3D AF_UNIX.
>=20
> That is a more restrictive condition under which the error is
> returned, thus the commit message says that it is "only".

Hmmmmm, it seems I had misunderstood (I had inverted some check in my
head), and the commit message was indeed correct with 'only'.  Sorry!
I was very skeptical reviewing, just in case.  :)

Since it was just me that I was wrong, I'll continue reviewing.  Ignore
my NAK.


Have a lovely day!
Alex

>=20
> =E2=80=93G=C3=BCnther

--=20
<https://www.alejandro-colomar.es>

--5anqwkh7tg2lxbty
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrVvuUACgkQ64mZXMKQ
wql5EBAAsYhvYQ4C499kUd4vwY0nfQ58Mk7TM5jdfbQ2vVM1yEePZiNgXI08+eCE
6wEu1nc5+ExsxB6y2NCthzlxC8RpH3aij4kFic568dClc90V+E43oyoYNvpkg/Ar
iTPAp5qEMGaRTWNxiWQ1YMx56ODnchjt772JzjgAmjqVE+Vt4E0pZSYi/K+wzNQo
PzSb/L7kexMD5S+U65Nn/GkiyoxGAkvgdRjUqpjYKLHBhfOaHtKOS4V8VRA0NXW8
jSpxTNJ/L5PhmaJddEoxra1WZyK5dNz9XA1qucxiii40FvqPOhPrevWdQJIY1Scj
Uyc523+Y5/0nLm9Kjkwe6YdiDvECb+fqP8CyP6nVS009CvMpuDKmTOt0VQpdcnPg
B0RUFqBJ07LAJK3ZEMj/fqLtWAALtj2vcXMKLXFcIsfncxGlNF2vqD8jqrwTuVTD
qN3IJkgyB6eK4AfonG2CV+JjihHejTesjDUQGCL1XYLyVrnhzgwPgWjuPKZ9vnDd
1yJL/DBdG7PcEsT3Q5P+aKWSaqscjdil77E9Qcd9Wik05F9K8YrX2vDdgZrfJHM6
Pu4gCRSz1/P5WqXdMYFhW6oJEE+DfKXe0Atu0uPiLncnENAjcoABFQCLLOdoir1j
3vUNpvWcb/BuEkusocMJX4kiODz0FY+/l3Pz8qO2lO/1bFGVwDY=
=++fL
-----END PGP SIGNATURE-----

--5anqwkh7tg2lxbty--
