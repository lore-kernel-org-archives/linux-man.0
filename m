Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871FC4BEE22
	for <linux-man@vger.kernel.org>; Sat, 12 Sep 2026 12:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789216456; cv=none; b=FBOSkt3jL1ktWGKfL4TJ6uj4iLqL3olYjIR+aK3ZpmCXQTesm4Oz6HSBAQRa+ovn5cw2X+GDNvCj6SW69ULuVP0E6zYvLxFFlCmpudS9W3fT84S8xmEpvgvDd32Jva2zn/RSlQPCSarKhh3zmP25ku4e3QakvGKukC74t8eBZwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789216456; c=relaxed/simple;
	bh=wq8wHtzMZnt87GBesO+xJWQIUE2P5awibUrDMqayMuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S0YxoREYvuNByQyRf+iqWJw/dIkBIAjx0d6CS7KwZcpaGTDCnj+CNrDQ4FkWiwZgZq3fz9Hos7IaAXrNr043RzBWu+IsSpE4leo6b8Jh/20Ct3ZSIl0Z0lTFqu4HRMdJsXO+roTpDnRDRzQi28j49ARyo9BTXTFJj84OXwts39c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i2SjBjpj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i2SjBjpj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D48B1F000FF;
	Sat, 12 Sep 2026 12:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789216454;
	bh=M810RqabEr38OP3ahTsBmXjIWhG8f3FbZooBHgBrzGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i2SjBjpjzEVzThpFtQRPiDbTf4h+VnUMBW+cSMUuhGzqH4imkiJbswXIToWZzkQPR
	 8h9Ogajyjzh2byItz9Czf6cfGJUfhvEWoFdWFOgUbdRrPOLPHupjgVbstVNs8r0Kzo
	 wQ9OFoRUdMGUnc0kS2iDtsLThzfqj+Z8MnXu1DWuKK2IqTFRI4UM6qANyxSTGzXHOZ
	 QT3Zci/0si79up4Cyikm6tyyktBq96Yd1M5rwJ8/Oc+psf8u26uScQX55YjztWkr+q
	 ihXxSAKOc0b9Imcx8y3oPtZRZrxl53xFBBdmwF3zwucEg4tqWeVR7BsB7EMk7F82FB
	 vY2u0HeoW0lUg==
Date: Sat, 12 Sep 2026 14:34:09 +0200
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Douglas McIlroy <douglas.mcilroy@dartmouth.edu>, 
	linux-man@vger.kernel.org
Subject: Re: syntax of options in man1
Message-ID: <aqUw7nWVYSCIhZnh@devuan>
References: <CAKH6PiXDGL658h1t_bstW0Z+MjjJfcNmcde-DA3QNOYKc0TTGg@mail.gmail.com>
 <aljtsrJVLTN6qlxP@devuan>
 <20260716155544.o7fx7ecnpjj5sdai@illithid>
 <alkEKUNzTGnpiYdH@devuan>
 <20260716170548.am3fg45uaudlqpl2@illithid>
 <aqRGphJuo70C_e7G@devuan>
 <20260912043910.2ad4suatviwuvtab@illithid>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aprq4lcbnsca32pg"
Content-Disposition: inline
In-Reply-To: <20260912043910.2ad4suatviwuvtab@illithid>


--aprq4lcbnsca32pg
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Douglas McIlroy <douglas.mcilroy@dartmouth.edu>, 
	linux-man@vger.kernel.org
Subject: Re: syntax of options in man1
Message-ID: <aqUw7nWVYSCIhZnh@devuan>
References: <CAKH6PiXDGL658h1t_bstW0Z+MjjJfcNmcde-DA3QNOYKc0TTGg@mail.gmail.com>
 <aljtsrJVLTN6qlxP@devuan>
 <20260716155544.o7fx7ecnpjj5sdai@illithid>
 <alkEKUNzTGnpiYdH@devuan>
 <20260716170548.am3fg45uaudlqpl2@illithid>
 <aqRGphJuo70C_e7G@devuan>
 <20260912043910.2ad4suatviwuvtab@illithid>
MIME-Version: 1.0
In-Reply-To: <20260912043910.2ad4suatviwuvtab@illithid>

Hi Branden,

> Date: 2026-09-11 23:39:10-0500
> From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
>
> Hi Alex,
>=20
> At 2026-09-11T20:43:12+0200, Alejandro Colomar wrote:
> > > Date: 2026-07-16 12:05:48-0500
> > > From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
> > > At 2026-07-16T18:20:30+0200, Alejandro Colomar wrote:
> > > > I've had plans to write new pages for coreutils, and haven't done
> > > > it yet.  Maybe it's the time that I do that.
> > >=20
> > > The reason coreutils's man pages look this way is because they
> > > prefer to maintain much or all traditional man page information in
> > > each command's help message ("tail --help")[1] and then generate a
> > > man page from that using help2man(1), which fills in a man page
> > > template named "chmod.x" or similar.
> >=20
> > Indeed.  I'm working on getting rid of that coupling, and have
> > hand-written coreutils' manual pages.  I've advanced a lot already.
>=20
> Cool!  Please apprise the groff list of any questions or difficulties
> with man(7) markup.

Yup!  For now nothing weird, though.  :)

> > > Here's the thread where I learned that fact.
> > >=20
> > > https://lists.gnu.org/r/coreutils/2026-05/msg00080.html
> > >=20
> > > Maybe we can make help2man(1) better.  And/or drive constructive
> > > reforms to GNU-style help messages...
> >=20
> > No.  I'll refine the existing generated manual pages, and after that,
> > maintain them manually.  That'll be much better.
>=20
> Are the coreutils maintainers aware of your plan?

Yes, they are.

<https://lore.kernel.org/linux-man/aluIbrKBtAxweITC@devuan/T/>
and earlier:
<https://lore.kernel.org/linux-man/wqfzoyixsh4l3wg7tkz3c4bjejy4wlski2s5g2pw=
oqiy2wg3ty@lkqy5semt757/T/#u>

> Have they opined?

Yes.  You can follow those two links.  Here are some key comments:

<https://lore.kernel.org/linux-man/wqfzoyixsh4l3wg7tkz3c4bjejy4wlski2s5g2pw=
oqiy2wg3ty@lkqy5semt757/T/#m131081b230029607ad21c29265533b947a026b9f>
Arsen seemed okay with the idea, as long as the pages are maintained in
within coreutils, and not moved to the Linux man-pages project.

<https://lore.kernel.org/linux-man/wqfzoyixsh4l3wg7tkz3c4bjejy4wlski2s5g2pw=
oqiy2wg3ty@lkqy5semt757/T/#m5fd441c47cb079fcacf574e0e1adcc760e44ba44>
P=C3=A1draig also seemed happy with it.

<https://lore.kernel.org/linux-man/wqfzoyixsh4l3wg7tkz3c4bjejy4wlski2s5g2pw=
oqiy2wg3ty@lkqy5semt757/T/#m34d7b3ecf7fc787fbd17b76919f0d595aec409a1>
Bernhard Voelker seemed worried about keeping the up to date.

P=C3=A1draig seems to be the one that has to decide, so it looks good.

BTW, by looking at the links above, I see you were (tangentially)
involved in that discussion.

> > > [1] I distinguish "usage" messages from "help" messages because a
> > >     "usage" message is what you get when you invoke a command in a
> > >     manner it recognizes as syntactically invalid.  This is an
> > >     ancient Unix tradition.  The usage message should be short,
> > >     summarizing only the available invocation forms without
> > >     attempting to explain them.
> > >=20
> > >     A "help message" is more of a GNU thing, part of that system's
> > >     campaign to standardize `--version` and `--help` "long options",
> > >     a practice I regard as mostly salutary and benign.  For example,
> > >     I am annoyed by *BSD utilities that afford no means of inquiring
> > >     of their provenance.  There's often no way to say "identify
> > >     yourself".
> >=20
> > I prefer asking the system to identify programs.
> >=20
> > 	alx@devuan:~$ which cat
> > 	/usr/bin/cat
> > 	alx@devuan:~$ which cat | xargs dpkg -S
> > 	coreutils: /usr/bin/cat
> > 	alx@devuan:~$ which cat | xargs dpkg -S | cut -f1 -d: | xargs dpkg -l =
| tail -n1
> > 	ii  coreutils   9.10-1devuan1   amd64          GNU core utilities
>=20
> As you anticipate below, that works great until you encounter a system,
> possibly an embedded one, where a package manager isn't present in the
> environment.  Think of tools like Buildroot.[1]
>=20
> Historically, as in decades ago, system builders used to mandate SCCS or
> RCS revision control of source files, and the population of static
> strings in those source files to store RCS "ident"s or SCCS "what"s.
> I'm using the names of the tools that scanned for these strings.  You
> could then run such a tool on the compiled executable--on _any_
> host--and get a dump of the configuration of source files that it was
> translated from.
>=20
> > When a program wasn't installed as a debian package (and thus dpkg(1)
> > doesn't know about it), I try to put it under /opt, in a directory
> > that identifies the build date and the reason to build it (the git
> > branch).  A couple of examples:
> >=20
> > 	/opt/local/gnu/groff/20260823_master/
> > 	/opt/local/mutt/mutt/20260906_references/
>=20
> That's one alternative solution.  Another, arguably even better though
> it requires more overhead in terms of build system management, is to
> generate a UUID for a specific compilation process.  That enables
> traceability to a specific build host and other configuration details,
> like compiler flags.

[...]
> > But yes, for programs not controlled by dpkg(1), it can become messy,
> > and thus interesting to have an "identify yourself" option.
>=20
> Yes.  That's why I always want one in the tools I use.
>=20
> > >     What I _don't_ want, as a user, is to be blitzed with 100 lines
> > >     of "help" when all I did was mistype a command invocation.
> > >=20
> > >     In an attempt to practice what I preach, groff's usage
> > >     messages--uniformly, I think--look like this.
> > >=20
> > >     $ tbl -X
> > >     tbl: error: unrecognized command-line option 'X'
> > >     usage: tbl [-C] [file ...]
> > >     usage: tbl {-v | --version}
> > >     usage: tbl --help
> > >=20
> > >     A true Unix grognard would desire _only_ the second line,
> >=20
> > I might have become more grognard than the grognards, but I'd only
> > want the first line.  That is, the 'tbl: error: ...'.  Then it should
> > be my job to read the manual page, which should have this kind of
> > information.
>=20
> I've found it useful to get the terse reminder of invocation methods,
> though I concede that's not as terse as not offering the reminder at
> all.
>=20
> Consider the Thompson limit of the grognard principle.
>=20
> $ tbl -X
> ?
> $ echo $?
> 0
>=20
> The conventions of issuing error messages _to the standard error
> stream_, using a non-zero exit status on failure, and _identifying
> oneself in diagnostic messages_, were all practices recognized by
> McIlroy in the late 1980s as salutary--but were implemented half-
> heartedly even at the Bell Labs CSRC where Unix was born.[3]

The problem with Thompson's '?' is that it doesn't say where the problem
is.  That's something essential.  Even in the simplest programs, there
are enough error conditions, that it's not easy to find which one
happened.  That would indeed justify the format of the first error line:

	tbl: error: unrecognized command-line option 'X'
	                                              ^~~ user input
	            ^~~ exact reason
	     ^~~ error, warning, information?
	^~~ program name

All of that is necessary for identifying a problem.
But lines 2..4 are not part of that diagnostic.

> > Indeed:
> >=20
> > 	$ MANWIDTH=3D64 man 1 tbl | head -n12
> > 	tbl(1)              General Commands Manual              tbl(1)
> >=20
> > 	Name
> > 	     tbl - prepare tables for groff documents
> >=20
> > 	Synopsis
> > 	     tbl [-C] [file ...]
> >=20
> > 	     tbl --help
> >=20
> > 	     tbl -v
> > 	     tbl --version
> >=20
> > It's not like one needs to search through the manual page to find
> > this.
>=20
> Indeed not.  But the information is easy to find because I made sure
> that it would be, by trying to maintain a strong discipline of keeping a
> program's usage messages in sync with the man page, and of course with
> its actual argument processing behavior.
>=20
> If you audit the tools on your system in these respects, I predict
> you'll swiftly find such discipline lacking.

Indeed, I think many manual pages need fixing.

>=20
> > >     but I
> > >     think that (1) error messages should be _explicit_,
> >=20
> > Yes, but that only means line 1.  The other three lines don't help
> > diagnose the error.  They're about correcting it, which is a different
> > thing, and I'm not convinced that it's the job of the usage output.
[...]
>=20
> > I think you really wanted to say that usage should not print a partial
> > list of valid invocation forms, and I agree with that.
>=20
> Yes.
>=20
> > But I think it should print none, not all.  One should fire up the
> > manual page to have a quick look at the SYNOPSIS.  After all, that's
> > just a few key presses away.
>=20
> Think embedded again.  Some target environments rip out the man pages.

But you develop for embedded systems in non-embedded systems, right?
I expect when you're working on an embedded system, you have nearby a
non-embedded system with the documentation available.

Moreover, I expect embedded systems don't want the heavy help strings
around.  (This might be part of the reason they go for non-GNU tools.)

> > >     even if "everybody knows that all GNU commands support
> > >     `--version` and `--help`" because (a) that's not
> > >     true--historically, GNU find(1) didn't support it, and the GNU
> > >     dynamic linker ld.so appears still not to--and (b) not all
> > >     commands are GNU commands.
> >=20
> > I dislike the fact that all GNU commands accept --version and --help.
>=20
> What about `--` to mark the end of arguments intended for interpretation
> as options?

That's one I find very useful.  I even requested (successfully) that one
program adds support for it:
<https://github.com/PCRE2Project/pcre2/issues/865>

BTW, git(1) has some slightly different interpretation of '--'.  Commit
references go to the left of it, while pathnames go to the right of it.

But yes, '--' is undoubtedly useful.

> Back when I was learning Unix, the problem of eliminating a file called
> `-rf` in one's home directory was considered a daunting challenge.  One
> couldn't be sure how reliable shell quoting was, if one even understood
> the concept.  This is also back when people did scary stuff in their
> .profile like:
>=20
> PATH=3D.:$PATH
>=20
> ...and the equivalent for (t)csh.
>=20
> Before long I discovered the "magic" of simply prefixing troublesome
> file names in the current working directory with "./", and it's remained
> a typing habit even in many situations where I don't strictly need it.
>=20
> > That --and other flags (some from XSI)-- made echo(1) unrealiable, and
> > now we need to use the weirder 'printf "%s\n" $foo' in scripts.
>=20
> I urge you to research this issue more deeply.  We need printf(1) for
> more reasons than that.

I guess you mean the interpretation of escape sequences such as '\n',
which varies across implementations.  Is that it?  Otherwise, would you
mind pointing me to some sources of information?

> > I'm not averse to all options, but as I get older, I tend to agree
> > more with the BSDs, and think this growth of options wasn't good.
[...]


Cheers,
Alex


--=20
<https://www.alejandro-colomar.es>

--aprq4lcbnsca32pg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqlRrYACgkQ64mZXMKQ
wqlFUw/8DdoXZKkY8Yh2FBxc5/JCF5NoKiya/rS2RRSVy8CN5wXYCt9iOqSyUo1h
ioUBnIsg2CaoBttQ4BPIb+iBDivECsqUQ8ZbR3T6ZFTtkA14w7/OxOPJe3l9nOUP
pMYhozUEiHTpuTPzAU+2WQwlN/1kbZEnamr4TvWv5ZYhXriEJ1SX+2ptoNkxCtgj
DNetkzp3c0oFbl6Cy+YBOfoCGCA3agAlTu9fLarQkQ5qnCRwYhrfpQeiCbVma0rJ
lJQ4PvXRcuXfJux87Q2QoVVprR+R13NMrRVyPDZ6AXCTQh6JDtaABYDNhb+x7EST
Ba28RKyYqzGryhlGiBwUdMr7WQ8KBjK2C1ux++KdLnVdeY8x1/MuZr0VQgddYvno
ZL76jwwPFEVRx9MCpdakWtJVybuRioN0C2Rp7eJgD3nUQmx3croL5jwYkexX+YqB
lljkv3gxUF/ZKwOcbeSYnrnOljZM513dSXhFbQg5nYoeS/wI0Ul0el02wyXElfQP
JPzQJRveHClqu9KMz43PzHRqraijTTeWqBFwajI4/3SYUp8TqzyWb2d4A7W0xM2+
e7lF3fCXjc7bhvK68fjNue0dByj4Fpo6e7efXDfV5wxgnkaodLO8ZFhDaQ3BSr6L
qadCHuwazxTTZGZtPGkrzP4LVS/SMdsBXWkdazEVZu/lZfQ3PM0=
=FD0J
-----END PGP SIGNATURE-----

--aprq4lcbnsca32pg--
