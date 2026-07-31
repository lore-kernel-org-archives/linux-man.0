Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5D62E974D
	for <linux-man@vger.kernel.org>; Fri, 31 Jul 2026 22:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785538365; cv=none; b=EBrtG2YNowN9pLOHLiorXkQKLk824FQyaBcZCehjoooNSud6xuvMREt93Ug72x8c0zKHUoxsPvu4JO20ADy/J2PACnUqDZ6ZupIwhMRCeUIwRLm1S5N08La8GaQSSWrCS/2DAXau+w5RzVb/SxwuswJS2s5nG1mpEa7aN0yj+aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785538365; c=relaxed/simple;
	bh=EhH3sGyczN3Bc/1vZeI6XMsXhlekgWMu/yLH4MRIFYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g+f20r2TMCOyKedNXTIYSWTICq37RDIgygUw5Ntb5WrTYlvLxDTPncKk3NejRehGl4y3SE2q+aShAF6cSTJA+ApN1gSz4Vx6FI+mF9Z9xr5aDHPwkZOnsSFaXcsO9gnhoVtKnmFeo3o/vBvAAb6mcrXsBpHA7qWzfmAxyXD1lLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jEW2Tkvq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jEW2Tkvq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 509281F00AC4;
	Fri, 31 Jul 2026 22:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785538364;
	bh=TT0jIeoYgxQksm+/c3S2kMjNQKy0aBR/tc4YBq/y1e4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jEW2TkvqRjIVMThkcRew7HeXpc47wAQILrNrbK8g4gCovkjRTaYf8bcFGn0gbX+YC
	 kHkffq/eJLEF1IUPWrhth1TK9F7y7opIhxhgCSv6VWX6aqLkaTEoDGlR2oU9WKiMGA
	 JddBYeTQDHUU7YIbCZj1oUrDAytxIVX6ku8m+LaXriKNBBJ2A4BH2K0Ko9oB5FVE5W
	 DSfjjFeZ0J0levH8J5ngjqghLIGaXEZuiKeKqnthMQCpjQ2ZpaJ2YgZGDeEbTdbLg3
	 wpr88AX1KeU+1zCbnp79I4wgk/LMIb/jWnpVeKtKtFGMTCORebzXBPFJrI0ec3apWE
	 4yIkBk4M51azQ==
Date: Sat, 1 Aug 2026 00:52:39 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Joseph Myers <josmyers@redhat.com>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	linux-man@vger.kernel.org, Keith Bostic <keith@bostic.com>, 
	Mark Harris <mark.hsj@gmail.com>, Nevin Liber <nevin@cplusplusguy.com>, 
	JeanHeyd Meneide <phdofthehouse@gmail.com>, Christopher Bazley <chris.bazley.wg14@gmail.com>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Iker Pedrosa <ipedrosa@redhat.com>, 
	"Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org
Subject: Re: on the irresponsibility of pursuing C language reform (was:
 [PATCH 1/2] man/man3/{mem,strn}*(): SYNOPSIS, STANDARDS: Document these as
 provided by <memory.h>)
Message-ID: <am0lAEb1wuCJPDk7@devuan>
References: <cover.1785532392.git.alx@kernel.org>
 <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
 <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
 <20260731215122.4p4aepsbgeoibx74@illithid>
 <89c9b877-54a8-6a7c-016d-51e4be210ad6@redhat.com>
 <am0fnb4BMRrTajqx@devuan>
 <0407bda3-c03a-93cb-9400-5fb8256a30f2@redhat.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="koztz5vqc63ea52w"
Content-Disposition: inline
In-Reply-To: <0407bda3-c03a-93cb-9400-5fb8256a30f2@redhat.com>


--koztz5vqc63ea52w
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Joseph Myers <josmyers@redhat.com>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	linux-man@vger.kernel.org, Keith Bostic <keith@bostic.com>, 
	Mark Harris <mark.hsj@gmail.com>, Nevin Liber <nevin@cplusplusguy.com>, 
	JeanHeyd Meneide <phdofthehouse@gmail.com>, Christopher Bazley <chris.bazley.wg14@gmail.com>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Iker Pedrosa <ipedrosa@redhat.com>, 
	"Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org
Subject: Re: on the irresponsibility of pursuing C language reform (was:
 [PATCH 1/2] man/man3/{mem,strn}*(): SYNOPSIS, STANDARDS: Document these as
 provided by <memory.h>)
Message-ID: <am0lAEb1wuCJPDk7@devuan>
References: <cover.1785532392.git.alx@kernel.org>
 <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
 <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
 <20260731215122.4p4aepsbgeoibx74@illithid>
 <89c9b877-54a8-6a7c-016d-51e4be210ad6@redhat.com>
 <am0fnb4BMRrTajqx@devuan>
 <0407bda3-c03a-93cb-9400-5fb8256a30f2@redhat.com>
MIME-Version: 1.0
In-Reply-To: <0407bda3-c03a-93cb-9400-5fb8256a30f2@redhat.com>

Hi Joseph,

> Date: 2026-07-31 22:42:00+0000
> From: Joseph Myers <josmyers@redhat.com>
>
> On Sat, 1 Aug 2026, Alejandro Colomar wrote:
>=20
> > > When an API has been in <string.h> since 1989, that means documenting=
=20
> > > <string.h> as the main location for that API - not some other locatio=
n one=20
> > > person thinks is better and that most of the community has never hear=
d of.
> >=20
> > FWIW, the APIs have been in <memory.h> since 1986 in 4.3BSD, and in
> > System V they go back further to 1983.
>=20
> In other words, they were in that header for 6 years, and it's been=20
> implicitly obsolescent by virtue of the standard choice for the 37 years=
=20
> since then.

Yes.  And I'm trying to revert the implicit obsolescence.  Obsolescence
isn't a one-way process.  Sometimes, evidence shows up, and the obsolete
feature must come back for $reasons.

FWIW, memccpy(3) was resurrected in C23 back from a cold death it had
been suffering since forever.  And that was less justified.

> Standards involve accepting agreed compromises that might not have been=
=20
> your first choice, rather than endlessly relitigating past disputes=20
> without new evidence or changed circumstances.  In this case, the choice=
=20
> of where to put the functions in C89 was an agreed compromise that=20
> implicitly obsoleted the previous location, and should have put an end to=
=20
> any arguments that <string.h> was a bad location for those functions in=
=20
> the absence of clear new evidence.

I agree that it wasn't necessarily obvious back then that the movement
to <string.h> was bad.  While I blame the C89 Committee for other stuff
they should have been aware of, this isn't one of them.

But now in 2026, we see that there have some been problems.

> We have plenty of clear evidence for=20
> confusion about strn*; we don't about mem*.

Thanks!  Now we have a common ground.

Indeed, while there might be a minimal problem with mem*() --the fact
of not starting by str makes them less misused--, the important problem
is strn*().

The solution of moving both mem*() and strn*() to <memory.h> and leaving
just str*() in <string.h> is a consistent one, because <string.h> then
remains strictly for string APIs, and <memory.h> is for the rest of byte
handling.

It wouldn't be reasonable to move strn*() to <memory.h>, and then leave
mem*() in <string.h>, of course.

Similarly, it wouldn't be reasonable to more strncpy/cat() to <memory.h>
and leave the rest of strn*() and all of mem*() in <string.h>.

This movement, while a bit massive, is consistent and self-explicative.
That is, the only reasonable way to move strncpy/cat() is to also move
strn*() and mem*().


Cheers,
Alex

>=20
> --=20
> Joseph S. Myers
> josmyers@redhat.com
>=20

--=20
<https://www.alejandro-colomar.es>

--koztz5vqc63ea52w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmptJzEACgkQ64mZXMKQ
wqlLvxAAmcSHCM7L9Bf8M6n3wx7bPDNDi8YtOGtjnL+jy1Dmabp7FbN6WZ+tAjmM
7TKrAZqWO0H1PMZ1MLa7TnOpvsxbHgQ4vOR+jwcVyg514r9vwLC3O5zyTYMZDU0u
6vqBy/BPnQU6ZOz3LKSzFYb0h4GzupeehFJcHs+tCs2+siHXH04z3kG4jh4VKQ3M
Ru3ijwKb7a4FRopiiF1vkXGGrei8GKzsQFNc4wy5CVftf7NYim+6SysMf1geJY4J
eS0HCMnRELH4OlL3ZA3Pd/e4mJOCleo1SoFRSv+5JgFD5hwtxGvN4oYxOHjfT9s8
QNLZQQsWM/EGcOQZcnUdAPWOFWeNdvV1i7i0IqrNScsQbzji2u5c8eAIRYlW7XOn
Vvc0cCuCdGZUaG6U/jMw1Kp6aAgyDV7JqTXO3VUA1ABzpEGslyTP/Gr75NNWAAW5
eBxQ/gjvD7dMI8o3UcrFWJ6jI120tCEbJqXIB9FqRNbV7Bs8XQC+xN2lzrPuF+rU
Wcf3btjtrFj8+JTN/QFDrYP3STRd1VrQfqsg5P1njZnbA5X+Pds4/WXJqW3Mq84t
91Etg+zGeugkxZijjcY+1UjMIcwZilTUCQVnjPngr61gd9zoo3yZPh5ylhYELaSq
x9UDYQMUQrp+RMn8ieOTJpWipJfTpaJVQbwOF45UiTnzcNu0NnI=
=xtx7
-----END PGP SIGNATURE-----

--koztz5vqc63ea52w--
