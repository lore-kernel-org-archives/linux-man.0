Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794964424;
	b=Cdu7n71NZN+af9VWnpf2YMyZXK3k+LtNdGRKXQ3nPT79xm0ErqEPToqlJHTdvASH43O6
	 dVDxocJSuj1FOhaO7JIHzJ6kMDAwrVbKeXTeB+uKCM6sVbWzI3S5IhZpNNKvMAaYI/OoN
	 pdj2WGIwyT2geS15CI3xVUdkJjrWsCWwL0M4MttaWpw9mwhA8zk4ZW3TPlXuqxPRAHhrh
	 Be69mnmZ1Q36rACgeGFqQqSGdMzNR+vIqN0fiemy28pyrukZdSSDZ8m2Fa/OhF4rsBbNZ
	 6Dy7BWofMMcHNwL9YFEfghHPDOZK8/ZACiMdXOWPIBxAh5DP2Vd4RxLAc/yww6X+bIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794964424;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=4LirYZ8fS+j7Gvx7T7/z5tTU5o/XweCJgkckSIj8vy0=;
	b=0dzXFuRKjc8kYmjGy/krHa4UpC1SWIYV3VotlJ/Ga/8EV+m9kWoIU1NO6JGgYO5EtZVY
	 yhYieL0vu+9kSPlKHgRKvjk7Do187ogmFymOpaN91uD+v7RBvDlFY2yOfO/ABod2MvOeL
	 01/Yn778WGCyLWfkB/ANznelo5pYDE5vo7nN9pOCc+IEzvtG5gHqLXfiSubrb7D8pDn53
	 jcQ4wfODUlQeQrZ8MvJYQO3pK4FidNUNDLVkN+mlSBuUTYv5M1rNEDNn3XkvlmcVTc7+3
	 CygYEWMG4GNyNYhIqFEQcn6xXSS4DIbudD7vm6Asy747jp+gglbtt1kLEZYsBxTaWmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=luc0aXqF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74779606A31C
	for <linux-man@vger.kernel.org>; Wed, 18 Nov 2026 01:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=luc0aXqF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88C891F000C4;
	Wed, 18 Nov 2026 01:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794964424;
	bh=4LirYZ8fS+j7Gvx7T7/z5tTU5o/XweCJgkckSIj8vy0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=luc0aXqFCNUn7Hk8sSHVeqlG1U6Ly5K970JwTwyHH7bdrgJevQC1AIZWEC3ZcOPZ2
	 sY2hZ/VdLf+hG/AApDkD8ZhxKyMVyUOgTUUyE9K2uH5HyiT/5GkgvpUzyi5z3ur7kA
	 CZK0R3yjLYloht5t82LAjs5TfW/DaKXPB1tmH43NJsePgvV3jKRcJ27I74CjUuCCHG
	 WEsEsiet/rZOOGeZ9d9qwPv1idUfxogJMlT5U+QuAUX+2jQsSJK0WrYbttt/nAtSwq
	 SA9gr7mq5R1FVkDH2cVuvtKj1C00OXnX3+HYkYr+Jo0pjZ2WP30bDvbVzwOO3Zx9aD
	 cHwKWNS/Vq7Pw==
Date: Wed, 18 Nov 2026 02:13:40 +0100
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>, linux-man@vger.kernel.org, 
	Michael Kerrisk <mtk.manpages@gmail.com>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>
Subject: Re: [PATCH v2 4/8] man/man7/unix.7: SCM_SECURITY: Generalize to
 other LSMs, not just SELinux
Message-ID: <avz6f7OyIVCKusQ3@devuan>
References: <20261103202211.13820-1-gnoack3000@gmail.com>
 <20261103202211.13820-5-gnoack3000@gmail.com>
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
	protocol="application/pgp-signature"; boundary="uliyh2iwiu6pwkea"
Content-Disposition: inline
In-Reply-To: <20261103202211.13820-5-gnoack3000@gmail.com>


--uliyh2iwiu6pwkea
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>, linux-man@vger.kernel.org, 
	Michael Kerrisk <mtk.manpages@gmail.com>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>
Subject: Re: [PATCH v2 4/8] man/man7/unix.7: SCM_SECURITY: Generalize to
 other LSMs, not just SELinux
Message-ID: <avz6f7OyIVCKusQ3@devuan>
References: <20261103202211.13820-1-gnoack3000@gmail.com>
 <20261103202211.13820-5-gnoack3000@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20261103202211.13820-5-gnoack3000@gmail.com>

Hi G=C3=BCnther,

> Date: 2026-11-03 21:22:06+0100
> From: G=C3=BCnther Noack <gnoack3000@gmail.com>
>
> Reword the description of SCM_SECURITY to not be specific to SELinux.
>=20
> The security context is populated in scm_passec() in linux.git
> net/core/scm.c, through the security_secid_to_secctx() LSM hook, which
> is currently implemented by SELinux, Smack and AppArmor.
>=20
> As clarified in [1], the returned security context is in the general
> case a byte buffer, not a null-terminated string.  The only LSM that
> returns a buffer with trailing null byte is SELinux, but even that is
> not guaranteed in case that the message is truncated.
>=20
> Link: [1] <https://lore.kernel.org/all/auZcwYWv0NeiIR8d@google.com/>
> Fixes: ffad6a017f91 (2018-07-28; "unix.7: Document SCM_SECURITY ancillary=
 data")
> Cc: Michael Kerrisk <mtk.manpages@gmail.com>
> Cc: Kuniyuki Iwashima <kuniyu@google.com>
> Cc: Eric Dumazet <edumazet@kernel.org>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: Willem de Bruijn <willemb@google.com>
> Assisted-by: LLM
> Signed-off-by: G=C3=BCnther Noack <gnoack3000@gmail.com>
> ---
>=20
> Notes:
>     This feature is also available in other LSMs.  Unfortunately, they
>     implemented it inconsistently and that complicates the description of
>     how string boundaries are handled.  Linux does indeed neither
>     guarantee that this terminates with a NUL byte, nor that NAME_MAX is
>     large enough to hold it.
>    =20
>     After confirmation from Kuniyuki Iwashima, this documents it as
>     returning a byte buffer.
>    =20
>     I prefer this variant over the previous longer one, also because it
>     refers to the individual LSMs for the exact format.  A reader of the
>     security context will require LSM-specific documentation anyway to
>     interpret the security context.
>    =20
>     This patch is still LLM-assisted, but at this point, since everything
>     is rewritten now, the only LLM-assisted part is the discovery that
>     this part of the documentation could be improved.

You may use 'Reported-by: LLM' for distinguishing such cases.

>=20
>  man/man7/unix.7 | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
>=20
> diff --git a/man/man7/unix.7 b/man/man7/unix.7
> index 61f06a74359b..c0e2bdbacdd8 100644
> --- a/man/man7/unix.7
> +++ b/man/man7/unix.7
> @@ -312,7 +312,7 @@ .SS Socket options
>  is an integer boolean flag.
>  .TP
>  .B SO_PASSSEC
> -Enables receiving of the SELinux security label of the peer socket
> +Enables receiving of the security label of the peer socket
>  in an ancillary message of type
>  .B SCM_SECURITY
>  (see below).
> @@ -538,13 +538,16 @@ .SS Ancillary messages
>  option must be enabled on the socket.
>  .TP
>  .B SCM_SECURITY
> -Receive the SELinux security context (the security label)
> -of the peer socket.
> -The received ancillary data is a null-terminated string containing
> -the security context.
> -The receiver should allocate at least
> -.B NAME_MAX
> -bytes in the data portion of the ancillary message for this data.
> +Receive the security context (the security label)
> +of the peer socket,
> +as provided by the active Linux Security Module (LSM).
> +The received ancillary data is a byte buffer.
> +.IP
> +The exact format of the security context buffer
> +is defined by the active major LSM.
> +For example,
> +SELinux returns a SELinux label as a string
> +(including a terminating null byte).

Considering that the interface doesn't promise to respect the null byte
written by SELinux, I think I'd entirely remove this example, and
instead focus on disclaiming that regardless of the format, the buffer
is truncated in a way that destroys the format.

I'm not an expert of this feature (actually, never used it at all), so
maybe some silly question:

How is a user supposed to know how much space to provide to prevent this
problematic truncation?  Is there a buffer size that will guarantee no
truncation?  If so, we should instruct programmers to use it.  And if
there's no possible size that fits all, we should probably warn about
it.


Have a lovely night!
Alex

>  .IP
>  To receive the security context, the
>  .B SO_PASSSEC
> --=20
> 2.56.0
>=20
>=20

--=20
<https://www.alejandro-colomar.es>

--uliyh2iwiu6pwkea
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmr8+8QACgkQ64mZXMKQ
wqkWMQ//YgImitaWE8GICZzrwKtHX9NDxTT/yWEubQzG0sD/cD9TSXE24JOYcSqw
oy86OmxK7SqWUygqlrx0m+PNtMxPLvudGSNEEDWlJ+tz9JoHKb1lF2vMXG32zxtz
srV4TxDxGbG1O/cPR2q+lynyaUDJ4PRcxef31p5Kk7ydYkh8eJMr9J3XO8zRQvrA
yfpfR8oQSyh9yaX5kK437HL2ORHe8f5AbWOJnXewZjHCVUjgQxmzkUIADemY2DNl
GRaJk/EuVGC2JjqOG2Tz6ub+AiDJXMPY7KlsbTRujSAdMtqpd97hbkKfVP5iSIpo
vldo4a9rFkOIotQp+kGWJ3Ez3KauzaJi82vmUcmJRg5kX9uooPu5jVbIBWCWdFYn
DXHp/U+ezgLed0UzxYkr3oWSMmX1Ls2oIkYRuUhk3xoaS03HIKaKpZRTCuLA/jAd
zBy5yUQwx65NoDR0h3R6+PzFgYpe3pn7gMokV+26HN4Xvs3501Oaosbzh6lcMb0/
LauJG2bGuEViPMsW0SiVa+C4QGgw+joLBcwHR8C3E1wCNBLY5FirZ7rqXLnZg/qS
Y62uiIr/eUKtb/hD9VJoDeveifUwAOo6fZkV8O3LNVP0wjCqtBlLV0wrB1L6c9jQ
btUJqIdFmPAlRaXRXaJQ5zF6eEOeGc6RnrxvPhFpjp6kVS+9dtI=
=wYZ0
-----END PGP SIGNATURE-----

--uliyh2iwiu6pwkea--
