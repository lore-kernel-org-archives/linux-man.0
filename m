Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8359D1D63E4
	for <linux-man@vger.kernel.org>; Mon, 24 Aug 2026 01:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787533895; cv=none; b=N6i093tFOxTtz3w4g5dlG+3mUJLsdON+fXIWrpN5R5HpxvyxSoSdLPe1rvTXod40xv+vjZIFKCMNJycbjVZQ6GtJqNSAdl5DaEMOOweX8oPOh/hj4KeZsZPfgPcAMrPdb2qRvLdb2HxO/ETFNX1rgP+S4kt5FGjx68CZcOg+J78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787533895; c=relaxed/simple;
	bh=lSF+jKa7VktGRQ1ky1W0LY64q38rDpeil+13ahwKSrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pwuzuShC0lZX9pbRPfbB06x9jjup/uxYfbjGlnJLK/3be2xS5lrq2ZwpxCpS83TlA8moAyrB6ZinAPtNTCSyWIF6ft2WRcyyM67KhYWpPVqewvZrHvX8O6aQB4iVvUR4KF0UMDfk8axJaGxBb1mD5AcDebVVdHgjDH6y06ImMNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oxQnFw34; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oxQnFw34"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-80cebd41372so44277357b3.3
        for <linux-man@vger.kernel.org>; Sun, 23 Aug 2026 18:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787533892; x=1788138692; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y6ImgF6+l/sfgBU7F00Wut7xTkaB0bpoIkNMGgtis60=;
        b=oxQnFw34F6+XhtdnBS9Um8awldBxaPlLRhbeIhtBQcq9NJfZJ3VwDBbbCjLGeTeYaf
         UfRkgm5hJqdbdaFaBLpOUl55aLLOsd6uFMK0FCrdr31P0ypFG5dTS2a2J+AQhpMstm3G
         sl02ELGHSseN+fA/NJNAu3dpgdU1n/l2k33xB+y3Aw5QnlM/KjFWnr4UieLREcBwtO/H
         W8L9hmGHPM+Ra+cuX5TvdqCk7BnmJA8fD6lCwrNTyZn9LwYr3DgjEVPHFFjAEJBDBRoo
         9vk+mDwmMVO3eWTT9lxfWZm4aYdoYeRwFOuvEoP5Y33ZAfdEgUbhi4vMoLxA0V4kRBoF
         s/7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787533892; x=1788138692;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y6ImgF6+l/sfgBU7F00Wut7xTkaB0bpoIkNMGgtis60=;
        b=E3JKEz8yIE1KoDMFzshJ5VdZRTJbntdsCGKMShKIxXDo8yBAhyirNyct8XpNE9EZQ8
         p6NPcga+bUy8C0EDVD/rGwwB/aMmQOjoQNXKd/ncQ3reoywafFMuoSkE9cb/6Zd5WiP7
         OCytdDp7S0bOAkyaKY4c+Jnu5FdaV5qladZaifOLb0TfJtg1yeqSOaFAXXXOzP7C/4qL
         AfoZAeR43z1hzQNyHFsoKCzoGni7pJ6oLCyyP3LhcYHPyI79IgdEUNfftnq721T9WwO+
         cN6K+Xh/fTjrTqeWNZkMFSAhsJLosCBeCuOPntODjeOgJkbbWp4W63miAPLQBYGKVf6H
         otAg==
X-Gm-Message-State: AFuF++nBQ/KkvmKiFK2iWh5+Ea0A4LnFbSCFpQcb+eY6xvyeyK2svUw0
	oYmuNW9myfsGZxgDJr8dAMNbvHm1WAiM1mSqII5axszX3IeuNDi6xDdzafSZzg==
X-Gm-Gg: AR+sD13YsTwrE+e28iz6VhxKUCaFcozNVxtK6rNeSW3TkSmMSlwPuzuxdHLvuo1p5Bf
	hwUmjUqhhOgjmKq2ZtrFHpgvkCUvgKoc+f001EPrQOexZtRrTYC2sUmrjOcPRx2LWBR9v3QHLpZ
	mnce0tLUH1OBzKgJWUZcpVaykx48Beg0eHiMukLTUv3uGABHLaTxgO75ox0fOCcDPDLd/CNWe+a
	Y9Af+aP0nvRQXoxeD1FOMIggYiYxTzwuzVAzrJTRHWMm3WtWhjOeAeuFwxmRp3chSEWWM1KvHSF
	X8L0KPV3qN4dYuke/io7ZtZZaVIW3BNHTXCLqifjFpV72UT+VwsvwhB8fneJrIcv/AsspYfZVbL
	/qxqLHwfSwl9utJFmvzgY/7urikIub54jvAY9mdkzPpqnGMvZLJbzCsI1EVBopbbUopcrUnq1E4
	FMxmAIUS2S2w4d40As2mtJBNewFq24HUeoAjK2iu1NDDgYDi13iYiVR1NAqQnm
X-Received: by 2002:a05:690c:389:b0:81e:d792:a019 with SMTP id 00721157ae682-84c93848f54mr49101567b3.6.1787533892091;
        Sun, 23 Aug 2026 18:11:32 -0700 (PDT)
Received: from illithid ([2600:1702:7cd0:e980::41])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-84cac3f525fsm25561267b3.44.2026.08.23.18.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 18:11:30 -0700 (PDT)
Date: Sun, 23 Aug 2026 20:11:29 -0500
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org, groff@gnu.org
Subject: Re: Using LS/LE (was: [PATCH v4 2/4] man/man5/tunables.conf:
 Document system-wide tunables config)
Message-ID: <20260824011129.njsipdzmay4smp6i@illithid>
References: <20260807021256.pwzsls7awqmbslti@illithid>
 <aorlBv8YTu4JlZcy@devuan>
 <20260823132749.pgypzsqv32n67wor@illithid>
 <aor4LIdGrSGHe3TB@devuan>
 <20260823141622.7vszwghxrxvkff4j@illithid>
 <aosHFaauEzKEFNpl@devuan>
 <20260823164451.5jeolmdu44ubpeba@illithid>
 <aotFzewQhmLJSk6N@devuan>
 <20260823204051.mkcgwghlljq7fqic@illithid>
 <aott22sJfNucOefn@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xhsu5mtyxwdgna33"
Content-Disposition: inline
In-Reply-To: <aott22sJfNucOefn@devuan>


--xhsu5mtyxwdgna33
Content-Type: multipart/mixed; protected-headers=v1;
	boundary="tt7tkvr3uglltn2r"
Content-Disposition: inline
Subject: Re: Using LS/LE (was: [PATCH v4 2/4] man/man5/tunables.conf:
 Document system-wide tunables config)
MIME-Version: 1.0


--tt7tkvr3uglltn2r
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alex,

At 2026-08-24T01:11:00+0200, Alejandro Colomar wrote:
> I believe the reason I avoid learning m4 is that I don't think I need
> it.  So far, GNU Make has proved to be enough for me.  The day I find
> myself writing a build system for a project, and find it impossible or
> impractical to do it using GNU Make, I'll give autotools a chance.
> But I haven't found anything yet that I can't do easily with GNU Make.
>=20
> I have yet to be convinced that autotools provide any benefits over
> GNU Make.

For me, the biggest benefit of GNU Automake is the test harness that's
just lying there.  It's stupidly easy to add a new test script.[0]

I would not have had the courage to undertake serious groff development
if I could not build a scaffold that gives me a fighting chance to keep
the impact of my changes under control and predictable.

As with any system where a test suite is retrofitted on, we're always
finding new things that need tests.  But with over 370 test scripts now,
some of which perform many different individualized "checks",[1] I think
we can claim growing confidence in groff's determinism.

[I wrote:]
> > I wouldn't have ventured an opinion either way; I'm confident GNU
> > Make is up to the challenge, but less sure about POSIX Issue 8
> > make(1).
>=20
> Indeed, I use only GNU Make.
>=20
> <https://make.mad-scientist.net/papers/rules-of-makefiles/>
>=20
> Paul's first of the Rules of Makefiles:
>=20
> 	1.  Use GNU make.
>=20
> 	    Don=E2=80=99t hassle with writing portable makefiles, use a portable
> 	    make instead!=20
>=20
> Once POSIX Issue 8 make(1) gets more wide spread, I might put some
> effort into transforming some GNU idioms into POSIX idioms, if it's
> easy.

Should be.  The only change I can think of off the top of my head is
that you'll need to covert

FOO:=3Dbar

to

FOO::=3Dbar

=2E..because BSD implemented `:=3D` with different semantics.  Less useful
ones, but they planted their feet.

`:=3D` is therefore ambiguous.  (If one wants BSD `:=3D` semantics, one uses
the truly ghastly `:::=3D`.  Serves 'em right!  3;-) )

> > $ wc -c $(find -name "*.am" | grep -v gnulib | sort)
>=20
> Out of curiosity, why would you use $()?  It feels simpler (less
> nesting) to use xargs(1).  It's also more robust, since the output of
> $() might grow in some cases too much for a single command.

I seldom (if ever) encounter the final difficulty.  When working
interactively at the command line, I'm practically never trying to hunt
up things across an entire file system.  Just $HOME is too big to be
wieldy.  If I really have to trawl my gigantic $HOME, I write a script
and go do something else for a while.

> 	$ find -name "*.am" | grep -v gnulib | sort | xargs wc -c | tail -n1
> 	228376 total

You can see that my "phrasing" is shorter.  Nice for interactive use.

For non-ephemeral artifacts, I prefer more "readable" syntax, by which I
mean ones easier to speak aloud in English, because one might be
discussing the content with colleagues.

> Another issue I have with find(1) is that it's so weird that I never
> learnt its name flags.

That it is.

> It has so many different ones, working slightly differently, that it's
> just insane.

Sometimes, it's what you need.  I learned find/xargs on Solaris, which
was much leaner than GNU findutils--but the weirdness was already baked
in.  As I understand it, find(1) and xargs(1) didn't come out of the
Bell Labs CSRC, but rather the USG, the folks who did PWB/Unix and then
ultimately System III and System V.  They also came up with cpio(1).

Their brains worked differently than the research folks'.

> grep(1) seems simpler to learn,
> since we already know it anyway.
> Necessary link: <https://doc.cat-v.org/unix/find-history>.

Oh, hah.  Yes.  I'll ask you to take my word for it that I wrote my
historical summary above before reading this part of your message.  ;-)

> > 228376 total

A substantial amount of this is the GNU GPLv3 notice boilerplate.

=2E..but I'm not arsing myself to measure it.

> Interesting.  The day someone complains again about my makefiles, I'll
> point to this data.  I checked a few other projects out of curiosity:
>=20
> 	alx@devuan:~/src/shadow/shadow/master$ find | grep '\.am$' | grep -v gnu=
lib | sort | xargs wc -c | tail -n1
> 	31885 total
> 	alx@devuan:~/src/gnu/glibc/master$ find | grep '\.am$' | grep -v gnulib =
| sort | xargs wc -c | tail -n1
> 	0
> 	alx@devuan:~/src/gnu/gcc/master$ find | grep '\.am$' | grep -v gnulib | =
sort | xargs wc -c | tail -n1
> 	1527474 total
> 	alx@devuan:~/src/gnu/coreutils/master$ find | grep '\.am$' | grep -v gnu=
lib | sort | xargs wc -c | tail -n1
> 	8171 ./Makefile.am
> 	alx@devuan:~/src/gnu/findutils/master$ find | grep '\.am$' | grep -v gnu=
lib | sort | xargs wc -c | tail -n1
> 	35765 total
>=20
> Does glibc not use automake?  What do they use?

Hand-written Makefiles, apparently! For a while I followed their Git
commits, but I'm well behind on them.  glibc and GCC saturated my
ability to keep up with the projects I track.

> > 228kB is an order of magnitude higher than I'd have guessed.  But I
> > should have known better--from bitter experience I should have
> > intuited that the "doc.am" beast alone defeats any such notion.
>=20
> It's interesting that a build system of the same size as mine but
> based on autotools remains problematic, while mine based on GNU
> makefiles consistently has zero issues.  And when one is reported (a
> few in the last years), they are trivial and addressed in minutes.
> Also, *all* projects I've seen using non-make build systems
> consistently have issues they just leave there because the problem
> isn't understood.  The more I see about other build systems, the more
> I like mine.

groff may be trying to solve somewhat different problems.

We have weird-ass problems like this:

https://savannah.gnu.org/bugs/?68567

=2E..and I daresay you don't.

'Course, that was an Autoconf problem, not an Automake problem.  But it
was still a build dependency issue, and thus ultimately had impact on
Makefiles.

> I have to admit that writing a quality build system with GNU Make
> isn't easy.  It took me many years to research, experiment, and learn.
> So, the makefile code I wrote is hardly maintainable by a novice (I
> wonder what'll happen to it after me).  But the same is true of any
> good build system.

Yeah.  Not long after I took a job in Sydney, I was gifted with a
printed-out meme as decoration for my cubicle wall.  Attached.

CMake and Australian culture taught me how to swear as if I were myself
a member of Insane Clown Posse.  :-|

> I think distro maintainers are scared of makefiles because the average
> makefile is problematic.  But the same things are said of C, and I
> don't think C is particularly problematic as a language.

Disagree with you here.  C and C++ are _terrible_ languages.  :D

(By multiple important metrics, English is a terrible natural language.
Its phonemic inventory is unusually large and its spelling thoroughly
unpredictable.  It is about as hard for non-native speakers to acquire
as Arabic, Russian, or Mandarin or Cantonese Chinese are to monoglot
English speakers.  I happen to love the English language.  But I
acknowledge that it is a cruel mistress.)

If I ever get over the fence to the greener grass of Ada, I'll let you
know how I find it.  ;-)

> It's just the average programms that are problematic, in any language.

Average programmers do average work in any language.  The parameter over
which language designers have control is whether the work gets "done" at
all.  What "done" _means_ is back in the hands of the programmer again.

> Yup.  I have a similar problem with make(1)'s builtin variables and
> rules.  My makefiles start with:
>=20
> 	MAKEFLAGS +=3D --no-builtin-rules
> 	MAKEFLAGS +=3D --no-builtin-variables
> 	MAKEFLAGS +=3D --warn-undefined-variables
>=20
> That is, what you see in the makefiles is what happens.  If it's not
> written, it doesn't happen.

This looks like a good idea.

> > I more often have problems writing Automake scripts that will
> > maintain portability between GNU Make and BSD Make, which is a
> > constraint entirely of my own choosing.
>=20
> Indeed.  I don't know why you self-inflict such pain.  The BSDs are
> okay using GNU Make to build GNU-Make-based projects (IIRC, that's
> what Ingo told me).

groff already had that trait.  It's not something I had to make happen.
Given that, I'm loath to give it up.  Also, it's much more satisfying to
complain about BSD make as someone who _uses_ and maintains a project
that supports building with it.  That way, when BSD Make partisans
ignore my complaints, as they always have to date,[2] it's clear that
they're ignoring a real user of their tool rather than some fruit loop
on Phoronix who has lots of opinions but doesn't even write software.

> Ninja
> ~~~~~
>=20
> I only ever used Ninja as a generated language in projects that
> generate it from CMake.  I've never written Ninja myself.  But from
> what I've read, it's meant to be a generated language, so it's
> uninteresting to me.

Right.  My understanding is that Meson is usually the thing that
generates it.

> So, what's the point of Meson?  I guess it's okay-ish for people who
> are incompetent at writing build systems and just want their build
> system to work, like in companies, where the money is spent on
> programmers writing code, and not in programmers dedicated to the
> build system.  That place was once fulfilled by CMake, and without
> having used Meson myself, I feel it's more or less the same (simpler
> than CMake, and thus better, but not by much).

Well, Meson apparently arose in the ferment of tech sector rage and
resentment against GNU GPLv3...a rage carefully calculated to ease the
extraction of economic rents and the exploitation of engineers' labor.

It's not under a copyleft license.  (It uses Apache 2.0.)

Meson's author perceived a market opportunity and seized it.

Good for him.  He seems to run a highly active podcast, so maybe he's
living his best life!

Wouldn't surprise me at all if the tradeoffs in adopting Meson are much
tougher decisions than its partisans credit, nor that its best features
are isomorphic to properties GNU Make (or even CMake) already has.

It is very frequently the case that technologies get adopted for reasons
other than their suitability to the task.  Just look at the x86 ISA.
How on earth did _that_ become dominant, relative to its competitors
=66rom 1978 to 1995?

The situation is similar to that captured by an old saying, "you can't
reason a man out of a position he wasn't reasoned into".

If an engineer selects, or is directed to select, a tool because "it's
not copyleft", no demonstration of a copylefted alternative tool's
superiority will succeed.  Even if its replacement with a copylefted
tool would materially affect the department's profitability, resistance
will be found, and if the case gets too dramatic to resist, then when
the change is eventually made, the change in the department's fortunes
will be attributed wholly to other factors, most likely a VP or
Director's "amazing leadership", without substance or explanation.

To make sense of decision making in most software engineering firms, it
helps to understand corporate America (and much of Europe).  Copyleft is
Communism and must be opposed with jihadist fervor.  Say what you will
about the hijackers who knocked down the World Trade Towers, they had no
truck with Marxism-Leninism.  They were always steadfast on that point.
How do you think they got where they did?[3][4]

(I have problems with Marx and Lenin myself, but no one ever asks what
they are.  ;-) )

> > I appreciate your patience.  It's hard not to feel like every
> > problem discovered in an RC reflects a maintainership failure on my
> > part.
> >=20
> > Intellectually, I know that's not how collaborative software
> > development works.  Psychologically, I want everything I produce to
> > be so perfect that it inspires envy.  :)
>=20
> But perfection takes a process.  Making imperfect stuff is part of it.
> In some sense, that's why I avoid authoring permanent documents, like
> articles, or talks, with my knowledge, because I know it's far from
> being perfect.  But I'm quite happy writing crappy documents that are
> part of a git repo, because I take them as a draft of the future
> perfection.  :-)

Yup.  Intellectually, I get it.  And feedback from folks like Bruno is
an important part of the quality assurance process.  I'm happy that it
produces actionable items.

> > But I just found a different one to replace it.  groff_man(7) says:
> >=20
> >             ...  Use IP without arguments to associate successive
> >             paragraphs with an existing list item; to these, inter=E2=
=80=90
> >             paragraph spacing applies even in compact lists.
> >=20
> > ...but that last clause is not working.  I'll work on that.
> >=20
> > > You might use compactness keywords:
> > >=20
> > > 	.LS itemized precompact
> > >=20
> > > You could have 'precompact', 'postcompact', 'compact', and
> > > 'noncompact' (feel free to use names that aren't so terrible).
> >=20
> > This might now not be necessary at all; people can simply use your
> > idiom.
>=20
> Yup; I wasn't really understanding why it would be necessary, but just
> in case I was missing something, I mentioned that possibility.  I
> think the current feature is just fine, and moving/removing P's
> around, one can do the right thing.
>=20
> > `P` (and its synonyms `LP` and `PP`) always apply inter-paragraphing
> > spacing even in compact lists.  That's on purpose, because sometimes
> > a document uses compact lists where an item requires multiple
> > paragraphs, or interrupts the list with commentary.
> >=20
> > I like your idiom of sticking `P` after the `LS` and/or the `LE`
> > calls
>=20
> You problably mean before the LS and after the LE?

Actually either way works, right now.  I don't plan to change that.

$ cat ATTIC/inline-compact-list.man
=2ETH foo 1 2026-08-23 "groff test suite"
=2ESH Name
foo \- frobnicate a bar
=2ESH Description
This is my man page.
There are many like it,
but this one is mine.
=2ESS "Example 1"
People should read more about
=2EP
=2ELS itemized 1 4n
=2EIP \[bu]
bash
=2EIP
This line should be preceded by vertical space.
=2EIP \[bu]
m4
=2EIP \[bu]
make
=2ELE
=2EP
and learn what these tools can do for them.
=2ESS "Example 2"
(This example should look the same as the first.)
People should read more about
=2ELS itemized 1 4n
=2EP
=2EIP \[bu]
bash
=2EIP
This line should be preceded by vertical space.
=2EIP \[bu]
m4
=2EIP \[bu]
make
=2ELE
=2EP
and learn what these tools can do for them.
$ ./build/test-groff -rLL=3D72n -man -T utf8 ATTIC/inline-compact-list.man
foo(1)                   General Commands Manual                  foo(1)

Name
     foo - frobnicate a bar

Description
     This is my man page.  There are many like it, but this one is mine.

   Example 1
     People should read more about

     =E2=80=A2   bash
         This line should be preceded by vertical space.
     =E2=80=A2   m4
     =E2=80=A2   make

     and learn what these tools can do for them.

   Example 2
     (This  example  should  look the same as the first.)  People should
     read more about

     =E2=80=A2   bash
         This line should be preceded by vertical space.
     =E2=80=A2   m4
     =E2=80=A2   make

     and learn what these tools can do for them.

groff test suite               2026=E2=80=9008=E2=80=9023                  =
       foo(1)

> > as and where one wants inter-paragraph spacing before and/or after
> > the (compact) list.  I had designed the macros with that in mind,
> > but had not thought of that simple way to express it.
>=20
> Here I've written some test page.  I can't handle some cases:
>=20
> 	alx@devuan:~/tmp$ cat ls.man=20
> 	.TH a s d f
> 	.SH test
> 	compact but separated:
> 	.P
> 	.LS itemized 1
> 	.IP \[bu] 3
> 	foo
> 	.IP \[bu]
> 	foo
> 	.LE
> 	.P
> 	compact, and no space before:
> 	.LS itemized 1
> 	.IP \[bu] 3
> 	bar
> 	.IP \[bu]
> 	bar
> 	.LE
> 	.P
> 	compact, and no space after:  // How to do this??
> 	.P
> 	.LS itemized 1
> 	.IP \[bu] 3
> 	baz
> 	.IP \[bu]
> 	baz
> 	.P
> 	.LE
> 	compact, and no spaces before nor after:  // Same problem.
> 	.LS itemized 1
> 	.IP \[bu] 3
> 	qwe
> 	.IP \[bu]
> 	qwe
> 	.P
> 	.LE
> 	expanded:
> 	.LS itemized
> 	.IP \[bu] 3
> 	qwe
> 	.IP \[bu]
> 	qwe
> 	.LE
> 	.P
> 	end of file
> 	alx@devuan:~/tmp$ /opt/local/gnu/groff/20260823_master/bin/groff -man -T=
utf8 ls.man
> 	a(s)                                                                    =
    a(s)
>=20
> 	test
> 	     compact but separated:
>=20
> 	     =E2=80=A2  foo
> 	     =E2=80=A2  foo
>=20
> 	     compact, and no space before:
> 	     =E2=80=A2  bar
> 	     =E2=80=A2  bar
>=20
> 	     compact, and no space after:  // How to do this??
>=20
> 	     =E2=80=A2  baz
> 	     =E2=80=A2  baz
>=20
> 	     compact, and no spaces before nor after:  // Same problem.
> 	     =E2=80=A2  qwe
> 	     =E2=80=A2  qwe
>=20
> 	     expanded:
>=20
> 	     =E2=80=A2  qwe
>=20
> 	     =E2=80=A2  qwe
>=20
> 	     end of file
>=20
> 	f                                       d                               =
    a(s)

Yup, that looks like the problem I flagged as #2 earlier.

> > 2.  `LE` needs to break the line and cancel any indentation implied
> >     by the open list even when not followed immediately by a
> >     paragraphing macro.

> So, I expect you'll change 'P' to not add that blank line if it's
> within LS/LE?  Or how should we write these?

No, I _want_ `P` to add a blank line, before and internally to a list,
even a compact one.  But I want `LE` to be able to configurably
_suppress_ a blank line after a compact list.  Right now the simplest
thing to do seems like giving it a Boolean argument to eat.

Right now I'm conceptualizing that argument as "post-compactness",
because that way it's likely to be consistent with any specified
"compactness" Boolean argument to `LS`, but I wouldn't count on the
former term surviving to code or documentation.

Regards,
Branden

[0] Example:

    https://cgit.git.savannah.gnu.org/cgit/groff.git/commit/?id=3Daa43b5e26=
1a7b4fe3b09e6673f145b0e123faffa

[1] Of which this one is probably the most savage:

    https://cgit.git.savannah.gnu.org/cgit/groff.git/tree/src/roff/groff/te=
sts/check-delimiter-validity.sh?h=3D1.24.1

[2] With one honorable exception, a *BSD luminary who contacted me
    privately.  Haven't heard back from him in over a year now, but
    these things can take time.

[3] https://openlibrary.org/works/OL193645W/The_Looming_Tower
[4] https://www.c-span.org/program/american-history-tv/charlie-wilsons-war/=
123837

--tt7tkvr3uglltn2r
Content-Type: image/jpeg
Content-Disposition: attachment;
	filename="icp_build_systems_how_do_they_work.jpeg"
Content-Transfer-Encoding: base64

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

--tt7tkvr3uglltn2r--

--xhsu5mtyxwdgna33
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmqLmjkACgkQ0Z6cfXEm
bc4h8w/9HxwoIiKCtHCMse1avTCtSD52PtqU6HyqqkQlBIM0DymwQo1Z89FrdXnv
dq4j4p81mNCOEEaybBRH2MaxVOyGs4HR9dAbpfgE0RiMyGRXFgSjZ8916NGoX/G4
HA+15WJsHOMFnult53c7c1Htard8j5s14LQh0B+2E/nPwS3nnlXtRzvo4/3AxkyO
3Jg0STaGlsyNN8vzlasMkc3iBlg3tLapDOpVwHOMEhnl+zcPjyrmWFVppju9HGZO
2LxYhW7x2PlHfN9dt6leSWNqYZ0X5/LZZucMSrEWJ1HSWStkJvyymH9b+ja6vwPn
kSycFm8hXC8BVqYa0WMWVM4spv1efEA8U5yyztFO0VAwr6CgImOOoxvTM/lCOs8E
VOKsnpX/oXC3FHvmyKJ/ckvaOWwrR54xEqP/D3fwMThD4wQUPX/X7TRkFKXvDmJs
QriBK/XwXSgzHpJ5bvx938iXq20GNYaIUIFez/FzXjvU9deD9Si6KeEYHqful05v
wvHWrYQK96lCvF2ISF0vCEy+J8aLNGehoRsiNQ/avUwo9bZTGPYrFz2EShpGstXb
WF2KbiKx0d+seArWmBOVyiq1YP3ryFFupRsuheQ3Lizx4SBkWw/nsnoh/xnbGz1Y
kqWATCWUD+6NJO26+iIFr3SdCokwZnDvYs4AnrRZUM+BCb8ix+8=
=S9lo
-----END PGP SIGNATURE-----

--xhsu5mtyxwdgna33--
