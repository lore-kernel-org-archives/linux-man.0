Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB704BB26F
	for <linux-man@vger.kernel.org>; Fri, 11 Sep 2026 18:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789152202; cv=none; b=c9cf2X+AOEyOI+8rtdT5O9X7EWgti8cI0JqbL+cJlo4UGSqEF5HCFAcSW+vRrIYmE4A+bzFHYNa2aTZljUZxCxRZuLslSfhDjDd/UorL48Mm97x8Q7vLRUwcboDwAgzhDhS3qw3+WA6AGkMMxu8kqWKDZSaPR220iA4nRTve5yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789152202; c=relaxed/simple;
	bh=sVXy8oUJvYuCts8MEONkBSvq4dac0gx/Pop/YaeQSYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EDZGZBuXRtwI+7tqesUPnlQi0apSNdDfCVCGdVhtXY5xq3lvNZHgEcHgc++ZUuV+JqKCfSGsmnh25xv4Jjo3dilZ0hj2GGRrdYsnfNCXJ9Eix34N/Dtt3l4Be6SeR9Nzc9uuWIbVm8OMVIxAT/89jWB0CYw6em/FsyEa7v0/qxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EjztyawC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EjztyawC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8A381F000FF;
	Fri, 11 Sep 2026 18:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789152195;
	bh=qnI7V59XLWXbK4QsjRQ8GhkocYL7joWPROry9HLGdBk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EjztyawCq7yhjp3fOW0qjV6BM6nXItSH/pWjms0lq6iZ79kPSVbGyoh4T/AG1O2hs
	 fVamwmB1pTnCMNUude7/PnZRlLfD7atHUN/llVlhxocvu/yde56jXmk6VTHMmalMqu
	 ept3jU2xKRPR/2qNsX/nDoQ7w5Ss9ZIrmhA2pp9vjt28w5BYx64fntUBxv+Nm9hNHw
	 M6ORBqDd+yGLMB0w7iihstobj5IQ7oV+ts5fv9jtsuObIWqJcGg8QAUplrkR0h36Py
	 65qHRHb05zyyUpoyMdUa/JDIaMfRWEn9oDeN7YOoY4ev2DsbpF61UIeWiGCpoikWpu
	 4fvpUIvZQN3aw==
Date: Fri, 11 Sep 2026 20:43:12 +0200
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Douglas McIlroy <douglas.mcilroy@dartmouth.edu>, 
	linux-man@vger.kernel.org
Subject: Re: syntax of options in man1
Message-ID: <aqRGphJuo70C_e7G@devuan>
References: <CAKH6PiXDGL658h1t_bstW0Z+MjjJfcNmcde-DA3QNOYKc0TTGg@mail.gmail.com>
 <aljtsrJVLTN6qlxP@devuan>
 <20260716155544.o7fx7ecnpjj5sdai@illithid>
 <alkEKUNzTGnpiYdH@devuan>
 <20260716170548.am3fg45uaudlqpl2@illithid>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pymosqrcg6f6ijj6"
Content-Disposition: inline
In-Reply-To: <20260716170548.am3fg45uaudlqpl2@illithid>


--pymosqrcg6f6ijj6
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Douglas McIlroy <douglas.mcilroy@dartmouth.edu>, 
	linux-man@vger.kernel.org
Subject: Re: syntax of options in man1
Message-ID: <aqRGphJuo70C_e7G@devuan>
References: <CAKH6PiXDGL658h1t_bstW0Z+MjjJfcNmcde-DA3QNOYKc0TTGg@mail.gmail.com>
 <aljtsrJVLTN6qlxP@devuan>
 <20260716155544.o7fx7ecnpjj5sdai@illithid>
 <alkEKUNzTGnpiYdH@devuan>
 <20260716170548.am3fg45uaudlqpl2@illithid>
MIME-Version: 1.0
In-Reply-To: <20260716170548.am3fg45uaudlqpl2@illithid>

Hi Branden,

> Date: 2026-07-16 12:05:48-0500
> From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
>
> Hi Alex,
>=20
> At 2026-07-16T18:20:30+0200, Alejandro Colomar wrote:
> > On 2026-07-16T10:55:44-0500, G. Branden Robinson wrote:
> > > At 2026-07-16T16:45:16+0200, Alejandro Colomar wrote:
> > > > On 2026-07-16T09:46:25-0400, Douglas McIlroy wrote:
> > > > > Here's a typical option heading (from tail(1))
> > > > >   *    -n, --lines=3D[+]NUM*
> > > > >=20
> > > > > It is tempting to assume (incorrectly) that the short
> > > > > alternative is -n=3D4.  As far as I can tell, the convention that
> > > > > "=3D" is part of only the long alternative is described nowhere.
> > > >=20
> > > > Agree.  I've had that concern for a long time.
> > >=20
> > > That's why I recommend a somewhat different presentation format.
> [...]
> > >      --lines=3D[+]num
> > >      -n [+]num
> > >             Print  the  last  num lines instead.  Prefixing num with
> > >             =E2=80=9C+=E2=80=9D prints all lines from num forward.
> >=20
> > Agree; indeed, after checking, the manual pages of the Linux man-pages
> > project follow this convention.
> >=20
> > The pages that use the dubious convention come from GNU coreutils.
> >=20
> > I've had plans to write new pages for coreutils, and haven't done it
> > yet.  Maybe it's the time that I do that.
>=20
> The reason coreutils's man pages look this way is because they prefer to
> maintain much or all traditional man page information in each command's
> help message ("tail --help")[1] and then generate a man page from that
> using help2man(1), which fills in a man page template named "chmod.x" or
> similar.

Indeed.  I'm working on getting rid of that coupling, and have
hand-written coreutils' manual pages.  I've advanced a lot already.

> Here's the thread where I learned that fact.
>=20
> https://lists.gnu.org/r/coreutils/2026-05/msg00080.html
>=20
> Maybe we can make help2man(1) better.  And/or drive constructive reforms
> to GNU-style help messages...

No.  I'll refine the existing generated manual pages, and after that,
maintain them manually.  That'll be much better.

> Regards,
> Branden
>=20
> [1] I distinguish "usage" messages from "help" messages because a
>     "usage" message is what you get when you invoke a command in a
>     manner it recognizes as syntactically invalid.  This is an ancient
>     Unix tradition.  The usage message should be short, summarizing only
>     the available invocation forms without attempting to explain them.
>=20
>     A "help message" is more of a GNU thing, part of that system's
>     campaign to standardize `--version` and `--help` "long options", a
>     practice I regard as mostly salutary and benign.  For example, I am
>     annoyed by *BSD utilities that afford no means of inquiring of their
>     provenance.  There's often no way to say "identify yourself".

I prefer asking the system to identify programs.

	alx@devuan:~$ which cat
	/usr/bin/cat
	alx@devuan:~$ which cat | xargs dpkg -S
	coreutils: /usr/bin/cat
	alx@devuan:~$ which cat | xargs dpkg -S | cut -f1 -d: | xargs dpkg -l | ta=
il -n1
	ii  coreutils   9.10-1devuan1   amd64          GNU core utilities

When a program wasn't installed as a debian package (and thus dpkg(1)
doesn't know about it), I try to put it under /opt, in a directory that
identifies the build date and the reason to build it (the git branch).
A couple of examples:

	/opt/local/gnu/groff/20260823_master/
	/opt/local/mutt/mutt/20260906_references/

But yes, for programs not controlled by dpkg(1), it can become messy,
and thus interesting to have an "identify yourself" option.

>     What I _don't_ want, as a user, is to be blitzed with 100 lines of
>     "help" when all I did was mistype a command invocation.
>=20
>     In an attempt to practice what I preach, groff's usage messages--
>     uniformly, I think--look like this.
>=20
>     $ tbl -X
>     tbl: error: unrecognized command-line option 'X'
>     usage: tbl [-C] [file ...]
>     usage: tbl {-v | --version}
>     usage: tbl --help
>=20
>     A true Unix grognard would desire _only_ the second line,

I might have become more grognard than the grognards, but I'd only want
the first line.  That is, the 'tbl: error: ...'.  Then it should be my
job to read the manual page, which should have this kind of information.

Indeed:

	$ MANWIDTH=3D64 man 1 tbl | head -n12
	tbl(1)              General Commands Manual              tbl(1)

	Name
	     tbl - prepare tables for groff documents

	Synopsis
	     tbl [-C] [file ...]

	     tbl --help

	     tbl -v
	     tbl --version

It's not like one needs to search through the manual page to find this.

>     but I
>     think that (1) error messages should be _explicit_,

Yes, but that only means line 1.  The other three lines don't help
diagnose the error.  They're about correcting it, which is a different
thing, and I'm not convinced that it's the job of the usage output.

>     and (2) _all_
>     valid invocation forms should be summarized when reporting "usage",

I think you really wanted to say that usage should not print a partial
list of valid invocation forms, and I agree with that.  But I think it
should print none, not all.  One should fire up the manual page to have
a quick look at the SYNOPSIS.  After all, that's just a few key presses
away.

>     even if "everybody knows that all GNU commands support `--version`
>     and `--help`" because (a) that's not true--historically, GNU find(1)
>     didn't support it, and the GNU dynamic linker ld.so appears still
>     not to--and (b) not all commands are GNU commands.

I dislike the fact that all GNU commands accept --version and --help.
That --and other flags (some from XSI)-- made echo(1) unrealiable, and
now we need to use the weirder 'printf "%s\n" $foo' in scripts.

I'm not averse to all options, but as I get older, I tend to agree more
with the BSDs, and think this growth of options wasn't good.  I can live
with it, though, and find *some* of them useful.




--=20
<https://www.alejandro-colomar.es>

--pymosqrcg6f6ijj6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqkS7oACgkQ64mZXMKQ
wqmYww/+OA4OEU+JBpWQPftJcFRAHyZRqWQoRp9pIeIAw4etDElFYBaEiBsXkUxl
PaqIlyXhuXIK86prZpOC8Sepztyx1DxAEqJ0lY+zdqlHdqyjVMf8tuucL3jHZGMb
SGz4n55tp16Ik8V5svp5k9e5kRdbZdFgIbE8HSFB9s/RHG2hTJDCIH70MPWSBelD
2kjLXpIR3P3Pg7aH2BtXD8Wsg3CQsQbYGAm8HdwaHVlp7YxrLHr9EtNM4J9lp5LB
U203V1M0Llqyr4E6s8Og0yuhaU+wSuDAaWyh97li+fOL64x8HdIA3A7/DGftJ+Qv
bIuuUQbJqK1ZlFfVa5MpVnryyBWCZVx9TxpYm6JFsLBGgn1f5/IfV6eDmzSfoCR+
ty/nUz6IVj9Up0RAivoXTIEVmVilQGI467EVvWU5mxIMTgqd3dJCli4WXtFpp4KO
7GsLakVZEijO53oCXb4wZgVBXcCa191E9CmLz+W8Qovy3A4tJmQJnb4vojhalrVR
NLInhOSc7xmHYd+tHMHtVgXvzWlKEbEE1A8TdzwKd9EvcWMep7Kj34M1WSTEgbP4
FS6y7V+3aoZqAq+nzy3XNTwX+ld5EfhJjOTBEBbU05GvLuqTpDQF/q4LoAc1izWW
rpC8OD0li7BLyM3bUgPaR96koMe0inXFvJ3n05Dh2BHC9TaA6hg=
=Uxq1
-----END PGP SIGNATURE-----

--pymosqrcg6f6ijj6--
