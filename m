Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45092222AC
	for <linux-man@vger.kernel.org>; Sat, 29 Aug 2026 09:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787994179; cv=none; b=TA2COFXNBe5jqhCbkNR5uLrPsUxuT5FrXZS1ecll273T5ds4jxOu+5k1mAJsKcaKrrprkVUK5kt90kLJfyt3epli9WOxdmUuAih99DpN8gp3o+LGj89qEoor01g0AVxIHKdg9AbTEzi726+8/nbpFfTAPPqRM3Ks3YKcnOSKGqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787994179; c=relaxed/simple;
	bh=AxSFJqW8Weg6tO4oLtGdB4z0Nnwq0Bi7qP25mkfk2jg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rkbr5lCho544qhMeu7g9g/kKzmKhTfTVTN+oZaQdZgKMnp82s69UT4IFShLnDAKCUpJbyzq0rAVLVDU+paT9jHMn0RRLcTrOfsWZClQ5uTQJVZlHaB9exSbFpe6DL15nBuR07ErpG4L7Ih/emZq25mpPBqLCWpM1fJAwTxvRttY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GIutwcls; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GIutwcls"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AF211F00A3D;
	Sat, 29 Aug 2026 09:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787994177;
	bh=g0PLGgUHBgqimNSWGo8JN3NE1g4F4mJO4JPCix2o/4Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GIutwclstNh3xAfeFZPYnMtaBjZ83jRzJPpp9Yae6ehh003psVa9Vy2bwYtF/Gyvi
	 nou7BMCYT/XvB+G2AWz9ycOtAlDzPoZ1jPD3fgwCshJAh08XNHzuTsLdBhCQ70MCt9
	 C7uY/OdskQMQvlEaWuOVRnIHJtcb9sq04z6scBla9HgBbj2AqQkIQ228udvzyywSFa
	 s08n5uMhyfGBW2vuFlACkOvCQ5TvAEaGxmnVIneEOHAt6h3I7kFYPjBIfhYJ4L7x6w
	 Q1/M3117v8h2Dx9TclNeEZmATNYMlMsDKyMp/QM2wyV5wXO2Rj4fsqMI9PL32sbXa4
	 y2CXd1RDtpEhA==
Date: Sat, 29 Aug 2026 11:02:53 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Larry Kollar <larry.kollar@icloud.com>
Cc: Groff <groff@gnu.org>, linux-man@vger.kernel.org
Subject: Re: Using LS/LE (was: [PATCH v4 2/4] man/man5/tunables.conf:
 Document system-wide tunables config)
Message-ID: <apKgD9rwWO0ejh41@devuan>
References: <20260823132749.pgypzsqv32n67wor@illithid>
 <aor4LIdGrSGHe3TB@devuan>
 <20260823141622.7vszwghxrxvkff4j@illithid>
 <aosHFaauEzKEFNpl@devuan>
 <20260823164451.5jeolmdu44ubpeba@illithid>
 <aotFzewQhmLJSk6N@devuan>
 <8DE76435-CBDB-42D6-9E0F-9E27291560B6@icloud.com>
 <apKYVACSvXx2pcGw@devuan>
 <apKcB5bwhYRoZdR4@devuan>
 <apKdoCfK_tYf5wX8@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cu5pqikoiidtop2c"
Content-Disposition: inline
In-Reply-To: <apKdoCfK_tYf5wX8@devuan>


--cu5pqikoiidtop2c
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Larry Kollar <larry.kollar@icloud.com>
Cc: Groff <groff@gnu.org>, linux-man@vger.kernel.org
Subject: Re: Using LS/LE (was: [PATCH v4 2/4] man/man5/tunables.conf:
 Document system-wide tunables config)
Message-ID: <apKgD9rwWO0ejh41@devuan>
References: <20260823132749.pgypzsqv32n67wor@illithid>
 <aor4LIdGrSGHe3TB@devuan>
 <20260823141622.7vszwghxrxvkff4j@illithid>
 <aosHFaauEzKEFNpl@devuan>
 <20260823164451.5jeolmdu44ubpeba@illithid>
 <aotFzewQhmLJSk6N@devuan>
 <8DE76435-CBDB-42D6-9E0F-9E27291560B6@icloud.com>
 <apKYVACSvXx2pcGw@devuan>
 <apKcB5bwhYRoZdR4@devuan>
 <apKdoCfK_tYf5wX8@devuan>
MIME-Version: 1.0
In-Reply-To: <apKdoCfK_tYf5wX8@devuan>

> Date: 2026-08-29 10:53:02+0200
> From: Alejandro Colomar <alx@kernel.org>
>
> > Date: 2026-08-29 10:45:34+0200
> > From: Alejandro Colomar <alx@kernel.org>
> >
> > > Date: 2026-08-29 10:42:14+0200
> > > From: Alejandro Colomar <alx@kernel.org>
> > >
> > > Hi Larry,
> > >=20
> > > > Date: 2026-08-28 22:50:50-0400
> > > > From: Larry Kollar <larry.kollar@icloud.com>
> > > >
> > > >=20
> > > > Alejandro Colomar <alx@kernel.org> wrote:
> > > >=20
> > > > > I believe that a set of makefiles that would handle all of the ta=
rgets
> > > > > of a project like groff wouldn't take much more than that.  It mi=
ght be
> > > > > a few hundred kB.  If it's well organized, it can be maintainable.
> > > > >=20
> > > > > Because the makefile language is so simple, bugs are easy to spot=
 and
> > > > > fix, compared to autotools (possibly automake, but I can't distin=
guish
> > > > > them enough).
> > > >=20
> > > > I don=E2=80=99t know. Can a Makefile check for the presence of cert=
ain libraries
> > > > or other apps and fail gracefully (by which I mean exiting with a m=
essage
> > > > like =E2=80=9CYou need app X, plus libraries Y and Z, installed to =
successfully
> > > > compile this.=E2=80=9D)? That=E2=80=99s one of the things that =E2=
=80=9Cmakes" me appreciate taking
> > > > that extra step of typing `.configure` before make.
> > >=20
> > > Yes, it can.  Here's a trivial test for that:
> > >=20
> > > 	alx@devuan:~/tmp/testlib$ cat Makefile=20
> > > 	HAS_LIBFOO :=3D $(shell find /usr/include/foo.h >/dev/null && echo y=
es || echo no)
>=20
> You can also trivially test with gcc(1) instead of find(1):
>=20
> 	$ echo '#include <foo.h>' | gcc -x c -E >/dev/null 2>&1 && echo yes || e=
cho no
> 	no
>=20
> If you put that expression within $(shell ...), you can use it similarly.

Of course, I had some typos there.

Here's a fully working example:

	alx@devuan:~/tmp/testlib$ cat Makefile=20
	CC ::=3D cc

	HAS_STDLIB ::=3D \
		$(shell \
			echo '#include <stdlib.h>' \
			| $(CC) -x c - -E >/dev/null \
			&& echo yes \
			|| echo no; \
		)

	HAS_LIBFOO ::=3D \
		$(shell \
			echo '#include <foo.h>' \
			| $(CC) -x c - -E >/dev/null \
			&& echo yes \
			|| echo no; \
		)

	ifeq ($(HAS_STDLIB),no)
	  $(error You need <stdlib.h> installed to successfully compile this)
	endif
	ifeq ($(HAS_LIBFOO),no)
	  $(error You need library FOO installed to successfully compile this)
	endif

	all:
		echo Done
	alx@devuan:~/tmp/testlib$ make
	<stdin>:1:10: fatal error: foo.h: No such file or directory
	compilation terminated.
	Makefile:23: *** You need library FOO installed to successfully compile th=
is.  Stop.


Cheers,
Alex

>=20
>=20
> Cheers,
> alex
>=20
> > >=20
> > > 	ifeq ($(HAS_LIBFOO),no)
> > > 	  $(error You need library FOO installed to successfully compile thi=
s.)
> >=20
> > Oh, I didn't need the period here...
> >=20
> > > 	endif
> > >=20
> > > 	all:
> > > 		echo Done
> > > 	alx@devuan:~/tmp/testlib$ make
> > > 	find: =E2=80=98/usr/include/foo.h=E2=80=99: No such file or directory
> > > 	Makefile:4: *** You need library FOO installed to successfully compi=
le this..  Stop.
> >=20
> > ... make(1) already appended one here.
> >=20
> > :)
> >=20
> > >=20
> > > You may of course write more complex tests if you need.  Anything that
> > > you can do with a shell script, you can do it with a Makefile.
> > >=20
> > > That said, I personally prefer to fail compilation due to missing hea=
der
> > > files.  It's simpler, and there's not much difference.  After all, if
> > > compilation fails for <foo.h>, it's trivial to run
> > >=20
> > > 	$ apt-file find /include/foo.h
> > >=20
> > > But if you want the test, you can have it.
> > >=20
> > >=20
> > > Have a lovely day!
> > > Alex
> > >=20
> > > --=20
> > > <https://www.alejandro-colomar.es>
> >=20
> >=20
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

--cu5pqikoiidtop2c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqSoD0ACgkQ64mZXMKQ
wql5Xg/8Dz+on+73xxF/Q5f/zeKxAyEXl9dGtG+MzAZi3Lu0WwBv2lkb7OmOWHs5
iY5p9Wy7TuZCeOXh+ooUzV0KxXwAbZXyiWPgj19A9sdpp0cEjmQSdHusRF4JCOpP
lE9wV7qewmucFTzE0E6XzqQbsQBeh53a23Qx+6KjC6V+RgLemDVnGzw28K8lAm+p
scgOF6A3G5C2eY3aLiTeX6EBVne5lxIei7gJ4UBKnqtHKljjFqpbVo7WjsuGkluI
W3Typ0mmMBBP8wdRHCbAcrr36lC1s9OQGjaYPXS2gisisQruNRwvLNjriyk7HnYJ
VV+nLWon+RaCc1V2qj3bT04YxRcLlucrmyYR5LDDulGoPY4DG6Paq4YO4dZcbCrh
gC5pnJbW3x/zOA0ZPTz6nBh6ibaB0T8RW06Z7weqxvYF+dTsBXhymrQBl2GuFuSr
XRl1+yncYTdvVdzPSldirdmZbLjr6HhZqh7GgGE5UXH1NejFpda3Yp+KSsppaGnI
SjpeROcceqVjFlnKo1cdDmZusI40TuPnqX+4BsGKA8pfvLYBz5plKJj1yS1UzsPb
zaiDCiyY9zU5rlflvUViPO+elTg5uoD521TyihojVHhn9Ims5Lh0XoGYV1M/6VfN
PVvo7JlJ3/hNuoL75vgdWR07RFsHp73brKTuSpso2ZKKVzLQlkw=
=eN+P
-----END PGP SIGNATURE-----

--cu5pqikoiidtop2c--
