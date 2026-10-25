Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792954181;
	b=DJpXfpujva/rpGndtn8GEf0EaoYoRR82oe7YttCGvoGtZ9AY3sviEocShc98Bl1FH1K7
	 0HLbReJWurCwJhGYEjAO9Zw/XXL15Z7FEdqI35M6+Rvr4fIKUqEVqQ6miinksrdPn1kps
	 1NLYWQDnICwTyX/lUi5gu2XPmGym8+G/5W8yZpt9nhldDkpd4dHVrFBKdRNkvymb00Ux0
	 iD3tBSWDssoYgR5AbmshRF4PIQnza6t0eoxOFw1YcF5f5RYMMk8rgQBKE82n9epMZT4WO
	 9nUcd+/VBWfJfFfsgor4zMP+KWifO7TpMRYvu7FS3yIi+sd629i2m3qB1MA8avTJfZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792954181;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=zPH9Xvu50yj1RQakZgetcOwpV94nuk+YIzYlNNfFY6c=;
	b=cQAzXv80Ot0SJgPXhYeuZKcLo9k1TWkz19gWmqq36FFACmUE1tLZSFH7842ZYhtV5jwn
	 khGTWsC6qnNAgHMXSFcJXetfLD8p1WOE6B+vxqKBKqKuhQFv0xrw945d8BbVtrOq3t1X0
	 gAHYlra5/gfcndTqcMWii389sNrs20CXEkXmV8XczQBUTRo6ml4XjrSINlzhC0nk2UX5x
	 nkq2uO5YyOGHK4Ntx1zszu5iXapNrfAtykvOmcJOiMVIA9wPDy/osICTMTeoLOzcY0hwy
	 aBpHtqys6E8vIqyjcWf/82dqGKtsiKRyLaWAhLkeTn/bbqaam5KZEaST7NDrDERnUwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WYwJaMjk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD781606A31A
	for <linux-man@vger.kernel.org>; Sun, 25 Oct 2026 18:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WYwJaMjk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6882D1F01825;
	Sun, 25 Oct 2026 18:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792954180;
	bh=zPH9Xvu50yj1RQakZgetcOwpV94nuk+YIzYlNNfFY6c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WYwJaMjkUtE1IJ8GU4/HonMEKvZ4DkOY/tgMp4eU+jD3KulILCajAXOXCf2TIGxdD
	 aSVPjFm0uKG/iPmCRczWhPhsIPr+HDBBwbkCZM/I47qm+fHCjbyb+k5NSVe4GrzdEh
	 /B+yIPpIN6UZgzaCHGcwJPb/rzJf6W2nWEwRPC8djzSXNAJ7dA7a7M+vGqU/+ib/0d
	 JC9tHI8muLZFhOgvohuxlm5tovx4/koyj6paORrHt//RNIPDaI9rkIY80Cq0dOHJBm
	 QKIu8MhjprOftr/fXmKPbXSeJUaGvjA7KJwmfh22iNXv5LI+hKcSAT1WDYsBrmwmEo
	 Tu+EkbBrcnGvw==
Date: Sun, 25 Oct 2026 19:49:32 +0100
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Georg Sauthoff <mail@gms.tf>
Cc: Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Richard Cochran <richardcochran@gmail.com>, 
	Nikola =?utf-8?B?Rm9ycsOz?= <nforro@redhat.com>, Laurent Georget <laurent.georget@supelec.fr>, 
	Jeff Epler <jepler@unpythonic.net>, libc-alpha@sourceware.org
Subject: Re: [PATCH v1] man/man2/adjtimex.2: Add include, macro and error for
 clock_adjtime
Message-ID: <at5M0n93b8Nqjop-@debian>
References: <20261025125656.877530-1-mail@gms.tf>
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
	protocol="application/pgp-signature"; boundary="g3y3c2lteu2lhkop"
Content-Disposition: inline
In-Reply-To: <20261025125656.877530-1-mail@gms.tf>


--g3y3c2lteu2lhkop
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Georg Sauthoff <mail@gms.tf>
Cc: Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Richard Cochran <richardcochran@gmail.com>, 
	Nikola =?utf-8?B?Rm9ycsOz?= <nforro@redhat.com>, Laurent Georget <laurent.georget@supelec.fr>, 
	Jeff Epler <jepler@unpythonic.net>, libc-alpha@sourceware.org
Subject: Re: [PATCH v1] man/man2/adjtimex.2: Add include, macro and error for
 clock_adjtime
Message-ID: <at5M0n93b8Nqjop-@debian>
References: <20261025125656.877530-1-mail@gms.tf>
MIME-Version: 1.0
In-Reply-To: <20261025125656.877530-1-mail@gms.tf>

Hi Georg,

> Date: 2026-10-25 13:56:56+0100
> From: Georg Sauthoff <mail@gms.tf>
> Subject: [PATCH v1] man/man2/adjtimex.2: Add include, macro and error for=
 clock_adjtime

Please separate this into two patches, each of which does only one
thing.  The error seems unrelated to the include.

I've CCed a few people that have worked in this manual page, in case
they have feedback (and also libc-alpha@).

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

Agree.  I wonder if this use of a different header is intentional and
why.

> (Test output is from a Fedora 43 system)
>=20
> The ERANGE error can be verified either via trying to adjust the
> frequency of a PHC by a value that is outside of [-X,X],
> where X=3D`cat /sys/class/ptp/ptpX/max_adjustment`,
> or via checking the kernel source code:
>=20
> <https://elixir.bootlin.com/linux/v7.2.2/source/drivers/ptp/ptp_clock.c#L=
164>
>=20
> Signed-off-by: Georg Sauthoff <mail@gms.tf>
> ---
>  man/man2/adjtimex.2 | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
>=20
> diff --git a/man/man2/adjtimex.2 b/man/man2/adjtimex.2
> index f12d9413e..528fd3a6f 100644
> --- a/man/man2/adjtimex.2
> +++ b/man/man2/adjtimex.2
> @@ -17,9 +17,21 @@ .SH SYNOPSIS
>  .P
>  .BI "int adjtimex(struct timex *" "buf" );
>  .P
> -.BI "int clock_adjtime(clockid_t " clk_id, " struct timex *" "buf" );
> -.P
>  .BI "int ntp_adjtime(struct timex *" buf );
> +.P
> +.BR #include <time.h>

BR is for alternating bold and roman, so this seems wrong.  You probably
want just B (see the include above).

BTW, I would use

	.B #define _GNU_SOURCE
	.B #include <time.h>

and then remove the Feature Test Macro text below.


Have a lovely night!
Alex

> +.P
> +.BI "int clock_adjtime(clockid_t " clk_id, " struct timex *" "buf" );
> +.fi
> +.P
> +.RS -4
> +Feature Test Macro Requirements for glibc (see
> +.BR feature_test_macros (7)):
> +.RE
> +.P
> +.BR clock_adjtime ():
> +.nf
> +    _GNU_SOURCE
>  .fi
>  .SH DESCRIPTION
>  Linux uses David L.\& Mills' clock adjustment algorithm (see RFC\ 5905).
> @@ -534,6 +546,12 @@ .SH ERRORS
>  Under Linux, the
>  .B CAP_SYS_TIME
>  capability is required.
> +.TP
> +.B ERANGE
> +The frequency offset supplied with
> +.BR clock_adjtime ()
> +is outside of the range clock clk_id supports.
> +See also /sys/class/ptp/ptpX/max_adjustment when adjusting a PTP hardwar=
e clock.
>  .SH ATTRIBUTES
>  For an explanation of the terms used in this section, see
>  .BR attributes (7).
> --=20
> 2.55.0
>=20
>=20

--=20
<https://www.alejandro-colomar.es>

--g3y3c2lteu2lhkop
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmreTyoACgkQ64mZXMKQ
wqnVng//efZlJFUCb7z5vH6/+0K2F5yIhfS1HNcO1qm3EduSI8BmIlZMOGFra98y
iYX6No7wI8T5ujZEH6VxTwpxkLh7dkvkj35+yrP8d2J82LyoM2d3g04cv4Lm9OMC
jVv2WTvxWqAM54BvLPQczoYIf50o2lBkaV9VrcbfFJ5a0j97i7e56N4r2pgIndTw
h06zwAPS2cHyZXbd7gomgP6QwWQhKVeaWPzKsOIk0mFEm5aDsAXhRXnS69KEJR8T
M4H39yr/DJFS+cG7/+VtRHQnVLbywLoGWJIV8S77p0AlkAWoaIidblHIq+eiOkit
2X6DtYIs/J+3O3gZ3JKa38pgh3C/PiCN6BoeTkZ9I/3QUM93So8YtROcyJwD0ovR
i69KFBMvkTxVFm1zBQRwOcQojeXhuK/4IAAmsrulnsDTPiAEklKu8asyCVAi66b1
/8jJQhV4r9QMmw9lMwsUhS6n5MWLD0NxOdR7ghc7i+80MVCn8ZWjUkrmWCc6OdFy
xjQrmj2knK3V/JMKqtPpasImahhHzDXOim4Mv9MNzt2KMBbDFlp/mShnA8G3N0YT
QDMfoaQpUdDuTBxJY0kADKa8pSrPIPTZpYyHMKB80Fel7/lIG8YVFb2Ad8WLr9iC
mrCWH+PS7mIZ9dX4i3cm9G++ljvcSlNqKV+87Tcp85FGKnLqTww=
=gLpt
-----END PGP SIGNATURE-----

--g3y3c2lteu2lhkop--
