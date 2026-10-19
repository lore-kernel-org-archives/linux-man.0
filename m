Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792428938;
	b=GECXo+kMDrzq3kTiGjvi4EVphANz2uVgwokPooWZJpKAPCy/FbAWeFpXnavezkr/bEN9
	 lPnaRYF4pdvGL5/fdhhvCH6FR4yfhupWaK+ntwVCMQXYGwBqV/jSbXFZTECAlDoWYSUx9
	 fRdWb5RiaRE3lzHOMkUZAKfsjj0o3zf1VarMWFuumY2KtIVaN31v6rIL/khBiVHEYLYW6
	 /tAD1baIZtOEyJ9QjFheulFYtNoqRSnXLnvyU9Cy8s12uYdLAym/CGicRoVJVuQmgen+r
	 mRFxyI0vYTA+J/VIsEX7H/DsY3Cd1uoQP70jFt4HbB7c0moefNSccBr7DsWhcyBisHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792428938;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=fUR7onQKURBY46NRFrgUEZ8eu1FZUejnzRoWYFusSJY=;
	b=WAVswfkhndaibIDB2YK3DvWRmUsMbJuOB4UTLRCYIAiox3i6TQQYZi0RXlWPUNQvn0vJ
	 ztcY/lJyOuL62WSaLdTlLqY/o3ZkGafciouzgX6+jKG0lIzYuJuZ8gjgxDNYsprdvDynz
	 T63wYk3ui+ibck8q9rvP+UxLFY673NniaNB5x1pEGzQaudcd5DlHfDO9LSAQPNzE+gIUu
	 9y/4sgWbZAJo3qLNhPGzcbh4yTGerCqd7RshyhjFOledtd9vH5cUySAdaoiHippOUK8jy
	 SjMxUeBssOJTPJLvWxtzGwjxHxqYsesH4e9dJWGTx6IWAJe8OVADlSu+ASdazIWGhDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iODQa7le;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAE2606A32A
	for <linux-man@vger.kernel.org>; Mon, 19 Oct 2026 16:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iODQa7le
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2F531F000CE;
	Mon, 19 Oct 2026 16:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792428937;
	bh=fUR7onQKURBY46NRFrgUEZ8eu1FZUejnzRoWYFusSJY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iODQa7le08GSnqBCeL+Hq852hzYUvXV4EAIKupRiuUhVKlW+7ZZQacNPzbQgIydir
	 f0/2wvIz+k2TpZ+A8iq/v3/TGUw1ccGulk+/+tzev73FKCxd/pIBHHMYlWbd7yBosQ
	 MuLjXq58OfF8f0JdfQuPCbaNXpVTVRHUZslYfyi06jux/6iZpmpWf0MqSyv41iMRFM
	 moB2ZRvQyNptQsToaeUxjCziDYsyjb3q1+nLK28A7U6L74e+Un5RGQqGL8LWpTQhu5
	 Qd4/metAeZlOZKrXezoxMa+uDMQfhr4vwTcnFc47//s3K8oXKK/qe1lfdEa42gXBLm
	 ENzKa1BKikDQg==
Date: Mon, 19 Oct 2026 18:55:32 +0200
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Hugo Buddelmeijer <hugo@buddelmeijer.nl>, linux-man@vger.kernel.org
Subject: Re: table layout in console_codes.4 (was: `make -R check` fails due
 to futex_waitv.2 and console_codes.4 being too wide)
Message-ID: <atZJ7QGljZ4K50wD@debian>
References: <448efb68-e2ff-41d8-a575-97da30e293ff@buddelmeijer.nl>
 <atW2F1hvJPm2WV5y@debian>
 <20261019130235.ehdncu4zh4mm2h3o@illithid>
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
	protocol="application/pgp-signature"; boundary="msvixjc3fcm4wxpd"
Content-Disposition: inline
In-Reply-To: <20261019130235.ehdncu4zh4mm2h3o@illithid>


--msvixjc3fcm4wxpd
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Hugo Buddelmeijer <hugo@buddelmeijer.nl>, linux-man@vger.kernel.org
Subject: Re: table layout in console_codes.4 (was: `make -R check` fails due
 to futex_waitv.2 and console_codes.4 being too wide)
Message-ID: <atZJ7QGljZ4K50wD@debian>
References: <448efb68-e2ff-41d8-a575-97da30e293ff@buddelmeijer.nl>
 <atW2F1hvJPm2WV5y@debian>
 <20261019130235.ehdncu4zh4mm2h3o@illithid>
MIME-Version: 1.0
In-Reply-To: <20261019130235.ehdncu4zh4mm2h3o@illithid>

Hi Branden,

> Date: 2026-10-19 08:02:35-0500
> From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
>
> Hi Alex & Hugo,
>=20
> At 2026-10-19T08:20:29+0200, Alejandro Colomar wrote:
> > > Date: 2026-10-17 21:19:22+0200
> > > From: Hugo Buddelmeijer <hugo@buddelmeijer.nl>
> > > Running `make -R check` fails because the text in futex_waitv.2 and
> > > console_codes.4 is too wide.
> [...]
>=20
> I observe that the failure doesn't tell you why the "check" target is
> failing.  It simply says "GREP" and then the output of grep itself.  We
> are not informed what grep was looking for.
>=20
> I also observe that setting `V=3D1` is useless to get these Makefiles to
> tell us what they're actually doing.

Hmmm, this gave me a good idea.  I don't like this V variable, since
it's unclear what it should do in each project, but I've played with
this patch:

	diff --git i/GNUmakefile w/GNUmakefile
	index 9f3ced6f461b..9b480fe5e52c 100644
	--- i/GNUmakefile
	+++ w/GNUmakefile
	@@ -16,6 +16,7 @@ endif
	 MAKEFLAGS +=3D --no-builtin-rules
	 MAKEFLAGS +=3D --no-builtin-variables
	 MAKEFLAGS +=3D --warn-undefined-variables
	+MAKEFLAGS +=3D --silent
	=20
	=20
	 ifndef srcdir
	@@ -66,5 +67,4 @@ help:
	=20
	=20
	 .DELETE_ON_ERROR:
	-.SILENT:
	 FORCE:

and it seems to work.  If you use --no-silent on the command line, it
overrides the default.  I'll check better before committing.

> While attempting to reproduce Hugo's results, I also noticed the
> following messages on stderr.
>=20
> TBL             .tmp/man/man3/matherr.3.eqn
> tbl:".tmp/man/man3/matherr.3:204: warning: ignoring excess table entry at=
 row 5, column 6: "\" retval is 0.0/0.0"
> tbl:".tmp/man/man3/matherr.3:205: warning: ignoring excess table entry at=
 row 6, column 6: "\" retval is 0.0/0.0"
> tbl:".tmp/man/man3/matherr.3:206: warning: ignoring excess table entry at=
 row 7, column 6: "\" retval is x/0.0"
> tbl:".tmp/man/man3/matherr.3:241: warning: ignoring excess table entry at=
 row 42, column 6: "\" different from log()"
> tbl:".tmp/man/man3/matherr.3:242: warning: ignoring excess table entry at=
 row 43, column 6: "\" different from log()"
> tbl:".tmp/man/man3/matherr.3:249: warning: ignoring excess table entry at=
 row 50, column 6: "\" +0 and -0"
> tbl:".tmp/man/man3/matherr.3:257: warning: ignoring excess table entry at=
 row 58, column 6: "\" retval is 0.0/0.0"
>=20
> (These diagnostic messages are new to the forthcoming groff 1.25.)
>=20
> Inspecting the file:
>=20
> $ sed -n 194,205p man/man3/matherr.3
> .\" Details below from glibc 2.8's sysdeps/ieee754/k_standard.c
> .\" A subset of cases were test by experimental programs.
> .TS
> lB lB lB cB lB
> l l l c l.
> Function        Type    Result  Msg?    errno
> acos(|x|>1)     DOMAIN  HUGE    y       EDOM
> asin(|x|>1)     DOMAIN  HUGE    y       EDOM
> atan2(0,0)      DOMAIN  HUGE    y       EDOM
> acosh(x<1)      DOMAIN  NAN     y       EDOM    \" retval is 0.0/0.0
> atanh(|x|>1)    DOMAIN  NAN     y       EDOM    \" retval is 0.0/0.0
> atanh(|x|=3D=3D1)   SING    (x>0.0)?        y       EDOM    \" retval is =
x/0.0
>=20
> This seems like a straightforward case of someone forgetting to update
> the table format--much easier to neglect before I added the new tbl
> diagnostic.  In lieu of a formal patch, here are some replacement lines.

I'd love a formal patch, especially with a good commit message.  :)

> lB lB lB cB lB l
> l  l  l  c  l  l.
> Function	Type	Result	Msg?	errno	\&
>=20
> (In the meantime, I'll try and see if the leading double quote before
> the file name in tbl(1)'s diagnostic is due to groff 1.24/1.25 version
> skew in my environment, or a bug in 1.25 I need to fix before final
> release.  It looks like the former.
>=20
> $ ~/groff-HEAD/bin/groff -tz -man -T utf8 man/man3/matherr.3
> tbl:man/man3/matherr.3:204: warning: ignoring excess table entry at row 5=
, column 6: "\" retval is 0.0/0.0"
> tbl:man/man3/matherr.3:205: warning: ignoring excess table entry at row 6=
, column 6: "\" retval is 0.0/0.0"
> tbl:man/man3/matherr.3:206: warning: ignoring excess table entry at row 7=
, column 6: "\" retval is x/0.0"
> tbl:man/man3/matherr.3:241: warning: ignoring excess table entry at row 4=
2, column 6: "\" different from log()"
> tbl:man/man3/matherr.3:242: warning: ignoring excess table entry at row 4=
3, column 6: "\" different from log()"
> tbl:man/man3/matherr.3:249: warning: ignoring excess table entry at row 5=
0, column 6: "\" +0 and -0"
> tbl:man/man3/matherr.3:257: warning: ignoring excess table entry at row 5=
8, column 6: "\" retval is 0.0/0.0"
> )
>=20
> > > Maybe you could device a better patch though, in particular for
> > > console_codes.  The affected table is much narrower than similar
> > > tables, so some lines that have to be truncated, would easily fit in
> > > one of the other tables.  But I couldn't easily figure out what
> > > determines the column widths, so I didn't fix that.
> >=20
> > I think Branden might be better at that; I've added him to CC.
>=20
> Here's the table as formatted using groff 1.25 defaults (same as 1.24),
> with the preceding paragraph for context and to make the location of the
> right margin clear.
>=20
>      It accepts ESC ] (OSC) for the setting of certain resources.   In  a=
ddition
>      to  the ECMA=E2=80=9048 string terminator (ST), xterm(1) accepts a B=
EL to terminate
>      an OSC string.  These are a few of the OSC control sequences recogni=
zed  by
>      xterm(1):
>=20
>      ESC ] 0 ; txt ST           Set icon name and window title to txt.
>      ESC ] 1 ; txt ST           Set icon name to txt.
>      ESC ] 2 ; txt ST           Set window title to txt.
>      ESC ] 4 ; num ; txt ST     Set color num (0=E2=80=90255) to txt.
>      ESC ] 5 ; 0 ; txt ST       Set the color for bold substitution to tx=
t.
>      ESC ] 5 ; 1 ; txt ST       Set the color for underline substitution =
to txt.
>      ESC ] 5 ; 2 ; txt ST       Set the color for blinking substitution t=
o txt.
>      ESC ] 5 ; 3 ; txt ST       Set the color for reverse substitution to=
 txt.
>      ESC ] 5 ; 4 ; txt ST       Set the color for italic substitution to =
txt.
>      ESC ] 6 ; 0 ; val ST       Toggle bold rendition: 0=3Dbold, 1=3Dsubs=
titute by color.
>      ESC ] 6 ; 1 ; val ST       Toggle underscore rendition: 0=3Dundersco=
re, 1=3Dcolor.
>      ESC ] 6 ; 2 ; val ST       Toggle blinking rendition: 0=3Dblinking, =
1=3Dcolor.
>      ESC ] 6 ; 3 ; val ST       Toggle reverse rendition: 0=3Dreverse, 1=
=3Dcolor.
>      ESC ] 6 ; 4 ; val ST       Toggle italic rendition: 0=3Ditalic, 1=3D=
color.
>      ESC ] 10 ; txt ST          Set the foreground text color to txt.
>      ESC ] 11 ; txt ST          Set the background color to txt.
>      ESC ] 12 ; txt ST          Set the text cursor color to txt.
>      ESC ] 13 ; txt ST          Set the mouse cursor foreground color to =
txt.
>      ESC ] 14 ; txt ST          Set the mouse cursor background color to =
txt.
>      ESC ] 15 ; txt ST          Set the Tektronix foreground color to txt.
>      ESC ] 16 ; txt ST          Set the Tektronix background color to txt.
>      ESC ] 17 ; txt ST          Set  the  background  text color for high=
lighted (se=E2=80=90
>                                 lected) text to txt.
>      ESC ] 18 ; txt ST          Set the Tektronix cursor color to txt.
>      ESC ] 19 ; txt ST          Set the foreground text color  for  highl=
ighted  (se=E2=80=90
>                                 lected) text to txt.
>      ESC ] 46 ; name ST         Change  log file to name (normally disabl=
ed by a com=E2=80=90
>                                 pile=E2=80=90time option).
>      ESC ] 50 ; fn ST           Set font to fn (the escape code is normal=
ly disabled;
>                                 see "allowFontOps" in xterm(1)).
>      ESC ] 104 ; num ST         Reset color for mode 4;num
>      ESC ] 105 ; num ST         Reset color for mode 5;num
>      ESC ] 106 ; num ; val ST   Exactly equal to 6;num;val.  (no "reset" =
logic)
>      ESC ] 110 ST               Reset color for mode 10.  Codes 111=E2=80=
=90119 map to reset=E2=80=90
>                                 ting modes 11=E2=80=9019, respectively.
>      ESC ] mode ; ? ST          Query  the  respective  property/color/et=
c.    (modes
>                                 4,5,10=E2=80=9019,50)
>=20
> We can see that this line is troublesome:
>=20
>      ESC ] 6 ; 0 ; val ST       Toggle bold rendition: 0=3Dbold, 1=3Dsubs=
titute by color.
>=20
> My hunch is that the rightmost column is not set in a text block when it
> should be.  What's a text block, you ask?
>=20
> tbl(1):
>    Text blocks
>      An ordinary table entry=E2=80=99s contents can make a column, and th=
erefore
>      the table, too wide; the table then exceeds the line length of the
>      page, and becomes ugly or is exposed to truncation by the output
>      device.  When a table entry requires more conventional typesetting,
>      breaking across more than one output line (and thereby increasing
>      the height of its row), it can be placed within a text block.
>=20
>      tbl interprets a table entry of =E2=80=9CT{=E2=80=9D at the end of a=
n input line
>      specially, as a token starting a text block.  Similarly, an entry
>      =E2=80=9CT}=E2=80=9D at the start of an input line ends a text block=
=2E  Text block
>      tokens can share an input line with other table data (preceding T{
>      and following T}).  Input lines between these tokens are formatted
>      in a diversion by troff.  Text blocks cannot be nested.  Multiple
>      text blocks can occur in a table row.
> ...
>=20
> So let's check the page source.
>=20
> $ sed -n 748,762p man/man4/console_codes.4
> .TS
> l l.
> ESC ] 0 ; \f[I]txt\f[] ST       T{
> Set icon name and window title to
> .IR txt .
> T}
> ESC ] 1 ; \f[I]txt\f[] ST       Set icon name to \f[I]txt\f[].
> ESC ] 2 ; \f[I]txt\f[] ST       Set window title to \f[I]txt\f[].
> ESC ] 4 ; \f[I]num\f[] ; \f[I]txt\f[] ST        Set color \f[I]num\f[] (0=
-255) to \f[I]txt\f[].
> ESC ] 5 ; 0 ; \f[I]txt\f[] ST   Set the color for bold substitution to \f=
[I]txt\f[].
> ESC ] 5 ; 1 ; \f[I]txt\f[] ST   Set the color for underline substitution =
to \f[I]txt\f[].
> ESC ] 5 ; 2 ; \f[I]txt\f[] ST   Set the color for blinking substitution t=
o \f[I]txt\f[].
> ESC ] 5 ; 3 ; \f[I]txt\f[] ST   Set the color for reverse substitution to=
 \f[I]txt\f[].
> ESC ] 5 ; 4 ; \f[I]txt\f[] ST   Set the color for italic substitution to =
\f[I]txt\f[].
> ESC ] 6 ; 0 ; \f[I]val\f[] ST   Toggle bold rendition: 0=3Dbold, 1=3Dsubs=
titute by color.
>=20
> Yup.
>=20
> The fix is straightforward: put the table cell in a text block.  But
> there is one other entry in this table that is too wide.
>=20
> $ diff -u man/man4/console_codes.4{.old,}

No git-diff(1)?  :D

> --- man/man4/console_codes.4.old        2026-10-19 07:40:06.562768271 -05=
00
> +++ man/man4/console_codes.4    2026-10-19 07:44:11.729514217 -0500
> @@ -759,8 +759,12 @@
>  ESC ] 5 ; 2 ; \f[I]txt\f[] ST  Set the color for blinking substitution t=
o \f[I]txt\f[].
>  ESC ] 5 ; 3 ; \f[I]txt\f[] ST  Set the color for reverse substitution to=
 \f[I]txt\f[].
>  ESC ] 5 ; 4 ; \f[I]txt\f[] ST  Set the color for italic substitution to =
\f[I]txt\f[].
> -ESC ] 6 ; 0 ; \f[I]val\f[] ST  Toggle bold rendition: 0=3Dbold, 1=3Dsubs=
titute by color.
> -ESC ] 6 ; 1 ; \f[I]val\f[] ST  Toggle underscore rendition: 0=3Dundersco=
re, 1=3Dcolor.
> +ESC ] 6 ; 0 ; \f[I]val\f[] ST  T{
> +Toggle bold rendition: 0=3Dbold, 1=3Dsubstitute by color.
> +T}
> +ESC ] 6 ; 1 ; \f[I]val\f[] ST  T{
> +Toggle underscore rendition: 0=3Dunderscore, 1=3Dcolor.
> +T}
>  ESC ] 6 ; 2 ; \f[I]val\f[] ST  Toggle blinking rendition: 0=3Dblinking, =
1=3Dcolor.
>  ESC ] 6 ; 3 ; \f[I]val\f[] ST  Toggle reverse rendition: 0=3Dreverse, 1=
=3Dcolor.
>  ESC ] 6 ; 4 ; \f[I]val\f[] ST  Toggle italic rendition: 0=3Ditalic, 1=3D=
color.
>=20
> I still got the warning about the table being too wide, spuriously.
> That appears to be due a workaround for old bugs in GNU tbl.[1]
>=20
> $ git grep NROFF_LINE_LENGTH
> share/mk/configure/build-depends/groff-base/nroff.mk:ifndef NROFF_LINE_LE=
NGTH
> share/mk/configure/build-depends/groff-base/nroff.mk:NROFF_LINE_LENGTH   =
 ::=3D $(shell $(EXPR) $(MANWIDTH) - 2)
> share/mk/configure/build-depends/groff-base/nroff.mk:   -rLL=3D$(NROFF_LI=
NE_LENGTH)n \
>=20
> I was able to get a complete, successful check with the following
> command.
>=20
> $ make -R check NROFF_LINE_LENGTH=3D80 NROFFFLAGS=3D-Wstyle

Thanks!  Would you mind sending a formal patch set?  =3D)

> I needed to override `NROFFFLAGS` because of a new warning category in
> the forthcoming groff 1.25.
>=20
> groff NEWS:
> *  The formatter supports a new warning category, "style".  It is used
>    to diagnose input that is non-idiomatic or likely to produce an
>    unexpected result (or none at all), but is not invalid.
>=20
> One of the things it warns about is failure to break an input line after
> the end of a sentence is detected.  The Linux man-pages may want to
> disable that warning category by default until those have been cleaned
> up.  Enabling it will, of course, permit machine-driven identification
> of sites requiring such cleanup, which has to date been tedious,
> requiring manual inspection or application of regexes that can be
> thwarted by the *roff language's context-dependent grammar.

We'll see when it arrives.  :)


Have a lovely night!
Alex

>=20
> Regards,
> Branden
>=20
> [1] https://savannah.gnu.org/bugs/?63749
>     https://savannah.gnu.org/bugs/?63640
>     https://savannah.gnu.org/bugs/?62471



--=20
<https://www.alejandro-colomar.es>

--msvixjc3fcm4wxpd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrWS34ACgkQ64mZXMKQ
wqkqQw//Q2PFqnNc8kY3w7/mwmvblSVV3iorsTlrtkR6TAjtZdWz39aQaVXpOUHD
lftEGdKh/qfUCEIVr4Rta259B1Bd/VTO1qonbPzxuMpK9KzTtaQsipRnrrA0AyPS
DRjXIOH1TkOPwSG9jsUtDGsmPlpcTtXZsAUBItUyJ7Kyb1vbA+mj4kwRI0mZm3Q9
UmApJj1gy5oqkbumCeE5ztxcLpQJRnPURWlZwh8+761phib0OHKSS36hQBUHkqDO
6ZUG41KsL9mJgm6wHHP6IuN7dXIj1mknJ14llgsXfxTbosb+Gy44pNHQ+zfpt8xs
cY8cNWu5EbuI5T0OsJ9F7kkKsNQCsy35bYnGoF8DrUoSrlPa1jliEtHvSGm7UfAS
U3NtZ61g4W80/Ta/e7napmCjeqd0ketH/uvTgvxq6sTrb6A50CX9BH6JDZQNUhzl
4Cuf1zLKVZA1KNlXUWc58DS6XI1PXbWNMSPSg3brdxb9wSyXK+XCp0vMIm7Tht3+
r84/kB4gDHWT2YTNzRpj3R5DGQYa4v9eY0abwy9848HTr8RmfVmV4JVzsMWx91xE
3r2knuE66BEJtmCihC1l+hPPw7fv/3ztQFoUfrK84G+d07qLGW9nkajyluC4tCfX
vdcuYghPd59iSKj8Tvyw17JxEHJi2JTT/+At9O8dfi2RDrMw0X8=
=6CDg
-----END PGP SIGNATURE-----

--msvixjc3fcm4wxpd--
