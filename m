Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2074033A70E
	for <linux-man@vger.kernel.org>; Sat, 18 Jul 2026 12:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784377378; cv=none; b=Cqor7KcWJzA1Lz1UOToiu+Kn3DuNM9AfnCK7SsYpf+DSmuLHEd8YrNqeJcLeGGW0D+33PdFOFzI32ms+7+qpSeO+Ax0Bu90uC/Vztt/7wp9Crlz0/rBBvHaAowQ/ks+Ke/HreFGr9cw243sY+df3a2/WW3AETgM2eMTRTmUtr2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784377378; c=relaxed/simple;
	bh=bB6JpUs0XklLXc+oHc1FlCOiOZ0bgci8lfWVKBIjWw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PisAl9jnyhvZWmEs4j6dsOdKMHBwB3l3q3XARlBHeZ+kr4VsAf4DvMVsVl5UNk30k9NMbSsrfetFP5/FzG4XcsoIUaXfSQUHBBV3ag0MMS9pgHZgx3gGHGrjDS7CsQysgHDKDNvxjoa+vvQWaAt10fdLJzAiUY1hr4S4XtQwj7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RB7j+HMX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RB7j+HMX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E8AD1F000E9;
	Sat, 18 Jul 2026 12:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784377375;
	bh=5LF9yFIby+sZ7gvnaYIMiv8fu3NvhGU3rt71s8mo2kM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RB7j+HMXExIQQZNO0BD1QDoGTLTFLI1zNhN24RScqU8hkfNwJfL1gCUfMp0tHMhd2
	 Yc0KdLBQJygtxa0LQ/vyFVCZ/vZRQCTMndf1liN4weKjcH9jFifEc+CwBu7B2rHX3c
	 E+wGn/91bXGEZrClabQZbL4nJqFA3KpD1mI82RQBG1R6oP1bC1ZqrhNwkbhSyMjhvb
	 D5SlR0Xx2d8+LjxpuPWMm2K+icL+0Ow/cOVs07WtZ67poRO/DJMTfKznH73FdjY5lr
	 MPWo6pRFAv2hcT+c/vgtjc/FTnCJIZNB5AetWjEsUY8x8jWkPWFmWNdw3FL4Ncou9t
	 paMIPOZ5XonJQ==
Date: Sat, 18 Jul 2026 14:22:53 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Jan Engelhardt <jengelh@inai.de>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH 1/2] console_codes.4: mention caveats for xterm's ESC ]
 50 command
Message-ID: <altv-loTJXlWxgUf@devuan>
References: <20260710221035.26529-1-jengelh@inai.de>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rz56xm43sfy5uz4g"
Content-Disposition: inline
In-Reply-To: <20260710221035.26529-1-jengelh@inai.de>


--rz56xm43sfy5uz4g
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Jan Engelhardt <jengelh@inai.de>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH 1/2] console_codes.4: mention caveats for xterm's ESC ]
 50 command
Message-ID: <altv-loTJXlWxgUf@devuan>
References: <20260710221035.26529-1-jengelh@inai.de>
MIME-Version: 1.0
In-Reply-To: <20260710221035.26529-1-jengelh@inai.de>

Hi Jan,

On 2026-07-11T00:10:34+0200, Jan Engelhardt wrote:
> Fonts are only settable if xterm was launched with the right options
> (or X11 resources) that would allow this operation.
>=20
> Signed-off-by: Jan Engelhardt <jengelh@inai.de>

Thanks!  I've applied the patch, with some minor tweaks.


Have a lovely day!
Alex

> ---
>  man/man4/console_codes.4 | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/man/man4/console_codes.4 b/man/man4/console_codes.4
> index 2fa8368e1..534510a4b 100644
> --- a/man/man4/console_codes.4
> +++ b/man/man4/console_codes.4
> @@ -760,7 +760,10 @@ Change log file to
>  .I name
>  (normally disabled by a compile-time option).
>  T}
> -ESC ] 50 ; \f[I]fn\f[] ST	Set font to \f[I]fn\f[].
> +ESC ] 50 ; \f[I]fn\f[] ST	T{
> +Set font to \f[I]fn\f[] (the escape code is normally disabled;
> +consult the xterm manpage for the "allowFontOps" setting)
> +T}
>  .TE
>  .P
>  It recognizes the following with slightly modified meaning
> --=20
> 2.54.0
>=20
>=20

--=20
<https://www.alejandro-colomar.es>

--rz56xm43sfy5uz4g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpbcBwACgkQ64mZXMKQ
wqmfZQ//dGP93O2N8B76667/RahR7j24pfW8l+b+6BVB2jE4ntz3rF1AaxeMwRup
bj2bjzfBHbmWXYM9xMKbp2tA/1OMF44wkK4dHUYbZNC56SBUlhB4lsqKSCuJlMWz
bXvZaYhXTFT1BpvkoSiolOcbXr2dcDR7NR02ESAkfNz2pDi5mmIVW3WkMerAymwy
ekoFS+mu38RzMcTIpOZ6vx8OAjR3zr3HZnbW+RbuPj8K8zHZCjFRGI/Uebk8WSaf
8hVvrqyl6DcN4fCsCUx3+9WaqL++rixvR7BkNcEzULvYzUNKb4Qklb2oJViTFfDn
8LAi+1RWZGYKFnyqvNwR4Ey5JBsXSzwMvqti58EyFDAVCLg0C+e1z04Mm4eKQ8g5
n53sxb81nLaTQfK3SDdnnYMfg6MRg+ySyGoyLyubyKGt9l6RJDdCd2fxqX4to+4d
/MiQJWtNFnwlz2mZDbj+8OrUv8HDK6tWMJ/zXOWnGIH97phbsvpjnl4YqRGo5sih
qd1TJb6WvxE56eB6ucbxQ3zAQQOsXlrlV8KUlt97P7I8/xPkPsdTRTYymXDAPKGU
+AEI/0tfSrLQw00fSXOTUJL3iSDwCEz5EQPIbsndaT+X1+9DmSjgwzGXc/bF233+
XPw9TJRJ+W7TMDIhp9z6CJNDPDel4y5lJFu1SwiCIXtpVzHkc/E=
=VEZu
-----END PGP SIGNATURE-----

--rz56xm43sfy5uz4g--
