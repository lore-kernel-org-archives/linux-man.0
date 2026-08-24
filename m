Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EB9409604
	for <linux-man@vger.kernel.org>; Mon, 24 Aug 2026 11:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787569717; cv=none; b=ZSj0bUi2tbnk7mhvD93nMHAK7wYonH1Uq95w6QmM7Gm+Ym0IqxDliaLd/Pm93mgznap1/WQdAVO/2eqaHc41MwCOBzlwGueOG46CbLdrEBmeszkb/a7VEr54TLnxWTGnjXxytxqlmmUIWFSZcRonF1KKtFTAm1oKSEv4MiIwXis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787569717; c=relaxed/simple;
	bh=EH03pzgml2me7ZScy/yUHgUtv4cfob5qnCZSYz9TadE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mQSo6ds4TljpP2UxfmtT5PdkyXJ/yQR56KQb8zzkqPP5NHAirGUEUpRhUr8s0+VMu3BqeFtw+/cybXTWjjjVPK9CXtfzlSQbvn0GtGFqkvquzjvowzXmIB8BQNVtT7f3SypICgTVdd1gbcX4QSVmSpCuNdBuQNY2YVJACTeDi+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K6C3nohM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K6C3nohM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6868A1F000E9;
	Mon, 24 Aug 2026 11:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787569715;
	bh=KY84Q886lraC5vrSRujwUzOlBOszL31u2twA8u4RcFc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K6C3nohMq3F3enasBeBJc5wshvJV2lfEwmwiXl9L/h/ZDXEkKx2eQjo22Q5nMyGl7
	 YA8gZXji/3euarF8WDwO1U37T/Cg1+LbFjqEvO8756coYhgNQxYmgBcVHurB+Po8IN
	 GmVhrrY9ZWENLoovB0mEdmDUHLB2+idSbcziRnzpIkqg0Q7+mblo7n5z2Gcg511jO7
	 qlxBFcy9EIlZevuaqPeB3FmEr5DJ0MsB8ylQUGKo1FfGZqKzgJXKkmI0aZAE+8hr81
	 XGiBBvjwZ6oRAMDJBY6C8jDfx2gDfFLFliDbMRsVa0bED/yLv/5gF+7UB5pr4g/rx/
	 1gETTxR/lcyeQ==
Date: Mon, 24 Aug 2026 13:08:31 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Collin Funk <collin.funk1@gmail.com>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	linux-man@vger.kernel.org, groff@gnu.org
Subject: Re: Using LS/LE
Message-ID: <aowkO-r86nquaTh8@devuan>
References: <20260823132749.pgypzsqv32n67wor@illithid>
 <aor4LIdGrSGHe3TB@devuan>
 <20260823141622.7vszwghxrxvkff4j@illithid>
 <aosHFaauEzKEFNpl@devuan>
 <20260823164451.5jeolmdu44ubpeba@illithid>
 <aotFzewQhmLJSk6N@devuan>
 <20260823204051.mkcgwghlljq7fqic@illithid>
 <aott22sJfNucOefn@devuan>
 <20260824011129.njsipdzmay4smp6i@illithid>
 <87h5kk1dlp.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tjt23atstsgg3iqj"
Content-Disposition: inline
In-Reply-To: <87h5kk1dlp.fsf@gmail.com>


--tjt23atstsgg3iqj
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Collin Funk <collin.funk1@gmail.com>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	linux-man@vger.kernel.org, groff@gnu.org
Subject: Re: Using LS/LE
Message-ID: <aowkO-r86nquaTh8@devuan>
References: <20260823132749.pgypzsqv32n67wor@illithid>
 <aor4LIdGrSGHe3TB@devuan>
 <20260823141622.7vszwghxrxvkff4j@illithid>
 <aosHFaauEzKEFNpl@devuan>
 <20260823164451.5jeolmdu44ubpeba@illithid>
 <aotFzewQhmLJSk6N@devuan>
 <20260823204051.mkcgwghlljq7fqic@illithid>
 <aott22sJfNucOefn@devuan>
 <20260824011129.njsipdzmay4smp6i@illithid>
 <87h5kk1dlp.fsf@gmail.com>
MIME-Version: 1.0
In-Reply-To: <87h5kk1dlp.fsf@gmail.com>

Hi Collin,

> Date: 2026-08-23 19:01:06-0700
> From: Collin Funk <collin.funk1@gmail.com>
>
> "G. Branden Robinson" <g.branden.robinson@gmail.com> writes:
>=20
> >> Interesting.  The day someone complains again about my makefiles, I'll
> >> point to this data.  I checked a few other projects out of curiosity:
> >>=20
> >> 	alx@devuan:~/src/shadow/shadow/master$ find | grep '\.am$' | grep -v =
gnulib | sort | xargs wc -c | tail -n1
> >> 	31885 total
> >> 	alx@devuan:~/src/gnu/glibc/master$ find | grep '\.am$' | grep -v gnul=
ib | sort | xargs wc -c | tail -n1
> >> 	0
> >> 	alx@devuan:~/src/gnu/gcc/master$ find | grep '\.am$' | grep -v gnulib=
 | sort | xargs wc -c | tail -n1
> >> 	1527474 total
> >> 	alx@devuan:~/src/gnu/coreutils/master$ find | grep '\.am$' | grep -v =
gnulib | sort | xargs wc -c | tail -n1
> >> 	8171 ./Makefile.am
> >> 	alx@devuan:~/src/gnu/findutils/master$ find | grep '\.am$' | grep -v =
gnulib | sort | xargs wc -c | tail -n1
> >> 	35765 total
> >>=20
> >> Does glibc not use automake?  What do they use?
> >
> > Hand-written Makefiles, apparently! For a while I followed their Git
> > commits, but I'm well behind on them.  glibc and GCC saturated my
> > ability to keep up with the projects I track.
>=20
> Yes, glibc uses GNU make extensively. It is quite difficult to read if
> you do not understand GNU make extensions, compared to Automake which is
> for the most part just declaring targets and sources.

'for the most part' of the text written.  Then you have to understand
everything that isn't written, which is more difficult than grepping in
the GNU Make manual for a few extensions.

You don't know '?:=3D' in GNU Make, then grep for '?:=3D' in the GNU Make
manual.  Simple.

You don't know why/how Automake is doing something?  Good luck guessing
why.

> It also requires
> more upkeep to make sure things work correctly, e.g., parallelism.

This is not true.  The shadow-utils project (which uses autotools) has
bugs open for years because `make dist -j4` doesn't work (and it hasn't
been fixed yet).

The Linux man-pages build system works fine with -j128.  Ignoring the
initial cost in writing the build system, maintenance is quite cheap.

And if a bug ever shows up in the GNU Make code, I'm confident it'll
take a few minutes to debug it and fix it.

The parallelism problem in makefiles comes from incorrect use of
makefiles.  That is, use of recursive make(1).  But recursive make(1) is
discouraged.  If you have a single make(1) process controlling
everything, it runs smoothly.

> So, I don't think pointing out that Automake files have a similar file
> size to regular Makefiles is a good comparison.

Given the same size, Automake is less readable, because it has more
implicit assumptions.  In GNU Make, there are very few assumptions, and
I bring that to zero by disabling the builtins.  If you can't read the
grammar, it's a matter of reading the documentation.  GNU Make has
pretty good documentation.


Have a lovely day!
Alex

>=20
> Collin

--=20
<https://www.alejandro-colomar.es>

--tjt23atstsgg3iqj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqMJi8ACgkQ64mZXMKQ
wqkapw//SbH5waTlJnMFRhMknrWO2k0w5V6/Oea/RmfQ6FHJc2QEfdYhGcZxtGmT
oFZnOOL1EH726akSsAm015LhQV6zQ014hp1MFIqbMsn6Rf0LxgXOtghQ3zUwFaKa
hnt+UKa0oRI7kONXl3ym4Oiu/6DIqSOJ2zx6JU8VRAw9A0JkyrgDsC026cv0ZdWj
xfFl2aTd10gPoEHu+mRrf5U9PG+u5DLbaC9iXj+cXL8t30I34X25wVJhPyUws82q
WYFSyy9Sv2t4o6p05H3tVMD5S3ITGiWMZvAE0ulAFxueQdxeG/E9hPHOzHinedSq
nzRYY+D2zua8Z23xvoV/03pWv5I+X32L+tHzts41i0eeRSFqly6e0pvjZziXAwdt
jmAKyj16MT0jKCFyOB9L7W2knmh7uubfbJFAL79sdqdWvL5ey94jnickckFDVlJU
liCqVjpFTL9yr/AtrIO1dcIGJ4Jqx11JT55MF17veNt/9ozRJPErIBcFmldmwcpC
gZ6DN9sDCwTkv7/I29EeTA/7opj/l5tf6Z2Gt260d0iZfw0zp1Sed15SyRPs7szc
UehjWs0oNpA05umktchNML9mgHq9YzAV3MPyBQ5SHtbb0to4Jw3qa09p1+kJWbGy
v1NOTtsjib+dKGzJxhGr9GsYLdPFCfPvlgjmL4p6WrHuA4DoOcQ=
=tIB7
-----END PGP SIGNATURE-----

--tjt23atstsgg3iqj--
