Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC6A42A96
	for <linux-man@vger.kernel.org>; Sat,  1 Aug 2026 00:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785542816; cv=none; b=L+OCAwankWzsjOv7dclG8KaeyJdnVUBhybi17vFNyMCstwvgAo9t/VjTlfhoLeRC3hUUxonj9yA0WVDtBOTDowVT8F0/CZZNjJ6UO/1VWCzHjZGk/UHnZKxNGgiu61ZHNtSSh/iZyyaR+dyFQyeZPAQcFyppEUEs3z1T68WN4VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785542816; c=relaxed/simple;
	bh=mApv6vrvRbs3SBbyMmg5wT/L+gzqwO+PxXPjQ4Kbmvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FGW3l0EVD9aC9XQ2ZJGrJFMcSiLTU0eEDuAEOpZHTzLhw8QVdoywIZttvrrSm2CRrXm0UwO6Q+rEhLW2og3XDDL0uy8HjYRO9V2ADgcesVx9mN8tzHCX7mADOiNP0kZu1KE1isSYRI4CiE0MoSTjw9224+uDjHoaFo0ZTK+bfe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F3NvR0NP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F3NvR0NP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64C8A1F00AC4;
	Sat,  1 Aug 2026 00:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785542815;
	bh=ZQj/kbLoTz6ixmkjoHcY1ut7jE1OmDfnLzdjXfwaFE4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F3NvR0NPi3Bw1LeaKt9XQrTU3RZXRe6C9+RCXmJjXu0NvDZxLcveh/bGOApEk/ouN
	 yUexA4HDzGGwO1XaNjUFTdw9o975eoQZ2DFY+z1jpDkXaqX5gf8kTw8jYGaX7qmA7G
	 tc/Eqfxrhb8YuMFyr27J5xruOb+Q+8CVx+fXNmbDCLMyxUIAgNQujp/7an59Jqu2HH
	 nmIi4C+3AzaK49lZLaE9erpEn9z7WizVr2dP/LxoFQvIpyIUbyBP5CO0cKIkg52yyD
	 eDyhFNLDK1WQlMmv4ojTl0lyVeTEu3aXeFlQ7OjQH6TqD1cqg1pcuGVW7zXTQdUlZA
	 qntJsvK1ahx1w==
Date: Sat, 1 Aug 2026 02:06:50 +0200
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Joseph Myers <josmyers@redhat.com>, linux-man@vger.kernel.org, 
	Keith Bostic <keith@bostic.com>, Mark Harris <mark.hsj@gmail.com>, 
	Nevin Liber <nevin@cplusplusguy.com>, JeanHeyd Meneide <phdofthehouse@gmail.com>, 
	Christopher Bazley <chris.bazley.wg14@gmail.com>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Iker Pedrosa <ipedrosa@redhat.com>, "Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, 
	Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, libc-alpha@sourceware.org
Subject: Re: [PATCH 1/2] man/man3/{mem,strn}*(): SYNOPSIS, STANDARDS:
 Document these as provided by <memory.h>
Message-ID: <am04Lt2WQ2wNonuz@devuan>
References: <cover.1785532392.git.alx@kernel.org>
 <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
 <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
 <20260731215122.4p4aepsbgeoibx74@illithid>
 <89c9b877-54a8-6a7c-016d-51e4be210ad6@redhat.com>
 <am0fnb4BMRrTajqx@devuan>
 <0407bda3-c03a-93cb-9400-5fb8256a30f2@redhat.com>
 <20260731230847.prx4gay3ejvqdy6q@illithid>
 <8b8fc216-8c6e-fcc2-c72a-2c26555d95e7@redhat.com>
 <20260731235747.7bwyb2xul4zhryuu@illithid>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zorhsguq6bpf334p"
Content-Disposition: inline
In-Reply-To: <20260731235747.7bwyb2xul4zhryuu@illithid>


--zorhsguq6bpf334p
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
 Document these as provided by <memory.h>
Message-ID: <am04Lt2WQ2wNonuz@devuan>
References: <cover.1785532392.git.alx@kernel.org>
 <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
 <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
 <20260731215122.4p4aepsbgeoibx74@illithid>
 <89c9b877-54a8-6a7c-016d-51e4be210ad6@redhat.com>
 <am0fnb4BMRrTajqx@devuan>
 <0407bda3-c03a-93cb-9400-5fb8256a30f2@redhat.com>
 <20260731230847.prx4gay3ejvqdy6q@illithid>
 <8b8fc216-8c6e-fcc2-c72a-2c26555d95e7@redhat.com>
 <20260731235747.7bwyb2xul4zhryuu@illithid>
MIME-Version: 1.0
In-Reply-To: <20260731235747.7bwyb2xul4zhryuu@illithid>

Hi Branden,

> Date: 2026-07-31 18:57:47-0500
> From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
>
> Hi Joseph,
>=20
> At 2026-07-31T23:28:19+0000, Joseph Myers wrote:
> > And I consider it an abuse of position to change man-pages to declare
> > to users in general of C libraries on GNU/Linux that your standards
> > proposal, at a very early stage (not even an N-document), is the One
> > True Way of using the functions.
>=20
> I agree that there is a _potential_ moral hazard here.
>=20
> > It would be more neutral to say in the man pages that "as of July
> > 2026, one member of WG14 has proposed moving these functions to
> > <memory.h> [reference]; this proposal has not yet been considered by
> > WG14".  (I doubt the utility to users of describing proposed changes
> > in man-pages at such an early stage, especially since the information
> > would be long obsolete by the time those revisions of the pages make
> > it into distributions, but it would at least more accurately reflect
> > reality, and be vaguely neutral as long as you do it for *everyone's*
> > open proposals, *including those you personally disagree with*, rather
> > than privileging your own.)
>=20
> I endorse this perspective.  Another thing Alex could do is gate such
> readily-obsolescent stuff behind a *roff register so that it doesn't
> format (or, if one uses soelim(1), even populate the document sources),
> for _official releases_, but is still there for people pulling on Alex's
> Git repository.
>=20
> My interpretation of Alex's tactics is that he feels energetic about his
> proposal, is willing to think it through carefully and advocate for
> it--these are good things--and that he wants to get it in front of
> domain experts and anneal it by fire before formally putting it before
> WG14--_also_ a good thing!  In the meantime, he is the steward of a
> platform that _is_ topically implicated.
>=20
> Such a position _can_ be abused, but it also seems not quite fair to me
> to expect him to stifle his advocacy in a _relevant_ forum.
>=20
> Conventionally, what Alex faces is a potential conflict of interest.
> There are a variety of ways to cope with those.  Foremost is disclosure
> to others of the potential conflict.  That's such an important factor
> that I'd say it's 90% of the battle.  Most of the time when people
> resist disclosing potential CofIs it's because they're self-dealing,
> they know it, and realize that disclosure would be self-incriminating.

Indeed.  While I haven't explicitly mentioned CofI, I haven't hidden it
either, and have mentioned all the relevant information.  If I haven't
merged this single-handedly, it's precisely because I think there could
be some, and want to get feedback.


Cheers,
Alex

>=20
> There is another tier to the issue, and its recourse is recusal.  We
> most often see this in the context of arbitration or in the judiciary.
>=20
> However, Alex is not situated as a judge or gatekeeper here.  To WG14,
> and to C library maintainers, he is an advocate.  Has Alex rejected any
> proposed patches to the Linux man-pages along similar lines as his own
> advocacy?  That would be gatekeeping.
>=20
> Alex might consider deputizing a fellow maintainer to handle updates to
> portions of man pages where he has, or expects to have, business before
> WG14.
>=20
> Regards,
> Branden



--=20
<https://www.alejandro-colomar.es>

--zorhsguq6bpf334p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmptOJoACgkQ64mZXMKQ
wqnunA/+P9WXqtIgqGIIDP3MJ9cJnYOjYvrnwci6O0hL/QySbXMuaNrRaaPuFd6X
6DZKbuIWanwPzSYPFIa/zFA6Ndct+qG36H/vvh16PNPxwmjsJmWwfVMJXdIYH4o5
tXIlINLDIZvxXmML8ugqADIa5HWKQqm/Joe56Y28QVXZoyreQcxWW25GyvXPMnrB
OV5I7P7SMxa7rLG+lEAPAa3wngvRQ7bPxVQ7ox36C6cDkCNK9xFqCt5IL932nrQl
fXMUhpOp7p7rW4l5K0hiMKY77t2NXbHxDo/GsZqC6gq9iQpSrhBCLumfbAEpUP0u
AV+9JM7Q1q4/VIsEFKDJ1903znU78+njxf6NMzyQf0zBNK8NVi9dK634A5jFaAya
9NCf80oH5pRoXeCDrVK3d789RcrFaB0wAPUeFcSjRvbmllTx509oaWWM2PlgCU5U
OMItTd/coULo8yWb1gnW9ew3SC1dhg0A9r4kHZzQDUayPzSr1xBZ02WMM473rG5s
Gf4v8VtQSonlwLas3tKLr8VO0uDoMST9vsXRZQGH5r/R6J7bI1eCz3j6KRR5YC+f
502jRji+kY8l9vQeqX/OpDT9LKY3FPhjzQGe7WDU88veeEUTXcYzHRj7kUFS8Scb
iDAlJxF3QIsY65t7W11lwoUxUlwFnttVgR2lqWx5ZYSySgI/auI=
=i08C
-----END PGP SIGNATURE-----

--zorhsguq6bpf334p--
