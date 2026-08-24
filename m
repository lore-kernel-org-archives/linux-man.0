Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797824052BB
	for <linux-man@vger.kernel.org>; Mon, 24 Aug 2026 11:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787569206; cv=none; b=qZruaQXSCE37egmxm8YM/tTELYZIeoXpGWXafu+aWvU3OshusP8bqY1jUoC2aYvh5C+IqXufJgL+SBH5x2n8mzn96VuIbaScd+XCAQUUwST+TdZqsFOuI/TR620X59OMEngf3EVxOgBVOIebE6rEDC7ocYsstN/NL597LE1ySn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787569206; c=relaxed/simple;
	bh=zafWlIDnwtqsF/EKxyJ1SakGfSEmzQwfWqpN/jSs+Oc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bRiaeeMqzGz+3xlEZ+maqD0b11RGUKCwzr4wVvWGV+wLWzbToBafXwJ7kyrUWKMk/j30YMvofTqW0j3f/4j+GFoLdd/oyroqauZp7GkSKMtaArFoAF9gik0CIGMjCVA1luozz3p8fikVKZHkCeue1jynWfgQlQJrumTmLdt/fL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GPUMIRyU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GPUMIRyU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C1371F000E9;
	Mon, 24 Aug 2026 11:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787569204;
	bh=6Xuppixk3xoxSZPCYt4mD3NMg4gk7CFqXZncr49NIDc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GPUMIRyUVbzzAXILw4nL3S9OJdy4jGs8bDTH6mknQJubz2LEQXurZS3I9BtbIC2M7
	 z5Dks9WrvC0tYsH3Q0EwKp74+snuKAsgBryzPvc1oPVCaLVh5wDERRoG6rYmDpjE9b
	 5nEZe9IO3wurJvmNcncomzieRManMpNnbc6z7ip3tOjM7x3SQGCF+mORHU+8qeYhpe
	 jTO/6efcyTvseDziLARC8APA3uiZjS3oIDLhAtE8lwdbqB2bbPO4YjmVfSs/eijwNI
	 vzeLOuuXUBTRyR7gmK2Re5MRjwrfZ0qM4dbwaw47UnVpJ8BRqFHNeaiDW3yQ5vaJw8
	 JwO7KN61gPMMA==
Date: Mon, 24 Aug 2026 13:00:00 +0200
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: linux-man@vger.kernel.org, groff@gnu.org
Subject: Re: Using LS/LE (was: [PATCH v4 2/4] man/man5/tunables.conf:
 Document system-wide tunables config)
Message-ID: <aowZbB1XiYMnCyuj@devuan>
References: <aorlBv8YTu4JlZcy@devuan>
 <20260823132749.pgypzsqv32n67wor@illithid>
 <aor4LIdGrSGHe3TB@devuan>
 <20260823141622.7vszwghxrxvkff4j@illithid>
 <aosHFaauEzKEFNpl@devuan>
 <20260823164451.5jeolmdu44ubpeba@illithid>
 <aotFzewQhmLJSk6N@devuan>
 <20260823204051.mkcgwghlljq7fqic@illithid>
 <aott22sJfNucOefn@devuan>
 <20260824011129.njsipdzmay4smp6i@illithid>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fm3niucfjt3gitwg"
Content-Disposition: inline
In-Reply-To: <20260824011129.njsipdzmay4smp6i@illithid>


--fm3niucfjt3gitwg
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: linux-man@vger.kernel.org, groff@gnu.org
Subject: Re: Using LS/LE (was: [PATCH v4 2/4] man/man5/tunables.conf:
 Document system-wide tunables config)
Message-ID: <aowZbB1XiYMnCyuj@devuan>
References: <aorlBv8YTu4JlZcy@devuan>
 <20260823132749.pgypzsqv32n67wor@illithid>
 <aor4LIdGrSGHe3TB@devuan>
 <20260823141622.7vszwghxrxvkff4j@illithid>
 <aosHFaauEzKEFNpl@devuan>
 <20260823164451.5jeolmdu44ubpeba@illithid>
 <aotFzewQhmLJSk6N@devuan>
 <20260823204051.mkcgwghlljq7fqic@illithid>
 <aott22sJfNucOefn@devuan>
 <20260824011129.njsipdzmay4smp6i@illithid>
MIME-Version: 1.0
In-Reply-To: <20260824011129.njsipdzmay4smp6i@illithid>

Hi Branden,

> Date: 2026-08-23 20:11:29-0500
> From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
>
> Hi Alex,
>=20
> At 2026-08-24T01:11:00+0200, Alejandro Colomar wrote:
> > I believe the reason I avoid learning m4 is that I don't think I need
> > it.  So far, GNU Make has proved to be enough for me.  The day I find
> > myself writing a build system for a project, and find it impossible or
> > impractical to do it using GNU Make, I'll give autotools a chance.
> > But I haven't found anything yet that I can't do easily with GNU Make.
> >=20
> > I have yet to be convinced that autotools provide any benefits over
> > GNU Make.
>=20
> For me, the biggest benefit of GNU Automake is the test harness that's
> just lying there.  It's stupidly easy to add a new test script.[0]
>=20
> [0] Example:
>=20
>     https://cgit.git.savannah.gnu.org/cgit/groff.git/commit/?id=3Daa43b5e=
261a7b4fe3b09e6673f145b0e123faffa

The marginal cost of adding one test is small (but nonzero), but is that
also true for the first test?

FWIW, I used the build system of the man-pages for a C library project,
and while I obviously had to add some makefile code for adding tests,
the marginal cost of adding one test file is zero.  That is, the
makefiles find anything under share/tests/, and include it to the file
list.

[...]
> [I wrote:]
> > > I wouldn't have ventured an opinion either way; I'm confident GNU
> > > Make is up to the challenge, but less sure about POSIX Issue 8
> > > make(1).
> >=20
> > Indeed, I use only GNU Make.
> >=20
> > <https://make.mad-scientist.net/papers/rules-of-makefiles/>
> >=20
> > Paul's first of the Rules of Makefiles:
> >=20
> > 	1.  Use GNU make.
> >=20
> > 	    Don=E2=80=99t hassle with writing portable makefiles, use a portab=
le
> > 	    make instead!=20
> >=20
> > Once POSIX Issue 8 make(1) gets more wide spread, I might put some
> > effort into transforming some GNU idioms into POSIX idioms, if it's
> > easy.
>=20
> Should be.  The only change I can think of off the top of my head is
> that you'll need to covert
>=20
> FOO:=3Dbar
>=20
> to
>=20
> FOO::=3Dbar
>=20
> ...because BSD implemented `:=3D` with different semantics.  Less useful
> ones, but they planted their feet.
>=20
> `:=3D` is therefore ambiguous.  (If one wants BSD `:=3D` semantics, one u=
ses
> the truly ghastly `:::=3D`.  Serves 'em right!  3;-) )

Thanks!  I've applied the following commit.

	commit af165bbd04c6f85c66a33452b1d247f32c926ae6
	Author: Alejandro Colomar <alx@kernel.org>
	Date:   2026-08-24 12:12:11 +0200

	    share/mk/, GNUmakefile: Use ::=3D instead of :=3D
	   =20
	    That's what POSIX.1-2024 standardized.
	   =20
	    Suggested-by: "G. Branden Robinson" <g.branden.robinson@gmail.com>
	    Message-ID: <20260824011129.njsipdzmay4smp6i@illithid>
	    Signed-off-by: Alejandro Colomar <alx@kernel.org>

	diff --git a/GNUmakefile b/GNUmakefile
	index 3f2ea50baa66..f8b3add5b325 100644
	--- a/GNUmakefile
	+++ b/GNUmakefile
	@@ -2,8 +2,8 @@
	 # SPDX-License-Identifier: LGPL-3.0-only WITH LGPL-3.0-linking-exception
	=20
	=20
	-SHELL       :=3D bash
	-.SHELLFLAGS :=3D -Eeuo pipefail -c
	+SHELL       ::=3D bash
	+.SHELLFLAGS ::=3D -Eeuo pipefail -c
	=20
	=20
	 ifneq (4.4.999,$(firstword $(sort 4.4.999 $(MAKE_VERSION))))
	[...]

> > > $ wc -c $(find -name "*.am" | grep -v gnulib | sort)
> >=20
> > Out of curiosity, why would you use $()?  It feels simpler (less
> > nesting) to use xargs(1).  It's also more robust, since the output of
> > $() might grow in some cases too much for a single command.
>=20
> I seldom (if ever) encounter the final difficulty.  When working
> interactively at the command line, I'm practically never trying to hunt
> up things across an entire file system.  Just $HOME is too big to be
> wieldy.  If I really have to trawl my gigantic $HOME, I write a script
> and go do something else for a while.
>=20
> > 	$ find -name "*.am" | grep -v gnulib | sort | xargs wc -c | tail -n1
> > 	228376 total
>=20
> You can see that my "phrasing" is shorter.  Nice for interactive use.

$() vs |xargs is only shorter by a 3 characters.  Also, $() has three
characters for which you have to hold shift, vs 1 from |xargs, which
makes $() actually harder to type than |xargs, IMHO.

Some interesting feature of |xargs is that you can prepend it with
'|tee /dev/tty' when you need to debug the input, when something goes
wrong.

[...]
> > grep(1) seems simpler to learn,
> > since we already know it anyway.
> > Necessary link: <https://doc.cat-v.org/unix/find-history>.
>=20
> Oh, hah.  Yes.  I'll ask you to take my word for it that I wrote my
> historical summary above before reading this part of your message.  ;-)

:-)

[...]
> > Interesting.  The day someone complains again about my makefiles, I'll
> > point to this data.  I checked a few other projects out of curiosity:
> >=20
> > 	alx@devuan:~/src/shadow/shadow/master$ find | grep '\.am$' | grep -v g=
nulib | sort | xargs wc -c | tail -n1
> > 	31885 total
> > 	alx@devuan:~/src/gnu/glibc/master$ find | grep '\.am$' | grep -v gnuli=
b | sort | xargs wc -c | tail -n1
> > 	0
> > 	alx@devuan:~/src/gnu/gcc/master$ find | grep '\.am$' | grep -v gnulib =
| sort | xargs wc -c | tail -n1
> > 	1527474 total
> > 	alx@devuan:~/src/gnu/coreutils/master$ find | grep '\.am$' | grep -v g=
nulib | sort | xargs wc -c | tail -n1
> > 	8171 ./Makefile.am
> > 	alx@devuan:~/src/gnu/findutils/master$ find | grep '\.am$' | grep -v g=
nulib | sort | xargs wc -c | tail -n1
> > 	35765 total
> >=20
> > Does glibc not use automake?  What do they use?
>=20
> Hand-written Makefiles, apparently! For a while I followed their Git
> commits, but I'm well behind on them.  glibc and GCC saturated my
> ability to keep up with the projects I track.

Oh, nice!

> > > 228kB is an order of magnitude higher than I'd have guessed.  But I
> > > should have known better--from bitter experience I should have
> > > intuited that the "doc.am" beast alone defeats any such notion.
> >=20
> > It's interesting that a build system of the same size as mine but
> > based on autotools remains problematic, while mine based on GNU
> > makefiles consistently has zero issues.  And when one is reported (a
> > few in the last years), they are trivial and addressed in minutes.
> > Also, *all* projects I've seen using non-make build systems
> > consistently have issues they just leave there because the problem
> > isn't understood.  The more I see about other build systems, the more
> > I like mine.
>=20
> groff may be trying to solve somewhat different problems.
>=20
> We have weird-ass problems like this:
>=20
> https://savannah.gnu.org/bugs/?68567
>=20
> ...and I daresay you don't.

I _think_ had some issues that are somewhat similar in the build system
of a C library.  I had to deal with them in the pkg-config file.  I say
I think, because I don't understand that problem enough.

> 'Course, that was an Autoconf problem, not an Automake problem.  But it
> was still a build dependency issue, and thus ultimately had impact on
> Makefiles.
>=20
> > I have to admit that writing a quality build system with GNU Make
> > isn't easy.  It took me many years to research, experiment, and learn.
> > So, the makefile code I wrote is hardly maintainable by a novice (I
> > wonder what'll happen to it after me).  But the same is true of any
> > good build system.
>=20
> Yeah.  Not long after I took a job in Sydney, I was gifted with a
> printed-out meme as decoration for my cubicle wall.  Attached.

:D

> CMake and Australian culture taught me how to swear as if I were myself
> a member of Insane Clown Posse.  :-|
>=20
> > I think distro maintainers are scared of makefiles because the average
> > makefile is problematic.  But the same things are said of C, and I
> > don't think C is particularly problematic as a language.
>=20
> Disagree with you here.  C and C++ are _terrible_ languages.  :D

It has many dialects, and I acknowledge some of them --notably including
ISO C89-- are terrible.  But some dialects, such as GNU C2y, are quite
nice.

Please don't judge the language by its worst dialects.  :)

> (By multiple important metrics, English is a terrible natural language.
> Its phonemic inventory is unusually large and its spelling thoroughly
> unpredictable.  It is about as hard for non-native speakers to acquire
> as Arabic, Russian, or Mandarin or Cantonese Chinese are to monoglot
> English speakers.  I happen to love the English language.  But I
> acknowledge that it is a cruel mistress.)

Phonetically, Spanish might be some of the simplest languages.

On the other hand, written English is quite simple compared to other
languages (including Spanish).  It doesn't conjugate much.

I've heard Norwegian is even simpler than English when written, and
possibly one of the simplest languages.  I haven't learnt it, so I can't
judge.

> If I ever get over the fence to the greener grass of Ada, I'll let you
> know how I find it.  ;-)
>=20
> > It's just the average programms that are problematic, in any language.
>=20
> Average programmers do average work in any language.  The parameter over
> which language designers have control is whether the work gets "done" at
> all.  What "done" _means_ is back in the hands of the programmer again.
>=20
[...]
> > > I like your idiom of sticking `P` after the `LS` and/or the `LE`
> > > calls
> >=20
> > You problably mean before the LS and after the LE?
>=20
> Actually either way works, right now.  I don't plan to change that.
>=20
> $ cat ATTIC/inline-compact-list.man
> .TH foo 1 2026-08-23 "groff test suite"
> .SH Name
> foo \- frobnicate a bar
> .SH Description
> This is my man page.
> There are many like it,
> but this one is mine.
> .SS "Example 1"
> People should read more about
> .P
> .LS itemized 1 4n
> .IP \[bu]
> bash
> .IP
> This line should be preceded by vertical space.
> .IP \[bu]
> m4
> .IP \[bu]
> make
> .LE
> .P
> and learn what these tools can do for them.
> .SS "Example 2"
> (This example should look the same as the first.)
> People should read more about
> .LS itemized 1 4n
> .P
> .IP \[bu]
> bash
> .IP
> This line should be preceded by vertical space.
> .IP \[bu]
> m4
> .IP \[bu]
> make
> .LE
> .P
> and learn what these tools can do for them.
> $ ./build/test-groff -rLL=3D72n -man -T utf8 ATTIC/inline-compact-list.man
> foo(1)                   General Commands Manual                  foo(1)
>=20
> Name
>      foo - frobnicate a bar
>=20
> Description
>      This is my man page.  There are many like it, but this one is mine.
>=20
>    Example 1
>      People should read more about
>=20
>      =E2=80=A2   bash
>          This line should be preceded by vertical space.
>      =E2=80=A2   m4
>      =E2=80=A2   make
>=20
>      and learn what these tools can do for them.
>=20
>    Example 2
>      (This  example  should  look the same as the first.)  People should
>      read more about
>=20
>      =E2=80=A2   bash
>          This line should be preceded by vertical space.
>      =E2=80=A2   m4
>      =E2=80=A2   make
>=20
>      and learn what these tools can do for them.
>=20
> groff test suite               2026=E2=80=9008=E2=80=9023                =
         foo(1)
>=20
> > > as and where one wants inter-paragraph spacing before and/or after
> > > the (compact) list.  I had designed the macros with that in mind,
> > > but had not thought of that simple way to express it.
> >=20
> > Here I've written some test page.  I can't handle some cases:
> >=20
> > 	alx@devuan:~/tmp$ cat ls.man=20
> > 	.TH a s d f
> > 	.SH test
> > 	compact but separated:
> > 	.P
> > 	.LS itemized 1
> > 	.IP \[bu] 3
> > 	foo
> > 	.IP \[bu]
> > 	foo
> > 	.LE
> > 	.P
> > 	compact, and no space before:
> > 	.LS itemized 1
> > 	.IP \[bu] 3
> > 	bar
> > 	.IP \[bu]
> > 	bar
> > 	.LE
> > 	.P
> > 	compact, and no space after:  // How to do this??
> > 	.P
> > 	.LS itemized 1
> > 	.IP \[bu] 3
> > 	baz
> > 	.IP \[bu]
> > 	baz
> > 	.P
> > 	.LE
> > 	compact, and no spaces before nor after:  // Same problem.
> > 	.LS itemized 1
> > 	.IP \[bu] 3
> > 	qwe
> > 	.IP \[bu]
> > 	qwe
> > 	.P
> > 	.LE
> > 	expanded:
> > 	.LS itemized
> > 	.IP \[bu] 3
> > 	qwe
> > 	.IP \[bu]
> > 	qwe
> > 	.LE
> > 	.P
> > 	end of file
> > 	alx@devuan:~/tmp$ /opt/local/gnu/groff/20260823_master/bin/groff -man =
-Tutf8 ls.man
> > 	a(s)                                                                  =
      a(s)
> >=20
> > 	test
> > 	     compact but separated:
> >=20
> > 	     =E2=80=A2  foo
> > 	     =E2=80=A2  foo
> >=20
> > 	     compact, and no space before:
> > 	     =E2=80=A2  bar
> > 	     =E2=80=A2  bar
> >=20
> > 	     compact, and no space after:  // How to do this??
> >=20
> > 	     =E2=80=A2  baz
> > 	     =E2=80=A2  baz
> >=20
> > 	     compact, and no spaces before nor after:  // Same problem.
> > 	     =E2=80=A2  qwe
> > 	     =E2=80=A2  qwe
> >=20
> > 	     expanded:
> >=20
> > 	     =E2=80=A2  qwe
> >=20
> > 	     =E2=80=A2  qwe
> >=20
> > 	     end of file
> >=20
> > 	f                                       d                             =
      a(s)
>=20
> Yup, that looks like the problem I flagged as #2 earlier.
>=20
> > > 2.  `LE` needs to break the line and cancel any indentation implied
> > >     by the open list even when not followed immediately by a
> > >     paragraphing macro.
>=20
> > So, I expect you'll change 'P' to not add that blank line if it's
> > within LS/LE?  Or how should we write these?
>=20
> No, I _want_ `P` to add a blank line, before and internally to a list,
> even a compact one.  But I want `LE` to be able to configurably
> _suppress_ a blank line after a compact list.  Right now the simplest
> thing to do seems like giving it a Boolean argument to eat.
>=20
> Right now I'm conceptualizing that argument as "post-compactness",
> because that way it's likely to be consistent with any specified
> "compactness" Boolean argument to `LS`, but I wouldn't count on the
> former term surviving to code or documentation.

I think we don't need an argument.  Just a behavior fix.

	alx@devuan:~/tmp$ cat ls.man=20
	.TH a s d f
	.SH test
	compact, and no spaces before nor after:  // Same problem.
	.LS itemized 1
	.IP \[bu] 3
	qwe
	.IP \[bu]
	qwe
	.LE
	end of file
	alx@devuan:~/tmp$ /opt/local/gnu/groff/20260823_master/bin/groff -man -Tut=
f8 ls.man=20
	a(s)                                                                      =
  a(s)

	test
	     compact, and no spaces before nor after:  // Same problem.
	     =E2=80=A2  qwe
	     =E2=80=A2  qwe end of file

	f                                       d                                 =
  a(s)

I think LE should insert at least a break.  With that, we'd have this
solved, I think.


Have a lovely day!
Alex

>=20
> Regards,
> Branden
>=20
> [1] Of which this one is probably the most savage:
>=20
>     https://cgit.git.savannah.gnu.org/cgit/groff.git/tree/src/roff/groff/=
tests/check-delimiter-validity.sh?h=3D1.24.1
>=20
> [2] With one honorable exception, a *BSD luminary who contacted me
>     privately.  Haven't heard back from him in over a year now, but
>     these things can take time.





--=20
<https://www.alejandro-colomar.es>

--fm3niucfjt3gitwg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqMJCoACgkQ64mZXMKQ
wqnMwRAAlsjeTFfvQXxpozDy3G4Ohs5TOQZJblXEXelNy9HRlIWIybRJibWDqL/r
PwOZ7KSkkocqNqzq6EZ51S+UyotCE4iHRx+D3VCOPG2AQydjyhT96Od7q6sWro5s
WI8sATtb0Ve/Wl0LSiegR18FVgrVA0F4M3EQaTQRbMH16Vac9JBbj9jeEJ+qo+4i
fZau/tWgZqi3DldPXRmzOznX3C2yyJmBZ094qee8qOY0tK7fi5VVhCoGdo9iYnJw
RMRdKdGYiOzFNyiZ0sMgK6Zz43TQvhKPn4gJBtIom8/ygGP0n8p4xi7a4/FOr9se
tfV5YPBw62GnbA1G3I5jrMJbXOu7xJucc+cOWMikzzMDdKO6lFv2cAvGY5Nsqp8c
8XGuwGaJdCpTbb9Qhe7mumM88GymBfXlyB4AneeOxzFd4f0rOk5APWvy9OiLkTBg
QlmOTm4rC7dxT3sQY4YzJX+6USBf4t3XBVv3dUqHiSBDrfCGptqmGzo8Ve7nHK7U
zduC3UGstrORc8x9/rF6b7IVh6YP14IATMtU7KYJsyqWzMhs65DSn6+U7qTCKc90
+Hu6Ll1v8+uq63GseRUfMTONHWTYNOPjc6IyAyN7wxT8Dg70erxHqElcDkfyB1+i
Hi6qYcd0cpj8c4Le+lw3Ryvi2ngNAAsuwVh5LA06+3+/DJTO18c=
=zfTc
-----END PGP SIGNATURE-----

--fm3niucfjt3gitwg--
