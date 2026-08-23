Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59273254B8
	for <linux-man@vger.kernel.org>; Sun, 23 Aug 2026 23:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787526667; cv=none; b=Ig4SzXfvye4DHNu5eYaG5j1pHssFCl/bDcAxF/ebKwAEeJ7iY3bnxOq5yUXJ0cfOu10aC77yMS3SRGZUTvHQ3VU6VJrAJzqx76dwayNc1eeuzSt2YKWLxyCLdLHsAUgXGwUka4hmWRQ0xo65DKONJmD8vRXzVrkgytLPAAYbQkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787526667; c=relaxed/simple;
	bh=iwrATMf7Wy8WIDNRyino1qm3RoxTbTooOkzTIL1zi7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SSYxjvA7Ixvz38VnStOda92x3E7n6NZstAylD8mRQxVK26DKDVMOB1DXl1GMWm0702hcHqfUbXqkOXGTGDe9ENbq/ZR9aH1rkbV1nZm1ioYLEwPq0WUclKMylt2hCleEYgpNXfqLFjMr0iEG5UY9bPEJonWez+0L13aQehn/H00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hbSuoHX8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hbSuoHX8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D77E1F000E9;
	Sun, 23 Aug 2026 23:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787526665;
	bh=NQe8sg9IWm/DcNpIpvwp77H9efcwCiPsWNL4du6eksg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hbSuoHX8P8L4Fsh3R58LwakO7Y4G954Jk/W7fk/3Vtd8/iwawTbEMNU66u71jHViq
	 amVv8RfR+G4VN3zPbV+zbbjt8sEXVQfpEGB9zkrlRVAnq4wWemJZhvZB/Txw9j+TTU
	 PgWHVlq3oxjd9GbyYdi4QV/MuC9SQP5xlUEQ2iJv8tn1VAqVdVs78k04aOCIEFJb6M
	 zSY9edFdTuJ8x1wIcfz2BQXQkb1UwaeSXFI21eVmi9SYY5nEMsudlRnJB7BdTU2cZ/
	 IgqudvL0D8PNUZ5WHH2icMJz7pcp5CLIsABUEYrmAAEqPyiCRbWcvFfLVdOqiOycNr
	 AQHlkeXW+Jn5g==
Date: Mon, 24 Aug 2026 01:11:00 +0200
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: linux-man@vger.kernel.org, groff@gnu.org
Subject: Re: Using LS/LE (was: [PATCH v4 2/4] man/man5/tunables.conf:
 Document system-wide tunables config)
Message-ID: <aott22sJfNucOefn@devuan>
References: <xn33wr3rr8.fsf@greed.delorie.com>
 <20260807021256.pwzsls7awqmbslti@illithid>
 <aorlBv8YTu4JlZcy@devuan>
 <20260823132749.pgypzsqv32n67wor@illithid>
 <aor4LIdGrSGHe3TB@devuan>
 <20260823141622.7vszwghxrxvkff4j@illithid>
 <aosHFaauEzKEFNpl@devuan>
 <20260823164451.5jeolmdu44ubpeba@illithid>
 <aotFzewQhmLJSk6N@devuan>
 <20260823204051.mkcgwghlljq7fqic@illithid>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6m6owsuzqlglcuoz"
Content-Disposition: inline
In-Reply-To: <20260823204051.mkcgwghlljq7fqic@illithid>


--6m6owsuzqlglcuoz
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: linux-man@vger.kernel.org, groff@gnu.org
Subject: Re: Using LS/LE (was: [PATCH v4 2/4] man/man5/tunables.conf:
 Document system-wide tunables config)
Message-ID: <aott22sJfNucOefn@devuan>
References: <xn33wr3rr8.fsf@greed.delorie.com>
 <20260807021256.pwzsls7awqmbslti@illithid>
 <aorlBv8YTu4JlZcy@devuan>
 <20260823132749.pgypzsqv32n67wor@illithid>
 <aor4LIdGrSGHe3TB@devuan>
 <20260823141622.7vszwghxrxvkff4j@illithid>
 <aosHFaauEzKEFNpl@devuan>
 <20260823164451.5jeolmdu44ubpeba@illithid>
 <aotFzewQhmLJSk6N@devuan>
 <20260823204051.mkcgwghlljq7fqic@illithid>
MIME-Version: 1.0
In-Reply-To: <20260823204051.mkcgwghlljq7fqic@illithid>

Hi Branden,

> Date: 2026-08-23 15:40:51-0500
> From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
>
[...]
> > > 2.  they refuse to understand the very simple principle of operation
> > >     of the m4 macro language; and
> >=20
> > I have the 2nd negative trait, though.
>=20
> Nobody has time to learn everything.  But I take a dim view of refusal
> to learn things for bad reasons.  It can be hard to judge, and for sure
> to know exactly what a person's reasons are, because even if they don't
> misrepresent those reasons to others, they might lack the self-awareness
> necessary to know why they don't do things.
>=20
> For example, when I procrastinate a task, I often find myself trying to
> figure out post facto why I did so, after I get around to doing it.

I believe the reason I avoid learning m4 is that I don't think I need
it.  So far, GNU Make has proved to be enough for me.  The day I find
myself writing a build system for a project, and find it impossible or
impractical to do it using GNU Make, I'll give autotools a chance.
But I haven't found anything yet that I can't do easily with GNU Make.

I have yet to be convinced that autotools provide any benefits over
GNU Make.

[...]
> > > 3.  they refuse to believe that the variety of possible deployment
> > >     environments is as wide as it is.
> >=20
> > I acknowledge this.  However, some people refuse to believe that
> > hand-crafted makefiles can also handle quite different environments
> > too.  I believe makefiles can do that just fine.  It's a matter of how
> > much makefile code you write.
>=20
> I wouldn't have ventured an opinion either way; I'm confident GNU Make
> is up to the challenge, but less sure about POSIX Issue 8 make(1).

Indeed, I use only GNU Make.

<https://make.mad-scientist.net/papers/rules-of-makefiles/>

Paul's first of the Rules of Makefiles:

	1.  Use GNU make.

	    Don=E2=80=99t hassle with writing portable makefiles, use a portable
	    make instead!=20

Once POSIX Issue 8 make(1) gets more wide spread, I might put some
effort into transforming some GNU idioms into POSIX idioms, if it's
easy.

> > In the Linux man-pages project, we have 120 kB of makefiles.
> >=20
> > 	$ find share/mk/ -type f | xargs wc -c GNUmakefile | tail -n1
> > 	119125 total
> >=20
> > I believe that a set of makefiles that would handle all of the targets
> > of a project like groff wouldn't take much more than that.  It might
> > be a few hundred kB.  If it's well organized, it can be maintainable.
>=20
> I was going to venture that groff's Automake files added up to much less
> than that.  It's less--but not "much".
>=20
> $ wc -c $(find -name "*.am" | grep -v gnulib | sort)

Out of curiosity, why would you use $()?  It feels simpler (less
nesting) to use xargs(1).  It's also more robust, since the output of
$() might grow in some cases too much for a single command.

	$ find -name "*.am" | grep -v gnulib | sort | xargs wc -c | tail -n1
	228376 total

Another issue I have with find(1) is that it's so weird that I never
learnt its name flags.  It has so many different ones, working slightly
differently, that it's just insane.  grep(1) seems simpler to learn,
since we already know it anyway.
Necessary link: <https://doc.cat-v.org/unix/find-history>.

	$ find | grep '\.am$' | grep -v gnulib | sort | xargs wc -c | tail -n1
	228376 total

[...]
> 228376 total

Interesting.  The day someone complains again about my makefiles, I'll
point to this data.  I checked a few other projects out of curiosity:

	alx@devuan:~/src/shadow/shadow/master$ find | grep '\.am$' | grep -v gnuli=
b | sort | xargs wc -c | tail -n1
	31885 total
	alx@devuan:~/src/gnu/glibc/master$ find | grep '\.am$' | grep -v gnulib | =
sort | xargs wc -c | tail -n1
	0
	alx@devuan:~/src/gnu/gcc/master$ find | grep '\.am$' | grep -v gnulib | so=
rt | xargs wc -c | tail -n1
	1527474 total
	alx@devuan:~/src/gnu/coreutils/master$ find | grep '\.am$' | grep -v gnuli=
b | sort | xargs wc -c | tail -n1
	8171 ./Makefile.am
	alx@devuan:~/src/gnu/findutils/master$ find | grep '\.am$' | grep -v gnuli=
b | sort | xargs wc -c | tail -n1
	35765 total

Does glibc not use automake?  What do they use?

> 228kB is an order of magnitude higher than I'd have guessed.  But I
> should have known better--from bitter experience I should have intuited
> that the "doc.am" beast alone defeats any such notion.

It's interesting that a build system of the same size as mine but based
on autotools remains problematic, while mine based on GNU makefiles
consistently has zero issues.  And when one is reported (a few in the
last years), they are trivial and addressed in minutes.  Also, *all*
projects I've seen using non-make build systems consistently have issues
they just leave there because the problem isn't understood.  The more I
see about other build systems, the more I like mine.

I have to admit that writing a quality build system with GNU Make isn't
easy.  It took me many years to research, experiment, and learn.  So,
the makefile code I wrote is hardly maintainable by a novice (I wonder
what'll happen to it after me).  But the same is true of any good build
system.

I think distro maintainers are scared of makefiles because the average
makefile is problematic.  But the same things are said of C, and I don't
think C is particularly problematic as a language.  It's just the
average programms that are problematic, in any language.

> That's always the most troublesome of our Automake scripts, because we
> use the groff that we build to produce further artifacts.  It therefore
> functions in part as an acceptance test.
>=20
> > Because the makefile language is so simple, bugs are easy to spot and
> > fix, compared to autotools (possibly automake, but I can't distinguish
> > them enough).
>=20
> Apart from needing an awareness of Automake's special variable names,

Yup.  I have a similar problem with make(1)'s builtin variables and
rules.  My makefiles start with:

	MAKEFLAGS +=3D --no-builtin-rules
	MAKEFLAGS +=3D --no-builtin-variables
	MAKEFLAGS +=3D --warn-undefined-variables

That is, what you see in the makefiles is what happens.  If it's not
written, it doesn't happen.

> which employ a naming scheme that one tends to notice, I can almost
> always get by writing an Automake script using only "make(1) brain",
> which is one reason I've been such crap at actually _learning_ Automake.
>=20
> I more often have problems writing Automake scripts that will maintain
> portability between GNU Make and BSD Make, which is a constraint
> entirely of my own choosing.

Indeed.  I don't know why you self-inflict such pain.  The BSDs are okay
using GNU Make to build GNU-Make-based projects (IIRC, that's what Ingo
told me).

> > Oh, yeah, I agree with everyone here.  CMake is way worse than
> > autotools.  autotools is the least evil of the non-pure-makefile build
> > systems.
>=20
> I'm curious to hear your opinion of meson/ninja.

Ninja
~~~~~

I only ever used Ninja as a generated language in projects that generate
it from CMake.  I've never written Ninja myself.  But from what I've
read, it's meant to be a generated language, so it's uninteresting to
me.

According to <https://stackoverflow.com/q/62847359/6872717>, Ninja seems
to be faster because the configure step is slower, and focuses on
generating optimized Ninja files.  That's ironic, because build systems
with a 'configure' pre-step are so brittle that I never trust them, and
thus I end up often wiping the entire generated files, and configuring
again.  So, a make(1)-only build system --like mine-- would be faster.

About the language itself, it seems to be a cut down version of make(1),
so I couldn't do any serious work with it.  It's meant to be generated-
only.

Meson
~~~~~

I've never used it.  I also don't see why I would.

It's meant to be fast, but many other systems (like Ninja) have also
claimed to be fast.  They (at least Ninja) actually result in being
slower, as said above, so I'd have to be convinced that it's not an
empty claim in the case of Meson too.

To me, GNU Make seems to be really fast.  As long as one writes the
rules correctly (so that it can be parallelized as much as possible),
it's super fast.  Maybe they compare it to makefiles written by
incompetent programmers, but that's not a fair claim.  To be convinced,
one would have to show that Meson is faster than *my* build system.  But
I don't believe that's possible; I don't even conceive the possibility
that make(1) would be anyhow a bottle-neck there.

It claims to be very readable, but everybody claims that of their
languages.  I find GNU Make to be the most readable build-system
language, just like I find C to be the most readable programming
language.  FWIW, I've googled for an arbitrary example of a Meson file,
and I didn't found it magically readable.

So, what's the point of Meson?  I guess it's okay-ish for people who are
incompetent at writing build systems and just want their build system to
work, like in companies, where the money is spent on programmers writing
code, and not in programmers dedicated to the build system.  That place
was once fulfilled by CMake, and without having used Meson myself, I
feel it's more or less the same (simpler than CMake, and thus better,
but not by much).

> > > Hmm, no release since 4.4 on Halloween 2022.  Yeah, they might be
> > > due.
> >=20
> > Yup, I've been pinging Paul a few times in the last years.  But I gave
> > up last year.
>=20
> I don't begrudge Paul D. Smith a victory lap/vacation after the triumph
> of POSIX Issue 8 blessing so many GNU Make extensions.  :)
>
> But each one justified itself more than adequately.

Agree; he's doing a great work.

> This document remains useful.
>=20
> https://gist.github.com/Earnestly/29deee4f18346da6630ed1df760f1590

Thanks!

> > > Yes, but the tarballs get tested in a greater diversity of
> > > environments.  While I keep git HEAD "green"--I don't "git push"
> > > unless "make distcheck" runs successfully--that applies only to my
> > > personal development environment.  groff doesn't have a CI
> > > infrastructure.
> > >=20
> > > The build system is the thing that consistently gives us the most
> > > pain when trying to firm up a release.  So right now you are pulling
> > > on HEAD at its most fragile, ironically.  The code quality should be
> > > good, _if_ you can get the build to completion.
> >=20
> > I'm happy to uncover those bugs; it's not a problem.
>=20
> I appreciate your patience.  It's hard not to feel like every problem
> discovered in an RC reflects a maintainership failure on my part.
>=20
> Intellectually, I know that's not how collaborative software development
> works.  Psychologically, I want everything I produce to be so perfect
> that it inspires envy.  :)

But perfection takes a process.  Making imperfect stuff is part of it.
In some sense, that's why I avoid authoring permanent documents, like
articles, or talks, with my knowledge, because I know it's far from
being perfect.  But I'm quite happy writing crappy documents that are
part of a git repo, because I take them as a draft of the future
perfection.  :-)

> > Why not this?:
> >=20
> > 	.LE
> > 	.P
>=20
> Good idea!  This slots right in with no changes at all to the man(7)
> package.  All of mandoc(1)'s complaints are as expected.

:-)

>=20
> $ mandoc -T lint ATTIC/inline-compact-list.man
> mandoc: ATTIC/inline-compact-list.man:9:2: ERROR: skipping unknown macro:=
 .LS itemized 1 4n
> mandoc: ATTIC/inline-compact-list.man:18:2: ERROR: skipping unknown macro=
: .LE
> mandoc: ATTIC/inline-compact-list.man:1:5: STYLE: lower case character in=
 document title: TH foo
> mandoc: ATTIC/inline-compact-list.man:10:2: WARNING: skipping paragraph m=
acro: PP empty
>=20
> (I expect the third of those ("STYLE") to go away when Ingo makes his
> next mandoc(1) release.)
>=20
> So that's one fewer problem I have to solve.  Thanks!

You're welcome!  :-)

> But I just found a different one to replace it.  groff_man(7) says:
>=20
>             ...  Use IP without arguments to associate successive
>             paragraphs with an existing list item; to these, inter=E2=80=
=90
>             paragraph spacing applies even in compact lists.
>=20
> ...but that last clause is not working.  I'll work on that.
>=20
> > You might use compactness keywords:
> >=20
> > 	.LS itemized precompact
> >=20
> > You could have 'precompact', 'postcompact', 'compact', and
> > 'noncompact' (feel free to use names that aren't so terrible).
>=20
> This might now not be necessary at all; people can simply use your
> idiom.

Yup; I wasn't really understanding why it would be necessary, but just
in case I was missing something, I mentioned that possibility.  I think
the current feature is just fine, and moving/removing P's around, one
can do the right thing.

>  `P` (and its synonyms `LP` and `PP`) always apply
> inter-paragraphing spacing even in compact lists.  That's on purpose,
> because sometimes a document uses compact lists where an item requires
> multiple paragraphs, or interrupts the list with commentary.
>=20
> I like your idiom of sticking `P` after the `LS` and/or the `LE` calls

You problably mean before the LS and after the LE?

> as and where one wants inter-paragraph spacing before and/or after the
> (compact) list.  I had designed the macros with that in mind, but had
> not thought of that simple way to express it.

Here I've written some test page.  I can't handle some cases:

	alx@devuan:~/tmp$ cat ls.man=20
	.TH a s d f
	.SH test
	compact but separated:
	.P
	.LS itemized 1
	.IP \[bu] 3
	foo
	.IP \[bu]
	foo
	.LE
	.P
	compact, and no space before:
	.LS itemized 1
	.IP \[bu] 3
	bar
	.IP \[bu]
	bar
	.LE
	.P
	compact, and no space after:  // How to do this??
	.P
	.LS itemized 1
	.IP \[bu] 3
	baz
	.IP \[bu]
	baz
	.P
	.LE
	compact, and no spaces before nor after:  // Same problem.
	.LS itemized 1
	.IP \[bu] 3
	qwe
	.IP \[bu]
	qwe
	.P
	.LE
	expanded:
	.LS itemized
	.IP \[bu] 3
	qwe
	.IP \[bu]
	qwe
	.LE
	.P
	end of file
	alx@devuan:~/tmp$ /opt/local/gnu/groff/20260823_master/bin/groff -man -Tut=
f8 ls.man
	a(s)                                                                      =
  a(s)

	test
	     compact but separated:

	     =E2=80=A2  foo
	     =E2=80=A2  foo

	     compact, and no space before:
	     =E2=80=A2  bar
	     =E2=80=A2  bar

	     compact, and no space after:  // How to do this??

	     =E2=80=A2  baz
	     =E2=80=A2  baz

	     compact, and no spaces before nor after:  // Same problem.
	     =E2=80=A2  qwe
	     =E2=80=A2  qwe

	     expanded:

	     =E2=80=A2  qwe

	     =E2=80=A2  qwe

	     end of file

	f                                       d                                 =
  a(s)

So, I expect you'll change 'P' to not add that blank line if it's within
LS/LE?  Or how should we write these?


Cheers,
Alex

>=20
> A list item per se starts with either:
>=20
> * an argumentful `IP` macro call (for itemized or enumerated lists); or
> * a `TP` macro call (for definition lists).
>=20
> To recap, I have two macro programming problems to solve for RC3.
>=20
> 1.  Argumentless `IP` needs to apply inter-paragraph spacing even to
>     items in compact lists.
>=20
> 2.  `LE` needs to break the line and cancel any indentation implied by
>     the open list even when not followed immediately by a paragraphing
>     macro.
>=20
> Regards,
> Branden



--=20
<https://www.alejandro-colomar.es>

--6m6owsuzqlglcuoz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqLffgACgkQ64mZXMKQ
wqmn+g/+NPBw6W6hwE+t8XvxYsa1DDp9mehXyMUEXnsDPihuq3aB+LOlfanfb3oa
UvjLyMcHKxGp0hzaVMoy0RJsdFzHuer9qpnneEJ4Mx34a/7maeHIonZOZSK8CJ7C
6qU7At0PTfQ/cA2TpWqZXwIrbXY8wraH+z+V78ylbo617+5+c9eRIoh9XvYFXRRJ
qeHoq2RbpcQZ7eX8f0jb0kfIphOh+NCphJQSeIXeorRl1nWo+SEMJWT9Q5JXCJ/p
cjXPhsGViB5GanZE/OBwHUnWKhcfPuIgrkH+1Vpdfoxz+8kt2EOwUx4Httz1OH3z
t2yyiiKoGiL8CIrCvJknM/IgxYYJRHeqdj5ti+WaGV/60At00T+QFZqm5sxIQeM8
jMXiQk62sZH20ENkiuHNcmnqeJSvagakm7LfNYa5hZyVQKndKA/4p93/y8CC+4on
u4Bg0eiD0Z1ah/srePVfLBOUYjP6yAvY75hn0ir6B8O/pAcdMPUbC8zxNJwLsM4l
ZuHMZMw7UyB+bP3oQSV8d3MSp3uufmh4PJzaDRfUSMKAGPZdNcljWB7ExYI85NyA
LF5qyCUY4XckFgL30E3yk+3mb17NbWCtcWPqF329e+i+xluEwvp7wUEJYXr3kQfH
c7ulYsf77x2epX3NVxxs5bz0O1qNLnANRD7rgx+zSgeLhS1AH9g=
=79tF
-----END PGP SIGNATURE-----

--6m6owsuzqlglcuoz--
