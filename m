Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793466522;
	b=KuOEV3Qu76PwqQnomT8FQRBom0ZDs8zZ1YeIcDOMFJpbMSVFU9jZJrHtw6bMK3Y2mhw/
	 mReYtZ3PjGZpUeAFDckNxohkuGeGf3ozTswAhqKdpsDdY/cPT9s/Bf8iVt3qZv6ahNVCU
	 rO1i7rLqsK0cxXDy8eFkxbXC2IsqBy0XrzjNMtIyhYTBggkh8x9GrSu8W9lAaHqc5xc/S
	 rs3hRSmIAT3bTwl5+TrmcTHKGQY/Z3HrcxqpbPpH08Kr1yLS/uenAmcDvq8rLgFl2DOGu
	 iuRtciQTAcrREdvO9TgkeYJxoqUW6WocEoX7B5SF3hJ8iAmpITk9VRFCmT8ATnMFBbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793466522;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=21P9/PwolDvPXYss7frv5xHk9YLi7+47ydTK++KzAk8=;
	b=F0t6AAip3JeROkBxJ5R7Lsp9A7Apm/ulfzmwn9aZrdiVOGREFSh+Dk42jsgzogVHdS+S
	 D7es92AwnKiZmIboaYVFaixLbxHZ7oDLNUsxd69EPK28hxvBf1aeOd6D9Ry/tbgEm43WI
	 kTUueuVwlxQhVC+r4Ph36WvU5XZlXSMGu0VPTIMIGLpIGijwlETf09rUyTeUr2eXOUSGr
	 PLpYGVIL/zwgZQXSCaOKYtiKeL0kTtaRtqr8GuN6aVFGxwQsIO+QvbC5nJg5eb0+TBOSg
	 pjLs6Co+qSy24cCCYZN0fnS6fOEkgLJFvH9iEa5BZTfSi6jbJSvIAdl80s+heh6koPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="K2qj2Ow/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A712606A31A
	for <linux-man@vger.kernel.org>; Sat, 31 Oct 2026 17:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K2qj2Ow/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 279C61F000C1;
	Sat, 31 Oct 2026 17:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793466522;
	bh=21P9/PwolDvPXYss7frv5xHk9YLi7+47ydTK++KzAk8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K2qj2Ow/c0ON2SbANsZHcn9iMFYp+YzFfhifIOM0hH2hXclb2HLDQUxqQkJAx5P9T
	 wlwplp9tRHhzbN8+LqOEsxZ8QgtNUnOrbMt2FP9mt7VRa7OCQuAcIZImDBC/cUgvuK
	 VCXIZdNda+H1CLMOI29arYnFHjrvRJ8amBclWEVUPotRQSZZTEAcIzdyggtswutl7Z
	 qiAF+VeBTF0FZbczpq7kgM2QntOxFdOg4I32OUsZ9W4d+6NTx5/y+Pg88y3iibboN7
	 fpUg5nS1vTZ827Pl1m1VQNQP2cSRHH5orEndznAiln9b+lycpZWcPVKYnqPnjTt4ti
	 yMH9SI5xaK8Cg==
Date: Sat, 31 Oct 2026 18:08:38 +0100
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Georg Sauthoff <mail@gms.tf>
Cc: Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org
Subject: Re: [PATCH v2 1/2] man/man2/adjtimex.2: Add include and macro for
 clock_adjtime
Message-ID: <auYghHohD5SYv-Bz@devuan>
References: <20261025125656.877530-1-mail@gms.tf>
 <20261027003712.905789-1-mail@gms.tf>
 <20261027003712.905789-2-mail@gms.tf>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s5gzgz73riahvnyj"
Content-Disposition: inline
In-Reply-To: <20261027003712.905789-2-mail@gms.tf>


--s5gzgz73riahvnyj
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Georg Sauthoff <mail@gms.tf>
Cc: Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org
Subject: Re: [PATCH v2 1/2] man/man2/adjtimex.2: Add include and macro for
 clock_adjtime
Message-ID: <auYghHohD5SYv-Bz@devuan>
References: <20261025125656.877530-1-mail@gms.tf>
 <20261027003712.905789-1-mail@gms.tf>
 <20261027003712.905789-2-mail@gms.tf>
MIME-Version: 1.0
In-Reply-To: <20261027003712.905789-2-mail@gms.tf>

Hi Georg,

> Date: 2026-10-27 01:37:11+0100
> From: Georg Sauthoff <mail@gms.tf>
>
> GNU libc declares clock_adjtime() when including time.h, and not when
> just sys/timex.h is included, iff support for GNU features is requested.
>=20
> Verification:
>=20
>     $ for i in BLAH _GNU_SOURCE; do for j in sys/timex.h time.h; do echo =
-n "Testing $i and $j ... "; echo -e '#define '"$i"'\n#include <'"$j"'>\nvo=
id f(){clock_adjtime;}' | gcc  -xc - -o /dev/null -c 2>/dev/null && echo OK=
 || echo FAIL; done; done
>     Testing BLAH and sys/timex.h ... FAIL
>     Testing BLAH and time.h ... FAIL
>     Testing _GNU_SOURCE and sys/timex.h ... FAIL
>     Testing _GNU_SOURCE and time.h ... OK
>=20
> (Test output is from a Fedora 43 system)
>=20
> Signed-off-by: Georg Sauthoff <mail@gms.tf>

Thanks!  I've applied the patch.


Have a lovely day!
Alex

> ---
>  man/man2/adjtimex.2 | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/man/man2/adjtimex.2 b/man/man2/adjtimex.2
> index f12d9413e..5b9a0667b 100644
> --- a/man/man2/adjtimex.2
> +++ b/man/man2/adjtimex.2
> @@ -17,9 +17,12 @@ .SH SYNOPSIS
>  .P
>  .BI "int adjtimex(struct timex *" "buf" );
>  .P
> -.BI "int clock_adjtime(clockid_t " clk_id, " struct timex *" "buf" );
> -.P
>  .BI "int ntp_adjtime(struct timex *" buf );
> +.P
> +.BR #define\~_GNU_SOURCE "  // See feature_test_macros(7)"
> +.B #include <time.h>
> +.P
> +.BI "int clock_adjtime(clockid_t " clk_id, " struct timex *" "buf" );
>  .fi
>  .SH DESCRIPTION
>  Linux uses David L.\& Mills' clock adjustment algorithm (see RFC\ 5905).
> --=20
> 2.55.0
>=20
>=20

--=20
<https://www.alejandro-colomar.es>

--s5gzgz73riahvnyj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrmIJYACgkQ64mZXMKQ
wqmWRw//fWYUqKJSA6b7ZJLiB8vay3Rpi34DPf1n9wO2qZV0L2BAGI++51IFoFVh
fs3leETszt0xLnb8FiVjA+yzmrpkP/w0mfQXMa+OutjWjuve1VRhQtn3m9cpEMPo
biclfnnm3cVD1zHgT8RVYp1G2IgY39WwYROE/bCj1ZaTonISb4luzG4KKDNo9K9f
vTMpqun1HMDnFakjFa6Z1t1XCp4MtKr4OpMB9zQXzYJ7Tox/BM4PMM9BuhjrsN44
zXpHNJbF5mJK6sUilz9wq5X8gw5lMQhFZeUqgfqlNlLoTE/V6phxwlAw1H/ADWvi
2NkLytz/ZdbH2Cvjrz8FELxTGc28MAipginFj56aIIn2+4M8Sr8q25qs6MilbBGl
NeSYk0CA6qCLYdMT+kKNLPIPpF02vas8Zyyq6Dp2f8Lh0y4n9+WGlbm9NXu/P2lj
t1Ez4sWYFZzUvoHwPLuI2utv7pWFqhvyNi44MtqeTjzlw6ywCrNJ7GyOODSMrU5L
+yNl2q3FzgmuZ9LTswpqxZpuSN6CxqsFxbKqh0o1ejP/tNhMeIZggBBYG8Xduwd2
XI55ZhZf8D0GI2v+YRIjdWeJfjbkslQHd0XxitJpBrX/lj+kV/4U7o5s+e7UgoSV
RLIxolMF01lanArrdXFONpCUhSA8bemEb0dBB6oVA2+80gFsSCU=
=pxSf
-----END PGP SIGNATURE-----

--s5gzgz73riahvnyj--
