Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A720737A821
	for <linux-man@vger.kernel.org>; Fri, 31 Jul 2026 23:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785539988; cv=none; b=NMGVnmWSDOcXg9osNOlufTNGPvBOg9vyBufFyWKVIKpe5dQPP8qpSy6aCzJOVc2Z2qyYY+tsljF4NwLadh1PFvAjgHUdB9TZ9FAFGNr402MxiyTDga0QqLI/C8f09fP8JlxJQwA9k1MkLus50eo/il88Guz41+sBBAlYV9MoESw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785539988; c=relaxed/simple;
	bh=xycfe4QtutLHe5ap3C6bEHFfSEeS87qqNRDE1Y00GhE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D7byOPzgxQhZBQGupn59tbu7rF6Eg5fTQsCN3irYqJTTa8b5141FMmg4Vw6nA633k7mhL9dPEI/HFdCC2lYs2Vl3+3vaoqqXJaZp0quzbr9ud0KDym1BaN1OlPBRNwCQxJGdF3pL9P24I0+sm0RzK2lNoek6Zjb/gXdRuttG+Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I9VKX+mr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I9VKX+mr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 734AF1F00ACA;
	Fri, 31 Jul 2026 23:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785539987;
	bh=ZxesOwBQkS+XtWwLJ7hShGYrkEVO/ub72xwrjJP2U5U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=I9VKX+mrj6eGVPGLbthV8AZPoCX5905WBH8XAc/qanm+RvJ3E+TfaWqTPyhW7d4/H
	 rcPJchrxZh4NsM6Rd2h6awgeInuk5efhlCgjSDFf6wXXM4tKqvlmAxfo/J9X/lJ+zK
	 8MAgQgLdEVmAcHfa0yC5qTz+rCOA1SQelyzymubaF+0PXnHcdUp+HzInJhSVaJL/s4
	 mcHugbIHrYgSzTq239nxNpmMmW60fa03Mvm4I9QNvPd7Es2Na+/5wCXSXeeTB+FGGV
	 86wVUQSxKYmnkd8ZtQ0ujqJ1Nw3Px8PujrZCkTmQtz2xFPgSE5l6qa08WeM1VhkEFs
	 OXDfrus243s3Q==
Date: Sat, 1 Aug 2026 01:19:42 +0200
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Sam James <sam@gentoo.org>, Joseph Myers <josmyers@redhat.com>, 
	linux-man@vger.kernel.org, Keith Bostic <keith@bostic.com>, 
	Mark Harris <mark.hsj@gmail.com>, Nevin Liber <nevin@cplusplusguy.com>, 
	JeanHeyd Meneide <phdofthehouse@gmail.com>, Christopher Bazley <chris.bazley.wg14@gmail.com>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Iker Pedrosa <ipedrosa@redhat.com>, 
	"Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org
Subject: Re: on the irresponsibility of pursuing C language reform
Message-ID: <am0rpivjb9fBdwqe@devuan>
References: <cover.1785532392.git.alx@kernel.org>
 <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
 <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
 <20260731215122.4p4aepsbgeoibx74@illithid>
 <87a4r6es6k.fsf@gentoo.org>
 <20260731222417.4fo36is3iawyc7d4@illithid>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sqevub5kqbys44zc"
Content-Disposition: inline
In-Reply-To: <20260731222417.4fo36is3iawyc7d4@illithid>


--sqevub5kqbys44zc
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Sam James <sam@gentoo.org>, Joseph Myers <josmyers@redhat.com>, 
	linux-man@vger.kernel.org, Keith Bostic <keith@bostic.com>, 
	Mark Harris <mark.hsj@gmail.com>, Nevin Liber <nevin@cplusplusguy.com>, 
	JeanHeyd Meneide <phdofthehouse@gmail.com>, Christopher Bazley <chris.bazley.wg14@gmail.com>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Iker Pedrosa <ipedrosa@redhat.com>, 
	"Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org
Subject: Re: on the irresponsibility of pursuing C language reform
Message-ID: <am0rpivjb9fBdwqe@devuan>
References: <cover.1785532392.git.alx@kernel.org>
 <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
 <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
 <20260731215122.4p4aepsbgeoibx74@illithid>
 <87a4r6es6k.fsf@gentoo.org>
 <20260731222417.4fo36is3iawyc7d4@illithid>
MIME-Version: 1.0
In-Reply-To: <20260731222417.4fo36is3iawyc7d4@illithid>

Hi Branden,

> Date: 2026-07-31 17:24:17-0500
> From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
>
> Hi Sam,
>=20
> At 2026-07-31T22:59:47+0100, Sam James wrote:
> > "G. Branden Robinson" <g.branden.robinson@gmail.com> writes:
> > > At 2026-07-31T21:23:35+0000, Joseph Myers wrote:
> > >> I think it's irresponsible to use the man-pages project to promote
> > >> personal idiosyncratic ideas like this in preference to what's been
> > >> the standard location of functions since 1989.
> > >
> > > I'm sure I don't need to bring to your attention what a mine field
> > > string/`char` sequence/memory buffer handling has been in C since the
> > > language's inception.
> > >
> > > More to the point: what's a better forum for pursuing this attempt at
> > > reform that will both (a) reach a significant population of stakehold=
ers
> > > who can variously red-team it and/or endorse it; and (b) has sufficie=
nt
> > > visibility that it can't easily be ignored by people who oppose reform
> > > in this area for whatever reason?
> >=20
> > I think the man page already tries to discourage use in its CAVEATS
> > section.
>=20
> Yes, but that's not a language reform, which is what Alex is pursuing
> with "alx-0097r1".  In at least one earlier iteration he's expressed his
> intention to submit an N document to WG14.

Indeed.

> > > I hope you do not wish to imply that a closed session of some
> > > committee, or unofficial backroom politicking would be preferable,
> > > nor that WG14 should close its doors to members of its user
> > > community who have not been vetted for a disinclination to
> > > boat-rocking.
> >=20
> > I am confused as to where that implication could have possibly come
> > from.
>=20
> From familiarity with Alex's stated objective and rationale, which we
> can acquire from the recent list traffic Joseph characterized as
> irresponsible.
>=20
> AC> The C Committee is discussing standardization of <memory.h>, so
> AC> let's give it a bump.
>=20
> AC> I'll send you a copy of a paper I'm writing for the C Committee.
>=20
> AC> It is at the bottom of this email.  I will publish it as an N
> AC> document in August.
>=20
> https://lore.kernel.org/linux-man/784288e704183a4297aeaa3d13af8edab18bc1e=
a.1785532392.git.alx@kernel.org/
> https://lore.kernel.org/linux-man/amaTpQxd52iYjlor@devuan/

Thanks for posting the links.  I've seen Doug was CCd on the second, so
I've bounced him the patch set and alx-0097r1, in case he's interested.

>=20
> > Joseph is opposing the change in the form of a patch that is
> > likely to be applied (*) to man-pages.git which has the effect of
> > advocacy.
>=20
> Yes, and he said so categorically.  More constructive advice might have
> taken the form of recommending a sequencing for staged changes.  Here's
> a crude sketch.
>=20
> 1.  Expand "CAVEATS" sections in relevant Linux man-pages documents.
> 2.  Pursue N-document work with WG14.
> 3.  When WG14 has disposed of that N-document (and any descendants
>     thereof), update Linux man-pages documents as appropriate.
>=20
> Joseph's almost certainly better placed than I to add a "step 1.5"
> such that Alex might pursue some course that would better prepare the
> ground for his step 2.  I haven't attempted revision of the C language
> standard myself, so I can't offer specific advice regarding how best to
> pursue such an objective.  I possess only notions of elemental
> principles regarding how democratic, consultative bodies of technical
> experts _should_ serve the public.
>=20
> That _is_ what we're here for, right?

Yes.  Some more details:

I've obviously circulated this earlier within WG14, and CCd Keith and
Mark in case they could clarify historic details, or were otherwise
curious about/interested in the proposal.

Joseph stated opposition there (within WG14), and Keith Bostic suggested
that I could change the manual pages to document <memory.h>, and use
that to influence the public, in order to get to step 2.  (The exact
wording may differ.)  Indeed, I thought it was a great idea, as
<memory.h> is just as portable to POSIX-ish systems as <string.h>
(except for gnulib and Illumos gate, gnulib is CCd, so hopefully they
 address this portability issue).

> > I don't think it has anything to do with WG14 membership or anything
> > of the like? What am I missing?
>=20
> See above regarding Alex's publicly circulated drafts and expressed
> plans.
>=20
> > (*) Alex has a history of making opinonated changes like this to
> >     man-pages, such as removing references to older standards, and
> >     using a somewhat novel (to many) syntax for prototypes.
>=20
> I concur with that assessment.  However, a person having a history of
> making opinionated changes is not sound grounds for evaluation of a
> technical proposal, especially if it's topically unrelated.
>=20
> Preoccupying oneself with irrelevancies distracts from the conscientious
> execution of standards committee participation.

Thanks for the support!  :)


Have a lovely night!
Alex

--=20
<https://www.alejandro-colomar.es>

--sqevub5kqbys44zc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmptLYUACgkQ64mZXMKQ
wqmO2A//WK7Dek+23/tAJJ1IzCNcd7gjhJcG1zNBX84onqbBHDWCUA2EQJgrJxWO
9NW8Xeea6TGhDL66day4q0WDXB9luYwmz9V1pdsbwUqMGI5cBDMiWswYcn+qqD2S
Bi/qy3lkpvdm+gKyG45x7SMC1XOY6LhdrNiDqCNXj4YYA9mwi5qJbzXZyyxvjDs9
6y1AToSxlbe8XMPBjlNeEf6MVEkXW/QMTORmItC8thiZlpos07HqPjgNeB+/mgE7
0LthwAA28oMNDb9pLJKqEMmwIyJJST/SOxXOlqKMlcYoJgPc+2+cTZY0jCbRnPMd
QZeK/M6nTQwxf5CVXyJ9CSfJS4Mi2El/NwrFIZB1QEY0CIUqBHmFqGeBNbPxW07J
E2MSnQswCQXjsjPeJ8A72YqL6A2Xr4867HqBS12Y9On3jhT8ZjpouAgcDKzqOrWe
I5NKq0XqOxqfeQpVvde86q7BRSdk3Oc6AL4vnklMs9xonAIBmzb1YBEGnaPXroRJ
lkqFVFKm9+mJ+qqmZ5ry9Ujvl1SM9b3KZ8jyobBjZ/2cKzKmdWNbCGQandUdoSi2
noIBNQ45aeIfrDGWJAoAqkvs9VzarbrnXb9ShVoDceJFmpAe28HwdYy5GdzTtD4N
FaT7Educpafy700J4DNFYlJLQNboo8SZyp4fuuYfMcabA7olKAQ=
=/yJJ
-----END PGP SIGNATURE-----

--sqevub5kqbys44zc--
