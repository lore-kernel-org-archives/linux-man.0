Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6777FC43334
	for <linux-man@archiver.kernel.org>; Tue,  5 Jul 2022 16:22:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231402AbiGEQWG (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Tue, 5 Jul 2022 12:22:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230432AbiGEQWG (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Tue, 5 Jul 2022 12:22:06 -0400
Received: from tarta.nabijaczleweli.xyz (unknown [139.28.40.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B3B101ADB9
        for <linux-man@vger.kernel.org>; Tue,  5 Jul 2022 09:22:05 -0700 (PDT)
Received: from tarta.nabijaczleweli.xyz (unknown [192.168.1.250])
        by tarta.nabijaczleweli.xyz (Postfix) with ESMTPSA id 04BF3E9E;
        Tue,  5 Jul 2022 18:22:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nabijaczleweli.xyz;
        s=202205; t=1657038125;
        bh=Rsut/BLg5DbOV6Q80ewvs1YsVKlhBgM8FK/kS9fIdkg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gEqoL8bEy2cemfuoIDfh93NJhzZnv3O/CvsinaBWBYQzDcu67UPYjCfZylD7tabGK
         05RgLTy/Pc6uuHKNu74kvJrcy+AkZmeBlm6CR+Yckva8JTI7eIOhlpHGFeQiV+NLAa
         kHLz+z3LI6aZFNPo4c8eU34H/9pBgWEqP0K//C6/XTZvDKpSl9c8L45FNSahzrCgyh
         tQeRYhY/OI8JnalarJuyRhRMRfNbKz9BHVy2nHlxNZKeLYbaRZfBA3ST46fBXhxir9
         HoZlV9Y1BEtNKIKtPEH6szM0NbZ2oZKsA6ylDB2E/kQ/4Iy8pkKcufBnhjX5mgWlhJ
         n2Jw6UMs1VMEFnAzUTCQFngJY/BXRGvSvi2p8nnVEwPz1efbhKspaiWpw0xY5IRWZl
         KAYLDcZDlWGfkCTilMJaaz7ois3GuBKzskwQlWfV+/Jwy9lg5ut2C6UnnBMVlT9eCL
         idkUPU3F/HP240AcT8C6wen0VAJ+H93us0frYmccCdvH4IK1et/ypZP0OF8e4hWV1B
         sCadfwfZ5w4j9WukgbOfBg5WUyEMvMNQ7a6RzULLqDsLNfMTNtvPhBCUDcXU+UJoSY
         BETjpvnZ63FAMZSQXohbSkwKaCy9fABFM6g1SiUaVKrvrULszUAG1FO/SPCdrTvOdv
         DofGLPP6fv9B0Yzo6xlyuCpE=
Date:   Tue, 5 Jul 2022 18:22:03 +0200
From:   =?utf-8?B?0L3QsNCx?= <nabijaczleweli@nabijaczleweli.xyz>
To:     "Alejandro Colomar (man-pages)" <alx.manpages@gmail.com>
Cc:     linux-man@vger.kernel.org
Subject: [PATCH v2 4/5] fts.3: list primary modes first
Message-ID: <bf985cca61ea76e5cbba712ce1085a7ed9898d3d.1657038020.git.nabijaczleweli@nabijaczleweli.xyz>
References: <552ae4935239ba9240303b1802bd3c8913b564c5.1656887003.git.nabijaczleweli@nabijaczleweli.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="f6jzqescwrlkgmpo"
Content-Disposition: inline
In-Reply-To: <552ae4935239ba9240303b1802bd3c8913b564c5.1656887003.git.nabijaczleweli@nabijaczleweli.xyz>
User-Agent: NeoMutt/20220429
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org


--f6jzqescwrlkgmpo
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

FTS_LOGICAL sorts before FTS_PHYSICAL,
FTS_COMFOLLOW modifies FTS_PHYSICAL,
the remaining flags follow in sorted order

Signed-off-by: Ahelenia Ziemia=C5=84ska <nabijaczleweli@nabijaczleweli.xyz>
---
 man3/fts.3 | 42 +++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/man3/fts.3 b/man3/fts.3
index 7afaa0da5..b49d85adc 100644
--- a/man3/fts.3
+++ b/man3/fts.3
@@ -376,12 +376,6 @@ The options are selected by ORing
 the following values:
 .\" .Bl -tag -width "FTS_PHYSICAL"
 .TP
-.B FTS_COMFOLLOW
-This option causes any symbolic link specified as a root path to be
-followed immediately, as if via
-.BR FTS_LOGICAL ,
-regardless of the primary mode.
-.TP
 .B FTS_LOGICAL
 This option causes the
 fts routines to return
@@ -399,6 +393,27 @@ field is obtained via
 with a fallback to
 .BR lstat (2).
 .TP
+.B FTS_PHYSICAL
+This option causes the
+fts routines to return
+.I FTSENT
+structures for symbolic links themselves instead
+of the target files they point to.
+If this option is set,
+.I FTSENT
+structures for all symbolic links in the
+hierarchy are returned to the application:
+the
+.I fts_statp
+field is obtained via
+.BR lstat (2).
+.TP
+.B FTS_COMFOLLOW
+This option causes any symbolic link specified as a root path to be
+followed immediately, as if via
+.BR FTS_LOGICAL ,
+regardless of the primary mode.
+.TP
 .B FTS_NOCHDIR
 As a performance optimization, the
 fts functions change directories as they walk the file hierarchy.
@@ -430,21 +445,6 @@ and leave the contents of the
 .I statp
 field undefined.
 .TP
-.B FTS_PHYSICAL
-This option causes the
-fts routines to return
-.I FTSENT
-structures for symbolic links themselves instead
-of the target files they point to.
-If this option is set,
-.I FTSENT
-structures for all symbolic links in the
-hierarchy are returned to the application:
-the
-.I fts_statp
-field is obtained via
-.BR lstat (2).
-.TP
 .B FTS_SEEDOT
 By default, unless they are specified as path arguments to
 .BR fts_open (),
--=20
2.30.2


--f6jzqescwrlkgmpo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEfWlHToQCjFzAxEFjvP0LAY0mWPEFAmLEZSsACgkQvP0LAY0m
WPHzIg/9G4NrnEkvWfzo6pW9kqzXhOhCxv7JLZlwKUQjBI8X8j26T6Q64xy+Lb4M
qrAJt44McsCH7bu64G8UPmdT4c72NrohZoYbzXQ0MAdpKDJHKH05a7dI6aOgoQcL
SiuLKVep+Q9DNd2mntynfxwWujzHwkMovCfHQF1WL15Ddfdw7L9LMkaSiochX9/o
M4DYkBwGOOsIKDWju/dutpejQ+8QVJZVKX0gq2YPME22/MbzqQevdNzaCpNMxp8G
QSqTcJ6SlCkuvcqlLs/r4qh4UVpyyYwmvosoyfGY3QOspCl1bOZ9KU4z93jfD+bV
9RbtRskJ0uAvBAIdLCxsOYmxefOhi2Mdok1MhzjAeEY6OSI0M/BGO8MS7CWGmiNa
1rV6L1l9TXvYRB0KremGANMigt48RPtK1XHmWuqlV8P0mTfgzR55vLZer2EDcn+x
9Q+nrgQrPaQBGP8Jd1uw4CZRsZ9glRoGRuyt4I52EK6QGCKeRiDPRwbivOKvwYtA
Dm9nMUzVQ6F7g7JoRwgt/beeV4KSeleEGED8cO8MzeXGaflXUWpgQlnjf3JCUuvP
SVK1dkJpIbK5uJ3RPplZGc0V5IEOI5OMvr0BNMVB5V+DxA9j2/lnTNwcaXmnwbvo
BrPBeUiwna8m2urjfcezEAV2y2I7bl286dFgF/a0hukqXBx6dZ4=
=NLEe
-----END PGP SIGNATURE-----

--f6jzqescwrlkgmpo--
