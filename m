Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B7F2DC789
	for <linux-man@vger.kernel.org>; Sat,  1 Aug 2026 15:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785598179; cv=none; b=HFyi64I7hLx/mH5i36C/BIyou34GM8NZXccXP1CouuppD7ktNAcu5oA/t69cNU7etmT39Ecfajgzl+oi+mcWz03mLZOlj8HYxd8yYt5mkK5CGES3xvMT9sqqQEKBisgHVo9pviHbZ4kV5OVD7Ic5CCPJWDKASAIfHD0Ls4j1vmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785598179; c=relaxed/simple;
	bh=U5ThuzI5uBXoL8WpcWapXENPG62S/n2Oao4yiGsIPVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R+sZ6zv7rEOmwQOiPcf1+JE2RYlwvn4pP5rDMtXTXCPEAbmpgIT7t+vjt3EGdn/mG9htNpZyi/zJt6IM5iR51MRni7zFtQvbjeXSyyuO2w9kgiRTIcCqBNDVEFRRUBmA3YdItJ0Krnj34FCeZOmtHEPB2Mz7dguo082aqAcwOZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O8yb9LbZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O8yb9LbZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EE481F00AC4;
	Sat,  1 Aug 2026 15:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785598178;
	bh=cvc8pkToj7XMGbT+AzrqNGDdukjnxvAxwsBlmYxqJEg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O8yb9LbZPQp5V57JdUNXFptRZ6bApnJm5zlO0wOCm9cl1wcGUgjVIyCbSqlXflPy5
	 FNpl46+t/ngZKvcQAi0BqaJhaz4ZDvIFQATUk9Sx7nwEA4Ai+WKJ+JLT1bLbL1/VSF
	 Lc4o6J4nSgmTkN9HfadmMmWxxZgkEQDKYWq0s8aZComQ+5q5QNhYdyQ0o9sy+5Fwoa
	 xt11/u7k7wHEJzspFoog3XESHzj7o8fj3lwvnpiIxb/JmN0EJIepKIGR9GGlWM6mLt
	 nJGCKurtr38L+2vvzP1RDgFyBfE81L45Lo8hWTkrFJHzxHh1dhG2J5i6W+7eESee3t
	 jBqk9ZybCYMiA==
Date: Sat, 1 Aug 2026 17:29:33 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Christopher Bazley <chris.bazley.wg14@gmail.com>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	Joseph Myers <josmyers@redhat.com>, linux-man@vger.kernel.org, Keith Bostic <keith@bostic.com>, 
	Mark Harris <mark.hsj@gmail.com>, Nevin Liber <nevin@cplusplusguy.com>, 
	JeanHeyd Meneide <phdofthehouse@gmail.com>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Iker Pedrosa <ipedrosa@redhat.com>, "Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, 
	Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, libc-alpha@sourceware.org
Subject: Re: [PATCH 1/2] man/man3/{mem,strn}*(): SYNOPSIS, STANDARDS:
 Document these as provided by <memory.h>)
Message-ID: <am4Nx6DntemzH2M9@devuan>
References: <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
 <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
 <20260731215122.4p4aepsbgeoibx74@illithid>
 <89c9b877-54a8-6a7c-016d-51e4be210ad6@redhat.com>
 <am0fnb4BMRrTajqx@devuan>
 <0407bda3-c03a-93cb-9400-5fb8256a30f2@redhat.com>
 <am0lAEb1wuCJPDk7@devuan>
 <9223d084-7de4-914f-9b53-8862510542d8@redhat.com>
 <20260731233253.7uwgq7m7vndqf2o2@illithid>
 <CAEHU8x9cXuViHVSQY7iR+LtdSwHy9_og3FsbCWGGDUkN6e+gMw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u3jsgmyswzflzqnl"
Content-Disposition: inline
In-Reply-To: <CAEHU8x9cXuViHVSQY7iR+LtdSwHy9_og3FsbCWGGDUkN6e+gMw@mail.gmail.com>


--u3jsgmyswzflzqnl
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Christopher Bazley <chris.bazley.wg14@gmail.com>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	Joseph Myers <josmyers@redhat.com>, linux-man@vger.kernel.org, Keith Bostic <keith@bostic.com>, 
	Mark Harris <mark.hsj@gmail.com>, Nevin Liber <nevin@cplusplusguy.com>, 
	JeanHeyd Meneide <phdofthehouse@gmail.com>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Iker Pedrosa <ipedrosa@redhat.com>, "Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, 
	Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, libc-alpha@sourceware.org
Subject: Re: [PATCH 1/2] man/man3/{mem,strn}*(): SYNOPSIS, STANDARDS:
 Document these as provided by <memory.h>)
Message-ID: <am4Nx6DntemzH2M9@devuan>
References: <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
 <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
 <20260731215122.4p4aepsbgeoibx74@illithid>
 <89c9b877-54a8-6a7c-016d-51e4be210ad6@redhat.com>
 <am0fnb4BMRrTajqx@devuan>
 <0407bda3-c03a-93cb-9400-5fb8256a30f2@redhat.com>
 <am0lAEb1wuCJPDk7@devuan>
 <9223d084-7de4-914f-9b53-8862510542d8@redhat.com>
 <20260731233253.7uwgq7m7vndqf2o2@illithid>
 <CAEHU8x9cXuViHVSQY7iR+LtdSwHy9_og3FsbCWGGDUkN6e+gMw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEHU8x9cXuViHVSQY7iR+LtdSwHy9_og3FsbCWGGDUkN6e+gMw@mail.gmail.com>

Hi Chris,

> Date: 2026-08-01 15:26:05+0100
> From: Christopher Bazley <chris.bazley.wg14@gmail.com>
>
> On Sat, Aug 1, 2026 at 12:32=E2=80=AFAM G. Branden Robinson
> <g.branden.robinson@gmail.com> wrote:
> > WG14 has been moving away from that notion for decades now.  A recent
> > example is <stdbit.h>.  Why not continue in that laudable direction?
> >
> > I think
> >
> > stdmem.h
> > string.h
> > stdstrn.h
> >
> > would sharply separate concerns and promote clearer reasoning among
> > application developers.
>=20
> I have been reluctant to stick my oar into this argument, but the
> proposal above is the best I have seen so far.



> The trouble with
> Alex's assertion that the strn... functions are not string functions
> and therefore must be memory functions is that it strikes me as a
> false dichotomy.  I understand why he makes that claim, and I
> understand the damage the confusion has caused, but I do not find it
> entirely plausible given that strncat appends to a string and strncpy
> can consume one.

You and I have actually the same opinion of strn*() functions.  We only
differ in the wording, and it was likely my fault for using wording that
isn't the most precise.

I've said in the past that strn*() functions are not string functions,
and as you say this is not exactly true, since indeed, strncat(3)
produces one, and strncpy(3) may consume one.

I believe I should have said --and my most recent messages are in that
line-- that strncpy(3) and strncat(3) are not _string-only_ functions.
They have arguments that are not strings, and that's what makes them
different from the rest of <string.h>.  All of the str*() functions that
are not strn*() functions --thus, the str[^n]*() functions, as Branden
called them, using regex syntax-- share this in common: they handle
strings exclusively, in all their arguments (except of course, the
integer ones); that is, it is UB if a nonstring is passed, and when they
create output, that output is a string.

The following functions, all *require* strings, and *unconditionally*
produce strings (if they produce anything):

   Copy
     strcpy(3)
     stpcpy(3)

   Catenate
     strcat(3)

   Duplicate
     strdup(3)
     strdupa(3)

   Compare
     streq(3)
     strcmp(3)
     strcasecmp(3)
     strcoll(3)
     strverscmp(3)

   Search
     strlen(3)
     strnul(3)
     strchrnul(3)
     strchr(3)
     strrchr(3)
     strpbrk(3)
     strstr(3)
     strcasestr(3)
     strspn(3)
     strcspn(3)

   Separate
     strsep(3)
     strtok(3)

   Others
     strxfrm(3)

This is the entire set of str[^n]*() functions from <string.h>, as
documented in string(3).  The rest of functions are strn*() and mem*(),
and they share something in common: they may take nonstrings and/or may
produce nonstrings.

In fact, mempcpy(3) is not really a memory function like the other
mem*() functions.  mempcpy(3) is specifically useful for handling
nonstrings (and is also useful for producing strings out of those
nonstrings later).  There's no clear cut in these functions, and you may
claim that mempcpy(3) belongs more in <stdstrn.h> or <string.h> than in
<memory.h>, if only for the kind of code you'd use it for.

The only clear cut is that some functions require and produce strings
exclusively, and others may not necessarily do so (even if they may
sometimes do so).

> I also understand the deep attraction of righting
> past wrongs, but it seems to me that, in this instance, the past was
> not so satisfactory either.
>=20
> I am skeptical that many users will include header files that did not
> exist before C2Y, but it may be worth trying. I do not think the
> proposal to restore <memory.h> would be much better: it does not exist
> on many platforms.

In the POSIX world, reality is quite different from the rest of the
world.  Here, <memory.h> is almost everywhere.

> If we are going to introduce a new separation, let
> us make it a good one.

For the reasons above, even if <memory.h> didn't exist, I'd say the
3-header solution it's not ideal.

> Christopher


Have a lovely day!
Alex

--=20
<https://www.alejandro-colomar.es>

--u3jsgmyswzflzqnl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpuENcACgkQ64mZXMKQ
wqmpmhAAnLcB8k5W64VAOTMZQD7oqG/L3RMEEiI929X5QsbTFAezAAWmfFRiI/ja
mmYJsMHVbDyCc6WJ1riceSdH8uVYwWfD0K0SbLbLo44I7jm+yOwbTvh/gd/pNLmG
NQ3cRDw5D6hxc59H36c3Cdngm0tUfP0Xoe8zKxwJJHW0ErXaLaIrUtrReCCQyraM
6C6XlMhxn/xch0pKOWSy6QaxwPefIe1N/VCdEQqZgFVh17mCw6/qNJxIrydub7rp
eBi33+ijJOGZ+GetSiLl5JJGtgUYCQpwz4shcy0xwVtHGOA9A0ecJP9U7kHtdrfD
pXzU1nsILVsE1zdeYylWfdK7BRhwp3l8bDWsUKlz+3VJ20b1Ol6tnUgrwwpQLhK+
cK+KP9pt/7YZOEOfE8P1yuFxe+Trla0NtBsSOh1FTfsVOPNiamAby8hpECZfNqce
zRDDC9bLNR/uEz/7Obhp6fLrtdJtePvqrh8llNss5tvYpHnHLjqRpdBEZBfhjeu9
cKtpRneEGBK0tsMW04ZPQDy3/ZjAVJ92EaXbznHHaQxO1LgmemRV7FqF1NgEMyB8
nILmnwHwex6a2cfipTDsRwMrJ4CP3fCvhngN99PShbQDHXug2+O12pDc4Cg8/1Oh
OGOWmiDdKUoar2XFt8cqgj2vu3KoUFyKlTTvRXAYLRk1f6eYE2c=
=TdN8
-----END PGP SIGNATURE-----

--u3jsgmyswzflzqnl--
