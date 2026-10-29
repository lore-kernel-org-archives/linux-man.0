Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793316504;
	b=IyfVl8H14QU7qZiSPTOeINgbbXgxykMgYyQ6Ii4TeEHkOMMV23kVn9g34n9i6wMsWTrm
	 NPsa9dBmhfARUErmM0amdbpyknLEqivQ6GjxgS0/PvgVBugBuei86qlADqd5YARsBR8Le
	 4j0WDD/EddAaKmvbbhipdFCkA5gfFH7pc+KsbRNjiBKeBaGgYSXY5LrzVho1eKCovvUIs
	 hLfNwFqgWqTk6RUU0kJi+rsgrdwUAAqvXpD6rEbpX86y8Rj8PAqG9RNuC4UzIPCnSqgJm
	 tslqLkFqoOiWCS7GX0GQuKt7XFvUBX1e+1fX7Mp6FUNRDj7MtbEZC96LOpdYq2nbM7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793316504;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=AHHR3zmUu0wE2VDNFTuJ+3VsyjUtPEuqh+wvrrQDwZA=;
	b=W6omoWImI+Alng+wBUzyauYiIeqErJdRS/lMdoiC6cK90yaFooWHymy5HZqc20ReEaNC
	 n8URXb2PuOq2x/7vOoL7YNM3Ar8qKRYcCZ9rNtUqCUJzMaKiz8qHieF9VlelrNrLF4cCm
	 uKLLC1U+KK5D5v7F3E5OxoGb8AI4a25qt70RNczO/qDWpoVut7qXvUndo5JGetONrQRu3
	 dGGzLwkUSA5Jq0Ixr8ZaNuul1/q9ClVorUtbqXySxf2z5HQS/Hgu1edGpz5XbxGW+X3es
	 J1U7+xJK3Yt+x3UO4Kl0pN2hH3RvdxangT2kzvX7WkBO9TAOFJqGGYCDfY5xoqBb+DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ppFSA7l+;
	arc=none smtp.remote-ip=74.125.224.47
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F20606A326
	for <linux-man@vger.kernel.org>; Thu, 29 Oct 2026 23:28:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29F20606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ppFSA7l+
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-6798af41644so84798d50.2
        for <linux-man@vger.kernel.org>; Thu, 29 Oct 2026 16:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793316503; x=1793921303; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AHHR3zmUu0wE2VDNFTuJ+3VsyjUtPEuqh+wvrrQDwZA=;
        b=ppFSA7l+gwr7FCuSJbSRiakvAPveajEnZOEQt2mwbakhxOcPi106fbUO9yFBnAC0cp
         4dH1858g1R+o1AstpkFUg4KLEAWypzZ3CXQ/5sE9MeYX2GKziFoxB9AU4eDig0NmwF2b
         935qtkID3TepbHf2BEAy0jjpFik/IPLV/QsUY/1w/53YEyI7HGAD5KTFdDmqayMcvoNJ
         FtGpyFH8FdqupEYkO8aUqw66eL6r+3b4flTEYzsPPZzG2dEnzRD7CgNHBN982hcPmcug
         M0eXcx7t0fGykX0QKmrxwyhvGj7qu6ZLlHJC5HT6sqJKv869nBNh7NBBC/Ycgf/7+V7x
         VtQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793316503; x=1793921303;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AHHR3zmUu0wE2VDNFTuJ+3VsyjUtPEuqh+wvrrQDwZA=;
        b=rl12uMNsirwD+2EbbH28KWE7rUgAeTSB5ID9g0hWt9/jeWYqDVnMM5SMgeaT6kyi4A
         CdIiTWTGy+RERL4hxy7j3kggIFjK22x20v8blhnNIAEzgDCsHViykS6rTr2ucHdMTZiF
         nWvRjShfaC0PiwEOP/wtcvGZad6xUycV+FRg5MVapmiv8isPVbTdHGePgXLp2Hc8QiAP
         U4f299KMRIHGyREYJinp5XDIxbNyLOWKcuQ0WV4OauhO1zLomOm6cjGoSeXv6j+EfX/i
         3erL68neT7KPA6koHtMBNXf/mT4mYt+qydQw7mbiFbq8qMxqmS/nYy9GVZ8u4LNUyGWE
         aobA==
X-Forwarded-Encrypted: i=1; AKwUvBzzNWbbqRVh5UBL3w7kR4kFxCZ/g/jeaYhCrEcRhxLaZ9WcyTMs6LWZIgyChTAKIHjpqrWs6GKlbOw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKD5BQh0dQfrOZ60bwZC0JPe6hV2o+moNbpcSFnX7HIIN61OGTB
	jNFSryy4xGtLS+AND0As/xRcLnCFAJPUN4kYdp4YORXrnQ2f8xFuGd7K
X-Gm-Gg: AYBFou1bINMQfKhoa+nlVf4Jbex1RH1OhQfCwHRdzgOJlHYr2RBPafVCly2A4OSOWaw
	YuAx2Jf93SjO70olM/irHUVYrR3lPOF4+bcUix3Q7pgU+V+TRdDBSVTfxBIePonSWM3t5IRc4xU
	Vk8tt60HMpkLQt0kEwNbInJCKD1lVdYWHAL1m1rahKS6axXBv+Q9GPgwUhsCGxNsitP61jqVb6d
	7bsl95cKMEvqKlNS9k6ISTXGYgSzhLIaelSt/Yco2giRSbC5Xj09hUJ7nYlyJ11QK5p3KjfrEnQ
	cYukELrrz+6r8+EvBkyqXfUhgHj/JK26Up+FoNLvGYfIwFrD3eiLEXgMqjPLAh8HkHo3fi2+fxs
	YeQs+9+CntZ2sFsKiy3r+GjIWb09ksOJGB1xLUjAw5DjOqYdRfaWIQsX5lw9qWHc6ihWlLRvh9R
	N+h1wJjpTxKKXntTHwvWZY2zN78PpP+l9Vpjq/aVvdniaZ1nGngETTJaV6iQ9sDwEnNi4F7nhc5
	thfZRItiHrLb+RbGPu8zzbRw7Gzb0rdIr56wMJz4pRz1ia7MPuaO2tgN3OcgQrA9Ffzxlaq/6eJ
	oocuDdld7SEsqkG+ioAVLR5QMFcBbdDt6dVdmOY=
X-Received: by 2002:a05:690e:807:20b0:679:943f:b192 with SMTP id 956f58d0204a3-67ba50a6907mr327460d50.76.1793316502594;
        Thu, 29 Oct 2026 16:28:22 -0700 (PDT)
Received: from illithid ([2600:1702:7cd0:e980::49])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67ba756cbbbsm65928d50.22.2026.10.29.16.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 16:28:16 -0700 (PDT)
Date: Thu, 29 Oct 2026 18:28:13 -0500
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: platform-testers@gnu.org, info-groff@gnu.org
Cc: groff@gnu.org, linux-man@vger.kernel.org
Subject: groff 1.25.0.rc4 available for evaluation
Message-ID: <20261029232813.aqji7n3bznufkpua@illithid>
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
	protocol="application/pgp-signature"; boundary="cry2dtxq7nv2pwch"
Content-Disposition: inline


--cry2dtxq7nv2pwch
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: groff 1.25.0.rc4 available for evaluation
MIME-Version: 1.0

groff 1.25.0 release candidate 4, 1.25.0.rc4, is now available from
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


Changes since groff 1.25.0.rc3
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Since the groff 1.25.0.rc3 release candidate was made available on 13
October, 1 person has authored a total of 97 commits.

$ git shortlog --summary 1.25.0.rc3..1.25.0.rc4
    97  G. Branden Robinson

Thanks to Alexis Hildebrandt and Bruno Haible for reporting defects in
rc3.  For this RC we gave intense attention to fixing assertion failures
in the GNU troff formatter occurring on invalid input in cases that are
unlikely to be the product of human intention, but instead are generated
by fuzzers.  We furthermore checked the code paths following assert(3)
calls to verify that they behaved sensibly in the event an `NDEBUG`
build permitted execution to reach logic following an assertion that
would otherwise have failed, and updated that logic where warranted.

Here are some highlights of this release candidate.

96b8274a9 m4/groff.m4: Fix Savannah #68775.
0ae673870 [mm]: Fix Savannah #68782.
ebd1b9aa8 [groff]: Regression-test Savannah #68783.
49c7b6ce5 [troff]: Fix Savannah #68783.
83e83786d [troff]: Add error handling.
5c23c1468 [groff]: Unit-test `mso` request.
08f5f4537 [libgroff]: Add `NDEBUG` assert(3)ion fallback.
9c4143d3f [groff]: Regression-test Savannah #68784.
591b49513 [troff]: Fix Savannah #68784.
18846e255 [groff]: Regression-test Savannah #68786.
88f1ad37a [troff]: Fix Savannah #68786.
1365df2b4 [troff]: Improve `lf` request input validation.
c5bc665e4 [troff]: Add `NDEBUG` fallback to `lookup_request()`.
bb7169f0d [groff]: Regression-test Savannah #68788.
613941492 [troff]: Fix Savannah #68788.
a0dcc4b5c [groff]: Unit-test `rr` request.
a36a2dfa8 [troff]: Add `skip_rest_of_argument()`.
33bf4b12e [groff]: Regression-test Savannah #68790.
911228b84 [troff]: Fix Savannah #68790.
9725fc257 [groff]: Unit-test `rm` request.
9e38ee0ce [troff]: Adjust `rm` request handler.
783680e17 [groff]: Regression-test Savannah #68791.
3309c7abd [troff]: Fix Savannah #68791.
0cf605b9c [troff]: `pnr` request advances past invalid args.
cf9d14998 [troff]: `pm` request advances past invalid args.
1060c0887 [groff]: Regression-test Savannah #68794.
3005a44d4 [troff]: Fix Savannah #68794.
cb776accf [groff]: Test `pcolor` error path.
2e0a44475 [groff]: Regression-test Savannah #68796.
7af7a1be0 [troff]: Fix Savannah #68796.
9817934c4 [troff]: `pcolor` req advances past invalid args.
a908a55e9 [groff]: Regression-test Savannah #68797.
fe8854dbe [troff]: Fix Savannah #68797.
bf48529b4 [troff]: Revise `rn` input validation.
687d47650 [groff]: Improve `pi` request test.
70e2df1c4 src/roff/troff/input.cpp: Fix Savannah #68815.
071f266af [troff]: Implement new `.pi` register.
df911c214 [groff]: Test use of multiple `pi` requests.
6ec20c2b6 [groff]: Regression-test Savannah #68817.
3773b818b [troff]: Fix Savannah #68817.
bff7782f3 [troff]: Revise `als` input validation.
0e297c925 [groff]: Regression-test Savannah #68819.
9f0536f8f [troff]: Fix Savannah #68819.
b3eaa387e [tbl]: Fix Savannah #68825.
5c19d3325 [groff]: Regression-test Savannah #68832.
36ddf4175 src/roff/troff/input.cpp: Fix Savannah #68832.
ee289eb6b [groff]: Regression-test Savannah #68836.
1fcd2248c [troff]: Fix Savannah #68836.
322e33827 [groff]: Regression-test Savannah #68837.
a578d066c [troff]: Fix Savannah #68837.
8439a9b1b [mm]: Improve testing of "mmroff".

We furthermore made the usual clarifications of diagnostic messages and
improvements to documentation.

Details
-------

For a comprehensive list of feature changes, see "News" below.

Much attention has been given to fixing bugs, validating input,
clarifying diagnostic messages, improving memory management, and
correcting and expanding documentation.  The previous release shipped
with 314 automated tests; this one ships with 400.

As of this writing, per the GNU Savannah bug tracker, the groff
project has resolved 146 issues as fixed for the 1.25.0 release.

Classifying these issues by type and the component of the project to
which they apply, we find the following.

  Type                              Component
  ----                              ---------
  Build/installation           16   Formatter                      73
  Crash/unresponsive           30   Driver: grohtml                 1
  Documentation                11   Driver: gropdf                  3
  Feature change               16   Driver: grops                   2
  Incorrect behavior           48   Driver: grotty                  1
  Lint                          1   Driver: others/general          0
  Refactoring                   4   Font: devpdf                    1
  Rendering/cosmetics           6   Font: devps                     0
  Test                          2   Font: others/general            2
  Warning/suspicious behavior  12   General                        19
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

$ git diff --stat 1.25.0.rc3 1.25.0.rc4 | tail -n 1
 58 files changed, 2088 insertions(+), 317 deletions(-)

=2E..and since the last stable release, we have the following.

$ git diff --stat 1.24.2 1.25.0.rc4 | tail -n 1
 463 files changed, 57324 insertions(+), 34625 deletions(-)


Obtaining groff
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Here are the compressed sources and a GPG detached signature[*].
  https://alpha.gnu.org/gnu/groff/groff-1.25.0.rc4.tar.gz
  https://alpha.gnu.org/gnu/groff/groff-1.25.0.rc4.tar.gz.sig

Here are the SHA-1 and SHA-256 checksums.

49cdeb7c42d5d3f799607d1657e1edc1f8a61af6  groff-1.25.0.rc4.tar.gz
4vFcGaJssHSDu2EDE3CoN7EB5uOnX7OEBkxdTZ08Rss=3D  groff-1.25.0.rc4.tar.gz

The SHA-256 checksum is encoded in Base64 instead of the hexadecimal
form that most checksum tools default to.  The mechanism follows.

sha256sum < groff-1.25.0.rc4.tar.gz | cut -f1 -d\  | xxd -r -p | base64

(Because "base64" reads from a pipe, it doesn't know the file name, and
so the file name will not appear in the output.)

[*] Use a .sig file to verify that the corresponding file (without the
    .sig suffix) is intact.  First, be sure to download both the .sig
    file and the corresponding archive.  Then, verify the archive.

      gpg --verify groff-1.25.0.rc4.tar.gz{.sig,}

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

There is one new news item for 1.25.0.rc4.

*  A new read-only, string-valued register `.pi` reports the output
   pipeline constructed by one or more `pi` requests.

There was one new news item in 1.25.0.rc3.

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

--cry2dtxq7nv2pwch
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmrj1ocACgkQ0Z6cfXEm
bc4EMg//T9+zlIgIaLvFagLUrIt3a/fHs6NmnuTaJ3UJ/ymxvO6J1pgZcZU02bH5
z6277QzCuMGCx+sv1aIB+BiwuyOj/HcN29OtjRj3Ic4CaBwPYuxiOA0cRE20qFzF
4pNwaYrY0So5blD07AuUkO9YhaMMlEoFnxeVIQxxsddjgTHbr96GJxYl6WfN693b
4bA3ay//hSnQDlUX0zypONnvHbcVeKNgfOOI8CBpbk5Yzo/AT5D/uWyP7t53gmhL
WEJcqGQXRuQsHDlEQofLKyc1xo3gCkpov1K1XILZa/AyyGyf0X95pLz5zAh3dRed
XzLxJsk5CQLcuWACCyonX9YtUPZxBCN7e2m3IVJJKzIuE/OLy/suxGWaQKBq8ZzX
UTe8EisW/w+16a+PR6KgDHCvlUzEj0wxCly1FAiH/eGubqf5MmW7SRluN1gF+5O9
nLrGvsHUCV7DbxaooUfSGfZytZ7t/QmmsOUjsHXy2UCQJtq9QcJ/zzMk270P3pWs
yxirT9Kn6Ap9qo66IWiSJXUbarDRUN6ou/5NDzrwj1gMmprCDFiMxtMKXzup9K1p
ouOd0f1LFIDOfqnRz7ypSHWPdnd4NGu47z9G/S+x/j2lnN2F7mx7yd6U18IVLvCa
qqfve++kR3i9DtniYTlEZAtwtK4rElDV7Jm5Xx1JmIKBiKPyf9A=
=QQJ1
-----END PGP SIGNATURE-----

--cry2dtxq7nv2pwch--
