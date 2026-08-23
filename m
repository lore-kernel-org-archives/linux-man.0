Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FE727703
	for <linux-man@vger.kernel.org>; Sun, 23 Aug 2026 14:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787494592; cv=none; b=jQUZT627oVoRFpX+iCMaasLM5neXeZgIwUg3zFjqmpKZ6+vZSR7pamPGsTTQr+KwkrlMeBSja3cMyJx4f4P2gBa41Tui9i3DNjkZ9iQI7x6ybb4qmI/qCQJSEMLoyBeP4kPsyJWrN5Dk2q5yGPxz3h1o9deIfHNOj3P2vmcsx5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787494592; c=relaxed/simple;
	bh=QGBY4xiTN7tLUXuyehDORqDyZ4YXruVhEU/Hr2dCI6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bw3t7CThS1hMw4YOwwSbY0/0va9Q+lbT93NfZeGwALTEqi/egAF37gWMahsWffuL0TA1Irr7PrW3BoDL9UBWpGCGCGxFRs/eNON4BjqOg8pVV2Sw9CP3AxPDXJqAU4UyJEHqAoo8MzFhLWCwxi7AhpygqBd77ixJt+naEpJMkwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=citJlc8U; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="citJlc8U"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-836cda225c1so37261357b3.2
        for <linux-man@vger.kernel.org>; Sun, 23 Aug 2026 07:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787494587; x=1788099387; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sz5fByGgQUBsKeLdtWwlAZlFdmlwH+bTQlYMmw6hOTs=;
        b=citJlc8UzBRxuZAUO9TIDVVD1XiFiceNesz75FL0r0RRVtJ7/2zNvV881GgjZJLR44
         JUoAYWxbdpKwxn9KF8IRyCQKxt3z8qxdOBeopSlrNycwapdE5qvTdGQn9ToKYukXF8Nf
         BWfN3wzmq+zG4uwtv0grUM/TPdcr3ZZ/xS+iT87D+BlRUxvMr6qKs4tH83yGYh71QqkM
         ByT+3Vc1t5Dc93ZWI27kQkRLPEtBC+robBPJ9uPvfJXEO0HZptpm6zz612vFZGzJTG1Z
         GQ9Z4d0V8QT3J1pzmeOnsudxip1hXr3K/kXlqZnLxcnczAVIC2fasDvtoSAU0HGeRj8c
         rpTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787494587; x=1788099387;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sz5fByGgQUBsKeLdtWwlAZlFdmlwH+bTQlYMmw6hOTs=;
        b=jrHxA8yZvct4zI9IajhcGGb8BZbPTnEfG3rG7JAmNGd/FYOpwpFzH/t7sv6Va1FEEf
         R8w7x3vJJc5gaTxiTSn0MWYCkblHWQcgHzfElgbqjTnFW8Cn7Fr2lPMLK5HzOMrF/c0P
         H2v07+Yf+E2PF1Gkmv/kKDiXM5IK0mad7PXQO46y1/awz/x8+lixqR6x/d80/eH12CV3
         QvVQ9pp3G4pxbcrui7oJRxenEcpK0I6ud2XeY2phVhCGYUQ0Q7LU+l0Rzwkw8IAGIHOk
         ePf52cGMbpVfd23lvS23M1d+q+LkiI9Xezal6jYvCaqINetDu2kFTZS9N9Ih2R7AhrVm
         0VGQ==
X-Gm-Message-State: AFuF++kR7EGizLEZZUP7svDu0JzbaSYh4KrnrqU2C98ooKODW0u+r3pY
	6DJG5tiTxTzGBM/2PY8MqlK5kyDTX5TnhkMNgSyTaxl1+GAfX1nWIX3+o6KrkQ==
X-Gm-Gg: AR+sD111kXDfXLwyPSb6e9hIebCmRIBYrJixxrRsH//c7CFHXaH+gVdcHEItNTULGNt
	q4sfZvIN/oIlPN4HgafKPLvfBiJOWsNA5398pS+2NBjDgW33Mjb6no5GEDi6uH8sIYyd4OL8lHC
	yxj7OCtKo3hfrfZVy863wdIKrGqDOwYHDa/1zcpXc16BP7mxD5s1DeHAa68yLPjSd962MLhin1x
	IPpoeT45zLb6oRMhJCSqpJ9B5unQj7wca2ijQ6HJFTPyoJD4Kpx2plGe4TJ6sF2YF4E73MPpP+4
	xgfGWbMOa+2pvo5ITWtSOUNt/OijbkKo5DVup24BDvpvLuaFjYBdAmVbWjNq7yCdmBYyV8wFJoX
	pKZYqUlJ48knsAuM2n1u+8J8bwNriDHXLx92ZiQ8TMIMUnxZkJ4cAxFjYHHwM7kaivgOzOFF2iP
	7fU5hXvRLASEv8ES+cx/B1Dwrb9ZcXj96s9uydj/1LBZGr4Yg0aSr8G8dD9FIs
X-Received: by 2002:a05:690e:4197:b0:66c:f18d:c371 with SMTP id 956f58d0204a3-66cf18dc46dmr3514293d50.29.1787494586490;
        Sun, 23 Aug 2026 07:16:26 -0700 (PDT)
Received: from illithid ([2600:1702:7cd0:e980::41])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66cf4a0c6c3sm2179675d50.12.2026.08.23.07.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 07:16:25 -0700 (PDT)
Date: Sun, 23 Aug 2026 09:16:22 -0500
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org
Subject: Re: Using LS/LE (was: [PATCH v4 2/4] man/man5/tunables.conf:
 Document system-wide tunables config)
Message-ID: <20260823141622.7vszwghxrxvkff4j@illithid>
References: <anTugcvjragzGpSK@devuan>
 <xn33wr3rr8.fsf@greed.delorie.com>
 <20260807021256.pwzsls7awqmbslti@illithid>
 <aorlBv8YTu4JlZcy@devuan>
 <20260823132749.pgypzsqv32n67wor@illithid>
 <aor4LIdGrSGHe3TB@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wogrleexqtpizq6o"
Content-Disposition: inline
In-Reply-To: <aor4LIdGrSGHe3TB@devuan>


--wogrleexqtpizq6o
Content-Type: multipart/mixed; protected-headers=v1;
	boundary="si4tdmhw7sia6iga"
Content-Disposition: inline
Subject: Re: Using LS/LE (was: [PATCH v4 2/4] man/man5/tunables.conf:
 Document system-wide tunables config)
MIME-Version: 1.0


--si4tdmhw7sia6iga
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alex,

At 2026-08-23T15:55:29+0200, Alejandro Colomar wrote:
> > From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
> > > Do you know what's wrong?
> >=20
> > More or less. It turns out to be damned hard to balance the
> > requirements of (1) Automake maintainer mode; (2) building from Git
> > repository checkouts; and (3) building from distribution archives.
> > Bruno Haible has been helpful in finding scenarios that don't work.
> >=20
> > https://lists.gnu.org/archive/html/groff/2026-08/msg00039.html
>=20
> Hmmmm, now it rings a bell.  bootstrap said something about configure
> with maintainer mode, but I ignored that, since I had never used
> maintainer mode.

Right.  I introduced that very recently during the RCs for 1.25.0,
because it seemed necessary.  But as shown, Bruno has proposed patches
ripping it back out.

I'm pretty frustrated with Automake's lack of explicit support for
building from Git working copies.  Or maybe it's brilliantly documented
somewhere I haven't seen yet...

> After building with maintainer mode, it works a little bit better.
> At least I could install the binaries.  I still see some errors, but
> I hope they're unimportant.
>=20
> 	alx@devuan:~/src/gnu/groff/master$ git log --pretty=3Dreference -1
> 	144585c33ae8 (roff(7): Fix content and style nits., 2026-08-09)
> 	alx@devuan:~/src/gnu/groff/master$ set -o pipefail;
> 	alx@devuan:~/src/gnu/groff/master$ ./bootstrap |& tail -n1; echo $?
> 	./bootstrap: done.  Now you can run './configure --enable-maintainer-mod=
e'.
> 	0
> 	alx@devuan:~/src/gnu/groff/master$ ./configure --enable-maintainer-mode =
--prefix=3D/opt/local/gnu/groff/test/ |& tail; echo $?
> 	  a --with-appdefdir option).
>=20
> 	  If the gxditview app-defaults are installed in a directory that is not
> 	  one of the default X11 directories for this purpose (common defaults
> 	  are /usr/lib/X11/app-defaults, /usr/share/X11/app-defaults, and
> 	  /etc/X11/app-defaults), you will have to set the environment variable
> 	  XFILESEARCHPATH to this path.  More details can be found in the X(7)
> 	  manual page, or in the document "X Toolkit Intrinsics - C Language
> 	  Interface manual".
> 	      =20
> 	0

That's harmless.  I got the same thing.  As the note implies, this is
only a potential issue if you want to use gxditview from that build.

gxditview changes so slowly that there's little advantage in that.  Some
updates to it are on my long to-do list, but not high priority because
few people ever seem to use the program.

> 	alx@devuan:~/src/gnu/groff/master$ make |& tail -n1; echo $?
> 	make[1]: Leaving directory '/srv/alx/src/gnu/groff/master'
> 	0
> 	alx@devuan:~/src/gnu/groff/master$ sudo make install |& tail; echo $?
> 	install: cannot stat 'doc/img/webpage*': No such file or directory
> 	make[4]: *** [Makefile:19998: install_doc_examples] Error 1
> 	make[4]: Leaving directory '/srv/alx/src/gnu/groff/master'
> 	make[3]: *** [Makefile:16833: install-data-am] Error 2
> 	make[3]: Leaving directory '/srv/alx/src/gnu/groff/master'
> 	make[2]: *** [Makefile:16426: install-am] Error 2
> 	make[2]: Leaving directory '/srv/alx/src/gnu/groff/master'
> 	make[1]: *** [Makefile:13346: install-recursive] Error 1
> 	make[1]: Leaving directory '/srv/alx/src/gnu/groff/master'
> 	make: *** [Makefile:16419: install] Error 2
> 	2

I do _not_ get such errors.  Shell session attached.

=2E..but I'm building _from the release candidate archive_, as I advised
you to do.

> > Build finished successfully for me in about 60 seconds.
>=20
> Out of curiosity, where did you get those timestamps from?  Does your
> history file store them?

Yes.  That's simply the output of Bash's "history" built-in.  I chopped
off the command numbers and removed irrelevancies like "ls".

> Using groff from git HEAD, I see the list as this:
>=20
> 	$ cat ls.man=20
> 	.TH a s d f
> 	.SH test
> 	foo
> 	.LS
> 	.IP \[bu] 3
> 	bar
> 	.IP \[bu]
> 	baz
> 	.LS
> 	.P
> 	qwe
> 	$ /opt/local/gnu/groff/20260823_master/bin/groff -man -Tutf8 ./ls.man=20
> 	a(s)                                                                    =
    a(s)
>=20
> 	test
> 	     foo
>=20
> 	     =E2=80=A2  bar
>=20
> 	     =E2=80=A2  baz
>=20
> 	     qwe
>=20
> 	f                                       d                               =
    a(s)
>=20
> Is this intended?  I thought it would imply PD 0.

Yes, it's intended.  If you want the list compact, you have to say so.

Also, you need to say what kind of list you're presenting.

groff_man(7):
     .LS type [compactness [indentation]]
            (since groff 1.25) Start (or open) a list.  type is one of
            =E2=80=9Cdefinition=E2=80=9D, =E2=80=9Cenumerated=E2=80=9D, or =
=E2=80=9Citemized=E2=80=9D.  compactness is a
            Boolean value directing suppression of inter=E2=80=90paragraph
            spacing between list items.  indentation specifies an
            indentation amount for the body of each list item; it is
            then unnecessary to specify this argument to the list item
            macros.  Use IP with a mark argument to represent an
            itemized or enumerated list item, and TP for a definition
            list item.  Use IP without arguments to associate successive
            paragraphs with an existing list item; to these, inter=E2=80=90
            paragraph spacing applies even in compact lists.

     .LE    (since groff 1.25) End (or close) the most recent open list.

> 	.LS

Say instead:

=2ELS itemized 1

Regards,
Branden

--si4tdmhw7sia6iga
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="groff-build-transcript.txt"
Content-Transfer-Encoding: quoted-printable

## 2026-08-23 09:05:06 bash-5.1 [8] {0} (0) branden@illithid:~/src/GIT/grof=
f !978$ mkdir /tmp/rando
## 2026-08-23 09:05:10 bash-5.1 [8] {0} (0) branden@illithid:~/src/GIT/grof=
f !979$ cd /tmp/rando
## 2026-08-23 09:05:11 bash-5.1 [8] {0} (0) branden@illithid:/tmp/rando !98=
0$ wget 'https://alpha.gnu.org/gnu/groff/groff-1.25.0.rc2.tar.gz'
--2026-08-23 09:05:13--  https://alpha.gnu.org/gnu/groff/groff-1.25.0.rc2.t=
ar.gz
Resolving alpha.gnu.org (alpha.gnu.org)... 2001:470:142:3::c, 209.51.188.21
Connecting to alpha.gnu.org (alpha.gnu.org)|2001:470:142:3::c|:443... conne=
cted.
HTTP request sent, awaiting response... 200 OK
Length: 9400645 (9.0M) [application/x-gzip]
Saving to: =E2=80=98groff-1.25.0.rc2.tar.gz=E2=80=99

groff-1.25.0.rc2.tar.gz              100%[=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D>]   8.96M  17.5MB/s    in 0.5s   =20

2026-08-23 09:05:14 (17.5 MB/s) - =E2=80=98groff-1.25.0.rc2.tar.gz=E2=80=99=
 saved [9400645/9400645]

## 2026-08-23 09:05:14 bash-5.1 [8] {0} (0) branden@illithid:/tmp/rando !98=
1$ wget 'https://alpha.gnu.org/gnu/groff/groff-1.25.0.rc2.tar.gz.sig'
--2026-08-23 09:05:15--  https://alpha.gnu.org/gnu/groff/groff-1.25.0.rc2.t=
ar.gz.sig
Resolving alpha.gnu.org (alpha.gnu.org)... 2001:470:142:3::c, 209.51.188.21
Connecting to alpha.gnu.org (alpha.gnu.org)|2001:470:142:3::c|:443... conne=
cted.
HTTP request sent, awaiting response... 200 OK
Length: 566 [application/pgp-signature]
Saving to: =E2=80=98groff-1.25.0.rc2.tar.gz.sig=E2=80=99

groff-1.25.0.rc2.tar.gz.sig          100%[=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D>]     566  --.-KB/s    in 0s     =20

2026-08-23 09:05:15 (6.47 MB/s) - =E2=80=98groff-1.25.0.rc2.tar.gz.sig=E2=
=80=99 saved [566/566]

## 2026-08-23 09:05:15 bash-5.1 [8] {0} (0) branden@illithid:/tmp/rando !98=
2$ gpg --verify groff-1.25.0.rc2.tar.gz{.sig,}
gpg: Signature made Sat 01 Aug 2026 08:33:36 PM CDT
gpg:                using RSA key 8773D61D68E30E072B10DC1AD19E9C7D71266DCE
gpg: Good signature from "G. Branden Robinson <g.branden.robinson@gmail.com=
>" [ultimate]
## 2026-08-23 09:05:17 bash-5.1 [8] {0} (0) branden@illithid:/tmp/rando !98=
3$ tar xf groff-1.25.0.rc2.tar.gz=20
## 2026-08-23 09:05:22 bash-5.1 [8] {0} (0) branden@illithid:/tmp/rando !98=
4$ cd groff-1.25.0.rc2/
## 2026-08-23 09:05:24 bash-5.1 [8] {0} (0) branden@illithid:/tmp/rando/gro=
ff-1.25.0.rc2 !985$ ./configure --prefix=3D$HOME && make -j && make install
checking that groff version string has valid format... 1.25.0 valid
checking for gcc... gcc
checking whether the C compiler works... yes
checking for C compiler default output file name... a.out
checking for suffix of executables...=20
checking whether we are cross compiling... no
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether gcc accepts -g... yes
checking for gcc option to enable C11 features... none needed
checking whether the compiler is clang... no
checking for compiler option needed when checking for declarations... none
checking how to run the C preprocessor... gcc -E
checking for grep that handles long lines and -e... /home/branden/bin/grep
checking for egrep... /home/branden/bin/grep -E
checking for ANSI C header files... yes
checking for sys/types.h... yes
checking for sys/stat.h... yes
checking for stdlib.h... yes
checking for string.h... yes
checking for memory.h... yes
checking for strings.h... yes
checking for inttypes.h... yes
checking for stdint.h... yes
checking for unistd.h... yes
checking for wchar.h... yes
checking for minix/config.h... no
checking for stdbool.h... yes
checking for uchar.h... yes
checking for unistd.h... (cached) yes
checking for features.h... yes
checking for getopt.h... yes
checking for threads.h... yes
checking for limits.h... yes
checking for inttypes.h... (cached) yes
checking for sys/types.h... (cached) yes
checking for stdint.h... (cached) yes
checking for crtdefs.h... no
checking for wctype.h... yes
checking for xlocale.h... no
checking for math.h... yes
checking for sys/mman.h... yes
checking for sys/param.h... yes
checking for pthread.h... yes
checking for sys/stat.h... (cached) yes
checking for sys/time.h... yes
checking for stdckdint.h... no
checking for stdcountof.h... no
checking for sys/socket.h... yes
checking for strings.h... (cached) yes
checking for sys/wait.h... yes
checking for stdlib.h... (cached) yes
checking whether it is safe to define __EXTENSIONS__... yes
checking whether _XOPEN_SOURCE should be defined... no
checking for a BSD-compatible install... /home/branden/bin/install -c
checking whether build environment is sane... yes
checking for a thread-safe mkdir -p... /home/branden/bin/mkdir -p
checking for gawk... gawk
checking whether make sets $(MAKE)... yes
checking whether make supports the include directive... yes (GNU style)
checking whether make supports nested variables... yes
checking dependency style of gcc... gcc3
checking whether to enable maintainer-specific portions of Makefiles... no
checking whether make supports nested variables... (cached) yes
checking for gcc... (cached) gcc
checking whether we are using the GNU C compiler... (cached) yes
checking whether gcc accepts -g... (cached) yes
checking for gcc option to enable C11 features... (cached) unsupported
checking for gcc option to enable C99 features... none needed
checking whether the compiler is clang... (cached) no
checking for compiler option needed when checking for declarations... (cach=
ed) none
checking for g++... g++
checking whether we are using the GNU C++ compiler... yes
checking whether g++ accepts -g... yes
checking for g++ option to enable C++11 features... (cached) unsupported
checking for g++ option to enable C++98 features... none needed
checking dependency style of g++... gcc3
checking build system type... x86_64-pc-linux-gnu
checking host system type... x86_64-pc-linux-gnu
checking for Minix Amsterdam compiler... no
checking for ar... ar
checking for ranlib... ranlib
checking for gcc option to support large files... none needed
checking for size_t... yes
checking for working alloca.h... yes
checking for alloca... yes
checking whether the preprocessor supports include_next... yes
checking whether source code line length is unlimited... yes
checking whether char8_t is correctly defined... no
checking whether char16_t is correctly defined... yes
checking whether char32_t is correctly defined... yes
checking whether the C++ compiler has <uchar.h>... yes
checking for bit size of wchar_t... 32
checking for mbstate_t... yes
checking for mbsinit... yes
checking for mbrtowc... yes
checking for symlink... yes
checking for snprintf... yes
checking for vasnprintf... no
checking for iswcntrl... yes
checking for lstat... yes
checking for mprotect... yes
checking for readlink... yes
checking for vasprintf... yes
checking for wcwidth... yes
checking for nl_langinfo and CODESET... yes
checking for a traditional japanese locale... none
checking for an english Unicode locale... en_US.UTF-8
checking for a transitional chinese locale... none
checking whether mbrtowc handles incomplete characters... yes
checking whether mbrtowc works as well as mbtowc... guessing yes
checking whether mbrtoc32 is declared... yes
checking for mbrtoc32... yes
checking for a traditional french locale... none
checking whether mbrtoc32 works as well as mbrtowc... guessing yes
checking whether c32rtomb is declared... yes
checking for c32rtomb... yes
checking whether c32rtomb works as well as wcrtomb... guessing yes
checking for complete errno.h... yes
checking whether ctype.h defines __header_inline... no
checking for working fcntl.h... yes
checking for pid_t... yes
checking for mode_t... yes
checking whether byte ordering is bigendian... no
checking whether pow can be used without linking with libm... no
checking whether pow can be used with libm... yes
checking whether frexp() can be used without linking with libm... yes
checking whether alarm is declared... yes
checking whether frexp works... yes
checking whether trunc is declared... yes
checking whether isnan(double) can be used without linking with libm... yes
checking whether ldexp() can be used without linking with libm... yes
checking whether ldexp works... yes
checking for stdint.h... yes
checking for inttypes.h... yes
checking whether printf supports size specifiers as in C99... yes
checking whether printf supports size specifiers as in C23... no
checking whether printf supports 'long double' arguments... yes
checking whether printf supports infinite 'double' arguments... yes
checking whether long double and double are the same... no
checking whether printf supports infinite 'long double' arguments... yes
checking whether printf supports the 'a' and 'A' directives... yes
checking whether printf supports the 'b' directive... no
checking whether printf supports the 'F' directive... yes
checking whether printf supports the 'ls' directive... yes
checking whether printf supports the 'lc' directive correctly... yes
checking whether printf supports POSIX/XSI format strings with positions...=
 yes
checking whether printf supports the grouping flag... yes
checking whether printf supports grouping on integers with a precision... g=
uessing yes
checking whether printf supports grouping with a multibyte separator... gue=
ssing yes
checking whether printf supports the left-adjust flag correctly... yes
checking whether printf supports the zero flag correctly... yes
checking whether printf supports the alternative flag with a zero precision=
=2E.. yes
checking whether printf supports large precisions... yes
checking whether the compiler produces multi-arch binaries... no
checking whether printf survives out-of-memory conditions... yes
checking whether snprintf returns a byte count as in C99... yes
checking whether snprintf truncates the result as in C99... yes
checking for wint_t... yes
checking whether wint_t is large enough... yes
checking where to find the exponent in a 'double'... word 1 bit 20
checking for wcslen... yes
checking for snprintf... (cached) yes
checking for strnlen... yes
checking for wcrtomb... yes
checking whether _snprintf is declared... no
checking for intmax_t... yes
checking for getopt.h... (cached) yes
checking for getopt_long_only... yes
checking whether getopt is POSIX compatible... yes
checking for working GNU getopt function... yes
checking for working GNU getopt_long function... yes
checking for glibc-compatible sys/cdefs.h... yes
checking for pthread.h... (cached) yes
checking for pthread_kill in -lpthread... yes
checking whether POSIX threads API is available... yes
checking whether setlocale (LC_ALL, NULL) is thread-safe... yes
checking whether setlocale (category, NULL) is thread-safe... yes
checking whether limits.h has WORD_BIT, BOOL_WIDTH etc.... no
checking whether stdint.h conforms to C99... yes
checking whether stdint.h works without ISO C predefines... yes
checking whether stdint.h has UINTMAX_WIDTH etc.... yes
checking for C/C++ restrict keyword... __restrict__
checking where to find the exponent in a 'long double'... word 2 bit 0
checking where to find the exponent in a 'float'... word 0 bit 23
checking whether iswcntrl works... yes
checking for towlower... yes
checking for wctype_t... yes
checking for wctrans_t... yes
checking for good max_align_t... yes
checking whether NULL can be used in arbitrary expressions... yes
checking for unreachable in C... no
checking whether nullptr_t needs <stddef.h>... yes
checking whether <stddef.h> is idempotent... guessing yes
checking whether locale.h defines locale_t... yes
checking whether locale.h defines _locale_t... no
checking whether locale.h conforms to POSIX:2001... yes
checking whether struct lconv is properly defined... yes
checking whether lstat correctly handles trailing slash... yes
checking whether malloc is ptrdiff_t safe... yes
checking whether malloc, calloc set errno on failure... yes
checking whether malloc (0) returns nonnull... yes
checking whether NAN macro works... yes
checking whether HUGE_VAL works... yes
checking for inline... inline
checking for MAP_ANONYMOUS... yes
checking whether memchr works... yes
checking whether memeq is declared... no
checking whether memmem is declared... yes
checking for memmem... yes
checking whether memmem works... yes
checking whether imported symbols can be declared weak... yes
checking for multithreading API to use... posix
checking for pthread_t... yes
checking for pthread_spinlock_t... yes
checking for pthread_spin_init... yes
checking for sched.h... yes
checking for struct sched_param... yes
checking whether snprintf is declared... yes
checking whether stat file-mode macros are broken... no
checking for nlink_t... yes
checking for _Bool... yes
checking for stdbool.h that conforms to C99 or later... (cached) yes
checking whether the C++ compiler has <stdcountof.h>... no
checking whether fcloseall is declared... yes
checking whether getw is declared... yes
checking whether putw is declared... yes
checking which flavor of printf attribute matches inttypes macros... system
checking whether ecvt is declared... yes
checking whether fcvt is declared... yes
checking whether gcvt is declared... yes
checking whether MB_CUR_MAX is correct... yes
checking whether streq is declared... no
checking whether strerror(0) succeeds... yes
checking whether strsignal is declared... yes
checking for off64_t... yes
checking for blksize_t... yes
checking for blkcnt_t... yes
checking for struct timespec in <time.h>... yes
checking for TIME_UTC in <time.h>... yes
checking whether execvpe is declared... yes
checking whether vsnprintf is declared... yes
checking whether <wchar.h> uses 'inline' correctly... yes
checking whether wcsdup is declared... yes
checking for C compiler option to allow warnings... -Wno-error
checking for alloca as a compiler built-in... yes
checking for static_assert... yes, an <assert.h> macro
checking for bool, true, false... no
checking for __builtin_expect... yes
checking whether fabs can be used without linking with libm... no
checking whether fabs can be used with libm... yes
checking whether float.h conforms to ISO C23... no
checking whether conversion from 'int' to 'long double' works... yes
checking for ptrdiff_t... yes
checking whether free is known to preserve errno... no
checking whether frexp works... (cached) yes
checking whether frexpl is declared... yes
checking whether frexpl() can be used without linking with libm... yes
checking whether frexpl works... yes
checking for __fseterr... no
checking whether isfinite is declared... yes
checking whether isfinite(long double) works... yes
checking whether isinf is declared... yes
checking whether isinf(long double) works... yes
checking whether isnan(double) can be used without linking with libm... (ca=
ched) yes
checking whether isnan(float) can be used without linking with libm... yes
checking whether isnan(float) works... yes
checking whether isnan(long double) can be used without linking with libm..=
=2E yes
checking whether isnanl works... yes
checking for iswblank... yes
checking whether iswblank is declared... yes
checking whether iswdigit is ISO C compliant... yes
checking whether iswpunct is consistent with ispunct... yes
checking whether iswxdigit is ISO C compliant... yes
checking whether ldexp works... (cached) yes
checking whether localeconv works... yes
checking whether mbrtoc32 works on empty input... yes
checking whether the C locale is free of encoding errors... no
checking whether mbrtoc32 works in an UTF-8 locale... yes
checking whether mbrtowc handles a NULL pwc argument... yes
checking whether mbrtowc has a correct return value... yes
checking whether mbrtowc returns 0 when parsing a NUL character... guessing=
 yes
checking whether mbrtowc stores incomplete characters... no
checking whether mbrtowc works on empty input... yes
checking whether the C locale is free of encoding errors... no
checking whether mbrtowc recognizes invalid UTF-8... yes
checking whether memmem works in linear time... yes
checking for memmem... (cached) yes
checking whether memmem works... (cached) yes
checking whether frexp works... (cached) yes
checking whether ldexp can be used without linking with libm... (cached) yes
checking whether frexpl() can be used without linking with libm... (cached)=
 yes
checking whether frexpl works... (cached) yes
checking whether frexpl is declared... (cached) yes
checking whether ldexpl() can be used without linking with libm... yes
checking whether ldexpl works... yes
checking whether ldexpl is declared... yes
checking for PTHREAD_CREATE_DETACHED... yes
checking for PTHREAD_MUTEX_RECURSIVE... yes
checking for PTHREAD_MUTEX_ROBUST... yes
checking for PTHREAD_PROCESS_SHARED... yes
checking whether pthread_once works... yes
checking whether pthread_once can be used without linking with libpthread..=
=2E no
checking whether readlink signature is correct... yes
checking whether readlink handles trailing slash correctly... yes
checking whether readlink truncates results correctly... yes
checking for signbit macro... yes
checking for signbit compiler built-ins... yes
checking for SIZE_MAX... yes
checking for snprintf... (cached) yes
checking whether snprintf respects a size of 1... yes
checking for ssize_t... yes
checking whether stat handles trailing slashes on files... yes
checking for struct stat.st_atim.tv_nsec... yes
checking whether struct stat.st_atim is of type struct timespec... yes
checking for struct stat.st_birthtimespec.tv_nsec... no
checking for struct stat.st_birthtimensec... no
checking for struct stat.st_birthtim.tv_nsec... no
checking for strcasecmp... yes
checking whether strcasecmp works... guessing yes
checking for working strerror function... yes
checking for strncasecmp... yes
checking whether strcasecmp works... (cached) guessing yes
checking whether strncasecmp is declared... yes
checking for strsignal... yes
checking whether strsignal always returns a string... yes
checking whether trunc is declared... (cached) yes
checking whether unlink honors trailing slashes... yes
checking whether unlink of a parent directory fails as it should... guessin=
g yes
checking for variable-length arrays... yes
checking for ptrdiff_t... (cached) yes
checking for vsnprintf... yes
checking whether snprintf respects a size of 1... (cached) yes
checking whether wcwidth is declared... yes
checking whether wcwidth works reasonably in UTF-8 locales... yes
checking whether to install .cmd wrapper scripts for Windows... no
checking for X... libraries , headers=20
checking for gethostbyname... yes
checking for connect... yes
checking for remove... yes
checking for shmat... yes
checking for IceConnectionNumber in -lICE... yes
checking for Xaw library and header files... yes
checking for Xmu library and header files... yes
checking for a sed that does not truncate output... /usr/bin/sed
checking for perl... /usr/bin/perl
checking for perl version... 5.32.1
checking for lpr... lpr
checking for lp... lp
checking for lpq... lpq
checking option to use when spooling DVI files... -d
checking for egrep... (cached) /home/branden/bin/grep -E
checking for bison... bison -y
checking for m4... m4
checking for makeinfo... makeinfo
checking for makeinfo version... 6.7
checking for texi2dvi... texi2dvi
checking for tex... found
checking for ranlib... (cached) ranlib
checking for install-info... install-info
checking whether ln -s works... yes
checking for xpmtoppm... found
checking for pkg-config... /usr/bin/pkg-config
checking pkg-config is at least version 0.9.0... yes
checking for UCHARDET... yes
checking for csh hash hack... no
checking for stdbool.h... (cached) yes
checking stddef.h usability... yes
checking stddef.h presence... yes
checking for stddef.h... yes
checking for stdlib.h... (cached) yes
checking for unistd.h... (cached) yes
checking dirent.h usability... yes
checking dirent.h presence... yes
checking for dirent.h... yes
checking for limits.h... (cached) yes
checking sys/dir.h usability... yes
checking sys/dir.h presence... yes
checking for sys/dir.h... yes
checking for string.h... (cached) yes
checking for strings.h... (cached) yes
checking for math.h... (cached) yes
checking for sys/time.h... (cached) yes
checking direct.h usability... no
checking direct.h presence... no
checking for direct.h... no
checking process.h usability... no
checking process.h presence... no
checking for process.h... no
checking whether -D_POSIX_SOURCE is necessary... no
checking for return type of srand... void
checking whether gettimeofday must be declared... no
checking whether popen must be declared... no
checking whether pclose must be declared... no
checking whether rand must be declared... no
checking whether srand must be declared... no
checking whether vfprintf must be declared... no
checking for sys_nerr in <errno.h>, <stdio.h>, or <stdlib.h>... yes
checking for sys_errlist in <errno.h>, <stdio.h>, or <stdlib.h>... yes
checking C++ <osfcn.h>... no
checking C++ <limits.h>... yes
checking C++ <inttypes.h>... yes
checking for unsigned long long... yes
checking for declaration of time_t... yes
checking for return type of signal handlers... void
checking whether byte ordering is bigendian... (cached) no
checking for main in -lc... yes
checking for sin in -lm... yes
checking for ld used by gcc... /usr/bin/ld
checking if the linker (/usr/bin/ld) is GNU ld... yes
checking for shared library run path origin... done
checking how to run the C++ preprocessor... g++ -E
checking for iconv... yes
checking for working iconv... yes
checking for iconv declaration...=20
         extern size_t iconv (iconv_t cd, char * *inbuf, size_t *inbyteslef=
t, char * *outbuf, size_t *outbytesleft);
checking for getpagesize... yes
checking for working mmap... yes
checking for getcwd... yes
checking for strtol... yes
checking for gettimeofday... yes
checking for isatty... yes
checking for kill... yes
checking for rename... yes
checking for setlocale... yes
checking for strdup... yes
checking for strsep... yes
checking for mkstemp... yes
checking whether getc_unlocked is declared... yes
checking for nl_langinfo and CODESET... (cached) yes
checking whether ISO C++98 array deletion syntax is supported... yes
checking whether C preprocessor uses pre-ISO C90 syntax... no
checking w_coredump... no
checking default value for grops -b option... 0
checking default paper format... letter (inferred from /etc/papersize)
checking for existing troff installation... no
checking file name prefix of system macro packages... (none)
checking for system macro packages to make available... (none)
checking separator character to use in groff search paths... :
checking for gs... gs
checking for pnmcrop... found
checking for pamcut... found
checking for pnmtopng... found
checking for pnmtops... found
checking for ps2ps... found
checking for URW fonts in Type 1/PFB format... found in /usr/share/fonts/ty=
pe1/urw-base35/
checking for options to make PNM tools quiet... -quiet
checking whether pnmtops accepts the '-nosetpage' option... yes
checking whether 'make' defines 'RM'... yes
checking for a diff program that supports option -D... diff
checking whether 'test' supports '-ef' option... yes
checking for gs version with good left sidebearing handling... got 9.53.3 (=
buggy)
checking whether we are using the GNU C Library >=3D 2.1 or uClibc... yes
checking that generated files are newer than configure... done
configure: creating ./config.status
config.status: creating Makefile
config.status: creating test-groff
config.status: creating src/include/config.h
config.status: executing depfiles commands
config.status: executing mkdir-bison-paths commands

GNU roff version 1.25.0.rc2 configuration summary
----------------------------------------------------------------------
 installation directory prefix    : /home/branden
 C++ compiler and options         : g++ -g -O2=20
 C compiler and options           : gcc -g -O2=20
 Perl interpreter version         : 5.32.1
 Ghostscript command              : gs
 URW fonts directory              : /usr/share/fonts/type1/urw-base35/
 gropdf service level             : full
 X11 support                      : enabled
 X11 app defaults directory       : /home/branden/lib/X11/app-defaults
 default paper format             : letter
 'groff -l' uses print spooler    : lpr
 preconv can use uchardet library : yes
 can build groff.{info,html,txt}  : yes
 can build groff.{dvi,pdf}        : yes
----------------------------------------------------------------------
configure: Default X11 application defaults directory assumed.

  The application defaults files for gxditview (GXditview and
  GXditview-color) will be installed in the following directory.

    /home/branden/lib/X11/app-defaults

  To install elsewhere, say, '/etc/X11/app-defaults', add
  '--with-appdefdir=3D/etc/X11/app-defaults' to the configure script
  command-line options and rerun it (the 'prefix' value has no effect on
  a --with-appdefdir option).

  If the gxditview app-defaults are installed in a directory that is not
  one of the default X11 directories for this purpose (common defaults
  are /usr/lib/X11/app-defaults, /usr/share/X11/app-defaults, and
  /etc/X11/app-defaults), you will have to set the environment variable
  XFILESEARCHPATH to this path.  More details can be found in the X(7)
  manual page, or in the document "X Toolkit Intrinsics - C Language
  Interface manual".
      =20
configure: Buggy version of Ghostscript detected.

  Ghostscript versions 9.00 <=3D x < 9.54 suffer from a rendering glitch
  that affects the AT&T troff (and groff) special character '\(lh'; see
  <https://bugs.ghostscript.com/show_bug.cgi?id=3D703187>.  If your
  version of Ghostscript has not been patched to fix this problem, you
  may need to work around it in groff documents you render for the
  PostScript (and, for tbl(1) tables, HTML) output devices.
 =20
  GEN      lib/alloca.h
  GEN      lib/fcntl.h
  GEN      lib/float.h
  GEN      lib/inttypes.h
  GEN      lib/limits.h
  GEN      lib/locale.h
  GEN      lib/math.h
  GEN      lib/pthread.h
  GEN      lib/sched.h
  GEN      lib/stdckdint.h
  GEN      lib/stdcountof.h
  GEN      lib/stddef.h
  GEN      lib/stdio.h
  GEN      lib/stdlib.h
  GEN      lib/string.h
  GEN      lib/strings.h
  GEN      lib/sys/stat.h
  GEN      lib/sys/types.h
  GEN      lib/sys/wait.h
  GEN      lib/time.h
  GEN      lib/uchar.h
  GEN      lib/unicase.h
  GEN      lib/unictype.h
  GEN      lib/uninorm.h
  GEN      lib/unistd.h
  GEN      lib/unitypes.h
  GEN      lib/uniwidth.h
  GEN      lib/wchar.h
  GEN      lib/wctype.h
make  all-recursive
make[1]: Entering directory '/tmp/rando/groff-1.25.0.rc2'
make[2]: Entering directory '/tmp/rando/groff-1.25.0.rc2'
  GEN      .version
  CC       lib/libgnu_a-unistd.o
  CC       lib/libgnu_a-vfzprintf.o
  CC       lib/libgnu_a-vsnzprintf.o
  CC       lib/libgnu_a-wctype-h.o
  CC       lib/libgnu_a-xsize.o
  CC       lib/libgnu_a-asnprintf.o
  CC       lib/libgnu_a-fprintf.o
  CC       lib/libgnu_a-printf-args.o
  CC       lib/libgnu_a-printf-parse.o
  CC       lib/libgnu_a-vasnprintf.o
  GEN      src/devices/xditview/GXditview-ad.h
  GEN      src/devices/xditview/groff_version.h
  GEN      eqn2graph
  GEN      gdiffmk
  GEN      shdeps.sed
  GEN      grap2graph
  GEN      mmroff
  GEN      pic2graph
  GEN      afmtodit
  GEN      grog
  GEN      pdfmom
  GEN      src/roff/troff/majorminor.cpp
  GEN      chem
  GEN      nroff
  GEN      neqn
  GEN      font/devascii/R
  GEN      font/devascii/I
  GEN      font/devascii/B
  GEN      font/devascii/BI
  GEN      font/devascii/DESC
  GEN      font/devdvi/DESC
  GEN      font/devhtml/R
  GEN      font/devhtml/I
  GEN      font/devhtml/B
  GEN      font/devhtml/BI
  GEN      font/devhtml/CR
  GEN      font/devhtml/CI
  GEN      font/devhtml/CBI
  GEN      font/devhtml/S
  GEN      font/devhtml/CB
  GEN      font/devhtml/DESC
  GEN      font/devlatin1/R
  GEN      font/devlatin1/I
  GEN      font/devlatin1/B
  GEN      font/devlatin1/BI
  GEN      font/devlatin1/DESC
  GEN      font/devlbp/DESC
  GEN      font/devpdf/DESC
  GEN      font/devpdf/util/BuildFoundries
  GEN      font/devpdf/Foundry
  GEN      font/devpdf/symbolsl.afm
  GEN      font/devpdf/symbolsl.pfb
  GEN      font/devutf8/R
  GEN      font/devutf8/I
  GEN      font/devpdf/SS
  GEN      font/devutf8/B
  GEN      font/devutf8/BI
  GEN      font/devutf8/DESC
  GEN      font/devps/DESC
  GEN      font/devps/prologue
  GEN      font/devps/freeeuro.pfa
  GEN      font/devps/zapfdr.pfa
  GEN      font/devps/symbolsl.pfa
  GEN      tmac/www.tmac
  GEN      font/devlj4/DESC
  GEN      doc/groff-man-pages-cover.groff
  GEN      doc/ms.ms
  GEN      contrib/hdtbl/examples/fonts_n.roff
  GEN      contrib/hdtbl/examples/fonts_x.roff
  GEN      doc/meref.me
  GEN      doc/meintro.me
  GEN      doc/meintro_fr.me
  CXX      src/devices/grodvi/dvi.o
  CXX      src/libs/libdriver/input.o
  CXX      src/libs/libdriver/printer.o
  CXX      src/libs/libgroff/libgroff_a-change_lf.o
  CXX      src/libs/libgroff/libgroff_a-cmap.o
  CXX      src/libs/libgroff/libgroff_a-cset.o
  CXX      src/libs/libgroff/libgroff_a-color.o
  CXX      src/libs/libgroff/libgroff_a-device.o
  CXX      src/libs/libgroff/libgroff_a-curtime.o
  CXX      src/libs/libgroff/libgroff_a-errarg.o
  CXX      src/libs/libgroff/libgroff_a-error.o
  CXX      src/libs/libgroff/libgroff_a-fatal.o
  CXX      src/libs/libgroff/libgroff_a-filename.o
  CXX      src/libs/libgroff/libgroff_a-font.o
  GEN      contrib/sboxes/msboxes.ms
  CXX      src/libs/libgroff/libgroff_a-fontfile.o
  CXX      src/libs/libgroff/libgroff_a-geometry.o
  CXX      src/libs/libgroff/libgroff_a-glyphuni.o
  CXX      src/libs/libgroff/libgroff_a-htmlhint.o
  CC       src/libs/libgroff/libgroff_a-iftoa.o
  CXX      src/libs/libgroff/libgroff_a-invalid.o
  CC       src/libs/libgroff/libgroff_a-itoa.o
  CXX      src/libs/libgroff/libgroff_a-json_encode.o
  CXX      src/libs/libgroff/libgroff_a-lf.o
  CXX      src/libs/libgroff/libgroff_a-lineno.o
  CXX      src/libs/libgroff/libgroff_a-macropath.o
  CXX      src/libs/libgroff/libgroff_a-maxfilename.o
  CXX      src/libs/libgroff/libgroff_a-maxpathname.o
  CXX      src/libs/libgroff/libgroff_a-mksdir.o
  CXX      src/libs/libgroff/libgroff_a-nametoindex.o
  CXX      src/libs/libgroff/libgroff_a-paper.o
  CXX      src/libs/libgroff/libgroff_a-prime.o
  CC       src/libs/libgroff/libgroff_a-progname.o
  CXX      src/libs/libgroff/libgroff_a-ptable.o
  CC       src/libs/libgroff/libgroff_a-quotearg.o
  CXX      src/libs/libgroff/libgroff_a-relocate.o
  CXX      src/libs/libgroff/libgroff_a-searchpath.o
  CC       src/libs/libgroff/libgroff_a-spawnvp.o
  CXX      src/libs/libgroff/libgroff_a-string.o
  CXX      src/libs/libgroff/libgroff_a-strsave.o
  CXX      src/libs/libgroff/libgroff_a-symbol.o
  CXX      src/libs/libgroff/libgroff_a-tmpfile.o
  CXX      src/libs/libgroff/libgroff_a-tmpname.o
  CXX      src/libs/libgroff/libgroff_a-unicode.o
  CXX      src/libs/libgroff/libgroff_a-uniglyph.o
  CXX      src/libs/libgroff/libgroff_a-uniuni.o
  CC       lib/libgnu_a-c32isalnum.o
  CC       lib/libgnu_a-c32isalpha.o
  CC       lib/libgnu_a-c32isblank.o
  CC       lib/libgnu_a-c32iscntrl.o
  CC       lib/libgnu_a-c32isdigit.o
  CC       lib/libgnu_a-c32isgraph.o
  CC       lib/libgnu_a-c32islower.o
  GEN      src/libs/libgroff/version.cpp
  CC       lib/libgnu_a-c32isprint.o
  CC       lib/libgnu_a-c32ispunct.o
  CC       lib/libgnu_a-c32isspace.o
  CC       lib/libgnu_a-c32isupper.o
  CC       lib/libgnu_a-c32isxdigit.o
  CC       lib/libgnu_a-c32tolower.o
  CC       lib/libgnu_a-c32width.o
  CC       lib/libgnu_a-float.o
  CC       lib/libgnu_a-free.o
  CC       lib/libgnu_a-fseterr.o
  CC       lib/libgnu_a-hard-locale.o
  CC       lib/libgnu_a-issymlink.o
  CC       lib/libgnu_a-localcharset.o
  CC       lib/libgnu_a-malloca.o
  CC       lib/libgnu_a-math.o
  CC       lib/libgnu_a-mbchar.o
  CC       lib/libgnu_a-mbiter-aux.o
  CC       lib/libgnu_a-mbiterf.o
  CC       lib/libgnu_a-mbrtowc.o
  CC       lib/libgnu_a-mbrtoc32.o
  CC       lib/libgnu_a-mbsnlen.o
  CC       lib/libgnu_a-mbszero.o
  CC       lib/libgnu_a-memeq.o
  CC       lib/glthread/libgnu_a-once.o
  CC       lib/libgnu_a-printf-frexp.o
  CC       lib/libgnu_a-printf-frexpl.o
  CC       lib/libgnu_a-setlocale_null.o
  CC       lib/libgnu_a-setlocale_null-unlocked.o
  CC       lib/libgnu_a-stat-time.o
  CC       lib/libgnu_a-stdlib.o
  CC       lib/libgnu_a-streq.o
  CC       lib/glthread/libgnu_a-threadlib.o
  CC       lib/glthread/libgnu_a-tls.o
  CC       lib/unicase/libgnu_a-tolower.o
  CC       lib/unictype/libgnu_a-ctype_alnum.o
  CC       lib/unictype/libgnu_a-ctype_alpha.o
  CC       lib/unictype/libgnu_a-ctype_blank.o
  CC       lib/unictype/libgnu_a-ctype_cntrl.o
  CC       lib/unictype/libgnu_a-ctype_digit.o
  CC       lib/unictype/libgnu_a-ctype_graph.o
  CC       lib/unictype/libgnu_a-ctype_lower.o
  CC       lib/unictype/libgnu_a-ctype_print.o
  CC       lib/unictype/libgnu_a-ctype_punct.o
  CC       lib/unictype/libgnu_a-ctype_space.o
  CC       lib/unictype/libgnu_a-ctype_upper.o
  CC       lib/uniwidth/libgnu_a-width.o
  CC       lib/unictype/libgnu_a-ctype_xdigit.o
  CXX      src/devices/grohtml/post-html.o
  CXX      src/devices/grohtml/html-table.o
  CXX      src/devices/grohtml/output.o
  CXX      src/devices/grohtml/html-text.o
  CXX      src/devices/grolbp/lbp.o
  CXX      src/devices/grops/ps.o
  CXX      src/devices/grolj4/lj4.o
  CXX      src/devices/grops/psrm.o
  CXX      src/devices/grotty/tty.o
  CC       src/devices/xditview/gxditview-device.o
  CC       src/devices/xditview/gxditview-draw.o
  CC       src/devices/xditview/gxditview-Dvi.o
  CC       src/devices/xditview/gxditview-font.o
  CC       src/devices/xditview/gxditview-lex.o
  CC       src/devices/xditview/gxditview-page.o
  CC       src/devices/xditview/gxditview-parse.o
  CC       src/devices/xditview/gxditview-xditview.o
  CC       src/libs/libxutil/libxutil_a-DviChar.o
  CC       src/libs/libxutil/libxutil_a-XFontName.o
  CC       src/libs/libxutil/libxutil_a-xmalloc.o
  CXX      src/preproc/html/pre-html.o
  CXX      src/preproc/html/pushback.o
  CXX      src/preproc/preconv/preconv-preconv.o
  CXX      src/roff/groff/groff.o
  CC       src/roff/groff/pipeline.o
  CXX      src/utils/addftinfo/addftinfo.o
  CXX      src/utils/addftinfo/guess.o
  CXX      src/utils/hpftodit/hpftodit.o
  CXX      src/utils/hpftodit/hpuni.o
  CXX      src/utils/lkbib/lkbib.o
  CXX      src/libs/libbib/common.o
  CXX      src/libs/libbib/index.o
  CXX      src/libs/libbib/linear.o
  CXX      src/libs/libbib/search.o
  CC       src/libs/libbib/map.o
  CC       src/utils/pfbtops/pfbtops.o
  CXX      src/utils/tfmtodit/tfmtodit.o
  CC       src/utils/xtotroff/xtotroff-xtotroff.o
  CXX      src/preproc/eqn/eqn-main.o
  CXX      src/preproc/eqn/eqn-lex.o
  CXX      src/preproc/eqn/eqn-box.o
  CXX      src/preproc/eqn/eqn-limit.o
  CXX      src/preproc/eqn/eqn-list.o
  CXX      src/preproc/eqn/eqn-over.o
  CXX      src/preproc/eqn/eqn-text.o
  CXX      src/preproc/eqn/eqn-script.o
  CXX      src/preproc/eqn/eqn-mark.o
  CXX      src/preproc/eqn/eqn-other.o
  CXX      src/preproc/eqn/eqn-delim.o
  CXX      src/preproc/eqn/eqn-sqrt.o
  CXX      src/preproc/eqn/eqn-pile.o
  CXX      src/preproc/eqn/eqn-special.o
  CXX      src/preproc/eqn/eqn-eqn.o
  CXX      src/preproc/grn/hdb.o
  CXX      src/preproc/grn/hpoint.o
  CXX      src/preproc/grn/hgraph.o
  CXX      src/preproc/grn/main.o
  CXX      src/preproc/pic/pic-pic.o
  CXX      src/preproc/pic/pic-lex.o
  CXX      src/preproc/pic/pic-main.o
  CXX      src/preproc/pic/pic-object.o
  CXX      src/preproc/pic/pic-common.o
  CXX      src/preproc/pic/pic-troff.o
  CXX      src/preproc/pic/pic-tex.o
  CXX      src/preproc/refer/refer-command.o
  CXX      src/preproc/refer/refer-ref.o
  CXX      src/preproc/refer/refer-refer.o
  CXX      src/preproc/refer/refer-token.o
  CXX      src/preproc/refer/refer-label.o
  CXX      src/preproc/soelim/soelim.o
  CXX      src/preproc/tbl/main.o
  CXX      src/preproc/tbl/table.o
  CXX      src/roff/troff/dictionary.o
  CXX      src/roff/troff/div.o
  CXX      src/roff/troff/env.o
  CXX      src/roff/troff/input.o
  CXX      src/roff/troff/mtsm.o
  CXX      src/roff/troff/node.o
  CXX      src/roff/troff/number.o
  CXX      src/roff/troff/reg.o
  CXX      src/roff/troff/majorminor.o
  CXX      src/utils/indxbib/indxbib.o
  CC       src/utils/indxbib/signal.o
  CXX      src/utils/lookbib/lookbib.o
  GEN      glilypond
  GEN      gperl
  GEN      gpinyin
  GEN      gropdf
  GEN      tmac/groff_man.7.man
  GEN      tmac/groff_man_style.7.man
  GEN      font/devpdf/download
  AR       libdriver.a
  CXX      src/libs/libgroff/libgroff_a-version.o
  AR       lib/libgnu.a
BuildFoundries: notice: copied grops font description AB for gropdf
BuildFoundries: notice: copied grops font description ABI for gropdf
BuildFoundries: notice: copied grops font description AI for gropdf
BuildFoundries: notice: copied grops font description AR for gropdf
BuildFoundries: notice: copied grops font description BMB for gropdf
BuildFoundries: notice: copied grops font description BMBI for gropdf
BuildFoundries: notice: copied grops font description BMI for gropdf
BuildFoundries: notice: copied grops font description BMR for gropdf
BuildFoundries: notice: copied grops font description CB for gropdf
BuildFoundries: notice: copied grops font description CBI for gropdf
BuildFoundries: notice: copied grops font description CI for gropdf
BuildFoundries: notice: copied grops font description CR for gropdf
BuildFoundries: notice: copied grops font description HB for gropdf
BuildFoundries: notice: copied grops font description HBI for gropdf
BuildFoundries: notice: copied grops font description HI for gropdf
BuildFoundries: notice: copied grops font description HNB for gropdf
BuildFoundries: notice: copied grops font description HNBI for gropdf
BuildFoundries: notice: copied grops font description HNI for gropdf
BuildFoundries: notice: copied grops font description HNR for gropdf
BuildFoundries: notice: copied grops font description HR for gropdf
BuildFoundries: notice: copied grops font description NB for gropdf
BuildFoundries: notice: copied grops font description NBI for gropdf
BuildFoundries: notice: copied grops font description NI for gropdf
BuildFoundries: notice: copied grops font description NR for gropdf
BuildFoundries: notice: copied grops font description PB for gropdf
BuildFoundries: notice: copied grops font description PBI for gropdf
BuildFoundries: notice: copied grops font description PI for gropdf
BuildFoundries: notice: copied grops font description PR for gropdf
BuildFoundries: notice: copied grops font description S for gropdf
BuildFoundries: notice: copied grops font description TB for gropdf
BuildFoundries: notice: copied grops font description TBI for gropdf
BuildFoundries: notice: copied grops font description TI for gropdf
BuildFoundries: notice: copied grops font description TR for gropdf
BuildFoundries: notice: copied grops font description ZCMI for gropdf
BuildFoundries: notice: copied grops font description ZD for gropdf
BuildFoundries: notice: copied grops font description EURO for gropdf
  AR       libgroff.a
  CXXLD    grodvi
  CXXLD    addftinfo
  CCLD     pfbtops
  AR       libxutil.a
  CCLD     xtotroff
  CCLD     gxditview
BuildFoundries: notice: generated font description U-AB for gropdf
  CXXLD    soelim
  CXXLD    grolj4
BuildFoundries: notice: generated font description U-ABI for gropdf
  GEN      contrib/chem/chem.1
  GEN      contrib/eqn2graph/eqn2graph.1
  GEN      contrib/gdiffmk/gdiffmk.1
  GEN      contrib/glilypond/glilypond.1
  GEN      contrib/gperl/gperl.1
  GEN      contrib/gpinyin/gpinyin.1
  GEN      contrib/grap2graph/grap2graph.1
  GEN      contrib/mm/mmroff.1
  GEN      contrib/pic2graph/pic2graph.1
  GEN      src/devices/grodvi/grodvi.1
  GEN      src/devices/grohtml/grohtml.1
  GEN      src/devices/grolbp/grolbp.1
  GEN      src/devices/grolj4/grolj4.1
  GEN      src/devices/gropdf/gropdf.1
  GEN      src/devices/grops/grops.1
  GEN      src/devices/grotty/grotty.1
  GEN      src/devices/xditview/gxditview.1
  GEN      src/preproc/preconv/preconv.1
BuildFoundries: notice: generated font description U-AI for gropdf
  GEN      src/utils/addftinfo/addftinfo.1
  GEN      src/roff/groff/groff.1
  GEN      src/utils/afmtodit/afmtodit.1
  GEN      src/utils/grog/grog.1
  GEN      src/utils/hpftodit/hpftodit.1
  GEN      src/utils/lkbib/lkbib.1
  GEN      src/utils/pdfmom/pdfmom.1
  GEN      src/utils/pfbtops/pfbtops.1
  GEN      src/utils/tfmtodit/tfmtodit.1
  GEN      src/utils/xtotroff/xtotroff.1
  GEN      src/preproc/eqn/eqn.1
  GEN      src/preproc/eqn/neqn.1
  GEN      src/preproc/grn/grn.1
  GEN      src/preproc/pic/pic.1
  GEN      src/preproc/refer/refer.1
  GEN      src/preproc/soelim/soelim.1
  GEN      src/preproc/tbl/tbl.1
  GEN      src/roff/nroff/nroff.1
  GEN      src/roff/troff/troff.1
  GEN      src/utils/indxbib/indxbib.1
  GEN      src/utils/lookbib/lookbib.1
  GEN      man/groff_font.5
  GEN      man/groff_out.5
  GEN      man/groff_tmac.5
  GEN      contrib/hdtbl/groff_hdtbl.7
  GEN      contrib/mm/groff_mm.7
  GEN      contrib/mm/groff_mmse.7
  GEN      contrib/mom/groff_mom.7
  GEN      contrib/rfc1345/groff_rfc1345.7
  GEN      man/groff_char.7
  GEN      man/groff_diff.7
  GEN      man/groff.7
  GEN      man/roff.7
  GEN      tmac/groff_ms.7
  GEN      tmac/groff_man.7
  GEN      tmac/groff_man_style.7
  GEN      tmac/groff_me.7
  GEN      tmac/groff_mdoc.7
  GEN      tmac/groff_trace.7
BuildFoundries: notice: generated font description U-AR for gropdf
  GEN      tmac/groff_www.7
  CXXLD    grotty
  CXXLD    pre-grohtml
  CXXLD    preconv
  CXXLD    groff
  AR       libbib.a
  CXXLD    grn
  CXXLD    lkbib
  CXXLD    lookbib
  CXXLD    tfmtodit
  CXXLD    indxbib
BuildFoundries: notice: generated font description U-BMB for gropdf
  CXXLD    eqn
BuildFoundries: notice: generated font description U-BMBI for gropdf
  CXXLD    hpftodit
  CXXLD    grops
  CXXLD    refer
BuildFoundries: notice: generated font description U-BMI for gropdf
  CXXLD    grolbp
BuildFoundries: notice: generated font description U-BMR for gropdf
BuildFoundries: notice: generated font description U-CB for gropdf
BuildFoundries: notice: generated font description U-CBI for gropdf
BuildFoundries: notice: generated font description U-CI for gropdf
BuildFoundries: notice: generated font description U-CR for gropdf
BuildFoundries: notice: generated font description U-HB for gropdf
BuildFoundries: notice: generated font description U-HBI for gropdf
BuildFoundries: notice: generated font description U-HI for gropdf
  CXXLD    pic
BuildFoundries: notice: generated font description U-HNB for gropdf
BuildFoundries: notice: generated font description U-HNBI for gropdf
BuildFoundries: notice: generated font description U-HNI for gropdf
BuildFoundries: notice: generated font description U-HNR for gropdf
BuildFoundries: notice: generated font description U-HR for gropdf
BuildFoundries: notice: generated font description U-NB for gropdf
BuildFoundries: notice: generated font description U-NBI for gropdf
BuildFoundries: notice: generated font description U-NI for gropdf
BuildFoundries: notice: generated font description U-NR for gropdf
  CXXLD    tbl
BuildFoundries: notice: generated font description U-PB for gropdf
BuildFoundries: notice: generated font description U-PBI for gropdf
BuildFoundries: notice: generated font description U-PI for gropdf
  CXXLD    post-grohtml
BuildFoundries: notice: generated font description U-PR for gropdf
BuildFoundries: notice: generated font description U-S for gropdf
BuildFoundries: notice: generated font description U-TB for gropdf
BuildFoundries: notice: generated font description U-TBI for gropdf
BuildFoundries: notice: generated font description U-TI for gropdf
BuildFoundries: notice: generated font description U-TR for gropdf
BuildFoundries: notice: generated font description U-ZCMI for gropdf
BuildFoundries: notice: generated font description U-ZD for gropdf
  CXXLD    troff
  GROFF    doc/pic.html
  GROFF    doc/webpage.html
  GROFF    doc/webpage.ps
  GROFF    doc/grnexmpl.ps
  GROFF    doc/automake.pdf
  GROFF    doc/groff-man-pages.pdf
  GROFF    doc/ms.pdf
  GROFF    doc/pic.pdf
  GROFF    doc/groff-pdf-features.pdf
  GROFF    contrib/hdtbl/examples/color_boxes.ps
  GROFF    contrib/hdtbl/examples/chess_board.ps
  GROFF    contrib/hdtbl/examples/color_nested_tables.ps
  GROFF    contrib/hdtbl/examples/color_table_cells.ps
  GROFF    contrib/hdtbl/examples/color_transitions.ps
  GROFF    contrib/hdtbl/examples/col_rowspan_colors.ps
  GROFF    contrib/hdtbl/examples/fonts_n.ps
  GROFF    contrib/hdtbl/examples/fonts_x.ps
  GROFF    contrib/hdtbl/examples/mixed_pickles.ps
  GROFF    contrib/hdtbl/examples/rainbow.ps
  GROFF    contrib/hdtbl/examples/short_reference.ps
  GROFF    contrib/mom/examples/letter.pdf
  GROFF    contrib/mom/examples/mom-pdf.pdf
  GROFF    contrib/mom/examples/mon_premier_doc.pdf
  GROFF    contrib/mom/examples/sample_docs.pdf
  GROFF    contrib/mom/examples/slide-demo.pdf
  GROFF    contrib/mom/examples/copyright-default.pdf
  GROFF    contrib/mom/examples/copyright-chapter.pdf
  GROFF    contrib/mom/examples/typesetting.pdf
  GROFF    doc/meref.ps
  GROFF    doc/meintro.ps
  GROFF    doc/meintro_fr.ps
  GROFF    doc/groff-man-pages.utf8.txt
  GROFF    contrib/sboxes/msboxes.pdf
fonts_x.roff: listing fonts in ./font/devps
fonts_n.roff: listing fonts in ./font/devps
fonts_x.roff: listing glyphs in font 'AB' with hdtbl...
fonts_n.roff: listing glyphs in font 'AB' with hdtbl...
fonts_x.roff: listing glyphs in font 'ABI' with hdtbl...
fonts_n.roff: listing glyphs in font 'ABI' with hdtbl...
fonts_x.roff: listing glyphs in font 'AI' with hdtbl...
fonts_n.roff: listing glyphs in font 'AI' with hdtbl...
fonts_x.roff: listing glyphs in font 'AR' with hdtbl...
fonts_n.roff: listing glyphs in font 'AR' with hdtbl...
fonts_x.roff: listing glyphs in font 'BMB' with hdtbl...
fonts_n.roff: listing glyphs in font 'BMB' with hdtbl...
fonts_x.roff: listing glyphs in font 'BMBI' with hdtbl...
fonts_n.roff: listing glyphs in font 'BMBI' with hdtbl...
fonts_x.roff: listing glyphs in font 'BMI' with hdtbl...
fonts_n.roff: listing glyphs in font 'BMI' with hdtbl...
fonts_x.roff: listing glyphs in font 'BMR' with hdtbl...
fonts_n.roff: listing glyphs in font 'BMR' with hdtbl...
fonts_x.roff: listing glyphs in font 'CB' with hdtbl...
fonts_n.roff: listing glyphs in font 'CB' with hdtbl...
fonts_x.roff: listing glyphs in font 'CBI' with hdtbl...
fonts_n.roff: listing glyphs in font 'CBI' with hdtbl...
fonts_x.roff: listing glyphs in font 'CI' with hdtbl...
fonts_n.roff: listing glyphs in font 'CI' with hdtbl...
fonts_x.roff: listing glyphs in font 'CR' with hdtbl...
fonts_n.roff: listing glyphs in font 'CR' with hdtbl...
fonts_x.roff: listing glyphs in font 'CSH' with hdtbl...
fonts_n.roff: listing glyphs in font 'CSH' with hdtbl...
fonts_x.roff: listing glyphs in font 'CSS' with hdtbl...
fonts_x.roff: listing glyphs in font 'CTH' with hdtbl...
fonts_n.roff: listing glyphs in font 'CSS' with hdtbl...
fonts_x.roff: listing glyphs in font 'CTS' with hdtbl...
fonts_n.roff: listing glyphs in font 'CTH' with hdtbl...
fonts_x.roff: listing glyphs in font 'EURO' with hdtbl...
fonts_n.roff: listing glyphs in font 'CTS' with hdtbl...
fonts_x.roff: listing glyphs in font 'HB' with hdtbl...
fonts_n.roff: listing glyphs in font 'EURO' with hdtbl...
fonts_n.roff: listing glyphs in font 'HB' with hdtbl...
fonts_x.roff: listing glyphs in font 'HBI' with hdtbl...
fonts_x.roff: listing glyphs in font 'HI' with hdtbl...
fonts_n.roff: listing glyphs in font 'HBI' with hdtbl...
fonts_x.roff: listing glyphs in font 'HNB' with hdtbl...
fonts_n.roff: listing glyphs in font 'HI' with hdtbl...
fonts_x.roff: listing glyphs in font 'HNBI' with hdtbl...
fonts_n.roff: listing glyphs in font 'HNB' with hdtbl...
fonts_x.roff: listing glyphs in font 'HNI' with hdtbl...
fonts_n.roff: listing glyphs in font 'HNBI' with hdtbl...
fonts_x.roff: listing glyphs in font 'HNR' with hdtbl...
fonts_n.roff: listing glyphs in font 'HNI' with hdtbl...
fonts_x.roff: listing glyphs in font 'HR' with hdtbl...
fonts_n.roff: listing glyphs in font 'HNR' with hdtbl...
fonts_x.roff: listing glyphs in font 'JPG' with hdtbl...
fonts_n.roff: listing glyphs in font 'HR' with hdtbl...
fonts_x.roff: listing glyphs in font 'JPM' with hdtbl...
fonts_n.roff: listing glyphs in font 'JPG' with hdtbl...
fonts_x.roff: listing glyphs in font 'KOG' with hdtbl...
fonts_n.roff: listing glyphs in font 'JPM' with hdtbl...
fonts_x.roff: listing glyphs in font 'KOM' with hdtbl...
fonts_n.roff: listing glyphs in font 'KOG' with hdtbl...
fonts_x.roff: listing glyphs in font 'NB' with hdtbl...
fonts_n.roff: listing glyphs in font 'KOM' with hdtbl...
fonts_x.roff: listing glyphs in font 'NBI' with hdtbl...
fonts_n.roff: listing glyphs in font 'NB' with hdtbl...
fonts_x.roff: listing glyphs in font 'NI' with hdtbl...
fonts_n.roff: listing glyphs in font 'NBI' with hdtbl...
fonts_x.roff: listing glyphs in font 'NR' with hdtbl...
fonts_x.roff: listing glyphs in font 'PB' with hdtbl...
fonts_n.roff: listing glyphs in font 'NI' with hdtbl...
fonts_x.roff: listing glyphs in font 'PBI' with hdtbl...
fonts_n.roff: listing glyphs in font 'NR' with hdtbl...
fonts_x.roff: listing glyphs in font 'PI' with hdtbl...
fonts_n.roff: listing glyphs in font 'PB' with hdtbl...
fonts_x.roff: listing glyphs in font 'PR' with hdtbl...
fonts_n.roff: listing glyphs in font 'PBI' with hdtbl...
fonts_x.roff: listing glyphs in font 'S' with hdtbl...
fonts_n.roff: listing glyphs in font 'PI' with hdtbl...
fonts_x.roff: listing glyphs in font 'SS' with hdtbl...
fonts_n.roff: listing glyphs in font 'PR' with hdtbl...
fonts_x.roff: listing glyphs in font 'TB' with hdtbl...
fonts_n.roff: listing glyphs in font 'S' with hdtbl...
fonts_x.roff: listing glyphs in font 'TBI' with hdtbl...
fonts_n.roff: listing glyphs in font 'SS' with hdtbl...
fonts_x.roff: listing glyphs in font 'TI' with hdtbl...
fonts_n.roff: listing glyphs in font 'TB' with hdtbl...
fonts_x.roff: listing glyphs in font 'TR' with hdtbl...
fonts_n.roff: listing glyphs in font 'TBI' with hdtbl...
fonts_x.roff: listing glyphs in font 'ZCMI' with hdtbl...
fonts_n.roff: listing glyphs in font 'TI' with hdtbl...
fonts_x.roff: listing glyphs in font 'ZD' with hdtbl...
fonts_n.roff: listing glyphs in font 'TR' with hdtbl...
fonts_x.roff: listing glyphs in font 'ZDR' with hdtbl...
fonts_n.roff: listing glyphs in font 'ZCMI' with hdtbl...
fonts_n.roff: listing glyphs in font 'ZD' with hdtbl...
fonts_n.roff: listing glyphs in font 'ZDR' with hdtbl...
troff: backtrace: file '<standard input>':1075
troff:<standard input>:1075: warning: special character '.j' not defined [-=
w char]
troff: backtrace: file '<standard input>':1481
troff:<standard input>:1481: warning: special character 'vA' not defined [-=
w char]
troff: backtrace: file '<standard input>':1611
troff:<standard input>:1611: warning: special character 'bs' not defined [-=
w char]
troff: backtrace: file '<standard input>':1784
troff:<standard input>:1784: warning: special character '-+' not defined [-=
w char]
troff: backtrace: file '<standard input>':1833
troff:<standard input>:1833: warning: special character 'coproduct' not def=
ined [-w char]
troff: backtrace: file '<standard input>':1933
troff:<standard input>:1933: warning: special character '+e' not defined [-=
w char]
make[2]: Leaving directory '/tmp/rando/groff-1.25.0.rc2'
make[1]: Leaving directory '/tmp/rando/groff-1.25.0.rc2'
make  install-recursive
make[1]: Entering directory '/tmp/rando/groff-1.25.0.rc2'
make[2]: Entering directory '/tmp/rando/groff-1.25.0.rc2'
make[3]: Entering directory '/tmp/rando/groff-1.25.0.rc2'
 /home/branden/bin/mkdir -p '/home/branden/bin'
  /home/branden/bin/install -c grodvi post-grohtml grolbp grolj4 grops grot=
ty gxditview pre-grohtml preconv groff addftinfo hpftodit lkbib pfbtops tfm=
todit xtotroff '/home/branden/bin'
 /home/branden/bin/mkdir -p '/home/branden/bin'
 /home/branden/bin/install -c eqn2graph gdiffmk glilypond gperl gpinyin gra=
p2graph mmroff pic2graph gropdf afmtodit grog pdfmom '/home/branden/bin'
 /home/branden/bin/mkdir -p '/home/branden/bin'
  /home/branden/bin/install -c eqn grn pic refer soelim tbl troff indxbib l=
ookbib '/home/branden/bin'
 /home/branden/bin/mkdir -p '/home/branden/bin'
 /home/branden/bin/install -c chem neqn nroff '/home/branden/bin'
make  install-exec-hook
make[4]: Entering directory '/tmp/rando/groff-1.25.0.rc2'
make[4]: Nothing to be done for 'install-exec-hook'.
make[4]: Leaving directory '/tmp/rando/groff-1.25.0.rc2'
test -d /home/branden/share/doc/groff-1.25.0/examples/chem/cstr-122 \
          || /bin/bash /tmp/rando/groff-1.25.0.rc2/build-aux/install-sh -d =
/home/branden/share/doc/groff-1.25.0/examples/chem/cstr-122;
for i in ./contrib/chem/examples/cstr-122/*; do \
  n=3D`echo $i | sed 's|./contrib/chem/examples/cstr-122/||g'`; \
  /home/branden/bin/install -c -m 644 $i /home/branden/share/doc/groff-1.25=
=2E0/examples/chem/cstr-122/$n; \
done
test -d /home/branden/share/groff/1.25.0/tmac || /bin/bash /tmp/rando/groff=
-1.25.0.rc2/build-aux/install-sh -d /home/branden/share/groff/1.25.0/tmac
test -d /home/branden/share/groff/1.25.0/tmac/mm || /bin/bash /tmp/rando/gr=
off-1.25.0.rc2/build-aux/install-sh -d /home/branden/share/groff/1.25.0/tma=
c/mm
rm -f /home/branden/share/groff/1.25.0/tmac/tmac.`if test no =3D yes; then =
for i in  ""; do case "$i" in m) echo g;; esac; done; fi`m
rm -f /home/branden/share/groff/1.25.0/tmac/`if test no =3D yes; then for i=
 in  ""; do case "$i" in m) echo g;; esac; done; fi`m.tmac
/home/branden/bin/install -c -m 644 ./contrib/mm/m.tmac \
  /home/branden/share/groff/1.25.0/tmac/`if test no =3D yes; then for i in =
 ""; do case "$i" in m) echo g;; esac; done; fi`m.tmac
LANG=3DC LC_ALL=3DC sed -e "s;^.mso m.tmac;.mso `if test no =3D yes; then f=
or i in  ""; do case "$i" in m) echo g;; esac; done; fi`m.tmac;g" \
  ./contrib/mm/mse.tmac > /home/branden/share/groff/1.25.0/tmac/`if test no=
 =3D yes; then for i in  ""; do case "$i" in m) echo g;; esac; done; fi`mse=
=2Etmac
test -d /home/branden/share/doc/groff-1.25.0 \
  || /bin/bash /tmp/rando/groff-1.25.0.rc2/build-aux/install-sh -d /home/br=
anden/share/doc/groff-1.25.0
for d in doc /tmp/rando/groff-1.25.0.rc2/doc; do \
  if [ -f "$d"/groff.txt ]; then \
    cp "$d"/groff.txt /home/branden/share/doc/groff-1.25.0; \
    break; \
  fi; \
done
test -d /home/branden/share/info \
  || /bin/bash /tmp/rando/groff-1.25.0.rc2/build-aux/install-sh -d /home/br=
anden/share/info
rm -f /home/branden/share/info/groff.info*
for d in doc /tmp/rando/groff-1.25.0.rc2/doc; do \
  if [ -f "$d"/groff.info ]; then \
    cp "$d"/groff.info* /home/branden/share/info; \
    install-info --info-file=3D"$d"/groff.info \
      --info-dir=3D/home/branden/share/info; \
    break; \
  fi; \
done
/home/branden/bin/mkdir -p /home/branden/share/groff/1.25.0/font
/home/branden/bin/install -c -m 644 ./src/devices/xditview/FontMap-X11 \
  /home/branden/share/groff/1.25.0/font/FontMap-X11
test -d /home/branden/lib/X11/app-defaults \
  || /bin/bash /tmp/rando/groff-1.25.0.rc2/build-aux/install-sh -d /home/br=
anden/lib/X11/app-defaults
/home/branden/bin/install -c -m 644 ./src/devices/xditview/GXditview.ad \
  /home/branden/lib/X11/app-defaults/GXditview
/home/branden/bin/install -c -m 644 ./src/devices/xditview/GXditview-color.=
ad \
  /home/branden/lib/X11/app-defaults/GXditview-color
test -d /home/branden/share \
  || /bin/bash /tmp/rando/groff-1.25.0.rc2/build-aux/install-sh -d /home/br=
anden/share
test -d /home/branden/share/groff \
  || /bin/bash /tmp/rando/groff-1.25.0.rc2/build-aux/install-sh -d /home/br=
anden/share/groff
test -d /home/branden/share/groff/1.25.0 \
  || /bin/bash /tmp/rando/groff-1.25.0.rc2/build-aux/install-sh -d /home/br=
anden/share/groff/1.25.0
if test -f /usr/lib/eign; then \
  rm -f /home/branden/share/groff/1.25.0/eign; \
  ln -s /usr/lib/eign /home/branden/share/groff/1.25.0/eign 2>/dev/null \
    || ln /usr/lib/eign /home/branden/share/groff/1.25.0/eign 2>/dev/null \
    || cp /usr/lib/eign /home/branden/share/groff/1.25.0/eign; \
else \
  rm -f /home/branden/share/groff/1.25.0/eign; \
  /home/branden/bin/install -c -m 644 ./src/utils/indxbib/eign /home/brande=
n/share/groff/1.25.0/eign; \
fi
/home/branden/bin/mkdir -p /home/branden/lib/groff/site-tmac;
if test "no" !=3D "no"; then \
  if test -n ""; then \
    for m in ""; do \
      /home/branden/bin/install -c -m 644 tmac/$m-wrap \
        /home/branden/lib/groff/site-tmac/$m`if test no =3D manual; then ec=
ho "-os"; fi`.tmac; \
    done; \
  fi; \
fi
 /home/branden/bin/mkdir -p '/home/branden/share/groff/1.25.0/font/devX100-=
12'
 /home/branden/bin/install -c -m 644 font/devX100-12/DESC font/devX100-12/T=
R font/devX100-12/TI font/devX100-12/TB font/devX100-12/TBI font/devX100-12=
/CR font/devX100-12/CI font/devX100-12/CB font/devX100-12/CBI font/devX100-=
12/HR font/devX100-12/HI font/devX100-12/HB font/devX100-12/HBI font/devX10=
0-12/NR font/devX100-12/NI font/devX100-12/NB font/devX100-12/NBI font/devX=
100-12/S '/home/branden/share/groff/1.25.0/font/devX100-12'
 /home/branden/bin/mkdir -p '/home/branden/share/groff/1.25.0/font/devX100'
 /home/branden/bin/install -c -m 644 font/devX100/DESC font/devX100/TR font=
/devX100/TI font/devX100/TB font/devX100/TBI font/devX100/CR font/devX100/C=
I font/devX100/CB font/devX100/CBI font/devX100/HR font/devX100/HI font/dev=
X100/HB font/devX100/HBI font/devX100/NR font/devX100/NI font/devX100/NB fo=
nt/devX100/NBI font/devX100/S '/home/branden/share/groff/1.25.0/font/devX10=
0'
 /home/branden/bin/mkdir -p '/home/branden/share/groff/1.25.0/font/devX75-1=
2'
 /home/branden/bin/install -c -m 644 font/devX75-12/DESC font/devX75-12/TR =
font/devX75-12/TI font/devX75-12/TB font/devX75-12/TBI font/devX75-12/CR fo=
nt/devX75-12/CI font/devX75-12/CB font/devX75-12/CBI font/devX75-12/HR font=
/devX75-12/HI font/devX75-12/HB font/devX75-12/HBI font/devX75-12/NR font/d=
evX75-12/NI font/devX75-12/NB font/devX75-12/NBI font/devX75-12/S '/home/br=
anden/share/groff/1.25.0/font/devX75-12'
 /home/branden/bin/mkdir -p '/home/branden/share/groff/1.25.0/font/devX75'
 /home/branden/bin/install -c -m 644 font/devX75/DESC font/devX75/TR font/d=
evX75/TI font/devX75/TB font/devX75/TBI font/devX75/CR font/devX75/CI font/=
devX75/CB font/devX75/CBI font/devX75/HR font/devX75/HI font/devX75/HB font=
/devX75/HBI font/devX75/NR font/devX75/NI font/devX75/NB font/devX75/NBI fo=
nt/devX75/S '/home/branden/share/groff/1.25.0/font/devX75'
 /home/branden/bin/mkdir -p '/home/branden/share/groff/1.25.0/font/devascii'
 /home/branden/bin/install -c -m 644 font/devascii/R font/devascii/I font/d=
evascii/B font/devascii/BI font/devascii/DESC '/home/branden/share/groff/1.=
25.0/font/devascii'
 /home/branden/bin/mkdir -p '/home/branden/share/groff/1.25.0/font/devdvi'
 /home/branden/bin/install -c -m 644 font/devdvi/TR font/devdvi/TI font/dev=
dvi/TB font/devdvi/TBI font/devdvi/CW font/devdvi/CWI font/devdvi/HR font/d=
evdvi/HI font/devdvi/HB font/devdvi/HBI font/devdvi/TREC font/devdvi/TIEC f=
ont/devdvi/TBEC font/devdvi/TBIEC font/devdvi/CWEC font/devdvi/CWIEC font/d=
evdvi/HREC font/devdvi/HIEC font/devdvi/HBEC font/devdvi/HBIEC font/devdvi/=
TRTC font/devdvi/TITC font/devdvi/TBTC font/devdvi/TBITC font/devdvi/CWTC f=
ont/devdvi/CWITC font/devdvi/HRTC font/devdvi/HITC font/devdvi/HBTC font/de=
vdvi/HBITC font/devdvi/MI font/devdvi/S font/devdvi/EX font/devdvi/SA font/=
devdvi/SB font/devdvi/SC font/devdvi/CSH font/devdvi/CSS font/devdvi/CTH fo=
nt/devdvi/CTS '/home/branden/share/groff/1.25.0/font/devdvi'
 /home/branden/bin/install -c -m 644 font/devdvi/JPG font/devdvi/JPM font/d=
evdvi/KOG font/devdvi/KOM font/devdvi/DESC '/home/branden/share/groff/1.25.=
0/font/devdvi'
 /home/branden/bin/mkdir -p '/home/branden/share/groff/1.25.0/font/devdvi/g=
enerate'
 /home/branden/bin/install -c -m 644 font/devdvi/generate/Makefile font/dev=
dvi/generate/msam.map font/devdvi/generate/msbm.map font/devdvi/generate/te=
xb.map font/devdvi/generate/texex.map font/devdvi/generate/texi.map font/de=
vdvi/generate/texmi.map font/devdvi/generate/texr.map font/devdvi/generate/=
texsy.map font/devdvi/generate/textt.map font/devdvi/generate/textex.map fo=
nt/devdvi/generate/ec.map font/devdvi/generate/tc.map font/devdvi/generate/=
CompileFonts '/home/branden/share/groff/1.25.0/font/devdvi/generate'
 /home/branden/bin/mkdir -p '/home/branden/share/groff/1.25.0/font/devhtml'
 /home/branden/bin/install -c -m 644 font/devhtml/R font/devhtml/I font/dev=
html/B font/devhtml/BI font/devhtml/CR font/devhtml/CI font/devhtml/CB font=
/devhtml/CBI font/devhtml/S font/devhtml/CSH font/devhtml/CSS font/devhtml/=
CTH font/devhtml/CTS font/devhtml/JPG font/devhtml/JPM font/devhtml/KOG fon=
t/devhtml/KOM font/devhtml/DESC '/home/branden/share/groff/1.25.0/font/devh=
tml'
 /home/branden/bin/mkdir -p '/home/branden/share/groff/1.25.0/font/devlatin=
1'
 /home/branden/bin/install -c -m 644 font/devlatin1/R font/devlatin1/I font=
/devlatin1/B font/devlatin1/BI font/devlatin1/DESC '/home/branden/share/gro=
ff/1.25.0/font/devlatin1'
 /home/branden/bin/mkdir -p '/home/branden/share/groff/1.25.0/font/devlbp'
 /home/branden/bin/install -c -m 644 font/devlbp/HB font/devlbp/HBI font/de=
vlbp/HI font/devlbp/HR font/devlbp/HNB font/devlbp/HNBI font/devlbp/HNI fon=
t/devlbp/HNR font/devlbp/TB font/devlbp/TBI font/devlbp/TI font/devlbp/TR f=
ont/devlbp/CR font/devlbp/CB font/devlbp/CI font/devlbp/ER font/devlbp/EB f=
ont/devlbp/EI font/devlbp/DESC '/home/branden/share/groff/1.25.0/font/devlb=
p'
 /home/branden/bin/mkdir -p '/home/branden/share/groff/1.25.0/font/devpdf'
 /home/branden/bin/install -c -m 644 font/devpdf/S font/devpdf/ZD font/devp=
df/CB font/devpdf/CBI font/devpdf/CI font/devpdf/CR font/devpdf/HB font/dev=
pdf/HBI font/devpdf/HI font/devpdf/HR font/devpdf/TB font/devpdf/TBI font/d=
evpdf/TI font/devpdf/TR font/devpdf/EURO font/devpdf/AB font/devpdf/ABI fon=
t/devpdf/AI font/devpdf/AR font/devpdf/BMB font/devpdf/BMBI font/devpdf/BMI=
 font/devpdf/BMR font/devpdf/HNB font/devpdf/HNBI font/devpdf/HNI font/devp=
df/HNR font/devpdf/NB font/devpdf/NBI font/devpdf/NI font/devpdf/NR font/de=
vpdf/PB font/devpdf/PBI font/devpdf/PI font/devpdf/PR font/devpdf/ZCMI font=
/devpdf/U-S font/devpdf/U-ZD font/devpdf/U-ZCMI font/devpdf/U-AB '/home/bra=
nden/share/groff/1.25.0/font/devpdf'
 /home/branden/bin/install -c -m 644 font/devpdf/U-ABI font/devpdf/U-AI fon=
t/devpdf/U-AR font/devpdf/U-BMB font/devpdf/U-BMBI font/devpdf/U-BMI font/d=
evpdf/U-BMR font/devpdf/U-CB font/devpdf/U-CBI font/devpdf/U-CI font/devpdf=
/U-CR font/devpdf/U-HB font/devpdf/U-HBI font/devpdf/U-HI font/devpdf/U-HR =
font/devpdf/U-HNB font/devpdf/U-HNBI font/devpdf/U-HNI font/devpdf/U-HNR fo=
nt/devpdf/U-NB font/devpdf/U-NBI font/devpdf/U-NI font/devpdf/U-NR font/dev=
pdf/U-PB font/devpdf/U-PBI font/devpdf/U-PI font/devpdf/U-PR font/devpdf/U-=
TB font/devpdf/U-TBI font/devpdf/U-TI font/devpdf/U-TR font/devpdf/DESC fon=
t/devpdf/SS font/devpdf/symbolsl.afm font/devpdf/symbolsl.pfb font/devpdf/d=
ownload font/devpdf/Foundry '/home/branden/share/groff/1.25.0/font/devpdf'
 /home/branden/bin/mkdir -p '/home/branden/share/groff/1.25.0/font/devpdf/e=
nc'
 /home/branden/bin/install -c -m 644 font/devpdf/enc/text.enc '/home/brande=
n/share/groff/1.25.0/font/devpdf/enc'
 /home/branden/bin/mkdir -p '/home/branden/share/groff/1.25.0/font/devpdf/m=
ap'
 /home/branden/bin/install -c -m 644 font/devpdf/map/dingbats.map font/devp=
df/map/symbol.map font/devpdf/map/text.map '/home/branden/share/groff/1.25.=
0/font/devpdf/map'
 /home/branden/bin/mkdir -p '/home/branden/share/groff/1.25.0/font/devutf8'
 /home/branden/bin/install -c -m 644 font/devutf8/R font/devutf8/I font/dev=
utf8/B font/devutf8/BI font/devutf8/CSH font/devutf8/CSS font/devutf8/CTH f=
ont/devutf8/CTS font/devutf8/JPG font/devutf8/JPM font/devutf8/KOG font/dev=
utf8/KOM font/devutf8/DESC '/home/branden/share/groff/1.25.0/font/devutf8'
 /home/branden/bin/mkdir -p '/home/branden/share/doc/groff-1.25.0/examples/=
chem'
 /home/branden/bin/install -c -m 644 contrib/chem/examples/README contrib/c=
hem/examples/atp.chem contrib/chem/examples/cholesterol.chem contrib/chem/e=
xamples/ethamivan.chem contrib/chem/examples/lsd.chem contrib/chem/examples=
/mepacrine.chem contrib/chem/examples/morphine.chem contrib/chem/examples/p=
enicillin.chem contrib/chem/examples/reserpine.chem '/home/branden/share/do=
c/groff-1.25.0/examples/chem'
 /home/branden/bin/mkdir -p '/home/branden/share/groff/1.25.0/tmac'
 /home/branden/bin/install -c -m 644 ./contrib/chem/chem.pic '/home/branden=
/share/groff/1.25.0/tmac'
 /home/branden/bin/mkdir -p '/home/branden/share/groff/1.25.0/font/devlj4'
 /home/branden/bin/install -c -m 644 font/devlj4/AB font/devlj4/ABI font/de=
vlj4/AI font/devlj4/AR font/devlj4/ALBB font/devlj4/ALBR font/devlj4/AOB fo=
nt/devlj4/AOI font/devlj4/AOR font/devlj4/CB font/devlj4/CBI font/devlj4/CI=
 font/devlj4/CR font/devlj4/GB font/devlj4/GBI font/devlj4/GI font/devlj4/G=
R font/devlj4/LGB font/devlj4/LGI font/devlj4/LGR font/devlj4/OB font/devlj=
4/OBI font/devlj4/OI font/devlj4/OR font/devlj4/TB font/devlj4/TBI font/dev=
lj4/TI font/devlj4/TR font/devlj4/TNRB font/devlj4/TNRBI font/devlj4/TNRI f=
ont/devlj4/TNRR font/devlj4/UB font/devlj4/UBI font/devlj4/UI font/devlj4/U=
R font/devlj4/UCB font/devlj4/UCBI font/devlj4/UCI font/devlj4/UCR '/home/b=
randen/share/groff/1.25.0/font/devlj4'
 /home/branden/bin/install -c -m 644 font/devlj4/CLARENDON font/devlj4/CORO=
NET font/devlj4/MARIGOLD font/devlj4/S font/devlj4/SYMBOL font/devlj4/WINGD=
INGS '/home/branden/share/groff/1.25.0/font/devlj4'
 /home/branden/bin/mkdir -p '/home/branden/share/groff/1.25.0/font/devlj4/g=
enerate'
 /home/branden/bin/install -c -m 644 font/devlj4/generate/Makefile font/dev=
lj4/generate/special.map font/devlj4/generate/symbol.map font/devlj4/genera=
te/text.map font/devlj4/generate/wingdings.map font/devlj4/generate/special=
=2Eawk '/home/branden/share/groff/1.25.0/font/devlj4/generate'
 /home/branden/bin/mkdir -p '/home/branden/share/groff/1.25.0/font/devps'
 /home/branden/bin/install -c -m 644 font/devps/S font/devps/SS font/devps/=
ZD font/devps/ZDR font/devps/ZCMI font/devps/AB font/devps/ABI font/devps/A=
I font/devps/AR font/devps/BMB font/devps/BMBI font/devps/BMI font/devps/BM=
R font/devps/CB font/devps/CBI font/devps/CI font/devps/CR font/devps/HB fo=
nt/devps/HBI font/devps/HI font/devps/HR font/devps/HNB font/devps/HNBI fon=
t/devps/HNI font/devps/HNR font/devps/NB font/devps/NBI font/devps/NI font/=
devps/NR font/devps/PB font/devps/PBI font/devps/PI font/devps/PR font/devp=
s/TB font/devps/TBI font/devps/TI font/devps/TR font/devps/EURO font/devps/=
CSH font/devps/CSS '/home/branden/share/groff/1.25.0/font/devps'
 /home/branden/bin/install -c -m 644 font/devps/CTH font/devps/CTS font/dev=
ps/JPG font/devps/JPM font/devps/KOG font/devps/KOM font/devps/freeeuro.afm=
 font/devps/symbolsl.afm font/devps/text.enc font/devps/zapfdr.afm font/dev=
ps/download '/home/branden/share/groff/1.25.0/font/devps'
 /home/branden/bin/mkdir -p '/home/branden/share/groff/1.25.0/font/devps/ge=
nerate'
 /home/branden/bin/install -c -m 644 font/devps/generate/Makefile font/devp=
s/generate/dingbats.map font/devps/generate/dingbats-reversed.map font/devp=
s/generate/slanted-symbol.map font/devps/generate/symbol.map font/devps/gen=
erate/symbolsl.awk font/devps/generate/text.map font/devps/generate/afmname=
 font/devps/generate/symbol.sed '/home/branden/share/groff/1.25.0/font/devp=
s/generate'
 /home/branden/bin/mkdir -p '/home/branden/share/doc/groff-1.25.0/examples'
 /home/branden/bin/install -c -m 644 doc/webpage.ms doc/groff.css doc/grnex=
mpl.g doc/grnexmpl.me '/home/branden/share/doc/groff-1.25.0/examples'
 /home/branden/bin/mkdir -p '/home/branden/share/groff/1.25.0/tmac'
 /home/branden/bin/install -c -m 644 tmac/eqnrc '/home/branden/share/groff/=
1.25.0/tmac'
 /home/branden/bin/mkdir -p '/home/branden/share/groff/1.25.0/tmac'
 /home/branden/bin/install -c -m 644 tmac/dvi.tmac '/home/branden/share/gro=
ff/1.25.0/tmac'
 /home/branden/bin/mkdir -p '/home/branden/share/groff/1.25.0/tmac'
 /home/branden/bin/install -c -m 644 tmac/lbp.tmac '/home/branden/share/gro=
ff/1.25.0/tmac'
 /home/branden/bin/mkdir -p '/home/branden/share/groff/1.25.0/tmac'
 /home/branden/bin/install -c -m 644 tmac/lj4.tmac '/home/branden/share/gro=
ff/1.25.0/tmac'
 /home/branden/bin/mkdir -p '/home/branden/share/groff/1.25.0/tmac'
 /home/branden/bin/install -c -m 644 tmac/pdf.tmac tmac/pdfpic.tmac '/home/=
branden/share/groff/1.25.0/tmac'
 /home/branden/bin/mkdir -p '/home/branden/share/groff/1.25.0/tmac'
 /home/branden/bin/install -c -m 644 tmac/europs.tmac tmac/ps.tmac tmac/psa=
tk.tmac tmac/psfig.tmac tmac/psold.tmac tmac/pspic.tmac '/home/branden/shar=
e/groff/1.25.0/tmac'
 /home/branden/bin/mkdir -p '/home/branden/share/groff/1.25.0/tmac'
 /home/branden/bin/install -c -m 644 tmac/tty.tmac tmac/tty-char.tmac '/hom=
e/branden/share/groff/1.25.0/tmac'
 /home/branden/bin/mkdir -p '/home/branden/share/doc/groff-1.25.0/examples/=
hdtbl'
 /home/branden/bin/install -c -m 644 contrib/hdtbl/examples/common.roff con=
trib/hdtbl/examples/chess_board.roff contrib/hdtbl/examples/color_boxes.rof=
f contrib/hdtbl/examples/color_nested_tables.roff contrib/hdtbl/examples/co=
lor_table_cells.roff contrib/hdtbl/examples/color_transitions.roff contrib/=
hdtbl/examples/col_rowspan_colors.roff contrib/hdtbl/examples/mixed_pickles=
=2Eroff contrib/hdtbl/examples/rainbow.roff contrib/hdtbl/examples/short_re=
ference.roff '/home/branden/share/doc/groff-1.25.0/examples/hdtbl'
 /home/branden/bin/mkdir -p '/home/branden/share/groff/1.25.0/tmac'
 /home/branden/bin/install -c -m 644 contrib/hdtbl/hdtbl.tmac contrib/hdtbl=
/hdmisc.tmac '/home/branden/share/groff/1.25.0/tmac'
 /home/branden/bin/mkdir -p '/home/branden/share/doc/groff-1.25.0/examples'
 /home/branden/bin/install -c -m 644 contrib/install-font/install-font.bash=
 '/home/branden/share/doc/groff-1.25.0/examples'
 /home/branden/bin/mkdir -p '/home/branden/share/groff/site-tmac'
 /home/branden/bin/install -c -m 644 tmac/man.local tmac/mdoc.local '/home/=
branden/share/groff/site-tmac'
 /home/branden/bin/mkdir -p '/home/branden/share/groff/1.25.0/tmac/mdoc'
 /home/branden/bin/install -c -m 644 tmac/mdoc/doc-common tmac/mdoc/doc-dit=
roff tmac/mdoc/doc-nroff tmac/mdoc/doc-syms '/home/branden/share/groff/1.25=
=2E0/tmac/mdoc'
 /home/branden/bin/mkdir -p '/home/branden/share/groff/1.25.0/tmac/mm'
 /home/branden/bin/install -c -m 644 contrib/mm/mm/0.MT contrib/mm/mm/5.MT =
contrib/mm/mm/4.MT contrib/mm/mm/ms.cov contrib/mm/mm/se_ms.cov '/home/bran=
den/share/groff/1.25.0/tmac/mm'
 /home/branden/bin/mkdir -p '/home/branden/share/doc/groff-1.25.0/examples/=
mm'
 /home/branden/bin/install -c -m 644 contrib/mm/examples/letter.mm contrib/=
mm/examples/memorandum.mm contrib/mm/examples/story.mm '/home/branden/share=
/doc/groff-1.25.0/examples/mm'
 /home/branden/bin/mkdir -p '/home/branden/share/doc/groff-1.25.0/examples/=
mom'
 /home/branden/bin/install -c -m 644 contrib/mom/examples/letter.mom contri=
b/mom/examples/mom-pdf.mom contrib/mom/examples/mon_premier_doc.mom contrib=
/mom/examples/sample_docs.mom contrib/mom/examples/typesetting.mom contrib/=
mom/examples/README.txt contrib/mom/examples/README-fr.txt contrib/mom/exam=
ples/elvis_syntax contrib/mom/examples/elvis_syntax.new contrib/mom/example=
s/penguin.ps contrib/mom/examples/penguin.pdf contrib/mom/examples/mom.vim =
contrib/mom/examples/slide-demo.mom contrib/mom/examples/copyright-default.=
mom contrib/mom/examples/copyright-chapter.mom '/home/branden/share/doc/gro=
ff-1.25.0/examples/mom'
 /home/branden/bin/mkdir -p '/home/branden/share/groff/1.25.0/tmac'
 /home/branden/bin/install -c -m 644 contrib/mom/mom.tmac contrib/mom/om.tm=
ac '/home/branden/share/groff/1.25.0/tmac'
 /home/branden/bin/mkdir -p '/home/branden/share/groff/1.25.0/oldfont/devps'
 /home/branden/bin/install -c -m 644 font/devps/old/S font/devps/old/SS fon=
t/devps/old/CB font/devps/old/CBI font/devps/old/CI font/devps/old/CR font/=
devps/old/HB font/devps/old/HBI font/devps/old/HI font/devps/old/HR font/de=
vps/old/HNB font/devps/old/HNBI font/devps/old/HNI font/devps/old/HNR font/=
devps/old/NB font/devps/old/NBI font/devps/old/NI font/devps/old/NR font/de=
vps/old/PB font/devps/old/PBI font/devps/old/PI font/devps/old/PR font/devp=
s/old/TB font/devps/old/TBI font/devps/old/TI font/devps/old/TR font/devps/=
old/symbol.afm font/devps/old/symbolsl.afm font/devps/old/zapfdr.afm font/d=
evps/old/zapfdr.ps '/home/branden/share/groff/1.25.0/oldfont/devps'
 /home/branden/bin/mkdir -p '/home/branden/share/doc/groff-1.25.0'
 /home/branden/bin/install -c -m 644 doc/me-revisions doc/pic.ms doc/groff-=
pdf-features.ms '/home/branden/share/doc/groff-1.25.0'
 /home/branden/bin/mkdir -p '/home/branden/share/groff/1.25.0/tmac'
 /home/branden/bin/install -c -m 644 tmac/pic.tmac '/home/branden/share/gro=
ff/1.25.0/tmac'
 /home/branden/bin/mkdir -p '/home/branden/share/groff/1.25.0/tmac'
 /home/branden/bin/install -c -m 644 tmac/html.tmac tmac/html-end.tmac '/ho=
me/branden/share/groff/1.25.0/tmac'
 /home/branden/bin/mkdir -p '/home/branden/share/groff/1.25.0/tmac'
 /home/branden/bin/install -c -m 644 tmac/refer.tmac '/home/branden/share/g=
roff/1.25.0/tmac'
 /home/branden/bin/mkdir -p '/home/branden/share/groff/1.25.0/tmac'
 /home/branden/bin/install -c -m 644 contrib/rfc1345/rfc1345.tmac '/home/br=
anden/share/groff/1.25.0/tmac'
 /home/branden/bin/mkdir -p '/home/branden/share/groff/1.25.0/tmac'
 /home/branden/bin/install -c -m 644 contrib/sboxes/sboxes.tmac '/home/bran=
den/share/groff/1.25.0/tmac'
 /home/branden/bin/mkdir -p '/home/branden/share/groff/1.25.0/tmac'
 /home/branden/bin/install -c -m 644 tmac/man.tmac tmac/mandoc.tmac tmac/an=
doc.tmac tmac/an-ext.tmac tmac/ms.tmac tmac/e.tmac tmac/me.tmac tmac/doc-ol=
d.tmac tmac/doc.tmac tmac/mdoc.tmac tmac/papersize.tmac tmac/62bit.tmac tma=
c/ec.tmac tmac/trace.tmac tmac/ptx.tmac tmac/latin1.tmac tmac/latin2.tmac t=
mac/latin5.tmac tmac/latin9.tmac tmac/koi8-r.tmac tmac/X.tmac tmac/Xps.tmac=
 tmac/devtag.tmac tmac/composite.tmac tmac/fallbacks.tmac tmac/refer-me.tma=
c tmac/refer-ms.tmac tmac/troffrc tmac/troffrc-end tmac/trans.tmac tmac/en.=
tmac tmac/hyphen.en tmac/hyphenex.en tmac/es.tmac tmac/hyphen.es tmac/fr.tm=
ac tmac/hyphen.fr tmac/it.tmac tmac/hyphen.it tmac/pl.tmac '/home/branden/s=
hare/groff/1.25.0/tmac'
 /home/branden/bin/install -c -m 644 tmac/hyphen.pl tmac/ru.tmac tmac/hyphe=
n.ru tmac/sv.tmac tmac/hyphen.sv tmac/de.tmac tmac/den.tmac tmac/hyphen.det=
 tmac/hyphen.den tmac/cs.tmac tmac/hyphen.cs tmac/hyphenex.cs tmac/ja.tmac =
tmac/zh.tmac tmac/an.tmac tmac/s.tmac '/home/branden/share/groff/1.25.0/tma=
c'
 /home/branden/bin/mkdir -p '/home/branden/share/groff/1.25.0/tmac'
 /home/branden/bin/install -c -m 644 contrib/mm/refer-mm.tmac '/home/brande=
n/share/groff/1.25.0/tmac'
 /home/branden/bin/mkdir -p '/home/branden/share/doc/groff-1.25.0/html'
 /home/branden/bin/install -c -m 644 doc/pic.html '/home/branden/share/doc/=
groff-1.25.0/html'
 /home/branden/bin/mkdir -p '/home/branden/share/man/man1'
 /home/branden/bin/install -c -m 644 contrib/chem/chem.1 contrib/eqn2graph/=
eqn2graph.1 contrib/gdiffmk/gdiffmk.1 contrib/glilypond/glilypond.1 contrib=
/gperl/gperl.1 contrib/gpinyin/gpinyin.1 contrib/grap2graph/grap2graph.1 co=
ntrib/mm/mmroff.1 contrib/pic2graph/pic2graph.1 src/devices/grodvi/grodvi.1=
 src/devices/grohtml/grohtml.1 src/devices/grolbp/grolbp.1 src/devices/grol=
j4/grolj4.1 src/devices/gropdf/gropdf.1 src/devices/grops/grops.1 src/devic=
es/grotty/grotty.1 src/devices/xditview/gxditview.1 src/preproc/preconv/pre=
conv.1 src/roff/groff/groff.1 src/utils/addftinfo/addftinfo.1 src/utils/afm=
todit/afmtodit.1 src/utils/grog/grog.1 src/utils/hpftodit/hpftodit.1 src/ut=
ils/lkbib/lkbib.1 src/utils/pdfmom/pdfmom.1 src/utils/pfbtops/pfbtops.1 src=
/utils/tfmtodit/tfmtodit.1 src/utils/xtotroff/xtotroff.1 src/preproc/eqn/eq=
n.1 src/preproc/eqn/neqn.1 src/preproc/grn/grn.1 src/preproc/pic/pic.1 src/=
preproc/refer/refer.1 src/preproc/soelim/soelim.1 src/preproc/tbl/tbl.1 src=
/roff/nroff/nroff.1 src/roff/troff/troff.1 src/utils/indxbib/indxbib.1 src/=
utils/lookbib/lookbib.1 '/home/branden/share/man/man1'
 /home/branden/bin/mkdir -p '/home/branden/share/man/man5'
 /home/branden/bin/install -c -m 644 man/groff_font.5 man/groff_out.5 man/g=
roff_tmac.5 '/home/branden/share/man/man5'
 /home/branden/bin/mkdir -p '/home/branden/share/man/man7'
 /home/branden/bin/install -c -m 644 contrib/hdtbl/groff_hdtbl.7 contrib/mm=
/groff_mm.7 contrib/mm/groff_mmse.7 contrib/mom/groff_mom.7 contrib/rfc1345=
/groff_rfc1345.7 man/groff_char.7 man/groff_diff.7 man/groff.7 man/roff.7 t=
mac/groff_ms.7 tmac/groff_man.7 tmac/groff_man_style.7 tmac/groff_me.7 tmac=
/groff_mdoc.7 tmac/groff_trace.7 tmac/groff_www.7 '/home/branden/share/man/=
man7'
 /home/branden/bin/mkdir -p '/home/branden/share/doc/groff-1.25.0/html/mom'
 /home/branden/bin/install -c -m 644 contrib/mom/momdoc/stylesheet.css cont=
rib/mom/momdoc/appendices.html contrib/mom/momdoc/color.html contrib/mom/mo=
mdoc/cover.html contrib/mom/momdoc/definitions.html contrib/mom/momdoc/doce=
lement.html contrib/mom/momdoc/docprocessing.html contrib/mom/momdoc/goodie=
s.html contrib/mom/momdoc/graphical.html contrib/mom/momdoc/headfootpage.ht=
ml contrib/mom/momdoc/images.html contrib/mom/momdoc/inlines.html contrib/m=
om/momdoc/intro.html contrib/mom/momdoc/letters.html contrib/mom/momdoc/mac=
rolist.html contrib/mom/momdoc/rectoverso.html contrib/mom/momdoc/refer.htm=
l contrib/mom/momdoc/reserved.html contrib/mom/momdoc/tables-of-contents.ht=
ml contrib/mom/momdoc/toc.html contrib/mom/momdoc/typesetting.html contrib/=
mom/momdoc/using.html contrib/mom/momdoc/version-2.html '/home/branden/shar=
e/doc/groff-1.25.0/html/mom'
 /home/branden/bin/mkdir -p '/home/branden/share/groff/1.25.0/font/devlj4'
 /home/branden/bin/install -c -m 644 font/devlj4/DESC '/home/branden/share/=
groff/1.25.0/font/devlj4'
 /home/branden/bin/mkdir -p '/home/branden/share/groff/1.25.0/font/devps'
 /home/branden/bin/install -c -m 644 font/devps/DESC font/devps/prologue fo=
nt/devps/freeeuro.pfa font/devps/zapfdr.pfa font/devps/symbolsl.pfa '/home/=
branden/share/groff/1.25.0/font/devps'
 /home/branden/bin/mkdir -p '/home/branden/share/doc/groff-1.25.0/examples'
 /home/branden/bin/install -c -m 644 doc/webpage.html doc/webpage.ps doc/gr=
nexmpl.ps '/home/branden/share/doc/groff-1.25.0/examples'
 /home/branden/bin/mkdir -p '/home/branden/share/doc/groff-1.25.0/pdf'
 /home/branden/bin/install -c -m 644 doc/automake.pdf doc/groff-man-pages.p=
df doc/ms.pdf doc/pic.pdf doc/groff-pdf-features.pdf '/home/branden/share/d=
oc/groff-1.25.0/pdf'
 /home/branden/bin/mkdir -p '/home/branden/share/doc/groff-1.25.0/examples/=
hdtbl'
 /home/branden/bin/install -c -m 644 contrib/hdtbl/examples/fonts_n.roff co=
ntrib/hdtbl/examples/fonts_x.roff contrib/hdtbl/examples/chess_board.ps con=
trib/hdtbl/examples/color_boxes.ps contrib/hdtbl/examples/color_nested_tabl=
es.ps contrib/hdtbl/examples/color_table_cells.ps contrib/hdtbl/examples/co=
lor_transitions.ps contrib/hdtbl/examples/col_rowspan_colors.ps contrib/hdt=
bl/examples/fonts_n.ps contrib/hdtbl/examples/fonts_x.ps contrib/hdtbl/exam=
ples/mixed_pickles.ps contrib/hdtbl/examples/rainbow.ps contrib/hdtbl/examp=
les/short_reference.ps doc/gnu.eps '/home/branden/share/doc/groff-1.25.0/ex=
amples/hdtbl'
 /home/branden/bin/mkdir -p '/home/branden/share/doc/groff-1.25.0/examples/=
mom'
 /home/branden/bin/install -c -m 644 contrib/mom/examples/letter.pdf contri=
b/mom/examples/mom-pdf.pdf contrib/mom/examples/mon_premier_doc.pdf contrib=
/mom/examples/sample_docs.pdf contrib/mom/examples/slide-demo.pdf contrib/m=
om/examples/copyright-default.pdf contrib/mom/examples/copyright-chapter.pd=
f contrib/mom/examples/typesetting.pdf '/home/branden/share/doc/groff-1.25.=
0/examples/mom'
 /home/branden/bin/mkdir -p '/home/branden/share/doc/groff-1.25.0'
 /home/branden/bin/install -c -m 644 doc/meref.ps doc/meintro.ps doc/meintr=
o_fr.ps doc/groff-man-pages.utf8.txt doc/meintro.me doc/meintro_fr.me doc/m=
eref.me doc/ms.ms '/home/branden/share/doc/groff-1.25.0'
 /home/branden/bin/mkdir -p '/home/branden/share/doc/groff-1.25.0'
 /home/branden/bin/install -c -m 644 contrib/sboxes/msboxes.ms '/home/brand=
en/share/doc/groff-1.25.0'
 /home/branden/bin/mkdir -p '/home/branden/share/doc/groff-1.25.0/pdf'
 /home/branden/bin/install -c -m 644 contrib/sboxes/msboxes.pdf '/home/bran=
den/share/doc/groff-1.25.0/pdf'
 /home/branden/bin/mkdir -p '/home/branden/share/groff/1.25.0/tmac'
 /home/branden/bin/install -c -m 644 tmac/www.tmac '/home/branden/share/gro=
ff/1.25.0/tmac'
make  install-data-hook
make[4]: Entering directory '/tmp/rando/groff-1.25.0.rc2'
for f in mom-pdf.pdf; do \
  rm -f /home/branden/share/doc/groff-1.25.0/pdf/$f; \
  ln -s /home/branden/share/doc/groff-1.25.0/examples/mom/$f /home/branden/=
share/doc/groff-1.25.0/pdf/$f; \
done
cd doc \
&& for f in `ls pic*.html`; do \
  rm -f /home/branden/share/doc/groff-1.25.0/html/$f; \
  /home/branden/bin/install -c -m 644 $f /home/branden/share/doc/groff-1.25=
=2E0/html/$f; \
done
test -d /home/branden/share/doc/groff-1.25.0/html/img \
  || /bin/bash /tmp/rando/groff-1.25.0.rc2/build-aux/install-sh -d /home/br=
anden/share/doc/groff-1.25.0/html/img
rm -f /home/branden/share/doc/groff-1.25.0/html/img/pic*
/home/branden/bin/install -c -m 644 doc/img/pic* \
  /home/branden/share/doc/groff-1.25.0/html/img
for d in doc /tmp/rando/groff-1.25.0.rc2/doc; do \
  if test -f "$d/gnu.eps"; then \
    rm -f /home/branden/share/doc/groff-1.25.0/examples/gnu.eps; \
    /home/branden/bin/install -c -m 644 \
      $d/gnu.eps /home/branden/share/doc/groff-1.25.0/examples/gnu.eps; \
    break; \
  fi; \
done
for d in doc /tmp/rando/groff-1.25.0.rc2/doc; do \
  if test -f "$d/gnu.png"; then \
    rm -f /home/branden/share/doc/groff-1.25.0/examples/gnu.png; \
    /home/branden/bin/install -c -m 644 \
      $d/gnu.png /home/branden/share/doc/groff-1.25.0/examples/gnu.png; \
    break; \
  fi; \
done
cd doc \
&& for f in `ls webpage*.html`; do \
  rm -f /home/branden/share/doc/groff-1.25.0/examples/$f; \
  /home/branden/bin/install -c -m 644 $f /home/branden/share/doc/groff-1.25=
=2E0/examples/$f; \
done
test -d /home/branden/share/doc/groff-1.25.0/examples/img \
  || /bin/bash /tmp/rando/groff-1.25.0.rc2/build-aux/install-sh -d /home/br=
anden/share/doc/groff-1.25.0/examples/img
rm -f \
  /home/branden/share/doc/groff-1.25.0/examples/img/webpage*
/home/branden/bin/install -c -m 644 doc/img/webpage* \
  /home/branden/share/doc/groff-1.25.0/examples/img
if test "no" =3D "yes"; then \
  if test -n ""; then \
    if test -f /home/branden/share/groff/1.25.0/tmac/s.tmac -a -n "`if test=
 no =3D yes; then for i in  ""; do case "$i" in s) echo g;; esac; done; fi`=
"; \
    then \
      mv /home/branden/share/groff/1.25.0/tmac/s.tmac \
         /home/branden/share/groff/1.25.0/tmac/`if test no =3D yes; then fo=
r i in  ""; do case "$i" in s) echo g;; esac; done; fi`s.tmac; \
    fi; \
    if test -f /home/branden/share/groff/1.25.0/tmac/an.tmac -a -n "`if tes=
t no =3D yes; then for i in  ""; do case "$i" in an) echo g;; esac; done; f=
i`"; \
    then \
      mv /home/branden/share/groff/1.25.0/tmac/an.tmac \
         /home/branden/share/groff/1.25.0/tmac/`if test no =3D yes; then fo=
r i in  ""; do case "$i" in an) echo g;; esac; done; fi`an.tmac; \
    fi; \
  fi; \
fi
cd /home/branden/share/groff; \
  rm -f current; \
  ln -s 1.25.0 current
test -d /home/branden/share/groff/site-font \
  || /bin/bash /tmp/rando/groff-1.25.0.rc2/build-aux/install-sh -d /home/br=
anden/share/groff/site-font
test -d /home/branden/lib/groff/site-tmac \
  || /bin/bash /tmp/rando/groff-1.25.0.rc2/build-aux/install-sh -d /home/br=
anden/lib/groff/site-tmac
make[4]: Leaving directory '/tmp/rando/groff-1.25.0.rc2'
make[3]: Leaving directory '/tmp/rando/groff-1.25.0.rc2'
make[2]: Leaving directory '/tmp/rando/groff-1.25.0.rc2'
make[1]: Leaving directory '/tmp/rando/groff-1.25.0.rc2'
## 2026-08-23 09:06:12 bash-5.1 [8] {0} (0) branden@illithid:/tmp/rando/gro=
ff-1.25.0.rc2 !986$

--si4tdmhw7sia6iga--

--wogrleexqtpizq6o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmqLAK8ACgkQ0Z6cfXEm
bc5zrxAAo08+1hExcuvx9X37zqCV3cN1Gsy8eHhYKtJzmqVA4D4J2QUqYEWogtzn
vsZarFgM7wB5uGb2ICQXGa+7dG0PONvdX9+24cUkJqoBuyBZGhTzkuDn5hSUZHg5
HYXn4g4hZgBwRwz/3wkp9sbHt9zx6AWeWisi4wHPQO8W/rkzNdQMvQJX28nWrP+Y
HHwwBx+950Q7p4MPQ1mx3rO+D9Ni5Yb5ojkHG+/gZmr5j89qw+XhL+WkLwSL3PzV
EqgKae2HOe3tOFvUmIDUGXzBCxpnrnRspPJMM3mrp0fV5JQM+ZvIzDa/7kB/AP+W
XxoaDX/8FzqYTVXeCVn4AHfcLf53e7eiM+i3Ep1NJpCyh8zBbItksfluBX14DTog
79pinXeW6039vORVmpPfRD+lE20DviUHHv0FHg6k5q+Pjgra0V0xHtUNzazh2rTZ
R9n1HvQIzS3viJpfodq5KcVk8QCCw1wl6ngx/4XphIWMHt56iUcaG9HnVuDzWmOj
cEt+e1M4N4Vs6QML9+5DzNXlLRuP+tG+RS7PhRk+6jehlb3iUy4mInzBtTKSeV0w
NaHCgyKp+OMU42QJ7je/vsihUT2l5PzilzGbxsQfN5c+h5NyGNe/zjr/3w7NkrSX
vtASXsYMTV3Q+pPGzqogOvj8hVRIomcGwGqO7ZuU5go/qbEGhzo=
=uB4/
-----END PGP SIGNATURE-----

--wogrleexqtpizq6o--
