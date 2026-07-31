Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6025D3403E3
	for <linux-man@vger.kernel.org>; Fri, 31 Jul 2026 23:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785541511; cv=none; b=RuxMRqlawUPjWIWn0Ad1ekKK8SgaB0vzndM75riqZlDfT+t4K7T5Xga+0oE+Z/5uo4kL8IzqLne1f3cCn0PruhqrMoJBFTG/DlpGVB2b00+Wz7NJ7pAhlkUQ79jQI5jIcCvbyn+hsx1jsIe6U8MrYbg9DLDyBiL1XzkNFZPDOmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785541511; c=relaxed/simple;
	bh=IZtOKY49js87rxgEhUgiP3rEJKNDQOkWUCIOz0zYZ5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K1JEt9SBQglvh0Jp9SSMhQkk82VKtuPUjPY2uRm/Ei0d0deO5DXZ+mp1e7kh7WlSVsaVHsV8WlikGuJtKduuhdY2/9pfUoi6i86hw2LR2zioOg90QLH+gk+ots2C6P3Gvm52raPT9m41KeyYCkI0xiCmGDxDjUSDlY+Df+9mHFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lmvXMm8p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lmvXMm8p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 263121F00AC4;
	Fri, 31 Jul 2026 23:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785541510;
	bh=PeWgVDjvLW5eShOD1uDsJuUNYdL8G7+OaAoEGQNHF5U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lmvXMm8pyzIbEhaDq7UUoJuA7MTJ5LdIzFxChutbwRAvq/OBYbr/zJhnjfdNlzFiV
	 NDvH+PFhybDOx4qxe+DEqhN2iYkJYvAy6ss4Jrusy5Ou8CnUAggITGQcBxXyuZ32sm
	 rQ+rBFRuEF5oddxe4ZIapbQhKpLE3aiBXNszUUHn8y4uk8q0fq1nXJA45CinYn9qwT
	 fAGN0K6GEQ6YmFzaT3zs5rgVESqXqQaSkGDgJPW/QdJSip8AYSN8kci0xpf7CFF07G
	 J+re8pb0KTDCTHFC0QwVq/NAIFT2njU08+48e1hH5vufRL8PTpUie1w3XtaJSgzGOK
	 fy+LThpnaJv/w==
Date: Sat, 1 Aug 2026 01:45:04 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Joseph Myers <josmyers@redhat.com>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	linux-man@vger.kernel.org, Keith Bostic <keith@bostic.com>, 
	Mark Harris <mark.hsj@gmail.com>, Nevin Liber <nevin@cplusplusguy.com>, 
	JeanHeyd Meneide <phdofthehouse@gmail.com>, Christopher Bazley <chris.bazley.wg14@gmail.com>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Iker Pedrosa <ipedrosa@redhat.com>, 
	"Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org, Martin Sebor <msebor@redhat.com>
Subject: Re: on the irresponsibility of pursuing C language reform (was:
 [PATCH 1/2] man/man3/{mem,strn}*(): SYNOPSIS, STANDARDS: Document these as
 provided by <memory.h>)
Message-ID: <am0vIUDzNzTnXMcI@devuan>
References: <cover.1785532392.git.alx@kernel.org>
 <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
 <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
 <20260731215122.4p4aepsbgeoibx74@illithid>
 <89c9b877-54a8-6a7c-016d-51e4be210ad6@redhat.com>
 <am0fnb4BMRrTajqx@devuan>
 <0407bda3-c03a-93cb-9400-5fb8256a30f2@redhat.com>
 <am0lAEb1wuCJPDk7@devuan>
 <9223d084-7de4-914f-9b53-8862510542d8@redhat.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bskk2l42cbyh4vua"
Content-Disposition: inline
In-Reply-To: <9223d084-7de4-914f-9b53-8862510542d8@redhat.com>


--bskk2l42cbyh4vua
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
	libc-alpha@sourceware.org, Martin Sebor <msebor@redhat.com>
Subject: Re: on the irresponsibility of pursuing C language reform (was:
 [PATCH 1/2] man/man3/{mem,strn}*(): SYNOPSIS, STANDARDS: Document these as
 provided by <memory.h>)
Message-ID: <am0vIUDzNzTnXMcI@devuan>
References: <cover.1785532392.git.alx@kernel.org>
 <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
 <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
 <20260731215122.4p4aepsbgeoibx74@illithid>
 <89c9b877-54a8-6a7c-016d-51e4be210ad6@redhat.com>
 <am0fnb4BMRrTajqx@devuan>
 <0407bda3-c03a-93cb-9400-5fb8256a30f2@redhat.com>
 <am0lAEb1wuCJPDk7@devuan>
 <9223d084-7de4-914f-9b53-8862510542d8@redhat.com>
MIME-Version: 1.0
In-Reply-To: <9223d084-7de4-914f-9b53-8862510542d8@redhat.com>

Hi Joseph,

> Date: 2026-07-31 23:11:56+0000
> From: Joseph Myers <josmyers@redhat.com>
>
> On Sat, 1 Aug 2026, Alejandro Colomar wrote:
>=20
> > > In other words, they were in that header for 6 years, and it's been=
=20
> > > implicitly obsolescent by virtue of the standard choice for the 37 ye=
ars=20
> > > since then.
> >=20
> > Yes.  And I'm trying to revert the implicit obsolescence.  Obsolescence
> > isn't a one-way process.  Sometimes, evidence shows up, and the obsolete
> > feature must come back for $reasons.
>=20
> When it's been obsolescent for 37 years, bringing back a header with the=
=20
> same name is just going to confuse people with 37 years of past=20
> information saying it's obsolescent (normally if one source says "use X"=
=20
> and another says "X is obsolescent", you can reliably assume that "X is=
=20
> obsolescent" is the more recent information, even without 37 years of=20
> history involved).

This is highly speculative.

If the official documentation says use <memory.h>, use <memory.h>.
Moreover, I've never seen anything saying <memory.h> is obsolescent.
It's been only implicitly obsolescent, and most programmers don't even
know <memory.h> exists at all.  FWIW, I've sometimes seen it in the
system headers, and eventually wondered why it was there, but nothing
else.  Thus, there's no contradicting information about it.

> Any reasonable change there would involve a new=20
> header, say <strnpad.h> for strncpy and strncat,

I think that misses that strn*() are still relatively misunderstood.
It's only because they don't write that they aren't as dangerous.

But we would be much better with strprefix/suffix() and other related
functions in <string.h> to even further remove uses of strn*()
functions.

Moving the entirety of strn*() might be less urgent/important than
moving strncpy/cat(), but it'd still be good to move them.  They are all
about handling [[gnu::nonstring]]s.

> rather than resurrecting=20
> a very old one.

I think the very old one is much better, because it can be used by
virtually all programs already, since it already is there in all systems
that matter, and already provides the functions were moving there.
Apart from documentation, there's no real change.

On the other hand, if we were adding a new header, it'd have to be
wrapped in #if __has_include(), and wouldn't be used until 10 years from
now or so.

> > The solution of moving both mem*() and strn*() to <memory.h> and leaving
> > just str*() in <string.h> is a consistent one, because <string.h> then
> > remains strictly for string APIs, and <memory.h> is for the rest of byte
> > handling.
>=20
> It's inconsistent with how people have understood C ever since it was=20
> standardized.  Changing the header memcpy is in is just as ridiculous at=
=20
> this point as the proposal there once was to obsolesce NULL.

I disagree.  Obsolescing NULL is a deeply breaking change.
Standardizing an existing header file is just like standardizing an
existing function.  Nobody is saying <string.h> won't provide memcpy(3).
My proposal to C2y says that <string.h> includes <memory.h>, so nothing
changes.  All of the existing understanding remains valid (although less
preferred).

> > It wouldn't be reasonable to move strn*() to <memory.h>, and then leave
> > mem*() in <string.h>, of course.
> >=20
> > Similarly, it wouldn't be reasonable to more strncpy/cat() to <memory.h>
> > and leave the rest of strn*() and all of mem*() in <string.h>.
>=20
> On the contrary, it's only the functions for null-padded fixed-width=20
> buffers that are niche functions causing confusion, compared to all the=
=20
> rest of the functions in <string.h> for which it's a very well-establishe=
d=20
> and well-understood location.  Some others like memccpy are *obscure*, bu=
t=20
> not confusing in the same way.

Did you read my alx-0096 paper?  It shows how n2349 --which introduced
memccpy(3) in C23-- is full of UB in examples introduced as

	To avoid the risk of buffer overflow, the appropriate bound
	needs to be determined for each call and provided as an
	argument.

If memccpy(3) was standardized for reducing buffer overflows (which is
implied, but not very explicitly said in the paper), it's ironic that
the examples of how it's supposed to be used invoke UB.  If the author
of the paper can't avoid UB, you can guess it's a bomb as bad as
strncpy(3) once was.  And I'm not saying that memccpy(3) is bad, not
that strncpy(3) is bad.  I use strncpy(3) and know it's fine, and have
been recently shown that memccpy(3) is actually good for implementing
fgets(3).  But it's not a function for copying strings, and n2349 is the
ultimate proof.  It is just as bad as strncpy(3) if misused for copying
strings.

I'll paste here part of alx-0096, which clarifies how n2349 invokes UB.

        Reading N2349 further, one finds an example of copying with
        truncation:

                char *p =3D memccpy (d, s1, '\0', dsize);
                dsize -=3D (p - d - 1);
                memccpy (p - 1, s2, '\0', dsize);

        This is more prone to bugs than the case above, and more than
        strncpy(3).  Anyone suggesting to use this to improve safety
        compared to strncpy(3), please, please, explain to me how they
        think this can be safe in any way.

        In fact, the code above is completely bogus, because if the
        string is truncated, p will be NULL, and it invokes UB in
        line 2.  See how it was predictably prone to bugs?  :)

        At the bottom of the N2349 paper, there's a more correct --and
        also more worrying-- example of how memccpy(3) could be used for
        copying strings with truncation.  This shows how terrible
        memccpy(3) is for copying strings:

                char *p =3D memccpy (d, s1, '\0', dsize);
                if (p) {
                  --p;
                  p =3D memccpy (p, "/", '\0', dsize - (p - d));
                  if (p) {
                    --p;
                    p =3D memccpy (p, s2, '\0', dsize - (p - d));
                  }
                }
                if (!p)
                  d[dsize - 1] =3D '\0';

        I think I don't need to explain what can go wrong in such
        unreadable, brittle, and complex code.

	...

        Using a more suitable function --similar to POSIX's stpcpy(3)--,
        this could be written much more safely:

                char *p =3D d;
                char *e =3D d + dsize;
                p =3D stpecpy(p, e, s1);
                p =3D stpecpy(p, e, "/");
                p =3D stpecpy(p, e, s2);
                if (p =3D=3D NULL)
                        goto trunc;  // The string was truncated

        Here's how stpecpy() can be implemented for this:

                char *
                stpecpy(char *dst, const char *end, const char *restrict sr=
c)
                {
                        ssize_t  dlen;

                        if (dst =3D=3D NULL)
                                return NULL;

                        dlen =3D strtcpy(dst, src, end - dst);
                        if (dlen =3D=3D -1)
                                return NULL;

                        return dst + dlen;
                }


Cheers,
Alex

--=20
<https://www.alejandro-colomar.es>

--bskk2l42cbyh4vua
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmptM3sACgkQ64mZXMKQ
wqmtiw/+IbEk+ZcD9iw7v2z+KXYLHhb6oChLEypR0DmvtCjrZb1macgs9v29ltpp
y8/uXnm9+VedeIIQevDJON+HDOfLjeKbQ5a3uInv+s+vDVG0dZpuqCUgr9AgJb0w
CfBNpxbAPqG8qm8Z2N5SMpo77QwFhUALRxxD1Jv12FtYNKl9MTmRExjcNsZi8JYX
so8pJmz3y2BpYQCUKnfzu9vlWg6cZYwLJJxNT/7L5LKWTQcosIUGcFxGtA7QYyF+
Ojc45twZREVQFa0Jtk4TzwpR6EVFOf4Lx/DiXzTmd7itUGMesAZVuqNAqIXrSgjx
8bpJW2VZMlx04wJvy32FM1g1pXEnmHQfaFqdPdYYGlqDp/qV75SIA3KkddTE5+0p
7+wDbgrqOM3Ddm6dzLlbuTiYYazCo3tbQnB6KcwuBnVDWkwQ2K59URmuAqBVxzaA
dLku51H2x/92SoXy0yFEGNPMP1SMf2nP1qAcZbtvXOZ+suQfVQZ6qZBdunxEVP2O
mc7Bu39zJY/R0jDV9CwcW7iPVA4aOh1poi9PifnS7GD63qV81nEP5vprodYVjgu4
TONvSFgiA3vRvXQEFQSbCxYKr7OL9fDPoNjD7B8dLI/t9jFSXMEeAdx3rxH0ZDA1
UaT46Z64KlUf6bTwHlW9mM/VQppT8d9VCIAR/y+DPxNbyfahz6g=
=WOQ6
-----END PGP SIGNATURE-----

--bskk2l42cbyh4vua--
