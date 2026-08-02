Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5CE1EFFA1
	for <linux-man@vger.kernel.org>; Sun,  2 Aug 2026 02:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785636988; cv=none; b=kyz9QaN8jWMjgLKJAUdyWYHV4UiHYkYQDxHlTJQCuZI//wzjPRZOW3YsRK2dGcmS7xGDAFsWJBqSVw7/XtIlOTx7IIR6Ys/vDp87E65WsI2k51sDGo7EWHjoUJqyaBySHbAE7PshC2yorUfI5O9J2/wNe/bIgAwx7zYodK60M+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785636988; c=relaxed/simple;
	bh=0p+68YMTFa6MesKmRo7pioMsj5k+b3uS+F0hQ5+XQhg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XKcP1OOLGztF8DNqVJpL1J6lzbci6siehUJJXSgTjW5Mz//iO0ofTIplQf4eaVIldRVIYkyckYqGQuc0B8dSL6/B49HZ4p5jw86nltSi0Bcjfb+0/bJUlRY+SNzuJpxbqWP2ESS2NSVCIo8y6HyaKVHkT3dguwewnmh8NnIQhHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hd7lE8eK; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hd7lE8eK"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-81dfdbd86d1so22911927b3.1
        for <linux-man@vger.kernel.org>; Sat, 01 Aug 2026 19:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785636985; x=1786241785; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lEkuUlXBTviG37oQcBelJ4P+jf01CWq4srr8iRZqfm0=;
        b=hd7lE8eKAsGFQql+i4wBzYJY2KPHTPL5VE7QsWMuHZUa/zhYd1tamewFfZKc960ARn
         gLWprLOTL9biFW9rV5htA/xxddyEgERT7QsYoBzUT4/wsTIirUR0LQHwKE9NcMrpHb/N
         4does0Gl+hS/gxqfrhmFcX6x8dXJ3gDs8KG/OF6n9X0I0mp0763QOYMOk5puFra6cyIa
         +26BNGHeRMcdDt60DlY/EtSEw893FQt/Ta4cpcRWKCvtAlyRwkj0tWV1EZOBrIX12rJ9
         E/uX1mGjbVtqDA7VnaWCxFko3MCmrl2pZ4RLPwvegvvpSLQAXwfKDDPxTOy+s41mK7DP
         kXJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785636985; x=1786241785;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lEkuUlXBTviG37oQcBelJ4P+jf01CWq4srr8iRZqfm0=;
        b=YJG4lWBFQNoEna/Kd+TzQ+33EaKIzdUUROnWU9FfD2RVlEv5TfBoPXWPftOCBcJeto
         fmrV4VGZPun+om9L7NIKSa+fJa7Vt7AN+v+CW9BpZcIEHRDBo7iAjFgsNcXWNaPPouaN
         kUF/M9Cv+JoDfO4RndnwPB55w930dFR5zCj4RRrVq3Jexf8yqjLAUe8gaRRf2tLC9pbK
         lsPtUitxFM1/ILZf+SeNmDI+7TG4cnXmuxIrrGLI7sqiWiiQ+eUQ2koGCdweGui1GHMJ
         X40bjjEb1GGxMlpeg0jXvpk7705gdxJQDgQO8JA1rvg4CVLkVnm/4YTHWuihHvbUwMhb
         RBUA==
X-Forwarded-Encrypted: i=1; AHgh+Rpe5kyqa67l6Si67ocqBEBEpLigmxwhFv4wmx/8v5iSpaERvBLM4G0JR6+j4/2ZmO0Dsim3rAoucts=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk/DbPGfn57FD2a5B6OsvN0XGfqYjY5L6xdO8nhzOqxBrkkOVr
	3y3tYsf0nOnGmsTOV5p07bXo9X0TZEHXQL5u44e8oeUAfrhzH7n4BBzj29PRcZ0J
X-Gm-Gg: AR+sD13/AaB95A34lxZ2zEvafzjxEzgXal2u4afqAKXADkhqDByBkpzmN5AMHCvDwEJ
	7kAHJ7sypSLmKuEv4IAUAOZatLmhsQfpq2nRbMd272T6pUHaNdWK8QExzrCLUGctpwSglHbTpax
	2J/kET2eWhx5/YdBxjyTrh8Sbw5JlIM9XgVNB5JaZOReKd5wb3KhnSpH75ZMBans79znZ3Oq/5s
	jm6vj/Kvng3jqDLIZO+vwfqZHCxJ4KS4cwXGlhUAi92BciKbJ6HR1DRZzDr7YsLa0Vhnn7cqM7W
	GMiJ084SbA1YsgEHIQwXLRcali3rAk5gagAe40xxGEKr9D3Pei3RdSpntm5G32j+R2GdJRtx0Xq
	PjvRVvCFSKvU17GdbkrsVASxrJ6TgmMnQxluHalBYD38xsgS5/ML6AfsYrbL6dbpkrBatVEflA/
	U7Ixij44yB4OCnuAjXfKZJFS6lIqNPLmqfohS1dCvbEG0geZDAJg==
X-Received: by 2002:a05:690c:b12:b0:81e:8383:851c with SMTP id 00721157ae682-81fd4a4d344mr82398937b3.13.1785636984947;
        Sat, 01 Aug 2026 19:16:24 -0700 (PDT)
Received: from illithid ([2600:1702:7cd0:e980::41])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fccf60a76sm33225887b3.13.2026.08.01.19.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 19:16:24 -0700 (PDT)
Date: Sat, 1 Aug 2026 21:16:22 -0500
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: info-groff@gnu.org, platform-testers@gnu.org
Cc: groff@gnu.org, linux-man@vger.kernel.org
Subject: groff 1.25.0.rc2 available for evaluation
Message-ID: <20260802021622.tuqhdcsans6z5sib@illithid>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wth6cbbkhpgmgtdh"
Content-Disposition: inline


--wth6cbbkhpgmgtdh
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: groff 1.25.0.rc2 available for evaluation
MIME-Version: 1.0

groff 1.25.0 release candidate 2, 1.25.0.rc2, is now available from
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

Changes since groff 1.25.0.rc1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Since the groff 1.25.0.rc1 release candidate was made available on 18
July, 4 people have authored a total of 67 commits.

$ git shortlog --summary 1.25.0.rc1..1.25.0.rc2
     1  Bruno Haible
     1  Deri James
    64  G. Branden Robinson
     1  Richard Purdie

Thanks to Alexis Hildebrandt, Nguy=E1=BB=85n Gia Phong, Bruno Haible, and E=
lias
Hasas for reporting defects in rc1.

*  Several memory management problems, including 1-byte heap
   overreads in multiple programs and one heap overwrite in troff(1)
   when constructing a diagnostic message, have been corrected.

*  A potential signed integer overflow in troff(1) is fixed.

*  An assertion failure in grops(1) is fixed.

*  New automated regression tests accompany several of the foregoing
   fixes.

*  A missing prerequisite declaration in an Automake script is fixed.

*  The "configure" script is now less easily fooled by an installed
   Ghostscript's copies of URW fonts.  See section "Feature service
   levels and URW font support" of gropdf(1).

*  Diagnostic messages in glilypond(1) and tbl(1) are improved.

*  groff now overrides Automake 2.70-2.72's imposed preference for C11
   and C++11.  groff attempts to employ only C99 and C++98 language
   features (plus some Gnulib extensions).

*  groff's build confines itself better to its own build tree when
   employing its own tools to generate its documentation.

*  Building groff from its Git repository now requires the
   `--enable-maintainer-mode` option to its 'configure' script.

*  Documentation is corrected and improved.

Details
-------

For a comprehensive list of feature changes, see "News" below.

Much attention has been given to fixing bugs, validating input,
clarifying diagnostic messages, improving memory management, and
correcting and expanding documentation.  The previous release shipped
with 314 automated tests; this one ships with over 360.

As of this writing, per the GNU Savannah bug tracker, the groff
project has resolved 90 issues as fixed for the 1.25.0 release.

Classifying these issues by type and the component of the project to
which they apply, we find the following.

  Type                              Component
  ----                              ---------
  Build/installation           11   Core                           50
  Crash/unresponsive           15   Driver: grohtml                 1
  Documentation                 9   Driver: gropdf                  0
  Feature change               14   Driver: grops                   2
  Incorrect behavior           22   Driver: grotty                  1
  Lint                          0   Driver: others/general          1
  Refactoring                   4   Font: devpdf                    1
  Rendering/cosmetics           6   Font: devps                     0
  Test                          1   Font: others/general            0
  Warning/suspicious behavior   8   General                        15
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
                                    Preprocessor: pic               1
                                    Preprocessor: preconv           0
                                    Preprocessor: refer             0
                                    Preprocessor: soelim            0
                                    Preprocessor: tbl               1
                                    Preprocessor: others/general    1
                                    Utilities                       1

Another way of capturing the amount of revision is as follows.

$ git diff --stat 1.24.1 1.25.0.rc2 | tail -n 1
 396 files changed, 51411 insertions(+), 33537 deletions(-)


Obtaining groff
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Here are the compressed sources and a GPG detached signature[*].
  https://alpha.gnu.org/gnu/groff/groff-1.25.0.rc2.tar.gz
  https://alpha.gnu.org/gnu/groff/groff-1.25.0.rc2.tar.gz.sig

Here are the SHA-1 and SHA-256 checksums.

9baf335516459c38d869e58b6c9425d91024ade5  groff-1.25.0.rc2.tar.gz
Xl5/las/1lnyhIQiCI4bmTPRaj9DowvyWPCTlVwxLm0=3D  groff-1.25.0.rc2.tar.gz

The SHA-256 checksum is encoded in Base64 instead of the hexadecimal
form that most checksum tools default to.  The mechanism follows.

sha256sum < groff-1.25.0.rc2.tar.gz | cut -f1 -d\  | xxd -r -p | base64

(Because "base64" reads from a pipe, it doesn't know the file name, and
so the file name will not appear in the output.)

[*] Use a .sig file to verify that the corresponding file (without the
    .sig suffix) is intact.  First, be sure to download both the .sig
    file and the corresponding archive.  Then, verify the archive.

      gpg --verify groff-1.25.0.rc2.tar.gz{.sig,}

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
   operation.  (However, see "Other differences" in groff_diff(7) or
   groff's Texinfo manual regarding `rm` and `rr` request behavior that
   is discrepant among various troffs.)

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

*  Building groff from its Git repository now requires the
   `--enable-maintainer-mode` option to its 'configure' script.


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
Chet Ramey
Colin Watson
Dave Kemper
Deri James
Dmytro Bagrii
Elias Hasas
Hilmar Preu=C3=9Fe
Hubert Garavel
Ingo Schwarze
Johannes Altmanninger
John Gardner
Karl Berry
Luis Rivera
Martin Simmons
Morten Bo Johansen
Nguy=E1=BB=85n Gia Phong
P=C3=A1draig Brady
Richard Purdie
Ross Burton
Russ Allbery
Santiago Vila
Stefan M=C3=B6ding
Stephen Gildea
Zack Weinberg

--wth6cbbkhpgmgtdh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmpuqG4ACgkQ0Z6cfXEm
bc7RVhAAj5q+LRMA08j8cneyGFQmeVjDrjHtCzzElswQBRk/B7HjjfxIKESVCRCQ
uCPVSVKNjDo0rbpmByYaxNRhKpWHfQQfs52beipIWLdO8LXAKDs3fCoLOCzrm2wv
qdn2yrUytW5h0ut1Ga17950CCR7/KWTl7qrOm8v0ub3BcFWkAylF1y97Gwb01l47
CuxWGkAIyEhn8Kv0nWVhcYEIooHA6XmjHDer08yTMCug1WMeURA9UfEQyOMONaAe
OUR6tKmMiA/QnIjiJ0mw73+r5YUCkumrbI/WguBohAiZdnSeYVvDGCR7uwIi5Y5D
LmF60Jwt8eSHNzFSUyhRm31Kzfqxw4/CL5vw2trgtrFkg/87b9r+3FTw1srleH91
bf/qCny7Zka5iEazdwQz4Mkj4eQb/Iaozs4bsYRiuXivU/WHzRKx9CC+Z0pawWvP
Zak7h8vHQT6LOSMVMUqN2EsaghY0HXFbFgYcijkaPSbc2VzLHHojXU5bYpTahXnV
0OEpHE6QWkN9Qgjbb8NLGxFoBI/06Uv8O1qG2ymaOC1IlmmdGggEWup8GUMqcQaP
ChtBT8XP9oBK1ai9t9OG5kzF6gZpQGvQZuhUKjLaqJbga5ShbDYUDDSdcu6vpJDU
P2Vi22p+d/leVpq6Tg5XNBRLz8HuXhsv6LqYeVbrEsvcrbtat60=
=QguQ
-----END PGP SIGNATURE-----

--wth6cbbkhpgmgtdh--
