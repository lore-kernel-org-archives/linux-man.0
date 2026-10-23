Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792790219;
	b=orJQMBEfOCAk2+AN6IGkhxn5BzQAwoywkccQ0JshcWlgAj7A2x1Mh64auCmM6QT2i9u6
	 XGF4oscdwFLGZvi9cglqRhYyroJQQE25R8CPKi8bZYsRN+ri+fLiHxSF/IXA+1O6wzaoX
	 K0tYLY/s5kX/Z4o41pdglN7Ek9msy6nNw59Fkm3oGLRKa4qvxjo5qN9tMJiqh+ziY0Ee6
	 8SB+LLy9H8+PoiyecKX0rQ0K6PjfGcalRg1c/ImyaRDnVZywICvOScJQ0HC77x4aWArmc
	 zjFF+ktZayoI9dokQI9FjqGnqoB9mGEURa4BN/FqldTee6IVJNVO6IgtHb8+slIaFBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792790219;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=fxXldqq+GWPD91f081UvhpgeNpUWDrVZUmJK4bdOOtQ=;
	b=lpcnNwDFFBCi9oRwdjgsI4HhFKpDZ8zrNUubEob3bZBOgkciqb6i0g5RPwAQ0Q2IY6O+
	 nOuhlc6xAzO1Ya4xlhbgo8ggtL+IQcK87uh+2/bs+stbeGnYNJcm2E5MK4CuY9RwzGufx
	 L1OhTOCGLS7BB2o2jvIsd5wuw7i2jptCWRGZdWMi6qyOnBlkyqPIMySOCzj4WRU8CBJcP
	 vsPpMBvH1fNchIG6xQ7d3h4POz0oZpwHUnNZLWCpIXkaHeiIXofbAOr1HdyoOxsAUWSuq
	 WL9TmyEpP1SL8YypduTi3TmDqFyGikqelHisOBMqFM+s2oOr1XleTdPVxnzV0DUTInA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fT5RaOzr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88DD606A31B
	for <linux-man@vger.kernel.org>; Fri, 23 Oct 2026 21:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fT5RaOzr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B269E1F01825;
	Fri, 23 Oct 2026 21:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792790218;
	bh=fxXldqq+GWPD91f081UvhpgeNpUWDrVZUmJK4bdOOtQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fT5RaOzrqEhMMwLgqVw/i+RXchtEF+VbL6H4t46AkrC3CQjbtf3lNn+dUfM2lLUdj
	 12qTZkyFQQ2S1i1yN33rzJVMpV8I6h+/TwFc2H06/ep/DsswVe2LuqAm38NHKan62b
	 1mRU0leip7UNr9LiOX7Q4q/NBaR3+qFkJ+Cbyv5b03J26DUehANuM62UNgg9oGygKK
	 I/XRupkXA36zgYxkZILqrYefHpKXipfW76XsmcNgsK3gOB7arRHYwgOJNiMdp9+pgm
	 uEMp3QnqphpQX25xM20hDrlsxquKL3//BsaD6gtsCzLDdVM2V/h1gCa8B8KGGFaleP
	 h/KiRy926S52Q==
Date: Fri, 23 Oct 2026 23:16:51 +0200
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Hugo Buddelmeijer <hugo@buddelmeijer.nl>, linux-man@vger.kernel.org
Subject: Re: table layout in console_codes.4 (was: `make -R check` fails due
 to futex_waitv.2 and console_codes.4 being too wide)
Message-ID: <atvMKTY2CzXxDiGY@debian>
References: <atZJ7QGljZ4K50wD@debian>
 <1e4d35e5-f8af-402b-9cdb-46a70f793b96@buddelmeijer.nl>
 <20261019224145.aovalqyh2fpcdzdk@illithid>
 <atugtpm0SfMnnTYj@debian>
 <20261023203216.mfhfyadcesawur55@illithid>
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
	protocol="application/pgp-signature"; boundary="6e3cl3q3wny5ll6k"
Content-Disposition: inline
In-Reply-To: <20261023203216.mfhfyadcesawur55@illithid>


--6e3cl3q3wny5ll6k
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Hugo Buddelmeijer <hugo@buddelmeijer.nl>, linux-man@vger.kernel.org
Subject: Re: table layout in console_codes.4 (was: `make -R check` fails due
 to futex_waitv.2 and console_codes.4 being too wide)
Message-ID: <atvMKTY2CzXxDiGY@debian>
References: <atZJ7QGljZ4K50wD@debian>
 <1e4d35e5-f8af-402b-9cdb-46a70f793b96@buddelmeijer.nl>
 <20261019224145.aovalqyh2fpcdzdk@illithid>
 <atugtpm0SfMnnTYj@debian>
 <20261023203216.mfhfyadcesawur55@illithid>
MIME-Version: 1.0
In-Reply-To: <20261023203216.mfhfyadcesawur55@illithid>

Hi Branden,

> Date: 2026-10-23 15:32:16-0500
> From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
>
[...]
>=20
> > > > I'd love a formal patch, especially with a good commit message.
> > > > :)
> > >=20
> > > I'm sure.  But I'm dealing with yet another late-release-cycle fire
> > > drill in groff right now, unfortunately.
> >=20
> > I'm patient.  MR.sed made me learn.  :p
>=20
> I learned from it too.
>=20
> Some news on that front.  Would you be willing to stage the roll-out
> of this transition?

Certainly!  One major problem from your script was that it was huge and
difficult to understand.  Partial scripts will be significantly simpler.

>  The syscalls(2) page is what broke us before--you
> wanted extensive annotations to my sed scripts.

Actually, I would have preferred a pipeline of one-liner commands,
without having to be a sed(1) expert to understand it.  Something like
the implementation of sortman(1) would be great.

>  (Not unreasonable, but
> demanding of further effort on my part.)  The rest seemed easy.  Maybe
> if we can migrate:
>=20
> 1.  everything but syscalls(2) first; then

Sure; as long as the commit message says something like "we're leaving
syscalls(2) --and only syscalls(2)-- out of this transition, because
it's way more complex than the rest", I'd take it.

> 2.  migrate syscalls(2) in multiple passes, each of 1 sed script, each
>     showing no change in the formatting of rendered text.

Yup.

> I think users and readers will enjoy (and could have been enjoying) a
> major benefit to their man page browsing experience even with only step
> 1 done.  Now that GNU less has its own OSC 8 interpreter and
> appropriately equipped versions are making it into distributions, the
> power of man page hyperlinking is easy to see.  Literally, even, with
> even more recent changes to apply underlining to hyperlinked character
> cells.  The latest version of less, v712, released this past week, even
> defaults to "less -R".[0]  A future I dreamed of in 2018 is finally
> arriving.
>=20
> In other news, Oracle finally did a thing I once thought they had done
> in Solaris 11, then had to correct my understanding about, and then had
> to re-correct myself again.
>=20
> About 2=C2=BD years ago, in SRU66 (a kind of service pack), an update to
> Solaris 11.4, Oracle completely discarded their AT&T System V troff.
> It's _gone_.  What replaced it?  groff 1.23.0--which supports groff
> man's `MR` macro.[1]

Wow!  :-)

>=20
> They kept some auxiliary stuff like checkeq(1) and checkmm(1) (neither
> of which GNU eqn or groff mm need, since they internally implement more
> generous diagnostics than their AT&T implementations).  And they
> implemented a bunch of wrappers to force preconv(1) into execution
> pipelines.
>=20
> So between groff >=3D 1.23.0 and, well, the _next_ release of mandoc(1)--
> any day now, it's to be hoped--support for `MR` will be nearly
> universal.

Very please CC Ingo in that patch.  :)

> I didn't ever expect mandoc's release cadence to become slower than
> groff's!

Heh!

> > > And on second thought it occurs to me that you may not want that
> > > column in the table after all, since they are all *roff comments
> > > intended (I think) only for inspection by the document maintainer,
> > > not by the reader.  In that case what you want to do is not add a
> > > column, but stop supplying excess table entries--in other words,
> > > discard the tab character before the `\"` comment escape sequence.
> >=20
> > Yes, and no.
> >=20
> > > diff --git a/man/man3/matherr.3 b/man/man3/matherr.3
> > > index 2e179e358..8711ee3cd 100644
> > > --- a/man/man3/matherr.3
> > > +++ b/man/man3/matherr.3
> > > @@ -200,9 +200,9 @@ .SS Math functions that employ matherr()
> > >  acos(|x|>1)    DOMAIN  HUGE    y       EDOM
> > >  asin(|x|>1)    DOMAIN  HUGE    y       EDOM
> > >  atan2(0,0)     DOMAIN  HUGE    y       EDOM
> > > -acosh(x<1)     DOMAIN  NAN     y       EDOM    \" retval is 0.0/0.0
> > > -atanh(|x|>1)   DOMAIN  NAN     y       EDOM    \" retval is 0.0/0.0
> > > -atanh(|x|=3D=3D1)  SING    (x>0.0)?        y       EDOM    \" retval=
 is x/0.0
> > > +acosh(x<1)     DOMAIN  NAN     y       EDOM\" retval is 0.0/0.0
> > > +atanh(|x|>1)   DOMAIN  NAN     y       EDOM\" retval is 0.0/0.0
> > > +atanh(|x|=3D=3D1)  SING    (x>0.0)?        y       EDOM\" retval is =
x/0.0
> >=20
> > It was certainly more readable with the tab.  Would a couple of spaces
> > be okay?  Or will they produce spurious space too that might fail?
>=20
> The problem is that you'll still have a comment escape sequence in a
> table entry.  Since groff 1.24.0, GNU tbl warns about that (unless the
> comment escape sequence occurs in a text block, where these escape
> sequenced don't cause problems).  Unfortunately groff 1.24.x produce an
> extra warning diagnostic in this case that is not helpful.  I just
> discovered that while composing this email and have scheduled a fix for
> groff 1.25.0.[2]

We can wait for 1.25.0.

> $ ./build/test-groff -tz -W style -m an -T utf8 ../man-pages/man3/matherr=
=2E3
> tbl:../man-pages/man3/matherr.3:240: warning: comment escape sequence '\"=
' in entry "EDOM\" different from log()"
> tbl:../man-pages/man3/matherr.3:241: warning: comment escape sequence '\"=
' in entry "EDOM\" different from log()"
> tbl:../man-pages/man3/matherr.3:248: warning: comment escape sequence '\"=
' in entry "EDOM\" +0 and -0"
> troff:../man-pages/man3/matherr.3:203: warning: missing closing delimiter=
 in width computation escape sequence; expected special character or class =
'tbl', got a newline [-w delim]
> troff:../man-pages/man3/matherr.3:204: warning: missing closing delimiter=
 in width computation escape sequence; expected special character or class =
'tbl', got a newline [-w delim]
> troff:../man-pages/man3/matherr.3:205: warning: missing closing delimiter=
 in width computation escape sequence; expected special character or class =
'tbl', got a newline [-w delim]
> troff:../man-pages/man3/matherr.3:240: warning: missing closing delimiter=
 in width computation escape sequence; expected special character or class =
'tbl', got a newline [-w delim]
> troff:../man-pages/man3/matherr.3:241: warning: missing closing delimiter=
 in width computation escape sequence; expected special character or class =
'tbl', got a newline [-w delim]
> troff:../man-pages/man3/matherr.3:248: warning: missing closing delimiter=
 in width computation escape sequence; expected special character or class =
'tbl', got a newline [-w delim]
> troff:../man-pages/man3/matherr.3:256: warning: missing closing delimiter=
 in width computation escape sequence; expected special character or class =
'tbl', got a newline [-w delim]
> ../man-pages/man3/matherr.3:199: warning: table wider than line length mi=
nus indentation
>=20
> The riot of delimiter warnings is the havoc that use of a comment escape
> sequence in a (non-text-block) table entry creates.
>=20
> I added that warning in groff 1.24.0 because without it, a user is
> unlikely to comprehend what is supposed to be wrong with their table.
>=20
> Or they would have been uncomprehending, had they enabled warnings in
> category "delim", which were not on by default.  In groff 1.25.0, they
> will be.

I trust you to send me your best patch, because I don't know what to do
with it.  If you think the best thing is to juts remove the tabs, I
guess I could live with it.

>=20
> > [...]
> > >=20
> > > (Also attached.)
> > >=20
> > > If the foregoing looks ugly, bear in mind that you're wandering a
> > > bit off the path with these comments.
> > >=20
> > > tbl(1):
> > > Limitations
> > >      Within a tbl region (except in text blocks or on roff control
> > >      lines), avoid escape sequences that read the rest of the input
> > >      line, as \" and \! do.
> >=20
> > Hmmm.
>=20
> This is a consequence of how tbl works.  It generates *roff `\w` escape
> sequences bracketing the table entry contents so that the formatter can
> compute their rendered widths.  Without font metrics, tbl cannot do that
> itself.
>=20
> My recommendation is to move these "inline" comments to precede what
> they document.
>=20
> -acosh(x<1)     DOMAIN  NAN     y       EDOM    \" retval is 0.0/0.0
> +.\" retval is 0.0/0.0
> +acosh(x<1)     DOMAIN  NAN     y       EDOM

Not a fan of this.  Maybe just remove the tabs.  Or maybe we want to
print these in the table as a new column?

> > > > > I was able to get a complete, successful check with the
> > > > > following command.
> > > > >=20
> > > > > $ make -R check NROFF_LINE_LENGTH=3D80 NROFFFLAGS=3D-Wstyle
> > > >=20
> > > > Thanks!  Would you mind sending a formal patch set?  =3D)
> > >=20
> > > I'll need a reminder when I feel less swamped (after groff 1.25.0,
> > > likely), or someone else can steal my fixes.  :)
> >=20
> > Okay.  Do you have an estimate of when I should poke you?  As in maybe
> > one month or two?
>=20
> Say, two weeks after groff 1.25.0 final, which I'll announce here as
> usual.  By then I should know if the release was a triumph, a disaster
> (and therefore will be keeping me busy), or met with the usual stony
> indifference.

Ok.

> > > Yeah, I wouldn't want to fool with it before it lands in an official
> > > release, either.  But this _does_ mean that the Linux man-pages
> > > documents will appear to "regress" suddenly when the host system
> > > upgrades to groff 1.25.0, because you use `-ww` to turn on all
> > > warnings.
> >=20
> > If you're willing to spend some time on helping me address the
> > diagnostics by improving the pages, that's fine.  :)
>=20
> I don't doubt it.  I have a lot of irons in man page fires!

:-)


Have a lovely night!
Alex

>=20
> Regards,
> Branden
>=20
> [0] https://github.com/gwsw/less/commit/7f46e9ff46216f3e560cd1f41ddf3b36b=
11eec0e
> [1] https://blogs.oracle.com/solaris/whats-new-in-oracle-solaris-114-sru-=
66
>=20
>     That blog entry doesn't make any _note_ of this change, but it's
>     there.  I have been able to examine it at cfarm.net.
>=20
>     Also, there's this evidence:
>=20
>     http://pkg.oracle.com/solaris/release/en/search.shtml?token=3Dgroff&a=
ction=3DSearch
>=20
> [2] https://savannah.gnu.org/bugs/?68825



--=20
<https://www.alejandro-colomar.es>

--6e3cl3q3wny5ll6k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrbzr0ACgkQ64mZXMKQ
wqnxQxAArka6UjZCl8P7+bBKvlKoJSdP3FDmZ5VbBdWWVFsnHNvRr5jN376FIk1/
Xf8bf29sns1lJLd5kh421pX8i5OTmurX02381xsM444OGtkl4mvzfFDwduEe2WSH
fnpCPGXhD6O9w8tDVtLHaL15SDGV1VzTfCkc/wmvDXCL8vKPGn5FUHZ39Tiumm1Q
69O7QEiYfWqBy0/YzlHyw3mM1ypd03Z7iYI75eKL2vgcgYrxaTBw6y1g9ABQ7Y5U
/Sp0hHGQw9Ld+nMn3dUeCF9ylsNwBnuvbpkQUAZps9IsQDmBOBbS70HWt+po7NYZ
8+SHDORCmmyhvsIRtfzD9iWVBVDIlAFMcFIWOnixA/+k2JOJKuVUSdzQVZmcgJk+
uitGqMzOq5PP3+Unl8Sw8FWOmMHg+WaER+tXMhtEzHkrudm0b0XL+QhHU/ygk6NI
1W4ahg5aKvH167YsGyK4FhSRdsTuLjexOGhPflIZcewQzdUbiImCmROMAIgWbjDl
OR0ZsuxhcdtfrjlR1kxjJ7A2OH35stvdKQntA7abUE4LXqyixvQy5Oo+0JABY8/6
rFTztwsXwwyUUZt73ECd+wS/5aX1YaNWQX4CvbA63xkhF5r9WIcEUBK53SPM77+S
sgitBW5I1deF6zgyd3LgRh3CUe9TbkLxV4PZEthLeGhNAnhBI08=
=vHLe
-----END PGP SIGNATURE-----

--6e3cl3q3wny5ll6k--
