Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794791027;
	b=Y3+QRwyJR25W5WcChO4hHAP2MVxjNK/6uXKiUqScXBb8QEjURPAhC3zMIwiV+w/jKsI9
	 QunHz+Ln+SWT2UO1ggR3MqJo7bCgRRL4b7CG7DOlqqhb91U5y/ORRpckuHf35prmCZ+cB
	 dG91hEQLj40JIYHwpxKEBDb/4R8zs8KPfvMu9FmgQvFStGOloS4GE1VKSDpa6GtVYHBAQ
	 RrOxVrjE7zqqQR8hDhKpZ9mQTMPuVdUnnD1+Pp2ksGTgmaECnqykV33EOO/3E5VmtfNdL
	 F/5Gd4gK/sedPj5ICNTK6NrFx8Zb6Hs+LEwqrP5XSRHOSjnb3VvIwBNqei+crJvzdQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794791027;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=5HM7djkr7cB1R2fKoH/wLMh2DujTGaNQ6slbvwyV1Ts=;
	b=C0qqRCtuk6ehk5fey+wgOUc8pzWxfNQ9+TRlDNz24LUpDfM3Y7XYM3/8sihQIqsFjuw9
	 LZmb+RykS/tUoVK/9HuX85U0tiCSXwXnTVcrZUosxIn2dFGmSdQxREWhigBs8vnjhT8S2
	 b8tqspqcZnU+c5l6FbvVvZyLW7Ufl+sxvtr91rzQqwZAkaYvsfYxkcL+VpuEywHTpM2vL
	 mKbsOI1jYm4R9beMOXwwZhEZ7Rs4RSnR3CnFgxp2sdytQ4+hyT5MXhjpAME8oSjfHgD23
	 9zucIH4jFfudF63FZIP3ggtuiVomkXkeEhkeUn80IuwPBWqy5uYe1g/jZH+aJhF+Zqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EBwkZNm+;
	arc=none smtp.remote-ip=209.85.210.197
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4F7606A32C
	for <linux-man@vger.kernel.org>; Mon, 16 Nov 2026 01:03:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D4F7606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EBwkZNm+
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8b847ab3fd3so809612b3a.2
        for <linux-man@vger.kernel.org>; Sun, 15 Nov 2026 17:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794791026; x=1795395826; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5HM7djkr7cB1R2fKoH/wLMh2DujTGaNQ6slbvwyV1Ts=;
        b=EBwkZNm+4p2sgqCP+q3xyODjIZRPqldiUwOO2uC7MQSFNuRtSQ1isuq7TiNFHpuQ30
         tnPM8FHaQXohuyOkuml2dDLumxWJILQhijAccPb53w1uZJnVXCfEKEGMwYgIhFqD0dvV
         gm0hFrEw0BwRY4EYKZ2mYFYMr/YhJt+QrmV6mWHk4ZuGkfVSqBX9ZAp8R+NUr34adCL4
         a45E8OQ/gge/iwGT4MZhIWnFePd56SHmsZqpxRG9p/kcv1wXmIWzdAByHwjq1nAV66vL
         H/SOZbIOCCx+jwdqL/rjWe1gwZq0lj5oFWPkNYLsjinaMOQ1uXBgZWHbDgn/egsMf3Nx
         ZgMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794791026; x=1795395826;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5HM7djkr7cB1R2fKoH/wLMh2DujTGaNQ6slbvwyV1Ts=;
        b=yRElnlLR14IgvhfLACNaybdQbr5I7zoqSLFRzmf2OxdexIFHBS7d//zfznzPu47YN5
         Gyu+BUxThQYRJKVXp8LS3bAZ9itDRR2WteR+ejP1GjHiLsY40hlw38AcWOc+0qH/n3NZ
         HivhXkL8EAKuZKUu2pK4jeUCtul3ckrbrYmTERSVnGStLvOI1Mkovp8nhSEkOamduU40
         SdFPGYTsdAcD15rmI9bOpCZskoWIwa3FG6ezk0itBhDShee9hf2aJcfRc0cywpoecvfI
         X7z7brBAY1+8I8kIRO++nbBoxEnp4tNDPBdaEdag/b5ACV5GaWZMG47SADBkEen/0SWu
         11qA==
X-Forwarded-Encrypted: i=1; AL+hErFpKoCMUq+CTYR5FIJlHnkbc6wa543LQME9zhd4dIBmA0zmRx9hKmWA6+emWzMbKvSwUAk+knJsVpc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QtcvRi+arhX3ye6GYFM9Z9SyG/FICW4WXhmL4Ezyc86r0zG2E
	iujmrhL93l6wfJbQK43a34H73of5/55rYUKK2UyJm24aydcogo4am2VNKh59OoTQvkY7GsbNNWz
	JES3gnQ==
X-Received: from pgbm14-n2.prod.google.com ([2002:a05:6a02:618e:20b0:cdd:a60b:df36])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:918a:b0:3fa:e66a:fc42
 with SMTP id adf61e73a8af0-3fae66b089dmr2154673637.42.1794791026322; Sun, 15
 Nov 2026 17:03:46 -0800 (PST)
Date: Mon, 16 Nov 2026 01:03:45 +0000
In-Reply-To: <20261103202211.13820-7-gnoack3000@gmail.com>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261103202211.13820-1-gnoack3000@gmail.com> <20261103202211.13820-7-gnoack3000@gmail.com>
Message-ID: <avpWXS_uoWG0ibxI@google.com>
Subject: Re: [PATCH v2 6/8] man/man7/unix.7: Document SO_PASSPIDFD,
 SO_PEERPIDFD, and SCM_PIDFD
From: Kuniyuki Iwashima <kuniyu@google.com>
To: "=?utf-8?Q?G=C3=BCnther?= Noack" <gnoack3000@gmail.com>
Cc: Alejandro Colomar <alx+linux-man@kernel.org>, linux-man@vger.kernel.org, 
	Alexander Mikhalitsyn <alexander@mihalicyn.com>, Christian Brauner <brauner@kernel.org>, 
	Eric Dumazet <edumazet@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 03 Nov 2026 21:22:08 +0100, G=C3=BCnther Noack wrote:
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
>  man/man7/unix.7 | 100 ++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 100 insertions(+)
>=20
> diff --git a/man/man7/unix.7 b/man/man7/unix.7
> index 93a0a335e791..140e77ea12ee 100644
> --- a/man/man7/unix.7
> +++ b/man/man7/unix.7
> @@ -311,6 +311,32 @@ .SS Socket options
>  .BR getsockopt (2)
>  is an integer boolean flag.
>  .TP
> +.BR SO_PASSPIDFD " (since Linux 6.5)"
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
> @@ -362,6 +388,43 @@ .SS Socket options
>  .B AF_UNIX
>  socket pairs created using
>  .BR socketpair (2).
> +.TP
> +.BR SO_PEERPIDFD " (since Linux 6.5)"
> +.\" commit 7b26952a91cf65ff1cc867a2382a8964d8c0ee7d

Same, otherwise looks good.

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>

Thanks !
