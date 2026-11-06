Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793970051;
	b=LfcNc6Z/W5LDz2UiQHrQ5/I76jvpVpyvEaBVHp+YdZnDpV39It9t/YoOYMKdhtvskkBi
	 HLq8bPFBjobh6oCQ7CS43Pqxy85Hx87vyBU/KrGyPZryFVKr+mGuaaDeuP1Vwy+3sbuyy
	 BtzgrL8uR4fO6+V7/4ld26+fHevmX4S7OnETNAha0xm+2dP81I4fytZ6rSWYU4lHTNwwP
	 OJHTtZaOlrnwNBV/NAPcZtVoL/knuYR01caXotWlq8PO6HGen8AxehJUFaIi48Yi8JZ4N
	 Pt/+qB/5znlx9yskdEbKNULbh62a7eEjeyv10jnf04m4/DuIVN8YyXrC0Bs3bg4XPqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793970051;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=pDY3mGTrB5iChDQV7Nf7cAy+ZWhYD3xMEJqGjGPSZx4=;
	b=dYhy9kIcf4t7CJbEw5OYMNB29zsB4xa4Zhkb4OT6E/vFGGlDtrc21lPtECHVttXhLhMF
	 j20DPTpP48cpTGL7bzyTGPgmc8v8Cf0VWAiyszXFDn786D8HqX90iCKLifdQhRJ4GKeUO
	 1FBO9oYA4fZ2QIAOd8xWKV6HnBLDW/GLKy0Widfzy4NJiK/QnpDtyWEvtHs+HirkIDu1U
	 vUx4hd966JLpRy202lrsD357qcIYjAhL3iNNWMr7Maw+4UfttAp2Luf7MAjqjYmXKPUBn
	 j3R5lezlWf3r/ZspWPDRVHQ8d4QwhcIzUobSL2KxzfJhkQifMqsbdS+2gDtcAsIkMNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rd7wQaPA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9AE606A326
	for <linux-man@vger.kernel.org>; Fri,  6 Nov 2026 13:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rd7wQaPA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD4961F0089F;
	Fri,  6 Nov 2026 13:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793970051;
	bh=pDY3mGTrB5iChDQV7Nf7cAy+ZWhYD3xMEJqGjGPSZx4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Rd7wQaPAsYPPNclCvPiR7ai7sOycDT2IUhSbFJpghMGgxQ5Sy1XV9JNMF4tCF5po1
	 UgrxuhCo0MudURCuyA/glZCdcv1Zrw4ADX/6xkAjRset6D9rBXKXgQODyxSVvqpFkc
	 bJqp0ZQs28dB2MdAUxjtD1QslSgEB4BmB1BKtH52xtSUt3P5Z3dS+aihLCcfY/hsrp
	 xEZiFxLpLnai9u3ZNX/vJYYpC69Rgl9rnYgaR4rNQg/gA+U4+MDAPFF+mEqLJjRqWF
	 pNnpRhA6HX0T5ZWKWWlI1Utm2qpCh18cERDOYP9EzsgeV1Wq6hQYwHw/P1V65vlBNJ
	 dYIGKk+kPKytQ==
Date: Fri, 6 Nov 2026 14:00:47 +0100
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>, linux-man@vger.kernel.org, 
	Michael Kerrisk <mtk.manpages@gmail.com>, Willy Tarreau <w@1wt.eu>, Alejandro Colomar <alx@kernel.org>
Subject: Re: [PATCH v2 1/8] man/man7/unix.7: ERRORS: ETOOMANYREFS: Fix the
 conditions
Message-ID: <au3PaAVf051LxmaT@devuan>
References: <20261103202211.13820-1-gnoack3000@gmail.com>
 <20261103202211.13820-2-gnoack3000@gmail.com>
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
	protocol="application/pgp-signature"; boundary="ftzmhn4b2u5qxbfg"
Content-Disposition: inline
In-Reply-To: <20261103202211.13820-2-gnoack3000@gmail.com>


--ftzmhn4b2u5qxbfg
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>, linux-man@vger.kernel.org, 
	Michael Kerrisk <mtk.manpages@gmail.com>, Willy Tarreau <w@1wt.eu>, Alejandro Colomar <alx@kernel.org>
Subject: Re: [PATCH v2 1/8] man/man7/unix.7: ERRORS: ETOOMANYREFS: Fix the
 conditions
Message-ID: <au3PaAVf051LxmaT@devuan>
References: <20261103202211.13820-1-gnoack3000@gmail.com>
 <20261103202211.13820-2-gnoack3000@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20261103202211.13820-2-gnoack3000@gmail.com>

Hi G=C3=BCnther,

> Date: 2026-11-03 21:22:03+0100
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
> Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
> Reviewed-by: Alejandro Colomar <alx@kernel.org>
> Signed-off-by: G=C3=BCnther Noack <gnoack3000@gmail.com>
> ---

I've applied this patch.  Thanks!


Cheers,
Alex

>=20
> Notes:
>     Double checked in code -- the condition under which this error is
>     returned was not fully spelled out.
>=20
>  man/man7/unix.7 | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/man/man7/unix.7 b/man/man7/unix.7
> index 2163a91514b9..94b9e82af3c0 100644
> --- a/man/man7/unix.7
> +++ b/man/man7/unix.7
> @@ -775,10 +775,14 @@ .SH ERRORS
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

--ftzmhn4b2u5qxbfg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrtz38ACgkQ64mZXMKQ
wqlN/g//bybTf3MUl7k1HmyAIbsnovsnhHXHPaQa7QFyVmrGN0v0tjh624wO3OGG
NEIElwYN/Wz+39IMLNA7RCgPLgf/9ZS20kMM2/dkb9S0LZ8NzLuSXk49XyguEjVo
W0+jM+JHKZjRWC2VzPCFwjxcawrPLf5fuBH0qAvLeysrN4UdLsT3k4hhvWb35Mgy
MkXgwDnEsIGnyT5i2gQkpJYcbvR941N6I+0kHR6kHTm4OK7GFkzQuhSDNhfaltOw
YtXvP5JYJPeD9Xu9pYHpvgyIYSBF0Hsp2lRl2duTP7zJmzwBbWyvt8AJlPgd9OD4
oKIUwBuTrL481MwXWOG7Qec2pX8/BfB7vy4hoqXxlonDGGs3dfLyU8JW56uC2AT4
nmShG8du5sZ77HHHyUw/9eqSMTTBfKxXWMGy2FaxPu6LVyWsFa9Bh4Q2D9x5myyi
xnIv3rm31g2FNvtIz85sOjtkFVmoJf2h2tKhLSvLItmnC/kxPRj/VXn2m/GlbnxL
6t0+WFv7wwbAMXvhz4q00OC8/O7TxtjxJ3g/pOv53yY8Ijo2SnHOsPpu32kfBJYt
/lThTpCjwOQKHkoYRq3ZFQEHD/W2VGXUIR7MeOCO+SFQiapswnUODFr4sbjRpaKG
HV2T/x4c38Sgl0wmBOO/ChS6oi1VncVJyuCX057ed54PwQ0QtAo=
=RKwh
-----END PGP SIGNATURE-----

--ftzmhn4b2u5qxbfg--
