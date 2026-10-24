Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792821784;
	b=FctHCAjMieOLNbY3W3UwZUllHwRNz+M01c5ftL+HJydRXcYoK3ZMI680KnnQkWua3dlo
	 35c6ppH6jQPWNfnStHaflgHyomgwfiBbBXARGU1z3fF7H6eW4kCdKVB5YAhmWdJx271Ja
	 qAaNGtKqkk3el7IIfqfgLoEMGNd/jqF40o4GG7NhOzxOF+6N+WOuUevivaJ2rS4l37faK
	 CC0wLaSCX39wL6KyoAEcl2zZQwIpMlhQx4v1z+DkMhz2esf5sYOJHeq1ToVRgP0npn3Bw
	 YS0c/1/ELkpCsoPkBpa99F/xHiWnsdtHKbQW9K9ufeQKU+sI/nhwc26U6ZY9MEgSuGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792821784;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=VhbYsJarJPTP5l8FOm/SigJP3nPw0f94ienSofZt5tg=;
	b=cgVAqDP34TDTIgDFbh2vOLsSc4wsTSIUVUEEp8ZcYNS2rNdkSAwzC4wV9sUtQZypQQk9
	 1odkWwaPkL+ytlTBZoUOD2O3P2IvX4msi71o+J/4JG8APFQj+QfAZtY0KNqabVLpLrjdm
	 t1C+tLQwIIrfo5XcroqhI8WM3jmN1lFYjXuXLusgTZP+vcPLaPUd0N8T2uI6Iq+doBMww
	 6XzN/lTcDF1Rps/S1OsJV/GowcIhcWHxiKoAEjKNtRxHGJ09aeZ8pFU2SRxmcFCqVOwWf
	 ihO+P0bur2MzRVrLe6DpSG34Ftox5g0Anr9B7hbbdn4WLGAhDOOj9qnT4hwoTETxjYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b="Lkrhg/QQ";
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4374A606A31A
	for <linux-man@vger.kernel.org>; Sat, 24 Oct 2026 06:03:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4374A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Lkrhg/QQ
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ac77c3ff6aso2286782a91.0
        for <linux-man@vger.kernel.org>; Fri, 23 Oct 2026 23:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792821783; x=1793426583; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VhbYsJarJPTP5l8FOm/SigJP3nPw0f94ienSofZt5tg=;
        b=Lkrhg/QQOWslMu21hkxmR5kk/5v3T8JG7Jv5/Aecl8NOthRnmLw/5viKNewHZ9w62U
         eOGJH80zyeuJPU/aHX66pNJk1Mad+Dz9r14OUDOAGSmJ/8U2RiaqyBouHJ36KPmpVqVU
         6ZclcWgZjpwcj1BNKqiysusW5dgcKGkpuF4WOaAp+MV96/qGGqiH7N6VIKeluNWgg0kp
         yPiduGRsoh0OH+VSHmvHrWM2ImyL7I+T92JtFZl8dQTuabA7XZVqWj+Y6GzM6geu83DM
         HJ2UToJltGyEc3kc+aSB7KmU5CXFEB+HD5BoL4D04qJcHbaLneYmMlNtevqavfT8Ikib
         ayjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792821783; x=1793426583;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VhbYsJarJPTP5l8FOm/SigJP3nPw0f94ienSofZt5tg=;
        b=Lauaw+mpBIIvP+y8qPHjHgd9gPxl+rmmpuozhThKJ6mQl3g3n7G4oTIgnyQP7k0c8U
         zyPCV8SJuG6DAqvFIIUmtBH6tIiKoztEAU05MPUSLtV/GItS8QvhknX3aTLUq32lE52a
         2NDNjR1T+fbFOgiqcpRKjt3Zxw44Z5X3OkWiOYPV9bC/iD/YBfeDUSfHWrKE3neE6a4c
         kf/DSygOy34OOfhF87bzaYPmD3Vbq3hvPtbpk56/gh4Gy2huVg8JGUZDRQkoPOSs0t9U
         Az4Yq5E+H5TwEDPMEtUOM0vqY/kYAal1WTB6qwEDqwNnJTwCjKvNyI52wafmpDGaWc33
         Wxvg==
X-Forwarded-Encrypted: i=1; AKwUvBy8yVE+iENciLZBRFW67Rx0o48zwWdxa7F/zLSvsVI9FJibifMLWrsSvr2IJRvRfRhzB4bRtj4nqJg=@vger.kernel.org
X-Gm-Message-State: AFq9FYId+mtREOZPUeJBCCukVH4Q8LEcuEOlQLJD2uDpVyWr1Dev1T3K
	uSJ7Ka1x3OaKT+OZwrbj6r0uihr8KkY1zgAE0AsYuCmpdIUAJUQ40LG/tL60Jx+QsCNRbDkcdyT
	q3LeeJw==
X-Received: from pjbin16.prod.google.com ([2002:a17:90b:4390:b0:3ab:5803:73a5])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5746:b0:3ac:8897:7b92
 with SMTP id 98e67ed59e1d1-3adeafd647bmr1126568a91.57.1792821783225; Fri, 23
 Oct 2026 23:03:03 -0700 (PDT)
Date: Sat, 24 Oct 2026 06:03:02 +0000
In-Reply-To: <20261021210800.27338-10-gnoack3000@gmail.com>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261021210800.27338-2-gnoack3000@gmail.com> <20261021210800.27338-10-gnoack3000@gmail.com>
Message-ID: <atxJNMgN8oadDlDZ@google.com>
Subject: Re: [PATCH 8/8] man/man7/unix.7: ERRORS: Document EACCES, EAGAIN,
 EMSGSIZE, ENOSPC, and EPERM
From: Kuniyuki Iwashima <kuniyu@google.com>
To: "=?utf-8?Q?G=C3=BCnther?= Noack" <gnoack3000@gmail.com>
Cc: Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 21 Oct 2026 23:08:00 +0200, G=C3=BCnther Noack wrote:
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
>     name, but sending a dgram fails if the sender is not the one that tha=
t
>     socket has connected to.
>=20
>  man/man7/unix.7 | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>=20
> diff --git a/man/man7/unix.7 b/man/man7/unix.7
> index 054f1af75dd5..79198445c581 100644
> --- a/man/man7/unix.7
> +++ b/man/man7/unix.7
> @@ -655,10 +655,25 @@ defined in
>  .\" and it may well change, probably best not to document this now.
>  .SH ERRORS
>  .TP
> +.B EACCES
> +The caller does not have write permission on the socket file

If we align with other doc, "write permission is denied..."

> +specified as the remote address to
> +.BR connect (2)
> +or
> +.BR sendto (2)
> +(see "Pathname socket ownership and permissions", above).
> +.TP
>  .B EADDRINUSE
>  The specified local address is already in use or the filesystem socket
>  object already exists.

s/filesystem socket object/file/

Two sockets can have the same address once one's file
is removed even without closing the socket.


>  .TP
> +.B EAGAIN
> +The socket is nonblocking, and either
> +.BR connect (2)
> +was called on a stream or sequenced-packet socket
> +and the backlog of the listening socket is full,
> +or a datagram was sent to a socket whose receive queue is full.
> +.TP
>  .B EBADF
>  This error can occur for
>  .BR sendmsg (2)
> @@ -694,6 +709,11 @@ invalid state for the applied operation.
>  called on an already connected socket or a target address was
>  specified on a connected socket.
>  .TP
> +.B EMSGSIZE
> +The datagram to be sent is larger than the limit imposed by the
> +.B SO_SNDBUF
> +socket option (see "Sockets API", above).
> +.TP
>  .B ENFILE
>  The system-wide limit on the total number of open files has been reached=
.
>  .TP
> @@ -705,6 +725,11 @@ did not exist.
>  .B ENOMEM
>  Out of memory.
>  .TP
> +.B ENOSPC
> +The socket was to be autobound,
> +but all autobind addresses are in use
> +(see "Autobind feature", above).
> +.TP
>  .B ENOTCONN
>  Socket operation needs a target address, but the socket is not connected=
.
>  .TP
> @@ -716,6 +741,13 @@ use the out-of-band data option.
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
