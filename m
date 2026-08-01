Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB38C1D89EF
	for <linux-man@vger.kernel.org>; Sat,  1 Aug 2026 12:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785587992; cv=none; b=WN0akww4pvOSiISpI7MHWy/GANAQ6YBObAbW5t9VRv8JIzC8/4FQElFNtFTTn2UKM3jf+MCp/gUT3Eqg46e/Dz4nm446PsB488AkoBn3naehA9CQb+BJHGyifSs6MSGiiLS/uMpB3fH/kQ2gm3rdjPtimbZwXnHr4esWD95YYM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785587992; c=relaxed/simple;
	bh=MebFjpVC1PJaQCYdB+4shaBjx8lctUAoafomPKstXGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p7NY6fcW2oVe+ngOq1OiDtRQ0cIUlim5+DvQuN1F0ZTuM3nZwNRf8KBMY7J4JCAZJYCAsEmZ7pwVqGgGhuuXymX6+d4GPo0fdqlyVLaMdDVQbkuU0SOAzaRNrsff6wj3GJxUFF9g0NOfl12AUolGGOf3sgc324b/4bJi+cTmYzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FbFY+Ykn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FbFY+Ykn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFCAA1F00AC4;
	Sat,  1 Aug 2026 12:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785587990;
	bh=vv5uup2aMtdaTYYWGdDtVndndVy+/LpA5qcqQmrexBw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FbFY+Ykn/dqadPpm+WxeN1oznioQziOLwpWY5urArTsGeJaxhxc5Xq1uZbgYW0XSH
	 pF1Mxd1q4Qe9yxTWlE1AA8M0T128Gz06IQ8nz8msEJDUUnZH2JVBbfqg5tQNv8zFI3
	 qpG9rU7NGVNoiV66RjUieLSUDW0aQrFrDxdhgTNRSmvKM4BNCPHLveY9rgHRTWNQK8
	 9gJtE3E8AICpRHBwGMu6oPKCQ8EHacsQaaIu4SItBTmOq8fRKx5NrTSv3ThJzixU0K
	 J9fmqlq3jMyqxu77q1bjYW3pEWDoqTzX7VEs/qwFyP5Ozs95Ymz1mMJP6cGIYTJwPZ
	 HlWc+TyATTX+w==
Date: Sat, 1 Aug 2026 14:39:45 +0200
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Joseph Myers <josmyers@redhat.com>, linux-man@vger.kernel.org, 
	Keith Bostic <keith@bostic.com>, Mark Harris <mark.hsj@gmail.com>, 
	Nevin Liber <nevin@cplusplusguy.com>, JeanHeyd Meneide <phdofthehouse@gmail.com>, 
	Christopher Bazley <chris.bazley.wg14@gmail.com>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Iker Pedrosa <ipedrosa@redhat.com>, "Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, 
	Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, libc-alpha@sourceware.org
Subject: Re: [PATCH 1/2] man/man3/{mem,strn}*(): SYNOPSIS, STANDARDS:
 Document these as provided by <memory.h>)
Message-ID: <am3lZ6l3B4Y1fvFO@devuan>
References: <cover.1785532392.git.alx@kernel.org>
 <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
 <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
 <20260731215122.4p4aepsbgeoibx74@illithid>
 <89c9b877-54a8-6a7c-016d-51e4be210ad6@redhat.com>
 <am0fnb4BMRrTajqx@devuan>
 <0407bda3-c03a-93cb-9400-5fb8256a30f2@redhat.com>
 <am0lAEb1wuCJPDk7@devuan>
 <9223d084-7de4-914f-9b53-8862510542d8@redhat.com>
 <20260731233253.7uwgq7m7vndqf2o2@illithid>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xhah5old2smyfdhl"
Content-Disposition: inline
In-Reply-To: <20260731233253.7uwgq7m7vndqf2o2@illithid>


--xhah5old2smyfdhl
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Joseph Myers <josmyers@redhat.com>, linux-man@vger.kernel.org, 
	Keith Bostic <keith@bostic.com>, Mark Harris <mark.hsj@gmail.com>, 
	Nevin Liber <nevin@cplusplusguy.com>, JeanHeyd Meneide <phdofthehouse@gmail.com>, 
	Christopher Bazley <chris.bazley.wg14@gmail.com>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Iker Pedrosa <ipedrosa@redhat.com>, "Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, 
	Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, libc-alpha@sourceware.org
Subject: Re: [PATCH 1/2] man/man3/{mem,strn}*(): SYNOPSIS, STANDARDS:
 Document these as provided by <memory.h>)
Message-ID: <am3lZ6l3B4Y1fvFO@devuan>
References: <cover.1785532392.git.alx@kernel.org>
 <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
 <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
 <20260731215122.4p4aepsbgeoibx74@illithid>
 <89c9b877-54a8-6a7c-016d-51e4be210ad6@redhat.com>
 <am0fnb4BMRrTajqx@devuan>
 <0407bda3-c03a-93cb-9400-5fb8256a30f2@redhat.com>
 <am0lAEb1wuCJPDk7@devuan>
 <9223d084-7de4-914f-9b53-8862510542d8@redhat.com>
 <20260731233253.7uwgq7m7vndqf2o2@illithid>
MIME-Version: 1.0
In-Reply-To: <20260731233253.7uwgq7m7vndqf2o2@illithid>

Hi Branden,

> Date: 2026-07-31 18:32:53-0500
> From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
>
[...]
>=20
> Okay, well, <memory.h>'s out due to the above, and <mem.h> collides with
> old, non-standard Borland and Watcom compilers (which live on still in
> environments like FreeDOS[1]).
>=20
> So how about <stdmem.h> or <stdmemory.h> for the standard mem*
> functions?

As I said, I think it's the other way around.  <memory.h> is great,
because there's no public record of it being obsolescent.  It has only
been _implicitly_ obsolescent, but the fact that it has remained without
much attention make it a good candidate.  Just as much as it was done
with memccpy(3) in C23, except that memccpy(3) was brought back for
bogus reasons (it's as bad as strncpy(3) for the purpose it was
standardized).

<memory.h> is already available in all systems that matter, so programs
can start using it today, as opposed to <stdmem.h>, which could only be
used relied upon around 2036 --for the early adopters--.  If we didn't
have the old <memory.h> header, I'd certainly prefer <stdmem.h>, but for
these reasons, <memory.h> seems the way to go.

> > Any reasonable change there would involve a new header, say
> > <strnpad.h> for strncpy and strncat, rather than resurrecting a very
> > old one.
>=20
> I agree with that.  As my previous email noted, I think C programmers
> apply the mem* functions differently than they do str{n,}*.  I think
> it's a good idea to erect a cordon sanitaire around the ever-troublesome
> latter functions.

I strongly disagree.

And a cordon sanitaire wouldn't help.  That's the approach that n2349
took, and it was bogus.  It's not a matter of saying "these two
functions are bad".  It's a matter of learning what each function is
good for.  And all of mem*() and strn*() are good for memory handling
and nonstring handling (which can be considered a specific case of
memory handling).  Thus, all of them belong in <memory.h>.

A cordon sanitaire will continue to ignore the fact that the problem is
not in the functions themselves, but in how users think of these
functions.  I expect in 10 years from now, if we don't do anything,
people will notice the same problems in memccpy(3) that we now attribute
to strncpy(3).

Just look at all the garbage that people have written with memccpy(3)
after it was standardized in C23.  A Debian code search will suffice to
show the brain damage.  Or you can just look at n2349, the paper that
proposed it for its standardization, which already has UB in the
examples of how it can be used for copying strings.  It's all just too
ironic.

Let's make it easy to understand these functions, and avoid blaming any
functions for what really is our lack of understanding.

> > > The solution of moving both mem*() and strn*() to <memory.h> and
> > > leaving just str*() in <string.h> is a consistent one, because
> > > <string.h> then remains strictly for string APIs, and <memory.h> is
> > > for the rest of byte handling.
> >=20
> > It's inconsistent with how people have understood C ever since it was=
=20
> > standardized.
>=20
> This claim is a bit hand-wavy.  C has spent its entire lifetime being
> notoriously poorly understood.  But especially in early days, the
> compiler would spit out something anyway.  Hackers confused the
> production of a linked object file with understanding the language.
>=20
> C has single-handedly elevated "undefined behavior" into a field of
> academic study.
>=20
> > > It wouldn't be reasonable to move strn*() to <memory.h>, and then
> > > leave mem*() in <string.h>, of course.
> > >=20
> > > Similarly, it wouldn't be reasonable to [move] strncpy/cat() to
> > > <memory.h> and leave the rest of strn*() and all of mem*() in
> > > <string.h>.
> >=20
> > On the contrary, it's only the functions for null-padded fixed-width
> > buffers that are niche functions causing confusion, compared to all
> > the rest of the functions in <string.h> for which it's a very
> > well-established and well-understood location.  Some others like
> > memccpy are *obscure*, but not confusing in the same way.
>=20
> I agree with you here, but the base+bounds nature of the mem* functions
> versus the null-terminated nature of the str[^n]* functions, warrants
> separation.

+1

> 37 years ago the C Committee seemed to feel it needed to economize on
> standard header file names, so many unrelated interfaces got piled
> together into .h files that consequently lacked coherence (in the
> Yourdon/Constantine sense).

+1

> WG14 has been moving away from that notion for decades now.  A recent
> example is <stdbit.h>.  Why not continue in that laudable direction?
>=20
> I think
>=20
> stdmem.h
> string.h
> stdstrn.h
>=20
> would sharply separate concerns and promote clearer reasoning among
> application developers.

For the reasons above, <memory.h> is better.

About the third header, I originally thought that, and in alx-0097
I wrote about adding a <nonstring.h> header.  However, the more I think
about it, the more I think these are just fine in <memory.h>.  The Linux
kernel for example, renamed strncpy(3) to strtomem_pad() --and as
discussed within WG14, the _pad in that name is redundant, so it could
perfectly have been called strtomem()--.  This shows that these
functions are not as unrelated to <memory.h> as their current names
suggest.

This, combined with the fact that they are already available through
<memory.h>, makes me think that we should just put them in <memory.h>,
which would lead people to think about a binary distinction between
<string.h> for string-only, and <memory.h> for memory stuff that doesn't
handle strings.


Have a lovely day!
Alex

>=20
> Regards,
> Branden
>=20
> [1] https://www.freedos.org/books/cprogramming/part8/



--=20
<https://www.alejandro-colomar.es>

--xhah5old2smyfdhl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpt6QsACgkQ64mZXMKQ
wqlnEA/9FJTklZO0c2o9NIhUN6TwT6XeViCA6+y33JuNl2bmhxzXYI4osLTkByxR
faZRtynZJS1QwmzSnMTm1fZ2/U/MQjfkCw+BVgUeyS3s8hD3AAiF2VHjrrPu/7uA
0mm77q6YHThNc/egTB0yESmuWQb2G0U5zBB4x50k72xIdNuCKzfe8+3GXXjIO20n
RzEbkFvru8WxBmZyCfWvfyF/T8pXSDvmxPLuI3zG3qEWKQcKWMMZxPdACG3InHRK
omDHCU37VbQmu89MJUCSpI6OuRhJKtnBNMxpCvcCUK9oRokfImP9aUvuFkHqhwHq
YsgIg1aNUdd6CR0CxUYZdgyLlK/oq3rrBalb3/GJ7ajAeycL+MX3d9NrD20GoHPI
d6M1Crky31o5XpUSQ++RVxh2FKeYOpgCsd+AvMpuxkPsEMfkEid1ILP7WXjh1G9V
720VvjbzIKQXej5KA41Ubp2wkSC5voPZV2ZBPEUT2+nXd8ZZup+K+YNJM1wz8NtG
18vbfM1oTGTdYmeQoi7v3ILVNjVLY0fJ25iJZYzTh9Dlhd3AABEy0uSU05MoGGzU
ih2QZX3L4qTpoFYU/GqJoJbR0WRxkNLDICV6F1kvcDtQDWpUSUqPQC0lJOCUC0dU
7zGTYMcW7fhypCYYg+GOOjyGiBnx7bTv8ESLFZtXyKtr5VXU5Oc=
=JD77
-----END PGP SIGNATURE-----

--xhah5old2smyfdhl--
