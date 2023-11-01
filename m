Return-Path: <linux-man-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B583EC4332F
	for <linux-man@archiver.kernel.org>; Wed,  1 Nov 2023 15:00:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231688AbjKAPAb (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Wed, 1 Nov 2023 11:00:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231403AbjKAPAa (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Wed, 1 Nov 2023 11:00:30 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C653FC
        for <linux-man@vger.kernel.org>; Wed,  1 Nov 2023 08:00:25 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C8ABC433CA;
        Wed,  1 Nov 2023 15:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698850825;
        bh=GAIeJbZ8lYEXI2X9IlZ9QzUpQk+Eqa0FUJHqd3XYSH0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dZM9/TlH2RijJpBhOSCLsvexdIwICv1Yo4/7i3ek1PQ4k5kedK8sJah3pw5GJSLWR
         2S6hwCZhGUvBfEOGUjp4YGPj9yJLnRsa5FBz5gxHdP4lbJH7zL75oI5H3lXTkAal5E
         0g13SKko9Hwtpr0ZXF7XZ7iLlUDiHTp3k0LlknSTDvKx6OBcdcqUM3abHLXZ68W6qW
         2uE1LY42ZG+/hZWqx8jtgJG9945FsDpKPQbeE0tUbZd5Nk1903VGMyMkfXU7sleZMz
         S9cB508acVaID0cHjhx0n4xPZYT13GqGu3KTtwZj+Zfv4phapR4exp/zeop9nyp6Ce
         vlGDoT5SiWTkQ==
Date:   Wed, 1 Nov 2023 16:00:16 +0100
From:   Alejandro Colomar <alx@kernel.org>
To:     Helge Kreutzmann <debian@helgefjell.de>
Cc:     mario.blaettermann@gmail.com, linux-man@vger.kernel.org
Subject: Re: Issue in man page clog.3
Message-ID: <ZUJoBtadvsPTwFXh@debian>
References: <ZUJaYtPeCL1kXYwl@meinfjell.helgefjelltest.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="BAtQODz/5IGYvp4x"
Content-Disposition: inline
In-Reply-To: <ZUJaYtPeCL1kXYwl@meinfjell.helgefjelltest.de>
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org


--BAtQODz/5IGYvp4x
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 1 Nov 2023 16:00:16 +0100
From: Alejandro Colomar <alx@kernel.org>
To: Helge Kreutzmann <debian@helgefjell.de>
Cc: mario.blaettermann@gmail.com, linux-man@vger.kernel.org
Subject: Re: Issue in man page clog.3

Hi Helge,

On Wed, Nov 01, 2023 at 02:02:10PM +0000, Helge Kreutzmann wrote:
> Without further ado, the following was found:
>=20
> Issue:    [-pi,pi] means both -pi and pi are included, this does not make=
 sense, either one must be out of the interval?
>=20
> "The logarithm B<clog>()  is the inverse function of the exponential "
> "B<cexp>(3).  Thus, if I<y\\ =3D\\ clog(z)>, then I<z\\ =3D\\ cexp(y)>.  =
The "
> "imaginary part of I<y> is chosen in the interval [-pi,pi]."

I don't know this function.  Please suggest a fix, and CC glibc so that
they can review the change.

Thanks,
Alex

--=20
<https://www.alejandro-colomar.es/>

--BAtQODz/5IGYvp4x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6jqH8KTroDDkXfJAnowa+77/2zIFAmVCaAAACgkQnowa+77/
2zLAEQ//fEXasWINXR3WIgPTS00uvfeOY7bHf2UyCS9G6EX3CXM1SY9NDnWuIHZl
hrxI7RxEmgIQDMVmD8y4RYMEfs/3Cg0M8yczVbEVktNkyOcPucCHrAKUKrYa/I/k
Brw3MZbscUIsa2FYUlMNW03RZM2UkePeSntf1esTsDPsS29RH6ndLr90c5y7H0hi
gHAzLYchMogf27f2kHIp/+o6aLooMQNo2tKm6nChLt/RW2s1HlT5Eyo3RvKn8s/7
xdqRFLp2jPgxtgjMqsiXUc5QRndud9IiDQsEUL9L2pzDrIJucy31oVdskDhQIGs6
CA2l9aboI7qcyY/prSqQb69qaYqmWgOd8B2wkWj+rb4FKiBbDdnNyyL5SNQXSsJR
17zhl7hKFsgLBR77Uvcu4GHWqiQMhjOAX1DjG6AKKj4FUwxvhFHofDvDtAGeDk4k
0uaKCRYMbv3ig4ElV45uMkm17KLurf4DIrchE5NpP+ieaVyuljraqlbx2/6eN7yg
qgqMS+PGI8Z9qVYKSOi6ysVgfOcKHhkZZXX5SAZhehAKiq6PpFiJmVksxKE2yLhN
lQRSwH6dc0EuPB5y0u8iKgkaVDLTL+/QoE1um2NDn4HOoyUNPNUJZEd9Qcsu+N89
L3yvAsOnHeUbDxeefbtzOlKVTv38K7ZwJ2LZ/SLcuvtFLnoJLE8=
=1k0t
-----END PGP SIGNATURE-----

--BAtQODz/5IGYvp4x--
