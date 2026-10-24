Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792819378;
	b=h/sbxFF6R26FOzaEuxDyrFE5fYDbFA7ZeSEOtSA6w648cgy7/CZt5GUvE9KL++7d3P+A
	 ojfW+uRyWGn3cPmAYwTpigHcicsQuEpEf/l7ibnlbob+nP9x/YRITLqcWZBUIP02B+I7D
	 05YuuyO4gCiYqDixe9zlDm5qWnY068AOviXeH9UIDE0+Nlxl5UsEz0fVRpoDLUsUIz50n
	 QCqT6lSmPGVWZKmqOv5EQVz6/9grqP+WD0TJkuqyrgPsld4X5W19IV0oHNZCmD6KWn72b
	 PVeBPN6lgcsFVQsmiUd514LgPrE8HL7HeZvpqWtf9wdvoKA/qQCRD1+azmI3/Mu64Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792819378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=Uc2+sPQ5MCm8UewaiqmQ3EtfzeXcLJsI6AuctveIWYo=;
	b=HcVrOTCUgAHNLgc1x4nAYgwdEsVYw+9JZsD8DtcOZOXyzGddIM/MNCuo8tPhfxwPv+of
	 +FmI12nYHozVwU2UemIM3zQlxFBvGkrPk7Ji1FPlfyJKsvt8iYVbPPYY5hruHtPiKRCK+
	 5diOZXDSVJv1ARmtCz0PeqrTpqX1bgy2HjHMUDhb8aPdMQa/gGc62magcHDL3TxJ6gf8m
	 0Vbyo9eKuPtrKN9UDAuWbuUEHBLUD07D4nBcIKvh2eT7dLSZyGX4rvWsyqhJoTy/b7GRF
	 4Vw5oaB78uUW6kj5oMpovmIf78EPLWTlIMUyvrmningiIzs3BcZA3neCD6FmuIecwrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=MHCuQN0Q;
	arc=none smtp.remote-ip=209.85.215.197
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C33606A31A
	for <linux-man@vger.kernel.org>; Sat, 24 Oct 2026 05:22:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0C33606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=MHCuQN0Q
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc73895c7d5so1850362a12.1
        for <linux-man@vger.kernel.org>; Fri, 23 Oct 2026 22:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792819377; x=1793424177; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Uc2+sPQ5MCm8UewaiqmQ3EtfzeXcLJsI6AuctveIWYo=;
        b=MHCuQN0QjlTS4ZY08pei0Ir27xqxYh48sWOYAeW/qxK38iHE/tnXtW/n2jpHrlLLRG
         d1xeF8rdQKZbvwhXpemNLAdr8p+zXO1qvJ2E/p2NW3XJAegk6ChXdX44JayO/nFsJaHX
         dMH4IWnelZnnMsYv/Gag9/2tFgT7yRP1H92KKlry+JnZqitCPSU/hsL5a3VfpfzvgBQg
         Mk2hbfIUrdD+YvyMn20qJtE2AKSv9755IUDLi82Qh17D/x9bq2qx/nxGPnaZ0vKK1cZa
         2x2VEh3EQdcteGkeIET8ZZgoRE4NjzG5pxQ37vs3TuKb7ASHj3lKqp0lQvRi+JfejuDn
         G7uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792819377; x=1793424177;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uc2+sPQ5MCm8UewaiqmQ3EtfzeXcLJsI6AuctveIWYo=;
        b=lwKtjShiiSnBW2GkTWEuk1/KR/j9ABiRXV+PRB1H37JnqRIoDkaSVYQB3cN51xbYV0
         5ibJJsRBWoz7UAuJgJS12rdNm+pagF+tqs3IXxcymP35SutgYxNOhdM5Z9V2MiUcdSBr
         oSXMnuIUnadAjb4Nud6DP/9sBNucC+6len2TGEDYFHDUSKpfXeXM1wvdBKRGig7mFVud
         yZQeVSOliKinHQz0hyk5NTjjOaZlAO6+2EvxLXAyXBce83Kw1UKmJHhkO1utbQQ/jPG+
         kvEwFTOetedN1WA0nvfJuuPnVuTmSwMZNDkcy1HCQD/l8uh+LcbtsC4xhGDEO49Rs6qg
         j1OQ==
X-Forwarded-Encrypted: i=1; AKwUvBwssHBBphyrEdNrU3vJY4VEa1tW/VBM2GEp99YL4/ouij49P9yZqeCFk4Yrc//bfSdAJDSUiJkbfbY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0aJymWWcN4lMYFONOFxNUsAf90vLxjAcqAnTZoI6ALQftr1KC
	Kjk86WfLEn439NwjuFwJXdBLTHtyeYCfFxQQexCWF8ZKEEGdELBxPikbgLuf2G/gDPC0ADoRxAe
	DOi2Vqw==
X-Received: from pgr26.prod.google.com ([2002:a63:115a:0:b0:cd8:b4c4:efd9])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:7789:b0:3e2:9f69:35bd
 with SMTP id adf61e73a8af0-3e7cd55bb65mr852561637.34.1792819376715; Fri, 23
 Oct 2026 22:22:56 -0700 (PDT)
Date: Sat, 24 Oct 2026 05:22:56 +0000
In-Reply-To: <20261021212256.27961-7-gnoack3000@gmail.com>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261021212256.27961-1-gnoack3000@gmail.com> <20261021212256.27961-7-gnoack3000@gmail.com>
Message-ID: <atw9RO1guxx7M7HJ@google.com>
Subject: Re: [PATCH 6/7] man/man7/unix.7: Document SO_PASSPIDFD, SO_PEERPIDFD,
 and SCM_PIDFD
From: Kuniyuki Iwashima <kuniyu@google.com>
To: "=?utf-8?Q?G=C3=BCnther?= Noack" <gnoack3000@gmail.com>
Cc: Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org, 
	Alexander Mikhalitsyn <alexander@mihalicyn.com>, Christian Brauner <brauner@kernel.org>, 
	Eric Dumazet <edumazet@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 21 Oct 2026 23:22:55 +0200, G=C3=BCnther Noack wrote:
> These were added in linux.git 5e2ff6704a27 (2023-06-12; "scm: add
> SO_PASSPIDFD and SCM_PIDFD") and 7b26952a91cf (2023-06-12; "net: core:
> add getsockopt SO_PEERPIDFD"), both in Linux 6.5.  They are the PID
> file descriptor counterparts of SO_PASSCRED/SCM_CREDENTIALS and
> SO_PEERCRED.
>=20
> SO_PASSPIDFD
> 	sk_setsockopt() and sk_getsockopt() in net/core/sock.c handle it
> 	as a boolean flag for AF_UNIX sockets (EOPNOTSUPP otherwise).
> 	Like SO_PASSCRED, it triggers autobind, which was already
> 	mentioned in "Autobind feature".
>=20
> SCM_PIDFD
> 	scm_pidfd_recv() in net/core/scm.c creates the PID file
> 	descriptor from scm->pid, which is the PID given in the sender's
> 	SCM_CREDENTIALS, or the sender's own PID by default.  The fd is
> 	created with O_CLOEXEC by pidfd_prepare().  If pidfd_prepare()
> 	fails, its negative error number is put into the cmsg data.
> 	Sending SCM_PIDFD is rejected by __scm_send() (EINVAL).
>=20
> 	Since Linux 6.17, with c679d17d3f2d (2025-07-04; "af_unix:
> 	enable handing out pidfds for reaped tasks in SCM_PIDFD"),
> 	PIDFD_STALE is passed, so this also works for reaped processes.
> 	Before that, pidfd_prepare() returned -EINVAL for them.
>=20
> SO_PEERPIDFD
> 	sk_getsockopt() returns a PID file descriptor for sk_peer_pid,
> 	or fails with ENODATA if there is none.
>=20
> 	Since Linux 6.16, with 20b70e58961b (2025-04-28; "net, pidfs:
> 	enable handing out pidfds for reaped sk->sk_peer_pid"), this also
> 	works for reaped processes on AF_UNIX sockets.  Before that, it
> 	failed with EINVAL.
>=20
> Cc: Alexander Mikhalitsyn <alexander@mihalicyn.com>
> Cc: Christian Brauner <brauner@kernel.org>
> Cc: Kuniyuki Iwashima <kuniyu@google.com>
> Cc: Eric Dumazet <edumazet@kernel.org>
> Assisted-by: LLM
> Signed-off-by: G=C3=BCnther Noack <gnoack3000@gmail.com>
> ---
>  man/man7/unix.7 | 101 ++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 101 insertions(+)
>=20
> diff --git a/man/man7/unix.7 b/man/man7/unix.7
> index 67dd10cc146f..a4457508fd2a 100644
> --- a/man/man7/unix.7
> +++ b/man/man7/unix.7
> @@ -316,6 +316,33 @@ and returned as the result of
>  .BR getsockopt (2)
>  is an integer boolean flag.
>  .TP
> +.BR SO_PASSPIDFD " (since Linux 6.5)"
> +.\" commit 5e2ff6704a275be009be8979af17c52361b79b89

Why does pidfd only have SHA1 ?


> +Enabling this socket option causes receipt of a PID file descriptor
> +(see
> +.BR pidfd_open (2))
> +referring to the sending process in an
> +.B SCM_PIDFD
> +ancillary message in each subsequently received message
> +(see below).
> +.IP
> +As with
> +.BR SO_PASSCRED ,
> +when this option is set on a socket that is not bound to an address,
> +the socket is autobound to a unique name in the abstract namespace
> +when
> +.BR connect (2)
> +or
> +.BR sendmsg (2)
> +is called on it;
> +see "Autobind feature", below.
> +.IP
> +The value given as an argument to
> +.BR setsockopt (2)
> +and returned as the result of
> +.BR getsockopt (2)
> +is an integer boolean flag.
> +.TP
>  .B SO_PASSSEC
>  Enables receiving of the security context of the peer socket
>  in an ancillary message of type
> @@ -367,6 +394,43 @@ stream and sequenced-packet sockets, and for
>  .B AF_UNIX
>  socket pairs created using
>  .BR socketpair (2).
> +.TP
> +.BR SO_PEERPIDFD " (since Linux 6.5)"
> +.\" commit 7b26952a91cf65ff1cc867a2382a8964d8c0ee7d
> +This read-only socket option returns a new PID file descriptor
> +(see
> +.BR pidfd_open (2))
> +referring to the peer process connected to this socket.

Not sure if this is worth noting here, but "peer process" is
a bit unclear.

For example, if process A creates socekt A, calls listen(),
and pass it to process B and close()s the fd, and process C
creates socket C and connects to socket A, then getsockopt(C,
SO_PEERPIDFD) will return process A, not B.


> +This is the process whose credentials are returned by
> +.BR SO_PEERCRED .
> +Unlike the PID returned by
> +.BR SO_PEERCRED ,
> +the PID file descriptor cannot come to refer to a different process
> +if the peer process terminates and its PID is reused.
> +.IP
> +The argument to
> +.BR getsockopt (2)
> +is a pointer to an
> +.IR int ,
> +in which the PID file descriptor is returned.
> +The close-on-exec flag
> +.RB ( FD_CLOEXEC )
> +is set on the new file descriptor.
> +.IP
> +If the socket has no peer process,
> +.BR getsockopt (2)
> +fails with the error
> +.BR ENODATA .
> +.IP
> +Since Linux 6.16,
> +.\" commit 20b70e58961b855e61f2c6a7a19a38a64ad1bed6
> +a PID file descriptor is returned
> +even if the peer process has already terminated and been reaped.
> +Before Linux 6.16,
> +.BR getsockopt (2)
> +failed with the error
> +.B EINVAL
> +in this case.
>  .\"
>  .SS Autobind feature
>  If a
> @@ -543,6 +607,42 @@ message, the
>  .B SO_PASSCRED
>  option must be enabled on the socket.
>  .TP
> +.BR SCM_PIDFD " (since Linux 6.5)"
> +.\" commit 5e2ff6704a275be009be8979af17c52361b79b89
> +Receive a PID file descriptor
> +(see
> +.BR pidfd_open (2))
> +referring to the sending process.
> +The data portion contains a single
> +.IR int .
> +The PID file descriptor refers to the process whose PID would be
> +received in an
> +.B SCM_CREDENTIALS
> +message;
> +if the sender specified
> +.B SCM_CREDENTIALS
> +ancillary data,
> +it refers to the process with the PID given there.
> +The close-on-exec flag
> +.RB ( FD_CLOEXEC )
> +is set on the new file descriptor.
> +.IP
> +If the PID file descriptor cannot be created,
> +the data portion contains a negative error number instead.
> +Since Linux 6.17,
> +.\" commit c679d17d3f2d895b34e660673141ad250889831f
> +a PID file descriptor is created
> +even if the sending process has already terminated and been reaped.
> +Before Linux 6.17,
> +.B \-EINVAL
> +was received in this case.
> +.IP
> +This message cannot be sent;
> +it is generated by the kernel.
> +To receive it, the
> +.B SO_PASSPIDFD
> +option must be enabled on the socket.
> +.TP
>  .B SCM_SECURITY
>  Receive the security context (the security label)
>  of the peer socket,
> @@ -1273,6 +1373,7 @@ see
>  and
>  .BR seccomp_unotify (2).
>  .SH SEE ALSO
> +.BR pidfd_open (2),
>  .BR recvmsg (2),
>  .BR sendmsg (2),
>  .BR socket (2),
> --=20
> 2.56.0
>=20
