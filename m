Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792779614;
	b=tC9aetHlaXIZhX8Y089DpiML8M3CYxRRFn0mdxCY84/jZlV6X91bZ2c/KB/8p76GB5sw
	 xO6vjT4zxlYs59lBOiGdM7WUSGalNLR9/ZWTR8TtbKVg2c3wGdaV/pFqAT2QpkP0BIsie
	 /Fjc1vkfbaCbKgwio4qTYtqFtibZ43fFyGKeAn9TdO5gnvihsx6ciPQyrcrlCUoBUdLvs
	 LyBz28o4lLqkP30tDQAWQWbdGjTnYTl4h4+oYu552d8RtXxoSmHnW9oIvEkLAns86t85N
	 OUE1770qKRoXsHCL1JF19CLcb7+Cx/cSPx6BPL9+5XhBhOAe4nxP+eGCzpeV/1cj53Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792779614;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=+LGdUUmT2RZIM9hZ0OG4oWjyardU5EWbZ5sdZyjD5PU=;
	b=5lUNv/POa7BVpq9SZblDaQ66pvKwHmLK884w9qZs/0rWqSFmoES0g4lMrekG7BJpL9Qc
	 pm6dG5rFJiD/B4UhnZtVeY7kmQhmP7u81lERuM3Vp8PzfHtawv23xnvUrlsa5bIF0NK8r
	 2XeMiwqa0zJ+ft+e1XKNVOU6NuAi3bhUGb5r4aKCyKsxmoVHyOjpQctDeLM6trrccu47r
	 tIJCeZRYGSMxSYDPvzA6eblF1rPD+Kp/xo3emb1K6jtHtdrdd7DYqtNoFi/K2gWrWQ+MO
	 CLXRydLsdYbw69qaYNvbUX9JJGOyLAy4L1OTzWemb/iBOAkHsnjQZKkG/be2HiiseEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AwfE1TF9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E379606A32A
	for <linux-man@vger.kernel.org>; Fri, 23 Oct 2026 18:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AwfE1TF9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0EBD1F01825;
	Fri, 23 Oct 2026 18:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792779613;
	bh=+LGdUUmT2RZIM9hZ0OG4oWjyardU5EWbZ5sdZyjD5PU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AwfE1TF99jSV4vMdo1nJvVgahtkaDXZAlzyBbzjQyTFnLaktO/Fm1DF5fthmNnqU+
	 6GNgkIJuj3y8A3a/z1KK9GIoq4wMJqpnEyyc/vIxzJea7t4DLZc/LJKR1y0O15cGPW
	 XUNb5VqT3I+CrMs26qZV0FnHRIxZ6xGrQ9AQmDY4yXvE6pWT9xxlzL9W+FKcRamX0q
	 MBqL1gT2/MhQeWCZbVOrBXEqGgiPxw3O/IW945LagjVDFfA83K3VIWNV5pdYAbLwX4
	 LFP5ROzlFrHzyEoqGnSYDzThFxenRTqtO1Mn7N793/tLDj0So1Qr21bPPHuyeeSh4r
	 Ej9jVxm+nffYw==
Date: Fri, 23 Oct 2026 20:20:06 +0200
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: linux-man@vger.kernel.org, Jon Maloy <jmaloy@redhat.com>, 
	samanthakumar <samanthakumar@google.com>, Kuniyuki Iwashima <kuniyu@google.com>
Subject: Re: [PATCH 1/8] man/man7/socket.7: SO_PEEK_OFF: This option is no
 longer specific to unix(7)
Message-ID: <atulJkR7fAgyKhPP@debian>
References: <20261021210800.27338-2-gnoack3000@gmail.com>
 <20261021210800.27338-3-gnoack3000@gmail.com>
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
	protocol="application/pgp-signature"; boundary="3skh3jwfaojyitjc"
Content-Disposition: inline
In-Reply-To: <20261021210800.27338-3-gnoack3000@gmail.com>


--3skh3jwfaojyitjc
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: linux-man@vger.kernel.org, Jon Maloy <jmaloy@redhat.com>, 
	samanthakumar <samanthakumar@google.com>, Kuniyuki Iwashima <kuniyu@google.com>
Subject: Re: [PATCH 1/8] man/man7/socket.7: SO_PEEK_OFF: This option is no
 longer specific to unix(7)
Message-ID: <atulJkR7fAgyKhPP@debian>
References: <20261021210800.27338-2-gnoack3000@gmail.com>
 <20261021210800.27338-3-gnoack3000@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20261021210800.27338-3-gnoack3000@gmail.com>

Hi,

> Date: 2026-10-21 23:07:53+0200
> From: G=C3=BCnther Noack <gnoack3000@gmail.com>
>
> The option is implemented through proto_ops->set_peek_off, which is
> nowadays also set for UDP and TCP sockets:
>=20
> 	linux.git 627d2d6b5500 (2016-04-05; "udp: enable MSG_PEEK at non-zero of=
fset")
> 		Linux 4.7, UDP over IPv4 and IPv6
> 	linux.git 05ea491641d3 (2024-04-11; "tcp: add support for SO_PEEK_OFF so=
cket option")
> 		Linux 6.10, TCP over IPv4
> 	linux.git be9a4fb831b8 (2024-08-29; "tcp: add SO_PEEK_OFF socket option =
tor TCPv6")
> 		Linux 6.12, TCP over IPv6
>=20
> Cc: Jon Maloy <jmaloy@redhat.com>
> Cc: samanthakumar <samanthakumar@google.com>
> Cc: Kuniyuki Iwashima <kuniyu@google.com>
> Assisted-by: LLM
> Signed-off-by: G=C3=BCnther Noack <gnoack3000@gmail.com>

Reviewed-by: Alejandro Colomar <alx@kernel.org>

> ---
>=20
> Notes:
>     Double checked in code -- this feature has been added to these other
>     protocols since that man page section was written; I made sure that we
>     have all relevant commits listed as comments in the man page source.

Actually, I prefer them in the commit message.  These days of git(1),
the comments in the source code are less useful and more noise.


Cheers,
Alex

>=20
>  man/man7/socket.7 | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
>=20
> diff --git a/man/man7/socket.7 b/man/man7/socket.7
> index 96f6f173a40b..ebe0264d7ae4 100644
> --- a/man/man7/socket.7
> +++ b/man/man7/socket.7
> @@ -662,14 +662,24 @@ For more information, see
>  .TP
>  .BR SO_PEEK_OFF " (since Linux 3.4)"
>  .\" commit ef64a54f6e558155b4f149bb10666b9e914b6c54
> -This option, which is currently supported only for
> -.BR unix (7)
> -sockets, sets the value of the "peek offset" for the
> +This option sets the value of the "peek offset" for the
>  .BR recv (2)
>  system call when used with
>  .B MSG_PEEK
>  flag.
>  .IP
> +This option is supported for
> +.\" commit f55bb7f9cb82dec2f2e803d7bd0fc5929248e4d8
> +.BR unix (7)
> +sockets since Linux 3.4,
> +.\" commit 627d2d6b550094d88f9e518e15967e7bf906ebbf
> +for UDP sockets since Linux 4.7,
> +and for TCP sockets since
> +.\" commit 05ea491641d338422edbd87af3b311c16ea762f5
> +Linux 6.10 (IPv4) and
> +.\" commit be9a4fb831b8b6dc5724dd3e61973ea91b413ec1
> +Linux 6.12 (IPv6).
> +.IP
>  When this option is set to a negative value
>  (it is set to \-1 for all new sockets),
>  traditional behavior is provided:
> --=20
> 2.56.0
>=20
>=20

--=20
<https://www.alejandro-colomar.es>

--3skh3jwfaojyitjc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrbpVUACgkQ64mZXMKQ
wqmRFBAAu2rPOrssCgnwr1HHu0ogYxkDYSh/mvJ/euM46fxTmvhroVG4VMSB2WoT
LpuECfzP7Kp56wIXgqB4ocy9VKy57xYsHDxZORvMyMSLqt0+AsO3zvTTPEnGRSEB
QXA357LTcF6J11puDvUnrdqIIjpGvUHtt+lRXpHzk3kdzYObBdvIABK2Akv2Lmhp
+XpNh0cHKmMTLQoq4d4jODn8kMs5UW7i5frbAMgdKtKYWszRLqGAAacS5KKoVXXy
WJZsGjtnO0c2RDdPIDiSMf/jiOhx59n2kZmlRogiCOs39H2ztUuuUCXij8tANMar
c7ZKBm69tnzqxdbzYqwOogXDz8a1if/U1FLZAzW0NpsPzL3HxpVMHqhIjfvDmYoW
6nt7EBdc9qylbmR5jTmSkILaXPygbGjq8DtDdZLxJso6nhSpZuTj1lWk3UuDPXOk
NX99o0UTm7Ip/yBN0iejFPLzkN++HIjHqlPyDf1/Z2d9wrrJ+NkRPrp2WqTVVGu/
1utmPDJCxf4grz8JBw0IrBJjjverjq2R+byLlF5pZCLhqcsANMIQwcGCvfiPRJFr
A+EroPYByl1YBlXldL88Y5IrH+XdTZuRXxZKRHmPB7BvfPRqvCWa8Axz4uNwkpC9
c84beh7dUWLbOftQ0cypZo4Q06CXgLQCt9Jou01yYBlqMbTBQQ4=
=z0jT
-----END PGP SIGNATURE-----

--3skh3jwfaojyitjc--
