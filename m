Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6099A7083C
	for <linux-man@vger.kernel.org>; Sat, 29 Aug 2026 20:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788036550; cv=none; b=e4rPpLAHh4IGxcLqSAg4/1hgeQzc8V17bIHhAuu1yMgqZWtv2hnraakvKq2+A5/MvGx1sJfxsYaP9Tdsmf61Qo8x5NPqrsDGj+TKWT8UcQjmxpDk73khnm+5NPd8okPaaSte9tgm0sE8ISRCei1NNo/J5xhq5/IiGIljf1FY+aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788036550; c=relaxed/simple;
	bh=EjXKaTzouGJkqivmC3J8uyJcuMMssU3daGLDZVbO3zE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PH8se3mKvEfp2BJ3a0j2Z49P+8Xv7ObfF1w9jojAPn9j1uy7yxaHwBx8xIwNd7LHky2q99hmCT6wIAJ0UgxRHKlEdeajTBpTflS2TRwIViJ8adVbbjyys9ZQOowc7HbS107GFVviagqOXfhFhKTklQ2uuczkN18O2boI+rhYof0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i+WoCvo5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i+WoCvo5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E01C1F000E9;
	Sat, 29 Aug 2026 20:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788036548;
	bh=Kj1L0d9Y1nMNqw1R/yxrgYoCeqzJJUmqM8+ddWBGJs4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i+WoCvo5z28DuDOQld0D51mAmVk+Ed5ygW5K51AvD2Rnjc14xyvuvsBrQzqjjsaL/
	 VET1tbYKdZPLABvLCTrCThqJrczNbHPO7mxyi5Pe7YS7sSZMHhUmMwJ/iVW6J10Tvc
	 EJ+3hfpWoiCno2HeYbkW6v1rllHKWYu/Kjod4ko8FLewwuiua+Nin6tdVLecVMlLun
	 oSigXlv50dbk3ViH2HXiKNY2Ew6At8oJjy/0o7c5wwA4o6xQxWG6KQrp+UuLNQD5eg
	 4IFQBTARPJduE1Zyk3apy0rCRrEsIcoGJ45LgGcYV7+nHjSbNi5A8aNVE9ewytjkju
	 /DY0uFiIRz4Sg==
Date: Sat, 29 Aug 2026 22:49:05 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Ingo Schwarze <schwarze@usta.de>
Cc: linux-man@vger.kernel.org
Subject: Re: configure separate from make or not
Message-ID: <apMytOcLd3pecFFc@devuan>
References: <20260823132749.pgypzsqv32n67wor@illithid>
 <aor4LIdGrSGHe3TB@devuan>
 <20260823141622.7vszwghxrxvkff4j@illithid>
 <aosHFaauEzKEFNpl@devuan>
 <20260823164451.5jeolmdu44ubpeba@illithid>
 <aotFzewQhmLJSk6N@devuan>
 <8DE76435-CBDB-42D6-9E0F-9E27291560B6@icloud.com>
 <apKou1PHGi1N5gGO@isnote.usta.de>
 <apLV749V4YvfqCOZ@devuan>
 <apL7VAruk1bIOr1M@isnote.usta.de>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qjjrypovaattxzm3"
Content-Disposition: inline
In-Reply-To: <apL7VAruk1bIOr1M@isnote.usta.de>


--qjjrypovaattxzm3
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Ingo Schwarze <schwarze@usta.de>
Cc: linux-man@vger.kernel.org
Subject: Re: configure separate from make or not
Message-ID: <apMytOcLd3pecFFc@devuan>
References: <20260823132749.pgypzsqv32n67wor@illithid>
 <aor4LIdGrSGHe3TB@devuan>
 <20260823141622.7vszwghxrxvkff4j@illithid>
 <aosHFaauEzKEFNpl@devuan>
 <20260823164451.5jeolmdu44ubpeba@illithid>
 <aotFzewQhmLJSk6N@devuan>
 <8DE76435-CBDB-42D6-9E0F-9E27291560B6@icloud.com>
 <apKou1PHGi1N5gGO@isnote.usta.de>
 <apLV749V4YvfqCOZ@devuan>
 <apL7VAruk1bIOr1M@isnote.usta.de>
MIME-Version: 1.0
In-Reply-To: <apL7VAruk1bIOr1M@isnote.usta.de>

Hi Ingo,

> Date: 2026-08-29 17:31:32+0200
> From: Ingo Schwarze <schwarze@usta.de>
>
> [trimming Cc:, this starts becoming off-topic on the groff list;
>  i'm not subscribed to linux-man@ though]
>=20
> Hi Alejandro,
>=20
> Alejandro Colomar wrote on Sat, Aug 29, 2026 at 03:10:25PM +0200:
> > From: Ingo Schwarze <schwarze@usta.de>
>=20
> > In the Linux man-pages, the configure step is done entirely within
> > make(1) --there's no separate ./configure step--.  But as you say,
> > a separate configure-only step is important for serious debugging.
> >=20
> > The solution I implemented is a 'nothing' target in the Makefile, which
> > as the name implies, does nothing.  However, it still runs the
> > configuration step, since that runs as part of parsing the makefiles.
>=20
> That sounds like a serious abuse of the parsing step to me.
> I mean, the whole point of a parsing step is to do parsing and to
> build dependency trees, but not to run code.

The main thing I run code for in the makefiles is for listing all the
source files.  Here's an example:

	$ grepc -xmk -tv -n MANPAGES share/mk/
	share/mk/src/man.mk:20:MANPAGES ::=3D $(shell $(FIND) $(MANDIR)/* -type f \
			| $(GREP) -E '$(MANEXT)' \
			| $(SORTMAN) \
			| $(SED) 's,:,\\:,g')

I know you prefer to list them manually, but I like this little bit
of magic (it's not that magic, since it's written in the code, but
admittedly, if you're not used to this build system, it's hard to
expect it).

> The purpose of the
> execution phase of make(1) then is to run code, in an order determined
> from the dependency tree.
>=20
> > Here's the rule:
> >=20
> > 	nothing:;
> >=20
> > When I need to debug the build system itself, I run that target; often
> > with special flags for debugging.  One common command I use when I need
> > to do this kind of debugging is:
> >=20
> > 	$ make -p nothing | less
>=20
> The output of that command looks completely unreadable to me and
> is of horrendous size:
>=20
>    $ gmake -pR nothing | wc
>   bash: line 1: gcc: command not found
>   realpath: unknown option -- m
>   usage: realpath [-q] file
>   gmake: warning: undefined variable 'GNUMAKEFLAGS'
>    34074  672611 27635924
>=20
> Over 25 MB of configuration output?  Seriously?

Hmmm, I would like it to be less.  I've been thinking about ideas to
cut it down a little bit (at least one order of magnitude).

The thing is, we have 1.5k non-link pages, and we use absolute paths
in most variables.  Thus, each variable can hold around 100kB for the
paths:

	$ find man/ -type f | xargs grep -l '^\.TH' | xargs realpath | wc -c
	106833

'make help-list-targets' lists 119 .PHONY targets, of which most require
at least one variable for holding the actual file targets.  A simple
multiplication and rounding says there's 100x100k =3D 10M in these path
variables.  Then 25 MB sounds not far from that.

I think I might be able to optimize this down by using relative paths.
I might be able to optimize this a bit further by using suffix rules
as much as possible, instead of listing all targets in the rules again.
But there's a hard floor.  It should be hard to go much below current
size, at least without reducing targets.

I tried removing some targets, out of curiosity, to see how much size
they contribute:

	$ rm -rf share/mk/lint/
	$ rm -rf share/mk/check/
	$ rm -rf share/mk/build/examples/
	$ rm -rf share/mk/build/catman/
	$ rm -rf share/mk/build/fonts/
	$ rm -rf share/mk/build/html/
	$ rm -rf share/mk/build/pdf/
	$ rm -rf share/mk/build/ps/
	$ rm -rf share/mk/build/pre/
	$ rm -rf share/mk/dist/check/
	$ rm -rf share/mk/install/html.mk=20
	$ rm -rf share/mk/install/pdf/

After that, the output of 'make -p nothing' goes down to ~ 1/7.5 of the
original size.  This is still sufficient to build and install the pages,
and produce the release tarball.  The rest is for detecting issues in
the pages, the examples, and in the tarball.

The main issue is the large number of files, not the complexity of what
we do with them.  With thousands of pages, the size must remain in MB,
or in the high kB.

> > And if I need to see stderr output from the commands used by the
> > configure scripts, here's a common command:
> >=20
> > 	$ make HIDE_ERR=3D nothing
> >=20
> > I'm not saying that this should be done, but this _can_ be done.  With
> > BSD make(1), it might be more difficult to debug, since it doesn't have
> > the -p flag.
>=20
> It does.  From the OpenBSD make(1) manual:
>=20
>    -p    Print a dump of the target rules and variables on stdout.  Do not
>          build anything.

Oh, I didn't remember each BSD has its own make(1).  I checked bmake(1),
which is available in Debian and doesn't have -p, but that seems to be
NetBSD's make(1).

>=20
>    -d flags
>          Turn on debugging, and specify which portions of make are to
>          print debugging information.  flags is one or more of the
>          following:
>=20
>          [only quoting the flags here, without the descriptions,
>           for brevity]
>=20
>          AacdDef g1 g2 hiklmnpqstTv
>=20
> However, reading the output from a simple configure script is much
> simpler than reading make(1) debugging output, for example:
> =20
>    $ ./configure
>   file config.log: writing...
>   file configure.local: reading...
>   tested operating system: OpenBSD -> OSENUM=3DMANDOC_OS_OPENBSD
>   tested cc -W: tested noop: yes
>   selected CFLAGS=3D"-g -W -Wall -Wmissing-prototypes -Wstrict-prototypes=
 -Wwrite-strings -Wno-unused-parameter"
>   tested noop-static: yes
>   selected STATIC=3D"-static"
>   tested attribute: yes
>   tested cmsg: yes

You could implement this output in a makefile, and it would take as much
code as it takes in a configure script.

You may not like having code that runs before targets (and that's
reasonable, of course), but it also has benefits: having an atomic
configure+make operation, avoids issues due to outdated configure
output; I don't need to 'make clean' anymore, for example.

[...]
> and then you can inspect config.h and Makefile.local for generated
> settings and inspect config.log if serious debugging is needed.
>=20
>  $ wc config.h Makefile.local config.log
>       54     150    1326 config.h
>       40     137    1026 Makefile.local
>      305    1401   12998 config.log
>      399    1688   15350 total
>=20
> Even the "total" is half a permille of the output volume=20
> from the gmake -p you recommend - and that already includes *all*

I don't _recommend_ it.  I just mentioned it as a possibility.
I mentioned it since you had said it was impossible to do it, IIRC.

> the debugging information, whereas in your 25 MB of gmake -p output,
> i was unable to find the reason why the build systems tries to use gcc(1)
> even though i don't have GCC installed.  Generally, searching in that
> monster is next to impossble because it contains very large numbers
> of extremely long lines, each of which contains basically all the
> words that one might possibly wish to search for.

Many lines have it, as there's a directory called .../gcc/, but with a
regex we can get rid of it and show just a bunch of lines:

	$ make -R nothing -p | grep '[^/]gcc'
	make: warning: undefined variable 'GNUMAKEFLAGS'
	CC_VENDOR :=3D gcc
	CPP :=3D gcc -O3 -flto -Wall -Wextra -Werror -Wstrict-prototypes -Wdeclara=
tion-after-statement -Wno-reserved-identifier -Wno-unused-macros -Wno-error=
=3Dunused-parameter -Wno-error=3Dsign-compare -Wno-error=3Dformat -Wno-erro=
r=3Duninitialized -fanalyzer  -E
	LD :=3D gcc -O3 -flto -Wall -Wextra -Werror -Wstrict-prototypes -Wdeclarat=
ion-after-statement -Wno-reserved-identifier -Wno-unused-macros -Wno-error=
=3Dunused-parameter -Wno-error=3Dsign-compare -Wno-error=3Dformat -Wno-erro=
r=3Duninitialized -fanalyzer  -isystem /usr/include/x86_64-linux-gnu/bsd -D=
LIBBSD_OVERLAY -D_FORTIFY_SOURCE=3D2=20
	CC :=3D gcc

CC_VENDOR and/or CC sound suspicious.  Both seem to be defined in the
same file:

	$ grepc -xmk -tv CC_VENDOR share/mk/
	share/mk/configure/build-depends/gcc/cc.mk:CC_VENDOR ::=3D \
		$(shell \
			$(CC) -v 2>&1 \
			| $(SED) -n '1p;$$p' \
			| $(SED) '/gcc version/s/.*/gcc/' \
			| $(SED) '/clang version/s/.*/clang/' \
			| $(SED) '/Apple LLVM version/s/.*/clang/' \
			| $(GREP) -e '^gcc$$' -e '^clang$$' \
			|| $(ECHO) unknown; \
		)
	$ grepc -xmk -tv CC share/mk/
	share/mk/configure/build-depends/gcc/cc.mk:CC ::=3D gcc

And so it seems it's CC.  I don't know why I set it to gcc.  I'll fix
it, and set it to just 'cc'.  Thanks for the report!  It seems CC was
previously set as cc, and in 546141e11357 (2024-02-17; "share/mk/:
Reorganize build dependencies") I changed it to gcc, but that seems an
accident.  I've applied this fix:

	commit 294f74eb2a284ecf8772cb0060b85b6d3f9bb7bd
	Author: Alejandro Colomar <alx@kernel.org>
	Date:   2026-08-29 21:42:58 +0200

	    share/mk/: $CC: Use cc(1), not gcc(1)
	   =20
	    Fixes: 546141e11357 (2024-02-17; "share/mk/: Reorganize build dependen=
cies")
	    Reported-by: Ingo Schwarze <schwarze@openbsd.org>
	    Message-ID: <apL7VAruk1bIOr1M@isnote.usta.de>
	    Signed-off-by: Alejandro Colomar <alx@kernel.org>

	diff --git a/share/mk/configure/build-depends/gcc/cc.mk b/share/mk/configu=
re/build-depends/gcc/cc.mk
	index 80c07b4f4a09..d541e39137a0 100644
	--- a/share/mk/configure/build-depends/gcc/cc.mk
	+++ b/share/mk/configure/build-depends/gcc/cc.mk
	@@ -12,7 +12,7 @@ include $(MAKEFILEDIR)/configure/build-depends/sed/sed.mk
	=20
	=20
	 ifndef CC
	-CC ::=3D gcc
	+CC ::=3D cc
	 endif


> > But the output from configure tests can still be read
> > without building anything, with a dummy 'nothing' rule.
>=20
> I briefly tried to read man-pages/GNUmakefile but quickly gave up
> because it feels impossible to follow the control flow.
> The program fails to explicitly say which targets it runs
> with which dependencies, IMHO making it unreadable for a human.

The start point is, as usual, the 'all' target, whose rule is defined
as this:

	all: build;

It has an empty recipe, and depends on the 'build' target.  The 'build'
target is defined under share/mk/:

	$ grepc -xmk -tr -n build share/mk/
	share/mk/build/_.mk:25:build: \
		build-man;

	$ grepc -xmk -tr -n build-man share/mk/
	share/mk/build/man/_.mk:18:build-man: build-man-nonso build-man-so;

	$ grepc -xmk -tr -n build-man-nonso share/mk/
	share/mk/build/man/nonso.mk:32:build-man-nonso: $(_NONSO)

	$ grepc -xmk -tr -n build-man-so share/mk/
	share/mk/build/man/so.mk:24:build-man-so: $(_SO_MAN)

Those are all empty recipes, since they're .PHONY targets.  The real
targets are $(_NONSO) and $(_SO_MAN).

	$ grepc -xmk -tr -n _NONSO share/mk/
	share/mk/build/man/nonso.mk:18:_NONSO ::=3D $(patsubst $(MANDIR)/%, $(_MAN=
DIR)/%, $(NONSO))
	share/mk/build/man/nonso.mk:21:$(_NONSO): $(_MANDIR)/%: $(MANDIR)/% $(MK) =
| $$(@D)/
		$(info	$(INFO_)SED		$@)
		<$< \
		$(SED) "/^\.TH /s/(date)/$$($(MANPAGEDATECMD))/" \
		| $(SED) '/^\.TH /s/(unreleased)/$(DISTVERSION)/' \
		| $(SED) '/^\.Dd /s/$$Mdocdate$$'"/$$($(MANPAGEDATECMD))/" \
		| $(SED) '/^\.Os /s/(unreleased)/$(DISTVERSION)/' \
		>$@

	$ grepc -xmk -tr -n _SO_MAN share/mk/
	share/mk/build/man/so.mk:15:_SO_MAN ::=3D $(patsubst $(MANDIR)/%, $(_MANDI=
R)/%, $(SO_MAN))
	share/mk/build/man/so.mk:18:$(_SO_MAN): $(_MANDIR)/%: $(MANDIR)/% $(MK) | =
$$(@D)/
		$(info	$(INFO_)CP		$@)
		$(CP) -T $< $@

The latter copies .so pages as is, while the former takes the non-link
pages and edits the date and version, with values gotten from git(1).
We can also follow that:

	$ grepc -xmk -tv -n MANPAGEDATECMD share/mk/
	share/mk/configure/version.mk:62:MANPAGEDATECMD =3D $(GIT) log --format=3D=
%cs -1 -- $< $(HIDE_ERR)

	$ grepc -xmk -tv -n VERSION share/mk/
	share/mk/configure/version.mk:23:VERSION       ::=3D $(shell $(GIT) descri=
be --dirty | $(SED) 's/$(projname)-//')

That's all that runs through the 'all' target.

Then there's stuff that runs prior to it, for initializing some
variables, but that should not produce any lasting effects, so it should
be more or less unimportant (unless you want to debug stuff, and then
 you need to see the output of -p to learn it).  You can check
everything that runs before any targets, by grepping for '$(shell '
under share/mk/:

	$ grep -rn '$(shell ' share/mk/
	share/mk/src/man.mk:20:MANPAGES ::=3D $(shell $(FIND) $(MANDIR)/* -type f \
	share/mk/src/man.mk:26:MANINTROPAGES ::=3D $(shell $(FIND) $(MANDIR)/* -ty=
pe f \
	share/mk/src/man.mk:45:NONSO ::=3D $(shell $(FIND) $(MANDIR)/* -type f \
	share/mk/src/sh.mk:16:BIN_sh ::=3D $(shell $(FIND) $(SRCBINDIR) -type f \
	share/mk/dist/files.mk:21:DISTFILES    ::=3D $(shell $(DISTFILESCMD) | $(S=
ED) 's,:,\\:,g')
	share/mk/dist/files.mk:29:	$(shell \
	share/mk/configure/version.mk:23:VERSION       ::=3D $(shell $(GIT) descri=
be --dirty | $(SED) 's/$(projname)-//')
	share/mk/configure/version.mk:58:DISTDATE ::=3D $(shell $(DISTDATECMD))
	share/mk/configure/build-depends/cpp/cpp.mk:22:	$(shell \
	share/mk/configure/build-depends/cpp/cpp.mk:31:	$(shell $(PKGCONF_CMD) --c=
flags $(PKGCONF_LIBS) $(HIDE_ERR))
	share/mk/configure/build-depends/groff-base/nroff.mk:20:NROFF_LINE_LENGTH =
   ::=3D $(shell $(EXPR) $(MANWIDTH) - 2)
	share/mk/configure/build-depends/groff-base/nroff.mk:24:	$(shell $(LOCALE)=
 charmap \
	share/mk/configure/build-depends/binutils/ld.mk:22:	$(shell \
	share/mk/configure/build-depends/binutils/ld.mk:35:	$(shell $(PKGCONF_CMD)=
 --libs-only-L $(PKGCONF_LIBS) $(HIDE_ERR)) \
	share/mk/configure/build-depends/binutils/ld.mk:36:	$(shell $(PKGCONF_CMD)=
 --libs-only-other $(PKGCONF_LIBS) $(HIDE_ERR))
	share/mk/configure/build-depends/binutils/ld.mk:52:	$(shell $(PKGCONF_CMD)=
 --libs-only-l $(PKGCONF_LIBS) $(HIDE_ERR))
	share/mk/configure/build-depends/gcc/cc.mk:20:	$(shell \

The order in which these run is unspecified (there are obvious
dependencies, if one variable uses the results of another, though), but
if you're interested in auditing everything that may run with
'make nothing' (and thus with every run of make(1), with any targets),
this would be the list.


Have a lovely night!
Alex

--=20
<https://www.alejandro-colomar.es>

--qjjrypovaattxzm3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqTRboACgkQ64mZXMKQ
wqlKeQ/+NESvKHPxMUW/4htPRjqW3eRzSWAgf0p0wvjbrB5WfAGgwICC1POIsQRp
VdYFWIUCPZsGPmlfpcG3ZMLOAFeeUptyeiuxTC2hFr8ljdueYTpqF97VdLw1zB9a
xoQeY6FtS+HsXdSzuORR9BD4syorS8cWMyv+mkLpDWDYDUfKT3rARxoWofjTUUtj
QLJhAjktatUxRcJ1Q2IbDwQwaRr6+ibOC0nYMw1yhW0YGVa9B6OzBPTOZjuWIRsQ
VBmMQPKB5Kqhn9LMVkypIHGDmGgtKuLIqi5UdkKDDSmL9CymyAps0AZWPoMSUxHe
9Ydp7mrA/lK3+DqRf/7jwRGhUIxYE/Lpsp8KTUPnE7/isHiP2Maxz2HgKGdKhfxk
YJ19lKycm0zjhHAByXu1107kXJRMPal6JlT7eHZM9TtFyJK2STa4ouCcZ/Yoz2W0
NUX5/gUaxt5O35OhvbdDfAOwa3+OpmYkDUw/6HUrDw3B8NueZqdsLnx7qg/LmYu5
/jR0kYXzH+P3jjkhuUFcbAoUsEWITqWvy6PW3hs8HF2kozg6vqJeItQuEbwIe4o5
QCj1h638FqMIa5a0yWHwzpmO90kZ2M4wK+XzVKm/xI11HOtnb77W5oQGSgKSERKx
92+rv9cBBroZVXj0y+0KEgnyUFCSXedOEaUhswqlj7DW+ufrji4=
=TNIW
-----END PGP SIGNATURE-----

--qjjrypovaattxzm3--
