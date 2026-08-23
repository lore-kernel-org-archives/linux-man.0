Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4B0277CA5
	for <linux-man@vger.kernel.org>; Sun, 23 Aug 2026 13:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787493334; cv=none; b=sCv8G1hVcj+7I8gdUoGyiGX0pHS0R+Yd7+59PE9jUD/oQzwvPh0KX99Mr09uBD23GutzzLAJdYMhwdlCA2c4AcAIQ7xYzrsaZtx6tJwKIG6tJieuSsYOoxSvKBXpwKoIju7gDE02wrqAiToG+7lrT8OJS7i/lSCpiYp282qRxDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787493334; c=relaxed/simple;
	bh=YOs4cO71G8erobUFGls2lPIcD92LP749oDSiFlJkngA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oXPLb8ij5bJkLD+Dtt/3OQPUtvoRRVDFgmpmhNGrHLpP0xEal5AX7uGJOWaf8j2m5uUFol3dOj2I40pCzu4AguQm+yqstkp6qQR+yyCDG7aYO93efeaUfSvl4KLZe6MhVZJtqKIWYdZMCHC8D9ZCwy5yb8TmDZoCYggMXIJsuBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cjvBs1rD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cjvBs1rD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CB5D1F000E9;
	Sun, 23 Aug 2026 13:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787493332;
	bh=BPvcM1f2nXUrNtLR0M1Jo+QrZA/8XgZBlRnNSWgU34A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cjvBs1rDctuf7rB+fRMuYC4lDuT3leZOUag82ZGuo9aH+QmBRFwSFrAHevpfgUibJ
	 k1+FkuvtulNSgRN4oYMHLaeEGBUkdMt8bTQ6bRc5+GHk6RvUkcVcqdX+LiKHnMdZNj
	 oU4ooWfGQcExDJgpUxISxybTG+oUGJJBOUl+kZ2KXazWiV8SB2BB3Je03eCFqRSqZL
	 UAgEYoGBc4h+clzhyId2jsIbwVx2Un4z+J04RbskMQWBD9IEOSTRgWQs7jKKR0Az5F
	 X0hIfpBH2r++aBEw7BASIg+GEq9H8BZrq9QQWtLkHQoxaRn02SGsqRXTtncME2IfuZ
	 IF0SJK1+fHtDA==
Date: Sun, 23 Aug 2026 15:55:29 +0200
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: linux-man@vger.kernel.org
Subject: Re: Using LS/LE (was: [PATCH v4 2/4] man/man5/tunables.conf:
 Document system-wide tunables config)
Message-ID: <aor4LIdGrSGHe3TB@devuan>
References: <anTugcvjragzGpSK@devuan>
 <xn33wr3rr8.fsf@greed.delorie.com>
 <20260807021256.pwzsls7awqmbslti@illithid>
 <aorlBv8YTu4JlZcy@devuan>
 <20260823132749.pgypzsqv32n67wor@illithid>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4nhh642xomruw3ie"
Content-Disposition: inline
In-Reply-To: <20260823132749.pgypzsqv32n67wor@illithid>


--4nhh642xomruw3ie
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: linux-man@vger.kernel.org
Subject: Re: Using LS/LE (was: [PATCH v4 2/4] man/man5/tunables.conf:
 Document system-wide tunables config)
Message-ID: <aor4LIdGrSGHe3TB@devuan>
References: <anTugcvjragzGpSK@devuan>
 <xn33wr3rr8.fsf@greed.delorie.com>
 <20260807021256.pwzsls7awqmbslti@illithid>
 <aorlBv8YTu4JlZcy@devuan>
 <20260823132749.pgypzsqv32n67wor@illithid>
MIME-Version: 1.0
In-Reply-To: <20260823132749.pgypzsqv32n67wor@illithid>

Hi Branden,

> Date: 2026-08-23 08:27:49-0500
> From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
>
[...]
>=20
> > I've tried building groff from git HEAD now, and have some issues.
> > Bootstrap succeeds, configure succeeds, and then make(1) eventually
> > fails:
> >=20
> > 	$ make=20
> > 	  GEN      doc/groff.html
> > 	Cannot find a locale compatible with document strings translations
> > 	doc/groff.texi:12253: warning: @image file `line-layout' (for HTML) no=
t found, using `line-layout.png'
> > 	doc/groff.texi:26767: warning: @image file `gnu' (for HTML) not found,=
 using `gnu.png'
> > 	cp: cannot stat './doc/gnu.png': No such file or directory
> > 	cp: cannot stat './doc/line-layout.png': No such file or directory
> > 	make: *** [Makefile:20047: doc/groff.html] Error 1
> >=20
> > Do you know what's wrong?
>=20
> More or less. It turns out to be damned hard to balance the requirements
> of (1) Automake maintainer mode; (2) building from Git repository
> checkouts; and (3) building from distribution archives.  Bruno Haible
> has been helpful in finding scenarios that don't work.
>=20
> https://lists.gnu.org/archive/html/groff/2026-08/msg00039.html

Hmmmm, now it rings a bell.  bootstrap said something about configure
with maintainer mode, but I ignored that, since I had never used
maintainer mode.

After building with maintainer mode, it works a little bit better.
At least I could install the binaries.  I still see some errors, but
I hope they're unimportant.

	alx@devuan:~/src/gnu/groff/master$ git log --pretty=3Dreference -1
	144585c33ae8 (roff(7): Fix content and style nits., 2026-08-09)
	alx@devuan:~/src/gnu/groff/master$ set -o pipefail;
	alx@devuan:~/src/gnu/groff/master$ ./bootstrap |& tail -n1; echo $?
	./bootstrap: done.  Now you can run './configure --enable-maintainer-mode'.
	0
	alx@devuan:~/src/gnu/groff/master$ ./configure --enable-maintainer-mode --=
prefix=3D/opt/local/gnu/groff/test/ |& tail; echo $?
	  a --with-appdefdir option).

	  If the gxditview app-defaults are installed in a directory that is not
	  one of the default X11 directories for this purpose (common defaults
	  are /usr/lib/X11/app-defaults, /usr/share/X11/app-defaults, and
	  /etc/X11/app-defaults), you will have to set the environment variable
	  XFILESEARCHPATH to this path.  More details can be found in the X(7)
	  manual page, or in the document "X Toolkit Intrinsics - C Language
	  Interface manual".
	      =20
	0
	alx@devuan:~/src/gnu/groff/master$ make |& tail -n1; echo $?
	make[1]: Leaving directory '/srv/alx/src/gnu/groff/master'
	0
	alx@devuan:~/src/gnu/groff/master$ sudo make install |& tail; echo $?
	install: cannot stat 'doc/img/webpage*': No such file or directory
	make[4]: *** [Makefile:19998: install_doc_examples] Error 1
	make[4]: Leaving directory '/srv/alx/src/gnu/groff/master'
	make[3]: *** [Makefile:16833: install-data-am] Error 2
	make[3]: Leaving directory '/srv/alx/src/gnu/groff/master'
	make[2]: *** [Makefile:16426: install-am] Error 2
	make[2]: Leaving directory '/srv/alx/src/gnu/groff/master'
	make[1]: *** [Makefile:13346: install-recursive] Error 1
	make[1]: Leaving directory '/srv/alx/src/gnu/groff/master'
	make: *** [Makefile:16419: install] Error 2
	2

> In the meantime, building from the most recent release candidate archive
> _should_ work.
>=20
> https://alpha.gnu.org/gnu/groff/groff-1.25.0.rc2.tar.gz
> https://alpha.gnu.org/gnu/groff/groff-1.25.0.rc2.tar.gz.sig
>=20
> ...at any rate, it just did for me.
>=20
> 2026-08-23 08:22:22-0500 mkdir /tmp/rando
> 2026-08-23 08:22:24-0500 cd /tmp/rando
> 2026-08-23 08:22:28-0500 wget 'https://alpha.gnu.org/gnu/groff/groff-1.25=
=2E0.rc2.tar.gz'
> 2026-08-23 08:22:33-0500 wget 'https://alpha.gnu.org/gnu/groff/groff-1.25=
=2E0.rc2.tar.gz.sig'
> 2026-08-23 08:23:29-0500 gpg --verify groff-1.25.0.rc2.tar.gz{.sig,}
> 2026-08-23 08:23:36-0500 tar xf groff-1.25.0.rc2.tar.gz
> 2026-08-23 08:23:38-0500 cd groff-1.25.0.rc2/
> 2026-08-23 08:23:55-0500 ./configure --prefix=3D$HOME && make -j

> Build finished successfully for me in about 60 seconds.

Out of curiosity, where did you get those timestamps from?  Does your
history file store them?

Using groff from git HEAD, I see the list as this:

	$ cat ls.man=20
	.TH a s d f
	.SH test
	foo
	.LS
	.IP \[bu] 3
	bar
	.IP \[bu]
	baz
	.LS
	.P
	qwe
	$ /opt/local/gnu/groff/20260823_master/bin/groff -man -Tutf8 ./ls.man=20
	a(s)                                                                      =
  a(s)

	test
	     foo

	     =E2=80=A2  bar

	     =E2=80=A2  baz

	     qwe

	f                                       d                                 =
  a(s)

Is this intended?  I thought it would imply PD 0.


Cheers,
Alex

>=20
> Regards,
> Branden



--=20
<https://www.alejandro-colomar.es>

--4nhh642xomruw3ie
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqK+8sACgkQ64mZXMKQ
wqmdNxAAvL8KcMu586kRaxvgB19E36AjBDxMrMtRx0rLHfzRdp+Fe3M84s00u4v7
WiDSR/5lOhhrpcA0XHjDeSGpCcx9C4NgoTfQvJBQ3e22Ly6NdVK4D/JFr5sLJJSV
fuFE5AJb1swurU1uSI31hZQ/FTKjSwlCIW4E/mZLW7xwxG7uj3RDsAmcEnQ4NuKb
NBW+OKQHaY4lMT6NeFSTQcgNEepSXu0b930RWqa6xTuQMRiM2ItYBLetNJxD4ED2
ykt+ILyk2HIUxXsPQs9lWV4M9S09l4IwTqHBLtDtq0T+Dk8c21B+gEH9YBYyR+Ia
yZQC7qgJQ84FNuZ93b7FOrj1jALhshvCfDVWGubvNGaJPn8/rZxXs0aCLkiXhrIn
qk/e36p7BQhQw2EW1wYOEDrsDtDS4Z3K30D3jpQDF9x59W0Hx57tb1baSFt9kwd9
kE5M1IQfTU62H3UlfIC91gD7gXXvKqGHV5wii3xxdhJa3SQ2fajpswNDprr+YBfU
2nUjGUhd1Wf3UfFEwtiwUhiXEC8EO9ixdFP+BVgL+8uOOlEQEFjM9gIkhMX8YViD
IfOxtXYyvCnF9nFsSMytIx1RqB0D/HW8lI/HQSS1HjQBzrA6sSlo3wyHqvTqTOqO
xTDEv+D46hxT1XjDkWcrjPKe8dTTIIWMfuGAkmG+45NSQxCMiMc=
=6HEx
-----END PGP SIGNATURE-----

--4nhh642xomruw3ie--
