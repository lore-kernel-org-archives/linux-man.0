Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792703657;
	b=0O6ZIuuL6XzLn9iYux5rxuiJmwOvbdPV++LdkZDkzZOGLupUDIyTvxMuxNri9bvUU6mA
	 dNkA0+0Jkby3W/ln3htbXmiXwQHFVLFy+abWje8tDH3vCeowbGjCkFRGX4c641edUUcAz
	 sfaZiEnOZgF3wQFbcHakxsFKd1GrvC2H4s5GoPJZ49gOXIyrErBkuBGcJ3vLMvwllx3bn
	 yDRRezr9NKco4d3hHbhbKzG6Yp9eEgjlkBEGnWfq7BStBAWEZNz4eFcAq3Y7rJ4zmOSoo
	 lnjwsx5PxLRU98M0BaLNUKtwx+/hD4ZWUpisuBW7kSNz7Vwoo0RR2lh8jhgUP988anw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792703657;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=2nvLUCNhtVUiSCwNaOpSqAlCFexYnahH1x6wtLyh+HA=;
	b=yCJQBt7az+vAhVHCyS/OfsdV97M6FREj4zrShGBJriIPhUy2Cs9IhqReM6GEOcg+Jql1
	 Gt6TTwII9vlP4mNmv+HbJ0WMI7/no5QkrHzBfERzImB9d2c+S9H6DMzAw2qXPYrh/QLlC
	 p1e9e7k+2rrPmoZT+y57mfd9A/e4TB0OYfsKZdGkR5LwVH41Bsi4pWmcSzpFKU+iLlPvF
	 kpERnJBXbNjf6+qjXRr8TLi3yuTh6PjjZcjo2kzWmpAv5mKgrFeUiyMrLtD7AYd25JY57
	 /ClG98bOAJ4dbI8Ex8BUHGckdOEDFLLQmcaIH0KUfvEtaQEritTINz6M55mte1VIlWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EA3aoY3V;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C61606A319
	for <linux-man@vger.kernel.org>; Thu, 22 Oct 2026 21:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EA3aoY3V
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B6E21F01828;
	Thu, 22 Oct 2026 21:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792703656;
	bh=2nvLUCNhtVUiSCwNaOpSqAlCFexYnahH1x6wtLyh+HA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EA3aoY3VvZIK5NAjFa+eyKvwWzYR0T+dDbbkeatppJ/YeYE5bzKn7URRnzv4nAjFe
	 7bpQ/AiDE7h5Ecq4JYBjwVvGfMy3VnuDgsEiQBwdFMphmKEQ6rS8IwReUzoP0NkSuE
	 /XCoC77/vamdFholZRki03zqmJa5yPb5sq7nnoAnuRAKVkUKykWGpqdOn+Fgi1tFnQ
	 s5Pr0pW2E6bxygAeMd1nyhSUcj6dymQ1VuwUlae4h5am/mKaeWD9ehCRiBR21dG4fN
	 YJkwPoyLRj+biEway6fKQJCx1wwPFZ3VRLaAMJXdoi+hbFWt+q5R6Pt5WwgdvF0mfs
	 Y+EQTxP/2f2/A==
Date: Thu, 22 Oct 2026 23:14:09 +0200
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: linux-man@vger.kernel.org, Michael Kerrisk <mtk.manpages@gmail.com>, 
	Willy Tarreau <w@1wt.eu>, Kuniyuki Iwashima <kuniyu@google.com>
Subject: Re: [PATCH 1/7] man/man7/unix.7: ERRORS: ETOOMANYREFS: Fix the
 conditions
Message-ID: <atp8BcbYwm9iJiw3@debian>
References: <20261021212256.27961-1-gnoack3000@gmail.com>
 <20261021212256.27961-2-gnoack3000@gmail.com>
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
	protocol="application/pgp-signature"; boundary="b5rfqubtqbheqc3q"
Content-Disposition: inline
In-Reply-To: <20261021212256.27961-2-gnoack3000@gmail.com>


--b5rfqubtqbheqc3q
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: linux-man@vger.kernel.org, Michael Kerrisk <mtk.manpages@gmail.com>, 
	Willy Tarreau <w@1wt.eu>, Kuniyuki Iwashima <kuniyu@google.com>
Subject: Re: [PATCH 1/7] man/man7/unix.7: ERRORS: ETOOMANYREFS: Fix the
 conditions
Message-ID: <atp8BcbYwm9iJiw3@debian>
References: <20261021212256.27961-1-gnoack3000@gmail.com>
 <20261021212256.27961-2-gnoack3000@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20261021212256.27961-2-gnoack3000@gmail.com>

Hi G=C3=BCnther

> Date: 2026-10-21 23:22:50+0200
> From: G=C3=BCnther Noack <gnoack3000@gmail.com>
>
> The ETOOMANYREFS error is detected in too_many_unix_fds() in
> net/unix/af_unix.c when the user's (not the processes') in-flight FDs
> exceed RLIMIT_NOFILE, and the process has neither CAP_SYS_RESOURCE nor
> CAP_SYS_ADMIN.  The error is raised when all of the following
> (simplified) conditions are true:
>=20
> * user->unix_inflight > task_rlimit(p, RLIMIT_NOFILE)
> * !capable(CAP_SYS_RESOURCE)
> * !capable(CAP_SYS_ADMIN)
>=20
> The check was introduced in linux.git 712f4aad406b (2016-01-11; "unix:
> properly account for FDs passed over unix sockets").
>=20
> Fixes: dc4eea68b565 (2016-12-17; "unix.7: Document ETOOMANYREFS for SCM_R=
IGHTS send exceeding RLIMIT_NOFILE limit")
> Cc: Michael Kerrisk <mtk.manpages@gmail.com>
> Cc: Willy Tarreau <w@1wt.eu>
> Cc: Kuniyuki Iwashima <kuniyu@google.com>
> Assisted-by: LLM
> Signed-off-by: G=C3=BCnther Noack <gnoack3000@gmail.com>
> ---

Reviewed-by: Alejandro Colomar <alx@kernel.org>

>=20
> Notes:
>     Double checked in code -- the condition under which this error is
>     returned was not fully spelled out.
>=20
>  man/man7/unix.7 | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/man/man7/unix.7 b/man/man7/unix.7
> index 79198445c581..0d2ea8bda2ae 100644
> --- a/man/man7/unix.7
> +++ b/man/man7/unix.7
> @@ -785,10 +785,14 @@ when sending a file descriptor as ancillary data ov=
er

Would you mind having a look at CONTRIBUTING.d/git for improving the
hunk context?

    git-diff(1), gitattributes(5)
	To produce useful hunk contexts in manual pages, we need to hack
	git(1)'s idea of a function name, and also to tell git what is a
	manual page.

		$ git config --global diff.man.xfuncname '^\.S[SHsh] .*$';
		$ mkdir -p ~/.config/git/;
		$ echo '*.[0-9]* diff=3Dman' >>~/.config/git/attributes;


Cheers,
Alex

>  a UNIX domain socket (see the description of
>  .BR SCM_RIGHTS ,
>  above).
> -It occurs if the number of "in-flight" file descriptors exceeds the
> +It occurs if the number of "in-flight" file descriptors
> +sent by processes of the caller's real user ID
> +exceeds the caller's
>  .B RLIMIT_NOFILE
> -resource limit and the caller does not have the
> +resource limit and the caller has neither the
>  .B CAP_SYS_RESOURCE
> +nor the
> +.B CAP_SYS_ADMIN
>  capability.
>  An in-flight file descriptor is one that has been sent using
>  .BR sendmsg (2)
> --=20
> 2.56.0
>=20
>=20

--=20
<https://www.alejandro-colomar.es>

--b5rfqubtqbheqc3q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrafJsACgkQ64mZXMKQ
wqn4IA//WWqBK8UPNgAG60sh7TUdxrA+pc48wgInfu5LesybMmThnlNpBftVIIZg
QhZy8vZkwckiUK4Uy2b2UGvenb5NgOwozXFbj+T2S0c/z/UdIURZstN/vi2FgQCc
92lgkqY9Iw9cV5gSbdYDn1JOiyiKdXHZ4VUAKQvwTCaxMtq4DroOdFQJogtzYrd+
GUnwTpzQ52j4K1PyByaYFm4nAbxCdBxtN2JfvsDodpd4K3OTIRyHVBZWfKH3CSmq
Qa8g/k+DHI6Y0OsvcShm6oudCHs2epUt5w0OJBay3A+SoE7a3os8htFX6Ia2AOVx
nXxRLsMSkrrnf3ZVRYwybbo271nWjvyl6Pu3h80fmAHEU7a95IYOFVN2h95L3nF4
GH+ZKMpi8qa+s5GfsaOWjgH2zt8FoTGjkq2Nm3C9QunpkMP+0qizGXatDDpPs2Ai
TUOjlss7Td5jVNdnCqiE4lb3pvQL6q4XVj02t2MT0tazE9rjsxr1jYSC7gMwHKbL
MTFcAPBhHigUAQIwO+8k47124wmuAObdU4qZ2VFwKcTws7EsKXF10li7YMdbqXqm
7dWE76E1aB9yT6G31yVI09COF4eluz7lOyVkNtO/Ib0LfqsvPkY7/cIfcX9DT+iV
93M/16oKu3d6T21ATOJrF93xJ7pKrL9be8SzBbXAF0x9hnP8Msg=
=241R
-----END PGP SIGNATURE-----

--b5rfqubtqbheqc3q--
