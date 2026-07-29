Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FDA46F49F
	for <linux-man@vger.kernel.org>; Wed, 29 Jul 2026 15:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785338488; cv=none; b=ckTkwwftAc4f/Ct42LvxokKkyCzT7ItIum9of+CzOHEz3OBUK8uREf/SqQWNAFG1BLKhgAlxAXtQfX9J6Rk0uymK+F2xB1AZUtlIFho/PGJkclIwzJ7jye8CNIKXcF/sVaUdadeR7WotzoNkIjLGfpWUjcrwYfHU7metiRvOECk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785338488; c=relaxed/simple;
	bh=b3c7D/Erp1+gYcP5QhbhCzqUl+J/OUlwxP3LQ5K167M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bVCiTzkX8yihdQBlb0ni9ChEaObXXX/8/T705oyUFfAb7R4zycknPYMxztDj+h9us8GsaFjOPgI4GgfpAEl3rM38Y35UByxNq3WiAZm0h/JV5OVPZmKJYGtc7DsK8/tfusfrud+NYLfBIo/Qwblt6+H2Chn1wp0GtHC8nHheLcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XNzgOm7Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XNzgOm7Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E35A21F000E9;
	Wed, 29 Jul 2026 15:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785338486;
	bh=WWuwUHxLejmjfoLNXF4x/OK0Gb1G2I0zkygZrKpQ2i4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XNzgOm7ZUPra4FlepIgYYayBmhPeebQzUCEnykiXn3vum/HvFXe132xh+hJ6m8MmO
	 HhQaQhMw4N3/jo03+6/wRIPTxCwbeL2e2xh5ONuswjSqCXRadVHXp6hgwmD9yV/3g1
	 +pPWZ5Si19nXbbjRpRgONoBU+r9hKzVDmvDl2TRJiiSQ95Q+Fu+0EjZOU18JlPQUJw
	 iB4wdk9kNe6EBv8k+1nIY6E0Uot1v5CUl7UgdSYzLqnwTc6UPl7s/VStucr3W3ICSj
	 8MbfOQrrnlPiE5z1pt8XS4ZO9+QhIATGwvHAzNmhDmK/qFoRsDJUyXyw/59hf1q3fO
	 zN827pw/G+3tw==
Date: Wed, 29 Jul 2026 17:21:21 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Jan Engelhardt <jengelh@inai.de>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH] console_codes.4: document more xterm codes
Message-ID: <amoaOGTxHY1YqhXF@devuan>
References: <20260718153631.55879-1-jengelh@inai.de>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c4jbj5h2x52ekvsu"
Content-Disposition: inline
In-Reply-To: <20260718153631.55879-1-jengelh@inai.de>


--c4jbj5h2x52ekvsu
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Jan Engelhardt <jengelh@inai.de>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH] console_codes.4: document more xterm codes
Message-ID: <amoaOGTxHY1YqhXF@devuan>
References: <20260718153631.55879-1-jengelh@inai.de>
MIME-Version: 1.0
In-Reply-To: <20260718153631.55879-1-jengelh@inai.de>

Hi Jan,

> Date: 2026-07-18 17:36:31+0200
> From: Jan Engelhardt <jengelh@inai.de>
>
> Signed-off-by: Jan Engelhardt <jengelh@inai.de>

Thanks!  I've applied the patch.  I've amended it to use semantic
newlines (see man-pages(7)) with the following small changes:

	diff --git i/man/man4/console_codes.4 w/man/man4/console_codes.4
	index 9507a760e07b..faf12a66cd82 100644
	--- i/man/man4/console_codes.4
	+++ w/man/man4/console_codes.4
	@@ -792,14 +792,17 @@ .SS Comparisons with other terminals
	 ESC ] 104 ; \f[I]num\f[] ST    Reset color for mode 4;\f[I]num\f[]
	 ESC ] 105 ; \f[I]num\f[] ST    Reset color for mode 5;\f[I]num\f[]
	 ESC ] 106 ; \f[I]num\f[] ; \f[I]val\f[] ST     T{
	-Exactly equal to 6;\f[I]num\f[];\f[I]val\f[]. (no "reset" logic)
	+Exactly equal to 6;\f[I]num\f[];\f[I]val\f[].
	+(no "reset" logic)
	 T}
	 ESC ] 110 ST   T{
	-Reset color for mode 10. (Codes 111-119 map to resetting modes 11-19,
	-respectively.)
	+Reset color for mode 10.
	+Codes 111-119 map to resetting modes 11-19,
	+respectively.
	 T}
	 ESC ] \f[I]mode\f[] ; ? ST     T{
	-Query the respective property/color/etc. (modes 4,5,10-19,50)
	+Query the respective property/color/etc.
	+(modes 4,5,10-19,50)
	 T}
	 .TE
	 .P


Have a lovely day!
Alex

> ---
>  man/man4/console_codes.4 | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>=20
> diff --git a/man/man4/console_codes.4 b/man/man4/console_codes.4
> index 10d2e3b5f..9507a760e 100644
> --- a/man/man4/console_codes.4
> +++ b/man/man4/console_codes.4
> @@ -754,7 +754,30 @@ T}
>  ESC ] 1 ; \f[I]txt\f[] ST	Set icon name to \f[I]txt\f[].
>  ESC ] 2 ; \f[I]txt\f[] ST	Set window title to \f[I]txt\f[].
>  ESC ] 4 ; \f[I]num\f[] ; \f[I]txt\f[] ST	Set color \f[I]num\f[] (0-255) =
to \f[I]txt\f[].
> +ESC ] 5 ; 0 ; \f[I]txt\f[] ST	Set the color for bold substitution to \f[=
I]txt\f[].
> +ESC ] 5 ; 1 ; \f[I]txt\f[] ST	Set the color for underline substitution t=
o \f[I]txt\f[].
> +ESC ] 5 ; 2 ; \f[I]txt\f[] ST	Set the color for blinking substitution to=
 \f[I]txt\f[].
> +ESC ] 5 ; 3 ; \f[I]txt\f[] ST	Set the color for reverse substitution to =
\f[I]txt\f[].
> +ESC ] 5 ; 4 ; \f[I]txt\f[] ST	Set the color for italic substitution to \=
f[I]txt\f[].
> +ESC ] 6 ; 0 ; \f[I]val\f[] ST	Toggle bold rendition: 0=3Dbold, 1=3Dsubst=
itute by color.
> +ESC ] 6 ; 1 ; \f[I]val\f[] ST	Toggle underscore rendition: 0=3Dunderscor=
e, 1=3Dcolor.
> +ESC ] 6 ; 2 ; \f[I]val\f[] ST	Toggle blinking rendition: 0=3Dblinking, 1=
=3Dcolor.
> +ESC ] 6 ; 3 ; \f[I]val\f[] ST	Toggle reverse rendition: 0=3Dreverse, 1=
=3Dcolor.
> +ESC ] 6 ; 4 ; \f[I]val\f[] ST	Toggle italic rendition: 0=3Ditalic, 1=3Dc=
olor.
>  ESC ] 10 ; \f[I]txt\f[] ST	Set the foreground text color to \f[I]txt\f[].
> +ESC ] 11 ; \f[I]txt\f[] ST	Set the background color to \f[I]txt\f[].
> +ESC ] 12 ; \f[I]txt\f[] ST	Set the text cursor color to \f[I]txt\f[].
> +ESC ] 13 ; \f[I]txt\f[] ST	Set the mouse cursor foreground color to \f[I=
]txt\f[].
> +ESC ] 14 ; \f[I]txt\f[] ST	Set the mouse cursor background color to \f[I=
]txt\f[].
> +ESC ] 15 ; \f[I]txt\f[] ST	Set the Tektronix foreground color to \f[I]tx=
t\f[].
> +ESC ] 16 ; \f[I]txt\f[] ST	Set the Tektronix background color to \f[I]tx=
t\f[].
> +ESC ] 17 ; \f[I]txt\f[] ST	T{
> +Set the background text color for highlighted (selected) text to \f[I]tx=
t\f[].
> +T}
> +ESC ] 18 ; \f[I]txt\f[] ST	Set the Tektronix cursor color to \f[I]txt\f[=
].
> +ESC ] 19 ; \f[I]txt\f[] ST	T{
> +Set the foreground text color for highlighted (selected) text to \f[I]tx=
t\f[].
> +T}
>  ESC ] 46 ; \f[I]name\f[] ST	T{
>  Change log file to
>  .I name
> @@ -766,6 +789,18 @@ Set font to \f[I]fn\f[]
>  see "allowFontOps" in
>  .BR xterm (1)).
>  T}
> +ESC ] 104 ; \f[I]num\f[] ST	Reset color for mode 4;\f[I]num\f[]
> +ESC ] 105 ; \f[I]num\f[] ST	Reset color for mode 5;\f[I]num\f[]
> +ESC ] 106 ; \f[I]num\f[] ; \f[I]val\f[] ST	T{
> +Exactly equal to 6;\f[I]num\f[];\f[I]val\f[]. (no "reset" logic)
> +T}
> +ESC ] 110 ST	T{
> +Reset color for mode 10. (Codes 111-119 map to resetting modes 11-19,
> +respectively.)
> +T}
> +ESC ] \f[I]mode\f[] ; ? ST	T{
> +Query the respective property/color/etc. (modes 4,5,10-19,50)
> +T}
>  .TE
>  .P
>  It recognizes the following with slightly modified meaning
> --=20
> 2.55.0
>=20
>=20

--=20
<https://www.alejandro-colomar.es>

--c4jbj5h2x52ekvsu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpqGnEACgkQ64mZXMKQ
wqkaHQ//QUgP/bOZ2M0G0P+zOWRBkCGsudKwVfX1CSoqkUwCdzzclyGpkz32uwU9
quGqA8ERo2Xx3W2mD/aT8GDxCiybpcHK0zgBZLdLPCH6ULuGeYaYuBgTmysI3k0t
DYGL7UuEtWFHluqknpDULk9XdnRq5YnXrQuZL4UE3zeMelI0PGuEId8gKF3LjuaW
OS9lklyb3iRE5XBfP6wR8X7g0g3qowpn/Hnqu/VqBAZ2P+C/E+2oZkrvGKbLkTxR
FL7Jv/dIecgTTV5RwqkFkx20jKsb5ea4sAUjFRvXezDAClrkw+SIf9ykWgpVf5PR
yTUBExMGCxvqsQtAZs7T8BbT64qQRlOx+RRtoHMt1e8lm4a68RbI3PDmMI1+N3LY
6AILUOTmoHwWSACTkZEH/3cUGxqfA3Z1bppAGrVY9a5XNVxQ3rvU1MavEgV1ayo6
K2o0ZIDBigRRF9c+ZFZk4+SMEXaczeM3ouU7tFzCNS8Op/cx3YWHwevPB06Hk9mE
O+FlLEfKP6LHWfRpxZKY2anSa46Utk15CRYIArufdKbK6w8ycLziD/DTXh1ze13w
eEass0Gd2BPTxTe87VSHI9TM7tS8yO9srapBlzpGA+QdgCmoAFv0CH9CJGwULIHU
kGzMUw6U6MEzaIHWJFePw+DWZAHX3898abSot4WEY1/0xrrFNYY=
=p8o1
-----END PGP SIGNATURE-----

--c4jbj5h2x52ekvsu--
