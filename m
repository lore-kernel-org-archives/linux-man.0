Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E97A367297
	for <linux-man@vger.kernel.org>; Thu, 28 May 2026 22:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780006224; cv=none; b=XLkWCg7d8Bv2+xlmauWOvnmAoN/zRSWTNZd6bcW1q8EXKZ8lpYCR0bzEx2+bBTM0vDdWHuqxess7TmZVMMcZwkgCFclx19DF7M0mey9ihwR2ro462PeaoSPV8GaruhUG/9vGF2Pr077+K/Vr+dqFv/WEoOM0vxF3riem4ObljiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780006224; c=relaxed/simple;
	bh=/OTGStWfyWZIU+6J9CZTf65jERZMenTYtSv4EbcCA14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KVIPu4rim/d6STEdzPjZqGcYR+9sqYRfjG0juAxkGYg7UkLI/IyaDVH94fpU3E87PLt2TP8H53At7IY4mhEHC+rrlEnRJsCbWwv48NWGW2kuo8PMCKGpmPjR4XQ4K0rvvvYSgjTlqCKtDP0W1GygsYUqrl09JLkbwCnvSbT5a4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hJY8wsnV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hJY8wsnV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2951D1F000E9;
	Thu, 28 May 2026 22:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780006223;
	bh=AbV2mLbRTXnS+hRlXjSArCGs/atQL3NaJEpTqJ1ZUl4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hJY8wsnVWJnKtDbBKXTHXJZ8rir6uUcY5oZsW7Ffgrux2rb0McDgTq8Mcnp8+4VgE
	 Mrkzg5LlVQf8LkIw7cwB/WEIV+dAfqZXcQAZ1cvqav0PHrzPmV8upL+ubCWxa9FnGW
	 SDyJDXR74AeoCIT+eX4OzZZxy4IfeChKaJdgy+z2r8modlisIoBCn45rQ48leAyR7Q
	 8GgZQg+tafwz6Q43RSs10VdmSuUdjBm1uD8yVvhY5q8tigdUvXzKdRX9yCZJhzxZgg
	 iy4OVcUbjAh0jIy/ld0YrwZ+02iRHv8ss0eOfaIwfNc1qb+O6v99T1E/f+dT4fHTDn
	 CgyhRAV2zpaNA==
Date: Fri, 29 May 2026 00:10:19 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Mark Harris <mark.hsj@gmail.com>
Cc: Carlos O'Donell <carlos@redhat.com>, 
	"Michael Kerrisk (man7.org)" <mtk@man7.org>, linux-man <linux-man@vger.kernel.org>
Subject: Re: Mangled function prototypes (phantom arguments)
Message-ID: <ahi7dckZtycvn_Ql@devuan>
References: <CAFs=pgbvWhm7KUcdyt=ELT66FNuLNjqh3Ek-1d9V6sY2npJ5jg@mail.gmail.com>
 <ahbxJGIK8Qf4AqVl@devuan>
 <CAFs=pgYAfonz99yGyoS+h76v7YrfT8=f4yg6zQFqDPgm8XfsoQ@mail.gmail.com>
 <ahcvtYzeadqmhk62@devuan>
 <CAFs=pgaaDgMULDkwrewtegogQQCZjCFqEPUEkAfKpT67rEWZ1Q@mail.gmail.com>
 <23a5740a-5de6-487d-b976-71e16205b1cf@redhat.com>
 <ahisWSsAtm8J19RX@devuan>
 <CAMdZqKER+2XNhYt6VzVUijgMPYw1_fsn3Hh-+uzLN+joqzPp0A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e75akj2rxraq5yck"
Content-Disposition: inline
In-Reply-To: <CAMdZqKER+2XNhYt6VzVUijgMPYw1_fsn3Hh-+uzLN+joqzPp0A@mail.gmail.com>


--e75akj2rxraq5yck
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Mark Harris <mark.hsj@gmail.com>
Cc: Carlos O'Donell <carlos@redhat.com>, 
	"Michael Kerrisk (man7.org)" <mtk@man7.org>, linux-man <linux-man@vger.kernel.org>
Subject: Re: Mangled function prototypes (phantom arguments)
Message-ID: <ahi7dckZtycvn_Ql@devuan>
References: <CAFs=pgbvWhm7KUcdyt=ELT66FNuLNjqh3Ek-1d9V6sY2npJ5jg@mail.gmail.com>
 <ahbxJGIK8Qf4AqVl@devuan>
 <CAFs=pgYAfonz99yGyoS+h76v7YrfT8=f4yg6zQFqDPgm8XfsoQ@mail.gmail.com>
 <ahcvtYzeadqmhk62@devuan>
 <CAFs=pgaaDgMULDkwrewtegogQQCZjCFqEPUEkAfKpT67rEWZ1Q@mail.gmail.com>
 <23a5740a-5de6-487d-b976-71e16205b1cf@redhat.com>
 <ahisWSsAtm8J19RX@devuan>
 <CAMdZqKER+2XNhYt6VzVUijgMPYw1_fsn3Hh-+uzLN+joqzPp0A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMdZqKER+2XNhYt6VzVUijgMPYw1_fsn3Hh-+uzLN+joqzPp0A@mail.gmail.com>

Hi Mark,

On 2026-05-28T14:43:21-0700, Mark Harris wrote:
> > > My view was always that they were the simplest expression of the
> > > interface that the widest possible audience could understand, and
> > > that seems to align with Michael's view.
> >
> > That doesn't provide much value, IMHO.  My opinion of the SYNOPSIS is
> > that it's a quick reminder of how a function should be used.
>=20
> I suggest a compromise.  Keep the array sizes, which are the part that
> you claim adds value, and drop the forward declarations, which are the
> part that confuses people.  So for example:
>=20
> ssize_t read(int fd, void buf[count], size_t count);
>=20
> Yes, count is used before its definition, but the goal is not to write
> a valid function declaration; the existing one being invalid is
> evidence of that.  It is difficult to imagine that anyone would have
> trouble finding the definition of count without a forward declaration,
> unless they are a compiler in which case they would also be tripped up
> by the array-of-void.

I considered doing that some time ago.  I am worried about something: it
might "work" if you're unlucky.

Let's say a relatively new programmer sees this and thinks it's valid C.
And let's say it tries it in their own code, which may have a variable
in scope (most likely, a global one) named 'count'.

	extern int count;

	ssize_t read(int fd, void buf[count], size_t count);

That's going to compile, but it's not what you'd expect.

That's why I originally used [.count] notation.  That one if free from
this problem.  However, GCC maintainers convinced me of using some
syntax that is valid C (at least in the GNU dialect of it, which is the
majoritary one anyway).


Have a lovely night!
Alex

--=20
<https://www.alejandro-colomar.es>

--e75akj2rxraq5yck
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmoYvUQACgkQ64mZXMKQ
wqndTRAAl2Pz00ZxKVAfRFn+944+wT5JPyeMhW9/T9+yvVvEkkOEgQXAK6WVYFE6
+u4rx/Gbrzdj6rmTJ/zVaXxJAe0tS9NHw3WNZu5ypGU7jP41jswmyuwEolXEZk+y
k77GkzDGlSJ4CSPb618J/T7Pomo0neWTiI+6VHWcoqd97zKhMo8wkJRQwIrqqRCS
EN9rwk4HN8w679ZReDS7B4hVjULVZDLg5xwYen/Ytk79PtwOIH1fIkjuu74JyVct
KZrGgZuWvbmeXJQWkjDCWEGSOUDnp0MfQdSqhMbGlW+4TKmHGjXg78oDoyzJpKV6
RzmJAuGroY9mcfnvpnMKEOAYeVcRYx6hT06JdAJumd/uR1RIdxw+3FF1Ad1PhIWI
u4QnHOWvH6iuE6auhwBmjkWA8J7yqmKTa35w41Tv7505yP5qG1pUbBUMVYRCuF8i
50sqY2xTZ4kZMHVBBSu62oZv3ePCk3pLS3D4OA3EWspnSXnyFVdq22OkXRel23vJ
u6k1DQesJbmvnK48R1IZ/baB8Q36QU8N0w8DPN+7pBXskkGlA75DiSI1lhE7yHOT
9hbsAgP6sC4be06Dg0DiCWjsEARXGWablwWrO20yj9kyw5FoxdvBpJ85hMKEZOn/
dD7IRX0sWPs7FC78a8+ra1oMrfYroVpVJM/XhD4fw52WxKQy148=
=7wgd
-----END PGP SIGNATURE-----

--e75akj2rxraq5yck--
