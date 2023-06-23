Return-Path: <linux-man-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 698F6C001DC
	for <linux-man@archiver.kernel.org>; Fri, 23 Jun 2023 21:00:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231169AbjFWVAM (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Fri, 23 Jun 2023 17:00:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbjFWVAL (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Fri, 23 Jun 2023 17:00:11 -0400
Received: from tarta.nabijaczleweli.xyz (unknown [139.28.40.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BA49C2114
        for <linux-man@vger.kernel.org>; Fri, 23 Jun 2023 14:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nabijaczleweli.xyz;
        s=202305; t=1687554010;
        bh=pKMtAh2V8crI1K2+fNSBpYJETdfdcvQDy2TW2axG9Pg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EiAZ1R8RHMEKa3MMyFx5R0OG8Qw53T1YFxssQXiwO5KIKtlBMvwvwCzubW6Tk0WX2
         hLWevsBGtf8iyRU9OEmdhJANk2NZ8W7o2X9Xa2W/KOcbzDkbnFWJKkAp2OpEHysS37
         r0Ht0Wy87h/rNoqr7dt0wp1JdToqvuRDky1UcfsodRjd8s69kBJLbE8O2BApthZnV0
         1PYo/uBMNbapUW95Egki2ofb97pfZF7UH4YvRyOSfU33PUGnbNZcvUwTqHfJ49Y1Z2
         SsaZCDesR0gyEsLGvOCY+BnrrYEMudc+Xy0jvnn6YkJXkxzXqUwoujm1ORZgi1D+fT
         wey81GUdpckoA==
Received: from tarta.nabijaczleweli.xyz (unknown [192.168.1.250])
        by tarta.nabijaczleweli.xyz (Postfix) with ESMTPSA id 1048A1588;
        Fri, 23 Jun 2023 23:00:10 +0200 (CEST)
Date:   Fri, 23 Jun 2023 23:00:08 +0200
From:   =?utf-8?B?0L3QsNCx?= <nabijaczleweli@nabijaczleweli.xyz>
To:     "Alejandro Colomar (man-pages)" <alx.manpages@gmail.com>
Cc:     linux-man@vger.kernel.org
Subject: [PATCH 2/2] statvfs.3: note f_favail = f_ffree on Linux
Message-ID: <3a449220b1a5b1d0be1749a98e5c284222072427.1687553930.git.nabijaczleweli@nabijaczleweli.xyz>
References: <a24c9d24-c131-5dcf-3089-353e2451a9e7@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="65wzwvitp2bwjkfw"
Content-Disposition: inline
In-Reply-To: <a24c9d24-c131-5dcf-3089-353e2451a9e7@gmail.com>
User-Agent: NeoMutt/20230517
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org


--65wzwvitp2bwjkfw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

It's unclear to me if inodes /may/ be reserved for root at all,
but the glibc comment in the Link would imply as much.

Link: https://lore.kernel.org/linux-man/f54kudgblgk643u32tb6at4cd3kkzha6hsl=
ahv24szs4raroaz@ogivjbfdaqtb/t/#u
Signed-off-by: Ahelenia Ziemia=C5=84ska <nabijaczleweli@nabijaczleweli.xyz>
---
 man3/statvfs.3 | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/man3/statvfs.3 b/man3/statvfs.3
index b1f0e7545..23e4388fb 100644
--- a/man3/statvfs.3
+++ b/man3/statvfs.3
@@ -227,6 +227,12 @@ .SH NOTES
 .BR statvfs ()
 with the argument
 .IR path .
+.SH BUGS
+Under Linux,
+.I f_favail
+is always the same as
+.IR f_ffree ,
+even if some inodes are reserved for root.
 .SH STANDARDS
 POSIX.1-2008.
 .SH HISTORY
--=20
2.39.2

--65wzwvitp2bwjkfw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEfWlHToQCjFzAxEFjvP0LAY0mWPEFAmSWB9gACgkQvP0LAY0m
WPENmw/+IIc7wNQ6HyEJW/NvkW8z7cjjeOIASjw4xp6Q/YpVn9e24vbNKXiVpnzP
bQrYo10HgCAPt/jMSILbW1e+KlLXTcsx1glmlGMk7KZxiWD2EBKm8Rwio5zTTUd7
xb41idy0bKaDtYJBVOabB0swlCwMs3lttcnEFVxkfoB/D2NHmLJwvhtp8MLA9sVA
j5hHyq49vNxK7JajxzCjsbiXNVZVqwIGQl/f0DDF9YdnO9+rNbB9ErQZDelpFQ/w
y9WE/YgjNueGPObI3dDSH2DjrX9r389drNYZAz6d5Piwpjky77AkDXpM6wr053yX
+u3tHk0hMyBKt7rA/AXVfHRc5by4JXSp3QZEeHztpo2V9LpqKg3z1iR+NpmFHVZN
xOIqVNqP9ETRarhpG8ktUh41EJ6ZKvlbhZPxWtSya5xq1IqN8I5Wdrupr3/agz/Z
Z7KIihX9GD3JB2YCtbcmShucLDoNxQ9c9V3ZoLWkk4foMeJ0WRHiJ1Xdd6O8Egvr
vlc5VKkgMWLYE7Hp+zBk0oo0sJ4WkoOytwatG4eRvr7wEeHV1joIwx2HSpfSocEO
HKBmIAwzTaFUUO22AV9AOjQwTMX1BzyAbz4Lni/BSs7uzv1QlFJlvBYnYkx/UENA
SkPm/qd2owh2UDL9rTMVg98EqcKtLWP7CFbOKd2GAQ+/Jj0wqEo=
=Eha+
-----END PGP SIGNATURE-----

--65wzwvitp2bwjkfw--
