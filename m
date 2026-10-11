Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5594E30F52B
	for <linux-man@vger.kernel.org>; Sun, 11 Oct 2026 17:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791738749; cv=none; b=o8lmihGozTwsYlncvEbiEYuUXPptNHjIUBbBdHc8o2rqCImcFdHrZbHDMeA04YekLFPYOGmXap0O8d9cdQ+aiRfSFtlhLEUhNqVl1btovEjR2NWibYpFkuzxlpVZFQr/v3hsGxmFzpy8CArArTeqklF3AqWQpguiJOgjAIjAMY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791738749; c=relaxed/simple;
	bh=c5TI3DMmARCLx4J+0zKBhKZ1LKQlxkSNoqdhprBSePg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=el0/ACs9JSXwnlZFh6yhay8/svtGQzzDfZrgM5lZZO6NPGIuY1SG9hTtp6hzD0Za8pJdYHygVGErIhv3ReOZ+MjP5w/YCXYdQQCE4Xih1M3KaPEg4qlrCeNAg81gwvMvXpTbfnjXesoEHb/18WKfFYJ4gEgt6eXPgDbHqG9PksE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DhbKqZNA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DhbKqZNA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4C891F0089B;
	Sun, 11 Oct 2026 17:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791738747;
	bh=H/zjLq+c2qbUu6lbzBF8hKNePJkMmW4BDgxaY51+FNA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DhbKqZNAqkH1rAARXFUhRm58DD+C1V4E9w/wgnILiI62c1eFeKnuFvlCHk3uRP6B1
	 kjQ1TS2vlxEXiR3kq8EV5cH6WoBfBQy+qmwD2WoaxUtxPc7M5uPIKmwKSZWAnC38bK
	 4fdO+lxDXQfvjOb4aY/H8yXDDopTJAg7F3CL9CzjRkXUfdN8J1Sf2OsyY9lgtS2x9V
	 vL/bhKvtvWrd4QaJTy50THLxwoXjYUwiPiuhayuCOzuwTZV1eLrvu/AsxZ+FJFtiED
	 lG1cX2stvEem9054ptc0carHesqhelww72F7CAB4xD5zrGPwhBy/MH/lQ81qKa5nhv
	 EeVHbeGEvXAWQ==
Date: Sun, 11 Oct 2026 19:12:23 +0200
From: Alejandro Colomar <alx@kernel.org>
To: astian <astian@memeware.net>
Cc: linux-man <linux-man@vger.kernel.org>
Subject: Re: [PATCH v2] man/man2/ioperm.2: wfix
Message-ID: <asvDZz1YFHM_Leg3@debian>
References: <20260917062039.1365378-2-astian@memeware.net>
 <20260917195740.1380709-1-astian@memeware.net>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aq6qwkc2cuavckie"
Content-Disposition: inline
In-Reply-To: <20260917195740.1380709-1-astian@memeware.net>


--aq6qwkc2cuavckie
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: astian <astian@memeware.net>
Cc: linux-man <linux-man@vger.kernel.org>
Subject: Re: [PATCH v2] man/man2/ioperm.2: wfix
Message-ID: <asvDZz1YFHM_Leg3@debian>
References: <20260917062039.1365378-2-astian@memeware.net>
 <20260917195740.1380709-1-astian@memeware.net>
MIME-Version: 1.0
In-Reply-To: <20260917195740.1380709-1-astian@memeware.net>

Hi astian,

> Date: 2026-09-17 19:57:28+0000
> From: astian <astian@memeware.net>
>
> Signed-off-by: astian <astian@memeware.net>
> ---

Thanks!  I've applied the patch.


Cheers,
Alex

>  man/man2/ioperm.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/man/man2/ioperm.2 b/man/man2/ioperm.2
> index e4a058164f6f..a0d7bcb1c99b 100644
> --- a/man/man2/ioperm.2
> +++ b/man/man2/ioperm.2
> @@ -4,7 +4,7 @@
>  .\"
>  .TH ioperm 2 (date) "Linux man-pages (unreleased)"
>  .SH NAME
> -ioperm \- set port input/output permissions
> +ioperm \- set I/O port permissions
>  .SH LIBRARY
>  Standard C library
>  .RI ( libc ,\~ \-lc )
> --=20
> 2.55.0
>=20
>=20

--=20
<https://www.alejandro-colomar.es>

--aq6qwkc2cuavckie
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrLw3cACgkQ64mZXMKQ
wqmNlw//a15V0osrhq7+hM8mCT1ejpg4yFlxrXM57bjxGiKMbC7KqLqvZLggG24d
jvt8J26Gahy3SQFrt9pJnXNG88WIP1MsW4kdCSrJeP38OrDpuW4riFb7Uw4D5DQp
iK65S/gb+4dXOkHtm9qO1dQNiXu3A0tGhcsJdV5NrHB2ylqX0r3RBlm86cX+oNds
z0nbt/ppA7hru1A3B0iaTENp7PiDfzy6iYHMMZFlqJoZPwsSxw4oecv6I0ZMx4+X
+zhefaJGHt/xNsxcq0PdF0qVksdUslDuH5Inqq29GomTLz0GK9Goju+emW2ImHOq
wvvhfuyZe130QuvbUtc6HULq5uL/QokiCgO5nICK37hVCskEdxOxRliDrs1kGynm
4GbA29wHtC5FWnoi8ST4wEe0YaypcK0RBm8Fc7qHYKDW79A1zw4HFQN6wxj7tq16
+nNqzhEIxZEpRixRYWev5ioD8QHuctCB7zXoWqQ/qcqxU0nZ3YVbWUhf4kTJuwJW
G2/R9U5Q0YBgni9Q2dbg2Xs3rpkTkxOthhDPjd9EytGEl0JGhIVrUADUVi8pZ6bb
25vTFmQq5HupwRRgEUc1ZNQKRBB4dcYYSE+ePW0XH07b+ibTbuyyyNg7EpPIlFnO
rZUnTM1vvXX4HCUFHTopgNjBvBHmZgJYzmbAmY3M+64lhgyx+0A=
=PPjA
-----END PGP SIGNATURE-----

--aq6qwkc2cuavckie--
