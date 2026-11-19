Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795130701;
	b=X+t5Ie9IF5iY4FLx7WTgYejXTl++/UvuxCTpSi+EuSEMIsTy4mXgXoaDoAI7NTIUwugo
	 NfetyQcbaFXVzMmDXWuvV8H7/omPHFCu1uN8pJUDFR0OP/2PXrjk6UHeaM2kcyj9gA6AU
	 kLgEosR6n2kZvifE50Giy1VoaWjg5yo79EODsyCkrs+R/V+gdoJR7Bpn6RV/MISlaWpqm
	 L9K+FnebyDoN6ter3D8046ymNO8pOk5Yq9zdSBjQCItPFdGtIymIIur0EJMYrMZllQqtq
	 qdrCZPhqOhu9GCZKFDb3ca55KC25JYwVOn6DPJwgbn+AUqhDIsi9Tgk7DkBKsLTtjwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795130701;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=If0DovYyj1fwRplxwLHsH5eJVYb98WA1na/LQ0D14qw=;
	b=Wk8Zy9YpatedR2qnDkf8JnV/tRvIGh5VOLGpG4t1MrPjxZUdEffmHA01shQSwYJirxBi
	 XNx1hFAZqwSR7KYeXdv7NNhXCoL9ngHBKDS4hsbBtY8yC6e5dvTU3Lr2oXZMLAflC13uA
	 ELVHMCSvOdh7NWOJrXRxjBDpsVdaxN3dOY2UmtczQp8GkzGulilCLnOSSo/caKNQ5qNi1
	 wg7c+qoXTtz4f+8JhatraADaVqpm0/EdiUSQkJIayJDwmPx5SM3XJg+j8GMzIcnGGoajD
	 NE5K4Z/rORhK4ChoXAKBkoWdeaeRv/+te5tsd88LKbriX3Tq6mck8xXLCfzoB4XUZGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="S0/w5gJx";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8350606A325
	for <linux-man@vger.kernel.org>; Thu, 19 Nov 2026 23:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S0/w5gJx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7F531F000C4;
	Thu, 19 Nov 2026 23:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795130701;
	bh=If0DovYyj1fwRplxwLHsH5eJVYb98WA1na/LQ0D14qw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S0/w5gJxDWiIbL7xtUfu6gcA7SrQSTecThrDaNdN//5w7lFZfe9G39PJx3O91Z0lP
	 NJuR0lPD7FGWA57ge0ccSeBYB5mXjbOoUz0xH/kraSfdRmyM7JhFSv2ZMp2e7xaHIH
	 cDIBEmNGlu5v7c4psZeE9GAekuADRaLn5lD5jZxNecTC/sH3m19DYXFhCxHvCfiusA
	 v9rlvwjlaWVcyduYkrxISdnYaDIDXOvezKMJOzL9KJn9C4r1S4hw8v+vTuBhkXFW0L
	 lr/uA6ZX0kRi8w+DKB4bTcX8BvohrHGPhQbPPey1lZlGL2bbck2UxUPqjKSrit5aK7
	 3pOLNRl7ABPbw==
Date: Fri, 20 Nov 2026 00:24:58 +0100
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Tingmao Wang <m@maowtm.org>
Cc: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
	=?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>, linux-man@vger.kernel.org
Subject: Re: [PATCH] man/man2/landlock_add_rule.2: Add a missing EINVAL case
Message-ID: <av-FNlfcTNAu-yf3@devuan>
References: <20261119170554.224641-1-m@maowtm.org>
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
	protocol="application/pgp-signature"; boundary="2l46z5metlci2a6z"
Content-Disposition: inline
In-Reply-To: <20261119170554.224641-1-m@maowtm.org>


--2l46z5metlci2a6z
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Tingmao Wang <m@maowtm.org>
Cc: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
	=?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>, linux-man@vger.kernel.org
Subject: Re: [PATCH] man/man2/landlock_add_rule.2: Add a missing EINVAL case
Message-ID: <av-FNlfcTNAu-yf3@devuan>
References: <20261119170554.224641-1-m@maowtm.org>
MIME-Version: 1.0
In-Reply-To: <20261119170554.224641-1-m@maowtm.org>

Hi Tingmao,

> Date: 2026-11-19 17:05:53+0000
> From: Tingmao Wang <m@maowtm.org>
>
> This is another way it can return EINVAL but is not documented.  Document=
ing
> it is useful to help rule out errors.
>=20
> This syncs this doc with the same change in the kernel [1].
>=20
> Link: https://lore.kernel.org/linux-security-module/20261116233139.206924=
-1-m@maowtm.org/ [1]
> Signed-off-by: Tingmao Wang <m@maowtm.org>

Thanks!  I've applied the patch.


Have a lovely night!
Alex

> ---
>  man/man2/landlock_add_rule.2 | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/man/man2/landlock_add_rule.2 b/man/man2/landlock_add_rule.2
> index 253498bfa..f6a812c7f 100644
> --- a/man/man2/landlock_add_rule.2
> +++ b/man/man2/landlock_add_rule.2
> @@ -206,6 +206,10 @@ .SH ERRORS
>  is not valid.
>  .TP
>  .B EINVAL
> +.I rule_type
> +is not valid.
> +.TP
> +.B EINVAL
>  The rule accesses are inconsistent (i.e.,
>  .I rule_attr\->allowed_access
>  is not a subset of the ruleset handled accesses).
> --=20
> 2.56.1
>=20
>=20

--=20
<https://www.alejandro-colomar.es>

--2l46z5metlci2a6z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmr/hUoACgkQ64mZXMKQ
wqn/Cw//e5MLprkXvZhjZjxv2m0F//yQJvkIxJuS83J/wgJLlen3HykbWzA7HvWj
1Y//VgXxQgaWbznMMuUg+V4iUao1824vaQYicqA66sK/iISdzdud+Sc9g5g0YCMb
3gISlCSUe+KtTVNhTpcFOLyfssRgpLY81AxEalHiTe6/18X0egOEmULQ5giPvk0U
5WumImXxWyQQ5R7tHyOmD/GVomRTw7nv0JiRARP8zny8IDoY9RQ0i8jJeU7hg/Da
2RuH6Is19NyhtcByqQNipuvZIvmvUzPGz/HyZlByrINhFUOdCfSOpJiN2JlW3gQp
mWKqnt/sZmxrQI835WZNnY0nUCEi1HtcgNcbNgX5tECuPjH67LKYATx+3lGTihnH
pDb0Rpte3oWlvT5PzF84ODLLej288ieLkstJoEJanMCK4Tsew4xnXfHKWo8Yoh92
aaLqTBBeTU1kU+ZU2RWljjvB7DWQlP8d55IOUp3hJ0OiJoYDOj15tqPt4v6xBJ1F
lN4QNMD+H40v3eizn6agVHS56eefOEJSy5PqoekfCeu16COyHqMne1NuQ3Bmg97Y
GY8Z9bVlaK3wi8HNRs6f4fMxo9Z6A/F5ajqnrYVluiCVS9QLPErkMk7L+tDRSgSw
X0iuaKHwc8pHJIB1nNa3FnrEpdJVGgI2E2rNDMMg9X4ubz+UVT0=
=vsSe
-----END PGP SIGNATURE-----

--2l46z5metlci2a6z--
