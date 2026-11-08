Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794168032;
	b=1ix3Kx87wrved7b5V2B7GqbsMdETBraIMk3a1buJg6cJjcba15RjIRz8xHa/eW/408BK
	 BaCu8hpCD+bLk2DJJRsthnhxzySiM3CYXV8lnj4dhK/R3p/R0XrrtFJlQL3cGPXacvYHe
	 541AQI3QWP/JVRV4oDvTAE9t22iK1nre399wfNMx1ratKJWjVKFpBI/LhWz3FEgJq1YCx
	 M9+ePMtm8i6TbNRrjDiNWvMEuwIN+SNnelPerBpAYgqsliKLJwWMgN/R29Z2pKInU0YYS
	 3hIildRB5PnrRpvKZJdWM8lg5cLVQmOaGQKw4GbLcEBsV3KpXjukEHUGMd0NbDBZx0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794168032;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=1t38pnUO7q78/IwI9g+10Q0LF+oU671DRAoxIssWTa8=;
	b=0VlesYCk7INggPQjqe3tAjyFFk44+8HhzNk2yPB+KvGmp/KEaZGj2BlyzpZ9IT5wUQ9R
	 a3HTRTZFyUVnBBACbOs7D3QLzcDUdtAMTp9aJ9wUTROJHoGB4MmY7IugSvvew5matocsj
	 1yOIxZdjtCQpaRH/a/ysQbpBMWVhQ9hAO4HRv39e+6LcxHDdIFB9YTcqLfQGGU6y/pZXh
	 xs/VichgAxc+qIuui0n5PApW7f0rgC84KTbM/cFC5w3ayVn6WKKU4Ccbheugb/uWRANiF
	 xCqBFvuWL2G2ae2j6RhLtmqCz2hA03T35a4pP6s8IWgbrUQzGrX/q7iAw9bkzNkaqXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CnDpYRFc;
	arc=none smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D54606A31C
	for <linux-man@vger.kernel.org>; Sun,  8 Nov 2026 20:00:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51D54606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CnDpYRFc
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-67be9601f31so172699d50.3
        for <linux-man@vger.kernel.org>; Sun, 08 Nov 2026 12:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794168031; x=1794772831; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1t38pnUO7q78/IwI9g+10Q0LF+oU671DRAoxIssWTa8=;
        b=CnDpYRFcCN4qh7QM57OKssjCGjYybjvulTAufJT5KGuqY7Tk4RgbdHNU47LFciLodZ
         h/4tEAzGhtDdgfI4NNgHBkGgZh4GHquN1SoygdwZhVPW506zDqyzMo6pe4oL52TVI3La
         +6WbWNvufirPJdDxnlRxTA7uD4gGH8L0HFVx23m8CD94E4HiuwFLA2hUFmvDrtzZ8KXK
         tcQi8YBVzTew7dHgpI4F2N8WMcQh3jnFvGTH6eHldmJfWLimR8C6veLGY2efv3uEotXW
         pVeRIJ53HvC0LY23TNz8muU7LNjlK8nBjqolO6o6uPKoWtus5nO0QCbKYAqKOy/Mjox6
         B5yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794168031; x=1794772831;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1t38pnUO7q78/IwI9g+10Q0LF+oU671DRAoxIssWTa8=;
        b=gmS6MMGzV0tvLSfJH3Wb6zRI0BSTej1xIaImY615civHEsoFGQb5N55xQfki2gAK5Y
         bhmXwtlkGIE7MyZmORywTcLI58gHCnPj3yensBBsiT5mO6AZ7r3FHa2kbztQFPKt2BPO
         PRWEYIe5r/noqmn/KFFPmluXm61hoz/4PvnQko8ZJS3XJSj3IIt/KbayTW5NorFM2FIq
         kb2gnALAcUdch/cK/vQZJU/iHBXmqcvk+tZ0El0mzInkS1Sbnz4F6QRKC9UYSKMp0/h5
         VR8Bqt+iaobhFntrr5ItW3oIt0LT+BipgZysYuQd9de780pLjCj6gFtR9upJl0h1cuaO
         IcOA==
X-Forwarded-Encrypted: i=1; AL+hErH//mfDPMmKSZEUIJI4kkCTVNT44KWhmBE8jtDCE/1Oht9K//49M6UmYxf5vlRVJ+12XhXa/cD1FvQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gkmetWfxbLdkzyefoDc982maszjau7LoGCD2R2+X50dXabhx3
	ZTUBZj7oceNmpNGgTjFjV86MhgRFluap8E9Cpj/TOVinBnTRazhctduo
X-Gm-Gg: AYBFou2J7hw1CookpBcZZOX03dazvX6TVN2o48LNnYfekjeoVv+IzuRX1kRCLxjBt8w
	g/i9uxEYtWy+wzzeTM9Kd9UycHQWsyTotYbiAOKahmf0SU3tZ4hD0FnRqVc7R37l9PYpetUmsWU
	v8CwrfFYkErwDU9L439Ms55cIGnVBjwlrHPaqXgBX92KmyK7ceOCM4sv+rKsrJ2naHbnxu+yUuq
	r5GQP8yJmERVxhzC/WbbvAn9LmlotMzVqfHs5DgVd+Z0Wj2/lVkfmXmNh7l+Cte3fdoA0MxUOaU
	WqMfHDdYf639Nc5WUxeEsWnqK/fPHjP9o5Ubk6do2EJ2hetLTiF+ofpcCQemx+11nFH9Q3Q6rEO
	+R6VsOSMN6BCmo0wGFVUEkNzHCIov+fnZgL7uOS2RJS3nYNVvE2k4GQphgbn8qwSmfkW+iQ52Mc
	ZkOx2pOfghBhL+YKgQ91wzxDVxqNBBlnoJbu/fywbp2RZfvrfW68refj+lH5cXBCFyz8l4Rx2Mq
	iGaA74Xm0cQjMtBpsipJwcDRyKeIhwnC9SSb49QHeLPIEn+x/7Pqh0JtgIto/cVxDIy6i6XxXz+
	xrlE6YrPs+T6lpqE
X-Received: by 2002:a05:690c:e652:20b0:8b0:8e22:d937 with SMTP id 00721157ae682-8b36cac3f89mr6890187b3.33.1794168030718;
        Sun, 08 Nov 2026 12:00:30 -0800 (PST)
Received: from illithid ([2600:1702:7cd0:e980::48])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b36bbe7b9esm20011617b3.26.2026.11.08.12.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 12:00:28 -0800 (PST)
Date: Sun, 8 Nov 2026 14:00:22 -0600
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: info-gnu@gnu.org, info-groff@gnu.org
Cc: groff@gnu.org, linux-man@vger.kernel.org
Subject: groff 1.25.0 released
Message-ID: <20261108200022.5xbnilb3ut4qef6w@illithid>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mqkrxcyg425p4ura"
Content-Disposition: inline


--mqkrxcyg425p4ura
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: groff 1.25.0 released
MIME-Version: 1.0

We are pleased to announce the availability of groff 1.25.0.  Obtain
it from the GNU mirror network,

  https://ftpmirror.gnu.org/groff/groff-1.25.0.tar.gz

or, if the network is for some reason inoperative, directly from GNU.

  https://ftp.gnu.org/gnu/groff/groff-1.25.0.tar.gz

Ensure the integrity of your download by checking this source code
archive's cryptographic signature; see "Obtaining groff" below.


What is groff?
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

groff (GNU roff) is a typesetting system that reads plain text input
that includes formatting commands to produce output in PostScript,
PDF, HTML, or DVI formats or for display to a terminal.  Formatting
commands can be low-level typesetting primitives, macros from a
supplied package, or user-defined macros.  All three approaches can be
combined.

A reimplementation and extension of troff and other programs from AT&T
Unix, groff is widely available on POSIX and other systems owing to its
long association with Unix manuals, including man pages.  It and its
predecessor have produced several best-selling software engineering
texts.  groff can create typographically sophisticated documents while
consuming minimal system resources.

  https://www.gnu.org/software/groff/


Changes since groff 1.25.0.rc4
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Since the groff 1.25.0.rc4 release candidate was made available on 29
October, 2 people have authored a total of 47 commits.

$ git shortlog --summary 1.25.0.rc4..1.25.0
    46  G. Branden Robinson
     1  Peter Schaffter

Thanks to Nguy=E1=BB=85n Gia Phong for reporting a defect in rc4.

Here is a summary of changes since rc4, excluding the usual
documentation and diagnostic message improvements.

33019731e [mom]: Restore previous f/gcolor explicitly after drawing
          graphical objects.
3704ba055 [man]: `SY` behaves better when called invalidly.
9811b4754 [troff]: Align `pev` report wording with our docs.
52a9b3b68 [troff]: pev reports align/adjust more helpfully.
20eff66c6 [groff]: Fix stale variable reference in test.


Details
=3D=3D=3D=3D=3D=3D=3D

For a comprehensive list of feature changes, see "News" below.

Much attention has been given to fixing bugs, validating input,
clarifying diagnostic messages, improving memory management, and
correcting and expanding documentation.  The previous release shipped
with 314 automated tests; this one ships with 400.

As of this writing, per the GNU Savannah bug tracker, the groff
project has resolved 147 issues as fixed for the 1.25.0 release.

Classifying these issues by type and the component of the project to
which they apply, we find the following.

  Type                              Component
  ----                              ---------
  Build/installation           16   Formatter                      74
  Crash/unresponsive           30   Driver: grohtml                 1
  Documentation                11   Driver: gropdf                  3
  Feature change               16   Driver: grops                   2
  Incorrect behavior           48   Driver: grotty                  1
  Lint                          1   Driver: others/general          0
  Refactoring                   4   Font: devpdf                    1
  Rendering/cosmetics           6   Font: devps                     0
  Test                          2   Font: others/general            2
  Warning/suspicious behavior  13   General                        19
                                    Macros: man                     5
                                    Macros: mdoc                    1
                                    Macros: me                      0
                                    Macros: mm                      7
                                    Macros: mom                     1
                                    Macros: ms                      4
                                    Macros: others/general          3
                                    Preprocessor: eqn               5
                                    Preprocessor: grn               2
                                    Preprocessor: html              1
                                    Preprocessor: pic               1
                                    Preprocessor: preconv           0
                                    Preprocessor: refer             5
                                    Preprocessor: soelim            0
                                    Preprocessor: tbl               4
                                    Preprocessor: others/general    2
                                    Utilities                       3

Another way of capturing the amount of revision is as follows.

$ git diff --stat 1.25.0.rc4 1.25.0 | tail -n 1
 24 files changed, 363 insertions(+), 138 deletions(-)

=2E..and since the last minor release, we have the following.

$ git diff --stat 1.24.0 1.25.0 | tail -n 1
 521 files changed, 58389 insertions(+), 34837 deletions(-)


Obtaining groff
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Here are the compressed sources and a GPG detached signature[*].
  https://ftp.gnu.org/gnu/groff/groff-1.25.0.tar.gz
  https://ftp.gnu.org/gnu/groff/groff-1.25.0.tar.gz.sig

Use a mirror for higher download bandwidth.
  https://ftpmirror.gnu.org/groff/groff-1.25.0.tar.gz
  https://ftpmirror.gnu.org/groff/groff-1.25.0.tar.gz.sig

Here are the SHA-1 and SHA-256 checksums.

d9eb3bd520d90b2e7e3666249c07bff3ec3eca9d  groff-1.25.0.tar.gz
JNEDoH63nkGJY7ziBsh3G2SYcfg72i/UwuZVKcHFaSE=3D  groff-1.25.0.tar.gz

The SHA-256 checksum is encoded in Base64 instead of the hexadecimal
form that most checksum tools default to.  The mechanism follows.

sha256sum < groff-1.25.0.tar.gz | cut -f1 -d\  | xxd -r -p | base64

(Because "base64" reads from a pipe, it doesn't know the file name, and
so the file name will not appear in the output.)

[*] Use a .sig file to verify that the corresponding file (without the
    .sig suffix) is intact.  First, be sure to download both the .sig
    file and the corresponding archive.  Then, verify the archive.

      gpg --verify groff-1.25.0.tar.gz{.sig,}

    If that command fails because you don't have the required public
    key, you can import it.

      wget -O 108747.asc \
        'https://savannah.gnu.org/people/viewgpg.php?user_id=3D108747'
      gpg --import 108747.asc

    Run the 'gpg --verify' command above again subsequently.


Caveats
=3D=3D=3D=3D=3D=3D=3D

*  To build groff on Solaris 11.4, you must pass the option
   `--disable-dependency-tracking` to its "configure" script, or use GNU
   Make, for example with `./configure MAKE=3Dgmake`.

*  GNU tools, or otherwise POSIX-conforming ones, are generally required
   to build on Solaris 10 or 11.  See the "PROBLEMS" file in the
   distribution archive.

*  Solaris 10 and 11 have known problems with automated tests; see the
   "PROBLEMS" file in the distribution archive.


News
=3D=3D=3D=3D

troff
-----

*  GNU troff, the formatter, now employs the unusual Roman numerals "W"
   and "Z" of AT&T troff only in compatibility mode.

*  The `dt` request, when given invalid arguments, now does nothing
   instead of removing any existing diversion trap.  This change is
   inconsistent with AT&T troff but more consistent with general *roff
   syntax; as a rule, requests given invalid arguments (and that don't
   process a list of similar objects, as `rm` and `rr` do) perform no
   operation.  (However, see "Other differences" in groff_diff(7) or
   groff's Texinfo manual regarding `rm` and `rr` request behavior that
   is discrepant among various troffs.)

*  The `dt` and `wh` requests now enforce their requirement of space
   between their arguments.  While consistent with GNU troff input
   syntax, said enforcement is not consistent with AT&T troff.  We did
   not add support in groff's AT&T troff compatibility mode because
   we're aware of no legacy documents that require it.  Example:
   `.wh9i+.5+\n(xxuPT`, while it validly plants a trap calling the `PT`
   macro in AT&T troff, is an input considerably more cryptic than any
   specimens known to us.

*  The formatter now enables the "delim", "syntax", and "escape" warning
   categories by default.

*  The `trf` (transparent file throughput) request now discards input
   characters that are invalid in GNU troff's output format, meaning all
   character codes less than decimal 32 (except 10, the line feed) and
   greater than decimal 127.

*  A new read-only, string-valued register `.pi` reports the output
   pipeline constructed by one or more `pi` requests.

*  A new read-only register `.ul` reports the count of productive input
   lines remaining to be be underlined in the environment (as configured
   by either the `cu` or `ul` requests).

*  The formatter supports a new warning category, "style".  It is used
   to diagnose input that is non-idiomatic or likely to produce an
   unexpected result (or none at all), but is not invalid.

*  When issuing warning diagnostic messages, GNU troff now reports the
   warning category governing its emission.  This change is to make it
   easier for users to select warnings of interest.

*  When the `substring` request is given two index arguments whose
   magnitudes both exceed the operand string, macro, or diversion's
   length, it now ignores the request (and issues a warning in category
   "range"), leaving the operand (first request argument) unchanged
   instead of emptying it.

*  When the `ti` request is given no arguments, the formatter now
   cancels any pending temporary indentation.  (Formerly, it did nothing
   in any troff, except, in GNU troff, issuing a warning in category
   "missing".)

*  The `phw` request now accepts arguments.  Each is interpreted as a
   possible hyphenation word (ignoring hyphens in the input), looked
   up in the hyphenation exception list for the hyphenation language,
   and if found, is reported with its hyphenation points.  Only
   hyphenation exceptions defined by the `hw` request are reported.

*  The `pwh` request, when invoked while the diversion is not the
   top-level diversion, now reports the name and location of any
   configured diversion trap instead of reporting nothing.

*  A new request, `rhw`, removes user-defined hyphenation exception
   words from the current hyphenation language's list thereof.  Those
   supplied by files like "tmac/hyphenex.{cs,en,pl}" are retained.

*  The built-in, read-only register `.zoom` is now named `.fzoom` for
   consistency with other GNU troff extensions, which largely pair
   names of requests with those of read-only registers they affect.  The
   old name remains as an alias configured by the default "troffrc"
   file.

grn
---

*  The `-M` command-line option is renamed to `-I`, better paralleling
   troff(1).  Inclusions are not the same things as macro file
   resources.  The program accepts `-L` (the original Berkeley name for
   this option), and `-M` (groff grn prior to this point) synonymously.

groff
-----

*  groff now passes `-I` options as-is to grn(1), instead of translating
   the option name to `-M`.

*  groff's `-I` option no longer implies `-g` or `-s`; if your document
   needs to be piped through grn(1) and/or soelim(1), specify the
   foregoing options as appropriate.

pic
---

*  groff's pic(1) manual, "Making Pictures With GNU PIC", is now built
   and installed as a PDF rather than a PostScript document.  Thanks to
   Deri James.

Macro packages
--------------

*  The an (man) package offers new macros to ease the formatting of
   lists.  Enclose paragraphing macros between `LS` and `LE` to identify
   them as list items.  Doing so can mark them as "compact", ease
   management of their indentation, and supply hints to the output
   driver to improve their rendering (as with HTML).  Lists can be
   nested.  (Sub)sectioning macro calls, and the end of the document,
   close all open lists.  See groff_man(7) for details, and
   groff_man_style(7) for an example.  Thanks to Alex Colomar, Chet
   Ramey, P=C3=A1draig Brady, and Stephen Gildea for consultation and
   encouragement, and to Alex for selecting these macros' names.

   Because these macros format no text, documents employing them risk no
   damage to their content if the formatter does not support them.  A
   man(7) document author can choose either to transition to these
   macros, to manage list "compactness" and item indentation with
   existing man(7) package facilities, or to employ both approaches.

*  The an (man) package now checks for certain portability problems to
   AT&T troff's man(7) if the `CHECKSTYLE` register, introduced in groff
   1.23.0 and documented in 1.24.0, is given a value of 100 or greater.
   This feature is experimental and subject to change.

*  The m (mm) macro package's `IA` and `WA` macros--used only with the
   "letter" document type configured by calling the `LT` macro--no
   longer disable the escape character, and their counterparts `IE` and
   `WE` no longer re=C3=ABnable it.  This change makes groff mm consistent
   with DWB 3.3 mm.  If you require the previous groff mm behavior,
   consider writing and using wrapper macros such as the following in
   your document.

   .de iA
   .IA
   .eo
   ..
   .de iE
   .ec
   .IE
   ..

   These macro definitions are harmlessly redundant when formatting such
   a document with an older version of groff mm.

*  The s (ms) macro package now supports PDF features.  Pass groff (or
   troff) the command-line option `-r PDFFEAT=3D1` to enable them when
   used with the "pdf" output device ("-T pdf").

   The PDF thus produced shows an overview bookmark panel or navigation
   pane (viewer application support allowing); the viewer's interface to
   document properties includes the document title and author(s), if
   specified by the `TL` and `AU` macros, respectively; if the document
   calls the package's `TC` macro, the table of contents entries it
   produces are hyperlinked to navigate the document (even if it does
   not use the `XN` macro introduced in groff 1.23.0); and if the
   document calls `RP` to configure a cover page, the table of contents
   relocates to follow it.

   The new macros `XM` and `XR` respectively anchor a location within
   the document and format text that hyperlinks to it, respectively.

   These changes were inspired by Keith Marshall's "spdf.tmac" which was
   withdrawn from groff in 1.24.0, but continues to be developed at:

      https://savannah.nongnu.org/projects/groff-pdfmark/

   ...though groff ms(7) differs in some respects.  Our objective is to
   enable and support PDF features in any ms document without requiring
   its author to update its content.

   We welcome feedback on these extensions to the package's macro
   interface.  We expect to finalize these changes in a future release,
   and effectively default `PDFFEAT` "on".  Thanks to Deri James.

*  The s (ms) macro package now supports the use of automatically
   numbered footnote marks (interpolated via `\**` or `\*[*]`) in tbl(1)
   table entries.  Other implementations of ms do not.  Thanks to Deri
   James.

*  groff's ms(7) manual, "Using groff with the ms macros", is now built
   and installed as a PDF rather than a PostScript document.  Thanks to
   Deri James.

Miscellaneous
-------------

*  The new document "Groff PDF Features" is built and installed as a
   PDF.  It surveys the PDF features that groff enables and exposes in
   its full-service macro packages.  Thanks to Deri James.

*  The grn command now exits with status 2 instead of 8 on usage errors
   arising from missing arguments to command-line options.  It now exits
   with the POSIX standard `EXIT_FAILURE` status (1) instead of 8 when
   reading an unrecognized command keyword.

*  The 'configure' options '--{en,dis}able-groff-allocator' introduced
   in groff 1.23.0 are now deprecated.  `--disable-groff-allocator` has
   been implicit since that release, and we've received no reports of a
   C++ runtime unable to handle groff's demands on its heap/"free store"
   allocator.  We expect to withdraw these configuration options
   completely in groff 1.26.

*  Building groff from its Git repository now requires the
   `--enable-maintainer-mode` option to its 'configure' script.

*  You need the "convert" program from ImageMagick or GraphicsMagick to
   build groff from its Git repository.  The program is not required for
   builds from distribution archives.


Acknowledgements
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

We'd like to thank the following people for helping ensure the quality
of this release.

Alex Colomar
Alexis Hildebrandt
Avi Halachmi
Benno Schulenberg
Bjarni Ingi Gislason
Bob Friesenhahn
Brahmajit Das
Bruno Haible
Chet Ramey
Colin Watson
Dave Kemper
Deri James
Dmytro Bagrii
Doug McIlroy
Elias Hasas
Hans Bezemer
Hilmar Preu=C3=9Fe
Hubert Garavel
Ingo Schwarze
Jakub Kulik
Jeff Conrad
Johannes Altmanninger
John Gardner
Karl Berry
Larry Kollar
Luis Rivera
Martin Simmons
Morten Bo Johansen
Nguy=E1=BB=85n Gia Phong
Pavol Sloboda
P=C3=A1draig Brady
Richard Purdie
Ross Burton
Russ Allbery
Santiago Vila
Stefan M=C3=B6ding
Stephen Gildea
Zack Weinberg

--mqkrxcyg425p4ura
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmrw1MoACgkQ0Z6cfXEm
bc7LDw/9HHk+Sub48JWsvE5lXr0J/3c0btFQTY7CCFsrZCbIfgiq/W1ocmCOiQ1r
7OnuSxNPPyxt46kG4OMclgK7sydvAJ2DR5drkl8yuNEEQZMCWw5Y6tPcu+UAT+9X
l77KTsKbbR/nE58XUs1UcpEBLx30faUA2+b+x0F1pVGnYKzflXcfVaB+m8R7RG7F
yj2HV/6O2RIezNGxAwVNved7rOgNCknPVJMG6jIOqAtlv3ZAajatJs8d018BI0WR
fzmMKIBZh53Jr/HW81B/pSUoRQdyCOQ3QZmP04VBg4F6vmyVS+4NjxvyOxyFunFI
14G5Z+DPzzydAV06JyzzLHucQkHEULG1a+J7LyeQU4Rk9kBXvb4rj5vieKyUxux1
SgKbNfCvxAEP/MROMI2Uw2hs2jt6/zyU/7S9bKq6d1kAJ0sTC7+wPm1e5sUczfvr
i0y9sDcKCZXM+b13RZYk+wfT5gFMK09GLc619CYJdMK5joupSXrbXWH673cnFI0F
4/VKZQ+JJp4uI6BgnpuqGcBrGVwekjO1nEWuDu2vC4yZobIBdykn7lW0u+oRL6Al
KfW9G010C+WG7rqq8pI4PNWatCDc7Njjyj5Deejogq4SnEly2coHsdOmEQfwUtIa
N2Kqxah92XCYDfLPgEFk/JiOI6liIsaS0FBHUGdyswyc9sPOk1E=
=uac9
-----END PGP SIGNATURE-----

--mqkrxcyg425p4ura--
