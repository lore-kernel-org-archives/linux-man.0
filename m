Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9517D1990C7
	for <linux-man@vger.kernel.org>; Sun, 23 Aug 2026 16:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787503499; cv=none; b=Ftfv79Gnv0Rbj6IHI6Sb2a8gxL4hee4bVliU6uwq0Kkw7KOVe8B0SWv+i54QuoLjLqGGG1Zei8Af2pYgEVMAQdQlBwE1PS0NXLx4954qV3ROj8h6LlWTuYUm08InST90XzL50Dsh3LjhNlnN7tJYZXoBKaJpTjSQovnOzh/os5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787503499; c=relaxed/simple;
	bh=7WQN/HQ0dtLNGsYxmA3AzYmcbEAOzUyq7VJTABzM8+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pUT4Osu7IPuToxVhMhk4/6MjL1EqltakQTPEfIMmj+JDR4nBWsrhBdBQeNoUUKmv5AWSpqW+aeoob6nEYYdzEym4p8BiYmsOgbhlnX2295Wtn3T5Z3AODuHJ6mu4iFRqOincqwFmAAjeOnghOfPyqjrsoXUALF0y0a+FXkYRUT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VMfsxpfP; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VMfsxpfP"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-836eac5682bso48689407b3.0
        for <linux-man@vger.kernel.org>; Sun, 23 Aug 2026 09:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787503496; x=1788108296; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qBwuLNTDm14+AdpXrZ1oA4P01X0Tbj9BKttgTe5E/3Y=;
        b=VMfsxpfPEQsdn0ud21iILuMr2kZyDLsWj6uyr4RsmxGZQx9PEZqgHrU/nZQxsyV2L2
         g16p6b4gw8E/gGSV1p0bNgLcd1hA49PFqmk9yxZrTfnM61JX5IQsZ2dfpyQzCeMvV+bd
         yZGu6+tO2uKdAcZl0wDBhI1gv3RWStkSVKMSaY3IyM93kA9CIPzUIlzeUKNBZXrVSslm
         3nkjNFxEdKerYaVxpUJcR+HOavFQDzZt4mD0HDYAnVhvRUsztD2u3YWs15TVz2iSXyfW
         GG0AlCAJ6V78IZ4JzqbbmWSjxnXV4DFefbaL7FEeVjyMn2KD+nSenkAQVt8HkyYa1K1+
         BR4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787503496; x=1788108296;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qBwuLNTDm14+AdpXrZ1oA4P01X0Tbj9BKttgTe5E/3Y=;
        b=bCjaUvg7JTjez8KHiiIMYiDAUw1bnNb6Mlp+rA/UYZ34CNFxLqAvqQBuMkLUeVIo1X
         A8+/OVxCxoCmAVynEed7haWylL2bU8V61stH/uSVZKYzP30kjvo+KeQiGeRGcTRU5eMF
         fGgpJc9S2SAn4yL1hoPd2Sl4syG6syL+yBwLKiqzocPTPDWvt/FfpXfNZtqm5w3e7X0N
         ur/3CmvavLGP5dwfDxPZPLJgEBiUEBPkVoBlZsg+gNiAIoBZVa2EvGNeDuybrch3NoLY
         KQAT9vHMWGc33n9uWwgT1uV3UMw1of45+Sr7VdY897wirzovckhI2UzC6iErQIUYG4VT
         eLFw==
X-Gm-Message-State: AFuF++lwUOFbNHHFuMWGQTJTDL5QxPf0vfI1SkMkDTUM86C4f++KDT5s
	buF/oXO8GdqWmLN6tku9AwSxXybcynMAyf0VZqjzf5V3HT2jzbSClKqfQj1wGw==
X-Gm-Gg: AR+sD10sqM0R/t0IbR6qKQ1qGN/x9Dqw5DeCfKK2WB+VQtrWILvPkxN0uT/1jbE2oi1
	J8mPgpAlmqoQxRp4dxx1EAoIDzX/RdIRuz96O2SJ5Ss1hb2HOJ9c8Uj7NIMulyguQkkrOhywwK1
	S3QYRv0lpozz3DqIVvT+4+G+W6WebKLEQED7Xx1+TXBDzyqyUdL5QaI1XDuoy+H1wLftwnlZqne
	d9aCpy/17MyX73t+B/2E0zp7Q4zJypyoVfWaYirOrgM0rx/Rzf3V53Y4aoLoGASaClkXA9f7LIG
	FvTwsYFIo9zqXBu2NIJU8Fr3MqKE61JUOiKxQwCge1ny7d7U7g1kQotAahEgkiqW+7IyjwQjtRe
	TiXdQrXAV9y7PDj9RFAwSFwZcRZWG2EVSYs1QG7GlN4yR/1qubwMNKo+VVybCtIOPI3Cz4kM2CC
	YxN+rHiJZSn7BXnDOA7aK4TGGYNFKv6OCHmc2+ka2JH+GfO5nNrg==
X-Received: by 2002:a05:690c:c19b:b0:845:2054:2365 with SMTP id 00721157ae682-8470c64a5d2mr95943247b3.14.1787503496183;
        Sun, 23 Aug 2026 09:44:56 -0700 (PDT)
Received: from illithid ([2600:1702:7cd0:e980::41])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-84ca5189169sm22831197b3.9.2026.08.23.09.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 09:44:54 -0700 (PDT)
Date: Sun, 23 Aug 2026 11:44:51 -0500
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org, groff@gnu.org
Subject: Re: Using LS/LE (was: [PATCH v4 2/4] man/man5/tunables.conf:
 Document system-wide tunables config)
Message-ID: <20260823164451.5jeolmdu44ubpeba@illithid>
References: <anTugcvjragzGpSK@devuan>
 <xn33wr3rr8.fsf@greed.delorie.com>
 <20260807021256.pwzsls7awqmbslti@illithid>
 <aorlBv8YTu4JlZcy@devuan>
 <20260823132749.pgypzsqv32n67wor@illithid>
 <aor4LIdGrSGHe3TB@devuan>
 <20260823141622.7vszwghxrxvkff4j@illithid>
 <aosHFaauEzKEFNpl@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xjv4ctvj76r7zy2s"
Content-Disposition: inline
In-Reply-To: <aosHFaauEzKEFNpl@devuan>


--xjv4ctvj76r7zy2s
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Using LS/LE (was: [PATCH v4 2/4] man/man5/tunables.conf:
 Document system-wide tunables config)
MIME-Version: 1.0

[looping in groff list because Alex brought to my attention an item of
work on the new man(7) `LS` and `LE` macros that needs to be done]

Hi Alex,

At 2026-08-23T17:06:16+0200, Alejandro Colomar wrote:
> > Date: 2026-08-23 09:16:22-0500
> > From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
> > At 2026-08-23T15:55:29+0200, Alejandro Colomar wrote:
> > > > From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
> > > > > Do you know what's wrong?
> > > > More or less. It turns out to be damned hard to balance the
> > > > requirements of (1) Automake maintainer mode; (2) building from
> > > > Git repository checkouts; and (3) building from distribution
> > > > archives.  Bruno Haible has been helpful in finding scenarios
> > > > that don't work.
> > > >=20
> > > > https://lists.gnu.org/archive/html/groff/2026-08/msg00039.html
> > >=20
> > > Hmmmm, now it rings a bell.  bootstrap said something about
> > > configure with maintainer mode, but I ignored that, since I had
> > > never used maintainer mode.
> >=20
> > Right.  I introduced that very recently during the RCs for 1.25.0,
> > because it seemed necessary.  But as shown, Bruno has proposed
> > patches ripping it back out.
> >=20
> > I'm pretty frustrated with Automake's lack of explicit support for
> > building from Git working copies.  Or maybe it's brilliantly
> > documented somewhere I haven't seen yet...
>=20
> I dislike autotools for that and other reasons.

Autoconf, Automake, and Libtool, the collective "autotools", are all
strongly distinguishable in purpose.  Autoconf is a brilliant idea, very
well executed.  I suspect that many of its its detractors possess a
constellation of negative traits:

1.  They're not terribly competent at writing portable shell scripts;
2.  they refuse to understand the very simple principle of operation
    of the m4 macro language; and
3.  they refuse to believe that the variety of possible deployment
    environments is as wide as it is.

To be fair, employers in the tech sector tend to pursue the correction
of none of these flaws.  Shell scripting is not widely recognized as
being as demanding a discipline as it is, I suspect because a whole
generation of engineering managers got hired from Microsoft shops; these
people understood what an MS-DOS batch file was, and grasped that a Unix
shell script was the analogue.  What do you use batch files for?  How
hard could any of this be?  That cohort of managers is likely in
retirement now, but they passed their "wisdom" to their successors via
the usual channels through which managerial class expertise transmits.

Well, it turns out that statically parsing a POSIX shell script is not a
decidable problem.[1]

When you find a manager who understands what that _means_, let alone
grasps its implications, mark your calendar.

Ambitious managers reject such claims outright.  They understand that
their personal advancement demands profession of the Friedman Doctrine:
the social responsibility of the firm is to deliver value (returns) to
shareholders.  Thus, _all_ problems are decidable--all that is required
is sufficient application of one's Nietzschean Will.

A software engineer attends school to learn complexity theory, and then
is paid a salary in the workforce to forget it.

I was intimidated by the idea of Autoconf macros at first.  I needn't
have been.  I already had many years of shell scripting under my belt,
and after reading the brief, original m4 paper in Volume 2 of the
Version 7 Unix Programmer's Manual,[2] I understood what was going on
with the brackets.

The mistakes I make when writing Autoconf macros are overwhelmingly
logic errors, not struggles with syntax.

I'm slowly warming to Automake.  I get what it's trying to do.  I think
it needs better introductory documentation.

Libtool is a terrifying solution to a terrifying problem.  I'm glad I'll
never have to learn anything about it unless I grow the courage to
maintain a shared library.

I've encountered CMake.  It burned me far worse than the Autotools ever
have.  In my view, rather than being a toolkit with which you can manage
your project's build system to your own specifications--meaning that you
can _understand_ it--it's a gigantic, baroque DWIM engine that permits a
software project to outsource their build system engineering to CMake's
maintainers.

As always with outsourcing, that'll work great--and managers will love
it--until it doesn't.

And when it doesn't, people will stumble around, blinking and wondering
where to find the expertise they'll need.

> For groff(1), writing a portable hand-written Makefile might be too
> hard to write.

I saw what we had before.  Bertrand Garrigues did us an unquestionable
service in porting groff to Automake back in 2013/4.

> But for the man-pages, I love the hand-written Makefile we have.

I, too, love sticking with pure make(1) anywhere I can.  POSIX Issue 8
make(1) really allows the tool to shine.

I nurse a glimmer of hope that the *BSD Make people can be pressured/
bribed/shamed into supporting pattern rules at long last, and then we'll
finally get as close to world peace as is possible.

https://cgit.git.savannah.gnu.org/cgit/groff.git/tree/doc/doc.am?h=3D1.24.1=
#n310

That's an exhibit of an extremely stupid, and extremely old, problem
that I defy any BSD partisan to defend.

> I'm still waiting for GNU Make to make a new release, and then be able
> to get rid of the mandatory -R, but other than that, it works quite
> nicely.

Hmm, no release since 4.4 on Halloween 2022.  Yeah, they might be due.

> Yup; I don't like using tarballs.  It's much easier to just check out
> git HEAD.  :)

Yes, but the tarballs get tested in a greater diversity of environments.
While I keep git HEAD "green"--I don't "git push" unless "make
distcheck" runs successfully--that applies only to my personal
development environment.  groff doesn't have a CI infrastructure.

The build system is the thing that consistently gives us the most pain
when trying to firm up a release.  So right now you are pulling on HEAD
at its most fragile, ironically.  The code quality should be good, _if_
you can get the build to completion.

> > > > Build finished successfully for me in about 60 seconds.
> > >=20
> > > Out of curiosity, where did you get those timestamps from?  Does
> > > your history file store them?
> >=20
> > Yes.  That's simply the output of Bash's "history" built-in.  I
> > chopped off the command numbers and removed irrelevancies like "ls".
>=20
> Oh, I don't have that!
>=20
> 	$ history | tail -n1
> 	 1997  history | tail -n1
>=20
> After checking `help history`, I now realize it has a HISTTIMEFORMAT
> variable for doing that.

Ah!  I completely forgot that I had customized that in my .bashrc.

> I've been wanting that for a long long time!  It's good to know it
> exists.  :)

Yup.  Lots of goodies in Bash.

> Oh, yeah, I forgot to RTFM.  :-)
>=20
> Here's an interesting thing (it might be okay, just noting it):
>=20
> 	diff --git i/man/man5/tunables.conf.5 w/man/man5/tunables.conf.5
> 	index 91bb6b81cb85..835c409eb074 100644
> 	--- i/man/man5/tunables.conf.5
> 	+++ w/man/man5/tunables.conf.5
> 	@@ -89,9 +89,10 @@ .SS Filters
> 	 Filters limit the tunables following it.
> 	 The effects of a filter are terminated by
> 	 any of the following:
> 	+.P
> 	+.LS itemized 1
> 	 .IP \[bu] 3
> 	 The end of the file.
> 	-.PD 0
> 	 .IP \[bu]
> 	 The end of an included file.
> 	 .IP \[bu]
> 	@@ -100,7 +101,7 @@ .SS Filters
> 	 directive.
> 	 .IP \[bu]
> 	 A new (possibly empty) filter.
> 	-.PD
> 	+.LE
> 	 .P
> 	 The syntax is:
> 	 .P
>=20
> I had to add that P paragraph so that there's a blank before the list.
> That's a bit unusual, since that would technically be an empty
> paragraph; or maybe we can consider that paragraph to be the entire
> list, but that's unusual in man(7).  That said, I'm fine with that.
>=20
> What do you think?

I agree that it looks a little funny; if one imagines the `LS` call as
not being there at all, it looks truly redundant, and "mandoc -T lint"
will likely complain about it.

However, you have to remember that *roff documents are not truly
block-structured.  mandoc(1) really badly wants them to be, so it
pretends that they are, and that sometimes leads it to jump through
hoops...or to arguments between groff and mandoc maintainers.  ;-)

In *roffs, paragraphing macros mean "break for paragraph here", not
"paragraph opens here".

So, in the foregoing, given that you _want_ inter-paragraph spacing
before you start the compact list, the "isolated" `P` makes perfect
sense.  I think it would be unwise to force a compact list to not be
compact prior to its first item, because doing that would foreclose the
following sort of layout.

(But I see a complementary problem.)

$ cat ATTIC/inline-compact-list.man
=2ETH foo 1 2026-08-23 "groff test suite"
=2ESH Name
foo \- frobnicate a bar
=2ESH Description
This is my man page.
There are many like it,
but this one is mine.
People should read more about
=2ELS itemized 1 4n
=2EIP \[bu]
bash
=2EIP \[bu]
m4
=2EIP \[bu]
make
=2EP
=2ELE
and learn what these tools can do for them.

$ nroff -rLL=3D72n -man ATTIC/inline-compact-list.man
foo(1)                   General Commands Manual                  foo(1)

Name
     foo - frobnicate a bar

Description
     This is my man page.  There are many like it, but this one is mine.
     People should read more about
     =E2=80=A2   bash
     =E2=80=A2   m4
     =E2=80=A2   make

     and learn what these tools can do for them.

groff test suite               2026=E2=80=9008=E2=80=9023                  =
       foo(1)

So there is a post-compact list space challenge.  You don't want an
"empty" `IP` call prior to the `LE`--that will cause unwanted
indentation of "and learn...".

Maybe `LE` needs to accept an argument applying post-list space (and
suppress it if the argument absent).

And maybe `LS` needs to accept another argument applying pre-list space
(and suppress it if the argument is absent).

I'll dig into this.  I might switch those defaults around; the objective
is to have `LS` and `LE` slot into existing man(7) documents as
unobtrusively as possible.  As the "NEWS" file says:

   Because these macros format no text, documents employing them risk no
   damage to their content if the formatter does not support them.  A
   man(7) document author can choose either to transition to these
   macros, to manage list "compactness" and item indentation with
   existing man(7) package facilities, or to employ both approaches.

Another governing principle is "man(7) document authors should not have
to use *roff requests".[3]

groff_man_style(7):

   Portability
=2E..
     In roff systems, elemental functions called requests and escape
     sequences control formatting operations.  A request appears on a
     control line.  An escape sequence starts with a backslash (\) and
     can appear almost anywhere.  However, use of roff requests (apart
     from the empty request =E2=80=9C.=E2=80=9D) risks poor rendering when =
a page is
     processed by non=E2=80=90roff formatters that attempt to interpret page
     sources.  (Historically, this was commonly attempted for HTML
     conversion.)  Many of these programs don=E2=80=99t interpret the full =
roff
     language (let alone extensions): they may be incapable of handling
     numeric expressions, control structures, or register, string, and
     macro definitions, causing a document=E2=80=99s contents to be omitted=
 or
     presented incomprehensibly.  If your document uses formatter
     requests, or escape sequences not shown below, it accepts
     responsibility for restoring formatter state to what the man macro
     package expects.

So I'll see what I can figure out with those lodestars in sight.

An idea involving only compact lists and `sp` and `ns` requests is
forming already.  I think I might profitably use them in the `LS` and
`LE` macro definitions, respectively.

The foregoing example will likely spawn an automated test.

Thanks for putting groff pre-1.25 to the test!

Regards,
Branden

[1] https://www.irif.fr/~treinen/publi/slides/minidebconf18.pdf
[2] https://archive.org/details/bitsavers_attunix7thersManualSeventhEdition=
Vol21983_34117955

[3] There are exceptional circumstances, like overcoming problems that
    AT&T troff and man(7) lacked mechanisms for solving, or providing
    "fallbacks" for pic(1) or eqn(1) input.  And I use `br` and `ne`
    requests in groff's man pages for "stranded line management", a
    problem that affects only paginated documents--that's a problem
    mandoc(1) is explicitly designed not to ever deal with.

--xjv4ctvj76r7zy2s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmqLI3oACgkQ0Z6cfXEm
bc5fdBAAktkCbTB9usN9wE5RY7DOP/I5rOY6Ntdumn70Vms50rnofON+4fv6zDeI
PLN5H3/7BRttyNeKJQ5EfoEtUQ9TNZ1gXFhGLVxJw8IAUGjDfuTJ0k36ER3QPv6K
+dkA6pB2y8rHT1iQJnvgaFMt/mh+yJf05mpQPT6xhdPxeqUctKxdDkwrHCYbmldJ
GeATDkHWs22uEcXJmdQf64XRHVLA2pzt0f2u0ZC3NXciwAOO9eb/VXrdnoL8UZPv
SEb0ziW9jaqM6B3ufbLwXuD+654cBmHX5nsJOhV2blimKr5BN4yVVDvnToqr3YPH
+Xn76ihBn+2BwpDD/78lkRpCh25tDFuUKa1PCYaBItpZjRuxmDc6AjkMb/ClnvKg
sWcVP4sdL33gPHvuDtPCtpjSlTo2jJrbpG71/PBdXhEU+wfiQ0j7Dacu+KNN6lXv
PkxzdkiMWZD0z2KhtYsxiRf593gBykI1/yCrxIQlBJphzoR9awxisi8hFxtUXGp4
RAK5s8iNbLkJL246wj8fWPUU7fDOnek+kKsQdmAOUsiOVxZmykRq7Rltg9o9jy1R
sS61OZ5zguiD6nE79CJxpj9daTa+N6yINukrQePuW8G40RSkdeyzLbDjIjBv9TmT
84IT9FqOHHtgBJAVj4AEVmpL0h6Tv6nNx4IPlQ6uMgcodtXHJpQ=
=9iK5
-----END PGP SIGNATURE-----

--xjv4ctvj76r7zy2s--
