Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06195224D6
	for <linux-man@vger.kernel.org>; Sat,  1 Aug 2026 22:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785624288; cv=none; b=tjPqpWkjnf4ga2j+jwDLvCb+YDDobqp1OSLtJVmBRiXJTsIcuzYgtaH5z/nysb7R0qfArp/YA/yKFdK9byQPaX06Y9Nj0/81QOfNi7I11Vz9krR0KZshc8/V/bILUU60LZZlBk1XYkm00aJGmDD73LFoSrl3ksppbugpDgBoXFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785624288; c=relaxed/simple;
	bh=VNWYEeJjAeJTXTCiaaDw6Dj2bu5odbU5INfvYaz1liI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qvibRi2CGPOW3TJjevqyZSxlLtZnPlmWo5Z7tW9YTZA49q7VVBte5V+kM/6LkCNzR6ToxQKVIDWC9RL8HolQElfogQcXL0qgqv0PGK37cozF2GB8R/DxvmzNMrU7hM08+UP+fUKUYM06XGaK5Zbj0ZcCKKNIAuEVdKRlI6oC2p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T3iQ7YYF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T3iQ7YYF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 982CE1F00AC4;
	Sat,  1 Aug 2026 22:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785624286;
	bh=40DvXBBOWCvpd08XFDi0UlIkYPXYrT6aIJHYLII1/qk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T3iQ7YYFY3Q/Sw0yZUgOIOha987rs3gP8RG2c+As7Z1e3+8Nkdm535cwxVr7yupfQ
	 wdVAeJhxQlGUOM3TtXpq9bHONJ2Oei9XxCNUw0TVEtkxcJXP3GjKjCrbvEQDAdMwu1
	 HBbG7UMmuFFSpXCliyF2J6576Mkombot5QZlkNRDsE16rER/URp79K6FICPZzw21eV
	 z9X96pffgs2lSUFGozPldtyi8epmU2+4+b5VJ0v6czScqEutPEYfdDr3xXkxTnDe7N
	 pRoX79TJoBbM7+BEUpzmJ3JEsNQbrLCeRJYdTTQpTN21Wm+Pj15G1Gq72GHa4kT9Uj
	 RjdhWMbNEJaOA==
Date: Sun, 2 Aug 2026 00:44:41 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Keith Bostic <keith@bostic.com>
Cc: Sam James <sam@gentoo.org>, 
	"G. Branden Robinson" <g.branden.robinson@gmail.com>, Joseph Myers <josmyers@redhat.com>, linux-man@vger.kernel.org, 
	Mark Harris <mark.hsj@gmail.com>, Nevin Liber <nevin@cplusplusguy.com>, 
	JeanHeyd Meneide <phdofthehouse@gmail.com>, Christopher Bazley <chris.bazley.wg14@gmail.com>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Iker Pedrosa <ipedrosa@redhat.com>, 
	"Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org, Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Subject: Re: on the irresponsibility of pursuing C language reform
Message-ID: <am51v4KmUmdzM-OT@devuan>
References: <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
 <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
 <20260731215122.4p4aepsbgeoibx74@illithid>
 <87a4r6es6k.fsf@gentoo.org>
 <am3XeGZyi1Pvr77-@devuan>
 <87y0epdhxp.fsf@gentoo.org>
 <am4GT1OkqNZD9FF9@devuan>
 <87zez5bz49.fsf@gentoo.org>
 <am4jxBOh_VRvhCQw@devuan>
 <CAETFuj2OwoyK9J85r2f0RoXbHbXKA4gQJ=JZ-7=QoqGcMwk0+Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f4s4cgtmp52kjgtn"
Content-Disposition: inline
In-Reply-To: <CAETFuj2OwoyK9J85r2f0RoXbHbXKA4gQJ=JZ-7=QoqGcMwk0+Q@mail.gmail.com>


--f4s4cgtmp52kjgtn
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Keith Bostic <keith@bostic.com>
Cc: Sam James <sam@gentoo.org>, 
	"G. Branden Robinson" <g.branden.robinson@gmail.com>, Joseph Myers <josmyers@redhat.com>, linux-man@vger.kernel.org, 
	Mark Harris <mark.hsj@gmail.com>, Nevin Liber <nevin@cplusplusguy.com>, 
	JeanHeyd Meneide <phdofthehouse@gmail.com>, Christopher Bazley <chris.bazley.wg14@gmail.com>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Iker Pedrosa <ipedrosa@redhat.com>, 
	"Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org, Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Subject: Re: on the irresponsibility of pursuing C language reform
Message-ID: <am51v4KmUmdzM-OT@devuan>
References: <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
 <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
 <20260731215122.4p4aepsbgeoibx74@illithid>
 <87a4r6es6k.fsf@gentoo.org>
 <am3XeGZyi1Pvr77-@devuan>
 <87y0epdhxp.fsf@gentoo.org>
 <am4GT1OkqNZD9FF9@devuan>
 <87zez5bz49.fsf@gentoo.org>
 <am4jxBOh_VRvhCQw@devuan>
 <CAETFuj2OwoyK9J85r2f0RoXbHbXKA4gQJ=JZ-7=QoqGcMwk0+Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAETFuj2OwoyK9J85r2f0RoXbHbXKA4gQJ=JZ-7=QoqGcMwk0+Q@mail.gmail.com>

Hi Keith,

> Date: 2026-08-01 15:22:49-0700
> From: Keith Bostic <keith@bostic.com>
>
> On Sat, Aug 1, 2026 at 10:09=E2=80=AFAM Alejandro Colomar <alx@kernel.org=
> wrote:
>=20
>=20
> Well, Keith Bostic wouldn't have suggested that I do this change, and
> Branden wouldn't be defending that it might make sense to make this
> change.
>=20
>=20
> Since my name came up: I did suggest man page changes, and I should have
> been clearer about what I meant.

Thanks!

> I generally think innovation should happen in releases, in response to the
> user base. That=E2=80=99s the model with the better track record. Somebod=
y ships
> something, users adopt it or they don=E2=80=99t, and the standards codify=
 existing
> practice once it reaches consensus. When the standards bodies invent
> instead of codify, results have been uneven.

Fully agreed.

> So if glibc added <nonstring.h> tomorrow, that=E2=80=99s the system worki=
ng. Ship
> it, let people vote with their code, and let the standard adopt if it wan=
ts.
>=20
> But as I understand it, the man-pages project doesn=E2=80=99t control the=
 code it
> documents. It describes glibc and the kernel, it doesn=E2=80=99t ship the=
m. A
> documentation project changing how coding should work in a release it
> doesn=E2=80=99t control feels different to me. So, my opinion is the man =
pages
> shouldn=E2=80=99t be changing the standard includes.

Actually, the documentation is for the system, not the standard.  The
system does provide <memory.h>, and thus it's fair game to document it,
I believe.

> Advocating for better usage in the documentation is a different thing, and
> a good thing. The man pages can even go pretty hard, that=E2=80=99s their=
 job:
> =E2=80=9CNotice the include file is string.h. That=E2=80=99s an historic =
accident
> maintained for compatibility reasons; don=E2=80=99t let that fool you, th=
is
> function doesn=E2=80=99t operate on strings.=E2=80=9D

Indeed.  That's in essence what I'll do, with different wording.

The SYNOPSIS is the way of saying "don't let other sources fool you,
this function doesn't work on strings, and you should include the
system's <memory.h> to get it, which is compatible with all versions of
libc".

The NOTES section is the way of documenting "but the standard says
something different; let's ignore it".

	--- HEAD^:man/man3/strdupa.3
	+++ HEAD:man/man3/strdupa.3
	@@ -11,6 +11,10 @@ SYNOPSIS
	      #include <string.h>
	=20
	      char *strdupa(const char *s);
	+
	+     #define _GNU_SOURCE  /* See feature_test_macros(7) */
	+     #include <memory.h>
	+
	      char *strndupa(size_t n;
			    const char s[n], size_t n);
	=20
	@@ -48,6 +52,9 @@ STANDARDS
	 HISTORY
	      GNU.
	=20
	+NOTES
	+     The following header also provides strndupa(): <string.h>.
	+
	 SEE ALSO
	      alloca(3), strdup(3), strndup(3)
	=20
> That teaches the reader what the function actually does without relabeling
> where it lives. I think it=E2=80=99s roughly what Joseph is suggesting as=
 well,
> aiming the clarification at the reader=E2=80=99s understanding rather tha=
n at the
> SYNOPSIS line.

I should probably expand the NOTES a little bit, to be more clear about
why we ignore the standard in the SYNOPSIS.


Have a lovely night!
Alex

>=20
> =E2=80=94keith
> keith@bostic.com

--=20
<https://www.alejandro-colomar.es>

--f4s4cgtmp52kjgtn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpudtkACgkQ64mZXMKQ
wqnlhg/8CTliJWEKLUeG2Z/c3ruLFf6MJSLJHQPMVkgeWL4Uwicm6QmRBbch1ial
2P7nTZ8ZfUk/BRDqLiyDiyKZiApVFhzX7qrVjdpESIBGIpWJDFaJ15FZykAdOYA1
Wlbu/POYAm1NH4SaW1Baw9jHBLG0nrp10GhlKH8iWru1Mqd7hkBjY8rU2cj4mylw
WqPsWJpLWaW6qRWF2TPmG/5dB6/Xj+t8/QO0UkfTv2Kdy4YAjuxr2lEDf85JhGQ4
rbgF2Og23Z1lWEBGe5Co4mfjSGxOjMjRbiG66hYORnVIkQDpbUdJDt5Vj8CyK0XH
0sKsxiRvOrptMMA/zh6pbASTy13RPkPYjm3FX3CiRujL8EEhymaMkgbbWTpAPx19
PxRrKgvRGcuDzXJc0rgxpxPSJjIFtWuf3MMqozkvG60n8HBEgLKlBmWV7bWXZzc1
fGTSqec9+WnTyY+t0aEQ6wzVfe7pf77H8pO/USFViY5NWtW/EeDCZfCAxhUIkB6h
Oq2tTXvdN3CRJS9IK4c3DIQM1ikU0Qr8eaFM39Fwm/G5qAJtTnrwkoSsWpvckL42
vr7guSIzTvpcrukwoaksEWrqjxYQzeeQfF/AnrCeccogB2ttyAdOBrov/Zjd5Xsr
TFwFjWSiqs2pKgEXhd8b4WEcZ6GrlEMXXV9ODvX0EFGI7P7ZTL0=
=uGvC
-----END PGP SIGNATURE-----

--f4s4cgtmp52kjgtn--
