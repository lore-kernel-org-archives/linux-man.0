Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793314634;
	b=RRbt9TCz8mED+kAYVNDns+4oXUagfSXFIcasQPUeKp7RQXWuu0TQVgbA8FhlEWj1j1Et
	 Zus7O562R3Gu1VNcAvnUiqFJr+reWt4tJf25km3Qed6xD9EDWT+jFwCMEHmFwtAU2MYxw
	 KsD4yKtzvxu6xJyMjxNp8LSCmNTcQ7eEOKGPaoBF+YvcLyzmmBcE5H1BZE5Nz4g4Tia02
	 q0+vnzdAW0eiR5Oszji26lYmpLxLxwsoEDczzUwe9y5iMrd2Wc2SS5UxA4QGCTtoq42ep
	 2W+DKR84SkIegWuTtrOpccUu5ZdkUNJqdhhgE8LW3r4eYK5FcmzjMc1IUZtw0T4YUWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793314634;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Vo7PboUnAX7sPKPJ6xvO5hNz7Bzf+FVAsgEz9BVk9Ag=;
	b=JWfxJFnYGRJqvuEC3hoJ4/Lps54SOt8Olop2oTo77f/u4A7PP/UXzeHrw3JRe1jLL7TE
	 7vY6Xsyu+FjDUqW4y3UjCVeM4QYFKtEXLc4vVcTOCgjE5atG5NKup+VX5X8N9ehwaWg6Z
	 8PaItb4PNGFy451Va6xhcTYSrlxOc/VZVUM4As5r2fMU5PtBczABPVsaqYQ3kDnxAh05/
	 oMT5jfrY1fd7kDDQxB/4+8VTWWoB6bK4XLslYCaQAy8RTUPrEIKGppmod9lacuWRTlQik
	 VQIGVICcDYC7h6W5d0jgxRtb+fC3IliHMMWdM/dC7kOkx07L90IjPQpPkUY9Oynf/yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lec5Z6ow;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156B4606A31A
	for <linux-man@vger.kernel.org>; Thu, 29 Oct 2026 22:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lec5Z6ow
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08CB71F01816;
	Thu, 29 Oct 2026 22:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793314633;
	bh=Vo7PboUnAX7sPKPJ6xvO5hNz7Bzf+FVAsgEz9BVk9Ag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Lec5Z6ow7yU8czC9j/wp5wGPy1CwJqQpcJy8ck1n7Hh5YODcsIZk7Y0UEsRagqyqU
	 apvtISjfTK3VCm1KbtdALbAvem8F+uDHUO8iQGy/3EpQ0/hf6nnTaHXz5vvlS2cavO
	 1M4UjrO5XMMHUElxqfvO398DtOlhf+t1HkG7MamPnO9x7ElsSGmLmhJ0QsI7wcrhZB
	 RhsiynGYI/rMxrmOEFO2ez5gRLJ6e/QnFexsuyERikhjRp9/9VAgBw7b/9HNrk07Rc
	 BS6mJJCpYsDc4LWRUQyQLOJ3tOClprGQrIw9MJNY9uRs5QZyhub8u85noh67C5k6+c
	 pHSDMOFepbieQ==
Date: Thu, 29 Oct 2026 23:57:10 +0100
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Christopher Bazley <chris.bazley.wg14@gmail.com>
Cc: Martin Uecker <uecker@tugraz.at>, 
	"Michael Kerrisk (man7.org)" <mtk@man7.org>, linux-man@vger.kernel.org, 
	Michael Kerrisk <mtk.manpages@gmail.com>, Sam James <sam@gentoo.org>, Carlos O'Donell <carlos@redhat.com>, 
	"Joseph S. Myers" <josmyers@redhat.com>, corbet@lwn.net
Subject: Re: [PATCH] man/: SYNOPSIS: Remove GNU forward-declarations of
 parameters for lengths of array parameters
Message-ID: <auPMgtCvcPOooOYU@devuan>
References: <CAFs=pga6UWmH6FJZcf0wRi2S3PdbrJWNFeVbkQVVmncB3Ni=-g@mail.gmail.com>
 <atyxz7Uj4rue8HjP@debian>
 <CAEHU8x9P3PLFAMpJ7wfYapvJkEt4b09KR9sypjUuONRniAQT3w@mail.gmail.com>
 <atzcMTC3Hl4GPD39@debian>
 <fbd4d03cbaf3e0b3a978ca3ff3902103ed954a87.camel@tugraz.at>
 <at2l_NpU28j3n6L0@debian>
 <dd9ca27e6b4c227c08cd707aab9b0b5d495c203c.camel@tugraz.at>
 <at2vv1isjbPZ6-34@debian>
 <76bff7cc342961bf81acc4a2d60e8c3d01918433.camel@tugraz.at>
 <CAEHU8x_+Lyf=K+pNzG0SWPRkQrb5AtqjYdkehV-fwX3ahsPrQQ@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="6fuvvsafsonnmthf"
Content-Disposition: inline
In-Reply-To: <CAEHU8x_+Lyf=K+pNzG0SWPRkQrb5AtqjYdkehV-fwX3ahsPrQQ@mail.gmail.com>


--6fuvvsafsonnmthf
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Christopher Bazley <chris.bazley.wg14@gmail.com>
Cc: Martin Uecker <uecker@tugraz.at>, 
	"Michael Kerrisk (man7.org)" <mtk@man7.org>, linux-man@vger.kernel.org, 
	Michael Kerrisk <mtk.manpages@gmail.com>, Sam James <sam@gentoo.org>, Carlos O'Donell <carlos@redhat.com>, 
	"Joseph S. Myers" <josmyers@redhat.com>, corbet@lwn.net
Subject: Re: [PATCH] man/: SYNOPSIS: Remove GNU forward-declarations of
 parameters for lengths of array parameters
Message-ID: <auPMgtCvcPOooOYU@devuan>
References: <CAFs=pga6UWmH6FJZcf0wRi2S3PdbrJWNFeVbkQVVmncB3Ni=-g@mail.gmail.com>
 <atyxz7Uj4rue8HjP@debian>
 <CAEHU8x9P3PLFAMpJ7wfYapvJkEt4b09KR9sypjUuONRniAQT3w@mail.gmail.com>
 <atzcMTC3Hl4GPD39@debian>
 <fbd4d03cbaf3e0b3a978ca3ff3902103ed954a87.camel@tugraz.at>
 <at2l_NpU28j3n6L0@debian>
 <dd9ca27e6b4c227c08cd707aab9b0b5d495c203c.camel@tugraz.at>
 <at2vv1isjbPZ6-34@debian>
 <76bff7cc342961bf81acc4a2d60e8c3d01918433.camel@tugraz.at>
 <CAEHU8x_+Lyf=K+pNzG0SWPRkQrb5AtqjYdkehV-fwX3ahsPrQQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEHU8x_+Lyf=K+pNzG0SWPRkQrb5AtqjYdkehV-fwX3ahsPrQQ@mail.gmail.com>

Hi Chris,

> Date: 2026-10-29 21:24:14+0000
> From: Christopher Bazley <chris.bazley.wg14@gmail.com>
>
[...]
> I don't want anything like this (fictitious) syntax:
>=20
> bool ObjEditSelection_for_each_changed(ObjEditSelection const *a,
>   ObjEditSelection const *b,
>   _Optional MapArea const *map_area,
>   void callback[static](MapPoint, void *), void *cb_arg);

Indeed, me neither.  Just to clarify, this will still be disallowed by
my paper.

> What C actually needs is a standard extension to the direct declarator
> syntax to allow pointers to functions of qualified type.  Even
> disregarding _Optional, SDCC's __reentrant and __banked keywords would
> benefit from such standard syntax. SDCC currently has inconsistencies
> in this area, for example https://sourceforge.net/p/sdcc/bugs/3989/
> and https://sourceforge.net/p/sdcc/bugs/4027/

Also agree.  In fact, I believe [[reproducible]] should actually be a
_Reproducible function qualifier (actually, an anti-qualifier).  I plan
to work on a paper for that, but I need several things to happen first:

-  Non-access qualifiers to be standardized.  Several function
   qualifiers, to avoid annotating most functions, should be
   anti-qualifiers.

   I believe the paper about address-space qualifiers will help in this
   regard.

-  Type variance.  This is essential for backwards compatiblity.

> Although the keywords __reentrant and __banked appear syntactically in
> the position of a C23 attribute, I consider them type qualifiers
> rather than attributes because ignoring them can change the calling
> convention and make calls incorrect. They also participate in type
> checking:
>=20
> int reentrant(int *) __reentrant;
> int banked(int *) __banked;
> int plain(int *);
>=20
> int main(void)
> {
>     int (*r)(int *) __reentrant =3D reentrant;
>     r =3D plain; // how is this safe?
>     r =3D banked; // error
>=20
>     int (*b)(int *) __banked =3D banked;
>     b =3D plain; // error
>     b =3D reentrant; // error
>=20
>     int (*p)(int *) =3D plain;
>     p =3D reentrant;
>     p =3D banked; // error
>=20
>     return 0;
> }
> https://godbolt.org/z/hPsxWe6Ga
>=20
> I increasingly think this is also the right position for the qualifier
> in a declaration of a pointer to
> an optional function, e.g.
>=20
> int (*o)(int *) _Optional =3D fn;
>=20
> as a possible alternative to
>=20
> _Optional typeof(int (int *)) *o =3D fn;

Also agree.  My idea was to have this:

	size_t strlen(const char *s) _Reproducible;

and collapse both attributes into a single qualifier.  We don't need
a tri-state, IMO.


Have a lovely night!
Alex

> Currently, type-qualifier-list appears after
> attribute-specifier-sequence in both alternatives for 'pointer'
> but not elsewhere it would be needed, such as after
> function-declarator in one of the alternatives for direct-declarator,
> nor after function-abstract-declarator in one of the alternatives for
> direct-abstract-declarator (which is where it would need to be
> permitted to allow qualified function type names to appear in casts).
>=20
> Best regards,
> Christopher

--=20
<https://www.alejandro-colomar.es>

--6fuvvsafsonnmthf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrjz0AACgkQ64mZXMKQ
wqm1HQ/9EtlAs8/w30EO4GjMiCf8cuI116bsWHFSRHRMG6KkOblYX45D/yWGV/aH
m1WRla0MzpgSUGKi42eEWiAE2L9FYDRAKIshh0IF07YbcUy9Dn6VqwV3mVcEMGSM
Hc5+N4VkPPvEbiiCNQ6XVhT7AJkWngm2TIciWzj7Cp3dqlZZWY5moOEMTe0S7hND
uRepkLub0XT0iQrIHyJFj1R+q8Y/uv/T8Mqho/gz13wnhIJhv5IC1PXW5GJ3y7UG
gFjx8oUUOUowUMLvVfhJMc8YQqJUxYLM4diOV+lOQ54ke7xMne3/LGRVe20dwISM
z0EALKVOrBQ8jxLE9QgRFHcjY9UwwXUMfo/GM3RiHvXXJ/o8X4DEaiaTgbWWs4JT
v7KFGSdr1QVcDFm5muxqy2RL6FChsuKSdJLT49FqPRBl2kSuhqyyyJ7LUd05rkxO
nfCkpUFOFTTMdb8BBVnckSOqEC0Go2KVIldsGYYcgn/bOIbb9N8gmdRiCWdVzwrb
hxELlKhJpcQGmrEV9+WUq1lboRPQd6H74cj78jAJEgn1DKyfhrzqdR++LWNMlB7L
NO6zDUDuqMnNHKSOkefOFgoSt+OeXonJ8du5DHTmWc+8MsDlR19DhZNCVb/DusG0
PgHdjghQrHg4ZjKC2Q7z2UdjqcW9UWQAEZru294VqnUhALvElj8=
=sdNR
-----END PGP SIGNATURE-----

--6fuvvsafsonnmthf--
