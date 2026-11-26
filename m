Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795733094;
	b=VfIEvqUv7R1gk0XiT541YI3YDkHjsOfE5NUw5h4w9AMItu8AGnEXUShSXW5F7TZWKhXS
	 6LqPq03QNIWBc7eCRR7PGKTJ/KgxPyzsvn34DwrAOr9VfhGLvCGm7Ar1YFX50HJjmy4Jw
	 5Zd8IRWrsByjZqoaSdvt8F9cP04gvyYdQCVFeAC6I6MWT6Od6Wo6+rBDhV37kjl1HFwHJ
	 2XPGKaFqMHpA2X5ulBB6VT8n3pSTf3FSB62E1hMRZILyVxtsgQwJug+k4wIke8jqLuPEt
	 CBn7d0ScGWa/8Dz4BUvrMwkJNQlJdm3OBDmujZsZNFchyJjPdj2uVi2Cv+XX6CnhW0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795733094;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=8oCCe074srq40wKt3Q4BGd2maBJcz/jBMIqpcPH8aVM=;
	b=yTr4dGSU6hdEBy9eRcwlqEZM5RkGtzA3YcR2QZdOJ0IVsC9ZbLMEUO9A/BXcKcHh/Zuj
	 ztNX5Mm/gOyBclZsqnslN0pkSjzEZm+ogyEO5ARzFGy4U9DF/ih1dlT9rgse9H+10DM7F
	 98wziNPmbIZcubKcHU+oY7dzP+3vZ8bDsgVOe5oWz7h4e2mu2TAx8rWhBTfq/zhQBIZIS
	 j+eMWHu0L32UCrPLZv0apSIr3lAH7mtmee/52BUDT+Gf742JP4EG4t4x0RPZ7DeWCvdb1
	 l/iQWRsMCKIwFf6lf479MZFdbLOi1xibD+Aj6MFF+AYI3V0Oyil0IXlPMAv+6++VwKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="GJUuhng/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA40606A31C
	for <linux-man@vger.kernel.org>; Thu, 26 Nov 2026 22:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GJUuhng/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D9F41F00896;
	Thu, 26 Nov 2026 22:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795733094;
	bh=8oCCe074srq40wKt3Q4BGd2maBJcz/jBMIqpcPH8aVM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GJUuhng/XrVe6tnVgKshjhtZNXx2Tq0KGS2yXT0Ubgn7yYLSzaWNdad6yw++pr9a7
	 GES4tex1mJuCr579R42Sr6/1i2X11gAi4AC9SjVhtn5yfy9k0ldZF5/IpJKFuizUFy
	 K+ZEoM+H6LmfoqiKd06zpraF568rAFNYWXUz3OG3sD+WZSawcmL+DJxT5LnnzVib57
	 1lH61CFlrwcl5aaOif6wWKwTdgmvW6vFBvKPumgdo7IBPGsTi4JjcDL7u8CwuXjpIe
	 rgqoSdGgjBwkpvzOKBntTJ63PM/MQq7k+isN4Z+dZ5maLhwMY13/XBNOIOy8JYxUjm
	 WXrKTegTgBmQA==
Date: Thu, 26 Nov 2026 23:44:51 +0100
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Amir Goldstein <amir73il@gmail.com>
Cc: Miklos Szeredi <mszeredi@redhat.com>, Jan Kara <jack@suse.cz>, 
	Christian Brauner <brauner@kernel.org>, linux-man@vger.kernel.org
Subject: Re: [PATCH] man/man?/fanotify*: Fix release version of mount
 namespace events
Message-ID: <awi2UO2Ixy0uOqA1@devuan>
References: <20261123085234.1879489-1-amir73il@gmail.com>
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
	protocol="application/pgp-signature"; boundary="kc72euo2wdvq5a3q"
Content-Disposition: inline
In-Reply-To: <20261123085234.1879489-1-amir73il@gmail.com>


--kc72euo2wdvq5a3q
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Amir Goldstein <amir73il@gmail.com>
Cc: Miklos Szeredi <mszeredi@redhat.com>, Jan Kara <jack@suse.cz>, 
	Christian Brauner <brauner@kernel.org>, linux-man@vger.kernel.org
Subject: Re: [PATCH] man/man?/fanotify*: Fix release version of mount
 namespace events
Message-ID: <awi2UO2Ixy0uOqA1@devuan>
References: <20261123085234.1879489-1-amir73il@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20261123085234.1879489-1-amir73il@gmail.com>

Hi Amir,

> Date: 2026-11-23 09:52:34+0100
> From: Amir Goldstein <amir73il@gmail.com>
>
> The mount events were added in kernel v6.15 not in v6.14.
>=20
> Fixes: 4c4d9f0f5148 (2025-04-04; "man/man?/fanotify*: Document mount name=
space events")
> Signed-off-by: Amir Goldstein <amir73il@gmail.com>

Thanks!  I've applied the patch.


Have a lovely night!
Alex

> ---
>  man/man2/fanotify_init.2 | 2 +-
>  man/man2/fanotify_mark.2 | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/man/man2/fanotify_init.2 b/man/man2/fanotify_init.2
> index c84de7ea1..1f1b5e7f1 100644
> --- a/man/man2/fanotify_init.2
> +++ b/man/man2/fanotify_init.2
> @@ -332,7 +332,7 @@ that the directory entry is referring to.
>  This is a synonym for
>  .RB ( FAN_REPORT_DFID_NAME | FAN_REPORT_FID | FAN_REPORT_TARGET_FID ).
>  .TP
> -.BR FAN_REPORT_MNT " (since Linux 6.14)"
> +.BR FAN_REPORT_MNT " (since Linux 6.15)"
>  .\" commit 0f46d81f2bce970b1c562aa3c944a271bbec2729
>  This value allows the receipt of events which contain additional informa=
tion
>  about the underlying mount correlated to an event.
> diff --git a/man/man2/fanotify_mark.2 b/man/man2/fanotify_mark.2
> index a3b77537c..bb8e45c74 100644
> --- a/man/man2/fanotify_mark.2
> +++ b/man/man2/fanotify_mark.2
> @@ -101,7 +101,7 @@ If the filesystem object to be marked is not a direct=
ory, the error
>  .B ENOTDIR
>  shall be raised.
>  .TP
> -.BR FAN_MARK_MNTNS " (since Linux 6.14)"
> +.BR FAN_MARK_MNTNS " (since Linux 6.15)"
>  .\" commit 0f46d81f2bce970b1c562aa3c944a271bbec2729
>  Mark the mount namespace specified by
>  .IR path .
> @@ -413,7 +413,7 @@ is required.
>  .TP
>  .B FAN_MNT_ATTACH
>  .TQ
> -.BR FAN_MNT_DETACH " (both since Linux 6.14)"
> +.BR FAN_MNT_DETACH " (both since Linux 6.15)"
>  .\" commit 0f46d81f2bce970b1c562aa3c944a271bbec2729
>  Create an event when
>  a mount was attached to or detached from a marked mount namespace,
> --=20
> 2.56.1
>=20

--=20
<https://www.alejandro-colomar.es>

--kc72euo2wdvq5a3q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmsItmIACgkQ64mZXMKQ
wqlgPhAApyYeOFjHFI6M7zJbNH16yC0uLXjUzh4A9TfoYfODMQ4CNo0NRzyEVTGg
aqd4jM3/JHsiK08LERCikJWEoP51fB3L+SYsn+ryPhUgPzhP6CjwaxB4Rh3xXgvv
/jzOJhEiEYuxl3DBOGkcfgzYpVaQ/ZsQ9IcsYdFt0+8TSQlm/IqGFEA+039ehk9e
oYswIUNcBeiRvhjuuSJRibBgX7czl6310dVZTugIHm0/sGO60K1TKC640A4zJ9gD
xMDYxkGzCR0yIZjnBX9HYkzAWeyzrO5fzkfv8o4SwsxSpHzT5aapJHdM8og165UW
m+N1j37BgvW/JkOWM7rIZ6Dj6TqF8x9yBqrIZLd86JGGCZs0JVDCoPeJQcjomwvg
EmlA85M44eOlsAn6czhDFTFm0vCxhldjMbSuggnA62mO81iu3n5p1I5852j5fViY
1aQFCmpZKaF2J8HFhz9Vu9XQ9YYyzJ6PX1QrYxmZkvQM5QMNLVUcCXr6hdBTM7iV
GuhlAelubBQ0vSKZL49vgC7N6L9u31SJxnx1QZSuxX2jyJ1YzeItRhp0KQpjhzdd
BJGT0DtTnKGcO5tZscy8vhRBEZLnHjG7Obqg+EMwXGBBQh3AWhHnBK7W4BPG89ZG
51KKJf1k4uu7U7gwUS3uW6yqgelQClFxkuUQZML4NvXofniMAWk=
=ooDs
-----END PGP SIGNATURE-----

--kc72euo2wdvq5a3q--
