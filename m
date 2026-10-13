Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7DA541E40
	for <linux-man@vger.kernel.org>; Tue, 13 Oct 2026 19:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791920358; cv=none; b=gPrqCxpRD/pqJKhSgYTPH97gtedIFE3CnnH5TAYfnvWWJEOho+6ygsbq+9qbrct5VMukS7nkdiBZ+liycvmtBxOLCWPoMEZVVAC8xXt+/nskOUhhzW2JxxgYWBeIYzF0VYX/C6WcpdvciOfUWdh+D7x5dGko+l/C5mGHlZWO4LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791920358; c=relaxed/simple;
	bh=Bo7dOn7bt5V7KOnXNTCufmqZ87PWMNA5+hbuYXOwWQY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Faq1zxXyhkxi7HuYMaDphyYIUYgNREZRL59R/uG92JjQ7uJpBQiYsdv3HbPVu7rv86srCkn+ijnU9Q4j6TjYdK6nUxp2UZ16pwUe6g8PINcsaKSO+f+4iavdi9j2TLgvt1pVawuYRMdT4YuYlWsOaUmF+9z3HQrNzR8Uucbx6Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q8g/jP6L; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q8g/jP6L"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-87ab6e5f91eso22141277b3.2
        for <linux-man@vger.kernel.org>; Tue, 13 Oct 2026 12:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791920356; x=1792525156; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bb9pWqZkk1W1XFsrXhHNLhjOh37Qafr/b2MsG5ZtvYI=;
        b=q8g/jP6LBSTcERDn7ePKKPZWbPpGVXII2ni0+Ikfp/rrXjR+MPYxjemeEvaCaKOZLf
         gMJJjA2FZt9drSbduF4IftH3gKONh/r05mKnYVk2fm0bfVfF3IC1ToyOkyMD7qnziXvO
         EJy9AF/JPgv2YATLDEbc6YgYY5r2VVdMwAosnFs5Yp6UlNqa0HruZYscDxV7t0KNzL7O
         RUGyxtIgrMMW+bELhi/7NskmgF6d9sXeNyCJvSBaL2jHk9PqSKsvscLMQBiropRszBcz
         IpgRL4b/SMcgTizEoaTJSVQyGPvujNtqDHbhkPJMyMXLFfzdt8fACDPhbLyofuMldrrZ
         VTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791920356; x=1792525156;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bb9pWqZkk1W1XFsrXhHNLhjOh37Qafr/b2MsG5ZtvYI=;
        b=nYnbrbaqmWZoaZRMQjmgf1O90JWdO/N8BB3ST8EBZKYRVdunx64rJBfBQKGZmDtlml
         4X7K/tiL9lN8+oyAkmzxK6Sc/nhWhznw89k9Y33sHzy5KLFijCC0WxwmRBjUtBUuWRoY
         vaZY1mBHnuaRsDRZUGrBlo16Go4FEURercZ9th1zv4/E0FFlmP0DevZ8RCvo2Sq5C1xE
         fsLRfvKK0NiIqplfIFaWJqPc8WB5fkBzu9e7QbTrAOKI0dVF+QM2+ONlmOXwXQcd7IhL
         RsdxE6fps3umOgS3F6WV0R1OXqCfrlNHnIlrHKB8+iB+ToDbkGb/MPN5XhQVjKjtK9MK
         wT2w==
X-Forwarded-Encrypted: i=1; AKwUvBzDajVq53HwuGJyg/B3Y3reTzF93U4D945wcgYhpho1TGJocePj6tzqxg+/bekAAi4cfOnNeAADjAc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKU2UlNCcJw0uBnsaYDl8DyKRNETckA4PgIMbSw0bJCkrEwR04o
	eihh4+mLIKOqcWNdWP5ilU4QkZyD3I2hbboh+tMwWg8v7NB8VIbzJzwYfmj+hw==
X-Gm-Gg: AYBFou3PQiB0W/4x9exn6rfRtfzo7cW7E4AGcRT3h2QV4eNOqz0bc2Wtm36QGCy45AV
	Lbx/MDDNigtOJ9BZdmooarREJmDODWhhHuOtcIMrkZs4DY67NUSlvlwm+zrka16spo+LU/cGykh
	4Fn3yCu7EOS14pdbb+alJQIq4/47pKyZ6lgvNfroZeConrOl9r08kKtsL18WnG3aTCAoGXRJYrL
	+koTJ+fwy8mHLlEbQsUF/8fbJCFtLe4T0EofLCAMR3pfK+UJ2HQMWF7SWYoSt0yl5zKK8I/qVQy
	sLzV6JWREJpocYCzQammjLCDn5XjP3EbiEWgbJQJAJWa+haizBqifLx0LMli/Pnf0Ij//cEhpOb
	Ent9qTbBabVLuAYML++F2BynlAEXrTt/3cRX5Exui9NVfkaPqEFYBMCMSV9jCS4jch/6OxJrql3
	tCdF9uIaWr4Jalqpg4h1C/hM0nHHlMEVTm6m+lAzrPupmTkqj8ixeP1RU7hew=
X-Received: by 2002:a05:690c:e0ce:10b0:8ac:dfd2:ec88 with SMTP id 00721157ae682-8b07edc1dbemr38102947b3.48.1791920355167;
        Tue, 13 Oct 2026 12:39:15 -0700 (PDT)
Received: from illithid ([2600:1702:7cd0:e980::49])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b07f25141dsm48281067b3.40.2026.10.13.12.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 12:39:14 -0700 (PDT)
Date: Tue, 13 Oct 2026 14:39:12 -0500
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: info-groff@gnu.org, platform-testers@gnu.org
Cc: groff@gnu.org, linux-man@vger.kernel.org
Subject: groff 1.25.0.rc3 available for evaluation
Message-ID: <20261013193912.ww5ungkymurnqhr4@illithid>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sckuuqknwil4wyh2"
Content-Disposition: inline


--sckuuqknwil4wyh2
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: groff 1.25.0.rc3 available for evaluation
MIME-Version: 1.0

groff 1.25.0 release candidate 3, 1.25.0.rc3, is now available from
GNU's alpha site.  You may download the distribution archive from there.

  https://alpha.gnu.org/gnu/groff/

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

Changes since groff 1.25.0.rc2
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Since the groff 1.25.0.rc2 release candidate was made available on 1
August, 6 people have authored a total of 310 commits.

$ git shortlog --summary 1.25.0.rc2..1.25.0.rc3
     1  Bjarni Ingi Gislason
     7  Bruno Haible
     1  Dave Kemper
     7  Deri James
   293  G. Branden Robinson
     1  =C3=81lvar Ibeas

Thanks to Alex Colomar, Brahmajit Das, Bruno Haible, Hans Bezemer, Ingo
Schwarze, Jakub Kulik, Jeff Conrad, Larry Kollar, and Pavol Sloboda for
reporting defects in rc2.  For this RC we gave intense attention to
improving groff programs' and (static) libraries' memory safety.

We also incorporated fixes for long-standing security vulnerabilities in
the programs mmroff, pdfmom, and pre-grohtml that had gone unreported
for between 14 and 26 years.  We released a groff 1.24.2 stable update
to get their fixes into users' and distributors' hands more quickly.

Here are some highlights of this release candidate.

8d9650846 [pdfmom]: Fix Savannah #68765.
cbed1f24d [grohtml]: Fix Savannah #68688 (2/2).
82ab38c6c [troff]: Fix Savannah #68688 (1/2).
e86137926 [pre-grohtml]: Regression-test Savannah #68688.
08a0aa4a0 [mm]: Fix Savannah #68689.
3d1bcd53e [mm]: Regression-test Savannah #68689.
85e365b71 [pdfmom]: Fix Savannah #68687.
5c67befd2 [pdfmom]: Regression-test Savannah #68687.
5f6104b10 doc/doc.am: Strip `%%CreationDate` from EPS file.
ab8c064ee [man]: Add AT&T arg count checker to `CHECKSTYLE`.
d6cc8ade1 [man]: Ensure correct generation of groff.7.man.
a2f013488 [eqn]: `neqn` script locates `eqn` more reliably.
8fb8b7b96 [libdriver]: Migrate to ISO C++98 `try/new/catch`.
9b08db644 ANNOUNCE,PROBLEMS: Tweak Solaris testing advice.
3f83bb6e6 man/man.am: Fix man/groff.7.man generation, try 3.
bd35d413c Stop letting code coverage crash Solaris build.
e3ecdc21a ANNOUNCE: Add note for Solaris 11.4 users.
4516f8e09 groff_char(7): Fix Savannah #68741.
c44e62ddc [mm]: Adapt test to {Free,Net,Open}BSD od(1).
bd0f127ed [grn]: Fix Savannah #68686.
d9332be66 [grn]: Regression-test Savannah #68686.
971b12760 [mm]: Fix Savannah #68727.
668bd4429 [mm]: Regression-test Savannah #68727.
4f34230ab [mm]: Fix Savannah #68733.
7bc859d7b HACKING: Revise and expand.
135f0e1e1 doc/doc.am: Fix *.html generation with BSD Make.
b022f5086 Fix Savannah #68716.
b0ddddde5 [hpftodit]: Migrate to ISO C++98 `try/new/catch`.
331559454 [hpftodit]: Fix Savannah #68684.
864a79816 [hpftodit]: Regression test Savannah #68684.
47391f317 [hpftodit]: Migrate to ISO C++98 `try/new/catch`.
cca6188a8 [hpftodit]: Fix Savannah #68680.
be37b22df [hpftodit]: Regression-test Savannah #68680.
336f51191 Unsplit groff's Info manual.
119d63aa8 doc/doc.am: Avoid use of GNU Make extension.
7c656f0f2 [eqn]: Fix Savannah #68683.
08e99ff84 [eqn]: Regression-test Savannah #68683.
d31fbc2b9 [gropdf]: Inkscape exported pdfs fail to load.
954230c53 [man,mdoc]: Break line before any table region.
596015539 [tbl]: Cancel temp indent before table region.
72edc0478 [tbl]: Cancel right-alignment before table region.
85f79ee8f [libbib]: Fix Savannah #68685.
a5667ad70 [refer]: Regression-test Savannah #68685.
cd999c600 [libbib]: Fix Savannah #68682 (2/2).
0f9635654 [libbib]: Fix Savannah #68682 (1/2).
879108fbd [refer]: Regression-test Savannah #68682.
089e72294 [libbib,indxbib]: Fix Savannah #68703 (4/4).
6837e0dce [libbib,indxbib]: Fix Savannah #68703 (3/4).
4f6c9b705 [libbib,indxbib]: Fix Savannah #68703 (2/4).
0bf5a484b [libbib,indxbib]: Fix Savannah #68703 (1/4).
5b228fbfc [libbib]: Fix Savannah #68681.
765d6cf03 [refer]: Regression-test Savannah #68681.
e662fa0f3 [libbib]: Fix Savannah #68679.
360c8ea28 [refer]: Regression-test Savannah #68679.
9cfe8d43a [mm]: Fix Savannah #68667.
bdee68b15 [mm]: Regression-test Savannah #68667.
936361f81 tmac/s.tmac (KF): Break the line just as KS does.
7276437c5 [ms]: Fix Savannah #64466.
d79346025 configure.ac: Defeat C23/C++23 presumption.
0008c57e5 gnulib: Update stable/2026-07 branch.
5cbf279b2 [groff]: Fix Savannah #68676.
744d3a8f6 [gropdf]: Behave the same as grops wrt stroked line width.
da3dbb3a1 [man]: Fix Savannah #68658.
71bfafb0d [man]: Regression-test Savannah #68658.
fbda4a4d3 [man]: Fix Savannah #68656.
156872adc [man]: Regression-test Savannah #68656.
b7d51a93d [troff]: Fix Savannah #68642.
f6caa62c1 [grog]: Fix Savannah #68635.
f5c8144d6 [troff]: Fix Savannah #68616. [recte: #68618]
fc80908ba [troff]: Regression-test Savannah #68618.
8427b5ae1 bootstrap.conf: Fix Savannah #68566.
e0ce52297 [eqn]: Fix Savannah #68601.
e8e78aad5 pic: Fix undefined behaviour, part 2.
36b167208 pic: Fix undefined behaviour, part 1.
17883bb19 eqn: Fix undefined behaviour, part 2.
0f74adb41 eqn: Fix undefined behaviour, part 1.
8ef98cfb0 tbl: Fix undefined behaviour.

We furthermore made the usual clarifications of diagnostic messages and
improvements to documentation.

Details
-------

For a comprehensive list of feature changes, see "News" below.

Much attention has been given to fixing bugs, validating input,
clarifying diagnostic messages, improving memory management, and
correcting and expanding documentation.  The previous release shipped
with 314 automated tests; this one ships with over 370.

As of this writing, per the GNU Savannah bug tracker, the groff
project has resolved 124 issues as fixed for the 1.25.0 release.

Classifying these issues by type and the component of the project to
which they apply, we find the following.

  Type                              Component
  ----                              ---------
  Build/installation           14   Formatter                      55
  Crash/unresponsive           14   Driver: grohtml                 1
  Documentation                11   Driver: gropdf                  3
  Feature change               15   Driver: grops                   2
  Incorrect behavior           45   Driver: grotty                  1
  Lint                          1   Driver: others/general          0
  Refactoring                   4   Font: devpdf                    1
  Rendering/cosmetics           6   Font: devps                     0
  Test                          2   Font: others/general            2
  Warning/suspicious behavior   9   General                        18
                                    Macros: man                     5
                                    Macros: mdoc                    1
                                    Macros: me                      0
                                    Macros: mm                      6
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
                                    Preprocessor: tbl               2
                                    Preprocessor: others/general    2
                                    Utilities                       3

Another way of capturing the amount of revision is as follows.

$ git diff --stat 1.25.0.rc2 1.25.0.rc3 | tail -n 1
 118 files changed, 4553 insertions(+), 1373 deletions(-)

=2E..and since the last stable release, we have the following.

$ git diff --stat 1.24.2 1.25.0.rc3 | tail -n 1
 435 files changed, 55505 insertions(+), 34577 deletions(-)


Obtaining groff
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Here are the compressed sources and a GPG detached signature[*].
  https://alpha.gnu.org/gnu/groff/groff-1.25.0.rc3.tar.gz
  https://alpha.gnu.org/gnu/groff/groff-1.25.0.rc3.tar.gz.sig

Here are the SHA-1 and SHA-256 checksums.

1abf7692c02b3d03195d3c0f3a0ad6c92a0bb4b3  groff-1.25.0.rc3.tar.gz
vX+CBhQ9ZBKpNZQdt4nTokjXjBhVMSzZq0ALodwXC0o=3D  groff-1.25.0.rc3.tar.gz

The SHA-256 checksum is encoded in Base64 instead of the hexadecimal
form that most checksum tools default to.  The mechanism follows.

sha256sum < groff-1.25.0.rc3.tar.gz | cut -f1 -d\  | xxd -r -p | base64

(Because "base64" reads from a pipe, it doesn't know the file name, and
so the file name will not appear in the output.)

[*] Use a .sig file to verify that the corresponding file (without the
    .sig suffix) is intact.  First, be sure to download both the .sig
    file and the corresponding archive.  Then, verify the archive.

      gpg --verify groff-1.25.0.rc3.tar.gz{.sig,}

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

There is one new news item for 1.25.0.rc3.

*  The an (man) package now checks for certain portability problems to
   AT&T troff's man(7) if the `CHECKSTYLE` register, introduced in groff
   1.23.0 and documented in 1.24.0, is given a value of 100 or greater.
   This feature is experimental and subject to change.

There was one new news item in 1.25.0.rc2.

*  Building groff from its Git repository now requires the
   `--enable-maintainer-mode` option to its 'configure' script.

The remaining feature changes below were present in rc1.

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

--sckuuqknwil4wyh2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmrOiNkACgkQ0Z6cfXEm
bc53/w//UFSeG1RZXvUbDw3LkKEc2ZojR20q1yPqsba1/29zgk4Vrw/bbGmUkJvk
5MbYP2JK+lkluHs24T9seB/f7rhzkQzE0BRnAn+itN/kY/gjt2iaTK7nsmBzuosv
2gj1KN7NRFL6ZmMS94TV2o9bF527o80x3m6GzTMVYVjG9MZiiMaJyxnk8gmpmvv9
x47dU+Wt3Djs4V5So+JrqoKxqbFTBO6qsfYCDca0SsX3fPZSuR8rCuUWTgcpH34/
jaQ9BeXQhM4KVGXoMrHc23/ZkyORPtnhJ2Ud9K6hfPZPk0akd1YYkj63bEnjPYWR
YUi+5C47KH9vG0Yy7kLhuhjkZzvwsRiIqR2ir2lEUxBZXMqIsAqhJmP2rOOTRsJK
fqm279sykn29jpzregTMFhh86dbyeKb7TNwIRsY4Gf4mEX0F7f/QGSlgj6WZL83v
qysNh38XxRAWmx1om/ldQuqFQ1nY1gMB/gRc5m89Xpd4Dwmz+5zj4VnwoqTAX1y8
qI/6B+8Z6nOWun1p97qBR9G9iV7v6V8h0yCpkL8qZlVCKbRr1RXFA6z7Pg4+vT5w
R3a2iJz7YNA7/lTx2FCyIO8bVQ01ZVT04QiybG0QvPwT4rsN/UoJ9llbwjrt3uKN
l6tgh/iGf4uGtuZrRO/rrgJ0o8M+7TbgdKt+QRm4Jyy7j7b7x6M=
=M9s4
-----END PGP SIGNATURE-----

--sckuuqknwil4wyh2--
