Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1523AE187
	for <linux-man@vger.kernel.org>; Sun, 23 Aug 2026 19:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787513459; cv=none; b=JuFLVSdHm8mFLSvJ78o9ZiE21sw96w4MMAo3Y6D7WnfOipo9PJccoj1ElGAo00JSp6o6O908bkvOlE5cfpZOmvowNOFTm4OouQBnBJFetW0qOUTBgC3cBlN4Ueme8h7PKndOG9v5WvPUx7XGUvDrWjhgQS0+5nHKQtUUg6tOMZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787513459; c=relaxed/simple;
	bh=6IFrjmU4OdtTEVKTjjfcvrDebyvfa8vL7z9cZA7WqcI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O+9kc5QhyB9ZFg7CMBTou/R4vrPff2jhj0vdmPI2rZ/tem68yBMPznmJg7lB6YK1Dd2gK9sxLKRRaJ8aR+AyhAybLeM7O/FqhDabQNb4321OKwEUrAJ48LrZhaJh/Yhqbj1gm0nvfpUnjg6+41adPGKM7BkIud4bm1q5BpJecg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=niMGFv7m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="niMGFv7m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 619041F000E9;
	Sun, 23 Aug 2026 19:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787513456;
	bh=BXO8OSggQIvbDJ0nMc3qtGB3snjwWZrXi0OqLl99Sy0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=niMGFv7mjl50/jVVE9tlSQKqRt+ezddpMu1M8LrX9n3x+02XouUck/fop+yAvMlce
	 wO4tE5ByyC3iIEaW4PeeQRtqXYYtgNVoxH0K1W2Ngr4z2kDdivGOiVQZW5O3Vnrw9b
	 KcTb9Lp0EPtTDfm/9a08eP8uw/WuGwmsWFlLPETDiUp97W5XZlFs1VpkA4iklqh6oo
	 MtPixNliggSMkYBe8FGHgi1AcWwl0IdBqee7u+CaGcwB6Ibro2azbLs77W6XxC0Z4j
	 S98TtbipKz0eeWTxtjbn+8FQuqwFMTSwx5bbGGXdZmQeJPX7y1cM1/F/RQN6YT54wb
	 Zv/gmuP66xQ0Q==
Date: Sun, 23 Aug 2026 21:30:53 +0200
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: linux-man@vger.kernel.org, groff@gnu.org
Subject: Re: Using LS/LE (was: [PATCH v4 2/4] man/man5/tunables.conf:
 Document system-wide tunables config)
Message-ID: <aotFzewQhmLJSk6N@devuan>
References: <anTugcvjragzGpSK@devuan>
 <xn33wr3rr8.fsf@greed.delorie.com>
 <20260807021256.pwzsls7awqmbslti@illithid>
 <aorlBv8YTu4JlZcy@devuan>
 <20260823132749.pgypzsqv32n67wor@illithid>
 <aor4LIdGrSGHe3TB@devuan>
 <20260823141622.7vszwghxrxvkff4j@illithid>
 <aosHFaauEzKEFNpl@devuan>
 <20260823164451.5jeolmdu44ubpeba@illithid>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hmga2e3sbbxvsyal"
Content-Disposition: inline
In-Reply-To: <20260823164451.5jeolmdu44ubpeba@illithid>


--hmga2e3sbbxvsyal
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: linux-man@vger.kernel.org, groff@gnu.org
Subject: Re: Using LS/LE (was: [PATCH v4 2/4] man/man5/tunables.conf:
 Document system-wide tunables config)
Message-ID: <aotFzewQhmLJSk6N@devuan>
References: <anTugcvjragzGpSK@devuan>
 <xn33wr3rr8.fsf@greed.delorie.com>
 <20260807021256.pwzsls7awqmbslti@illithid>
 <aorlBv8YTu4JlZcy@devuan>
 <20260823132749.pgypzsqv32n67wor@illithid>
 <aor4LIdGrSGHe3TB@devuan>
 <20260823141622.7vszwghxrxvkff4j@illithid>
 <aosHFaauEzKEFNpl@devuan>
 <20260823164451.5jeolmdu44ubpeba@illithid>
MIME-Version: 1.0
In-Reply-To: <20260823164451.5jeolmdu44ubpeba@illithid>

Hi Branden,

> Date: 2026-08-23 11:44:51-0500
> From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
>
> [looping in groff list because Alex brought to my attention an item of
> work on the new man(7) `LS` and `LE` macros that needs to be done]
>=20
> Hi Alex,
>=20
> At 2026-08-23T17:06:16+0200, Alejandro Colomar wrote:
> > > Date: 2026-08-23 09:16:22-0500
> > > From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
> > > At 2026-08-23T15:55:29+0200, Alejandro Colomar wrote:
> > > > > From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
> > > > > > Do you know what's wrong?
> > > > > More or less. It turns out to be damned hard to balance the
> > > > > requirements of (1) Automake maintainer mode; (2) building from
> > > > > Git repository checkouts; and (3) building from distribution
> > > > > archives.  Bruno Haible has been helpful in finding scenarios
> > > > > that don't work.
> > > > >=20
> > > > > https://lists.gnu.org/archive/html/groff/2026-08/msg00039.html
> > > >=20
> > > > Hmmmm, now it rings a bell.  bootstrap said something about
> > > > configure with maintainer mode, but I ignored that, since I had
> > > > never used maintainer mode.
> > >=20
> > > Right.  I introduced that very recently during the RCs for 1.25.0,
> > > because it seemed necessary.  But as shown, Bruno has proposed
> > > patches ripping it back out.
> > >=20
> > > I'm pretty frustrated with Automake's lack of explicit support for
> > > building from Git working copies.  Or maybe it's brilliantly
> > > documented somewhere I haven't seen yet...
> >=20
> > I dislike autotools for that and other reasons.
>=20
> Autoconf, Automake, and Libtool, the collective "autotools", are all
> strongly distinguishable in purpose.

I guess if you deal with them enough, you get to distinguish them.
In shadow-utils, where we have an autotools-based build system, I
consistently avoid to learn it.  I leave it up to the other maintainers
and the distro maintainers to keep it working.  I only report the issues
to them.  To me, it'd be easier to wipe it all and write a Makefile from
scratch than learning the tools.  The day I have to maintain that, I'll
probably do so.  But distro maintainers don't want that, and so they
keep helping maintain it.

> Autoconf is a brilliant idea, very
> well executed.  I suspect that many of its its detractors possess a
> constellation of negative traits:
>=20
> 1.  They're not terribly competent at writing portable shell scripts;

I believe I'm quite competent writing shell scripts.  :)

> 2.  they refuse to understand the very simple principle of operation
>     of the m4 macro language; and

I have the 2nd negative trait, though.

> 3.  they refuse to believe that the variety of possible deployment
>     environments is as wide as it is.

I acknowledge this.  However, some people refuse to believe that
hand-crafted makefiles can also handle quite different environments too.
I believe makefiles can do that just fine.  It's a matter of how much
makefile code you write.

In the Linux man-pages project, we have 120 kB of makefiles.

	$ find share/mk/ -type f | xargs wc -c GNUmakefile | tail -n1
	119125 total

I believe that a set of makefiles that would handle all of the targets
of a project like groff wouldn't take much more than that.  It might be
a few hundred kB.  If it's well organized, it can be maintainable.

Because the makefile language is so simple, bugs are easy to spot and
fix, compared to autotools (possibly automake, but I can't distinguish
them enough).

[...]
>=20
> I've encountered CMake.  It burned me far worse than the Autotools ever
> have.  In my view, rather than being a toolkit with which you can manage
> your project's build system to your own specifications--meaning that you
> can _understand_ it--it's a gigantic, baroque DWIM engine that permits a
> software project to outsource their build system engineering to CMake's
> maintainers.

Oh, yeah, I agree with everyone here.  CMake is way worse than
autotools.  autotools is the least evil of the non-pure-makefile build
systems.

> As always with outsourcing, that'll work great--and managers will love
> it--until it doesn't.
>=20
> And when it doesn't, people will stumble around, blinking and wondering
> where to find the expertise they'll need.
>=20
> > For groff(1), writing a portable hand-written Makefile might be too
> > hard to write.
>=20
> I saw what we had before.  Bertrand Garrigues did us an unquestionable
> service in porting groff to Automake back in 2013/4.
>=20
> > But for the man-pages, I love the hand-written Makefile we have.
>=20
> I, too, love sticking with pure make(1) anywhere I can.  POSIX Issue 8
> make(1) really allows the tool to shine.
>=20
> I nurse a glimmer of hope that the *BSD Make people can be pressured/
> bribed/shamed into supporting pattern rules at long last, and then we'll
> finally get as close to world peace as is possible.
>=20
> https://cgit.git.savannah.gnu.org/cgit/groff.git/tree/doc/doc.am?h=3D1.24=
=2E1#n310
>=20
> That's an exhibit of an extremely stupid, and extremely old, problem
> that I defy any BSD partisan to defend.
>=20
> > I'm still waiting for GNU Make to make a new release, and then be able
> > to get rid of the mandatory -R, but other than that, it works quite
> > nicely.
>=20
> Hmm, no release since 4.4 on Halloween 2022.  Yeah, they might be due.

Yup, I've been pinging Paul a few times in the last years.  But I gave
up last year.

> > Yup; I don't like using tarballs.  It's much easier to just check out
> > git HEAD.  :)
>=20
> Yes, but the tarballs get tested in a greater diversity of environments.
> While I keep git HEAD "green"--I don't "git push" unless "make
> distcheck" runs successfully--that applies only to my personal
> development environment.  groff doesn't have a CI infrastructure.
>=20
> The build system is the thing that consistently gives us the most pain
> when trying to firm up a release.  So right now you are pulling on HEAD
> at its most fragile, ironically.  The code quality should be good, _if_
> you can get the build to completion.

I'm happy to uncover those bugs; it's not a problem.

[...]
> > 	diff --git i/man/man5/tunables.conf.5 w/man/man5/tunables.conf.5
> > 	index 91bb6b81cb85..835c409eb074 100644
> > 	--- i/man/man5/tunables.conf.5
> > 	+++ w/man/man5/tunables.conf.5
> > 	@@ -89,9 +89,10 @@ .SS Filters
> > 	 Filters limit the tunables following it.
> > 	 The effects of a filter are terminated by
> > 	 any of the following:
> > 	+.P
> > 	+.LS itemized 1
> > 	 .IP \[bu] 3
> > 	 The end of the file.
> > 	-.PD 0
> > 	 .IP \[bu]
> > 	 The end of an included file.
> > 	 .IP \[bu]
> > 	@@ -100,7 +101,7 @@ .SS Filters
> > 	 directive.
> > 	 .IP \[bu]
> > 	 A new (possibly empty) filter.
> > 	-.PD
> > 	+.LE
> > 	 .P
> > 	 The syntax is:
> > 	 .P
> >=20
> > I had to add that P paragraph so that there's a blank before the list.
> > That's a bit unusual, since that would technically be an empty
> > paragraph; or maybe we can consider that paragraph to be the entire
> > list, but that's unusual in man(7).  That said, I'm fine with that.
> >=20
> > What do you think?
>=20
> I agree that it looks a little funny; if one imagines the `LS` call as
> not being there at all, it looks truly redundant, and "mandoc -T lint"
> will likely complain about it.
>=20
> However, you have to remember that *roff documents are not truly
> block-structured.  mandoc(1) really badly wants them to be, so it
> pretends that they are, and that sometimes leads it to jump through
> hoops...or to arguments between groff and mandoc maintainers.  ;-)
>=20
> In *roffs, paragraphing macros mean "break for paragraph here", not
> "paragraph opens here".

True.

> So, in the foregoing, given that you _want_ inter-paragraph spacing
> before you start the compact list, the "isolated" `P` makes perfect
> sense.  I think it would be unwise to force a compact list to not be
> compact prior to its first item, because doing that would foreclose the
> following sort of layout.

Agree.

> (But I see a complementary problem.)
>=20
> $ cat ATTIC/inline-compact-list.man
> .TH foo 1 2026-08-23 "groff test suite"
> .SH Name
> foo \- frobnicate a bar
> .SH Description
> This is my man page.
> There are many like it,
> but this one is mine.
> People should read more about
> .LS itemized 1 4n
> .IP \[bu]
> bash
> .IP \[bu]
> m4
> .IP \[bu]
> make
> .P
> .LE

Why not this?:

	.LE
	.P

> and learn what these tools can do for them.
>=20
> $ nroff -rLL=3D72n -man ATTIC/inline-compact-list.man
> foo(1)                   General Commands Manual                  foo(1)
>=20
> Name
>      foo - frobnicate a bar
>=20
> Description
>      This is my man page.  There are many like it, but this one is mine.
>      People should read more about
>      =E2=80=A2   bash
>      =E2=80=A2   m4
>      =E2=80=A2   make
>=20
>      and learn what these tools can do for them.
>=20
> groff test suite               2026=E2=80=9008=E2=80=9023                =
         foo(1)
>=20
> So there is a post-compact list space challenge.  You don't want an
> "empty" `IP` call prior to the `LE`--that will cause unwanted
> indentation of "and learn...".

You might use compactness keywords:

	.LS itemized precompact

You could have 'precompact', 'postcompact', 'compact', and 'noncompact'
(feel free to use names that aren't so terrible).

> Maybe `LE` needs to accept an argument applying post-list space (and
> suppress it if the argument absent).
>=20
> And maybe `LS` needs to accept another argument applying pre-list space
> (and suppress it if the argument is absent).
>=20
> I'll dig into this.  I might switch those defaults around; the objective
> is to have `LS` and `LE` slot into existing man(7) documents as
> unobtrusively as possible.  As the "NEWS" file says:
>=20
>    Because these macros format no text, documents employing them risk no
>    damage to their content if the formatter does not support them.  A
>    man(7) document author can choose either to transition to these
>    macros, to manage list "compactness" and item indentation with
>    existing man(7) package facilities, or to employ both approaches.
>=20
> Another governing principle is "man(7) document authors should not have
> to use *roff requests".[3]
>=20
> groff_man_style(7):
>=20
>    Portability
> ...
>      In roff systems, elemental functions called requests and escape
>      sequences control formatting operations.  A request appears on a
>      control line.  An escape sequence starts with a backslash (\) and
>      can appear almost anywhere.  However, use of roff requests (apart
>      from the empty request =E2=80=9C.=E2=80=9D) risks poor rendering whe=
n a page is
>      processed by non=E2=80=90roff formatters that attempt to interpret p=
age
>      sources.  (Historically, this was commonly attempted for HTML
>      conversion.)  Many of these programs don=E2=80=99t interpret the ful=
l roff
>      language (let alone extensions): they may be incapable of handling
>      numeric expressions, control structures, or register, string, and
>      macro definitions, causing a document=E2=80=99s contents to be omitt=
ed or
>      presented incomprehensibly.  If your document uses formatter
>      requests, or escape sequences not shown below, it accepts
>      responsibility for restoring formatter state to what the man macro
>      package expects.
>=20
> So I'll see what I can figure out with those lodestars in sight.
>=20
> An idea involving only compact lists and `sp` and `ns` requests is
> forming already.  I think I might profitably use them in the `LS` and
> `LE` macro definitions, respectively.
>=20
> The foregoing example will likely spawn an automated test.
>=20
> Thanks for putting groff pre-1.25 to the test!

:-)


Have a lovely night!
Alex

>=20
> Regards,
> Branden
>=20
> [1] https://www.irif.fr/~treinen/publi/slides/minidebconf18.pdf
> [2] https://archive.org/details/bitsavers_attunix7thersManualSeventhEditi=
onVol21983_34117955
>=20
> [3] There are exceptional circumstances, like overcoming problems that
>     AT&T troff and man(7) lacked mechanisms for solving, or providing
>     "fallbacks" for pic(1) or eqn(1) input.  And I use `br` and `ne`
>     requests in groff's man pages for "stranded line management", a
>     problem that affects only paginated documents--that's a problem
>     mandoc(1) is explicitly designed not to ever deal with.



--=20
<https://www.alejandro-colomar.es>

--hmga2e3sbbxvsyal
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqLSmYACgkQ64mZXMKQ
wqnafRAAvX2+1woa8AXlKj/eftKoNE5N3ON3YX+lbpDgjC4LZSkbPXsre82Gm+Sr
GaL0u/62QFyax30+jY+XC4Q8wGS/6PZOy5qBF16g7loMGPAT/3cBcCJS+/bE9rNg
KLYitNXUMK7MXW5tBvjIO76loX6S/hrSLjl6JxafigPZxet+zNIsss+IWEN3PrLs
HccQ3IqgyEqJJpqwJx+bQWIInn3DbGL1dGIUNP5EcaHl+xGmB04fX9I7TnlDbB0H
MnwxmT3o44qKMnUG8eEfjrrDaqhx5evWK/APisodcqP6Edk2Hw0TAoR9jAUUqbHS
YAMIZ5FPjHWgwCnFas29c0XkX43hNk4LrbLOl2A+aHQjG0YmGIrfMLmcm/fvr/Bo
F9L8GLud5h1CybiGdRZpF/qIOTvpKi48//+reg0JveLrAYH8B+FuqFayfp7XjYAa
oIsyUULlj4T5/tFrbNHvZGyTrvpTcd+rQ4B+BSwopHxhoSAtxMgiYesUzA4S2GfN
Xnvoqzh+SmoVElc74scubfpKp8ipAqnisDut+yL9MUcpD5F5idiMgeHARc4AXyq4
E5VtRl/A1OUwTPstmCCk7856g2J3T4vsALsJqxZ4QrjtRr1CC6IeUhKk3QUp2jmA
3Id3eqE3rsdOU9K3dgQu0d1uaeLUeb8YtvtkUIp+N1nyw3vB7ks=
=3+Gf
-----END PGP SIGNATURE-----

--hmga2e3sbbxvsyal--
