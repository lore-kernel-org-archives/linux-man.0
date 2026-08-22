Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2710A2BEC5E
	for <linux-man@vger.kernel.org>; Sat, 22 Aug 2026 16:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787414618; cv=none; b=CyvslXf/nJebSrx+3TflVAkd1EDp8wd5v4qDIogu+BlJiZIElwdyjPuS7ncjrzMEyOxuKEqdf2VUyR2mj3mo0OFn86fEM63Ljb7juQxrJkK0J8NXj0j/4k9xiSswO8pQY2HhMWiS//VQD1t7sT1UA91uQwAmG6GMW14Qmd6ddDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787414618; c=relaxed/simple;
	bh=a7cPvWSmER132d3n95RfeKlG0bm0HmqBDLVdQIRZNAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KI3S19Ks62WeGr1GYDOxDg5ZeQ4I2HlkeeE3jW5/nhtIsCb4auOZWku04priR5FG7JyVuOQdMzZwREdEgBwYoJ3hSM/qSb9ot8BOioqBhUXqCUBmex/NdcOnrifNRo3dTjwaBKlReXXeWZ0bTIRLq9pgpiGiNhTk4Kk71VZ4cvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DUNQG5l4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DUNQG5l4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB6941F000E9;
	Sat, 22 Aug 2026 16:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787414610;
	bh=w3DdILXpDJp3170ahp0udeqgcihQq1dA8FnkExZUg1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DUNQG5l4WW0Fs3MsaR8TJQEryRlJHau92StTl7bY5O1MqOxHHkAYPPWwncyis6Hv9
	 EMvzxd1PSAQdCfPkDqKTFZl7RO8auRgZVuA8Nhg3V7dhJ5TTtlQDuJFt/GvDrJs3YX
	 YBPP8SMNpy9KuVM9QWmzcFbj7DQ7S1x66Ono53NnqyGyNDe7Ppe30dUZqYCh0EuBiq
	 PIBPMkeU5aqA1IbNNPCnqxv2TJIeqytMaIli0irtGJyeMu2Joq9EppBXtGLaQdFNGu
	 ZElp75u32T9qw6XADpa7YZUDUUDvTYr9tpEfDtXQvBfMhlF8/7WUrfXJyRAhFMnc6A
	 FwW3aKoxp6cZg==
Date: Sat, 22 Aug 2026 18:03:27 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Masanari Iida <standby24x7@gmail.com>
Cc: linux-man@vger.kernel.org, mtk@man7.org
Subject: Re: [PATCH] resolv.conf: Update MAXNS header reference for
 resolv.conf(5)
Message-ID: <aonIPZvr_UQCDNoy@devuan>
References: <anZtjC89LJFudMay@devuan>
 <20260808021539.146429-1-standby24x7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hiutf2y223ymljfn"
Content-Disposition: inline
In-Reply-To: <20260808021539.146429-1-standby24x7@gmail.com>


--hiutf2y223ymljfn
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Masanari Iida <standby24x7@gmail.com>
Cc: linux-man@vger.kernel.org, mtk@man7.org
Subject: Re: [PATCH] resolv.conf: Update MAXNS header reference for
 resolv.conf(5)
Message-ID: <aonIPZvr_UQCDNoy@devuan>
References: <anZtjC89LJFudMay@devuan>
 <20260808021539.146429-1-standby24x7@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260808021539.146429-1-standby24x7@gmail.com>

Hi Masanari,

> Date: 2026-08-08 11:15:39+0900
> From: Masanari Iida <standby24x7@gmail.com>
>
> The MAXNS limit mentioned in resolv.conf.5 points to
> <res_state.h> instead of <resolv.h> after following glibc change.
>=20
> 500b3a499fff (2017-05-20; "Remove __need_list_t and __need_res_state.")
>=20
> Signed-off-by: Masanari Iida <standby24x7@gmail.com>

Thanks!  I've applied the patch.


Have a lovely day!
Alex

> ---
>  man/man5/resolv.conf.5 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/man/man5/resolv.conf.5 b/man/man5/resolv.conf.5
> index 8e914f12a18d..89f9d903a1e3 100644
> --- a/man/man5/resolv.conf.5
> +++ b/man/man5/resolv.conf.5
> @@ -50,7 +50,7 @@ or an IPv6 address in colon (and possibly dot) notation=
 as per RFC 2373.
>  Up to
>  .B MAXNS
>  (currently 3, see
> -.IR <resolv.h> )
> +.IR <res_state.h> )
>  name servers may be listed,
>  one per keyword.
>  If there are multiple servers,
> --=20
> 2.25.0
>=20
>=20

--=20
<https://www.alejandro-colomar.es>

--hiutf2y223ymljfn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqJyE8ACgkQ64mZXMKQ
wqmlQA/+M4uPLTYk17SSWjsQsMAvgmrYTvEZN9NwIS3IkSgLiC34jTc1R29ggY0w
/mam/yF0UrfAHfyvtYdxs4/1XthPqqQZYK6SVTq9NcDGKmpoUJzr52+KD24uAM4R
OV5lKELfBGjOAoEPlfTtzB4RFOIQzD+G/xqh9i9Txv1uGCRemvns8O7tJFPFQlb/
SBIttkEkEThJMHaaIVKhTJqDWERvF0Dx+/uowXlFBtURe2C8zlMtjxPovwyJ51hN
IwQ8b1/2/mxAjOEQ2eXRaVI8b6UbdsYWOsPYIoIAnSVbB4/yPHjJOnMl9+tvVzP6
JO7+LxFUiY5dD0FeE2i408q9E78UzHzcCDc3iYrZS46pu0FoJL+s7J1V9JfXJHbV
+e/qvQYxDcSzGiO62hb/jSkop9YrSsx0IhpLBNZHY6iI3WXrH3fDrBXRUS8AknNj
5zSIvZbFr4BZDl3wwX1bcmoSY69pZLzVjPK/g9Cq3aIvcoUSnbd6ZIL+CwcQJRa3
BPMTVowgaSsbz7kcLInYYuG0kwmMuNn5NRHtC/IK6JRcvf3tqMsfPQjqMGH8fzpr
6KeYMojziYagO5pbTZYQaFSE0/X/rN5pY5irFiDit1mnKdrVAxRGHJRO2ovDI7oO
p/lHDMsh4k9pHeBmLDIjBIlH76ePx9JygERJAtL4GlLyLRlUwwU=
=zTxH
-----END PGP SIGNATURE-----

--hiutf2y223ymljfn--
