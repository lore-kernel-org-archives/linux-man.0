Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412C843F099
	for <linux-man@vger.kernel.org>; Sun, 19 Jul 2026 00:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784420987; cv=none; b=spbR19QtWE5Gq7nWPhsZf6O0W67ALgqRx+K6xbtoVjAamlgcB7TuvIAd5b2qfaxRLJdEEjvXovSUJruUygUfJrEyKu+kChvHKxWhbT4ql/XDu4w6QfbIgUmAT1dHZwq2W2mSmZJykeZCJt9QN3V1KzzaBCu3MR86h9r+zNpgjes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784420987; c=relaxed/simple;
	bh=k8V6CYQUupXQOofELoszpuiKS08I0Xj6/slVR+Tg5n4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QFW6Ek2OrX1cNwyJ2khCS6N/YPlslgfpb3GPpBwqSofVGQyrQlq3sj/0E09XZw2PdT1fhqpvwxiA3Fw1wLEVhKp05gNd7KV70dumqKm58auRXJcyKX5aW1kdbZtvkvi0II6YizotBGazjwCBYvnqpv47ROgHqHQEKcZ8GPQdZVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QcAMROOX; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QcAMROOX"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-81ef8255cccso16006357b3.0
        for <linux-man@vger.kernel.org>; Sat, 18 Jul 2026 17:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784420984; x=1785025784; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0QTauVj5jVsTgEQet81JcTThGKkdOdSpulCukrW0Usg=;
        b=QcAMROOX+einCqe4oJuBeW9CAw67AJKaeipYmkUx7qOBEUY6mOspyel6rwUFm4OKpQ
         aUQEPT7CclPjoe7CR1QI9nJBALPDHoHPiPhNXe48gpXK5X+4jubdgN9rnU1kN+EI+9Ns
         8PT4T0VpVabibkpvzLZ5g+aM6wLohDy5Irc4y7LCi8cj5GgSlCJT5jMeyIjfbhAjF4Gc
         wTT1FLJM4a2zaBpW3PccH0H4pme9t13fbNOYoGhC1qrnA8D85GRFBPKCTOzqqRvAz1K3
         RWSRkN5FR7yhxueRXfWN5m45qGW61gOrW0R6io5UpmMd56I3qGLpDGM9AoNwdUjQP03k
         dnpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784420984; x=1785025784;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0QTauVj5jVsTgEQet81JcTThGKkdOdSpulCukrW0Usg=;
        b=AI5ZYrcs+tILmNvKmdammltSersudYt1DMeyZCV7GJx3t8dgtmZ/G8BlA86vKz1WXX
         R6J3oAnPmYTfss5X/jMdhW7JR60WNfh33NSR7RIm1ogQC9gWHFrwYv4EmdkxfM0vFOei
         G4kjYZCjDLYSphwhqAg5p8v5XlchT29CehsNSM+PWceAcgzd5hDZzXHhOLBlFmwWUSDK
         kxjbHbLyULo5tfTR/C+XWX/6rMJTA/lSnnKI2CZVTE8R3x0BImunGEjqiyjMydfUZwp2
         KHtskULuyc21pqeB1NUeAtBSMC0khAGd9mH4XHbgZnO9H4V15P9cOudPitRCW1Un9L35
         d/kg==
X-Forwarded-Encrypted: i=1; AHgh+RqO/4mHogoBoHZXcjkHJidmVBT7vvlxfRCs9BX2s7pDF8vhwsewD7iMwqD+cay1Gu7azcHNfCYbIiw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHKSdYrlT4Nqgug6TRjVgOzLyzLnTGxa/y72ink5vNWhlx6JYm
	RDcs8/m9n8QTuU9i0Hl30hNdn9/FXTF9Y62MIUNYbQanZpa8+SXlnUfX
X-Gm-Gg: AfdE7cl74vwvxLvQepxfavzUcCWygyRUBIhqcY2bfKz+nd6lS+ZnjaqOBFTSbaknw+T
	mFsxcPIZwMKO9NJwTDMSGnjVHEYWiC+MUzHTEpy2cEp7khBUqWTwVhwJds0mWJ4t+GZleoFFR8j
	S92VPaCUMPloumjx+p6g5Ap7faHCiMFX8xWwddLwDNG+UF6PqGiq2IbgbfdYzPeKZ4xnLvAZq2G
	i+GfK97aJLANx4NAFnuYpMUqjzt3+ogfj7v3d6e4QM60SSFMC9702K2GL9zWAlkUNmGVI0KIvGf
	xLJV+C5iwFfMrlITKxqT/4r51QzM3YJ5rdZJabn/I15fWNjL5aA9rvTYU3BDOu/leiux/6bFLuE
	a8KlevXZQw2A9pPuMTgwtIpA3Nv+Qm8q3tVgfl7WfCzM01WFuKdcP+oeJ9imLYY7Lp41lyzYS82
	9f4A==
X-Received: by 2002:a05:690c:3691:b0:81e:1543:50b6 with SMTP id 00721157ae682-81ef26fdd37mr30332737b3.66.1784420983875;
        Sat, 18 Jul 2026 17:29:43 -0700 (PDT)
Received: from illithid ([2600:1702:7cd0:e980::41])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81ef42c5c84sm36485547b3.41.2026.07.18.17.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 17:29:42 -0700 (PDT)
Date: Sat, 18 Jul 2026 19:29:40 -0500
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: info-groff@gnu.org, platform-testers@gnu.org
Cc: groff@gnu.org, linux-man@vger.kernel.org
Subject: groff 1.25.0.rc1 available for evaluation
Message-ID: <20260719002940.fdiswjj5n74qrzvo@illithid>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="k5exteptysdhlrbl"
Content-Disposition: inline


--k5exteptysdhlrbl
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: groff 1.25.0.rc1 available for evaluation
MIME-Version: 1.0

groff 1.25.0 release candidate 1, 1.25.0.rc1, is now available from
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


Details
-------

Since groff 1.24.1 was released on 14 March, 10 people have authored a
total of 1170 commits.

$ git shortlog --summary 1.24.1..1.25.0.rc1
     2  Alexis Hildebrandt
     1  Bjarni Ingi Gislason
     3  Dave Kemper
     5  Deri James
  1149  G. Branden Robinson
     1  Johannes Altmanninger
     1  Luis Rivera
     3  Nguy=E1=BB=85n Gia Phong
     4  Peter Schaffter
     1  Richard Purdie

For a comprehensive list of feature changes, see "News" below.

Much attention has been given to fixing bugs, validating input,
improving diagnostic messages, and correcting and expanding
documentation.  The previous release shipped with 316 automated tests;
this one ships with over 360.

As of this writing, per the GNU Savannah bug tracker, the groff
project has resolved 77 issues as fixed for the 1.25.0 release.

Classifying these issues by type and the component of the project to
which they apply, we find the following.

  Type                              Component
  ----                              ---------
  Build/installation            8   Core                           46
  Crash/unresponsive            9   Driver: grohtml                 1
  Documentation                 7   Driver: gropdf                  0
  Feature change               16   Driver: grops                   0
  Incorrect behavior           19   Driver: grotty                  1
  Lint                          0   Driver: others/general          1
  Refactoring                   3   Font: devpdf                    0
  Rendering/cosmetics           6   Font: devps                     0
  Test                          1   Font: others/general            0
  Warning/suspicious behavior   8   General                        11
                                    Macros: man                     2
                                    Macros: mdoc                    1
                                    Macros: me                      0
                                    Macros: mm                      3
                                    Macros: mom                     1
                                    Macros: ms                      2
                                    Macros: others/general          3
                                    Preprocessor: eqn               2
                                    Preprocessor: grn               1
                                    Preprocessor: html              0
                                    Preprocessor: pic               0
                                    Preprocessor: preconv           0
                                    Preprocessor: refer             0
                                    Preprocessor: soelim            0
                                    Preprocessor: tbl               0
                                    Preprocessor: others/general    1
                                    Utilities                       1

Another way of capturing the amount of revision is as follows.

$ git diff --stat 1.24.1 1.25.0.rc1 | tail -n 1
 383 files changed, 50589 insertions(+), 33438 deletions(-)


Obtaining groff
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Here are the compressed sources and a GPG detached signature[*].
  https://alpha.gnu.org/gnu/groff/groff-1.25.0.rc1.tar.gz
  https://alpha.gnu.org/gnu/groff/groff-1.25.0.rc1.tar.gz.sig

Here are the SHA-1 and SHA-256 checksums.

bf5c493340f72ce4ad767081d21019e2c615d7cf  groff-1.25.0.rc1.tar.gz
nPUKoF7UKpPS0jDjdNqnESeDLTe0sVZVrria4ktZ+zE=3D  groff-1.25.0.rc1.tar.gz

The SHA-256 checksum is encoded in Base64 instead of the hexadecimal
form that most checksum tools default to.  The mechanism follows.

sha256sum < groff-1.25.0.rc1.tar.gz | cut -f1 -d\  | xxd -r -p | base64

(Because "base64" reads from a pipe, it doesn't know the file name, and
so the file name will not appear in the output.)

[*] Use a .sig file to verify that the corresponding file (without the
    .sig suffix) is intact.  First, be sure to download both the .sig
    file and the corresponding archive.  Then, verify the archive.

      gpg --verify groff-1.25.0.rc1.tar.gz{.sig,}

    If that command fails because you don't have the required public
    key, you can import it.

      wget -O 108747.asc \
        'https://savannah.gnu.org/people/viewgpg.php?user_id=3D108747'
      gpg --import 108747.asc

    Re-run the 'gpg --verify' command above again subsequently.


Caveats
=3D=3D=3D=3D=3D=3D=3D

*  GNU tools, or otherwise POSIX-conforming ones, are generally required
   to build on Solaris 10 or 11.  See the "PROBLEMS" file in the
   distribution archive.

*  Solaris 10 has known problems with automated tests; see the
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
   operation.

*  The `dt` and `wh` requests now enforce their requirement of space
   between their arguments.  While consistent with GNU troff input
   syntax, said enforcement is not consistent with AT&T troff.  We did
   not add support in groff's AT&T troff compatibility mode because
   we're aware of no legacy documents that require it.  Example:
   `.wh9i+.5+\n(xxuPT` is, while validly planting a trap for the `PT`
   macro in AT&T troff, an input considerably more cryptic than any
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

*  When the `substring` request is given two index arguments that both
   lie outside the string, macro, or diversion's length, it now ignores
   the request (and issues a warning in category "range"), leaving the
   operand (first request argument) unchanged instead of emptying it.

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
   groff_man_style(7) for an example.

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
   document properties includes the document title and author(s); if the
   document calls the package's `TC` macro, its entries will be
   clickable to navigate the document (even if it does not use the `XN`
   macro introduced in groff 1.23.0); and if the document calls `RP` to
   configure a cover page, the table of contents relocates to follow it.

   The new macros `XM` and `XR` respectively set and navigate to
   clickable internal links within the document.

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

*  The new document "groff-pdf-features.pdf" surveys the PDF features
   that groff enables and exposes in its full-service macro packages.
   Thanks to Deri James.

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
Bob Friesenhahn
Bruno Haible
Colin Watson
Dave Kemper
Deri James
Dmytro Bagrii
Hilmar Preu=C3=9Fe
Ingo Schwarze
Johannes Altmanninger
John Gardner
Karl Berry
Luis Rivera
Martin Simmons
Morten Bo Johansen
Nguy=E1=BB=85n Gia Phong
Richard Purdie
Ross Burton
Russ Allbery
Santiago Vila
Stefan M=C3=B6ding
Stephen Gildea
Zack Weinberg

--k5exteptysdhlrbl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmpcGmsACgkQ0Z6cfXEm
bc6McQ//TYaxUe7SCNEAC3/4PCYNRktRntBRvlo4zIBP/s4iAWCrSzNRk1f8lcMI
H9VrzGxoR1ZxpvEiv5CRdSkEllXXEu2Pj00TbP0g0EK4IjaWjE77u9sfG/znDSwO
MwL7FdmMI8aQnypOzBaQREpPnzSucYsIuLgI9r4fEE5PVA+R7/4aDBNvYmaoe+mk
1U3Jxm4kelZx5MuVkFsQ0OIwOYHWfxE0kLNGxljyU2ETl3KG4CyQPStXREpr6fPW
uOxaOGAgYcpI4zkBWk1Hx2T9Jj0uwntIQuiHIwea66VMbNbyyM45eqmST8TyGmqX
4opz7SXC4NI802ZHzWwvcqN8HkizGH/CRemfHqvO/Ppzc9TMohauGBpKhW5WXx8z
EAMkM+yjKO2HVz0IC6vTSuIeFhlYj5pcULc0Hq0k3s3kfJi7crZn29YU/P9+WzTi
3Ri/+diNnB3UxuiFZYVJcN82a+qiPC+iCv8Kd5dZNG3uxeLeR1dLnaCnButqmp58
jYWQtgSsH8czJ7pdGbTyODm2Ck8+LsnhHqNHw8IhgxpK/9su70bUcGv0D5hX6TAK
1y98k1OEzWaRW7FdTwOIUB2cOseBFibdshSX4zrxHZB5ZH+V5apynae8Gi3Xa5gj
QZkXtWeEgg02UwnpAP9ZX/cehX1UerVOHeJxYPSWeqjBdmyN1xc=
=UG1k
-----END PGP SIGNATURE-----

--k5exteptysdhlrbl--
