Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15788C3F6B0
	for <linux-man@archiver.kernel.org>; Tue, 26 Jul 2022 17:55:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239838AbiGZRzG (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Tue, 26 Jul 2022 13:55:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239856AbiGZRyr (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Tue, 26 Jul 2022 13:54:47 -0400
Received: from tarta.nabijaczleweli.xyz (unknown [139.28.40.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8A6CB326F0
        for <linux-man@vger.kernel.org>; Tue, 26 Jul 2022 10:53:43 -0700 (PDT)
Received: from tarta.nabijaczleweli.xyz (unknown [192.168.1.250])
        by tarta.nabijaczleweli.xyz (Postfix) with ESMTPSA id 90E83B8A;
        Tue, 26 Jul 2022 19:53:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nabijaczleweli.xyz;
        s=202205; t=1658858019;
        bh=QVR0Jgkjq5Laodr8DBLDsGy/COfNGcHfOzAoZBzW6J0=;
        h=Date:From:To:Cc:Subject:From;
        b=sdRT62eGPVo+bfimBFZs4IIFTjaEzuPQnty6LoIx0UMikIbfhgJxgFb6LtyFc0x8u
         Zcs5FTeexhToD4pTo3biyBNFwlV9Z2YDowCg0IUdGov8BbtRyGhth8y6wpstWpBc93
         88XbjxK5gO1RtShfD7hWGcjzROoa4qNeIiDejAnafmMVIsnb2Ro/gGY6tfjqwYSpA/
         l3MUkH9h4DaztCdIQP+7ygLh+whRvddYUzBiKRxz90YBCE7bcUJt+LIq6RAOXZ3yM6
         xQC890BJ27J4rhSHaueiyVpRh+auvewNSZ9uein+fzG8kdmhg6MCvwbKcnwvCZE2Rf
         9brZ4v/0ZO3nEHeEC4o/e26PmH1rhJmpvIuzn1vOpk3I22b2RD9nAWXG2VzbuINTPU
         AoSO8JpKdhR+SeJSoHNUdckd+TlTITQv6ZgUd+7HGo262EELVuTYuWs+KfuAry1Eo4
         wsZ7+A6jxYdBfX3eKSDRMPQ8fZwTwpqCvM5vFkwyUnzrNhbl0P1hbsCjspvTbmIv1P
         mK2GFCegNHoVFXfG79SQY4J86eT8UJVB08ozLFmmaTFBsZ6EGx4DT1+eH9Ln9zKc/6
         Ie23YH30aGyBvuz+yo3r1c+SeHvu9ieIciQxpsvMQmRo8RhD465cuJS4+QrOYRuMI2
         8Y+RaMLriWgG28qRvXnqobcM=
Date:   Tue, 26 Jul 2022 19:53:38 +0200
From:   =?utf-8?B?0L3QsNCx?= <nabijaczleweli@nabijaczleweli.xyz>
To:     "Alejandro Colomar (man-pages)" <alx.manpages@gmail.com>
Cc:     linux-man@vger.kernel.org
Subject: [PATCH] strsignal.3: fix str(d)abbrev typo
Message-ID: <20220726175338.o6kto56ogecrhzgs@tarta.nabijaczleweli.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tgmx3zjgvae5ddd5"
Content-Disposition: inline
User-Agent: NeoMutt/20220429
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org


--tgmx3zjgvae5ddd5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Ahelenia Ziemia=C5=84ska <nabijaczleweli@nabijaczleweli.xyz>
---
 man3/strsignal.3 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man3/strsignal.3 b/man3/strsignal.3
index 047da6ca0..fc376e2ac 100644
--- a/man3/strsignal.3
+++ b/man3/strsignal.3
@@ -149,7 +149,7 @@ Present on Solaris and the BSDs.
 .PP
 .BR sigdescr_np ()
 and
-.BR sigdabbrev_np ()
+.BR sigabbrev_np ()
 are GNU extensions.
 .PP
 .I sys_siglist
@@ -157,7 +157,7 @@ is nonstandard, but present on many other systems.
 .SH NOTES
 .BR sigdescr_np ()
 and
-.BR sigdabbrev_np ()
+.BR sigabbrev_np ()
 are thread-safe and async-signal-safe.
 .SH SEE ALSO
 .BR psignal (3),
--=20
2.30.2

--tgmx3zjgvae5ddd5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEfWlHToQCjFzAxEFjvP0LAY0mWPEFAmLgKiIACgkQvP0LAY0m
WPFtmRAAs/OW5b7elSkpwsOymA1VF9dKZSDyHDyrgOUrxfq1Uwz8kIGufIHwO1KS
Xr4G7B3EGdrnab0dPGSEQbTW4Ki1soIua6ZpTAwbnZjqp6onMRkWfEky7wcQ6kGT
Av0qGQ2dZCqGpCdl6jg55D4AnccmBWwrb6MHD3138lblOGwFvwBFdTboMo2JX6a9
0r8IurauEPPoTFnttZTfgRYvGo6Nfj4XMh8kgAClgoKxPpWMiB99XzSz/ZoOuIkX
PBDdKmy8LNgokiBVKQH7HUHwf1LJWMhJzg0b1PnI2EE06mq71bpy3k6+SBoaJEos
zKLFgl1dJbkLweuU+rpQE/eIVUK4MJhKOVNi/YPAvK9gO5XeGcgCdqz9C4YnbssE
5ETKlnI6uaTdFlDyz84e5TsbZ50AX3+h+dcZJmWMLfNcccRDvo6cfQswNP3Evnsi
NDfFYSnrWkzZu3SD9ITZmzj/j5Pq0IG4HOPw5E6yRwUW1tEe+Gs5sXwv6I5jFkDG
c0o8vJHYxZAE91abgBV1W5H0VB54YJ0OaKom2XGeJt5Msvht5WiX4Xa+15mZVfys
V56tkO73XCWRbEdmMvjO3ORH1eKH859dBnzXHlVsA47wiWkrewvMfEIG0nYEzHim
iJjnff+P8ROCaS8gSnMZl8ohKFRve0MzUXEHcGd2ygLHsDpOf+E=
=smMk
-----END PGP SIGNATURE-----

--tgmx3zjgvae5ddd5--
