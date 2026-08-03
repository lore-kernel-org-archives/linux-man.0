Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDD941D21D
	for <linux-man@vger.kernel.org>; Mon,  3 Aug 2026 16:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785773502; cv=none; b=mWUnpDNpxjHQht0FV/R5US9UxmMPOaTmxOToIP81BQ0w36T5l7UV4gd14Osfdx7L9dNHfr4Ji6CvEZ/EvJr8c6VKmEdHiTjd0jhG8hagIOInYnqsJqJYXgpNLGrYVkrcNyMRF9eH6eVuDr97SRXgwCOQEIxZBkDZnUBLgUB1xVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785773502; c=relaxed/simple;
	bh=EU+ymoHXWb0PYfUUT61PRiEnR91cfg4LrKpq181rg78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eaQtNPOOMzzv5G8YSauaAg/km8/6gzCVe7CA4xMj06Khpv3Kcn28+uANN9fIgkiKOdXwr+7x5TWCvSp+7ezDZojegedTBydcdiud3b2rNvOS3GIZFDQwWhzoZE5PBrxLRaYnlC69TtamxMXJtMmk/KPjw/7uxAnVEHOWprW07Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KT4ve/OG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KT4ve/OG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80C1E1F00A3D;
	Mon,  3 Aug 2026 16:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785773500;
	bh=xQJioy3dtbLpdwK6ytPeKVnO/mngw9KiiGifAMHe2+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KT4ve/OGkOVBKPeguOyrqG+Z+oturo1N63agX4C/NX2YykFD7QTeVqd3rJAJbvZy5
	 hAoJp7+vNYHeV6gcJN5VpTlKVaHM6rWDtApYNWVv+ACgx9KPK32zGfS5HVPInTPnbD
	 xyxdWVGdG1qxvhL0T54r0mhkfzJ1LVOzPewU8tKN2f9QNRIMW2ZOaYVAmHV/dWc2w8
	 +sot2vpRvAgYx4iaiZRf+jei+zBWF9NoP4gxPhltIiXZ+/4GNsrxcJ+YqKSObyd6l2
	 qaQfzeN3efzuquYhcpEg6oft56qPMllVsWQGhewRF8RT3lvLz8cvzR9dLg+/X/WZWe
	 cZV4Oz61D6ZNg==
Date: Mon, 3 Aug 2026 18:11:36 +0200
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Sam James <sam@gentoo.org>, Collin Funk <collin.funk1@gmail.com>, 
	Arsen =?utf-8?Q?Arsenovi=C4=87?= <arsen@aarsen.me>, "Maciej W. Rozycki" <macro@orcam.me.uk>, 
	Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org
Subject: Re: the Linux man-pages as an educational tool
Message-ID: <anC5yMEeLykff87f@devuan>
References: <20260802231058.o7gud4bd7co2nbhv@illithid>
 <875x1sp0h2.fsf@gmail.com>
 <am_TTjDLlAI68zkp@devuan>
 <am_VUE1SzxqRkTAo@devuan>
 <am_V3bvOiH9TaJQW@devuan>
 <20260803020908.efqt5ilkcjq4z3yz@illithid>
 <anCAeQ5YNwXwSTWA@devuan>
 <878q6n9u4v.fsf@gentoo.org>
 <anCmfRDpkhSErjkS@devuan>
 <20260803153456.taj7qvj7csiyh43r@illithid>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ccqc2s5reb435clo"
Content-Disposition: inline
In-Reply-To: <20260803153456.taj7qvj7csiyh43r@illithid>


--ccqc2s5reb435clo
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Sam James <sam@gentoo.org>, Collin Funk <collin.funk1@gmail.com>, 
	Arsen =?utf-8?Q?Arsenovi=C4=87?= <arsen@aarsen.me>, "Maciej W. Rozycki" <macro@orcam.me.uk>, 
	Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org
Subject: Re: the Linux man-pages as an educational tool
Message-ID: <anC5yMEeLykff87f@devuan>
References: <20260802231058.o7gud4bd7co2nbhv@illithid>
 <875x1sp0h2.fsf@gmail.com>
 <am_TTjDLlAI68zkp@devuan>
 <am_VUE1SzxqRkTAo@devuan>
 <am_V3bvOiH9TaJQW@devuan>
 <20260803020908.efqt5ilkcjq4z3yz@illithid>
 <anCAeQ5YNwXwSTWA@devuan>
 <878q6n9u4v.fsf@gentoo.org>
 <anCmfRDpkhSErjkS@devuan>
 <20260803153456.taj7qvj7csiyh43r@illithid>
MIME-Version: 1.0
In-Reply-To: <20260803153456.taj7qvj7csiyh43r@illithid>

Hi Branden, Sam,

> Date: 2026-08-03 10:34:56-0500
> From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
>
> At 2026-08-03T16:40:26+0200, Alejandro Colomar wrote:
> > > From: Sam James <sam@gentoo.org>
> > > Alejandro Colomar <alx@kernel.org> writes:
> > >=20
> > [...]
> > > > [Collin Funk] doesn't need to have read every word of the glibc
> > > > manual, but this precise text he could have read it, because it
> > > > was mentioned by Paul in this thread (different subthread) prior
> > > > (19:28 UTC) to his message, and reviewed by me also prior (20:31
> > > > UTC) to his message (23:27 UTC).
> > >=20
> > > I often reply as I go rather than reading all other emails around
> > > that time. I don't think you should assume he read those emails and
> > > deliberately neglected their contents.
> >=20
> > Me too.  But eventually I respond to those other emails, and rectify
> > when that new information conflicts with something I said with
> > incomplete information.  So far, Collin didn't rectify.
>=20
> But does he _need_ to?  It's easy to have imperfect knowledge.  We all
> swim in ignorance.
>=20
> I advise against personalizing this conflict.  And even if you feel
> insulted, there are hazards to injecting honor-based cultural patterns
> into technical forums.
>=20
> I'm deeply familiar with a region of my country that practices such
> patterns, and I was still very young when I got heartily sick of it.
>=20
> https://en.wikipedia.org/wiki/Culture_of_honor_(Southern_United_States)
>=20
> > > > Also relevant is the fact that he accused me of "slowly"
> > > > documenting "personal preferences".  His wording implies that it
> > > > wasn't there before.  Maybe I misunderstood, though.  I'd be happy
> > > > to rectify if I was wrong.
> > >=20
> > > I think he meant in general?
> >=20
> > I don't interpret that.  I guess he can defend himself and clarify.
>=20
> Again, does Collin _need_ to?  Would it meaningfully advance your
> objectives if he did?
>=20
> Some things can be permitted to drop.  You can always pick them up again
> later if someone tries to press your benign neglect to their advantage.

No, he doesn't need to.  I was and still am willing to let him drop it
without any resentment, just as I've always done (or so I think, and try
to).  Love everyone, no matter what.

But Sam should probably have dropped it too; that's what I intended to
mean in my response to Sam.

So, please everyone drop it and calm down.  I'm willing to.

> > I only see my style slightly different than Michael's, but not
> > necessarily in the sense of involving a more opinionated approach.
> > See the other messages where I've shown how Michael had done the exact
> > same thing with strlcpy(3) a long time ago.
> >=20
> > On reconsideration, and after researching what Michael really did, I
> > think I was wrong saying we have a different style at all.  I believe
> > we've had the same style.  We just had different topics of expertise.
> >=20
> > Michael has had his own share of opinionated comments in manual pages.
>=20
> You might be completely right about all of this.  Maybe people have
> beatified Michael in the rosy glow of hindsight, and overlooked his less
> temperate statements.  (Some day, they might do the same of you.  ;-) )
>=20
> But I don't see how concern with this matter materially advances the
> objectives of getting good advice to frustrated or curious programmers
> into the Linux man-pages, and of making the C Standard Library more
> comprehensible and less painful to use.
>=20
> A suggestion I've been meaning to make but have struggled to find a good
> place to inject is the following:
>=20
> You've spoken multiple times of about 5 years of your work hammering as
> hard as you could on the various memory buffer/string interfaces of
> libc, and how much of the benefit of that work went into the
> shadow-utils project.  And I believe you because I've caught fugitive
> glimpses of that work over most of that period.
>=20
> So I recommend, hypocritically, that you engage in a practice that I
> struggle with:
>=20
> Promote your work.
>=20
> What I have in mind is an article, say of the length that a guest
> columnist might write for LWN, working your way though a selection of
> the most frustrating or fascinating issues you encountered.  To a first
> approximation, every C programmer believes they know how to use these
> functions, because hey, how hard could they be?  Illustrate the hazards.
> Show how the na=C3=AFve assumptions fail.  Point to how you solved them in
> shadow-utils (or elsewhere).  Then, as your grand conclusion, show how
> your proposed reforms to the C standard logically follow.

I've been wanting to do that for a long time.  I just need to do more
work for that to be perfect, though.  One thing I don't like about
articles is that they're immutable, and thus aren't a good teaching
material; mistakes will happen that will make the resource problematic.

A benefit of manual pages is that they're a living document that
improves with time.  Once the pages become close to perfect, it could
make sense to write an article that could stand the pass of decades.

If I write such an article, I want it to be valid 50 years from now;
and not only valid, but the canonical resource for the topic.

> Circulate that piece, either to a few reviewers whose judgment you
> trust, or on the linux-man list, possibly marked "[off-topic]" or
> "[meta]".  Engage your reviewers and let them improve it, as Paul Eggert
> did by pointing out the multiple evaluations of one of your macro
> arguments.  (Even if it didn't matter in that case, it's not a great
> pattern.)

Indeed; I regard Paul as an expert in this topic.  We might slightly
disagree, but I acknowledge he's mostly right.

> Does this require more work of you before going to WG14?  Yes.  But at
> the end of it you'll have an artifact you can point to.  It can be your
> personal FAQ for this subject.  You can mine it for future N papers.

I don't think such an article should be the first step.  It should
probably be the last: once the documentation and the system provide the
tools, the article should summarize that, and be a tutorial for it.

I don't see that article happening before 2030 (possibly much later).

> You're doing a lot of work arguing with people on these mailing lists,
> too.  So think of it in terms of opportunity cost.  With a "Hard Lessons
> Learned from string.h" paper, you have an artifact you can point to--
> one that is almost certainly going to get read by more people than will
> follow hyperlinks to mailing list disputes.
>=20
> And like an N document, an article can be revised over time, whereas
> with mailing list posts, your errors are burned into the ground to
> embarrass a person for all eternity.

I've made enough errors and have been embarrased for many times, that
I don't fear that.  :)

Also, I think it's easier to rectify mistakes in mailing list
discussions, than to rectify an article that thousands of people have
read.

> ...except for the fact that correct and incorrect claims alike are much
> more often utterly forgotten.


Have a lovely day!  :-)
Alex

--=20
<https://www.alejandro-colomar.es>

--ccqc2s5reb435clo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpwvbIACgkQ64mZXMKQ
wql/Pg//eokXlPn711OsVA1xB3b1iXSc3l+AayO1zG2TAOVmDeHlNpfirJdqhMzx
PH2PLt8LaJqecOZbEHBUiXb00z0Wl3KzAyfEzqc3gU5VVehqPgCBawMSj41j9Psd
oxefP9J/q3+eL5QUPAebKfT1dn/8a7+YZEkpK4TguN3j3D10gXsn0kBJq+QTpxs2
LkRRxve09FHnBtt4y9SJWdGlAY8fa96g8WYT5upR1kuWYrhZ0r6wtrwXE7Z3Ik9Y
bCLk+0UjtMzRM5rMKldEnlHor1sGJHwuNRl7iPs2CSSix3YWNuEFKlye0QsXDi7Y
wbk90JIMp6oj74O6dGqUh2AzPnkl54yYy/dGK3l1j18YPWiHT6+wikEEEqmvL9+L
6xxJHQ6DylNBQi3ZbgayhkEKn7qeDmiAHHnkDjpcQwERTkSlBymtM6h3pWR29qzL
D0Ps3jW9CxQXcYFRWiyirr2irxDB7S2J55a4dZRghcTvPYf7hXOeXu1fbpezOMqi
GWmDmuwBcUj/36ybWGClgUhWEkKmzBQc8FFcNnCB8g+osAdblK8KdAaDMNRogyj2
9g8mw7xATvBmGSr7E3TxdRpMlqdKB1ajLzQyGd3ohN+NV1DIk0m4+AqEfRkrIK4c
7BU+uPDp1OYs0Tl5x4IVGjq2piiMScPzcYawRAfDGhGrNA7CdsU=
=8R2F
-----END PGP SIGNATURE-----

--ccqc2s5reb435clo--
