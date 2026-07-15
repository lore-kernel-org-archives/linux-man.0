Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CBF377A91
	for <linux-man@vger.kernel.org>; Wed, 15 Jul 2026 23:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784158666; cv=none; b=pc0iCltCZysqi3sxszVHBVvbiqAhdado0TLBMMwg4dSeZMgdnukM+eRxsZl5lQYo+jAS9C/mPQUOpKnbZxhG2mTw1mbbNwchwj1rNJLaBJgLWoPb2q+nJ5ERkcAetPN4OsJ6yBZke30An04K4NWTz0oaGDqs4rFAYfs8RFRCvOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784158666; c=relaxed/simple;
	bh=VYnehawQEF0RWvpumInK39ZJ96+/LQj7OBP98lS4We4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uiGF/JaGxhS8cHn9QGP/yOwys+9B6EeDY21jVUvwZ7Mj4+j4YBuXSS/pEMMMWG8j271S2JlIbPkzlufZ0w2pCj3pjRcfvGZyeDIG50bgmym1wfdUbbwR9+GTcaV9hpnFnusQkwSx7ZNI6JTrsFsemgf6dsRLGQMtmTrNPqikE2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iE2tWIpY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iE2tWIpY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67AEE1F000E9;
	Wed, 15 Jul 2026 23:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784158664;
	bh=r4fuYJ1NXN46GXQlzDXVrFVVzz93rzfyX6iP5YAKn48=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iE2tWIpYoKZQt2zZnmVmmjckcTdjHuu3L8uO5nCCq4+5NBeEMQDA5hNSmP25o5Da5
	 K8VM+pfZU0ZgZm7eyj5U8rP1551EO8xmMcu1W9AUvWjHMTz35+nJTefANLWxKIiA20
	 kBUV8tBiQ8xrSmRWQGTU83xCHv+ZUt2tLmGtlNzGyALZPzqO4Phl+6YS0PWLFFFeFd
	 Q0huzu493FCrmd7Wb5eguqll3YFI92bD6iZWxm5T/Mvc3LaF232oYMxKr3WK7gT1e4
	 L1f+trWnNIpulD4tLxmPjF8auPBfc3Ad6sIgwJmv9/uuIJ2AulJdJgHlNnJ9P2gQq8
	 LPH2eHZ9I/v2g==
Date: Thu, 16 Jul 2026 01:37:41 +0200
From: Alejandro Colomar <alx@kernel.org>
To: DJ Delorie <dj@redhat.com>
Cc: g.branden.robinson@gmail.com, linux-man@vger.kernel.org
Subject: Re: man/man8/ldconfig.8: document system-wide tunables
Message-ID: <alft37_HHhLxwr3a@devuan>
References: <ale2ytaF-sTAyH3W@devuan>
 <xno6g86q1e.fsf@greed.delorie.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tt3amidwlipkio3a"
Content-Disposition: inline
In-Reply-To: <xno6g86q1e.fsf@greed.delorie.com>


--tt3amidwlipkio3a
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: DJ Delorie <dj@redhat.com>
Cc: g.branden.robinson@gmail.com, linux-man@vger.kernel.org
Subject: Re: man/man8/ldconfig.8: document system-wide tunables
Message-ID: <alft37_HHhLxwr3a@devuan>
References: <ale2ytaF-sTAyH3W@devuan>
 <xno6g86q1e.fsf@greed.delorie.com>
MIME-Version: 1.0
In-Reply-To: <xno6g86q1e.fsf@greed.delorie.com>

Hi DJ,

On 2026-07-15T14:55:41-0400, DJ Delorie wrote:
> Alejandro Colomar <alx@kernel.org> writes:
> >> Perhaps such a helper could be included in the git repo, just for
> >> authors?
> >
> > I'd be interested in at least having a look at it!  It might have
> > something useful.
>=20
> I'll append it here for posterity.  It's not much.

Ouch!  Perl!  :)
Thanks, anyway!

> > BTW, what's the etymology of 'lman', out of curiosity?
>=20
> "local man page" vs installed man page.

Makes sense.

[...]
> > That one exists because its author wrote it in perl, and I don't
> > understand perl enough to translate it to something I'd understand and
> > be able to maintain.
>=20
> I do, and perl looks like the right choice for that one.  Perhaps in the
> future, if it needed maintaining, I could go through and add copious
> comments.  For now I'm inclined to just leave it ;-)

Hmmm, okay.

> > If anyone understands perl enough to translate that into a shell script,
> > I'd appreciate it very much.  :)
>=20
> Perl is just a shell script, for AWK, right?  And AWK is just a shell
> script for SED?  <ducks>

I wish I could extract at least part of it, into a bash(1)/sh(1) script.

> >> glibc is the same way, I'm used to that.
> >
> > Nice to hear that glibc doesn't allow AI!
>=20
> Well, for legal and technical reasons, not for moral reasons.  The FSF's
> stand is similar at the moment - the legal landscape is still too risky
> to allow direct contributions derived from AI output.  There is no moral
> problem with AI itself, just the way that companies have implemented it
> so far.  If you had an AI based on FLOSS sources, run on local hardware,
> trained on known copyright-safe inputs, there would be no moral issue
> with it.  Home assistant's Piper/Kaldi/HassIL modules are examples of
> "moral AI".

=2E.. and which wouldn't consume the vast amounts of natural resources,
both for training and using ...

> > In some other project, a co-maintainer saw a bug report from an AI
> > tool,
>=20
> I hate those, especially when the submitter hasn't bothered to check the
> AI's work.

I've seen maintainers do that; not just random programmers.  The problem
is that the number of programmers that understand the subtleties
language to a point where they can reject a very-subtly-incorrect report
isn't very large.

> However, AI *has* found some serious bugs (and sometimes
> with correct patches) for us.  It needs to mature, but I think it is
> already showing it's worth.

Personally, I've seen only one bug report in a project that I maintain
that was actually relevant.  And it caught a regression that might have
been caught by users in the -rc (since it was disruptive enough), so
maybe it wasn't even necessary.

In shadow-utils, FWIW, we haven't seen any AI-helped reports that caught
important released vulnerabilities.

> > Linters directly or indirectly influence the patch, even if they don't
> > generate the patch verbatim.
>=20
> Yes, but there's no technical solution for stupid.  A contributor who is
> inexperienced enough to misuse AI is no different than a contributor who
> is inexperienced enough to misuse emacs.  It's our job to help them
> become better contributors.

It is different, actually.  With AI, they can produce something that
looks plausibly okay, and is only subtly wrong.  If they have no clue of
what they're doing, and they don't use AI, it will be apparent, and I'll
be able to spot that and help.

Human mistakes and lack of experience are predictable enough, but with
an LLM, I must review carefully every little detail.

> > Because the world has survived without AI for so many years, I think
> > it's safer to err on the side of not using it enough, compared to using
> > it too much.
>=20
> The same could be said of any technology, all the way back to the
> invention of farming ("hunting and gathering is good enough for
> everyone!")

IME, I've never had a case where an LLM was a net positive, and I've
seen cases where it was clearly negative.  When I see that with my eyes,
my opinion might change.  It's not like bicycles, which are clearly
positive (maybe the first years they were not so good, but after so many
years, they're clearly useful now).

> I think the key today is to find out what it *is* good for, and what it
> isn't, and try to help the community find AI's place in things.  In my
> case, I find it very useful as an "idea generator".  I give it the
> basics of a problem and see which rabbit holes it goes down that I
> haven't considered yet.

I'll let the rest of the world find that, and when that happens, I might
welcome that.  For now, I'll stay conservative.

> It's also a much better search engine than the
> search engines (I used it to find out about the groff_man man page).

I believe asking an expert is still more effective.  If you need any
man-related information, you can ask us in this mailing list.  You're
welcome to ask me; I won't be angry because of stupid questions, I
promise.

> However, I treat it like "a recent college grad with a degree in
> Everything."  Knowledge but not wisdom, needs oversight.
>=20
> In our specific case, I wouldn't want AI to write mission-critical
> software, but it's a waste of my time to write yet another single-use
> 20-line perl script to look for patterns in man pages.  Plus, I didn't
> ask the AI to give me the statistics, I asked it for the perl script.
> It's short enough I can look at it and say "yup, that's what I would
> have written", and then *I* run it to get the statistics.
>=20
> (as an amusing aside, our company encourages us to use AI to automate
> boring repetitive tasks.

Yup; I heard that.

> So I had it do my quarterly self-review.  I
> think it did a better job than I would have at making me look good...)

:D

> >> However, I won't not use AI to help me understand the problems I'm
> >> trying to solve, or optimize any diagnosing I need to do.  My time is
> >> too precious to be stupid on purpose.
> >
> > If the LLM makes you misunderstand something, and causes a false
> > sense of understanding, your contribution might end up having lower
> > quality than it would.
>=20
> This is not an LLM problem.  EVERYTHING we use to help us solve problems
> could lead to misunderstanding.  I *know* AI can be wrong, and I double
> check it all the time.

The main difference I observe is that deterministic tools like linters
and compilers have a more-or-less consistent behavior, with well-known
false positives and negatives.  If you search in the right forums, or
ask an expert, you'll get a good overview of which diagnostics are prone
to being bogus.  With an LLM, it's a lottery, and they are designed to
look as plausible as possible.

Thus, it's much easier to be misled by an LLM than by a compiler false
positive diagnostic or some random programmer's bogus bug report.

> Please give me some credit for my many decades
> of not trusting technology ;-)

I certainly trust you using an LLM than some random programmer.  But
I still have my concerns, even with you.

> > But I care about the difference between the quality of a patch, and the
> > quality perceived by the author, and my expectations of the contributor.
>=20
> Then judge the patch,

It's difficult.  A patch that has been written with (at some point)
corrupted information that looks plausible also looks plausible itself.
A patch written by a clueless contributor is more obviously wrong, and
thus easier to review.

I don't feel qualified to judge patches after they've been corrupted by
an AI at any point in their creation; it's too difficult.

To me, it's comparable to working with Jia Tan, and trying to figure out
the exact moment when it'll try to trick me into merging a
vulnerability that looks like good code.

> help the author/contributor improve, and not worry
> about the hidden details.  You don't make the author use a specific
> editor, or a particular brand of keyboard.  AI is just another tool.

A tool designed to produce output that looks plausibly correct even
though it might be incorrect is precisely the kind of tool I want to
disallow.

> Yes, we should not accept *unmoderated* AI contributions, but how a
> human chooses to use the tools available to them is up to them, not us.
>=20
> --------------------------------------------------
> #!/usr/bin/perl
> # -*- perl -*-
>=20
> $MANPATH=3D$ENV{"MANPATH"};
> $MANPATH=3D".:/usr/local/man";
>=20
> if ($#ARGVV =3D=3D 1) {
>     $pattern =3D "^$ARGV[1]\\.$ARGV[0]" . "\\D*";
> } else {
>     $pattern =3D "^$ARGV[0]" . "\\.(\\d\\D*|[a-zA-Z]\$)";
> }
>=20
> # print "pattern is $pattern\n";
>=20
> if ( -f $ARGV[0] ) {
>     $page =3D $ARGV[0];
> } else {
>     # Find it, including one level of subdirectory.
>   DIR:
>     for $dir (split(':', $MANPATH)) {
> 	opendir(D, $dir);
> 	for $f (sort readdir(D)) {
> 	    next if $f =3D~ /^\./;
> 	    #print "try $dir/$f\n";
> 	    if ($f =3D~ m@$pattern@io) {
> 		$page =3D "$dir/$f";
> 		last DIR;
> 	    }
> 	    if ( -d "$dir/$f") {
> 		opendir(SD, "$dir/$f");
> 		for $sf (sort readdir(SD)) {
> 		    next if $sf =3D~ /^\./;
> 		    #print "try $dir/$f/$sf\n";
> 		    if ($sf =3D~ m@$pattern@io) {
> 			$page =3D "$dir/$f/$sf";
> 			last DIR;
> 		    }
> 		}
> 		closedir(SD);
> 	    }
> 	}
> 	closedir(D);
>     }
> }
>=20
> unless ($page) {
>     print "Not found!\n";
>     exit 0;
> }
> # print "Found $page\n";
> # exit 0;
>=20
> # Get the terminal's width
> $stty =3D `stty size 2>/dev/null`;=20
> ($height, $width) =3D ($stty =3D~ m@(\d+)\s+(\d+)@);
> $width =3D $width unless $width > 10;
> $width -=3D 2;
>=20
> # I prefer no hyphenation when I'm reviewing my changes
> $hypenate =3D "";
> #$hyphenate =3D "-rHY=3D0";
>=20
> open(N, "groff -mandoc -Tutf8 -rLL=3D${width}n $hyphenate -rCR=3D1 -P-i $=
page |");
> #open(M, "| less -R");
> #select M;
> while (<N>) {
>     # Colorize certain formatting
>     s/\033\[1m/\033\[1;32m/g;		# bold -> green
>     s/\033\[3m/\033\[3;34m/g;		# italics -> blue
>     s/^\033\[1;32m/\033\[1;31m/g;	# section headers are red
>=20
>     s/\033\[21m/\033\[21;39m/g;		# ending style ends color too
>     s/\033\[22m/\033\[22;39m/g;
>     s/\033\[23m/\033\[23;39m/g;
>     print;
> }
> close(N);
> #close(M);

Hmmm, it took me some time, but I could understand it.  I've translated
it to a bash(1) script which I can read better:

	#!/bin/bash

	set -Eeuo pipefail;

	test -v MANPATH    || MANPATH=3D'.:/usr/local/man:/usr/local/share/man';
	test -v MANWIDTH   || MANWIDTH=3D"$(stty size | cut -f2 -d' ')";
	test -v MANROFFOPT || MANROFFOPT=3D'-d AD=3Dl -rCR=3D1 -P-i';

	width=3D$(expr "$MANWIDTH" - 2);

	echo $MANPATH \
	| tr : '\n' \
	| xargs -I{} find {} -maxdepth 2 -type f \
	| if test $# -eq 2; then
		grep -E "^(.*/)?$2\.$1[[:alpha:]]*$";
	else
		grep -E "^(.*/)?$1\.[[:digit:]][[:alpha:]]*$";
	fi \
	| head -n1 \
	| xargs groff -mandoc -Tutf8 -rLL=3D"$width"n $MANROFFOPT \
	| sed $'s/\e\[1m/\e\[1;32m/g' \
	| sed $'s/\e\[3m/\e\[3;34m/g' \
	| sed $'s/^\e\[1;32m/\e\[1;31m/g' \
	| sed $'s/\e\[21m/\e\[21;39m/g' \
	| sed $'s/\e\[22m/\e\[22;39m/g' \
	| sed $'s/\e\[23m/\e\[23;39m/g' \
	| less -R;

I guess these days this is unnecessary, since man -l can replace most of
it (except for the colors at the end).


Cheers,
Alex

--=20
<https://www.alejandro-colomar.es>

--tt3amidwlipkio3a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpYGb4ACgkQ64mZXMKQ
wqnjYg/8CIv4tmYNzZAqFm6sLjTvhO3RPp2k/UuE/dfFGjBa6zu84h7neBZSFk4e
w0jYGpKT5jivk+OmcuhqPuYzMcm98U7WL8IH5H6u4q2kTPZhOwTqTlI+V6WiTser
SDIZzpJ3n8Y/BeI6Us+zAV87VeFFIlzXlQCWzMEWSYrN4bBmboy7K+JGmurXBv/L
ikR8Z7eBy6AWvkKiBgIkHsN2UP6IFRhvaDqh/FuvmKgQB9jUkVxG7j8Y8ck+6jbR
t3da6Ol/5Dabg3v0c+VI+n0jK7NTAZxHOKzYnYnHapkZrUSeIWtPmU2M0zPDHvqS
4Eu34EvrRUhmZZjT3XzQQztcabq5dlHGPzhZoaoka8iTYSmC3uqSbEcCLPI7GjUv
lBJjgHo8Zbwxcyq8VrYkxbsqQZ+ltJHrirVRsVEuayf5BQzmfmtZMa00l3/2Ja40
4vXP25LjX1N6/A+D6bawGF8zGjZ01jHYQV9i8E4/eoZ+F2SBNyP4t9WztfB4JaR9
nShs/K5T00LsN+GZX4MWZIsoAIo2dZtCfcklrfgGyMNa1+ERT4Z25d4obp3zb+Tr
qe0Dyaf4AXMI9tQzKAiGM5/+orjzSAWAC/L+oK61AcXzTx0i7nHgBgvd8BYNPZV6
TKIRyOPA5xUzzRmVrqjUNzKoeQZ2fauPxAxaqaaLEo0g9aeFgGw=
=imZX
-----END PGP SIGNATURE-----

--tt3amidwlipkio3a--
