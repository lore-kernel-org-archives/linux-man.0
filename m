Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DE7757EA
	for <linux-man@vger.kernel.org>; Mon, 24 Aug 2026 00:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787530204; cv=none; b=tQLSeQnsiqfO4T+KLlRO0oAXYYifh/+ucS4atwcY1bEHNoKwbKU+V9PLqeyP8BCiEJvQHToOOxLavS0zFaZGGPdupgmFxMOVbtQ6hiV0ZJRTZ+pr6t3rOH2kjvQf5mTSCGxjgPr/i0C+6xfMQWfm1d9J+wyFXb9RK4e4/efrchw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787530204; c=relaxed/simple;
	bh=mmRAYkUsj9fE7INFKHyqc5FxWP74aG7iJXgiuTMiI70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BmQJak3vdPczcBMlx9SYfoW38cY9nHcryIE2jw6smNktd59G3MO8R0AyVCN6NezRSsAsFOiT8kFef856/N9AIHDIeiDJ1zQuUcol/13szJzZrKM+o+DHwLRtGllOAWvVIskjGU7Ii0i7gAwVItSrizrayZJ7inOHJhdRsEijJI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fLXuF6Gc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fLXuF6Gc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AD291F000E9;
	Mon, 24 Aug 2026 00:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787530201;
	bh=KW9MRMl+BUnsfBoZmKqW6XVjkcqNWfpH+eNZqfUBmhQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fLXuF6GcgeZmkUpWdHFJ6n/mQQZW+3R9qsHtRbVKQVlV8b5cyWEfVURc2xNqpURGL
	 +y+1hwPNO4odccHwCXOBRzKXduZn95YzSSfeOHGRHnLrO7KI//Vrt5F6NFX8N+5h7N
	 Zt6emDvrk5KPmWfbtP3SHsAUEWiWgy4TmhTqRAB2GkJEUC6xe+ZOzknx7XPqVzHbs5
	 RZemNWCbdKJwiQQH6Kv3NC4CZzsIPRV1FXEe4LsECL2pbXeTfB5QEAaN7Q6w99UXa1
	 pHRXDJJBqZUsMbZaPsPYxJ9GhBcZPFFS4o7sZrmG88acOetutFp1i9MC/DGCXoZGIC
	 8RrlY/KQK5CLw==
Date: Mon, 24 Aug 2026 02:09:58 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Ingo Schwarze <schwarze@usta.de>
Cc: g.branden.robinson@gmail.com, linux-man@vger.kernel.org, groff@gnu.org
Subject: Re: autotools, was: Using LS/LE
Message-ID: <aouB88Kiyn9ezoZl@devuan>
References: <xn33wr3rr8.fsf@greed.delorie.com>
 <20260807021256.pwzsls7awqmbslti@illithid>
 <aorlBv8YTu4JlZcy@devuan>
 <20260823132749.pgypzsqv32n67wor@illithid>
 <aor4LIdGrSGHe3TB@devuan>
 <20260823141622.7vszwghxrxvkff4j@illithid>
 <aosHFaauEzKEFNpl@devuan>
 <20260823164451.5jeolmdu44ubpeba@illithid>
 <aotFzewQhmLJSk6N@devuan>
 <aot0q9iCIXOJf8Kk@isnote.usta.de>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ey5ioyacprzssten"
Content-Disposition: inline
In-Reply-To: <aot0q9iCIXOJf8Kk@isnote.usta.de>


--ey5ioyacprzssten
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Ingo Schwarze <schwarze@usta.de>
Cc: g.branden.robinson@gmail.com, linux-man@vger.kernel.org, groff@gnu.org
Subject: Re: autotools, was: Using LS/LE
Message-ID: <aouB88Kiyn9ezoZl@devuan>
References: <xn33wr3rr8.fsf@greed.delorie.com>
 <20260807021256.pwzsls7awqmbslti@illithid>
 <aorlBv8YTu4JlZcy@devuan>
 <20260823132749.pgypzsqv32n67wor@illithid>
 <aor4LIdGrSGHe3TB@devuan>
 <20260823141622.7vszwghxrxvkff4j@illithid>
 <aosHFaauEzKEFNpl@devuan>
 <20260823164451.5jeolmdu44ubpeba@illithid>
 <aotFzewQhmLJSk6N@devuan>
 <aot0q9iCIXOJf8Kk@isnote.usta.de>
MIME-Version: 1.0
In-Reply-To: <aot0q9iCIXOJf8Kk@isnote.usta.de>

Hallo Ingo!

> Date: 2026-08-24 00:31:07+0200
> From: Ingo Schwarze <schwarze@usta.de>
>
> Hello Alejandro and Branden,
>=20
> Alejandro Colomar wrote on Sun, Aug 23, 2026 at 09:30:53PM +0200:
> > From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
>=20
> >> Autoconf, Automake, and Libtool, the collective "autotools", are all
> >> strongly distinguishable in purpose.
>=20
> > I guess if you deal with them enough, you get to distinguish them.
> > In shadow-utils, where we have an autotools-based build system, I
> > consistently avoid to learn it.  I leave it up to the other maintainers
> > and the distro maintainers to keep it working.  I only report the issues
> > to them.  To me, it'd be easier to wipe it all and write a Makefile from
> > scratch than learning the tools.  The day I have to maintain that, I'll
> > probably do so.
>=20
> As one data point for Alejandro, that's precisely what i chose to do,
> and not even because i had never used autoconf before, just because
> i considered using autoconf massive overkill and likely to cause
> a maintenance nightmare.  The same applies to automake, but to
> an even higher degree.

Thanks for the data point!

> Look at this:
>=20
>    $ pwd
>   /co/mandoc
>    $ wc configure  # handwritten, human-readable, and portable
>      693    2537   20370 configure
>    $ wc Makefile   # handwritten, human-readable, and portable
>      619    1600   16050 Makefile
>    $ wc config.h   # generated by ./configure
>       54     150    1326 config.h

Nice!

>=20
> Apart from that, there are 37 test-*.c feature test files,
> all handwritten and human-readable, 723 lines grand total,
> i.e. less than twenty lines on average.
>=20
> Finally, there are 19 compat_*.c portable replacement implementations
> for systems lacking certain functions.

That sounds like what I'd have expected.  Thanks!
=20
[...]
> >> 3.  they refuse to believe that the variety of possible deployment
> >>     environments is as wide as it is.
>=20
> I think that was actually true thirty years ago, when many systems
> shipped shells that were badly starved for features and full of bugs
> and limitations.  It was no longer true 15 years ago.  Nobody
> has used Silurian systems in need of autoconf-style shell workarounds
> for at least a decade, probably much longer.
>=20
> Here is the list of systems where the configuration system described
> above is known to just work (sorted alphabetically):
>=20
>   Adelie Linux     Alpine Linux     Arch Linux       Chimera Linux
>   Crux Linux       Cygwin           Debian           DragonFly BSD
>   Fedora           FreeBSD          Gentoo           Guix System
>   IBM AIX          illumos          IRIX             macOS
>   Minix 3          NetBSD           NixOS            OpenBSD
>   openSUSE         Oracle Solaris   Slackware Linux  Sun OS 5.9
>   Sun OS 5.10      Termux           Ubuntu           Unleashed OS
>   Void Linux=20
>=20
> No shortage of weirdos in there, right?

Indeed!  :)

> > I acknowledge this.  However, some people refuse to believe that
> > hand-crafted makefiles can also handle quite different environments too.
> > I believe makefiles can do that just fine.  It's a matter of how much
> > makefile code you write.
> >=20
> > In the Linux man-pages project, we have 120 kB of makefiles.
> >=20
> > 	$ find share/mk/ -type f | xargs wc -c GNUmakefile | tail -n1
> > 	119125 total
>=20
> That's an awful lot.  Why would the man-pages Makefiles need to be
> more than seven times larger than the mandoc Makefiles?

The main make file is 1.7k (mainly, the help text); let's ignore that
part.

20k of share/mk/ seems to be just the include's, so let's also ignore
that part, since it doesn't affect readability much.

	$ find share/mk/ -type f | xargs cat | wc -c
	117364
	$ find share/mk/ -type f | xargs cat | grep -v ^include |  wc -c
	99476

=46rom the remaining 100k, 22k are part of the linting system, which runs
a lot of analyzers, both on the manual pages, and on the C examples.
That's superfluous for actually building, so we could live without it.

	$ find share/mk/lint/ -type f | xargs cat | grep -v ^include |  wc -c
	21668

Here's a look at the directories:

	$ du -h -d1 -A share/mk/
	7.0K	share/mk/install
	2.7K	share/mk/src
	33K	share/mk/build
	8.0K	share/mk/dist
	26K	share/mk/lint
	2.5K	share/mk/check
	35K	share/mk/configure
	1.6K	share/mk/help
	115K	share/mk/

The 'lint' target seems to be quite heavy.  'build-*' is also heavy, but
it's more necessary.  Although building the C programs is also done just
for linting purposes, and wouldn't be necessary.  Let's analyze that
directory:

	$ du -h -d1 -A share/mk/build/
	1.4K	share/mk/build/pre
	12K	share/mk/build/pdf
	3.6K	share/mk/build/catman
	2.2K	share/mk/build/html
	3.2K	share/mk/build/fonts
	5.3K	share/mk/build/examples
	3.0K	share/mk/build/ps
	2.1K	share/mk/build/man
	33K	share/mk/build/

Hmmm, actually the code for building the examples is actually small.
The PDF book takes the largest amount of code:

	$ du -h -A share/mk/build/pdf/
	3.2K	share/mk/build/pdf/pages
	8.5K	share/mk/build/pdf/book
	12K	share/mk/build/pdf/
	$ ls -lh share/mk/build/pdf/book/
	total 16K
	-rw-rw-r-- 1 alx alx 1.6K Aug  4 14:16 _.mk
	-rw-rw-r-- 1 alx alx  511 Aug  4 14:16 front.roff
	-rwxrwxr-x 1 alx alx 6.4K Aug  4 14:16 prepare.pl

I build all that just to make sure it builds, but we don't need it
either, and could perfectly live without building anything.  The only
code we really need from there is that which updates the date in the TH
line, which is in

	$ ls -lh share/mk/build/man
	total 12K
	-rw-rw-r-- 1 alx alx 481 Aug  4 14:16 _.mk
	-rw-rw-r-- 1 alx alx 995 Aug  4 14:16 nonso.mk
	-rw-rw-r-- 1 alx alx 629 Aug  4 14:16 so.mk

The remaining 31k of the build-* targets we could live without it.

And then there's the configure/ subdir.  That holds variables for the
program names and their flags.  I have CFLAGS-like variables for most
programs, just in case we need to tweak them.  Most of them are
unnecessary, and we could live without them.  We also have variables for
every program (including things like CAT :=3D cat).  The nice thing about
those variables is that I can list _all_ the dependencies of the build
system, programatically.

	$ make -R help
	make: warning: undefined variable 'GNUMAKEFLAGS'
	Common targets:
		all			Synonym of 'build'
		build			Build the usual stuff
		build-all		Build everything
		check			Check the results of the build
		clean			Remove all temporary files
		dist			Produce the release tarball
		distcheck		Check the release tarball
		help			Print this help
		help-list-build-depends	List build dependencies (package/program)
		help-list-targets	List all targets
		help-list-variables	List configurable variables
		install			Install the usual stuff
		install-all		Install everything
		lint			Lint the source code
		nothing			Do nothing; useful for debugging
		uninstall		Uninstall everything (might leave traces)
	$ make -R help-list-build-depends | wc -l
	make: warning: undefined variable 'GNUMAKEFLAGS'
	63
	$ make -R help-list-build-depends | head -n1
	make: warning: undefined variable 'GNUMAKEFLAGS'
	awk/awk

Also, most of the dependencies would just vanish if we got rid of the
lint target and didn't build the C programs, so this is in part just due
to the lint/ subdir.

I could certainly live with just 10% of this build system, but those
extra targets have been useful to prevent introducing several
regressions in the pages.

Another important aspect of makefiles is that I *can* add all these lint
targets just fine (they're just like any other targets).  It's just a
matter of adding some code; the more I want to lint, the more code, but
it's not that hard.  With autotools, I'd probably give up.  It's already
hard to make it just work for simply building, so linting is way beyond
what one would support.

> You don't even need to compile and link C code, right?

Actually, I do.  I build most of the C examples from the pages, and for
that, I also had to add the Makefile code to extract them from the
pages, so it's a bit more.

> > I believe that a set of makefiles that would handle all of the targets
> > of a project like groff wouldn't take much more than that.  It might be
> > a few hundred kB.  If it's well organized, it can be maintainable.
>=20
> Groff is definitely larger than either of man-pages and mandoc,
> and in particular uses a wider variety of languages and file
> format transformations.  The factor might be larger than just
> two or three, but not orders of magnitude larger, that much i
> tend to agree with.
>=20
> > Because the makefile language is so simple, bugs are easy to spot and
> > fix, compared to autotools (possibly automake, but I can't distinguish
> > them enough).
>=20
> Strongly seconded.  Due to the autotools it uses, the time i spend
> merely maintaining the GNU roff(7) port in OpenBSD, not even
> counting the times i have spent submitting patches to the
> upstream groff build system, is a very large factor (maybe
> about ten times) larger than all the time i ever spent on the
> mandoc build system, even though i wrote most of it from scratch
> and have been maintaining it for over 20 operating systems for
> over a decade.
>=20
> >> The build system is the thing that consistently gives us the most pain
> >> when trying to firm up a release.  So right now you are pulling on HEAD
> >> at its most fragile, ironically.  The code quality should be good, _if_
> >> you can get the build to completion.
>=20
> That is in sharp contrast to my experience with the mandoc build
> system.  When i send out release candidates for mandoc, almost
> all the feedback i get concerns real issues with the actual code
> itself, only a tiny fraction has to do with the files "Makefile"
> and "configure", and even those few issues are typically very easy
> to fix.
>=20
> > I'm happy to uncover those bugs; it's not a problem.
>=20
> That's also in sharp contrast to my experience.  I have repeatedly
> spent considerable amounts of time fighting with the groff build
> system, i have never been happy about it, and the considerable
> loss of time it has often caused has been a problem that has often
> hampered progress on more productive topics related to groff and mandoc.

I don't mind because I don't have to work with it often.  I just try to
build, and if it doesn't, I report it and move on to something else.
I can certainly see how your opinion is different being a downstream
packager, where you *have* to make it work, and have pressure to make it
work rather soon.  To me, if it doesn't build, I'll try the feature some
other month.

> Still, i do often track down such issues out of sheer necessity,
> because otherwise building just fails outright.
>=20
> All that said, i don't think revisiting the question of which build
> and portability system to use for groff is particularly productive
> at this time.  Bertrand already did the work of automaking it,
> Branden is apparently reasonably content with the result (and comfort
> of the chief maintainer *is* the eminent consideration regarding a
> build system), so uprooting that beast once again is likely not
> advisable, unless Branden somehow becomes very frustrated with it.
>=20
> My motivation of sketching my experience here is mostly for
> Alejandro's personal benefit.

Thanks!  It's good to see some programmers share my opinion/concerns.
In the past, I've received quite some pressure from distro/GNU people
(mostly, Gentoo maintainers) pushing me to abandon the GNU Make
hand-crafted build system in favour of their favourite tool (they
offered autotools, then Meson), and I didn't enjoy that pressure at all.

> Talking about releases, there is finally some progress:
>=20
>  * I finally have a fully working port of groff-1.23
>    with no more unexplained discrepancies left.
>  * I finally have mandoc in sync with groff-1.23 -
>    well, not perfectly, but so far that i now understand
>    all the remaining incompatibilities, in particular
>    those that groff grew from 1.22.4 to 1.23.

	    --- MAJOR INCOMPATIBLE CHANGE FOR GROFF-1.23 COMPATIBILITY ---
	 * man(7)/tbl(7): stop unconditionally emitting vertical space before .TS

>  * I'm currently looking through the mandoc TODO
>    list for things that can be fixed with little risk
>    before release; i think there at at most very few.
>  * After that, my next step will be sending out a mandoc-1.15.1
>    release candidate for testing, then release it.

	    --- MAJOR NEW FEATURES ---
	 * man(1): use unveil(2) if provided by the operating system
	 * mdoc(7): support .Lb libname [...] in the SYNOPSIS section
	 * man(7): implement .MR (reference manual page), a groff-1.23 extension

Nice!  I'm waiting for that.  :-)


Have a lovely night!
Alex

--=20
<https://www.alejandro-colomar.es>

--ey5ioyacprzssten
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqLi88ACgkQ64mZXMKQ
wqnCOg//Q9l0djKGbyXphudHMFfoBkdxpmMEFJW6VnZGdcp7ITr9y45WwtGfYBS9
q3Rn55ERiPpdP2XmDDj/WfWeunhh2+iHsSDFK6ca1PkS4C3TRVP81T8mjulxX0Kj
+6vZVBRp8t2rE1hXMHsOIPy4lIAvnCJbld0QOIOAGkz1hVqTtdnExCCYIiX+HPHj
2Sa1YuFFTkDNrj5MslCq7x7UZyN0B0ka8g9DGP8erNKPL1c84Mu0XVkFY4j690L4
Wf1SIp7m8Jg9jcuyOEVHEGjiDzZZz8ux8rlOIsmPH/owGHQJH9vnNj/lVq9wgnq5
gUeCSI3EiXLjj4jw8WtKiCAOTv41O3IZQp4XaKjo8lxp4YheQrNj1BtY/rsd+Ct2
a0iA4KeQ8cZS4ACOKacIIss/WSeHo2Hgwbdg7XW+kGmG+ekFZvx/MMYH9RYbxU8J
oHHdac6zKh7WmCPyCyfBTMjbIOsFADH9Tdc7jZZg8W1vQNx8A5WcVhWk2/LhJM9A
UU2entysIAIwV0PwwmgZY3hPtDdvoeXQdPDQA3BcoEpFVmkhMpuI9ImiEKGnCSFG
ZDEk+RQn4L7a0ynBagzE4Wq+y3zrce0a9Ey9pB6DmT8S0MBhOUyEZf4hO1mZJnZh
GjSo3qmQAZKCQLiRKjaenPD3+yXLxOvvCakTO+Fh6VUSC7RsX0E=
=00ES
-----END PGP SIGNATURE-----

--ey5ioyacprzssten--
