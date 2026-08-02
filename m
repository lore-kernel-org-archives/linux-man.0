Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BE43B0AD7
	for <linux-man@vger.kernel.org>; Sun,  2 Aug 2026 14:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785679921; cv=none; b=bR3TWIMn1D4s6fxmObM5CWJIQS6kzX9NCzrOzKfLt3fs8A3lUx5LijAYTCyTx6nSj8uIwSxHQPshceKlTHyI8o8r+Hi0Uyn/ubx2CZUsakbWD7HNeXE4Keu0i4RlrukIZtCEwr3QhAMouOwSVrjrarYtYt4823mXAsmo3+4sBQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785679921; c=relaxed/simple;
	bh=z/2my6X9wJ8QXmtsKFBRikNI3MAdDqo1PRxoaH7eqJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GwoVX7b9pMpkL709d/ZV2jTRXlUlK8qBJyjLOfF/kEgz6iepJS3EpaF+8Zdf1WWdbTkONIWyCzTkDC0DL1aDXqPRUWIKlzQ7a9SliMwzykLWHwjpW+i6sb4f6lqP3FFBiwLuCF+3nhz9raxRH8g98ZjXs+QdGsFHH3EblL6l4aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kV/V4UPR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kV/V4UPR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6BED1F000E9;
	Sun,  2 Aug 2026 14:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785679919;
	bh=h1sSpJbrQ9ynSUShuWhaBvPmWJdA1jGLFldemPAyNNQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kV/V4UPRWDmtSNefMvX9vWkW/jDTPSZOQiJrKHpauSRP7MKjuXKYyTj/R20VpMZqN
	 y5pDzz/A2VtKvPyzPku6JNg42750G2Vw7DNNjIavZl8DHwEHFPUi/h385TibPVItdQ
	 DwpLYHzKij2P2cJsmkICJhGvRyceT05yjkQdiRgtCIzwc5L/D0EpHC0XDnBT+P9l30
	 ngWK16T6UITSEH6QYB9ngHaNhorAXmdfvXIgUgVjU7F21qEHn9OWDVrMq0kdbiwMoA
	 UuxsHfrvwHAEaFiSUblGvlpuWjbsab9GE4AsfEX+v7RJ3q2qilNI1OQl3OxEw+pfsX
	 VAjSQJ8++Mu8Q==
Date: Sun, 2 Aug 2026 16:11:56 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Steve Summit <scs@eskimo.com>
Cc: bug-gnulib@gnu.org, libc-alpha@sourceware.org, 
	linux-man@vger.kernel.org
Subject: Re: on the irresponsibility of pursuing C language reform
Message-ID: <am9OEJxrIMFc15GZ@devuan>
References: <87y0epdhxp.fsf@gentoo.org>
 <am4GT1OkqNZD9FF9@devuan>
 <87zez5bz49.fsf@gentoo.org>
 <am4jxBOh_VRvhCQw@devuan>
 <CAETFuj2OwoyK9J85r2f0RoXbHbXKA4gQJ=JZ-7=QoqGcMwk0+Q@mail.gmail.com>
 <am51v4KmUmdzM-OT@devuan>
 <am5_uA4MSujYCS9X@devuan>
 <2026Aug02.0852.scs.0001@tanqueray.home>
 <am8_MfPmud43naU-@devuan>
 <2026Aug02.0945.scs.0002@tanqueray.home>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uzmgeujjv2kkxopj"
Content-Disposition: inline
In-Reply-To: <2026Aug02.0945.scs.0002@tanqueray.home>


--uzmgeujjv2kkxopj
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Steve Summit <scs@eskimo.com>
Cc: bug-gnulib@gnu.org, libc-alpha@sourceware.org, 
	linux-man@vger.kernel.org
Subject: Re: on the irresponsibility of pursuing C language reform
Message-ID: <am9OEJxrIMFc15GZ@devuan>
References: <87y0epdhxp.fsf@gentoo.org>
 <am4GT1OkqNZD9FF9@devuan>
 <87zez5bz49.fsf@gentoo.org>
 <am4jxBOh_VRvhCQw@devuan>
 <CAETFuj2OwoyK9J85r2f0RoXbHbXKA4gQJ=JZ-7=QoqGcMwk0+Q@mail.gmail.com>
 <am51v4KmUmdzM-OT@devuan>
 <am5_uA4MSujYCS9X@devuan>
 <2026Aug02.0852.scs.0001@tanqueray.home>
 <am8_MfPmud43naU-@devuan>
 <2026Aug02.0945.scs.0002@tanqueray.home>
MIME-Version: 1.0
In-Reply-To: <2026Aug02.0945.scs.0002@tanqueray.home>

Hi Steve,

> Date: 2026-08-02 09:45:17-0400
> From: Steve Summit <scs@eskimo.com>
>
> Alejandro wrote:
> >> Certainly, today, strncpy and strncat are the new gets.
> >
> > This is deeply incorrect.
>=20
> That was a side point, but to clarify what I meant:
>=20
> Once upon a time (and still today), it's a reasonable thing to say:
>=20
> 	Never use gets.  Don't worry if you don't understand the
> 	issue, don't worry if you heard someone say there's an
> 	obscure circumstance under which it might be useful,
> 	just don't ever use it; pretend it doesn't exist.
>=20
> Today I think it's equally reasonable to say:
>=20
> 	Never use strncpy and strncat.  Don't worry if you don't
> 	understand the issue, don't worry if you heard someone
> 	say there's an obscure circumstance under which they
> 	might be useful, just don't ever use them; pretend they
> 	don't exist.

This is not equally reasonable.  First of all, because there really is
an obscure circumstance under which, not only they are useful, but
actuall they are the best tool for the job.  If you tell users to never
ever use them, you're treating users as childs uncapable of
understanding the facts.  In fact, the documentation should instead
document the facts in a way that programmers can understand them and use
them appropriately.

Secondly, because this somehow attributes the danger to specific
functions, but the danger is in misusing functions.  For example, N2349,
which standardized memccpy(3), was following this premise: strncpy(3)
and strncat(3) are bad, so let's just find anything else; as long as
it's not one of those two functions, it should be fine.  But because
the underlying problem is not --and never has been-- the tools, but the
humans that misuse them, we have the irony that memccpy(3) is as
dangerous as strncpy(3), and even the paper that proposed it for
standardization invokes UB in the example code that is supposed to show
how it can be used for string copying.

> Though perhaps not strictly true, this is good advice, because it
> will never lead the average programmer astray.

No, it's not good advice either.  memccpy(3) and N2349 is a
counter-example of how even an expert programmer (Martin Sebor) will
still be led astray.

> strncpy is not a "fine function", because nobody is using
> (or should be using) fixed-width string buffers any more.
> (See, I can be opinionated, too! :-) )

I do use it in new code still today in shadow-utils.  I've heard tar(1)
also needs that, and a few other places.  Admittedly, that's orders of
magnitude less than strings.

> But we don't need to argue about this.  I said "strncpy and
> strncat are the new gets" to concede a point, to agree that
> discouraging the use of formerly-acceptable interfaces --
> a point that I thought you, and certainly that various people,
> were trying to make --

Not exactly; my point is that education must be used to teach users how
to correctly use interfaces.  I consider all these interfaces perfectly
acceptable.


Cheers,
Alex

> might be reasonable, even though it's one
> I often find myself disagreeing with.  But that's an opinion I
> decided to leave out of my previous message, and I'm not going to
> go down that road here, either.

--=20
<https://www.alejandro-colomar.es>

--uzmgeujjv2kkxopj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpvUCUACgkQ64mZXMKQ
wqn+9Q/9G8b1MkKii110xVdT9rGsWaw3/UPO5+8EFScCtOL2c1fbeBf8Tfk/qe87
4NUkFwOcfwFNLLlm+Os5QHuGO4H+oeHrDfrtZI9wDdXdMyxuDWdbF7LYUUYSgPw5
5Z2BHerIje4CTOdhpczs0Lj1THSPFZO1dzb5XTpWr/L1yExsv2EQMFmLra4T7wV/
4Ah2bGBDMhZvjDs4KQ2txKJKnEAtLH9kxaqDQM/1qBwa/qloPnl0VheoXoYg/eMd
SXWf9c5ceTG0/2+3X9HnLGnzDG9i+xi7yHggATS85crmoYRWbhWb0CkebP13+GYq
sj7GQoc4zRZty1kFwrhShKqEAK3YNZKS5sNCp3U92bFgoLkc5C2HjXiMza3WuMHk
0DjRgUI+ScVeFYMzkNKzlU2DFDcd646OB5IbdrbtsXP3hOiz30CrgzRCPnqzglpv
TyaLMTMYqMYROZMR/VMQfvcY871879LqSaABKTTIYGMnxwGo9Yc69eyY39RxWT/H
i59qdNTD5xTl2OJ7rw6gDmaQtm9FT3WabQCB4wC3fO+hfvgUMyXNJz+N2qCE6ekT
dCAJtg5KIKm1+LZLC0g6tsyUp5wTH23c/ji4AoxeIsfNg8iwjtPKKz1u7x45v5k+
5CrrUkwqTTwD4yuii0NdaR5GbyzbnKM4vnPHp14ih/oELoswCRw=
=6fbI
-----END PGP SIGNATURE-----

--uzmgeujjv2kkxopj--
