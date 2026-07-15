Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C715412C1D
	for <linux-man@vger.kernel.org>; Wed, 15 Jul 2026 17:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784135364; cv=none; b=M4xZMU9gf6CSH9KaurERs+xm4xXfeI6p2A3mqmmmZXR8YLCA8IV9HBTcwgfUwgcY/I4rWMj8yRjPtPYr83FD/xQ/seB6x6s584Blqht0Abikxr63dH3ZLnKARqA5zuwy26++0f7ZclQ8JN/eLKqIdnyIJxu0xaPKdWdlR0UY2x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784135364; c=relaxed/simple;
	bh=ysf8aSO7GrS8UulSTJsIwIZ1G3QhtphnLlyO5Rx2MTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TF/jIafw7gNQ+iXrQNXzUrkcD3JLWYHPYRaeqWV7bM+cB9XK6y92Kjph8GxfvBBDe7TIf9+Bg4MZS1/+9rXZKkOldAE6cRYxyDVDoHlK7FxwgJv6D4mC9i1QKXeoEJxdr4ZO/vRJ9Hmkp6wFIGPPcaVp7LWkYI4MXPFFBlnqZUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KDjaEyEj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KDjaEyEj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBF351F000E9;
	Wed, 15 Jul 2026 17:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784135359;
	bh=vSXTXBnN0nP73bte4eiBD07Vh3M+QpF+DHcC725JG/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KDjaEyEjjfvOPaWRwcPhNHWdUuyiZqBsFPAGaEyuQAP7qks2cdoHoXWlx79UevjyU
	 MexP3czj8jH9bD1clt9lh1glbSiI1W+6wCqAWt/kONsi5Qi6bU5WjPOAldrEOPGNNj
	 kvrP64lYPhujGMxlA2qyueyJ2ENz9UHGmBQu2Xwlwv1VaJ4TZ3ERxGZKqivN7LxkeR
	 cgdgiVEv/eSif5g4VMlm7E/V/lPR5YpAWl8ygDDqCKIp7EjKYShjM/sC5dNO2xTMQN
	 3FpPnCl1XF8NxxAQybUZPVPNp03IfHxQfuXH3e0gV6NFi4lYbBQgyefws4TaeaP2cJ
	 UhRQ/mfnFtaAQ==
Date: Wed, 15 Jul 2026 19:09:16 +0200
From: Alejandro Colomar <alx@kernel.org>
To: DJ Delorie <dj@redhat.com>
Cc: g.branden.robinson@gmail.com, linux-man@vger.kernel.org
Subject: Re: man/man8/ldconfig.8: document system-wide tunables
Message-ID: <ale2ytaF-sTAyH3W@devuan>
References: <aldxiBVva99diG5t@devuan>
 <xnwluw725l.fsf@greed.delorie.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5dhktobr522jqq5z"
Content-Disposition: inline
In-Reply-To: <xnwluw725l.fsf@greed.delorie.com>


--5dhktobr522jqq5z
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: DJ Delorie <dj@redhat.com>
Cc: g.branden.robinson@gmail.com, linux-man@vger.kernel.org
Subject: Re: man/man8/ldconfig.8: document system-wide tunables
Message-ID: <ale2ytaF-sTAyH3W@devuan>
References: <aldxiBVva99diG5t@devuan>
 <xnwluw725l.fsf@greed.delorie.com>
MIME-Version: 1.0
In-Reply-To: <xnwluw725l.fsf@greed.delorie.com>

Hi DJ,

On 2026-07-15T10:33:58-0400, DJ Delorie wrote:
> Alejandro Colomar <alx@kernel.org> writes:
> >> Add the .in macros around .EX there?
> >
> > But we'd need to know where to add them.  There are cases of EX/EE that
> > don't need to be surrounded by '.in'
>=20
> Ok, now you have a new rule that's even easier to not know about :-P

It's not that they don't need to be surrounded, but rather that they
must be not surrounded, actually.

An example is the SNOPSIS of timeval(3type):

	$ man -w timeval | xargs mansect SYNOPSIS;
	.lf 1 /usr/local/man/man3type/timeval.3type
	.TH timeval 3type 2026-02-08 "Linux man-pages 6.18-154-g618fb5732fc4"
	.SH SYNOPSIS
	.EX
	.B #include <sys/time.h>
	.P
	.B struct timeval {
	.BR "    time_t       tv_sec;" "   /* Seconds */"
	.BR "    suseconds_t  tv_usec;" "  /* Microseconds */"
	.B };
	.EE

We certainly don't want to indent that, but we want it to be monospaced,
so that the fields are aligned (in PDF, PS, and HTML).

	$ man -w timeval | MANWIDTH=3D64 xargs mansectf SYNOPSIS | cat;
	timeval(3type)                                   timeval(3type)

	SYNOPSIS
	     #include <sys/time.h>

	     struct timeval {
		 time_t       tv_sec;   /* Seconds */
		 suseconds_t  tv_usec;  /* Microseconds */
	     };

	Linux man=E2=80=90pages 6.18=E2=80=9015... 2026=E2=80=9002=E2=80=9008     =
       timeval(3type)

EX/EE should not try to indent stuff, since indentation is not always
appropriate (even if we try to minimize differences/inconsistencies).

> > Also, the manual pages should be readable in the form they exist in the
> > repository
>=20
> Not a problem here, a different indentation doesn't affect readability.

More than readable; I think it's a feature that the page is exactly the
same as what users will read in their computers.  That allows
contributors to look at what they've written, and know if it makes sense
or not.  If they had to build it to see slight differences, I expect
many would complain.

> > (and match as much as possible how it will render when
> > installed).
>=20
> Er, close?  ;-)
>=20
> Is ".in +4n" the default for .EX, unless the user changed it?  I wonder
> how often that case comes up.  I wonder because I would need to review
> an example of the problem to figure out how to search for it ;-)

When inserted in the middle of running text, we indent the examples.
The main reason is that because terminals use monospaced fonts
everywhere, it's difficult to differentiate examples from the rest of
the page.  The 4-n indentation makes them stand out.
In PDF or HTML, because running text uses proportional fonts, the
examples stand out on their own by being monospaced.

However, when not inserted in the middle of running text, that
indentation is not useful, and is even ugly.  Thus, we don't indent in
those cases.  Most often, this happens in SYNOPSIS and EXAMPLES.

> Now I wonder if the problem case is predictable enough to have the
> preprocessor *know* when .EX needs the .in +4n, and when it doesn't...

I expect I would be able to write a script that differentiates them.
However, as I said, I believe it's better to have the source match
excatly what is installed (ignoring details in the title heading (TH)).

> > That makes it easy to see if a change works, by running man(1) on the
> > source code.
>=20
> Yup, I have my own lman script that acts like man(1) but takes a
> filename instead of a man page reference,

man(1) also accepts a path.

	$ MANWIDTH=3D64 man man/man5/proc_driver.5 | cat
	proc_driver(5)        File Formats Manual        proc_driver(5)

	NAME
	     /proc/driver/ - empty dir

	DESCRIPTION
	     /proc/driver/
		    Empty subdirectory.

	SEE ALSO
	     proc(5)

	Linux man=E2=80=90pages (unreleased) (date)              proc_driver(5)

> finds it in the tree, and
> formats it with underscores, italics, bold, *and* color!
>=20
> Perhaps such a helper could be included in the git repo, just for
> authors?

I'd be interested in at least having a look at it!  It might have
something useful.

BTW, what's the etymology of 'lman', out of curiosity?

> >> and two .EX's that do not have a closing .EE.
> >> Turns out Gemini is good at perl.
> >
> > Please don't use LLMs for contributing to this project.
>=20
> None of the patches I've sent include anything AI-generated, nor would I
> attempt such a thing without disclosure, because I understand and agree
> with the legal and quality issues of AI-generated output.

Thanks!

> However, I
> won't not use AI to help me understand the problems I'm trying to solve,
> or optimize any diagnosing I need to do.  My time is too precious to be
> stupid on purpose.

(I'll paste this below to reply.)

>=20
> What I did was tell Gemini what I was looking for, and it wrote a perl
> script faster than I could open my editor.  Cut, paste, run, throw it
> away.  That was just for the statistics, of course.

As long as it's for statistics, I won't complain (I mentally might,
because the ethical concerns remain, but not publicly, because it's not
my business), as statistics are not a contribution (at least in this
case).  I might actually doubt the statistics, though, so a disclaimer
of use would be appropriate even for statistics, but as long as it isn't
something that influences in a decision (for example, in merging or
rejecting a patch), it's _relatively_ okay.

>  If we added a
> preprocessor script to the build itself, then (1) I wouldn't use AI, and
> (2) it would be sed instead of perl anyway, to avoid another dependency.
>=20
> Ok, now I looked for it, and we *already* use a perl script to
> preprocess the files, in scripts/mk/build/pdf/book/prepare.pl.  (this
> just means perl is not a new dependency, so we *could* use perl instead
> of sed)

I would like to avoid another perl script.  That one exists because its
author wrote it in perl, and I don't understand perl enough to translate
it to something I'd understand and be able to maintain.

If anyone understands perl enough to translate that into a shell script,
I'd appreciate it very much.  :)

I don't mind having perl as a dependency, but I worry about being able
to maintain all the code in the repository, and that existing perl
script is the one little thing I'm unable to maintain.  (Every time a
problem shows up, I need to contact the author.)

> > The file "CONTRIBUTING.d/ai" contains our guidelines for their use,
> > which essentially says it's not allowed.
>=20
> glibc is the same way, I'm used to that.

Nice to hear that glibc doesn't allow AI!

> However, glibc decided that it has no place dictating how the user uses
> AI *outside* of creating the patch itself.  Yes, that includes linters,
> analyzers, and perl scripts that generate statistics so I can understand
> what I'm working on.

I'll go with a real case here, although I won't be specific in details,
because I don't remember all of them, and also because it has happened
several times in several projects, so this is generic enough.  In some
other project, a co-maintainer saw a bug report from an AI tool, and
immediately wrote a fix for it.  The bug report was bogus, and prompted
the programmer to write a patch that indeed made the code worse.  I'm
very worried about this kind of problems when using AI for linting code.

Linters directly or indirectly influence the patch, even if they don't
generate the patch verbatim.

Because the world has survived without AI for so many years, I think
it's safer to err on the side of not using it enough, compared to using
it too much.

[pasted again:]
> However, I
> won't not use AI to help me understand the problems I'm trying to solve,
> or optimize any diagnosing I need to do.  My time is too precious to be
> stupid on purpose.

I'm worried that I must insist on the policy in this regard.  If the LLM
makes you misunderstand something, and causes a false sense of
understanding, your contribution might end up having lower quality than
it would.

I offer my help explaining any doubts you may have, if that helps you
reduce any time consumption.

> I refuse to follow any policy that tells me what my morals should be in
> the privacy of my own home.

I don't care about your morals in the privacy of your home.
But I care about the difference between the quality of a patch, and the
quality perceived by the author, and my expectations of the contributor.


Cheers,
Alex

--=20
<https://www.alejandro-colomar.es>

--5dhktobr522jqq5z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpXvrYACgkQ64mZXMKQ
wqm0Ng//ahIdcY2fh46eOVUvx7AqIZyiAAaXrclic87GyTKcUJcXnNgGyW0mf08a
qPZYX8nkKz1MDH3j27jab2POJQxw9DdZDgUrP7qrYPm7A3hUBRwykwK246+i0H8I
jZ6E1n+f7TpIgsQqgV97kdbh83RiROtxo7gplTd4qvFU8avUt1Gg2uGG4ThztMfD
AVWJNvNJxNz+0pdvoTDVOZj9UYTe4sf5x4/8gkfSsbVntphu2lWPOi6w73tCsKCr
rTkeiD40I5O9/Tnxb10CEWyt2aKSWJP5MJotvv18A3UBqgoLVVI4JT6hrbp3d616
M6EVLiXT3cF2OYiq6nWe6PFi6oN5bvf6JJyfb/wKu1y/ML/1xacaA3JnOhypnItn
xJs+iFSYwiuoU9iXV/RLg1uYWRUseLgTPSAgXdc018MyaXtE/djLAcpcQFbIVCeO
2Gzd31YMYq3AZqViVSveQbIZmump6dxLwV9pAeQTXGNpwUIznjht8G251uwKFHcs
4XCT+HpwBDQQF4Aa+BQQ/Urf6Q4h8NvaGvdVxHBi+yd4jKSVZHwqGKz+CzWghzxs
H4j/JdvKBNkQYKHw/wH4C1A4qG0AWHcdSOuKj38azrzA839El2xI4p6LqfVFuTT1
nQoum9CZm4iiz0OKv0y4uziCeWOkeNZVRAg0/I8cnIiKCBLW1Ls=
=qmMN
-----END PGP SIGNATURE-----

--5dhktobr522jqq5z--
