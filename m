Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE44935200C
	for <linux-man@vger.kernel.org>; Sat, 10 Oct 2026 18:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791655944; cv=none; b=rRKQV8Ty7LYbA1ZwdrGJRSqUoCthJchx1gfmv1SAJJG36UhT+7PzsrGiyjrz30fjtboFypgy8n7PIZS4xsqKlcuT4oZxk2CoXKX+JK+lJON0vhzMHqGjImk4sw3F3FI34rtwZimRWBkSh7aahFMkkKIvfqHAls3yV7/l0i3emfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791655944; c=relaxed/simple;
	bh=VfAeIaNdciHQIhFUN6UU93iyD14ziFbumc+QqV4kiPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JZcXcsHpsGNKHWEoaYv/J5JPfgpAnET8LzjUoH8BXKuMg9aOMH+hz4ByECn0mzP2eMVyTYiVhK8WI3wLmMX0PpfPs3OZMmzzMzs3IJRTGLBOCBzFKwugikCZhViHu3bZS0Ribo4MNko2G1lFWYVYQ3gvSW3lH/YHwjnXWrZeYr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XV9bP6oj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XV9bP6oj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A30D1F000FF;
	Sat, 10 Oct 2026 18:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791655943;
	bh=t6Cgm6O3MarbKrlb24adEdRpnOxhXtdS4gp9eKdmOZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XV9bP6ojTVX8xECWdB4gLous5n/Rwn8BiTY7rjKgXFJEyqyLHKslsZ+kJCkt3xmsI
	 tE8tBKOsJymQkIsnkXaU3iWPb24D0LGHcZc6Pc4FGqfGxWvTQzFTGtvWdhb7hdnrDa
	 wKkIjBXxftBbRrGVHjfgv0qxV+st6A6almDQFvrHuI7+0jQixR+8auVpyIlYgq1kJ/
	 bPpL3fiq63cqvrX3TxZ54z752rZG13nKnCCe2buDG+FioRj2z2QzZAx/yq55W9lHwO
	 qPDC1I0h7MtuFl0RSBI2SPrOsl2nRKwg47F1xF5ObtaoclkOmk0BnZbX3xMQnksjOW
	 7o9w9ZidmjK2g==
Date: Sat, 10 Oct 2026 20:12:19 +0200
From: Alejandro Colomar <alx@kernel.org>
To: ben.kuo.tw@proton.me
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH] man/man7/mount_namespaces.7: Add missing
 'filesystemtype' argument to mount(2)
Message-ID: <asp_5E4yvOEyhR3y@debian>
References: <20261004-mount-ns-mount-args-v1-1-a344b18c0c22@proton.me>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vqdy3iolwjjh2akz"
Content-Disposition: inline
In-Reply-To: <20261004-mount-ns-mount-args-v1-1-a344b18c0c22@proton.me>


--vqdy3iolwjjh2akz
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: ben.kuo.tw@proton.me
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH] man/man7/mount_namespaces.7: Add missing
 'filesystemtype' argument to mount(2)
Message-ID: <asp_5E4yvOEyhR3y@debian>
References: <20261004-mount-ns-mount-args-v1-1-a344b18c0c22@proton.me>
MIME-Version: 1.0
In-Reply-To: <20261004-mount-ns-mount-args-v1-1-a344b18c0c22@proton.me>

Hi Ben,

> Date: 2026-10-04 16:49:17+0800
> From: Ben Kuo via B4 Relay <devnull+ben.kuo.tw.proton.me@kernel.org>
>
> From: Ben Kuo <ben.kuo.tw@proton.me>
>=20
> The example call omits the 'filesystemtype' argument, so it passes
> four arguments to mount(2), which takes five.  As written, it fails
> to compile:
>=20
> 	error: too few arguments to function 'mount'
>=20
> Tested by compiling the corrected call with gcc 14.2.0 and running
> it after unshare(CLONE_NEWNS) on Linux 6.12 (Debian 13, arm64);
> findmnt(8) shows '/' with slave propagation.
>=20
> Fixes: a2fc45a9f (2019-10-07; "mount_namespaces.7: It may be desirable to=
 disable propagation after creating a namespace")
> Signed-off-by: Ben Kuo <ben.kuo.tw@proton.me>
> ---

Thanks!  I've applied the patch.


Have a lovely day!
Alex

>  man/man7/mount_namespaces.7 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/man/man7/mount_namespaces.7 b/man/man7/mount_namespaces.7
> index 8ed43a34623310f5c0b6b2071815340b287415aa..8f9c8e6e147a42b85d9d2cc2c=
691037ef82395f5 100644
> --- a/man/man7/mount_namespaces.7
> +++ b/man/man7/mount_namespaces.7
> @@ -1051,7 +1051,7 @@ using a call such as the following:
>  .P
>  .in +4n
>  .EX
> -mount(NULL, "/", MS_SLAVE | MS_REC, NULL);
> +mount(NULL, "/", NULL, MS_SLAVE | MS_REC, NULL);
>  .EE
>  .in
>  .P
>=20
> ---
> base-commit: 31d36870d5f239d485772f1dbf17948bc35bee80
> change-id: 20261004-mount-ns-mount-args-98990fdab699
>=20
> Best regards,
> --=20
> Ben Kuo <ben.kuo.tw@proton.me>
>=20
>=20
>=20

--=20
<https://www.alejandro-colomar.es>

--vqdy3iolwjjh2akz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrKgAMACgkQ64mZXMKQ
wqmdJg//ZGsaYFqEmDfBlzvC0XDHB2UzcGJJQ6TYPBApXWlq3wXPcD+SAI8T0TOE
KKuFAAI+QEBfsK7VrTQVupHJsdZ/hl2ezbC1gmffmpymXXLTaP1JZ7ErVEjhhB9Q
wFOSQcbuPeBmUKW4x8n0uga0RZezIUZYK6tBD3W9SAkX/VPRCgOS2AWZqpWspHcm
Aw4w2QwGvaHYTZJP8mU043S+5e3YYmUDRtaEmLeQESHFxkW02OPrI67nt68yV8v6
Og00yL2boUBApum7VlvLvVnZQMdE9Xi/mvePXFVUQvv2cXE27ZiqgDinCRk1JIpM
FRNupKSqP33vN1nvbx8IhUtvNZIIY+oaIn6NpeNAGsReLmBAc07NkPPsG15PoMUc
9mvlEf/JWeXQv0KJmKqHtCCDNZKmaX4IVnFnzX/lCS9mCKuhlgc5vzSNzHfDRBI7
PcVb2PnHJ06S7O6pLN4QtbIqAr0eV1wPFAUGH7JiEkwERUv+0q1mGdxP5q2oYlmH
OqdJd6/4l+I247Yf+2WJmZAxylBaQGhEG1EFcU/zFoG5MuVJ+va0V1GXy+8l8OV5
P/5oTK9YeK/Dx5zuJRiuWs6b6ZoKLMpxhJsLewB5oCpQOCC2NjYwD6WQk0hVI11Y
x3dxy88YWSt22ccHgm0KFBOD/Hhn0gl1VMCGYPQTfldT6LWKBNo=
=LrNs
-----END PGP SIGNATURE-----

--vqdy3iolwjjh2akz--
