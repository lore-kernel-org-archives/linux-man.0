Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AF526AC5
	for <linux-man@vger.kernel.org>; Sun, 23 Aug 2026 20:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787517661; cv=none; b=O8/+DL0IkyOO6kLOfi5f61iwYra7MBmGh8iMIEWRLKKb43EnmDEVcY/aPJsyTWmX+Vceym2L6F2Mcncg7NP6qPAl9Q9I1cDejKaGmWrllM+DAxHwdDqKx30EEpRn1E9bLyMJY8WD+97XHRRu8FPr/hTqk5UDD8hmqdp8/xgY9Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787517661; c=relaxed/simple;
	bh=pzR5e15mxtKIO5D1oijDvC0FYVCSfTaU+6YqRK3T5KI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pEzaA1y1VRMVe6C0JOy8uzKhpfUItjljXb5G1lflV6JNC/YevsnZIsPcJKpHh3NmGFwezXpkEWCCMrFvzHbI/RmWWD+0tVjch6E+zkM9z0XL8SnG8ua4OVzpGZyn4ZhZRVq9Z8Xx99GNprpl5mvXglPHB6GMGXRE4BPAA0/tDu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bEzDq7Uh; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bEzDq7Uh"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-66c82b32121so4101254d50.1
        for <linux-man@vger.kernel.org>; Sun, 23 Aug 2026 13:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787517655; x=1788122455; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6lQby/UTukGvXnq66fgNzg18RcC5ZAfVfxzThTtpcXE=;
        b=bEzDq7UhGpTBI3yy7VJyAKolH/57eNUzbZVLKfqSCTFcbR8lW7WFKHeJqryeK10eoH
         15a7uc1bVIcnzdlnV3k+Rv6ewuvRYUxD6qY/SFsD2+J7Y0m3MrIEXUoyF0r0OFcDXBnw
         LKsnGCNGfJFM9dRjT8Uvig5UjWIfCx8pDB7Z8tIgWjyS/6vY38EJhuT+6g4uv3BgBNin
         jFS0TDDrhTNeFxYvDIfafSlp059CsJhzcKnHjQSokMh4gZSlxcpZf23eGDw00bo2Tng8
         kUPpsTiEADNQrhgSzjVwMa6dNGQcakPFq4qzmpxqZikVG6sPmsjoifHKXOpIU07wpTgy
         XTow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787517655; x=1788122455;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6lQby/UTukGvXnq66fgNzg18RcC5ZAfVfxzThTtpcXE=;
        b=gULkCIiVS9oa4c9zlAh0nKGNslUdnrV9VdA6Z1Mz0kp1D0zgDOwj9ikfqbXCHebvzx
         mFyUTmCMril0aipHVZ0NelgWwxnwJcmy4CvQ5NEo8NuJZpvFchWKNKQiV8EazuPe/4O3
         DYO+olCXMWEcxJnMj1WV4DB630OPXRMUQOdY5xoNEwJB+WhtsL6b89H03it1IBDM8sl7
         y81UIf0fNULvCTZa4/MuYzTY5ivsC/XVQhIUscdfthyMaSU1TzJcG+dmxrT1EFSaMbkq
         o8C2OyrLqyM31p83wvXQzJBYoXCkbtzjCifL+26uPgT8tJUeEQlvwHXUXMlrZvaZrMJ+
         bpMg==
X-Gm-Message-State: AFuF++nWvqjLFcHh3ZhcTDDlhNQ/08+g+4QDT0Ct8jnZUtgDgeeGYzxr
	nNc9uAyvcUjoCk1OF7c3PfK9atW6hE16dfylVdjv3QeMJ5SX25JUaMNZ1x24QA==
X-Gm-Gg: AR+sD13u89UtIy85ch1RdzCeW72oxrcW34BbzxbrDQt0hap2b32yXpmrrMIvG1aTZpP
	oKS2wMhGL5+reL9G+e6DAxIXnJi4FSIFEi0inp+ZPU4VQ4WiB0L41QiIVj2BL3g0neeB6FVhsk0
	7fXoYNfRGm2bynhTeJiuMtRJdp3t7dwX3pl6oSHIIl0erOfieKVUAzZwC+iSFyDcQPl68Lme4Zp
	OgAV8XCc4o+1oX3OtCa7Bi9hMjlUVTNwcALSvGJ8iDicAzHel05t2ChNjBVz0PZnyVSJEDf5Utq
	wmICmsjVBcXJ0sNfIhPQqSwpmHI9yaYPRbxCaynBApQbGO65YnMmg5BgbsdGTmOdtptHguCykDF
	vXipqLekiuKjMTbPWoR0YpDc4+WoDYyT28x3+oOqQnPNcyCnIYEQCynG6+K9r0oh7I9vwn9sTPI
	V+dyvzeqWdNGpcYuT4fSSDLStVTZWungrbi5Q8lpebTcUAYg4RIA==
X-Received: by 2002:a53:ac9d:0:b0:66c:9f99:9133 with SMTP id 956f58d0204a3-66cf21bc69cmr4682534d50.29.1787517655363;
        Sun, 23 Aug 2026 13:40:55 -0700 (PDT)
Received: from illithid ([2600:1702:7cd0:e980::41])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-84caabb9e7bsm24137347b3.28.2026.08.23.13.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 13:40:53 -0700 (PDT)
Date: Sun, 23 Aug 2026 15:40:51 -0500
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org, groff@gnu.org
Subject: Re: Using LS/LE (was: [PATCH v4 2/4] man/man5/tunables.conf:
 Document system-wide tunables config)
Message-ID: <20260823204051.mkcgwghlljq7fqic@illithid>
References: <anTugcvjragzGpSK@devuan>
 <xn33wr3rr8.fsf@greed.delorie.com>
 <20260807021256.pwzsls7awqmbslti@illithid>
 <aorlBv8YTu4JlZcy@devuan>
 <20260823132749.pgypzsqv32n67wor@illithid>
 <aor4LIdGrSGHe3TB@devuan>
 <20260823141622.7vszwghxrxvkff4j@illithid>
 <aosHFaauEzKEFNpl@devuan>
 <20260823164451.5jeolmdu44ubpeba@illithid>
 <aotFzewQhmLJSk6N@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dguaemu7uk3ofhug"
Content-Disposition: inline
In-Reply-To: <aotFzewQhmLJSk6N@devuan>


--dguaemu7uk3ofhug
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Using LS/LE (was: [PATCH v4 2/4] man/man5/tunables.conf:
 Document system-wide tunables config)
MIME-Version: 1.0

Hi Alex,

At 2026-08-23T21:30:53+0200, Alejandro Colomar wrote:
> > Date: 2026-08-23 11:44:51-0500
> > From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
> >
> > [looping in groff list because Alex brought to my attention an item
> > of work on the new man(7) `LS` and `LE` macros that needs to be
> > done]
> > At 2026-08-23T17:06:16+0200, Alejandro Colomar wrote:
> > > I dislike autotools for that and other reasons.
> >=20
> > Autoconf, Automake, and Libtool, the collective "autotools", are all
> > strongly distinguishable in purpose.
>=20
> I guess if you deal with them enough, you get to distinguish them.  In
> shadow-utils, where we have an autotools-based build system, I
> consistently avoid to learn it.  I leave it up to the other
> maintainers and the distro maintainers to keep it working.  I only
> report the issues to them.  To me, it'd be easier to wipe it all and
> write a Makefile from scratch than learning the tools.  The day I have
> to maintain that, I'll probably do so.  But distro maintainers don't
> want that, and so they keep helping maintain it.

Sometimes success looks like that.  :)

> > Autoconf is a brilliant idea, very well executed.  I suspect that
> > many of its its detractors possess a constellation of negative
> > traits:
> >=20
> > 1.  They're not terribly competent at writing portable shell
> >     scripts;
>=20
> I believe I'm quite competent writing shell scripts.  :)

=46rom what I've seen, I think you're right.  :)
>=20
> > 2.  they refuse to understand the very simple principle of operation
> >     of the m4 macro language; and
>=20
> I have the 2nd negative trait, though.

Nobody has time to learn everything.  But I take a dim view of refusal
to learn things for bad reasons.  It can be hard to judge, and for sure
to know exactly what a person's reasons are, because even if they don't
misrepresent those reasons to others, they might lack the self-awareness
necessary to know why they don't do things.

For example, when I procrastinate a task, I often find myself trying to
figure out post facto why I did so, after I get around to doing it.

Often, I expect that a task will be more difficult than it turns out to
be.  I let myself get unnecessarily daunted.

But, speaking only for myself, getting the "gist" of a nearly pure macro
expansion engine like m4 was extremely useful in a way that I didn't
appreciate at the time, because the way I learned to think about m4
ended up helping me to understand how *roff works.  *roff is a very
_impure_ macro expansion engine.  Lots of extra stuff piled on.  :)

Doug McIlroy has a lovely presentation.

https://www.cs.dartmouth.edu/~doug/barem4.m4

For those who fear to read M4 even when commented, the concepts are also
discussed in this Computer History Museum oral history interview.

https://archive.computerhistory.org/resources/access/text/2019/11/102740539=
-05-01-acc.pdf

> > 3.  they refuse to believe that the variety of possible deployment
> >     environments is as wide as it is.
>=20
> I acknowledge this.  However, some people refuse to believe that
> hand-crafted makefiles can also handle quite different environments
> too.  I believe makefiles can do that just fine.  It's a matter of how
> much makefile code you write.

I wouldn't have ventured an opinion either way; I'm confident GNU Make
is up to the challenge, but less sure about POSIX Issue 8 make(1).

> In the Linux man-pages project, we have 120 kB of makefiles.
>=20
> 	$ find share/mk/ -type f | xargs wc -c GNUmakefile | tail -n1
> 	119125 total
>=20
> I believe that a set of makefiles that would handle all of the targets
> of a project like groff wouldn't take much more than that.  It might
> be a few hundred kB.  If it's well organized, it can be maintainable.

I was going to venture that groff's Automake files added up to much less
than that.  It's less--but not "much".

$ wc -c $(find -name "*.am" | grep -v gnulib | sort)
 31886 ./Makefile.am
  1245 ./arch/mingw/mingw.am
  1295 ./arch/misc/misc.am
  3554 ./contrib/chem/chem.am
  1324 ./contrib/eqn2graph/eqn2graph.am
  2247 ./contrib/gdiffmk/gdiffmk.am
  2400 ./contrib/glilypond/glilypond.am
  1583 ./contrib/gperl/gperl.am
  1842 ./contrib/gpinyin/gpinyin.am
  1331 ./contrib/grap2graph/grap2graph.am
  4559 ./contrib/hdtbl/hdtbl.am
  1046 ./contrib/install-font/install-font.am
  6150 ./contrib/mm/mm.am
  5966 ./contrib/mom/mom.am
  1312 ./contrib/pic2graph/pic2graph.am
  1281 ./contrib/rfc1345/rfc1345.am
  2646 ./contrib/sboxes/sboxes.am
 31579 ./doc/doc.am
  2210 ./font/devX100-12/devX100-12.am
  2089 ./font/devX100/devX100.am
  2175 ./font/devX75-12/devX75-12.am
  2056 ./font/devX75/devX75.am
  1757 ./font/devascii/devascii.am
  2858 ./font/devdvi/devdvi.am
  2496 ./font/devhtml/devhtml.am
  1781 ./font/devlatin1/devlatin1.am
  1739 ./font/devlbp/devlbp.am
  2956 ./font/devlj4/devlj4.am
  8531 ./font/devpdf/devpdf.am
  5580 ./font/devps/devps.am
  2387 ./font/devutf8/devutf8.am
  1047 ./font/scripts/scripts.am
  1331 ./man/man.am
  1290 ./src/devices/grodvi/grodvi.am
  1597 ./src/devices/grohtml/grohtml.am
  1357 ./src/devices/grolbp/grolbp.am
  1295 ./src/devices/grolj4/grolj4.am
  2232 ./src/devices/gropdf/gropdf.am
  1637 ./src/devices/grops/grops.am
  1589 ./src/devices/grotty/grotty.am
  4372 ./src/devices/xditview/xditview.am
  1508 ./src/include/include.am
  1048 ./src/libs/libbib/libbib.am
   987 ./src/libs/libdriver/libdriver.am
  3625 ./src/libs/libgroff/libgroff.am
  1150 ./src/libs/libxutil/libxutil.am
  3571 ./src/preproc/eqn/eqn.am
  1398 ./src/preproc/grn/grn.am
  1149 ./src/preproc/html/html.am
  2689 ./src/preproc/pic/pic.am
  1356 ./src/preproc/preconv/preconv.am
  2838 ./src/preproc/refer/refer.am
  1317 ./src/preproc/soelim/soelim.am
  2785 ./src/preproc/tbl/tbl.am
  9555 ./src/roff/groff/groff.am
  1528 ./src/roff/nroff/nroff.am
  2112 ./src/roff/troff/troff.am
  1227 ./src/utils/addftinfo/addftinfo.am
  1686 ./src/utils/afmtodit/afmtodit.am
  1758 ./src/utils/grog/grog.am
  1033 ./src/utils/hpftodit/hpftodit.am
  2085 ./src/utils/indxbib/indxbib.am
  1109 ./src/utils/lkbib/lkbib.am
  1098 ./src/utils/lookbib/lookbib.am
  1443 ./src/utils/pdfmom/pdfmom.am
  1200 ./src/utils/pfbtops/pfbtops.am
  1027 ./src/utils/tfmtodit/tfmtodit.am
  1468 ./src/utils/xtotroff/xtotroff.am
 15018 ./tmac/tmac.am
228376 total

228kB is an order of magnitude higher than I'd have guessed.  But I
should have known better--from bitter experience I should have intuited
that the "doc.am" beast alone defeats any such notion.

That's always the most troublesome of our Automake scripts, because we
use the groff that we build to produce further artifacts.  It therefore
functions in part as an acceptance test.

> Because the makefile language is so simple, bugs are easy to spot and
> fix, compared to autotools (possibly automake, but I can't distinguish
> them enough).

Apart from needing an awareness of Automake's special variable names,
which employ a naming scheme that one tends to notice, I can almost
always get by writing an Automake script using only "make(1) brain",
which is one reason I've been such crap at actually _learning_ Automake.

I more often have problems writing Automake scripts that will maintain
portability between GNU Make and BSD Make, which is a constraint
entirely of my own choosing.

> Oh, yeah, I agree with everyone here.  CMake is way worse than
> autotools.  autotools is the least evil of the non-pure-makefile build
> systems.

I'm curious to hear your opinion of meson/ninja.

> > Hmm, no release since 4.4 on Halloween 2022.  Yeah, they might be
> > due.
>=20
> Yup, I've been pinging Paul a few times in the last years.  But I gave
> up last year.

I don't begrudge Paul D. Smith a victory lap/vacation after the triumph
of POSIX Issue 8 blessing so many GNU Make extensions.  :)

But each one justified itself more than adequately.

This document remains useful.

https://gist.github.com/Earnestly/29deee4f18346da6630ed1df760f1590

> > Yes, but the tarballs get tested in a greater diversity of
> > environments.  While I keep git HEAD "green"--I don't "git push"
> > unless "make distcheck" runs successfully--that applies only to my
> > personal development environment.  groff doesn't have a CI
> > infrastructure.
> >=20
> > The build system is the thing that consistently gives us the most
> > pain when trying to firm up a release.  So right now you are pulling
> > on HEAD at its most fragile, ironically.  The code quality should be
> > good, _if_ you can get the build to completion.
>=20
> I'm happy to uncover those bugs; it's not a problem.

I appreciate your patience.  It's hard not to feel like every problem
discovered in an RC reflects a maintainership failure on my part.

Intellectually, I know that's not how collaborative software development
works.  Psychologically, I want everything I produce to be so perfect
that it inspires envy.  :)

> Why not this?:
>=20
> 	.LE
> 	.P

Good idea!  This slots right in with no changes at all to the man(7)
package.  All of mandoc(1)'s complaints are as expected.

$ mandoc -T lint ATTIC/inline-compact-list.man
mandoc: ATTIC/inline-compact-list.man:9:2: ERROR: skipping unknown macro: .=
LS itemized 1 4n
mandoc: ATTIC/inline-compact-list.man:18:2: ERROR: skipping unknown macro: =
=2ELE
mandoc: ATTIC/inline-compact-list.man:1:5: STYLE: lower case character in d=
ocument title: TH foo
mandoc: ATTIC/inline-compact-list.man:10:2: WARNING: skipping paragraph mac=
ro: PP empty

(I expect the third of those ("STYLE") to go away when Ingo makes his
next mandoc(1) release.)

So that's one fewer problem I have to solve.  Thanks!

But I just found a different one to replace it.  groff_man(7) says:

            ...  Use IP without arguments to associate successive
            paragraphs with an existing list item; to these, inter=E2=80=90
            paragraph spacing applies even in compact lists.

=2E..but that last clause is not working.  I'll work on that.

> You might use compactness keywords:
>=20
> 	.LS itemized precompact
>=20
> You could have 'precompact', 'postcompact', 'compact', and
> 'noncompact' (feel free to use names that aren't so terrible).

This might now not be necessary at all; people can simply use your
idiom.  `P` (and its synonyms `LP` and `PP`) always apply
inter-paragraphing spacing even in compact lists.  That's on purpose,
because sometimes a document uses compact lists where an item requires
multiple paragraphs, or interrupts the list with commentary.

I like your idiom of sticking `P` after the `LS` and/or the `LE` calls
as and where one wants inter-paragraph spacing before and/or after the
(compact) list.  I had designed the macros with that in mind, but had
not thought of that simple way to express it.

A list item per se starts with either:

* an argumentful `IP` macro call (for itemized or enumerated lists); or
* a `TP` macro call (for definition lists).

To recap, I have two macro programming problems to solve for RC3.

1.  Argumentless `IP` needs to apply inter-paragraph spacing even to
    items in compact lists.

2.  `LE` needs to break the line and cancel any indentation implied by
    the open list even when not followed immediately by a paragraphing
    macro.

Regards,
Branden

--dguaemu7uk3ofhug
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmqLWswACgkQ0Z6cfXEm
bc5jjg//fmK/V6XiqwXx7sTLcRl6CLqP5nUsGvziq0YgoUIhUkUcMu7psAbytQln
2vCbt2CPuF+PoIiPv4LxelBlaU25JB9CURTCXw6/thWPWRTcjz5jAb3u2Mzs4ikN
0BH1NYcm+atFr6FfVrUIULDyqi/U2Fraa4tMsXSwWlR7OmiVSZQ+ds7c8o17ibw+
8ay+NFERb5sBOskXGrdceEqa2kdEV14JxolvV/QwFoE5UoA382P8ULFLiklWb8K+
3YsC+A2Vq3uHKZTKD+XVikeaIeAA6b84xB2FYFtWl7Gyaixn+WNFlv3zs8epJPJL
K/Y9dUBKOMACTH+jWJn5dvYfIgY6S8SienoN9l35GChPgPVzl+mqecm+pqI4ICM3
dyhN4xublenhGmFBGIpFhLYTlyG8IU6HfLraHSBqrg5MybktgGU7b7GaQy1zCNNk
pwESloKwNr5LIpsfcWX4Jh2bDsaOKhYavF5VsFUadxe8S+4KjX/pMiOmfsD0CicN
aBHZD8Mzr4SeJPCHuq/+SNJNmkPBVCLfYsuTNxOUwQksULBABitSmJVgfKA7NzqS
OdNMI5QmLxRfhcHjY83WWp5DZPwiztE1bNc2dGb24re/9+ctRWnUMldEG3iPnWC3
LGipteONcg/PMDWsqSj1RST/rHL+wH/xIcdRnfFcWbmw0CWk4Ek=
=Kc58
-----END PGP SIGNATURE-----

--dguaemu7uk3ofhug--
