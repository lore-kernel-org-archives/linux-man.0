Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB6838F920
	for <linux-man@vger.kernel.org>; Tue,  4 Aug 2026 23:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785884842; cv=none; b=JMbFp1HRaLfGWgqqkZRpnKtFUmAXs3rgpNFyJHZRuWWWmr+HBGx0KQ4ZNtPI/hKia/qSldjK6UnvsGWceXRCZSiw6LneEkSIsIGWko+K+7zXRXulYHrLtRXxczTJ4wX07BIVPls8JVKWtLkWHAmFBZZI9gpRjDghMa37MXwOouM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785884842; c=relaxed/simple;
	bh=9gUHJ6jG1ZFDDkqFSnUOTv6c5AlJpwdx0UY5fa+quns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nuho9TQmwx2VT6xnVHLmlguPIrVNcnREvvdg2fBLN1aCT4x8h0pP205PRQlcpVjZNEO0+m5tvFju5VF/WnwksYBzkSmLsfvfNQM0aJkR1c6PWJcVuf3uPI6VqDvsR7T6ebUTiWmAS9QKW5EiA4kDk1OFYbwaKM9qdLVfC02roHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=csKIkwOB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="csKIkwOB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEC821F000E9;
	Tue,  4 Aug 2026 23:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785884840;
	bh=bp+AERz8xpB4uJKTODrGKfqX3Smv72dsseKPNNBsyzg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=csKIkwOBq+YE7dXGE2SuDjYts5WX/goe/Fk4vV6pfNWUpLxdDTJnkU8QeGmx7Aqiv
	 hzs933jeh/iQq70W6A5kxcoJ1OpGuQo8FtLShPzeRfcoSNC5RN3a9tNNciYDD/0Gbb
	 zfgnBlIxS29xiYedJwuCxVDeSyB6yoiu9kDJfWW1NQ7USnlMtOmduFtcVPYDsOv1Tl
	 YrUnk0M6JII331lCkCn57e7KPWO1Z8mIcaggRoy4wtBnkVvjL/szQSJKLBr8tmCHGB
	 q6wLzfl10WugAqU3hp1ydn/mBx57GP/FYWccOkjQq0YkGOR9DpARAI9SjCtaHno32H
	 4IqohAFnrCJKg==
Date: Wed, 5 Aug 2026 01:07:17 +0200
From: Alejandro Colomar <alx@kernel.org>
To: DJ Delorie <dj@redhat.com>
Cc: linux-man@vger.kernel.org, libc-alpha@sourceware.org
Subject: Re: The goal of the Linux man-pages project
Message-ID: <anJZza-qbi_y5r1N@devuan>
References: <anIaZ8X_73ZjmYtR@devuan>
 <xnwlu54ppz.fsf@greed.delorie.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vmn4hvvovmbv37fq"
Content-Disposition: inline
In-Reply-To: <xnwlu54ppz.fsf@greed.delorie.com>


--vmn4hvvovmbv37fq
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: DJ Delorie <dj@redhat.com>
Cc: linux-man@vger.kernel.org, libc-alpha@sourceware.org
Subject: Re: The goal of the Linux man-pages project
Message-ID: <anJZza-qbi_y5r1N@devuan>
References: <anIaZ8X_73ZjmYtR@devuan>
 <xnwlu54ppz.fsf@greed.delorie.com>
MIME-Version: 1.0
In-Reply-To: <xnwlu54ppz.fsf@greed.delorie.com>

Hi DJ,

> Date: 2026-08-04 16:04:24-0400
> From: DJ Delorie <dj@redhat.com>
>
> What follows is my opinion.  You are free to have a different opinion,
> but please don't tell me my opinion is wrong ;-)

Of course.  I'll only tell you where I agree, and where I (and others)
disagree.  But you're right to defend it.  :-)

> Alejandro Colomar <alx@kernel.org> writes:
> > It's the Linux Programmer's Manual, and its purpose is that
> > programmers on a Linux system are able to write correct programs.
>=20
> I think I disagree with the scope of "write correct programs" here.
> "Write programs that use the APIs in a way that won't break" is not the
> same as "write programs that use best practices", but "correct" covers
> both.
>=20
> > The purpose of this documentation is not, and was never supposed to be,
> > a technical specification of the implementation.
>=20
> In the past, that's exactly what man pages were.

The 'past' is too broad.  Let's clarify that a bit before continuing.

In the times of V7 Unix, yes, that's (probably) exactly what man pages
were.  I want to produce a modern PDF of the old manuals, which would
help me read those and come to my own conclusion, but from what I've
heard, that seems to be what they were.

At some point, that started to change.

The Linux manual pages, as of its first release (1.0, in 1993), the page
gets(3) --by Thomas Koenig-- said this about the function:

     Because it is impossible to tell without knowing the  data
     in  advance  how many characters gets() will read, and be=E2=80=90
     cause gets() will continue to store  characters  past  the
     end  of  the buffer, it is extremely dangerous to use.  It
     has been used to break computer security.  Use fgets() in=E2=80=90
     stead.

I suspect that if things like this weren't common earlier, it's because
such problems often had not yet been discovered, and so 'best practices'
wasn't yet a thing.

You could argue that since there's no way to use this API without
breaking the program, this is within scope.

man-pages-1.2 (also 1993), says this about sprintf(3):

     Because sprintf and vsprintf assume  an  arbitrarily  long
     string, callers must be careful not to overflow the actual
     space;  this  is often impossible to assure. Note that the
     length of the strings  produced  is  locale=E2=80=90dependent  and
     difficult  to predict.  Use snprintf and vsnprintf instead
     (or asprintf and vasprintf).

That text seems to have been derived from the 4.4BSD page.  The text was
added to the 4.4BSD page in 1991 by Keith Bostic
<https://github.com/dspinellis/unix-history-repo/commit/f2e7cd24c8ac>:

     Because sprintf() and vsprintf() assume an infinitely long
     string, callers must be careful not to overflow the actual
     space;  this  is  often impossible to assure.  For safety,
     programmers should use the snprintf()  interface  instead.
     Unfortunately, this interface is not portable.

This is more in the territory of best practices.  Programs can perfectly
use sprintf(3) if they fully control the input and use a specific
locale.  This is, in fact, the reason why sprintf(3) still exists: there
are legitimate users.  It's at the limit of being another gets(3), but
it isn't.

In man-pages-3.42 (2012), in strcpy(3), Michael Kerrisk wrote some text
recommending the use of strlcpy/cat(3) instead of str[n]cpy(3).  This is
already deep into the territory of best practices.

In 2014, Theo de Raadt made the wording that discouraged str[n]cpy(3) in
OpenBSD harsher than it was:

	Author: deraadt <deraadt@openbsd.org>
	Date:   2014-04-19 11:30:40 +0000

	    Use somewhat harsher language and better examples; demonstrate that
	    non-dangerous use functions is difficult.
	    ok guenther

This includes text in DESCRIPTION:

	+Bounds checking must be performed manually with great care.
	+If the buffer
	+.Fa dst
	+is not large enough to hold the result,
	+subsequent memory will be damaged.

Of course, he went much harsher in the EXAMPLES.

Before that, in 1993, Todd C. Miller, had already started discouraging
strncpy(3), and recommended strlcpy(3) instead (by then, only in
EXAMPLES).

After researching into the history of these string functions, I'd say
best practices got their way into manual pages as early as they were
developed.  The more important they were, the more they made their way
into the more important sections of a manual page.

Of course, most of that still was reserved for EXAMPLES/CAVEATS/BUGS,
and still is.

> You'd get a box of
> printed manuals, one or more per section, with one or more pages per
> program/file/function being described, and that was the gold standard
> reference for the system the books came with.  Heck, even "man man" says
> it's for the "system reference manuals".

That was a time when programmers were not so much (at all?) worried
about safety, to be fair.

> I think that, in so far as the the developer wants to use our APIs, the
> man pages must document what "is"

Sure; technical specification is _part_ of the contents of a manual
page.  I only mean that they must not be limited to that.

> and the information the developer needs to use the APIs.
> Note that I don't say "correctly" because that's
> too vague - we should cover the correct way to *call* a function, but
> not the correct way to *use* a function - if the programmer wants to
> abuse the function for their own purpose, so be it.

Here's where we disagree.  I believe we must document the way to _use_
a function (and from what I've researched, so did many others before
me).  We must certainly also document how to call it, of course.

Of course, if the programmer wants to go their own way, and abuse the
function, they're free to do so.  That information doesn't hurt (except
for the people that feel offended by the fact that documentation tells
them that what they do is not a best practice).

> If the man pages say what a function does, and what its parameters are,
> and what it returns, that is unbiased factual documentation which the
> programmer can use as they wish.
>=20
> Where the man pages go beyond this, we call that "examples", "caveats",
> and "best practices" and we have to be careful to disclose that they're
> just recommendations.

Most of it, yes, certainly.  A few glimpses of it may come in the
DESCRIPTION, when it's important enough to point early to those other
sections where that information is expanded.

> It is not our place to tell the developer how to
> write *their* code, beyond interfacing to our APIs.

It is our job to explain how they can write their code.  Once they know
what they can and should do, they're free to break the rules.

> I think the man pages need to, where appropriate, document the STANDARD
> way of doing things,

The standards don't document ways of doing things, but rather give
technical specifications.

> not what the author thinks might be better,
> or what has been historically popular.

This conflicts with the contents of manual pages since the BSDs in (at
least) 1991.

I believe both belong in manual pages.

> In the case of string.h vs memory.h, we
> should take guidance from the current relevant published standards,
> because future standards will assume that also.

Future standards are yet to be written.  We don't know what they'll
assume.

> If current standards
> conflict with older standards, we could document that (perhaps in a
> CAVEATS or HISTORY section).  We should NOT try to anticipate future
> standards in the man pages, or suggest "best practices" that rely on
> future standards.

I have not documented any future standards in this case.  You might have
been confused.  I have documented something that is current reality in
existing systems (and extension to the standards), and which I pretend
to propose for standardization --but that's orthogonal--.

I have indeed documented future standards in very few cases (for
example, in countof(3)), but that feature is already part of GCC, and
thus it had to be documented.  The reference to C2y there is mostly as
a warning to readers (essentially meaning: if you don't use C2y, you may
want to not use this yet).

Maybe you misunderstood something in this discussion, I guess.

> > A programmer should be able to write correct code.
>=20
> We need to leave the definition of "correct" up to the programmer,
> outside of "legal API use".  Their code needs to do what they want, not
> what we want, so long as the programmer sticks to the standards for our
> APIs.
>=20
> > A piece of documentation that describes an API in detail --as if it were
> > reverse-engineering it from its binary code-- but doesn't tell me how
> > to use it correctly is useless.
>=20
> Again with "correct".  We need to document how to use it "according to
> what the standards allow and what the function needs and does", and
> possibly provide examples and caveats, but avoid trying to say "and you
> should use it for these purposes."

I wonder if you think the glibc is wrong with these recommendations.

<https://sourceware.org/glibc/manual/latest/html_mono/libc.html#index-strca=
t>

		As noted below, this function has significant
		performance issues.

		...

	Whenever a programmer feels the need to use strcat she or he
	should think twice and look through the program to see whether
	the code cannot be rewritten to take advantage of already
	calculated results.

<https://sourceware.org/glibc/manual/latest/html_mono/libc.html#index-strnc=
py>

		This function was designed for now-rarely-used arrays
		consisting of non-null bytes followed by zero or more
		null bytes.  It needs to set all size bytes of the
		destination, even when size is much greater than the
		length of from.  As noted below, this function is
		generally a poor choice for processing strings.

	Because these functions can abruptly truncate strings or wide
	strings, they are generally poor choices for processing them.
	[...]
	Although some buffer overruns can be prevented by manually
	replacing calls to copying functions with calls to truncation
	functions, there are often easier and safer automatic
	techniques, such as fortification (see Fortification of function
	calls) and AddressSanitizer (see Program Instrumentation Options
	in Using GCC).  Because truncation functions can mask
	application bugs that would otherwise be caught by the automatic
	techniques, these functions should be used only when the
	application=E2=80=99s underlying logic requires truncation.

FWIW, I think it wrong about the performance issue of the cat functions,
but it does well informing users about how these functions should and
should not be used.

Note that none of this text is in bugs/caveats/notes/etc.  FWIW, there's
a 'Note' right below that text.  Somehow, the other text is more
important than a note.

Maybe some people believe a texinfo manual has a right to go into these
details, while a manual page must be purely technical.  I believe manual
pages should document as much as a texinfo manual.

> > Okay, we have an algorithm.  I'm sure you can implement strncpy(3) from
> > that description.  But what is it useful for?  Why would I want to call
> > it?
>=20
> Who cares?  We're not the developers, let them use the function if the
> algorithm fits their needs.

How will they know?  You're assuming programmers that read the algorithm
and magically know that they want to use this function.

> We document printf() but don't tell the
> developer what data they should print, just *how* to print it.  Same
> here.  Tell the developer what the function does, but leave *why* to use
> it up to them.
>=20
> If you want to add a HISTORY section that explains the original purpose
> of the function, go ahead.  But that has nothing to do with current
> "correct" usage.
>=20
> > How do I even call it?
>=20
> That's the API that we need to document.  HOW is relevent here, WHY is
> not.

What do I pass to it?  I know it's a 'const char*'; but what should it
contain?  The page says bytes (maybe a string? it said something about
being similar to strcpy(3), but then said it's different), but that's
not very useful.

> > How am I supposed to write programs in a Linux system?
>=20
> I think what you want is a programmer's guide.  While that may be
> something to include in The Linux Documentation Project, it's outside
> the scope of the man pages.  Even the TLDP FAQ says it provide "Guides,
> HOWTOs, man pages, and FAQs", which implies that man pages are neither
> guides nor HOWTOs.

Yeah, I'm aware some users of the manual pages think they should not
guide.  I'm happy that many other maintainers before me didn't agree
with that (at least, per what we can observe from their actions).  Of
course, I don't want them to be book-long pages, and in most cases, they
don't need anything at all.  But in some functions, there needs to be a
guide.

> Do I think we need more documentation to help people write better
> software?  Yes!  Do I think the man pages are the right place for that?
> No.

Okay; so you probably think the glibc manual is correct containing that
guiding material.

There are many people --like me-- who only ever consult manual pages,
and those also need to be guided.  Maybe just a few words, but it helps.

> > Are there any systems without <memory.h>?
>=20
> Irrelevant.  If the standard says those functions are in <string.h>,
> that's what we should document in the pages for those functions.

And we document that.

	SYNOPSIS
	     #include <string.h>  // or <memory.h>; see memory.h(3head)

	     void *memcpy(size_t n;
			  void dest[restrict n], const void src[restrict n],
			  size_t n);

Let's say that comment is the "guiding material".  It's not too
intrusive, but it's there for anyone who wants to follow it.


Have a lovely night!
Alex

--=20
<https://www.alejandro-colomar.es>

--vmn4hvvovmbv37fq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpycJ8ACgkQ64mZXMKQ
wqnAeRAAl/sGVoUyfiQMBlwj9xPK26WqsxxA/eO24DD+T7CxnrRuavFPUUTFSWI2
GsQf/i3uNdp/Yu4H2b7yaENXEBBaMHiUc05ouoiyoBGCU8KTouga1hNBtemtc3O+
muRAO4HPsVGE1plt3s1uv6AjUePM1Tw6qX+fDX7hkZ1yVYqIw1sfgMB+SMCAN5Ri
87wTBc7aXotzLuIwMJu9B0bUZVxJy4oRm0UiWOBO+Rsnxetq1YysQ4X1jUyHt/EL
hf0Qylc/rvUn3TKNAOVYQW9hbylnd83jmWJo4iC++aV3TzCRNEBaV02b2NDUMLy7
kTTrNYB0zFci0VYiaA9rfB7CsvePKwFc9XG2OrVisgSVIQySqQrvAz7PMMpy4kq2
vuEndXZsbv7TVXOs1fkzwWoI38/fJTn4G8nV0fx6bIYpqZ/4kvRbbVbb3DuzcMW5
M1KG3zj0n3iClVJSxM7HHTEdMR498Ih5YXtf/SeJtjutIdjPNcrhX7ctyJmEO8NY
IXoKI5d4fTl4MHSkKjabYJ/1CyYclTEwyWrrXZf4NumHHNT73O4UstVp5HoeDqpj
zOpR1vJX3QFiJ9A0zPXQ8NfZ+uyNlFCP6ou4C/1QPnBN3Klm//BZgpB+GEtu5y3j
BYpexvk9vo1RJYWGAgMcBmVtQItyXmeIcOVvf47IgNPYFra0C9E=
=VGk2
-----END PGP SIGNATURE-----

--vmn4hvvovmbv37fq--
