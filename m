Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4162CCC6
	for <linux-man@vger.kernel.org>; Sat, 29 Aug 2026 19:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788031006; cv=none; b=LQMgc2pgR15l1sGAKpJLbdVH5JY9iPlLL+aTQt65y2Vq+d+eXUAxpUqVpBzE0mQG61CWYJuXgoZboCC72lEEiDJgEhzW3OL+XYby/46DhAP8xBC/5ortG0HJ3ofOjVyVOGaldB6e3MaXuWgkSLp41KbO6HzYNUheQkV6mjLwulE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788031006; c=relaxed/simple;
	bh=sGGLUCMFOkO+n4DGae+AZUef7SGVRdpevqIKyzj+C50=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=jGRmPXj7mKPJvl5ouTrtbXUUZTRUT/chkIOseZirykBE2dqUm3SAWZ0FcHdb7u/X6coq6lK8q9L+Yhoh/p5XthExplW0asX9ERGmVspWJEq/afohpwVjXOYu1k8qfWPiJQrRg7bK8TGO0ipZYj8yoMot3zVCPPWUy/T40gqDZus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IVLxCXbN; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IVLxCXbN"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-66c70cff944so2587793d50.0
        for <linux-man@vger.kernel.org>; Sat, 29 Aug 2026 12:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788031003; x=1788635803; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7FnKBVbv84ropfXDsciZURZJq2ooSDXUiHDFfQ2wKHY=;
        b=IVLxCXbNCIZPqJa5hcg39m4wtoifcQFGwdADyJlXY5vcnKDqWZ6C2XEcv86O0ddkKc
         gieO9IlkyaZJPRMjvJrr60C2jeTiyboXTX68D3HfmYY9jVeINuyoCOAkJWLgg4XEhTLI
         VkS230VicsvWDjn8NS/0tPeHeO6Kfq7t7aeVD/Rwq5xNSbRSXVmLF7m0+sSyMJ4F9LlL
         Bf2IUZxP50XTZmIuu4B8Y4bOOWF+tvaFXzpGtw5MyPOiv4LVPjB8UzSFx6tzOVtMTzGQ
         MjWm1j11CCWQIzN+ZAzJUPm8dpGZTbFIWKlUf009xsUUxo6sdjPZFa2eszwgoVOuzLf2
         zJfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788031003; x=1788635803;
        h=in-reply-to:content-disposition:content-type:mime-version
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7FnKBVbv84ropfXDsciZURZJq2ooSDXUiHDFfQ2wKHY=;
        b=q841kLNdK/oBj/FXtgSGkVwLkN9FEQUPU/u0KeEuJBSUKFgrg4EASVQbnoiUoc5eX5
         jjH/zMeUgpoCNjvu89GrGkoCxv4l5LKibQpDMGn983eH97/0PdS8gyeZKm5viTrKxL/C
         f3kSJMVEHHPcE//TT0IujcAZtbjCmxwiPEA2evKeC2ZXjrop4ABYJUsXWOa3H1D5/LkP
         NLoca5i9zJfgJDKJhIdOYrBQZr8B6yKnUVt1rzERBV7qctPEdodQKg/qyIuQnqBQ+JTx
         8eWlMvgADvTfYmr0QoVSIWuVyJwtGKhIWwp+RT0C4nHNstpefY/YEf7ISj1XaSG0f29V
         vw1w==
X-Gm-Message-State: AFuF++lcI7qpV4p+z64Pojt6rdjOzym2WyvJY0eZGz+4mCgkmR3jM1rT
	0vx/wumVR6OlRAftHg8TCahXildZifmezHSPLT4SyhVFowVu5iK9jR3p
X-Gm-Gg: AYBFou1O1tCYhViZPHxxLT1FGNqQ4RcSgxqHwCaoMEzBUPBzDslF8zFW9iikVlmHGG9
	yM5uSc1RQeFLB77GH3co/oPHlqYkBHTQdW+QXjYMOf1hXEFO7GmSHeEHV0W9xCMR+5ZmEfcbqFG
	gm9CE82H73xCjw0+mqaxH4clFMAoRYJpC3IOwKj1Lch1EDE1HRCJ9hYEuKYoPpkti/DATvPpDZd
	4TPqj7wb6ZVOgeXfXWsCI3CsGYH5yecOQGFcgAzSb5beLnxUkwxJaaybfpjJkUPxvUq0zr0H81K
	/PMu5DZl92c2L3hKh61RHfpBAsisyBsVZDGpOiiNmdIdUh95cbEUf+Im2m4ykONOMRkBk5m9NU3
	AXy5CaNWT+oPK/Y1iJb6qZCrFNNz7gLCF+MIO9uL+l77b/DtTP3TUw+LzrG3sriO9AsZ2X8oOgR
	lUmUS2458sMUkCB/cr4VIbxK+TC+yh/xhvIaztwnv749BkCEq8mw==
X-Received: by 2002:a05:690e:43cc:20b0:66e:6494:efda with SMTP id 956f58d0204a3-66e6494f0bemr146022d50.44.1788031002385;
        Sat, 29 Aug 2026 12:16:42 -0700 (PDT)
Received: from illithid ([2600:1702:7cd0:e980::41])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66e4ed2986csm3021323d50.18.2026.08.29.12.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:16:40 -0700 (PDT)
Date: Sat, 29 Aug 2026 14:16:39 -0500
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: Ingo Schwarze <schwarze@usta.de>, Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org, groff@gnu.org
Subject: Re: Using LS/LE
Message-ID: <20260829191639.p43vvljsfy2vnxo5@illithid>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gfqtrg5l5ns4ya42"
Content-Disposition: inline
In-Reply-To: <apLD35LsoOqX6fK1@isnote.usta.de>
 <apLSc6uhVjBNhtyy@devuan>


--gfqtrg5l5ns4ya42
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Using LS/LE
MIME-Version: 1.0

Hi Ingo & Alex,

At 2026-08-29T13:34:55+0200, Ingo Schwarze wrote:
> G. Branden Robinson wrote on Fri, Aug 28, 2026 at 11:36:15PM -0500:
> > At 2026-08-24T00:31:07+0200, Ingo Schwarze wrote:
>=20
> >> I don't yet understand what the point of .LS is
>=20
> > I have articulated clearly several specific points about it.  I
> > initially had the idea for LS/LE as early as December 2022.
> >=20
> > https://lists.gnu.org/archive/html/groff/2022-12/msg00075.html
> >=20
> > At that time, I got no feedback on my proposal,
>=20
> If i remember correctly, i read that message as "i don't have clear
> goals, i don't have clear plans, and i don't see much need",
> so i saw no need to respond.

Fair enough.  I shelved the item for over 3 years and finally it
accumulated enough of all three to be actionable.

> > which I interpreted as indifference.
> > That's the usual fate of my proposals.  ;-)
>=20
> Well, sometimes some people (including myself) do consider your
> proposals.  :)
>=20
> > For example:
> > https://lists.gnu.org/archive/html/groff/2026-07/msg00096.html
>=20
> I missed that one, i wasn't around much in July.
> Not sure whether that's needed from a general-purpose typesetting
> perspective, i would have to think about that.

[begin brief excursion off of LS/LE]

That's the whole point of it.  The context of the argument between Deri
and me was driven by his enhancement of the ms(7) package to better
support PDF features, including internal bookmarks.  It's long been a
goal to do the same for all of groff's full-service macro packages,
which basically means tackling me(7) and mm(7) as well, since mom(7)
already has such support.

> For manual pages, that .ref proposal sounds like massive
> overengineering.

There's more to groff's world than man pages.

I'm snipping the rest of this paragraph because your focus is
misdirected.  If we ever need hyperlinked internal bookmarks in man
pages, mdoc(7) already has `Sx` and I have no problem adding a `SX` to
man(7).

The point of the machinery is to solve the forward reference problem.
You are essentially saying that _any_ two-pass assembler is "massively
overengineered" compared to a one-pass one.

That is not the consensus of the field.

A one-pass assembler simply cannot resolve forward references.  It has
only "errata".  Achieving with a second design what was flatly
impossible for the first does not constitute "overengineering" to me.

What decides the issue is your selection of problems to solve.

[end brief excursion off of LS/LE]

> > Earlier this year, after list nesting caused Alex pain again,
>=20
> Oh yes, that is true.  The man(7) language doesn't really support
> nested lists well.

Right.

> > and having gotten more familiar with the bash(1) man page source,
> > I consulted with Alex, P=C3=A1draig Brady (GNU coreutils),
> > Stephen Gildea (help2man), and Chet Ramey (GNU Bash) regarding
> > its interface, semantics, and goals.
>=20
> >> - in my experience, assembling items from .IP and .TP blocks to
> >> form lists is *not* among the problems the man(7) language causes -
> >> quite to the contrary,
>=20
> > Assembling a list is not difficult.   Exercising control over
> > indentation and inter-paragraph spacing (even just to turn it on and
> > shut it off) as they apply to the items of lists, especially when
> > nested, can get quite tedious.
>=20
> Again, that is true.
>=20
> The mandoc(1) -T man output mode uses .RS at the beginning and .RE
> at the end of each list to set up the indentation, and in nested
> lists, it uses .RS after the end of an inner list to get back to
> the indentation of the outer list.  It uses .PD 0 whenever
> following paragraph(s) want no leading vertical space and .PD with
> no arguments whenever following paragraphs want normal vertical
> spacing again.
>=20
> That being tedious is a direct consequence of man(7) being more of
> a presentational than semantic language.

Right, and when a machine takes care of the tedium, that's just about
bearable.  But it's not when a human has to handle the tedium.

> >> even though HTML is a strongly structural and semantic language,
> >> assembling even HTML code from .IP and .TP is a almost never a
> >> problem, and i don't see which other target format could possibly
> >> be harder to handle than HTML.
>=20
> > I don't disagree there.  To get groff man(7) to generate <ol>, <ul>,
> > and <dl> elements as desired, I'm going to have to make
>=20
> Well, mandoc -man -T html already generates (see man_html.c) <dl>
> or <ul> from .IP and .TP, since 2019:
>=20
>   date: 2019/03/02 16:29:49;  author: schwarze;  lines: +68 -16
>   Represent multiple subsequent .IP blocks having a consistent
>   head argument of *, \-, or \(bu as <ul> rather than as <dl>,
>   using a bit of heuristics.
>=20
>   Basic idea suggested by Dagfinn Ilmari Mannsaker <ilmari at github>
>   in https://github.com/Debian/debiman/issues/67 and independently by
>   <Pali dot Rohar at gmail dot com> on <discuss at mandoc dot bsd dot
>   lv>.

Acknowledged.  I didn't want to use heuristics.  To quote the Tao^WZen
of Python: "Explicit is better than implicit."[1]

> > groff's documentation attempts to motivate the macros' presence.
> >=20
> > groff_man(7):
> >    List enclosure macros
> >      Enclose paragraphing macros between LS and LE to identify them
> >      as list items.  Doing so can mark them as "compact", ease
> >      management of their indentation, and supply hints to the output
> >      driver to improve their rendering (as with HTML).  Lists can be
> >      nested.  (Sub)sectioning macro calls, and the end of the
> >      document, close all open lists.
>=20
> Do you recommend closing open lists before ending the section,
> or do you recommend dropping the .LE if it happens to be at the end
> of a section?

I make no recommendation here.  Personally I follow the aforementioned
Zen of Python in man(7) composition.  Or would, if I had cause to use
nested lists in groff's own man pages.  I haven't yet.

> This sentence sounds like the latter.

No, I'm not trying to imply a preference for either.  If I ever have a
reason to recommend one practice over the other, I will do so.  Until
then, my intention is simply to observe the community and see what
patterns arise in use.

> I would probably strongly recommend the former and have the macro set
> warn about missing .LE because many years of experience show that
> forgotten list end macros are a widespread oversight among manual page
> authors, often causing the list to run further than intended.
> For that reason, having the warning about missing .LE seems
> important.

I would agree if `LS`/`LE` weren't designed to be harmlessly skippable
by the many implementations that don't recognize them, including
previous versions of groff and mandoc(1).

> >      These macros are GNU extensions.
>=20
> Using these macros is probably less disruptive than using .MR,
> because lack of support in the formatter will only ruin spacing
> and indentation but not corrupt the text.  Considering that the
> benefit of .LS/.LE is relatively minor, it was indeed important
> to choose such a conservative design.

Yes, that's my view.

> >      .LS type [compactness [indentation]]
>=20
> What is the logical reason for requiring that, to specify the
> indentation, you also need to specify the compactness?

* Employing a compactness flag is what kills off 99%+ of all uses I have
  observed of the `PD` macro.  I seek to exterminate `PD`.

* The man(7) writer can always specify an indentation explicitly as an
  argument to the `IP` and `TP` calls comprising the list items, and
  many will anyway, either for portability to mandoc(1) and older groff,
  or because they're simply accustomed to doing so.

* In many cases I find explicit specification of an indentation amount
  to be unnecessary.  A man(7) author should refrain from doing so
  unless readers are confused by the default indentation.  That will be
  rare.  There _is_ a population of man(7) authors, including myself in
  groff's man pages, who wish to fiddle the typography with precision.
  But that population is small.  I'm trying to nudge the bulk of man(7)
  authors who _don't_ care about those details, and who often resent
  writing a man page at all, from specifying parameters they will tell
  you out loud that they don't care about.  If they feel forced to
  choose a value, they will much more often than not pick a lousy one,
  because there _is_ an art to laying out a page, and artistry demands
  intention, practice, and taste.

* Contriving a new syntax for man(7) macro arguments, like mdoc(7)'s
  `-centered`, `-filled`, `-literal`, `-ragged`, and so forth, which
  look like X11-style Unix command-line options, is a major anti-goal of
  mine.  Nothing in man(7) looks like that and I mean not to make it
  start.  In fact I think this is a bad idea in macro package design
  because the superficial resemblance to the Unix command line is
  misleading and will be overinterpreted by users.  I deplore mm(7) and
  especially mdoc(7) for chasing this blinkered pseudosymmetry.

  man(7)'s macro argument handling is simple and positional, and I mean
  to keep it that way.

* I'm already having to innovate more than I care for with the "literal
  word" argument in the first position, "definition", "enumerated", or
  "itemized".  In 1979 this certainly would have been spelled using an
  integer mapping, or maybe by abbreviation to a single letter.  But
  such an encoding is a bad idea, driven by the punitive nature of
  operating a Teletype machine as a terminal.  By using a whole English
  word, the reader can likely infer what the macro call is doing even if
  they never read the package's man page.

  On a related note, Ada and modern Fortran use language keywords
  excellently.  C and C++ use them horribly; practitioners of these
  language pride themselves on knowing what `static`, `restrict` and
  `auto` mean in multiple contexts and across revisions of the language
  standard.  If we were honest, we'd recognize ourselves as objects of
  pity, having cheerfully invited Ritchie and Stroustrup to bury axe
  blades in our skulls, and then touting our ability to endure pointless
  punishment as a personal virtue to prospective tech sector employers.

> >             (since groff 1.25) Start (or open) a list.  type is one
> >             of "definition", "enumerated", or "itemized".
> >             compactness is a Boolean value directing suppression of
> >             inter-paragraph spacing between list items.
>=20
> That sounds very confusing.  Does "Boolean" mean: either the string
> "0" or the string "1"?  Or what would "true" or "false" mean?  Then,
> "Boolean value directing suppression" sounds vaguely as if "1" might
> mean "suppress", but that's not expressed unambiguously.

You're right; this is the only occurrence of "Boolean" in groff_man(7)
and I need to fix that.  I was carrying over a practice from my
revisions to the groff_mm(7) page, where integral, Boolean-valued
macro arguments are idiomatic.  I'll clarify this.  Thanks!

> Finally, why only *between* list items?  Why not *before each*
> list item?

Because there is already a mechanism for achieving that.

> Would suppressing the vertical spacing before the first list item
> still require .PD 0 *in addition* to "compact"?

No, `.PD 0` is never required under this design; this was an essential
trait since one of my objectives is to exterminate the `PD` macro in the
wild.

One can still _use_ `PD` calls in parallel with `LS`/`LE` if one likes,
and I expect bash(1) to do so, assuming Chet doesn't get cold feet on
using `LS`/`LE` at all.

But, if you mess up your `PD` calls such that compactness breaks, that's
on you.

> >             indentation specifies an indentation amount for the body
> >             of each list item; it is then unnecessary to specify
> >             this argument to the list item macros.
>=20
> That sounds as if the syntax of "indentation" is probably the same
> as for the .IP and .TP "width" argument, but that is not clearly
> stated.  So, what is the syntax?

One can profitably look at the `IP` and `TP` macro descriptions in the
same document and perceive the parallel usage.

     .TP [indentation]
            Set an indented paragraph with a leading unindented tag.
            The macro plants a one=E2=80=90line input trap that honors the =
\c
            escape sequence; text on the next line becomes the tag, set
            without indentation.  Text on subsequent lines is indented
            by indentation, if specified, and by the amount of the IN
            register otherwise.  If the tag, plus the =E2=80=9Ctag spacing=
=E2=80=9D
            stored in the TS register (see section =E2=80=9COptions=E2=80=
=9D below) is
            wider than the indentation, the package breaks the line
            after the tag.
=2E..
     .IP [mark [indentation]]
            Set an indented paragraph with an optional mark.  Arguments,
            if present, are handled as with TP, except that the mark
            argument to IP cannot include a macro call, and the tag
            separation amount stored in the TS register is not enforced.

> >             Use IP with a mark argument to represent an itemized or
> >             enumerated list item, and TP for a definition list item.
> >             Use IP without arguments to associate successive
> >             paragraphs with an existing list item; to these,
> >             inter-paragraph spacing applies even in compact lists.
>=20
> Not sure the phrase staring with "to these" should be advertised so
> prominently.  *If* an author chooses to make a list "compact" but then
> kind of contradicts themselves by inserting paragraph breaks into
> individual list items, the behaviour you describe is probably what the
> formatter should do.
>=20
> But authors ought to be strongly discouraged from doing that.  When
> one or more items of your list are so complicated that they require
> more than one paragraph of text, making your list "compact" makes no
> sense in the first place and will result in ugly and confusing
> typography.

This detail was motivated by the presence of this exact pattern in the
bash(1) man page, which does indeed employ multi-paragraph compact list
items.

I am mindful of my distinct roles as groff maintainer and macro package
programmer on the one hand, and as a coach/advisor on man page
composition practices on the other.

Put differently, I have implemented `LS`/`LE` to provide mechanism.  I
cannot use that mechanism to dictate policy; only to make "good policy"
easier to practice.

> To summarize, after reviewing the design of .LS/.LE, my first
> impression is that it is likely a small-value, small-harm
> addition.

I agree.  Most man(7) documents don't mess with nested lists.  But I
needed a non-heuristic means to smuggle semantic information about list
properties to the grohtml(1) output driver, and saw a couple of other
birds I could kill with the same stone.

> I think i will support them in mandoc(1) -man when
> i find the time, but not emit them from mandoc(1) -T man, at least
> not for many years to come, because the whole point of that output
> mode is dealing with operating systems that use ancient
> manual page formatters, and those are unlikely to support .LS/.LE.

That sounds fine, but, hmm, if you're already heuristically computing
when to bracket list items with `.PD 0` and `.PD`, you're already doing
most of the work it would take to emit `LS` and `LE`.

But I don't think it matters much.

> Chances are the the deeper scrutiny that will be necessary to
> implement .LS/.LE in mandoc(1) may lead to additional criticism;
> or if we are lucky, it may not.

Fingers crossed.

At 2026-08-29T14:51:44+0200, Alejandro Colomar wrote:
> Hi Ingo,
>=20
> > Date: 2026-08-29 13:34:55+0200
> > From: Ingo Schwarze <schwarze@usta.de>
> >
> [...]
> > The mandoc(1) -T man output mode uses
> > [...]
>=20
> Oh, there's a -Tman mode!  That's interesting!  Some years ago,
> I wondered whether groff(1) could have a -Troff mode, which would
> evaluate the man(7) (or any other -m macros, FWIW) macros without
> formatting the document.

I know of no troff that permits this.  In interpretation mode (that is,
"not copy mode"), interpolation and transformation of tokens to nodes
are both operations that occur at the earliest possible opportunity
while interpreting the input stream.

In the past year or so I have revised groff's Texinfo manual to give the
formatter's internals better coverage.

---snip---
5.37 GNU 'troff' Internals
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

GNU 'troff' processes input in three steps.  It gathers one or more
input characters into a "token",(1) (*note GNU troff
Internals-Footnote-1::) the smallest meaningful unit of 'troff' input.
The process of formatting translates tokens into nodes that populate a
pending output line (recall *note Manipulating Filling and
Adjustment::).  A "node" is a data structure representing any object
that may ultimately appear in the output, like a glyph or motion on the
page.  When the pending output line breaks, the formatter applies any
relevant adjustment, line number, and margin character, and finally
appends it to the current diversion.  Periodically, the formatter
"flushes" accumulated output line(s) to the output device, a process
that translates each node into a device-independent output language
representation understood by all output drivers.  Copy mode tokenizes
but does not format; diversions (apart from that at the top level)
format but do not write output.

   For example, GNU 'troff' converts the input 'Gi\[:u]\%seppe' into a
character token for 'g', a character token for 'i', a special character
token for ':u' (representing 'u' with an umlaut), a token encoding a
hyphenation point,(2) (*note GNU troff Internals-Footnote-2::) and
further character tokens.  You can observe this process by storing the
foregoing input into a string--which, because its contents are read in
copy mode, is only tokenized, not formatted--and dumping it with the
'pm' request.(3)  (*note GNU troff Internals-Footnote-3::) (Using
'printf(1)' requires us to double the '\' and '%' characters.)

     $ printf '.ds str Gi\\[:u]\\%%seppe\n.pm str\n' \
         | groff 2>&1 | jq

   Similarly, we can observe the details of the formatting process by
interpolating the string, or supplying its contents directly as input,
and invoking the 'pline' request.

     $ printf 'Gi\\[:u]\\%%seppe\n.pline\n' | groff -z 2>&1 | jq

   We now see a list of nodes, including an output line start node,
several glyph nodes, a discretionary break node containing a glyph node
for the special character ':u' _and_ a glyph node for the special
character 'hy' (hyphen), and a word space node at the end corresponding
to the newline at the end of input.(4)  (*note GNU troff
Internals-Footnote-4::)

   If we change 'G' to 'f', we see that the first two glyph nodes, for
'f' and 'i', become contained by a ligature node (provided the current
font has a glyph for this ligature).  All output glyph nodes are
"processed", which means that they are associated with a given font,
type size, advance width, and so forth.
=2E..
---end snip----

GNU troff's ability to recursively dump string/macro/diversion,
user-defined character, and pending output line contents as a forest of
JSON nodes was a major new feature of groff 1.24.

It's not the same thing by any means as a "wholly macro expanded
document", but given how dynamic a language *roff is, I'm not sure the
goal you had in mind is possible.  A language theorist might be able to
help me devise a proof one way or the other.

Nevertheless, the recursive node dumping feature, as with other new
debugging requests in groff 1.24, forces the formatter to disclose the
truth about its internal state to a degree unprecedented in *roff.

(I'll just be shampooing out the pomade and taking this plaid blazer off
now, thanks.)

> [...]
> > Finally, why only *between* list items?  Why not *before each*
> > list item?  Would suppressing the vertical spacing before the first
> > list item still require .PD 0 *in addition* to "compact"?
>=20
> The idea, I think, is that if you write '.P' surriounding LS/LS,
> you'll get the outer blanks, and if not, you'll get compactness also
> before and/or after the list.

Yes.

> > Not sure the phrase staring with "to these" should be advertised
> > so prominently.  *If* an author chooses to make a list "compact"
> > but then kind of contradicts themselves by inserting paragraph
> > breaks into individual list items, the behaviour you describe is
> > probably what the formatter should do.
>=20
> I'm not convinced about this detail either.  I think in a compact list
> this should not produce a blank line:
>=20
> 	.P
> 	.LE
>=20
> But this should:
>=20
> 	.LE
> 	.P

I disagree.  As presently implemented, they're equivalent.  A `P`
paragraph _does not mark a list item_.  Only `IP` and `TP` do.

I wanted to support the case where a list is interrupted by a paragraph.
It's not uncommon in technical writing.

Here's a contrived example.

$ cat ATTIC/blertch.man
=2ETH blertch 7 2026-08-29 "Blertch language reference"
=2ESH Name
blertch \- a fake language for fake programmers
=2ESH Description
The Blertch language supports the following operators.
=2EP
=2ELS definition 1 \" compact
=2ETP
=2EB a + b
=2ETP
=2EB a \- b
=2ETP
=2EB a * b
=2ETP
=2EB a / b
=2ETP
=2EB a % b
=2EP
It also supports the unary plus and minus operators.
=2EP
=2ETP
=2EB +a
=2ETP
=2EB \-a
=2ELE
=2EP
Operator overloading is not implemented.
$ nroff -rLL=3D72n -man ATTIC/blertch.man
blertch(7)          Miscellaneous Information Manual          blertch(7)

Name
     blertch - a fake language for fake programmers

Description
     The Blertch language supports the following operators.

     a + b
     a - b
     a * b
     a / b
     a % b

     It also supports the unary plus and minus operators.

     +a
     -a

     Operator overloading is not implemented.

Blertch language reference     2026=E2=80=9008=E2=80=9029                  =
   blertch(7)

I can imagine a counterargument.

"But why support interrupting the list that way?  It's _really_ two
lists, so the document author should have to close off the first list
with `LE`, do their 'interrupting' paragraph, then start a new list with
`LS`."

I say no.

The purpose of the macro package is to serve the technical writer and
aid them to communicate.  It is not to serve the HTML/XML weenie who
wants all their tags nested in some canonical fashion.  Sometimes,
technological constraints will propagate backward to our language
designs.  But that's a phenomenon to be regretted, not leaned into.

It's certainly possible that, when I revise grohtml(1) to support output
of the foregoing, I'll have to break this into two HTML lists.  If so,
that's fine.  That's where the problem _should_ be solved.  It should
not be back-propagated onto the document author if we can help it.

> > But authors ought to be strongly discouraged from doing that.
> > When one or more items of your list are so complicated that they
> > require more than one paragraph of text, making your list "compact"
> > makes no sense in the first place and will result in ugly and
> > confusing typography.
>=20
> +1

Again, this is a matter of policy, not mechanism.  My focus in
implementing this feature is on the latter.

Regards,
Branden

[1] https://peps.python.org/pep-0020/

--gfqtrg5l5ns4ya42
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmqTMA8ACgkQ0Z6cfXEm
bc7miA//dWlS4P228J2dGOq69lbaHdSKbgd7WNm4KsxqrhWS++JsGuqlv0UMxM6w
iszkrWCzgurRu0HhwVRtugMAHlwOHZv1BBTUyL7VqgocxxwZ6LNsdMeLFcPFaPji
51fu37NHQcybbTjduW/m2slvNi8GHq2uuzNk8ZBLX7rNbWDK2q9bkIKw+vu9evtq
RN3DbRNhQShBJTEgCGM6S1MicjnFWx/lGocSExyBATafXbV6K1g2LQP0qAGXGupA
J3/giGYDB9ARX+TIhyS0kV+HMZyEwDNiUPqy38uKBOxXPym//UEnpTXyFfYRNXQu
r2VpZk4xZ2djYZeIamBVArXEF3nPHx/7tm/Yap4tO8X9VSoY50mG4D8LzbZoe9o1
tiWkpbpFcA+FVAfO/0vxFX6dBvLJwCRBDGlYAp15kGkuMtbogF/Cdmu1FzH8gNLY
nOPfjfLqq5eIeeIRe7GhXP1gZaaeInK+eeirfQ3ZdacMVJr6KR7nkPJjjBvrnc0+
MFTu5NLP1JADkEtVU4w0rZRw5QTHiPhqhvKsPWatwgka3jIqmA0CR0nHskHFKBzj
I6t31abAdxEvOYMzFj3S8u9LLkLVxjI3atuNwWXngDk6WIr3zYbY1O780riiX5Xl
3JTBpAouUIIq7X0QYNOA7kNZakoAAh8SBY7GZu8KWp2JnDwGQ2A=
=4iuC
-----END PGP SIGNATURE-----

--gfqtrg5l5ns4ya42--
