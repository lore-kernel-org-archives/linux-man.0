Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA80738AC64
	for <linux-man@vger.kernel.org>; Sun,  2 Aug 2026 11:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785670187; cv=none; b=MPgWCPNU2MESMMJcJ/m0Aao4B9XS2TjzYr5HGP8FSx/1pqwIuaUVyLECJ8LAD7dTV6TpPtSZtkjgE0ZLIGQE1ZZ9PQUtVKOOEB7YLdq8F/QpxLXyaxc2zX/hHm3vW4IW98UM9Al5+fWSmCun4i0V0yKz2btKt5+Cg9ZwfJhzrCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785670187; c=relaxed/simple;
	bh=4uyGU8zZQ2kp6ks/p4x8TRlzsQH+RlojqrewXSjjaTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jaw4nhgKl9sw8PKHg1Oq5A43efaFP03rYk0YBNtyDc13VgAvlFRgx8z5MDsf4r9Hx4kS4zpOjUinaveijb4CrgGq+mexMyVkuqijaYUhVVnSLdDxK3gg/0IMwaErcClT2+TllDm0GbvkcZVJ/Gbe06LTI7vK4/3hRjM3wFzTRsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G/BclEbJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G/BclEbJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55CBF1F000E9;
	Sun,  2 Aug 2026 11:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785670185;
	bh=Xgicxso1Id3+q1ZVzY06vRf+fidgLBAdqkBXQbtmsrs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G/BclEbJjDBxG6qqJgPx413B55jeLOOM+or7MXE5vrNXRBw5tb/5OLKaBy8GVzoLd
	 405dGFb0OF8zDdoTKZb9JvYjyomOgTdj/xUsxT7IfmyqlCQ0JP/yV0KpUSiFzoKHnT
	 1Zbvl3ZwhMV/T6DxzEMOvpGuoxi63v6WnIVXSXwTchSGYYkBbSLtfsL/w3c6pHC/1k
	 5lHo6JauptN2JcxcMyMYG3EY/zDoC5KaKjPsVdbiYaAqdl9cn+knJJZSIEy0dpRKim
	 Z8eX7dIQ3Ij98S0+h57xlwnW1c+rjSnoy8NdDx2zc3qDcXY0VP6HBfbTe1eMzoSM1u
	 QFt8avXQHkOYA==
Date: Sun, 2 Aug 2026 13:29:41 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Collin Funk <collin.funk1@gmail.com>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org
Subject: Re: the Linux man-pages as an educational tool
Message-ID: <am8nRpn_xeWoHxho@devuan>
References: <am50AM0bdufHa9W3@devuan>
 <15288158.RDIVbhacDa@cagnes>
 <am56ZBzNM5J07AUa@devuan>
 <f3f50282-8f40-449b-87c2-5df85fbfdc4e@cs.ucla.edu>
 <am6CnOddgaM10pry@devuan>
 <20260802000833.zpu27l7ibvrbouna@illithid>
 <am6PkypxYg-Fq4Iz@devuan>
 <87cxw1s58a.fsf@gmail.com>
 <am6X32HkGdm2xTd7@devuan>
 <87cxw1qokw.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rfqdpaboxajvbodm"
Content-Disposition: inline
In-Reply-To: <87cxw1qokw.fsf@gmail.com>


--rfqdpaboxajvbodm
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Collin Funk <collin.funk1@gmail.com>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org
Subject: Re: the Linux man-pages as an educational tool
Message-ID: <am8nRpn_xeWoHxho@devuan>
References: <am50AM0bdufHa9W3@devuan>
 <15288158.RDIVbhacDa@cagnes>
 <am56ZBzNM5J07AUa@devuan>
 <f3f50282-8f40-449b-87c2-5df85fbfdc4e@cs.ucla.edu>
 <am6CnOddgaM10pry@devuan>
 <20260802000833.zpu27l7ibvrbouna@illithid>
 <am6PkypxYg-Fq4Iz@devuan>
 <87cxw1s58a.fsf@gmail.com>
 <am6X32HkGdm2xTd7@devuan>
 <87cxw1qokw.fsf@gmail.com>
MIME-Version: 1.0
In-Reply-To: <87cxw1qokw.fsf@gmail.com>

Hi Collin,

> Date: 2026-08-01 18:49:03-0700
> From: Collin Funk <collin.funk1@gmail.com>
>
> Alejandro Colomar <alx@kernel.org> writes:
>=20
> > I'm not innovating if I say that the standards are mostly ignored.
> > Actually, I am more in the side of following the standards as much as
> > possible and appropriate (but not more) on average.
> >
> > This is just a case where educating on the current standards is done by
> > 1) documenting at the bottom of the manual what the standard says, and
> > 2) recommending to ignore it because it's bad.  When the standards are
> > bad, this is appropriate course.
>=20
> But myself and likely many others who have commented on this thread do
> not agree that strings.h is a bad name. Or that general memory related
> functions, which are used on strings a large portion of the time, need a
> separate header.

This is an opinion, which I respect, but don't agree with.

The vocal many people with that opinion have had 37 years to show how
the solution to string handling bugs was a different one.

I've done my research, and am convinced that this is an unintrusive
partial solution.  As the ultimate responsible of this documentation
project, I'll commit to this solution.  Time will tell whether I am
wrong.  I think string handling is already so messed in people's heads,
that at worst this solution won't do any noticeable good or bad, and at
best it might put an end to the problem.

> In one of your original messages you mentioned the following:
>=20
> > The standard mixes functions for handling strings, functions for
> > handling bytes, and other hybrids, all in a single header file:
> > <string.h>.
> >
> > This has historically caused confusion, for example leading to believe
> > that strncpy(3) is appropriate to handle strings.
>=20
> Then, in another you said:
>=20
> > I find that an acceptable result.  #include's aren't that important.
> > When reading code, the section of #include's is unimportant as long as
> > it works.
>=20
> If I concede that "#include's aren't that important",

That sentence was in context.  #include's aren't that important in code.
They are important in documentation and education (as I replied to
Paul).

> then strncpy still
> exists and still looks like a function that should be used on
> strings.

The documentation part (including the global header classification,
which appears in the SYNOPSIS) is what makes (or should make) it not
look like a function that should be used on strings.

The name should also be part of that, but that ship sailed.  We could
actually also attempt at fixing the name, like the Linux kernel has
done, but that's a different topic.

> So, we have still have the same problem unaddressed, right?
> People will still use the function and write bugs.
>=20
> > The manual pages should certainly educate about reality, and standards
> > are only secondary to that.
>=20
> The current reality and standards are fully in alignment here. memcpy et
> al. have been defined in string.h since before I was born.

And they have also been defined in <memory.h> since before you and I
were born.

> Anyone who
> knows of memory.h knows that they can just do s/memory/string/ and make
> their code look more recent. Anyone who doesn't know about memory.h will
> be confused why the man-pages tell them to use a different header than
> they have used for decades.

That's why I've documented the reason in memory.h(3head).

> New programmers will follow those
> instructions and find their code breaks on illumos, when it really
> shouldn't.

I hope Illumos adds <memory.h>.  Also, I don't expect new programmers to
be exactly the kind of programmers that use Illumos.

> Collin


Have a lovely day!
Alex

--=20
<https://www.alejandro-colomar.es>

--rfqdpaboxajvbodm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpvKh8ACgkQ64mZXMKQ
wqn/Tw//eoCARbYJ1LF1KRvrYa9dYwRIpSZSlx+dijV7BaToh3BAG39FCMw0J/54
gf0U8PJWVBBpT+Za62tusnKsBjsEFX0hVGohfMyjpRDUH0bB6Jx/ChLBVv14OwBX
L9RnV/DYZoHMfmmJUs7AweUKIs1KlSHSXR3B+YLB5eG5MOQ5LsscdiQCUR0eOEvz
3eZoaemAzk1ZcZWLfj8PNHieEbLsLMpWs9ju8f/S7uw8GXs4484mkrTxIdJ7zE77
ALh01no6ATz2m3MkKdBS62anbk8e3QK5xrUlmpbPxlNzsbmmxRoPlOLWjquuF0Ia
XUwTGeFwBwTXT+wUx4ACOElHbZxJhNivdNkizGl+T/vr1zbO70laE+LpsFujHDRJ
tV0LBtfA749ReePoaanvHpD/ygzZ/IvM3auvikWOCy/gTB3KPLj4BYrh624sjkER
sjlTp6I/jPxfx2so4RoqfXVb/wyrvDQTk4wy//CCUhl3qrMNwnIuv4I7ouTm6tGQ
BdW8aWKzdL7GxtueADXFkyce1mm6joPrKSzY22HbPy6YwtKkq8FmfPV4dnvkJJTY
TJeDpBTA7ThO88mtiw8eyYwFMroJqe0aZ4Lt0QueHbLPor+xK7y7FFR8XnTrbSSM
OOMZB9n3yyrlOrq9qKSPKMm0F5bol30SFk25xkT58bXA9OVBB0U=
=An37
-----END PGP SIGNATURE-----

--rfqdpaboxajvbodm--
