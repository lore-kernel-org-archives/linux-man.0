Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF80C23909F
	for <linux-man@vger.kernel.org>; Sat,  1 Aug 2026 22:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785622959; cv=none; b=Xwzi9vBIDa/4+P+vxs1/TWDyc3BnXmlfc8oZT6hPn3eXWEFaJLrhM/Pxk+5iEambkbo/tmk+6y8G0Qta7NnaVSWiljumN6lzE5GI1Gk7zNVsXADii58X0jnoC/X7VzAxvJRWg00sT86AZ/FLErxIJz/rLkHJt5/nHjx9k5+X194=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785622959; c=relaxed/simple;
	bh=PEFfvPNZ0+/1h8+9vZFmYbyzlMzYkMs1E2V/nEm3peQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AUYtJhcUzsUjJZJljw5yRu96oin318tqExeu08LEgTYix8oKjrtOvNq54+qTuFWfUVRzQzFKvfhQcUSZHxdo/Uw8HR6/93FE3TSpw2RKZ8jV4jnjgv/zbhmOpJuvMMU4rsX/otqD8U3k3rmdV5/9CG4qZI+i9qvqItrmV2Wp+rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ne6LnKPO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ne6LnKPO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B3A51F00AC4;
	Sat,  1 Aug 2026 22:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785622957;
	bh=kOFPCLXleVs9Mghlis0tMbScl2ZTOH9c241Be1+P7RU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ne6LnKPO1ZZhbf8JYGe6zody6HpPRjexY95Zk73u6Keoc3UmaorNtrspVYBYj2YXL
	 XIzr7Yvsm4kvRnlkcNo2f3paGSu4JLdnYLRvMeJtULXs9x5N4WVA5+Z+s/K9hC3bwv
	 TAloMEJ137HZa767ZxWOChjLf0jWtcp2NRwT93hn8xK54SeuZEa3JX86yxdy19pgoh
	 VLrZUjDJdshYs2g/bJqoQ0dXIkgeHhDXgIJiFEGMBMOBorti1gAsIm6r7cQTr3WDAe
	 Hx9tVLEWMrFpLX4Et4ZPBIAM74fsuTaHs5iqWHvZgRGpcE6JNqR0hbuMBbHQ0U1uBX
	 oliPYVfRbSTOg==
Date: Sun, 2 Aug 2026 00:22:32 +0200
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Sam James <sam@gentoo.org>, Joseph Myers <josmyers@redhat.com>, 
	linux-man@vger.kernel.org, Keith Bostic <keith@bostic.com>, 
	Mark Harris <mark.hsj@gmail.com>, Nevin Liber <nevin@cplusplusguy.com>, 
	JeanHeyd Meneide <phdofthehouse@gmail.com>, Christopher Bazley <chris.bazley.wg14@gmail.com>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Iker Pedrosa <ipedrosa@redhat.com>, 
	"Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org, Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Subject: Re: on the irresponsibility of pursuing C language reform
Message-ID: <am5oWn8dYoP0r2dw@devuan>
References: <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
 <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
 <20260731215122.4p4aepsbgeoibx74@illithid>
 <87a4r6es6k.fsf@gentoo.org>
 <am3XeGZyi1Pvr77-@devuan>
 <87y0epdhxp.fsf@gentoo.org>
 <am4GT1OkqNZD9FF9@devuan>
 <87zez5bz49.fsf@gentoo.org>
 <am4jxBOh_VRvhCQw@devuan>
 <20260801213421.7e3wvyjwmlwxzd55@illithid>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nzabj2kmc56i7mc6"
Content-Disposition: inline
In-Reply-To: <20260801213421.7e3wvyjwmlwxzd55@illithid>


--nzabj2kmc56i7mc6
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
	libc-alpha@sourceware.org, Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Subject: Re: on the irresponsibility of pursuing C language reform
Message-ID: <am5oWn8dYoP0r2dw@devuan>
References: <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
 <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
 <20260731215122.4p4aepsbgeoibx74@illithid>
 <87a4r6es6k.fsf@gentoo.org>
 <am3XeGZyi1Pvr77-@devuan>
 <87y0epdhxp.fsf@gentoo.org>
 <am4GT1OkqNZD9FF9@devuan>
 <87zez5bz49.fsf@gentoo.org>
 <am4jxBOh_VRvhCQw@devuan>
 <20260801213421.7e3wvyjwmlwxzd55@illithid>
MIME-Version: 1.0
In-Reply-To: <20260801213421.7e3wvyjwmlwxzd55@illithid>

Hi Branden,

> Date: 2026-08-01 16:34:21-0500
> From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
>
> Hi Alex,
>=20
> At 2026-08-01T19:09:36+0200, Alejandro Colomar wrote:
> > Well, Keith Bostic wouldn't have suggested that I do this change, and
> > Branden wouldn't be defending that it might make sense to make this
> > change.
>=20
> I'm flattered to be mentioned in the same breath as Keith Bostic!

:)

> > A vocal majority is not consensus.  Consensus would be if there were
> > no significantly different or strongly opposed opinions to those of
> > the majority.  Even my strong and sustained opposition against your
> > opinion already means there's no consensus against.
>=20
> "Consensus" is a word that gets abused a lot, because it has multiple
> definitions.  To some people it means "unanimity".  To others, it means
> a majority vote with potentially many abstentions but no (or
> proportionally very few) negative votes.

Indeed.

> From reading WG14 minutes, I'm
> vaguely aware that it has a rubric for reading the straw polls they take
> when voting on N-papers and related motions.[1]  I invite a member to
> cite a resource laying out their actual procedures.

WG14, like WG21, has a problem.  Consensus, these days, is taken as
roughly a majority of votes.

With very few exceptions, here's the rule that guides consensus in straw
polls during committee meetings:

		// Consensus requires both
		//	y/(y+n)   >=3D 2/3
		//	n/(y+n+a) <=3D 1/4

Strong opposition is dismissed as long as the numbers are okay.  We even
have a small program that performs that calculation and which we
consult.

As a consequence, this is what happens (very interesting read):
<https://isocpp.org/files/papers/P4238R0.pdf>.

A large number of NBs (national bodies), including mine, are going to
vote against C++26, and as a consequence, it may be returned to WG21 for
evaluation.  This means we won't have C++26 if this happens.

> I don't think I'm voicing a controversial view when I venture that
> Michael Kerrisk administered the Linux man-pages with a more settled
> view of the APIs it documents.  By that, I mean that he tended to update
> its content with a retrospective view of matters that were no longer in
> contention.  If some controversy brewed, he tended to omit it from
> "coverage" in the documentary corpus until the contention resolved.

Yup.

> Your approach is a little different: you're more ready to give the
> reader a view of live controversies and unsettled matters troubling the
> C community where these intersect with the topics man-pages(7) covers.

Yup.

> Neither approach is better.  They're just different.

Yup.

> I think Sam is
> right that people had many years to get used to Michael's approach.
> From there it's a short--but logically unsound--step to associate
> "familiar" with "better".

Yup.

> But, if you're going to document unresolved controversies, how do you
> avoid putting a thumb on the scale?

Doing a lot of research.  Whatever I don't research myself, I still act
like Michael, and tend to not step into.  But string and memory handling
is something that has taken most of my time in the last 5 years or so.

> One way is to solicit review of that coverage for even-handedness--I
> do not say "neutrality".  List pros and cons of competing interfaces or
> code idioms.

I do indeed get that.  Mark gave me feedback about memccpy(3) recently,
which I've incorporated to my research.  That was the last issue I had
with <string.h>, because memccpy(3) is something I've never seen in real
correct use.  It seems Illumos is one of the places where they store
that old knowledge.  It's good that those projects still exist and can
be used to learn about our history.

Sam was concerned about not docuementing what standards say; and indeed,
I'll make sure to document that (in STANDARDS, where it belongs; which
I had already done, BTW).  Other than that, he was worried that I might
be encoding an opinion, but I believe this is a technical judgement
based on research, and not an opinion.  So, dismissed.

Joseph was concerned that this documentation would conflict with many
documents saying that <memory.h> is deprecated.  Luckily, I've never
seen such a document, so we can assume they don't exist (unless people
show evidence).  I'll dismiss his negative vote, since his technical
reasons are incorrect.  Also, <memory.h> is undoubtedly more portable=20
than a new <stdmem.h>.

It's also a bit Ironic that Joseph started with a strongly opinionated
proposal: deprecating <memory.h> in glibc (breaking 8.9k uses in
Debian).

Collin didn't comment, although by his support to Joseph's suggestion
of deprecating <memory.h>, I guess he's against.  Since he didn't
provide any new reasons, I guess it's more of Joseph's.  Already
dismissed, then.

Nevin has an undeclared conflict of interest:  He is the author of a
proposal for WG14 to remove strncpy(3).
<https://www.open-std.org/jtc1/sc22/wg14/www/docs/n3935.htm>
Also, he didn't really give any technical reasons; he just voted no.
A vote without reasons is still heard, but easily dismissed.

Keith suggested doing this, by which I assume he's in favour.  He's
certainly an expert in the topic, and I'd value his support.

I value Doug's opinion too, although he didn't show much technical
reasons this time.  He was mostly concerned about changing string
functions, but didn't clarify whether he was concerned about restoring
<memory.h>.  Thus, I'd say I won't count that.

You seem to support the fact that something should be done, except that
you may not entirely agree with the approach.  You've been a bit
misguided by Joseph's concerns about <memory.h>, so I'll dismiss that
part of your feedback as being just Joseph's --which I've already
dismissed on technical grounds--.

Chris is concerned about my arbitrary separation, but I think his
separation is also somewhat arbitrary.  I'll trust my instinct here.
We're always in time to revise this.  In any case, this arbitrary
distinction is better than the status quo.

Thus, with support from Keith, and no sustained opposition based on
technical ground (Joseph didn't contest my response that absolutely no
mainstream documents talk about <memory.h> being deprecated, and himself
said that it's only *implicitly* deprecated), I should commit.

>  If you do that job correctly, _reasonable_ partisans of
> the various contesting positions will find no cause to criticize.
> (There will sometimes be fanboys who object to the "opposition" getting
> any coverage at all.)
>=20
> Further, with such lists you do a service to the engineer who must
> select a means of solving the problem confronting them.  The engineer
> often knows that problem better than anyone else does.
>=20
> Next comes a trickier bit: what if you yourself get involved, even while
> "wearing a different hat", in one of these live controversies?
>=20
> Your first line of defense is your own ethical conscience.
>=20
> Another, as I suggested earlier, is to solicit one or more volunteers to
> serve as "deputy maintainers".  Prepare a list of man pages or sections
> thereof upon which you are "conflicted out", and ask the deputies to
> field all Linux man-pages business regarding those pages/sections while
> you have business regarding those interfaces before a vendor libc and/or
> the WG14 committee.  It will likely be obvious to you what vehicle can
> communicate these areas of deputy maintenance--a man page!
>=20
> I intuit that Michael had a hard time finding anyone to take the mantle
> of Linux man-pages maintainership.  It's a huge job and demanded someone
> of your unusual resources and energy.  By opening deputy positions that
> are limited both in scope and in time, nobody need worry that they'll be
> expected to eat the whole elephant.  If you find such volunteers, then
> you'll also be spreading expertise and socializing personal investment
> in the success of this project.  That's good management!

I have a mental list of people to whom I consult when I don't think
I should make the decision alone.  The list isn't fixed, and varies
wildly depending on the topics, but you can get an idea when I CC people
in discussions.  You've been yourself quite some times.  :)

> Finally, to return to the question of consensus: a potential point of
> development in Linux man-pages project governance is to _document how
> you measure consensus_.

Nope.  I'll quote <https://isocpp.org/files/papers/P4238R0.pdf>:

	2. How Consensus Is Supposed to Work
	WG21 decides by consensus, not by vote.  The chair, a
	subject-matter expert, weighs the arguments of every side.
	Where they can be reconciled, the chair reconciles them.  Where
	they cannot be reconciled, the chair decides, and may decide
	against the numerical majority.  This is deliberate: WG21's own
	guidance states that "the chair's determination of consensus is
	authoritative, not the straw poll" and that "we make decisions
	by consensus, not majority" (P2195R2), and ISO defines consensus
	as a process that takes all views into account and reconciles
	conflicting arguments, not a count of hands (ISO/IEC Directives
	Part 1, clause 2.5.6).  The chair's authority is broad by
	design, and rightly so; a committee that decided technical
	questions by votes rather than expert judgment would be worse.

That is, I use my judgement as an expert.  That's all we can document.

> We'd be unwise to determine consensus by measuring who writes the most
> words (hi, folks), or with the angriest tone, or who has the most
> impressive job title at the biggest company, or who can shut down a
> discussion most coldly or derail it most effectively.
>=20
> So tell the members of this community how _you_ measure it.  Put the
> burden on the critical and the concerned to find flaws in your method.

At least, I've documented how and why I've valued the feedback from each
one this (so-contentious) time.

If anyone wants to appeal, I'll be open to changing my mind based on new
technical reasons.


Cheers,
Alex

> Regards,
> Branden
>=20
> [1]  I'm not sure WG14 uses the term "motions", and I haven't seen much
>      evidence that they use Robert's Rules of Order, with which
>      Commonwealth people are likely not familiar, let alone
>      non-Anglophones.



--=20
<https://www.alejandro-colomar.es>

--nzabj2kmc56i7mc6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpucaIACgkQ64mZXMKQ
wql3Jw//djeuNCCZZoyTpNCqau/25mKh+ZEKVuHEycRA7PUddYI2MOqasAT/3vGM
Q8lPF5YhgMBaCTdglg67UFI9ks+EomVE6xOJfkydhw38DrJasyxz0jtKquXnhTsc
slR1UKCEu1iJCgsf2OM6q3OkEUFetg44UnL0KoEi4AzmGsuyLWTJBjIW5GixFWNy
ru7zIcj/sR/4vSZ+2fJoTLU/kK3NBaZUTeHzkP0uA13yH/siylTDSGVTg+2LZPAe
UN7mEh4LtbT8/1iP91opqOYBOj3PrAoRDA2MIzY3yr7s+wYHJ3hLBrqpJ2HF53lY
J2xEOzPZ+zIOEPefJPqgY1Gv0BCvwB8TeAtcDijXmULNNwRUnLx2/RBTkWya0Zat
boXMBsZ+n1mg+nqthlpGEaifiRXzfv6oRFx90WqjlOf+G2yUZcHKWljgYf2yM18X
FL3y6y2ddozBfAPD9PbKZqxARNfDZtZ5Or6/27T76fAMawRzE3SuZI6kY8oyDWSq
OfHkZypqt481gDJ9Yh0VHo6UT/OkBUVp8R4DNqUexE0R3+neP2C8VN61Kw3ww5Kz
QDiqBepwAMlfhEYvWuBJh70oYXr3j8TZsBPpPacWuLYrPybZw9u+wcgBhM73lrZW
SMlHArfX5tM4wuU2kC23MNmqIoLghkKOT+5VYXwW+Qz8nuYlEy4=
=i1PS
-----END PGP SIGNATURE-----

--nzabj2kmc56i7mc6--
