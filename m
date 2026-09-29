Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8B939AD34
	for <linux-man@vger.kernel.org>; Tue, 29 Sep 2026 07:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790668481; cv=none; b=kzwUCXYPZI3H5lhN3ZYpJ9VpoqkkaMDu5Ddx8kxZPDejyKjeU4Xb76sqgGM46WGY+bbrakZFPdU/b/v/xpuMobJ5ymWk3LCncu0lGkor0r+6kNxCyZM7aT4QrB48Hdxfw4Zq2IrVR6GgOby3qvNm+CBECKWbqbmyB0J4LZRgkas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790668481; c=relaxed/simple;
	bh=8dFDk/wcicYww4GbFhDzgke17htc8eO1djn6Kr2cWfU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FugHoZak2PZK+U5IPYixXgfiK0QbfmMVr7JHiZ5l8DkcFO0upqGHD1Hohiz0gUF7qpLGB76Q5PVhfYpd8VgqKuQjrHv4VxYMcesKz5A9gVjrOuVtiQY2FrYCnqpvhhcm9c7IvuiTv3dnUp2vRxaqlSuX6Mj6yGJoItJtKgayR3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RyGU2QDs; arc=none smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RyGU2QDs"
Received: by mail-yx2-f42.google.com with SMTP id 00721157ae682-8a45b788a71so31191687b3.0
        for <linux-man@vger.kernel.org>; Tue, 29 Sep 2026 00:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790668478; x=1791273278; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V6ayEDo4dR0CQVojzymb8/NsfycnriQTm9AZuy4exoE=;
        b=RyGU2QDshEUSQJU2ohbakduQc3H17Srq4BWwrz6d055FKG2GUGqMT1u0GcgECxfl/z
         UsFtVAYXjLL6mFF1jgQB/C4tw+yOlPIHAp+y4b8uXXgWIeUOSVD8e0E8JhmhywiN6PLD
         8gl9y3qJn9p5tq2/TEy/0NZDLq0FGsNcQ5XfDWiU67JzSXBcRh5FLznqYxwplCvHIf1a
         xMCI69Ls8aQpqdz/YyaMK/J1Qfuk89Of5kEiR5QUxpwhb2kB7ZTWtXX/ZcdbA5HE+Er4
         igCqWgiuXa3stu6IjDCGrzA5YQ5xnTSD3cV6FaTgFColYO5lto3Jml1YmgluvLhrxphU
         DsEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790668478; x=1791273278;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V6ayEDo4dR0CQVojzymb8/NsfycnriQTm9AZuy4exoE=;
        b=D2/CkfJlmeAoNITTbdAH7bZXghg50JqSN0pR7QL5Sov4Z9JUd1b2tsknZOUkaSggBi
         MNtBIPR/E/v02ejtp8CUrzvV4RAwl5p9DCyAU6r/9kkufJXRpRrPCYMY9CdZE7ckLaDr
         mxTGUt6f7zggg3ESxjWuM6pDfEEfiEE0mNREVdpX34wGCsaBxQjEFErMijfvGs8bp8QX
         6Q3XEGllgPoTziYafnO180PGSrIIbh9slIs3e/SV0/Kq4+zjXUFgdRvaqygfYpuZFjFG
         +6vSb2S4JYL0aDtMhVdg9DDu/zPGXVdXME0n7l+/2eKazOHNlG6+PkMlmALNk1NPwav2
         nrKg==
X-Forwarded-Encrypted: i=1; AKwUvBxMVpCU47UkPRmUYtRXvE1NRnIAKUnzo2tIyiB6ccHTb98jQfbTgkItoB0+GlCtSc707Zn3ME6vZ2k=@vger.kernel.org
X-Gm-Message-State: AFq9FYJFlNc7f+zM3qQx/E7H77NU1GkvE2tfyfdyPe1rqo3Zh9dpLQjA
	CMgfA8N9RB6RmY2kNqcj9ZLwimpUVuYq8SEp3qpzH72PZB3jQUghher0BImxKA==
X-Gm-Gg: AYBFou2om2pJHZGr8cJotvSpuCIZaFRXeknnUU6ueVJqu5518v2eFR+aE7a5kk/H3Pb
	QrLdNdeoHLEkQciHGSqeOGEFJ9LHixsCNKfi91hI2JA3daXP0hcL1c0XNtBKChhpvz6PbzzXymX
	pnhxMoGm+oQ9FxI9ZeKgcm/XbhALWiXsa66XjGwFTHEM6fN9IlKfMgTnYwCNzoOgMy5yVEns6do
	JkODqjoBANRFre1ca6wIjOsy+huszSAARwU/rnlbZNZw54iAf3Vz01TjqCandvYQ0Rm9fabdOeK
	k6MW4bM4q07lmirdyoIhnjwm/Igz3lPouo9oafP09v7OBt3YHWM1V/GH1Ee+vn/OkR07809D+Bg
	q5X1KqA3kZncBKIpZxk4MuGPMNSnaP7RlqLe725ubvSDYrDWD54JIBiJV322gy+yKymfisgZURh
	NpYguyUiTXqip+EZRnVIGIYaeV+AO6sZr93kGQ7HkcKLWTjwsnAE58dwoOBG0=
X-Received: by 2002:a05:690c:4992:b0:882:1d1e:88ca with SMTP id 00721157ae682-8a67953d325mr75807157b3.10.1790668478412;
        Tue, 29 Sep 2026 00:54:38 -0700 (PDT)
Received: from illithid ([2600:1702:7cd0:e980::49])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a860f8d2d9sm56121587b3.23.2026.09.29.00.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 00:54:37 -0700 (PDT)
Date: Tue, 29 Sep 2026 02:54:35 -0500
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: info-gnu@gnu.org, info-groff@gnu.org
Cc: groff@gnu.org, linux-man@vger.kernel.org
Subject: groff 1.24.2 released
Message-ID: <20260929075435.2njsyseqeea6hon2@illithid>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fe7va3alggovyirp"
Content-Disposition: inline


--fe7va3alggovyirp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: groff 1.24.2 released
MIME-Version: 1.0

We are anxious to announce the availability of groff 1.24.2.  This
release resolves recently discovered security vulnerabilities affecting
all groff releases dating back to 2012, and even farther.

Obtain it from the GNU mirror network,

  https://ftpmirror.gnu.org/groff/groff-1.24.2.tar.gz

or, if the network is for some reason inoperative, directly from GNU.

  https://ftp.gnu.org/gnu/groff/groff-1.24.2.tar.gz

Ensure the integrity of your download by checking this source code
archive's cryptographic signature; see "Obtaining groff" below.


What is groff?
==============

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

Since groff 1.24.1 was released on 14 March 2026, 2 people have
authored a total of 6 commits on the "1.24.x" stable branch.

     5  G. Branden Robinson
     1  Deri James

This release resolves the following issues in the GNU Savannah ticket
tracker.

bug #68689: [PATCH] [mm] `mmroff` vulnerable to command injection (CWE-78)
bug #68688: [PATCH] [grohtml] `pre-grohtml` vulnerable to command injection (CWE-78)
bug #68687: [PATCH] [pdfmom] vulnerable to command injection (CWE-78)
bug #68152: [gxditview] SEGVs when invoked with no arguments

One way of capturing the amount of revision is as follows.

$ COLUMNS=72 git diff --stat 1.24.1 1.24.2
 ChangeLog                       | 52 +++++++++++++++++++++++++++++++++
 NEWS                            | 21 +++++++++++++
 arch/mingw/grap2graph.cmd       |  2 +-
 contrib/mm/ChangeLog            | 15 ++++++++++
 contrib/mm/mmroff.pl            |  2 +-
 doc/webpage.ms                  |  2 +-
 src/devices/gropdf/pdfmom.pl    | 29 ++++++++++++------
 src/devices/xditview/xditview.c | 24 ++++++++-------
 src/preproc/html/pre-html.cpp   | 11 +++++++
 src/roff/troff/input.cpp        | 14 +++++++++
 10 files changed, 149 insertions(+), 23 deletions(-)


Obtaining groff
===============

Here are the compressed sources and a GPG detached signature[*].
  https://ftp.gnu.org/gnu/groff/groff-1.24.2.tar.gz
  https://ftp.gnu.org/gnu/groff/groff-1.24.2.tar.gz.sig

Use a mirror for higher download bandwidth.
  https://ftpmirror.gnu.org/groff/groff-1.24.2.tar.gz
  https://ftpmirror.gnu.org/groff/groff-1.24.2.tar.gz.sig

Here are the SHA-1 and SHA-256 checksums.

8f43c4d049207689b85af8a211742d87356e64e6  groff-1.24.2.tar.gz
+cHv1b6743/G4QY9t0c86N8ePgvk/w9DzgT85X6cXdk=  groff-1.24.2.tar.gz

The SHA-256 checksum is encoded in Base64 instead of the hexadecimal
form that most checksum tools default to.  The mechanism follows.

sha256sum < groff-1.24.2.tar.gz | cut -f1 -d\  | xxd -r -p | base64

(Because "base64" reads from a pipe, it doesn't know the file name, and
so the file name will not appear in the output.)

[*] Use a .sig file to verify that the corresponding file (without the
    .sig suffix) is intact.  First, be sure to download both the .sig
    file and the corresponding archive.  Then, verify the archive.

      gpg --verify groff-1.24.2.tar.gz{.sig,}

    If that command fails because you don't have the required public
    key, you can import it.

      wget -O 108747.asc \
        'https://savannah.gnu.org/people/viewgpg.php?user_id=108747'
      gpg --import 108747.asc

    Re-run the 'gpg --verify' command above again subsequently.


Caveats
=======

o GNU tools, or otherwise POSIX-conforming ones, are generally required
  to build on Solaris 10 or 11.  See the "PROBLEMS" file in the
  distribution archive.

o Solaris 10 has known problems with automated tests; see the "PROBLEMS"
  file in the distribution archive.


News
====

This release corrects command injection security vulnerabilities
(CWE-78) in the mmroff, pdfmom, and pre-grohtml programs.  The last of
these is a preprocessor that is run when groff or troff is run with the
`-T html` or `-T xhtml` options.  The vulnerabilities are variously
14-26 years old.  Malicious input can escape groff's default "safer"
mode, running commands embedded in that input at the user's privilege
level.  The groff development team recommends this release to any users
who employ the named tools or GNU troff output formats with untrusted
inputs.

Man page rendering is not vulnerable unless rendering (X)HTML.

This release also resolves a command-line argument processing defect in
the gxditview program.  It is not known to have any security impact.

There are no new features.


Acknowledgements
================

We'd like to thank the following people for helping ensure the quality
of this release.

Deri James
Ingo Schwarze
Pavol Sloboda

--fe7va3alggovyirp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmq7brMACgkQ0Z6cfXEm
bc6BSA/9Fdweu7MKGWeuvo/UfbQgxN3phnOihRjrLQNLZSiU3rnKhRMwz2r3sRtX
zjKeRCfrTafxyPaNNF6CoEl/CSn2Slx7zfAwKF56kqa+GN+TlMqWPEFsXu5w9MYY
73/kkVCUPfoFu8X1+TSiBekr/wPlFt7X9H9DI/hUt2gujozSTuquPWjd81+AHjt+
zseYC4lmrSPWaWUr5gyUOflxm0za/c0XKOn41Sm1Tu6vyNF/tAyd3emC4t1j6Kgq
zpUTFxPR76FZWHxBWYthjmiBe3oEx+a9iU9Ye3srsdHUzDp9VEvvwvpMlkNsUGK8
gDIYMC29gIJNeN5xwNeuS30kgS5LvhNka+dUD4ZHsWkuNUg4PBMgp3+VH0Y/t2R4
C7g2bQathNuXXMem9CM/ANby/v7d6M2+xeJTcKTUiDWaQ5GG8/ZGfR3+Kn65yuOP
LlR5QWH9qlUc8jPvOSnHjxC8rFgcdPuIFNlxykXawg6fV+gj3SIs+ChAaCLqniM4
vyL63WRHNWPE7H3q7bGvG2xEjxHLgKTjw1+fhXS2FDWXDuoXg4XKp9hXWsRSt2uU
1UgBvnaf6knOgBjHrXzrl4HfYJpleBzJis+S6KVG6VMynYOFfwPBZCFZNiraDbhR
reOcLhMsQ0K89OrYzcFByngceF89RJZ5/fNQdXbPprqjJBKbBa8=
=pwuZ
-----END PGP SIGNATURE-----

--fe7va3alggovyirp--
