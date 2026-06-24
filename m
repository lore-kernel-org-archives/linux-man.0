Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CEF12C534
	for <linux-man@vger.kernel.org>; Wed, 24 Jun 2026 11:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782299202; cv=none; b=N9g19HNULY+Xlso5bcBK+6saYT4leax4psW1LGbluVGBX74tsxW+kE5cB/kibR2ZcbZsvFXdVc7L5A6q60lYfcPhtuqnziaYz5w6KrhUbQLQURd/G+XK1GPGdj3rS9XOFj9hoWYG9rruHyIOvKsH4tUtgUMkIShSrHnbdaanDe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782299202; c=relaxed/simple;
	bh=Q2bdMr4OpPYcvHkrN7y3C1n4X39PNzyBBZCs7fMCc9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NMRA6Q77TMOktFwL1H5QeY0Xi3Hf1pI5bpUhej8dG8Ugl2m1bM9Su02SIQjqRKmnrHw1LjhsZLRwkjpvnwkmmY+eGRvLttG+GHekqR0LSD2Q4kmNerAdadZTeaj7PeU55EaUjUnDkMIA3zrIotXSEUgA/TebfSwN5rxluSUlHQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FxchrtBz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FxchrtBz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D470F1F00A3F;
	Wed, 24 Jun 2026 11:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782299200;
	bh=e421bAh2kfcf1GGcyxvleAmrb8RBJUUyrl7kAKfuVCw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FxchrtBzfupZcBfpvysMubdq+u+yl+nq391jNOvBvXz/iw/CvFu85IAfUa8fC9w3o
	 Jy+JJbiSd//ZM1pvbhaa/3e186TKxisHLFOwDPvPoq8eU/yb2Plf6ld6b/OSp5PqDF
	 TwemgvXV6Y0MKp8FbfrHowWawMaxiIXvibGiJ85Zp3dX6wIUjpGSFc+MJiSX/geAJY
	 LBxY3r0/uLXG+uF4FTDLXNnZ53R8QOOmbyn4ZSs1+MLNe/I7ZWYPLgYNUyRdO5dyHo
	 HQhdVjEzD9sUPmLmNr7NcYF57f+LbBpAk45VpYLJE+11YR9Xp8T9JOX1iD2h7IG+uS
	 etYefCh6tbMDg==
Date: Wed, 24 Jun 2026 13:06:37 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Jan Engelhardt <jengelh@inai.de>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v2] console_codes.4: document more xterm codes
Message-ID: <aju5-L_vItUNO-i0@devuan>
References: <20260619100750.73857-1-jengelh@inai.de>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qkxnbu4o7ztnrugv"
Content-Disposition: inline
In-Reply-To: <20260619100750.73857-1-jengelh@inai.de>


--qkxnbu4o7ztnrugv
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Jan Engelhardt <jengelh@inai.de>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v2] console_codes.4: document more xterm codes
Message-ID: <aju5-L_vItUNO-i0@devuan>
References: <20260619100750.73857-1-jengelh@inai.de>
MIME-Version: 1.0
In-Reply-To: <20260619100750.73857-1-jengelh@inai.de>

Hi Jan,

Sorry for the delay.

On 2026-06-19T12:07:11+0200, Jan Engelhardt wrote:
> Signed-off-by: Jan Engelhardt <jengelh@inai.de>
> ---
> v2:
> * Removed a copy-paste leftover in the wording of OSC mode 17/19
>=20
>  man/man4/console_codes.4 | 48 ++++++++++++++++++++++++++++++++++++----
>  1 file changed, 44 insertions(+), 4 deletions(-)
>=20
> diff --git a/man/man4/console_codes.4 b/man/man4/console_codes.4
> index a742cf36f..d92522e27 100644
> --- a/man/man4/console_codes.4
> +++ b/man/man4/console_codes.4
> @@ -753,14 +753,54 @@ Set icon name and window title to
>  T}
>  ESC ] 1 ; \f[I]txt\f[] ST	Set icon name to \f[I]txt\f[].
>  ESC ] 2 ; \f[I]txt\f[] ST	Set window title to \f[I]txt\f[].
> -ESC ] 4 ; \f[I]num\f[]; \f[I]txt\f[] ST	Set ANSI color \f[I]num\f[] to \=
f[I]txt\f[].
> -ESC ] 10 ; \f[I]txt\f[] ST	Set dynamic text color to \f[I]txt\f[].
> -ESC ] 4 6 ; \f[I]name\f[] ST	T{
> +ESC ] 4 ; \f[I]num\f[] ; \f[I]txt\f[] ST	Set color \f[I]num\f[] (0-255) =
to \f[I]txt\f[].
[...]
> +ESC ] 46 ; \f[I]name\f[] ST	T{

This patch mixes additions with formatting changes.  Please move the
formatting changes to a separate patch, so that the diff is smaller.


Have a lovely day!
Alex

>  Change log file to
>  .I name
>  (normally disabled by a compile-time option).
>  T}
> -ESC ] 5 0 ; \f[I]fn\f[] ST	Set font to \f[I]fn\f[].
> +ESC ] 50 ; \f[I]fn\f[] ST	T{
> +Set font to \f[I]fn\f[] (normally disabled; cf. the "allowFontOps" resou=
rce)
> +T}
> +ESC ] 104 ; \f[I]num\f[] ST	Reset color for mode 4;\f[I]num\f[]
> +ESC ] 105 ; \f[I]num\f[] ST	Reset color for mode 5;\f[I]num\f[]
> +ESC ] 106 ; \f[I]num\f[] ; \f[I]val\f[] ST	T{
> +Exactly equal to 6;\f[I]num\f[];\f[I]val\f[]. (no "reset" logic)
> +T}
> +ESC ] 110 ST	Reset color for mode 10. (The pattern repeats until 119.)
> +ESC ] \f[I]mode\f[] ; ? ST	T{
> +Query the respective property/color/etc. (modes 4,5,10-19,50)
> +T}
>  .TE
>  .P
>  It recognizes the following with slightly modified meaning
> --=20
> 2.54.0
>=20

--=20
<https://www.alejandro-colomar.es>

--qkxnbu4o7ztnrugv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmo7uj0ACgkQ64mZXMKQ
wqlrxA//f2q8QJiBTFqholWKBSqwZ+vjNH2mYZD8GVLlk1Va+ALZvZXR1hAd1btw
prsUhSwqm10NvXIoHmg0ZpUxuLFhvJlEaPwiqiPIS+kt9za6XUOibyOTDCybiM2U
KeCbaTds/bkhF+JnZfF9GXKn/hQ0CcAYyM9UMfLnnGxm8T3Iaeuq9sUDQqbBMkeJ
hJr1gHa0oMJwjzjxAFk9oqgMYLscvnL+C3m11gOGC5QnlEdbHsjFv/yQIY4o3r3y
GjxTseOcc43df9VZQ+bmFiyZ/MatUXQVSjh77SFkKocd+njU1cm9LQo8pudv3tHI
r/sjT/j1h1OrFvhMfo462veDQRj3P3E20p+Z9/qT89QvCLvT+XSngEoMSH/3DNZV
FI39NwrUUdoHrJh0fFvu987BE3U2uS3R0DnIPe9JK73+oEejc+OtT5YHPHfvRY6Z
sTh0pJlET6VkphPm1cLrkf4oOjMCndiRZc+9MEzt3mL04ChJt29SKQgS519hEXxj
WhSlVke5hE/HsT8wnvNVd7n2LE81tOuScp6UXB/9bYT2c8TMf/AWKWrJ0amfRAxt
XYajfyQ4HuawK/YfZulJkCeu4AH3+i/lh5NPx+S3i6pSZGAN603aBXDdwGzcgMkT
rKMSyQqMPBb3WsS84BlrgW0zEZKzx3ZTZw3NFcGRz4oeFTtrCSA=
=SwtO
-----END PGP SIGNATURE-----

--qkxnbu4o7ztnrugv--
