Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794873233;
	b=Yp/HrXDPCCCJHcrD+hOkCeHJmXIU87mr11u/ENGNRaJVWIHWGDKK79/+83LqMPHefDyW
	 hCe/kpUCY0wXOoc5SFw6jKaoagvtKP75klC+g/IwQHd/fOkcDobZIIojE2uTxC0lfghp6
	 wsXHr1TReNaIclIX+TbCrLw2ZxDOlHPPmn6RST7Hgr77AHtHVrp6KXCiBePiKciTzyrvF
	 +SA4xu/zg+A46g5TO1vL1hFgMCdHOTfmgTI6zOIyQNRP55maCofs0zXIrzlqrrwJnphMl
	 Fy5nPQomYkmi8ASIbWuNNK51hTC/fP1XfhF1D9wk8U8X7pXqQgm+/rfFBhp237/5SgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873233;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=4B+VWyl+b2jPN5fsty2fLi1L5Kv2g30BXDi8aG9PsCA=;
	b=deReztLFEapgGsGeKLf/NMBuVshSzfOrOre08tJhC6sVS93q2NrnBUcQSS+mj/Q4D/sw
	 hbRRJtYLFrK8BlouRnWsqH/4h9pWSn6nQj7peP6F/BT4AXcmqBPx+DBaJFF/ZTBm4wyUZ
	 rzUHChkAR8iZkjpp5mch65yKlsWaVWgEQnNMDKK8HJC4iLFoVa2FOq6ydJzs5J081wDPH
	 c2oOigVnuCUcRl+5Cns9uZZu0ksWKeVxAhO4zyC3GedbR06QK3hxARU/OihNBP1mfvbIb
	 JTXKV5sb+RplTPsMsxSyX4gluDw3P4PJ2ks6p3XmvNip4yLBLEgcD/pN/2kjbjCvVKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UIhDdFd3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B52606A323
	for <linux-man@vger.kernel.org>; Mon, 16 Nov 2026 23:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UIhDdFd3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE47C1F000C5;
	Mon, 16 Nov 2026 23:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794873232;
	bh=4B+VWyl+b2jPN5fsty2fLi1L5Kv2g30BXDi8aG9PsCA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UIhDdFd3frffalLswYscklmgFn9forEH+41Ui7BqpsY19l5rXb5C/STveyYvKUaW+
	 qnmS1pi0EhTUtJq+gbjSmeaoaCBN4SvQwecJ5rzCzbXuFO6fTEFhaQmqMOAFqIRRlv
	 sm84K9JpirqEUwtSj2X7G+JvzsBaUfSyefnr5NMPhiuX3qPLgccuNx+qSYL//Lvxoj
	 rbZb6lqQYYuizZNE8uKxgdaKHAuB3ErCi6v314x0Ce+Qbr4wnrR8KKoEQm2AeXIyaC
	 tcE+2xa/VpcDP5Tvna2Wyo0zcZCDjMAq4MyLuxLlbjgwEuVxz+sOEf3gYVmdCi6XEw
	 VyEFjaDKy4CCw==
Date: Tue, 17 Nov 2026 00:53:49 +0100
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>, linux-man@vger.kernel.org
Subject: Re: [PATCH v2 6/6] man/man7/unix.7: ERRORS: Document EACCES, EAGAIN,
 EMSGSIZE, ENOSPC, and EPERM
Message-ID: <avuXcN72JjJ7n23S@devuan>
References: <20261103202136.13574-1-gnoack3000@gmail.com>
 <20261103202136.13574-7-gnoack3000@gmail.com>
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
	protocol="application/pgp-signature"; boundary="tdxzhyyue7oy42ea"
Content-Disposition: inline
In-Reply-To: <20261103202136.13574-7-gnoack3000@gmail.com>


--tdxzhyyue7oy42ea
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>, linux-man@vger.kernel.org
Subject: Re: [PATCH v2 6/6] man/man7/unix.7: ERRORS: Document EACCES, EAGAIN,
 EMSGSIZE, ENOSPC, and EPERM
Message-ID: <avuXcN72JjJ7n23S@devuan>
References: <20261103202136.13574-1-gnoack3000@gmail.com>
 <20261103202136.13574-7-gnoack3000@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20261103202136.13574-7-gnoack3000@gmail.com>

Hi G=C3=BCnther,

> Date: 2026-11-03 21:21:36+0100
> From: G=C3=BCnther Noack <gnoack3000@gmail.com>
>
> These are all returned directly from linux.git net/unix/af_unix.c:
>=20
> EACCES
> 	unix_find_bsd() checks path_permission(&path, MAY_WRITE) on the
> 	socket file of the remote address.  The rule was already described
> 	in prose, but the error was not listed.
>=20
> EAGAIN
> 	unix_stream_connect() returns -EAGAIN when the listener's backlog
> 	is full and the socket is nonblocking (there is no EINPROGRESS for
> 	AF_UNIX).  unix_dgram_sendmsg() returns -EAGAIN when the receiver's
> 	queue is full and the send would block.
>=20
> EMSGSIZE
> 	unix_dgram_sendmsg() fails if 'len > sk->sk_sndbuf - 32'.  This is
> 	the limit described in "Sockets API".
>=20
> ENOSPC
> 	unix_autobind() fails when all 2^20 autobind names are taken.
>=20
> EPERM
> 	unix_dgram_connect() and unix_dgram_sendmsg() fail if
> 	!unix_may_send(), that is, if the target datagram socket is
> 	connected to a socket other than the caller's.
>=20
> 	This is not something that the remote end normally does,
> 	but it's a possible corner case.
>=20
> Cc: Kuniyuki Iwashima <kuniyu@google.com>
> Assisted-by: LLM
> Signed-off-by: G=C3=BCnther Noack <gnoack3000@gmail.com>
> ---
>=20
> Notes:
>     Verified in code.  Kept LLM wording, which seemed OK.
>    =20
>     Remark:
>    =20
>     The case where the remote end is connected to a different socket is
>     obscure, but still possible with Unix Domain Sockets, when a program
>     first bind(2)s to a name, and then connect(2)s to another name.  Then
>     that socket can be discovered by another process through the bound
>     name, but sending a dgram fails if the sender is not the one that that
>     socket has connected to.
>=20
>  man/man7/unix.7 | 36 ++++++++++++++++++++++++++++++++++--
>  1 file changed, 34 insertions(+), 2 deletions(-)
>=20
> diff --git a/man/man7/unix.7 b/man/man7/unix.7
> index 762bf0d1fe08..2163a91514b9 100644
> --- a/man/man7/unix.7
> +++ b/man/man7/unix.7
> @@ -645,9 +645,24 @@ .SS Ioctls
>  .\" and it may well change, probably best not to document this now.
>  .SH ERRORS
>  .TP
> +.B EACCES
> +Write permission is denied on the socket file
> +specified as the remote address to
> +.BR connect (2)
> +or
> +.BR sendto (2)
> +(see "Pathname socket ownership and permissions", above).
> +.TP
>  .B EADDRINUSE

Changes to EADDRINUSE are not documented in the commit message.


Have a lovely night!
Alex

> -The specified local address is already in use or the filesystem socket
> -object already exists.
> +The specified local address is already in use
> +or the file already exists.
> +.TP
> +.B EAGAIN
> +The socket is nonblocking, and either
> +.BR connect (2)
> +was called on a stream or sequenced-packet socket
> +and the backlog of the listening socket is full,
> +or a datagram was sent to a socket whose receive queue is full.
>  .TP
>  .B EBADF
>  This error can occur for
> @@ -684,6 +699,11 @@ .SH ERRORS
>  called on an already connected socket or a target address was
>  specified on a connected socket.
>  .TP
> +.B EMSGSIZE
> +The datagram to be sent is larger than the limit imposed by the
> +.B SO_SNDBUF
> +socket option (see "Sockets API", above).
> +.TP
>  .B ENFILE
>  The system-wide limit on the total number of open files has been reached.
>  .TP
> @@ -695,6 +715,11 @@ .SH ERRORS
>  .B ENOMEM
>  Out of memory.
>  .TP
> +.B ENOSPC
> +The socket was to be autobound,
> +but all autobind addresses are in use
> +(see "Autobind feature", above).
> +.TP
>  .B ENOTCONN
>  Socket operation needs a target address, but the socket is not connected.
>  .TP
> @@ -706,6 +731,13 @@ .SH ERRORS
>  The sender passed invalid credentials in the
>  .IR "struct ucred" .
>  .TP
> +.B EPERM
> +.BR connect (2)
> +or
> +.BR sendto (2)
> +specified a datagram socket as the remote address,
> +but that socket is connected to a different socket.
> +.TP
>  .B EPIPE
>  Remote socket was closed on a stream socket.
>  If enabled, a
> --=20
> 2.56.0
>=20
>=20

--=20
<https://www.alejandro-colomar.es>

--tdxzhyyue7oy42ea
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmr7l4wACgkQ64mZXMKQ
wqn1Ng/8DIbLhh8q76r4liNOemlXV0+SxMAIzAptd/c+BvO3p2ffkjKsA4qjhYZo
ewfysSYumWK+2CTh4yoRdjrnlsF2vMNBiVVvFSZDcB+95WjCD2jdVgL62SuMchx3
5AmXSiB2xfuHntfmbvzAeyWBWcBuwjIRCFtFtTR5qrErOfhi2oqdaP1aZUDyNPOv
9qA4O7wSLqjwsVx4I8NLi9t128m+4EsbSshdTTrvwdhR41oV9gN0WtNMLfqhXGcp
XNPmMmYIyLnZTdR/PD7DJqoWoY6xaIg3UQ3P8Tr0VlzoOED1VVsg5QgGltmxUOT5
qYtl04rjmXp+va9maKU2uqGu7HAX7F9JOQFMm7jqGvNmSfD1NVvjz7cXs3RYIc5q
zpqWw7ZXshV5Wgo9KpuldiKJ1jhdnnZE7V0rRxayHy9bYSOf+Z/WgqtaKHErUup6
odPwyXiBzs5BCDgymL5HuPUn9+Qzwaeddy/b91ZVXD589mJroFnSfbGttd1ynHxZ
6DCFix4qwA1EAoGmW5EVLqGzAiw9j/N5EFww1KSRsFeWKXWT6EyvVA8SJqn8zCrX
cSkR9bRKI8mOr0Dz8pZuYE/a/E+fkoufz/hEASM4moaRNRjxY0rlPcMHfj47Knj1
gPRcsUcEMfpd2vsDURNZZcxjz7bf+VMcALa1SfVgg9c4vfcKOkE=
=c/X/
-----END PGP SIGNATURE-----

--tdxzhyyue7oy42ea--
