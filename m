Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE533C768B
	for <linux-man@vger.kernel.org>; Wed, 15 Jul 2026 21:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784149762; cv=none; b=EcftEReJ9lHKeB8GM6RFBcyDV2OzdYNlYD/1BkmdLv/d2eoBErdIM2shGVdfYsOiPbQVBt8YEYmyV9xA06zbjbo44gHYAU8aI2oHCBNwalvRNOwjtp9pFCSrkYqC7uZjwAY75TcY+FUidWBFGNKOBy7tXnjD6p5zBgHQV7Sicyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784149762; c=relaxed/simple;
	bh=xNW9Ex++mr8fXupOquQM52sCgjIwbH8V7NhjGImG404=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uHBVo7EGH9TTrjfAWdzYzGK8NPpPWlxLzhcDXiSBHBoMUni9VelrKBLIkAdb7kfRG094CYhHVF0cA9b6yzsjzeGRDmPeWNY+SzDzKtkOJVpcgA5/5ckP7DaDJ5eU5Y8781Sdcc2jgRKo5dybVkn4+e5KWPAlzXGma+dKi/rTVCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NY2U0Tu3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NY2U0Tu3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00EF01F000E9;
	Wed, 15 Jul 2026 21:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784149760;
	bh=hBTpZS9dfPnB7U/Fa/iMR+t76MmhtGAD5kcgD4s+w5o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NY2U0Tu3tkab8FW0WsbWmHrHHWY5ECs/t2Dw0DicyVzF5spwnyIaiJxfqVxR13t5n
	 cn1egafABqR167Rs1CP6ldIo66pim7ZZ5nXnAEluDGY/vGe2zE6UbofChTq2t25Cqq
	 3m7rvBazUKKPWPSAajR+7abZL5pw54K8agxzqzOGSjwG8XIiIOznkY1SwEkDwV6VZC
	 KluscAXoFSdOlwoSuiYy1R+hxzV0manbqeBaFT5fPmv+UUt/7jvjuqAW4ec48JslBa
	 VEdBCooeoQ5tuUYBwRdrMxXbf8ADvVGHiGI3ELAEiaQNsEElb8Pe/q9A7CL5B1/wPE
	 G3S9eS8tUCgIQ==
Date: Wed, 15 Jul 2026 23:09:16 +0200
From: Alejandro Colomar <alx@kernel.org>
To: DJ Delorie <dj@redhat.com>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	linux-man@vger.kernel.org
Subject: Re: man/man8/ldconfig.8: document system-wide tunables
Message-ID: <alfwyVnZSgMgWskj@devuan>
References: <20260715165450.iakjkw6qwgcnpzq7@illithid>
 <xnqzl46rp6.fsf@greed.delorie.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r6lqpg4k2q4lo4yx"
Content-Disposition: inline
In-Reply-To: <xnqzl46rp6.fsf@greed.delorie.com>


--r6lqpg4k2q4lo4yx
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: DJ Delorie <dj@redhat.com>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>, 
	linux-man@vger.kernel.org
Subject: Re: man/man8/ldconfig.8: document system-wide tunables
Message-ID: <alfwyVnZSgMgWskj@devuan>
References: <20260715165450.iakjkw6qwgcnpzq7@illithid>
 <xnqzl46rp6.fsf@greed.delorie.com>
MIME-Version: 1.0
In-Reply-To: <xnqzl46rp6.fsf@greed.delorie.com>

Hi DJ,

On 2026-07-15T14:19:49-0400, DJ Delorie wrote:
[...]
> > There is, potentially, a _third_ option, which I mentioned in my earlier
> > email.  As I said, literally no one expressed interest.
> >
> > https://lore.kernel.org/linux-man/xno6ge8p38.fsf@greed.delorie.com/T/#m=
9fda91ba28ca257c67d4595f81d38b32c5c9c937
>=20
> glibc uses texinfo, which is TeX but terminals don't have **** off ;-)
>=20
> I think of texinfo as a "TeX compiler".  I don't write programs in
> assembly either (well, usually ;).

I find it easier to write documentation in man(7) than in any other
languages.  It's simple enough that I don't need to remember much.
Also, not needing to compile the documentation makes it also easier to
deal with.  I don't write assembly, but sh(1) scripts are nice for
writing something quick.  :)

> I've always advocated for "whatever system means the docs are stored and
> edited with the code, that I can turn into whatever I need."

If you mean store them in a separate file (such as a .3 file next to the
=2Ec file), I can agree.

If you mean source code comments (that is, in the same file),
I disagree.  I find code without comments to be more readable (assuming
the author of the code doesn't golf, or worse).

[...]
> I wrote the tunables docs a long time ago, but had to
> hold back the patch until I knew which release would have the code
> changes, so they would stay in sync.

You're welcome to send the patches well before they're merged in glibc.
We can review them with enough time.  You can just tell me the feature
is not merged in glibc, and thus I can't merge.

[...]
> > As I understand it, one of Alex's objectives, as was Michael's before,
> > is to keep the files in the man/man* directories directly renderable
> > with "man -l".
>=20
> I agree with that!
>=20
> I just think we could relax the "and must be formatted exactly as a
> release" a bit, in exchange for making it easier to contribute by
> removing one or two rules the contributors need to know.
>=20
> But that assumes that it's (1) purely cosmetic, and (2) automatable.  I
> note that "man" formats according to the window's width, so even the
> official tools don't honor the "and formatted exactly as" rule.

For the tests in the build system, I use MANWIDTH=3D80,
precisely to maintain a consistent width that is the most common one.

	$ grepc -xmk MANWIDTH share/mk/
	share/mk/configure/build-depends/man/man.mk:MANWIDTH ?=3D 80

> (wait, when did "man -l" happen?  Have I been missing that all along?
> Is my script really that old?)

It seems to be there already in the first commit of the man-db.git
repository.

	190b315e1cae (2001-04-26; "Initial revision")

The ChangeLog has some older traces from it:

	Wed Nov 16 20:34:54 GMT 1994  Wilf.  (G.Wilford@ee.surrey.ac.uk)

		* Version: 2.2a7

		* src/man.c (format_and_display_file): Fix bug which caused=20
		`man -l -' to fail. Produce sensible error message when -l file
		is inaccessable. Allow compressed manual pages to be specified when
		using -l (must have correct extension)

		* soelim/soelim.l (main): ensure (progname) is the basename of
		argv[0] .

		* src/manpath.c (main): remove local declaration of (quiet).
		add `--global' option.

So, it's at least as old as 1994.  :)


Have a lovely night!
Alex

--=20
<https://www.alejandro-colomar.es>

--r6lqpg4k2q4lo4yx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpX9vYACgkQ64mZXMKQ
wqmyfQ//UrIidw85JLz4eHg+tqi5R5bLBcSD5NZF3PDDG6p+GVhl0kPomzG32G8Q
dBBfLos2jyHjVdsMwJ00FPzne0/JDXtu+RuJjXpG+HjVgN+yAtOWOYJhCbx0x82M
APVSJp9wjir3tBQ8BiG7nwjrxW0LePbCtXtn8l8Cc7iUmVqQxFqbaBLVh6PdjY5e
QLUJt301NCWSPNpdJ4bDpYyVtaGd/K7XqFRIVfHhHdkuZ8qsSoigad3EZIKd+bar
hzpU+IuWxEIg93QEtLkiUrWOJKxOqS4Y7wb0Gq1SWQVohmWr8vublNNosScsDV3R
EgfOtVnMf5CmJH4fttT1mlqKH1zCueVHCpU+529wDRiRpy+zIsdxACFRFzVbWRmR
qoN4AFH6StLR459J8udsULoFOEf3yL9AXLHFeRRk1Kw2gMRQsQiZLpt8JEKaUIf6
yyHul8k0oeMfaYaUVFdKUA5HBo09UgXPN1IhcaU+Mzj2fcA39opQSClWRoNBpKvo
q7Ws98jI1yiBITq5YUvqfYDLQwcudo+3PTGDZO5H2H1t1e3nq7PP/l1AnvCzy9zk
w39TuBML2/B+r+SRrY8BIa8p1f/Oti4iM+kFTSHon5s5WoXRnAAn8sFqo9KbH9a/
NqFc3Pib9t85eL9Tqf3Qxow3dRF5jAXxEIYYa9ezaItPCgwzRLo=
=NK6D
-----END PGP SIGNATURE-----

--r6lqpg4k2q4lo4yx--
