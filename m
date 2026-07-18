Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F932344044
	for <linux-man@vger.kernel.org>; Sat, 18 Jul 2026 12:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784377443; cv=none; b=e/ILRr70F6Zkyz6FNmvo7+PULz3OzTc45NzkqPVIBCFFWzYKrIoISyGhyKRkp4eN5xEmZjONHSmpqWEGnpznHE2b3oUrSxfGsXuGXZz7ZAIdrsqGIeh/OGLHFKLFCUH+IVXNtXakhRF3VjGyEjRH/dM17YgWUNZ+oW4+MAAjoVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784377443; c=relaxed/simple;
	bh=1tsyH2AJTiJu9Y7llS1YhbXoEZxWMIbVUcaEWCgX4aw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u52Tnm66KGPa+6B3wklT+dJ/XRyjXOK1fo7W+LaHQXAE5sXCgaV3sWSprHv51Pk0tGV+3T4niYgIFOGPPQAJR/pF/zIri8HHmg43EQqCQjI5ndwXGl7xwiTDTBn1aGYctlXECJOhiegWaPQmS+Uu5xLVBbL0PQNJPtjOUySqHtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XdaHZ1r/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XdaHZ1r/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63E0B1F000E9;
	Sat, 18 Jul 2026 12:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784377442;
	bh=XIT+yR2LBRNxlc/RKx1WdOqLbAixwk9jRhy4ujOafeo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XdaHZ1r/JdXghiFbImCIxv35WogLqM/opqEyLWeJZctojLsWsgaKblLDMpw73gXP3
	 VW0ubb3kKGekJVqHMsUxUqTIXvBPMEr182gnAL8QmbzUdBYFKBTM0wtFtigidW9X3z
	 qynndKneWAL30WLsJVEILJ/d8mnJqUutpUXtY6hjHqEDu6G++hZaIi9eS1J7iOIs55
	 V4s5jnJ9fukUThpH8HsCFlOUyvaQD+feUaairSYnYU6fqKo29sDxjAsnfPwQ09QUdZ
	 1QjhXGPmqRJ2Cj4ImBl/qeoSmS6laEymJ3UUwei0oeT+wby/blf7x8WB+gj+l3uQbB
	 KDJ3gmyezI3Hg==
Date: Sat, 18 Jul 2026 14:23:59 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Jan Engelhardt <jengelh@inai.de>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH 2/2] console_codes.4: document more xterm codes
Message-ID: <altwR-YEEe8xITFt@devuan>
References: <20260710221035.26529-1-jengelh@inai.de>
 <20260710221035.26529-2-jengelh@inai.de>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uw54ovyua24wmrrh"
Content-Disposition: inline
In-Reply-To: <20260710221035.26529-2-jengelh@inai.de>


--uw54ovyua24wmrrh
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Jan Engelhardt <jengelh@inai.de>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH 2/2] console_codes.4: document more xterm codes
Message-ID: <altwR-YEEe8xITFt@devuan>
References: <20260710221035.26529-1-jengelh@inai.de>
 <20260710221035.26529-2-jengelh@inai.de>
MIME-Version: 1.0
In-Reply-To: <20260710221035.26529-2-jengelh@inai.de>

Hi Jan,

On 2026-07-11T00:10:35+0200, Jan Engelhardt wrote:
> Signed-off-by: Jan Engelhardt <jengelh@inai.de>

Would you mind rebasing this patch?  It doesn't apply cleanly.


Cheers,
Alex

> ---
>  man/man4/console_codes.4 | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>=20
> diff --git a/man/man4/console_codes.4 b/man/man4/console_codes.4
> index 534510a4b..526d743a3 100644
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
> @@ -764,6 +787,18 @@ ESC ] 50 ; \f[I]fn\f[] ST	T{
>  Set font to \f[I]fn\f[] (the escape code is normally disabled;
>  consult the xterm manpage for the "allowFontOps" setting)
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
> 2.54.0
>=20

--=20
<https://www.alejandro-colomar.es>

--uw54ovyua24wmrrh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpbcF4ACgkQ64mZXMKQ
wqk2Hw/9F9lIfOSsz3awoWN6xsS4/UydEsYZDbKEJqDqERNQg9S4fhxRSAKww6Jh
Zjj5n3WNkdGRiazL8+9vRztP+A1Jht0vg384UGY0rVcTX0MfP9Y6q8JjOfZzif8J
TSPJxphS0E/xMNE4UtjplSlQh4nmKGsJstdsZSTx2fZqTEl/HxnrW9vBb8qaZMma
LZFsyAqas4QmUsJTHA3z2F9+MgJNt+mizvYmN6JA4wAwvsk5/fHrBIVg2NoS35Km
szIwC8cSjSZZZ1UMEGr+/W2+kZTx/2TGh8Iwz3w/5UkNJ07kqMRbsfLJ8IWPuwa5
ORGL42Eh7aH/epXglc0xI0o1u+i4SRwBVs3vJqQcLoRQkPbSOK9wDHFUCNZ7DNAn
2BFsI6xMKbZLrq070qoDwkVOk/2MkJIR0vdWiYOv2JGFu8NGWoFlGSlZSXiYcHfz
eyu1FF6LZL+e7Wu843a6u8wo0aaiwBYn9t1zbfUEjeC08TaFbOl8r1WBeTBJ5qNm
H3cuW+KYNpK130eTqPF5IlhwWktEcHbzENOsnQpm+6NoCm96YFL2OAuSjQPVFowk
Ixo3zUciqZUtQd6s2o+EKAOw84pkUwFeGvY3M78LrmwskgC8DjnXaq+Nu7S+VoUp
feOXPvgu8OfuDe8MV7bFrlFtYjrFKshDSgEVmjn8HCP6LwqbVLs=
=jvMx
-----END PGP SIGNATURE-----

--uw54ovyua24wmrrh--
