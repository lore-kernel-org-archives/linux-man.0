Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37DC14ABE
	for <linux-man@vger.kernel.org>; Fri, 31 Jul 2026 22:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785536344; cv=none; b=j+RdnCKso8L1Qp1LYNA6MnEUVDRg5oWcL7nH5S3yoen1J+fQA/VbhGASWPGBwgMJk2DdbMf1x+YgDQSide0OuOcfWcWIbOllYaZLXmVkVdZNOmP25kKSWLce8s3GJ58NsWCe7zrqmzEOapbX3nMeYHE8mzeQvWq7RHnq7lRan40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785536344; c=relaxed/simple;
	bh=1p25+o+caSV38h7xN5mRZ7aH9BonvirFp+56NTlW/9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LPSABMveA3mOF/ryM2WzfYTyHg52aD8JWfXDtn+Xd1GHb6ZSI4HvPdGmN3L0fM0nz6qPkNp+ZhJNRD6zKrEnoC9gh9ujcMDvYeF4DV74ttVQFNh2vW8zRrDmSoab/SnKW4e3Y502bqdGR6KH7EEMX8e9B9AhFCbuDn58Wo6oMNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YhDRhvGz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YhDRhvGz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B98F1F00AC4;
	Fri, 31 Jul 2026 22:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785536343;
	bh=X/2JnaNfE5H6Y5b9XP56xPjaG6j49ylvuasQbfA1lhI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YhDRhvGzE6gbmd9zKNT+Cif59e1et7IvIwsyG43rFFRTkiXQx63dabTu4BSpA8lr0
	 8PDDYR6zM4FvuPNdtPVgUYVf/Cm8iZCvR9TwEaDO8qX8vigWsEfSIGtXF4iHxM0FN3
	 jH89ob4YebL41PYWFVnz78dJOGvEu5E+vP7fDVYmlQ/WWdaGvO0PXVCo98xrBF5CNT
	 vSnvLfqqVzNie0+ewRhK9qqsWTcG+adojHYE4vVWjb3yI5lwjz8RmrH0xfMewbfT01
	 YXOReoIRqSF2wpSK8wUynKY3Fg+4yf+4Q2z7r/Bk2Caf34zcg7bC9t3mTyKXuT9HOW
	 XT928HKwnejEQ==
Date: Sat, 1 Aug 2026 00:18:58 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Sam James <sam@gentoo.org>
Cc: Joseph Myers <josmyers@redhat.com>, linux-man@vger.kernel.org, 
	Keith Bostic <keith@bostic.com>, Mark Harris <mark.hsj@gmail.com>, 
	Nevin Liber <nevin@cplusplusguy.com>, JeanHeyd Meneide <phdofthehouse@gmail.com>, 
	Christopher Bazley <chris.bazley.wg14@gmail.com>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Iker Pedrosa <ipedrosa@redhat.com>, "Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, 
	Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, libc-alpha@sourceware.org
Subject: Re: [PATCH 1/2] man/man3/{mem,strn}*(): SYNOPSIS, STANDARDS:
 Document these as provided by <memory.h>
Message-ID: <am0dFT38yXK_ch_o@devuan>
References: <cover.1785532392.git.alx@kernel.org>
 <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
 <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
 <am0TUn55P7uNtTTh@devuan>
 <87ik5uesfg.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j4zp7xf5uebldvaf"
Content-Disposition: inline
In-Reply-To: <87ik5uesfg.fsf@gentoo.org>


--j4zp7xf5uebldvaf
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Sam James <sam@gentoo.org>
Cc: Joseph Myers <josmyers@redhat.com>, linux-man@vger.kernel.org, 
	Keith Bostic <keith@bostic.com>, Mark Harris <mark.hsj@gmail.com>, 
	Nevin Liber <nevin@cplusplusguy.com>, JeanHeyd Meneide <phdofthehouse@gmail.com>, 
	Christopher Bazley <chris.bazley.wg14@gmail.com>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Iker Pedrosa <ipedrosa@redhat.com>, "Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, 
	Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, libc-alpha@sourceware.org
Subject: Re: [PATCH 1/2] man/man3/{mem,strn}*(): SYNOPSIS, STANDARDS:
 Document these as provided by <memory.h>
Message-ID: <am0dFT38yXK_ch_o@devuan>
References: <cover.1785532392.git.alx@kernel.org>
 <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
 <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
 <am0TUn55P7uNtTTh@devuan>
 <87ik5uesfg.fsf@gentoo.org>
MIME-Version: 1.0
In-Reply-To: <87ik5uesfg.fsf@gentoo.org>

Hi Sam,

> Date: 2026-07-31 22:54:27+0100
> From: Sam James <sam@gentoo.org>
>
> Alejandro Colomar <alx@kernel.org> writes:
>=20
> > Hi Joseph,
> >
> >> Date: 2026-07-31 21:23:35+0000
> >> From: Joseph Myers <josmyers@redhat.com>
> >>
> >> I think it's irresponsible to use the man-pages project to promote=20
> >> personal idiosyncratic ideas like this in preference to what's been th=
e=20
> >> standard location of functions since 1989.
> >>=20
> >> I'd rather we add a mandatory deprecation warning to memory.h in glibc.
> >
> > I hope you don't; it'd be a gratuitous breaking change.
> >
>=20
> Yet this change has the same effect, just people will see it themselves
> rather than the compiler telling them, and go around sending patches to
> change it.

IME, people don't go changing includes unless they need something it's
not available in the already-included header files.

Analysis of includes is quite complex, and there are tools for that
--iwyu(1)--.  As long as those tools don't start complaining --and they
won't-- [1], I find it quite unlikely that people will start changing
includes in existing code.

This is rather something that will affect new code (new source files).

[1]	iwyu(1) works in a way that it allows a number of headers to
	provide a symbol.  If no header provides the symbol, then it
	will recommend the best header for it; but if a header that
	provides the symbol is already there, it won't complain.

> The man pages should reflect what the standard currently says, not what
> you'd like it to say.

Not exactly; the standard is a good guideline, but sometimes it's off.
We have vendor extensions, which are well documented, and when the
standard is bogus, the extensions take over the page.

FWIW, the information from the standard is still there.

	$ MANWIDTH=3D64 mansectf STANDARDS man3/memcpy.3 | cat
	memcpy(3)           Library Functions Manual          memcpy(3)

	STANDARDS
	     C11, POSIX.1=E2=80=902008.

	     ISO C and POSIX declare this function in <string.h>.

	Linux man=E2=80=90pages (unreleased) (date)                   memcpy(3)

I've just removed it from the front of the page (SYNOPSIS), but it's
still there, because of course, we must document the standard alongside
the extension.

> We had the same problem with e.g. stripping "C89"
> everywhere.

Sorry for that one; it was a useful change, though.  Now we have better
manual pages than we had back then, regarding standards.  I hope you
realize about that.  It triggered discussion, and a careful review of
the text, which resulted in a good change after all.

> People want it to reflect what the standard says.

And it still does.


Have a lovely night!
Alex

--=20
<https://www.alejandro-colomar.es>

--j4zp7xf5uebldvaf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmptH0wACgkQ64mZXMKQ
wqmQRQ/7BvzsdhBMjE1gki2dTrXJ2QyUgBI6Q8NE/kAxJY8wwRkQeWyr4fAB1RhI
fbtIXBRLzb3rSEXa+3+5nRXAjuszxVycqUEqO8kGadIa1mBLqF6+L2JvnWvQrkZ+
11m1RAUlWPSJsVj3O1eORo61rMyPaI7MaCzXneMzZaDW91lsUwOVkYD1nz2ta2iD
soVLLxJCkuJGNGCHiDPC5ehdDlf9AlcC/u3vrzoeVz8r953P0Irh5Tgi8klxwr6L
L4cqnkKRm8khPRuG67JmjBORDNYlw6yAVvkcGzGg+uEBwyQEbhgYvLo7ALBeqc7f
D8AXxuFhnTQKBFEB5wOb0jddZIz49EU6P/vLEqZUola1VHSvTQDHE6bRDA88dyGO
ykpXKPBZh5Drb6vj/e3MZurqM8E7XGIVED3OdmBe/2t5uLuSNiYZWn/yqY+DT0Ic
6uB0dExmBzDTwp9YUpXP0PdJZULb68O4UwhvAmteq72xpNr4J8PY9onH8WaDEhG2
o3yLJCDlSsmG5EbWHVYyixzUqped/OXuLxSWhe0uGdVIslGQyqJgAkVh0Bktbpnz
m7Z6c6auQbTJw19214UwkN+2p/w+a0zE65xSXjUGFX/XL/gsgxHwlR2oUqNcMR5t
Y1ltUY9f22SHp448Jm/xcmqMal5yEVbEQhyLV5kF/bDlggt/uDY=
=opGJ
-----END PGP SIGNATURE-----

--j4zp7xf5uebldvaf--
