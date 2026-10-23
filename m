Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792778769;
	b=b/9GbMhYVDBYenszqjKFBQDrFI/dzFaLZJzX1WLPX7X0Wnk09VRloyq3i1WZrgz8dzIo
	 /h1k4iBdU2/u/omT8R6QRzZbimPWlwiZ6Mwgb3JgzwB+Xg9XlYapXM8WhNEA/EBxTLRQG
	 2dIOIYvcrInwGND4NPQczM6RHmF7kESrUdA8fg0Z5LmqIdvAiZ0CpqQkmV9K61McNDXey
	 HuaLQ/C8mvhfWrMauJUYDHY9xy5tW2uIl+PPLCaY10kfWrBqKnRnqfhqvDnJSnPhLsaEi
	 BEoJkbi3llieywrZtbzH/hDhaqLtBWtFBBCt0GksNJDxAEmkb3LLpLHnRgxFzKV2qHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792778769;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=I8dbfIwb5Yb4iWx8dWPXaNhKlCSGW66MDYcfNLOWvsg=;
	b=XO5GjVr7DkR2W44nwi07uOsaEe8QDeS9EPuzPWuTMHo0tguZKKYqZKijBdzvEJCc8Mqe
	 4cN0ZouIxKrKlFOfXmkD/zVf5mQqjjBKPHyxTZomTdFxPqqDxK4LfKflCLuCQb0eiPusv
	 U+tXngVp3bwuxFYoXU5/qCq/wVQeywZx3XfEyjKB/tAl1EEk5oaYbJzIvfzwgkssZAQhV
	 1skfKvFe/VZh+zUGvpXWH4p32YeGxdgdPC3Q66fIGWvNK67XIVEsNsSyaAZQ81Zdkt5ub
	 36bGjj0iAw5zm5jlC1XrlEB3JQmM27L8dWkRj+b/X7VzlqcoJAropbgNyjzE717JkGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hX1iIrUo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E5B606A31B
	for <linux-man@vger.kernel.org>; Fri, 23 Oct 2026 18:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hX1iIrUo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C37BD1F01825;
	Fri, 23 Oct 2026 18:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792778768;
	bh=I8dbfIwb5Yb4iWx8dWPXaNhKlCSGW66MDYcfNLOWvsg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hX1iIrUot5KO35HLygXD0r2Fc48aXMcJ020VZdMcV4lMqs//6LTCzEc/6j8X5erhG
	 4D8WoFxtDEX68tDI2rjqPaYXHwWUkymTstaW99FeMTcLgnEq4fxBy+lO9Dmao9Ga4N
	 5n0JHdIG+TbIKQg4jC082e0/I9j0fNfORAZrqZ1ghn1sxBPftpnzsvNxRLi7FfWq5d
	 sr+QlgYN63gbGTPFUA+aFxSSFtd9X20I4Imvkz9lOs8Hakdh4XvZDUap3qjzM7E4yZ
	 cLHfcp/S2LzBuHtqABinFjLyJpqok4/PaYU+gL+hTuy7okcbz6jUvUWRVE3vYxxZao
	 wi1ouAbOnVLVA==
Date: Fri, 23 Oct 2026 20:06:01 +0200
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Hugo Buddelmeijer <hugo@buddelmeijer.nl>, linux-man@vger.kernel.org
Subject: Re: table layout in console_codes.4 (was: `make -R check` fails due
 to futex_waitv.2 and console_codes.4 being too wide)
Message-ID: <atugtpm0SfMnnTYj@debian>
References: <atZJ7QGljZ4K50wD@debian>
 <1e4d35e5-f8af-402b-9cdb-46a70f793b96@buddelmeijer.nl>
 <20261019224145.aovalqyh2fpcdzdk@illithid>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5mk5puhxzvtk77ru"
Content-Disposition: inline
In-Reply-To: <20261019224145.aovalqyh2fpcdzdk@illithid>


--5mk5puhxzvtk77ru
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Hugo Buddelmeijer <hugo@buddelmeijer.nl>, linux-man@vger.kernel.org
Subject: Re: table layout in console_codes.4 (was: `make -R check` fails due
 to futex_waitv.2 and console_codes.4 being too wide)
Message-ID: <atugtpm0SfMnnTYj@debian>
References: <atZJ7QGljZ4K50wD@debian>
 <1e4d35e5-f8af-402b-9cdb-46a70f793b96@buddelmeijer.nl>
 <20261019224145.aovalqyh2fpcdzdk@illithid>
MIME-Version: 1.0
In-Reply-To: <20261019224145.aovalqyh2fpcdzdk@illithid>

Hi Branden,

> Date: 2026-10-19 17:41:45-0500
> From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
>
[...]
> > 	diff --git i/GNUmakefile w/GNUmakefile
> > 	index 9f3ced6f461b..9b480fe5e52c 100644
> > 	--- i/GNUmakefile
> > 	+++ w/GNUmakefile
> > 	@@ -16,6 +16,7 @@ endif
> > 	 MAKEFLAGS +=3D --no-builtin-rules
> > 	 MAKEFLAGS +=3D --no-builtin-variables
> > 	 MAKEFLAGS +=3D --warn-undefined-variables
> > 	+MAKEFLAGS +=3D --silent
> > 	=20
> > 	=20
> > 	 ifndef srcdir
> > 	@@ -66,5 +67,4 @@ help:
> > 	=20
> > 	=20
> > 	 .DELETE_ON_ERROR:
> > 	-.SILENT:
> > 	 FORCE:
> >=20
> > and it seems to work.  If you use --no-silent on the command line, it
> > overrides the default.  I'll check better before committing.
>=20
> Cool!

Committed and released.  :-)

[...]
> > I'd love a formal patch, especially with a good commit message.  :)
>=20
> I'm sure.  But I'm dealing with yet another late-release-cycle fire
> drill in groff right now, unfortunately.

I'm patient.  MR.sed made me learn.  :p

[...]
> And on second thought it occurs to me that you may not want that column
> in the table after all, since they are all *roff comments intended (I
> think) only for inspection by the document maintainer, not by the
> reader.  In that case what you want to do is not add a column, but stop
> supplying excess table entries--in other words, discard the tab
> character before the `\"` comment escape sequence.

Yes, and no.

> diff --git a/man/man3/matherr.3 b/man/man3/matherr.3
> index 2e179e358..8711ee3cd 100644
> --- a/man/man3/matherr.3
> +++ b/man/man3/matherr.3
> @@ -200,9 +200,9 @@ .SS Math functions that employ matherr()
>  acos(|x|>1)    DOMAIN  HUGE    y       EDOM
>  asin(|x|>1)    DOMAIN  HUGE    y       EDOM
>  atan2(0,0)     DOMAIN  HUGE    y       EDOM
> -acosh(x<1)     DOMAIN  NAN     y       EDOM    \" retval is 0.0/0.0
> -atanh(|x|>1)   DOMAIN  NAN     y       EDOM    \" retval is 0.0/0.0
> -atanh(|x|=3D=3D1)  SING    (x>0.0)?        y       EDOM    \" retval is =
x/0.0
> +acosh(x<1)     DOMAIN  NAN     y       EDOM\" retval is 0.0/0.0
> +atanh(|x|>1)   DOMAIN  NAN     y       EDOM\" retval is 0.0/0.0
> +atanh(|x|=3D=3D1)  SING    (x>0.0)?        y       EDOM\" retval is x/0.0

It was certainly more readable with the tab.  Would a couple of spaces
be okay?  Or will they produce spurious space too that might fail?

[...]
>=20
> (Also attached.)
>=20
> If the foregoing looks ugly, bear in mind that you're wandering a bit
> off the path with these comments.
>=20
> tbl(1):
> Limitations
>      Within a tbl region (except in text blocks or on roff control
>      lines), avoid escape sequences that read the rest of the input
>      line, as \" and \! do.

Hmmm.

> > > I was able to get a complete, successful check with the following
> > > command.
> > >=20
> > > $ make -R check NROFF_LINE_LENGTH=3D80 NROFFFLAGS=3D-Wstyle
> >=20
> > Thanks!  Would you mind sending a formal patch set?  =3D)
>=20
> I'll need a reminder when I feel less swamped (after groff 1.25.0,
> likely), or someone else can steal my fixes.  :)

Okay.  Do you have an estimate of when I should poke you?  As in maybe
one month or two?

> > > I needed to override `NROFFFLAGS` because of a new warning category
> > > in the forthcoming groff 1.25.
> > >=20
> > > groff NEWS:
> > > *  The formatter supports a new warning category, "style".  It is
> > >    used to diagnose input that is non-idiomatic or likely to produce
> > >    an unexpected result (or none at all), but is not invalid.
> > >=20
> > > One of the things it warns about is failure to break an input line
> > > after the end of a sentence is detected.  The Linux man-pages may
> > > want to disable that warning category by default until those have
> > > been cleaned up.  Enabling it will, of course, permit machine-driven
> > > identification of sites requiring such cleanup, which has to date
> > > been tedious, requiring manual inspection or application of regexes
> > > that can be thwarted by the *roff language's context-dependent
> > > grammar.
> >=20
> > We'll see when it arrives.  :)
>=20
> Yeah, I wouldn't want to fool with it before it lands in an official
> release, either.  But this _does_ mean that the Linux man-pages
> documents will appear to "regress" suddenly when the host system
> upgrades to groff 1.25.0, because you use `-ww` to turn on all warnings.

If you're willing to spend some time on helping me address the
diagnostics by improving the pages, that's fine.  :)

> $ git grep -n -B4 '[-]ww' share
> share/mk/configure/build-depends/groff-base/nroff.mk-32-DEFAULT_NROFFFLAG=
S ::=3D \
> share/mk/configure/build-depends/groff-base/nroff.mk-33-        -T$(NROFF=
_OUT_DEVICE) \
> share/mk/configure/build-depends/groff-base/nroff.mk-34-        -rLL=3D$(=
NROFF_LINE_LENGTH)n \
> share/mk/configure/build-depends/groff-base/nroff.mk-35-        -rCHECKST=
YLE=3D$(NROFF_CHECKSTYLE_LVL) \
> share/mk/configure/build-depends/groff-base/nroff.mk:36:        -ww


Have a lovely night!
Alex

--=20
<https://www.alejandro-colomar.es>

--5mk5puhxzvtk77ru
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrbogkACgkQ64mZXMKQ
wqlnIhAAu1gxgItQW+fWZay7ObmfNTBmPvF5OiH/l5Dvm+JEdtIB1LH5eijM45+6
FF3PKdigVB6WmDQLqrCb8lophHQsylEGCDVpnJ8eRo7U6n89aXW6mlV92ftTf28i
g5RyZGyHrpgsjas6jaI+U1xJU30Pc0o9920lY9Qo0P771P1b1DVZMg6uAC+yAsT/
2tB/Tznb9u1oJxguf/pOMDls/Q2kC/C36I6k3gGtESmjtwC1B8wvo9rOFDRSaR+d
3S/nhEYJ1naczkI8OiAsbDSFrdPK2H/WwtWccJLKylcI33y9CsAgBe5g98OuGVCN
HSFjh9ViNpa//apg84Uaj4Nd83q2ERukTtfd3jukhgi7W6/KUMHEqaRXsLIrf7oV
myrEahlvgV9vd7mb/E5/6xODfgHMuzUW9RJ+kuRpjaIKdMp761teguNcDeKHAdfV
to8458oSVK3nYiu88xFYAXlkC0HxcfHZF1s0pO5hujQT+CdagTDg6ftK06j772Tv
Nt3UakdiXnPjIwsS9BEMVOBcoygkVTQL0wU149cfVag60FuNhwATIE+/WKzYn6hl
kGqAwUsfin+0HSm8e47PnowHOnCr/QHIAy1/wQUVzv4utUVGxgO0UOiyZOOhgqNm
SEZzYbWXFlC1m+JtmfK1CCLUgQVbqFjg2kfmGjhRctwCxdQOtkY=
=pFJu
-----END PGP SIGNATURE-----

--5mk5puhxzvtk77ru--
