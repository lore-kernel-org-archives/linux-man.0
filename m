Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EFD31E841
	for <linux-man@vger.kernel.org>; Wed, 15 Jul 2026 19:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784144836; cv=none; b=dRfaPqursc8lQiETiAnHxVpOM9IIUcDU3VX6BTKzISprCaTK+b0ltUVJAbh1CeW+iL7YflhzorMUKezOb/8ivbJWOYXnG1v6D0OrNrcCUY76wMisi34GydBkLUwAX1dZmPBjzuL0sNQEeETK65khDOKTKyFt00bRTqRWiimMN3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784144836; c=relaxed/simple;
	bh=dOJgcQeQ+YR4cEIZ3+u/irVTZqNkf/FCb8iU+fdX8IU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XZEyGzh/2hrM1ERpF0SWsKuuO3T8Cp1TEPy9jqcD5f2PEjlfVukY9WXCqE42YFVogVzhtgJgxCH36nnKZsDMZwxttg4AcosobGBEAqbf5sdLC3IQlxlaakWAplNLPqiabfBZnoVJQV8R8/b9Bt4JAcw+625U3OKRXdySFgKxOlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SnfQvU0/; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SnfQvU0/"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-6611669cd16so2722142d50.0
        for <linux-man@vger.kernel.org>; Wed, 15 Jul 2026 12:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784144834; x=1784749634; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lji8LgWyXiomkvdM3BhOTy3GBmQaBeaOU0SXGg88z+c=;
        b=SnfQvU0/+mf3ANFBZZBEniLF5lKGi0P1G/nWoP7/aoUmR9bCT+atcEI+40q/yKCX5b
         FipHO+zTAI5/g2eVBEXstXIr7SDADIKsv/3m6pR966UGEDAt6ywCxRtaxZUwYoaU9kog
         MPKnGwR7Bj87NVugKL9qug+2ttJYoSwDTr8aWSkfJKk57EK9RffVuvL6G7Vy468z9wH7
         i4rodSxBCKR3px1a0XaSBqftU1sf1r2ToezMNn7wGDtubwlUw2+sLEhn5isnOCZU4BX7
         NAZ6oW3S6mZTcn7Po/HbThqTV/oxkB2smARUj2DgUnA5es9mTCtQiJXOc1AYVWmdOtS8
         VZVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784144834; x=1784749634;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lji8LgWyXiomkvdM3BhOTy3GBmQaBeaOU0SXGg88z+c=;
        b=UU4BD/JkjHGw8tlvR9896NWECywZQJ6h+lNqYUSZ3H6Cqs8K8C02N61IttcbxqWucQ
         KgN3A7uy4r3x6lgrW+KSDqOJqYiUa2wdR03EKbUHclUWK7lx8NeNkjxOeMXnAZYIuMyK
         ZMTsFEK/5RzQ505Y39DiWVWkj1GZnc9G+ugyqQvCpPSqSivs3UGHZiKbpL+RM6YQaO93
         OGwkUoW0h3LCh/WEhdC8B6I5nQyUtpSDzI7jqGRdm0Pj0Vjj7LWMzFH0KI4957NEDsCc
         3tgRQhUjRDSpLym5ETx44+od2yu/929AgWT0ueD+tEqdigUL7qKBW/0fj/DcYJTSAUCZ
         eR+A==
X-Forwarded-Encrypted: i=1; AHgh+RrHkDO2SP5xOcwoSSu9EGQjP2kJsQy6Y8Zh6QufJ2HXCJnikS3l4og7K7BP6OaxS3vNOFXtoUlvid4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0N8r0Nk3k4n+QRAuTgcxVe2GDXB1RcSu9MDE6ykMQru7QaMuf
	vP/NGiR+bG8WQ1dHD5eidBDdoLYCRhhyRF7YupYGUEhdkMyKyyH5SYki
X-Gm-Gg: AfdE7ck4tujaVR9EYAE7ml7fJ/HiQlz4Py7f5gj6DJvxpQ5Gfxo4GfSqzhjqny3Bh4J
	6dMkxwQZiYakQp2StWFhw2mK3Extl1H0F1wWH8JrCl6VVfEcUWghydk/4b587+YcyrvrmAp+tET
	6bnMkTnDtHJBn6o4jCF/qQdyBzO5mDUYkk8++Jy6CIZdx+Qvmt5YingJhbg+ssRIaTn6N0xXiW8
	EK5G9fBy1Hxz1DSoZhcLyDNC4EP6y4oFyo3J120iC4h9xN7nlh1TS+GSpPDQoxRNZQ1qidX9/qU
	VTZaJyiav7Y4xHXqf7Lpw7zA7QuQZPRcjQ85LMFDLgEUaJhKHimHsN/0DA63+iKHEFQgSWvS+pO
	CjEmWX4JkZjZ+4EuLThClHFtbcFjEdRXP7MoZIYpMk3559x5Vya1gL3tyk+o6I3agyfiu4nKIBO
	GGzw==
X-Received: by 2002:a05:690e:2632:b0:660:4936:95d5 with SMTP id 956f58d0204a3-667d7b28232mr9408641d50.40.1784144833471;
        Wed, 15 Jul 2026 12:47:13 -0700 (PDT)
Received: from illithid ([2600:1702:7cd0:e980::41])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6681fdeb112sm1428722d50.13.2026.07.15.12.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 12:47:12 -0700 (PDT)
Date: Wed, 15 Jul 2026 14:47:11 -0500
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: DJ Delorie <dj@redhat.com>
Cc: alx@kernel.org, linux-man@vger.kernel.org
Subject: Re: man/man8/ldconfig.8: document system-wide tunables
Message-ID: <20260715194711.mcdsgtt4x37cwdum@illithid>
References: <20260715165450.iakjkw6qwgcnpzq7@illithid>
 <xnqzl46rp6.fsf@greed.delorie.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="e32dupqjunmoasfh"
Content-Disposition: inline
In-Reply-To: <xnqzl46rp6.fsf@greed.delorie.com>


--e32dupqjunmoasfh
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: man/man8/ldconfig.8: document system-wide tunables
MIME-Version: 1.0

Hi DJ,

At 2026-07-15T14:19:49-0400, DJ Delorie wrote:
> "G. Branden Robinson" <g.branden.robinson@gmail.com> writes:
> > The man(7) package doesn't impose a rigid stylesheet on its output.
>=20
> Perhaps, but the fact that I now know about the rule, and the
> exception, means that it's not entirely flexible either ;-)

The man(7) macro language is not highly flexible, no, but it didn't need
and wasn't meant to be.  If you punch through the floor to raw *roff,
you can acquire some pretty impressive flexibility, but then draw the
ire of the people who write non-*roff interpreters of man(7).  At some
point in the 1990s, a bunch of Linux people got the notion that man(7)
was a markup language like HTML, and started writing a variety of
translators for it, all called "man2html".[0]

Some had little success, others a bit more, but all eventually dashed
themselves on the rocks of a man page that is more ambitious than they
had planned for.

In groff_man_style(7), I urge authors to limit themselves to only the
(non-deprecated) macros of the man(7) package and a small subset of
*roff escape sequences in an effort to keep the peace among those using
*roff formatters, mandoc(1), and man2html and other scrapers and ad-hoc
translators.  That effort in turn serves the goal of making man page
text accessible to as many readers as possible, because it's hard enough
getting programmers to write that documentation, in _any_ language, in
the first place.

We have other objectives for man(7) too, like being able to also render
a publication-quality PDF with a useful navigation pane and hyperlink
support, both internally and externally.

> In this case, it does sound like the man pages need a different thing
> for "example code" (.EX) and "preformatted text" (html's <PRE>).

A common error is to assume that `EX` implies `<PRE>`.  It doesn't.

groff_man_style(7):
            ... An example region is not a =E2=80=9Cliteral mode=E2=80=9D o=
f any sort:
            special character escape sequences must still be used to
            produce correct glyphs for ', -, \, ^, `, and ~ (see
            subsection =E2=80=9CPortability=E2=80=9D below).  Sentence endi=
ngs are still
            detected and supplemental inter=E2=80=90sentence space applied.=
  If
            the amount of supplemental inter=E2=80=90sentence spacing is
            altered, the rendering of, for instance, regular expressions
            using . or ? followed by multiple spaces can change.  Use
            the dummy character escape sequence \& before the spaces.

> Or we need some magic for known types of .SH like SYNOPSIS which are
> almost always rendered differently than other sections.

We _can_ render them differently.  _We have the technology._

   Synopsis macros
     Use SY and YS to summarize syntax using familiar Unix conventions.
     Heirloom Doctools troff (since Git snapshot 151218) and mandoc
     (since 1.14.5) support these GNU extensions; DWB, Plan 9, and
     Solaris troffs do not.

     .SY keyword [suffix]
            Begin synopsis.  Adjustment and automatic hyphenation are
            disabled.  If SY has already been called without a
            corresponding YS, a break is performed.  keyword and any
            suffix are set in bold.  When suffix is present, the package
            sets the next word after it without intervening space.  If a
            break is required in subsequent text (up to a paragraphing,
            sectioning, or YS macro call), lines after the first are
            indented.  Unless the previous synopsis=E2=80=99s indentation is
            reused (see YS below), output lines after the first indent
            by the width of the pending output line up to the end of
            keyword plus a space, if keyword is the only argument, and
            up to the end of suffix otherwise.

     .YS [reuse=E2=80=90indentation]
            End synopsis, breaking the line and restoring indentation,
            adjustment, and hyphenation to their previous states.  If an
            argument is given, the indentation corresponding to the
            previous SY call is reused by the next SY call instead of
            being computed.

But, for those who don't want to employ these extensions, in groff
1.24.0 I undeprecated the `HP` macro (a decision made by Eric Raymond in
about 2008, I think).

     .HP [indentation]
            Set a paragraph with a hanging indentation.  Text on output
            lines after the first is indented by indentation, if
            specified, and by the amount of the IN register otherwise.

            Caution: A hanging indentation cannot be expressed naturally
            in (pure) HTML, a hanging paragraph is not distinguishable
            from an ordinary one if it formats on only one output line,
            and non=E2=80=90roff=E2=80=90based man page interpreters may tr=
eat HP as an
            ordinary paragraph anyway.  Thus, information or
            distinctions you mean to express with indentation may be
            lost.

At long last I've started working on the CSS stylesheet groff
produces,[1] and I expect to finagle up a provision for paragraphs with
hanging indents, since several macro packages, not just man(7), support
them.  It's simply not an urgent matter.  I'd like to get groff 1.25.0
out soon.

> > There is, potentially, a _third_ option, which I mentioned in my
> > earlier email.  As I said, literally no one expressed interest.
> >
> > https://lore.kernel.org/linux-man/xno6ge8p38.fsf@greed.delorie.com/T/#m=
9fda91ba28ca257c67d4595f81d38b32c5c9c937
>=20
> glibc uses texinfo, which is TeX but terminals don't have **** off ;-)

Yes.  And info(1) sometimes produces...intriguing results.

1.6 Output Devices
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

GNU 'troff''s output is in a device-independent page description
language.

=2E..

   Delimiter syntax is flexible (and laborious to describe) primarily
for historical reasons; the foregoing restrictions need be kept in mind
mainly when using GNU 'troff' in AT&T compatibility mode.  Normally, GNU
'troff' keeps track of the nesting depth of escape sequence
interpolations, so the only characters you need to avoid using as
delimiters are those that appear in the arguments you input, not those
that result from interpolation.  Typically, ''' works fine.(4)  (*note
Delimiters-Footnote-4::)

Is the neutral apostrophe of syntactical import in the language you're
documenting with Texinfo?  Tough.

I guess there is a Law of Conservation of ****ing Off.

> I think of texinfo as a "TeX compiler".

That's an excellent way to think of it.  TeX and troff are both
Turing-complete languages.

> I don't write programs in assembly either (well, usually ;).

No indeed.  The real "assembly language" of troff is its
"device-independent output", which for short I call "trout" if it's
Kernighan's original spec from CSTR #97 in 1982, or "grout" if it
features groff's extensions.

Here's an example from a test script I have, in shell, for grotty(1).

input=3D'#
x T ascii
x res 240 24 40
x init
p 1
x font 1 R
f 1
s 10
V 40
H 0
m d
D F d
t 1234567890123456
n 40 0
V 80
H 0
t abcdef
w
h 48
t ijklmnop
n 40 0
V 120
H 0
t abcdefg
w
h 24
t ijklmnop
n 40 0
x trailer
V 120
x stop
#'

> I've always advocated for "whatever system means the docs are stored
> and edited with the code, that I can turn into whatever I need."
> Roff, html, texinfo, markup, whatever.  I know how to write
> converters.

That's a good idea.  And Pandoc can help where knowledge is lacking.

I've soured completely on the notion of a uniform documentation format
for all domains.  We've seen world conquerors come and go across
multiple generations.  They either give up, or proclaim that the
limitations of their selected champion are not really limitations at
all, and that everyone else is stupid to complain.

Again, _that people write useful documentation at all_ is my primary
concern.  I decided that I could be of aid in keeping groff and man(7)
fit for purpose, when one's already decided those are the tools they're
going to use, or the project they work with has decided for them.

> DJGPP had a rule about "every .c must have a .txh" where the .txh was
> a texinfo snippet, and these had meta-info in them so the tools knew
> where to put them in the manual.  gEDA's pcb had a "comments in code
> become manual" system that used a short perl script to merge
> everything.  Etc.

Yup.  Done well, literate programming is wonderful!

> Yes, I know why the man pages are separate.  I've advocated for the
> glibc project to maintain its man pages along with the sources that
> affect them, but it's easier to just have glibc developers be man page
> contributors too.

At one time, Texinfo was one of those world conquerors.  Like groff, it
had a stretch where it went nearly completely moribund.  (Actually,
groff had more like two of those.)

> > It's the sort of thing I'd try out were I on a mission to eradicate
> > `in` request usage from the man-pages project's documents, but I
> > have no such mission.
>=20
> Nor do I, but I wondered if there was a programmatic way to automate
> this so that the authors don't need to worry about it.  My general
> rule is "the third time you repeat something, automate it."

You have more patience than I do, then.  The _second_ time I find myself
doing something manually, I start writing a script, and spend much more
time refining it than I would have just doing the tedious thing again.
But I have more fun, and if I have to undertake the noxious task a third
time, I'm ready.  :)

> I still don't have a robot lawn mower, though ;-)

Chaotic environments mess up our automatons.  Trash blows into the yard
(or is discarded there by neighbors).  Wildlife learns to screw with the
machine.[2]  Or a contributor brings you a present.[3]

> >> Now I wonder if the problem case is predictable enough to have the
> >> preprocessor *know* when .EX needs the .in +4n, and when it
> >> doesn't...
> >
> > What preprocessor?
>=20
> Whatever "sed" scripts we run in the Makefiles, that's all.  Currently
> they just fill in the .TH data.

Indentation revision, and wholesale request (or macro call) insertion,
seems like a job of slightly greater magnitude.

> > As I understand it, one of Alex's objectives, as was Michael's
> > before, is to keep the files in the man/man* directories directly
> > renderable with "man -l".
>=20
> I agree with that!
>=20
> I just think we could relax the "and must be formatted exactly as a
> release" a bit, in exchange for making it easier to contribute by
> removing one or two rules the contributors need to know.
>=20
> But that assumes that it's (1) purely cosmetic, and (2) automatable.
> I note that "man" formats according to the window's width, so even the
> official tools don't honor the "and formatted exactly as" rule.

Yes, but people get _really wedded_ to the specifics of rendering even
after setting aside the huge issue of terminal width.  The podlators
maintainer, for example, has exacting expectations about the widths of
paragraph indentations, a parameter that has been tunable at rendering
time _since 1980_.

groff_man(7):

Options
=2E..
     -rIN=3Dstandard=E2=80=90indentation
              Set the default indentation amount used by IP, TP, and HP,
              and the inset amount used by RS.  The default is 7n on
              terminals and 7.2n on typesetters.  Use only integer
              multiples of unit =E2=80=9Cn=E2=80=9D on terminals for consis=
tent
              indentation.
=2E..
   History
=2E..
     UC appeared in 3BSD (1980).  Unix System III (1980) introduced P
     and exposed the registers IN and LL, which had been internal to
     Seventh Edition Unix man.  ...

> (wait, when did "man -l" happen?  Have I been missing that all along?
> Is my script really that old?)

In the man-db implementation of man(1), it seems to date back to _at
least_ 2002, as I see a Git commit for it (imported from CVS or
Subversion or something) mentioning it as an already existing feature.

commit 5ca206194b7bda56d1d4cbfb0a9ee401c5ea9a7b
Author: Colin Watson <cjwatson@debian.org>
Date:   Sun Sep 14 15:58:58 2003 +0000

    * src/encodings.c (get_source_encoding): Assume ISO-8859-1 source
    encoding if it's unknown (e.g. 'man -l').
    (get_default_device): source_encoding can no longer be NULL.
    * src/man.c (make_roff_command): Likewise.

If you are/were using Red Hat/RPM-based systems, you may have been using
Brouwer/Lucifredi man(1), which as far as I know never implemented this
`-l` option.  After that implementation lay moribund for many years,
Fedora threw in the NIH towel in, apparently, 2010.[4]

Regards,
Branden

[0] https://invisible-island.net/scripts/man2html.html#same-name
[1] https://lists.gnu.org/archive/html/groff-commit/2026-07/msg00096.html
    https://lists.gnu.org/archive/html/groff-commit/2026-07/msg00098.html
[2] https://www.reddit.com/r/Unexpected/comments/9hek1m/like_a_boss/
[3] https://gitlab.com/procps-ng/procps/blob/7ac9a0e1f5606696dc799b773d5ec7=
0183ca91a3/ps/ps.1
[4] https://pagure.io/fork/evana/fedora-comps/c/fb4ab73d9eff9f06330bc8cb6fd=
aba9a0b418bcc?branch=3D0231a510e78ca62533cdd473914bba725050c85a

--e32dupqjunmoasfh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmpX47cACgkQ0Z6cfXEm
bc7aLA/5ARjr9ppBZ3LX80D8mptz2k4FewoaDWETL8gKOGNFmnN14S8qYCh5bilv
1K8/VN990bnwCc7+oGGbAhKqTQ/8BdWxNsqvx8sLOZULXrm4mnbnhKuej0GV7Nnn
tvkpHty+B3V14C+UQ9ZkNClBwb+ehA01b+dzaIfD7yQce0YfQbEHZs3Vq3lI+gJL
BvFxBsdH+rjz5PIdW9/7A2y/2BQNsiXZsXXdeRPxBaBsBnjVFNHyMon4klREBbZs
gJ2Rp95cG36sdW2r2cQGH3UPMGgla8KorRtFp9m/IAJCISskehSEVX3oKuFhw8ga
qx1EsjVB75AKGtlxnjxfY9HRPDUpKtAyud5H1/uwmDw4K6S12OrLz8zDUk1P1bA0
wQFe3T4o3VICV6e0QfoG8C2tl4qbyUmu8QqavHwDGRkNXjGaPILp3sMTYcevusPK
iSV2YukB8aOLaAVRpIplmdd5Qd3JMlddd0fvoqQS5NVhPdJsgUMvk5GJsMq3qpeY
GqZNy5p9BIk9Wg/6QKAcnHNqeSnSWBw0V1F/6cQ2V9LLo6wDFHNGdGFp9EUtpq/h
yfCN70NSo1+/Rp4kywTR62qDmpvvHIU+TfTAa6ccUEAcCmTrLZerAClBANbWhGZP
p7bom859NlWMJtA+kOOr1xJI1EBvn5CBE6tFT0UunXftqRYLRKE=
=DCtc
-----END PGP SIGNATURE-----

--e32dupqjunmoasfh--
