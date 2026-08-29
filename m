Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1363E86341
	for <linux-man@vger.kernel.org>; Sat, 29 Aug 2026 08:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787993139; cv=none; b=PVdGZi3J2EmiBjXJCAFou+JocLzOV+yTkcEeHAWGQJEdnRpoGVn2tsZOYk2nbcC0lCAEM2A7cFmGM8tJCluHWZ1XV3nXrgmwM1ijjVSTzRYfklPmrnm6T1bCz1khv1fQienrzRIPxcm6RBqXwEi2CdBKFDquX955FI/VaiX7+tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787993139; c=relaxed/simple;
	bh=eIZ8lgc7T4hmIB19rMtLudt+5dMSrhpQenrn8cxsgJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BN5pMsrgH0G7fWOPYlaOtF91AULqMSctXJwHeklbd46MqttXHNWaZjtCw116HW9cTK7pWMdXa3n5IIUnIAhOUlANgbtKtl4RYUlE02imJOpkby7tMhhz3Fja6cZJRNt/AdHNFibPalsLWnDTN0gDhzxXiTlEtvN2DJJGyTeTuUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F0WggyDF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F0WggyDF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF3AF1F000E9;
	Sat, 29 Aug 2026 08:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787993137;
	bh=JBwfuIy3h+0+xrP1b28rEB1JlzPrhDEO6JY+ofJcAHQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F0WggyDFNrFSAWV0V+r1AKDTkonfu2rzbn4xFIJXWtqnZ5ZZ93/0Ity8Dj5bUWjhV
	 D2MAEGW0+QVvCqjMNAzDno+4yQA/WFCFRzYVz45TVStNR2yTN68prVD9JPfVF0PuFZ
	 9DEeyv0ri9cEd65q1KFxhqp3DFBjvnwamnOMOcXy6HHAeq2YR3+471CzD2QM+iBFqs
	 EZukFUaqM9BftPttaPkWRaZ69zDFZCVf5FaJQDWNHyHMMzeDhWrbenVJp7GOANZjaL
	 hWOaYeNdOrlI8YWUSE2icfUR7Uj/57AoQYZQ2CgYmeY6BIczhfKIM5/cbq4Kh4WIcp
	 GdJuxHSnWJctw==
Date: Sat, 29 Aug 2026 10:45:34 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Larry Kollar <larry.kollar@icloud.com>
Cc: Groff <groff@gnu.org>, linux-man@vger.kernel.org
Subject: Re: Using LS/LE (was: [PATCH v4 2/4] man/man5/tunables.conf:
 Document system-wide tunables config)
Message-ID: <apKcB5bwhYRoZdR4@devuan>
References: <20260807021256.pwzsls7awqmbslti@illithid>
 <aorlBv8YTu4JlZcy@devuan>
 <20260823132749.pgypzsqv32n67wor@illithid>
 <aor4LIdGrSGHe3TB@devuan>
 <20260823141622.7vszwghxrxvkff4j@illithid>
 <aosHFaauEzKEFNpl@devuan>
 <20260823164451.5jeolmdu44ubpeba@illithid>
 <aotFzewQhmLJSk6N@devuan>
 <8DE76435-CBDB-42D6-9E0F-9E27291560B6@icloud.com>
 <apKYVACSvXx2pcGw@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wumtz62ly6ivuz6y"
Content-Disposition: inline
In-Reply-To: <apKYVACSvXx2pcGw@devuan>


--wumtz62ly6ivuz6y
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Larry Kollar <larry.kollar@icloud.com>
Cc: Groff <groff@gnu.org>, linux-man@vger.kernel.org
Subject: Re: Using LS/LE (was: [PATCH v4 2/4] man/man5/tunables.conf:
 Document system-wide tunables config)
Message-ID: <apKcB5bwhYRoZdR4@devuan>
References: <20260807021256.pwzsls7awqmbslti@illithid>
 <aorlBv8YTu4JlZcy@devuan>
 <20260823132749.pgypzsqv32n67wor@illithid>
 <aor4LIdGrSGHe3TB@devuan>
 <20260823141622.7vszwghxrxvkff4j@illithid>
 <aosHFaauEzKEFNpl@devuan>
 <20260823164451.5jeolmdu44ubpeba@illithid>
 <aotFzewQhmLJSk6N@devuan>
 <8DE76435-CBDB-42D6-9E0F-9E27291560B6@icloud.com>
 <apKYVACSvXx2pcGw@devuan>
MIME-Version: 1.0
In-Reply-To: <apKYVACSvXx2pcGw@devuan>

> Date: 2026-08-29 10:42:14+0200
> From: Alejandro Colomar <alx@kernel.org>
>
> Hi Larry,
>=20
> > Date: 2026-08-28 22:50:50-0400
> > From: Larry Kollar <larry.kollar@icloud.com>
> >
> >=20
> > Alejandro Colomar <alx@kernel.org> wrote:
> >=20
> > > I believe that a set of makefiles that would handle all of the targets
> > > of a project like groff wouldn't take much more than that.  It might =
be
> > > a few hundred kB.  If it's well organized, it can be maintainable.
> > >=20
> > > Because the makefile language is so simple, bugs are easy to spot and
> > > fix, compared to autotools (possibly automake, but I can't distinguish
> > > them enough).
> >=20
> > I don=E2=80=99t know. Can a Makefile check for the presence of certain =
libraries
> > or other apps and fail gracefully (by which I mean exiting with a messa=
ge
> > like =E2=80=9CYou need app X, plus libraries Y and Z, installed to succ=
essfully
> > compile this.=E2=80=9D)? That=E2=80=99s one of the things that =E2=80=
=9Cmakes" me appreciate taking
> > that extra step of typing `.configure` before make.
>=20
> Yes, it can.  Here's a trivial test for that:
>=20
> 	alx@devuan:~/tmp/testlib$ cat Makefile=20
> 	HAS_LIBFOO :=3D $(shell find /usr/include/foo.h >/dev/null && echo yes |=
| echo no)
>=20
> 	ifeq ($(HAS_LIBFOO),no)
> 	  $(error You need library FOO installed to successfully compile this.)

Oh, I didn't need the period here...

> 	endif
>=20
> 	all:
> 		echo Done
> 	alx@devuan:~/tmp/testlib$ make
> 	find: =E2=80=98/usr/include/foo.h=E2=80=99: No such file or directory
> 	Makefile:4: *** You need library FOO installed to successfully compile t=
his..  Stop.

=2E.. make(1) already appended one here.

:)

>=20
> You may of course write more complex tests if you need.  Anything that
> you can do with a shell script, you can do it with a Makefile.
>=20
> That said, I personally prefer to fail compilation due to missing header
> files.  It's simpler, and there's not much difference.  After all, if
> compilation fails for <foo.h>, it's trivial to run
>=20
> 	$ apt-file find /include/foo.h
>=20
> But if you want the test, you can have it.
>=20
>=20
> Have a lovely day!
> Alex
>=20
> --=20
> <https://www.alejandro-colomar.es>



--=20
<https://www.alejandro-colomar.es>

--wumtz62ly6ivuz6y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqSnC4ACgkQ64mZXMKQ
wqnC7w//UsLzGH3M0q4i53OzZLLHrNw6V/Fh5ujuu+1chZWr0LS8H2BU9OfGLkir
noHGWFdfXS32XAn4ykLXuK1ZQa2IJlf2LrpFpMPL9HaEW2z+RQC5bT801g2yjTLd
OWIreMhtOYV2e7IUbakEDEYTE3DKVhEBFO6mxvioHc61Ka+KFH6aM1EwFC05kjPA
uEhdHtZDao7PU9M5frKzU/TvTDwg2c4cNz4BokGHYXbMT3S+de8zkn9ttKmGuwyA
9KnVZsgIk8Syq2KM53VIGHR7palgauvhiBjfLVxf4IwxXroanLO7o1G1eqIe7VzV
oKupubbQQ4Tdls0H+pFrTC0tKdovHCd4F3tHvPLCK4QAYhQHnwrvpWQYP/ksiMP1
MqO8lXzxMJWy5xabM4Z3/QuBlZ5w9gXsQypPN3rjlvrbLxJnSEpgMqX0Kxoi0v3X
mdwoEWxJ2M9TojKCYN4ZTUAue+0I++VeFFbiX6jqe6OKPlAA0gX5DnY6vyMIfH/X
ltdNHRYngR5Wq9dxes8spKfLB+Y9uyg2mTRJnQXosvm/i0ElL95meVwBJIJK5Olj
Hd3XA9VIM/MpgbBFA4tIuQgfsBqrNilXePROr0cCbOppmuVWVoeLWK5FFo6h/dQ3
AfAKPel56c0jF/7QMhZxYALHe2X+z4HTo41LuT8xGkdqN3G0Nws=
=BFx3
-----END PGP SIGNATURE-----

--wumtz62ly6ivuz6y--
