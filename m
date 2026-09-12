Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E799D26A0D5
	for <linux-man@vger.kernel.org>; Sat, 12 Sep 2026 04:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789187956; cv=none; b=ox4Je7b8BaktcKP1ceEw1Ei20bDOkJ9Ict+HH4QwSo+VMOisTbwB946HaiD0lDEWSJf0QQyoyOg885N6cXR3fQ0imzxrMsWKPR4F/HZObnzFCGzgwlYhyTB5q+elqBr9z9nZghgP+kOSM5xCXsDEy7ef4kAEno7gSp+MSAdN1rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789187956; c=relaxed/simple;
	bh=jm/17zV8G1Fy3VLEorMqZ4V2osokI59oBBIiJf/inZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QZOg4uhUuWesZvwLcKUjmThg+3y8tNChoxinkN86Pjf+iw7MTSG3T8HfVRzB90QLt3mMihUgJB9ZiRGbtmL/79MlWhHa1luQRGOxqdPtss9PQ9UsF+pcIMT1tY8OkMgf9KAj6LcBM52t+pR+m2/1iKQsnDI6BNN8PyHuOml3xwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uegni6lR; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uegni6lR"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d43db0c17so1407407b3.3
        for <linux-man@vger.kernel.org>; Fri, 11 Sep 2026 21:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789187954; x=1789792754; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=efhlHRrBJo3mbjoF8c+yNSApNCKSwQ8UpQBI9tLzZNo=;
        b=Uegni6lRN299CHym2HrGEtoCAuwX784RoEAeQiL1BySFa6Fy/jvYLd6CSxl5GihZaU
         IFCpGSTSNR8FzBdWIsoJksaJByJcWCH67QCwtQw6srwsMsxhrbeCGRWIlRF5u516kDUh
         H9P8ZkSpqIB+Y7bT/qR8jnLaAUxVYT4XztuJhIAa4cN680EK3DO6JpVo5cBv0CYtTABu
         MYF9NxXlEsR5TSFc7w+yTUF1Lt4Rf9WFov+4goJKOaF/VwOji5VziHdVyJ9+fYdlArkz
         wSYayLDNexnG2WOI7yi0jFZ6Ccqs7BeLQhCD2TIBvxhWqIPshEfHH+sRvRb1R3FEIvQD
         etJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789187954; x=1789792754;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=efhlHRrBJo3mbjoF8c+yNSApNCKSwQ8UpQBI9tLzZNo=;
        b=lUpZlWhnWLJkO0VQ5cnAczBHXWTKNm5e52ZYmKpybC6w0HwIsKg437TySEyA9o0ALg
         i/2S9M/3w3BHPqSK584VCYGDdw81Mn/7P+3J9dblvWXj9fhUOOqjK8qnGsVPOHbgpqtk
         ftUKmRAfuDoj8fGxYror4eRm0Ep8e9MH2jeQ078GIMmFeh0NYJxOTKfwah36RV7AUhw7
         ccIaw+AAY24eDttfiSXymw/STzjeoVnQ1n4aWLwPZ1dQ1KSJ/3C5Vdc5znLA7tFz0uxm
         ZGskVVrCoL1bA592yt4Dn7RzN4eW/XkzUbU1NdvNzN5P+nIXCKb/rKPywHIW6IoM3w59
         VjtA==
X-Forwarded-Encrypted: i=1; AKwUvBxF96QyHPsQS15j89Sv3OVnaop1s1x5O3FwIE0UrCRIRHwn9BPq9Z1eW1alXkJTEfTZpnAbibnisRE=@vger.kernel.org
X-Gm-Message-State: AFuF++kzmvf+iu+LfsYehw0nT7qGHWO/Gqc0jijtabTdwrjlSrY2iLjn
	m71Sb9FHOuAKiFfSENpwIAWyi+IY0YzMSnXSL74K1Sokt6FGdvcG+7a/l7MLfw==
X-Gm-Gg: AYBFou2nnfOe8Yw7SKEuZgd1GTVANjMYRj1EQfAtxg38qLYiE5Vo3Ezd7NXInDpDN07
	bCJDyZqlYYiEc/cywMmEDjOxQAXQMD/56W93CjB3nxoCemFeDFDqB8gbBVnAdyBIzI9J1YhNcKN
	u5o11NbXu3kceOUJhiXzqYOKpN0UPTOTtIdCWMNm3FiPL9X/4jNKZp9yHJ/P3vIQ4SNhLT7ZlOY
	gNvBb0QNmaWlNfYDxddo7zRzea9g+Xvih8Purg9V3aUm0slT30/8ZtSGwg0plb4WyVg9fFTSTNT
	uUNKkL952P3ZTAhQ+++ugPmyYZYz83K/8JmuXZFT2ZsP1tofBHprfvZ633RWiFwesMsDizE+duw
	Ce98EozDD9Ec6g0wdyTUP6zhNzzFt6j3kmjvMswwEgnznLc6dTNf4n74PAbRuYwL8auPTwazW96
	UYDU921mnxrDTGGAI4uUz6UqV4d/mvyTcuap+xfmxm1dkQ8hmTMIsS3fzsJpQs4xdL3o2UTo8MB
	gCXQ0W2ZA==
X-Received: by 2002:a05:690c:348a:b0:87f:e953:f6fe with SMTP id 00721157ae682-887a88b6eafmr3427587b3.27.1789187953591;
        Fri, 11 Sep 2026 21:39:13 -0700 (PDT)
Received: from illithid ([2600:1702:7cd0:e980:4f4c:9d3d:ae83:2fcc])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-88487ea9478sm18077587b3.34.2026.09.11.21.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 21:39:12 -0700 (PDT)
Date: Fri, 11 Sep 2026 23:39:10 -0500
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: Douglas McIlroy <douglas.mcilroy@dartmouth.edu>,
	linux-man@vger.kernel.org
Subject: Re: syntax of options in man1
Message-ID: <20260912043910.2ad4suatviwuvtab@illithid>
References: <CAKH6PiXDGL658h1t_bstW0Z+MjjJfcNmcde-DA3QNOYKc0TTGg@mail.gmail.com>
 <aljtsrJVLTN6qlxP@devuan>
 <20260716155544.o7fx7ecnpjj5sdai@illithid>
 <alkEKUNzTGnpiYdH@devuan>
 <20260716170548.am3fg45uaudlqpl2@illithid>
 <aqRGphJuo70C_e7G@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4rbyt7ouvs4r323u"
Content-Disposition: inline
In-Reply-To: <aqRGphJuo70C_e7G@devuan>


--4rbyt7ouvs4r323u
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: syntax of options in man1
MIME-Version: 1.0

Hi Alex,

At 2026-09-11T20:43:12+0200, Alejandro Colomar wrote:
> > Date: 2026-07-16 12:05:48-0500
> > From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
> > At 2026-07-16T18:20:30+0200, Alejandro Colomar wrote:
> > > I've had plans to write new pages for coreutils, and haven't done
> > > it yet.  Maybe it's the time that I do that.
> >=20
> > The reason coreutils's man pages look this way is because they
> > prefer to maintain much or all traditional man page information in
> > each command's help message ("tail --help")[1] and then generate a
> > man page from that using help2man(1), which fills in a man page
> > template named "chmod.x" or similar.
>=20
> Indeed.  I'm working on getting rid of that coupling, and have
> hand-written coreutils' manual pages.  I've advanced a lot already.

Cool!  Please apprise the groff list of any questions or difficulties
with man(7) markup.

> > Here's the thread where I learned that fact.
> >=20
> > https://lists.gnu.org/r/coreutils/2026-05/msg00080.html
> >=20
> > Maybe we can make help2man(1) better.  And/or drive constructive
> > reforms to GNU-style help messages...
>=20
> No.  I'll refine the existing generated manual pages, and after that,
> maintain them manually.  That'll be much better.

Are the coreutils maintainers aware of your plan?  Have they opined?

> > [1] I distinguish "usage" messages from "help" messages because a
> >     "usage" message is what you get when you invoke a command in a
> >     manner it recognizes as syntactically invalid.  This is an
> >     ancient Unix tradition.  The usage message should be short,
> >     summarizing only the available invocation forms without
> >     attempting to explain them.
> >=20
> >     A "help message" is more of a GNU thing, part of that system's
> >     campaign to standardize `--version` and `--help` "long options",
> >     a practice I regard as mostly salutary and benign.  For example,
> >     I am annoyed by *BSD utilities that afford no means of inquiring
> >     of their provenance.  There's often no way to say "identify
> >     yourself".
>=20
> I prefer asking the system to identify programs.
>=20
> 	alx@devuan:~$ which cat
> 	/usr/bin/cat
> 	alx@devuan:~$ which cat | xargs dpkg -S
> 	coreutils: /usr/bin/cat
> 	alx@devuan:~$ which cat | xargs dpkg -S | cut -f1 -d: | xargs dpkg -l | =
tail -n1
> 	ii  coreutils   9.10-1devuan1   amd64          GNU core utilities

As you anticipate below, that works great until you encounter a system,
possibly an embedded one, where a package manager isn't present in the
environment.  Think of tools like Buildroot.[1]

Historically, as in decades ago, system builders used to mandate SCCS or
RCS revision control of source files, and the population of static
strings in those source files to store RCS "ident"s or SCCS "what"s.
I'm using the names of the tools that scanned for these strings.  You
could then run such a tool on the compiled executable--on _any_
host--and get a dump of the configuration of source files that it was
translated from.

> When a program wasn't installed as a debian package (and thus dpkg(1)
> doesn't know about it), I try to put it under /opt, in a directory
> that identifies the build date and the reason to build it (the git
> branch).  A couple of examples:
>=20
> 	/opt/local/gnu/groff/20260823_master/
> 	/opt/local/mutt/mutt/20260906_references/

That's one alternative solution.  Another, arguably even better though
it requires more overhead in terms of build system management, is to
generate a UUID for a specific compilation process.  That enables
traceability to a specific build host and other configuration details,
like compiler flags.

The more sophisticated we get with reproducible builds and producing
"software bills of materials", the easier it becomes to earnestly and
fully comply with requirements of copyleft licenses like the GNU GPL.

It follows that we must pump money into rewriting everything GPLed in
Rust and slap the Apache License on the result.  If nobody can prove
that your SWBOM is a lie, you have no liability for it.

Good engineering practices are a cost center.  Cut them, and increase
returns to shareholders.  It's your moral duty.[2]

> But yes, for programs not controlled by dpkg(1), it can become messy,
> and thus interesting to have an "identify yourself" option.

Yes.  That's why I always want one in the tools I use.

> >     What I _don't_ want, as a user, is to be blitzed with 100 lines
> >     of "help" when all I did was mistype a command invocation.
> >=20
> >     In an attempt to practice what I preach, groff's usage
> >     messages--uniformly, I think--look like this.
> >=20
> >     $ tbl -X
> >     tbl: error: unrecognized command-line option 'X'
> >     usage: tbl [-C] [file ...]
> >     usage: tbl {-v | --version}
> >     usage: tbl --help
> >=20
> >     A true Unix grognard would desire _only_ the second line,
>=20
> I might have become more grognard than the grognards, but I'd only
> want the first line.  That is, the 'tbl: error: ...'.  Then it should
> be my job to read the manual page, which should have this kind of
> information.

I've found it useful to get the terse reminder of invocation methods,
though I concede that's not as terse as not offering the reminder at
all.

Consider the Thompson limit of the grognard principle.

$ tbl -X
?
$ echo $?
0

The conventions of issuing error messages _to the standard error
stream_, using a non-zero exit status on failure, and _identifying
oneself in diagnostic messages_, were all practices recognized by
McIlroy in the late 1980s as salutary--but were implemented half-
heartedly even at the Bell Labs CSRC where Unix was born.[3]

> Indeed:
>=20
> 	$ MANWIDTH=3D64 man 1 tbl | head -n12
> 	tbl(1)              General Commands Manual              tbl(1)
>=20
> 	Name
> 	     tbl - prepare tables for groff documents
>=20
> 	Synopsis
> 	     tbl [-C] [file ...]
>=20
> 	     tbl --help
>=20
> 	     tbl -v
> 	     tbl --version
>=20
> It's not like one needs to search through the manual page to find
> this.

Indeed not.  But the information is easy to find because I made sure
that it would be, by trying to maintain a strong discipline of keeping a
program's usage messages in sync with the man page, and of course with
its actual argument processing behavior.

If you audit the tools on your system in these respects, I predict
you'll swiftly find such discipline lacking.

> >     but I
> >     think that (1) error messages should be _explicit_,
>=20
> Yes, but that only means line 1.  The other three lines don't help
> diagnose the error.  They're about correcting it, which is a different
> thing, and I'm not convinced that it's the job of the usage output.

Compiler warnings offer unsolicited help now, too, and LLVM's embrace of
such chatty diagnostic output helped it make inroads against GCC
starting 20 years ago.  ("Not copyleft" and "not from GNU" did most of
the rest.  The number of people nattering about LLVM's purportedly
superior--or at least more modular--architecture exceeded the number
actually employing that architecture to any advantage by several orders
of magnitude.)

Why should people who _aren't_ compiling code get less assistance?

All that said, if the community develops a convention, say an
environment variable indicating desires suppression of expansive usage
messages--call it `TERSE_USAGE` maybe--I'll offer no resistance beyond
saying that I am _not_ offering groff as the first place to pilot it. :)

> I think you really wanted to say that usage should not print a partial
> list of valid invocation forms, and I agree with that.

Yes.

> But I think it should print none, not all.  One should fire up the
> manual page to have a quick look at the SYNOPSIS.  After all, that's
> just a few key presses away.

Think embedded again.  Some target environments rip out the man pages.

> >     even if "everybody knows that all GNU commands support
> >     `--version` and `--help`" because (a) that's not
> >     true--historically, GNU find(1) didn't support it, and the GNU
> >     dynamic linker ld.so appears still not to--and (b) not all
> >     commands are GNU commands.
>=20
> I dislike the fact that all GNU commands accept --version and --help.

What about `--` to mark the end of arguments intended for interpretation
as options?

Back when I was learning Unix, the problem of eliminating a file called
`-rf` in one's home directory was considered a daunting challenge.  One
couldn't be sure how reliable shell quoting was, if one even understood
the concept.  This is also back when people did scary stuff in their
=2Eprofile like:

PATH=3D.:$PATH

=2E..and the equivalent for (t)csh.

Before long I discovered the "magic" of simply prefixing troublesome
file names in the current working directory with "./", and it's remained
a typing habit even in many situations where I don't strictly need it.

> That --and other flags (some from XSI)-- made echo(1) unrealiable, and
> now we need to use the weirder 'printf "%s\n" $foo' in scripts.

I urge you to research this issue more deeply.  We need printf(1) for
more reasons than that.

> I'm not averse to all options, but as I get older, I tend to agree
> more with the BSDs, and think this growth of options wasn't good.

BSD "philosophy" seems to me to be largely an exercise in nostalgia.
That's not necessarily a bad thing, but it is a _vague_ thing.  I agree
with some of the principles of the "suckless" site and disagree with
others, but I credit them for actually _articulating_ the principles
they claim to have sifted from the Unix tradition.  Theirs is not the
only valid perspective, but it's much more satisfying to engage with
someone who has critically evaluated their own perspective and built a
defense of it than with someone who has identified a group of cool kids
they want to emulate, and consequently struggle to articulate defensible
reasons for their practices.

And I don't even knock nostalgia: I'm much too old to dare that.
Sometimes, good things come from it.  But you have to decide upon and
articulate a mission,[4] and see who joins you.

1.  Stallman's devise of copyleft was an explicit effort to recreate the
    ethics of the 1970s MIT AI Lab.  See Levy's _Hackers_.[5]

2.  The ongoing 2.11BSD project is an exercise in seeing how much of a
    32-bit BSD Unix (4.3/4.4-era) can be slimmed down and crammed into
    a 16-bit, at most 4MB PDP-11/70 configuration.  I admire that.[6]
    These days we consider such a device a microcontroller.

Regards,
Branden

[1] https://buildroot.org/
[2] https://www.sbs.ox.ac.uk/oxford-answers/friedman-doctrine-50-years-why-=
its-time-change
[3] https://www.cs.dartmouth.edu/~doug/reader.pdf

[4] Two of the major surviving BSDs have a perceptible and
    comprehensible mission: NetBSD's is "run on everything" and
    OpenBSD's is "be security-invulnerable".  These are defensible
    goals, even if they're not 100% achievable.

    By contrast, it's not clear to me what FreeBSD's mission is, beyond
    "pretend BSDI didn't fall apart due solely to a three-headed
    USL/GNU/Finnish conspiracy".  Or maybe it's simply "groom engineers
    for consumption by Apple".  If that's the case, FreeBSD may have
    succeeded best of all.

[5] https://www.stevenlevy.com/hackers-heroes-of-the-computer-revolution
[6] https://www.tuhs.org/Archive/Distributions/UCB/2BSD/2.11BSD/Patches/

--4rbyt7ouvs4r323u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmqk12cACgkQ0Z6cfXEm
bc6CPA/9FFZTwhSJwYWVy9/tvjV1C8h3QtCt8TK4PNZhVF6lU6O5+GYeP/Z5MkSJ
ffhNy4awTRbwGHdgpGd2YYB+nmkenXm614y7jlKSaqKTFD4uLQ+oBeNG1fG/Tvv4
ushshS30z/bnXGKLX9nd8Ea7YGj0hukbt8mC7Myp1S6VAGRhGlUMyxMuSmZpR+BS
PIhcOY91klbBd4VMjhS1wdbPFApoh6daa3ggSkdefv7fJ7+DCXBg1j0om0jQEuDR
1jOkHrMfWm+FD4DARMWZIQhEJzdE9IyMuwsrBbn0gEtxC8B0/BLYrSSQmDlQpteT
t2jwV4DvHm1u792KWCnI2CKfo1871oADsMxufwOe0EZvGEGzTfV6x4WsZRaN+GJc
+oaVuOYSeM5t0hIOYQQVApUH4YWP+JGs1ugOKdAkbjfFHUqk6T/Qo7wWdCzqWcGM
SOZC4r8Th/rduIjAoTDZfGao6xDhlC3qDeOS4XQVLmGbg6MiW6X0dD7f9vuS/PQ/
lreggP4hxyeknfk10q1vWnk91aAIF/ZrWuyVXtY0RG0TBjvPxLdX9hgZ0Nw+eav8
dU/q+FxmhME2Yb0M5dF55ZHXU7fet4lMKsZS2yRaaD2b2NPG8x1HbKH0es49ruus
2pQrMBNYrb6jkUltauiNQ47W2NCu/TGrOJMJlVCeJPI8fhf8Xj4=
=h99I
-----END PGP SIGNATURE-----

--4rbyt7ouvs4r323u--
