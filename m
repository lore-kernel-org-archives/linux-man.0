Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794790527;
	b=4OFbxIkyL2CI0/X8Kpf3xxN/HkK2mY9QWSNGS6dJj6tisKylNyJYNn8gz4eL913VMLe+
	 UUwfSLlllgbdgjqAmKldKa/xRXzq4/99AugGYkY5BYGNnRHk2av/XnsFy69fo4N2FLdW7
	 6xnUQIZB7QYicnF7JDVpqTq8J/bV0+SRVotgHqeRiqXx/hfaYMCMQv/l3M2QR3+XwTLXi
	 G31OIT+yXjz7c+QGcQxyTLQKE3NsxbJdso6IB4KGscEQDnmwPrfDodUn4fQwWH6EXRnqE
	 m6Pewf6/BcTMLwNQFnYRKaiLJ1CPzAb1nFkqK4Q9fCEOIRwCQKXFisxEfrRUZk5UVkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794790527;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=tHvPQe4HpyczbEAadyOzEDu8/2y5zcaLrE7JpDBzJdM=;
	b=061WVR5hYLz8EtkWWIpHZm1v/8X1IoCuMxEJqpAHqKF83ZDctBv7AUtQzmfMtbcd6Cyj
	 qTjGeWkpLlpI5muqhsrRjxhZZAfgT3NRizfRfDbOHyCvJd+tdWpR8AXKUl1CIIuPFWxuo
	 i89CUJ8+xWob8dSJxHuIj2zl+JKS4yz+m4R4APPCdDNLxSqcWFIHpbULLoCRFq9vEA5Vv
	 THqYtNbXiwMMfy0Fu4rsgNIOw5FOpwxSuWTZ1ripDFztSrTBcM5mD08t3tg2klP8Y2KsD
	 pA+1m8CLAvmy76WUrnMk+Oum5C/LlVzea2QbahOSBR8JAYbdY8sBkBRaN7wvTYQe6uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TE2Ui0Pc;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B4C606A31F
	for <linux-man@vger.kernel.org>; Mon, 16 Nov 2026 00:55:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78B4C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TE2Ui0Pc
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b1755b2f26so2576382a91.2
        for <linux-man@vger.kernel.org>; Sun, 15 Nov 2026 16:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794790527; x=1795395327; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tHvPQe4HpyczbEAadyOzEDu8/2y5zcaLrE7JpDBzJdM=;
        b=TE2Ui0PcubVcn6dxEV2MOzaQ6lHaOI6uqydIoxDRLFoeIInyElnVPsZ8Yulxt9ZDEP
         cttDvKGF5cnYt/I15vXOSBl9AxdxdMXtrkowmOpzEuHmasoJtdE/WVK7nJSUdZIi9uYu
         JM0rKhvLWrn9mou5G0+K5MlU9sMpJDabLXuUAP70mic/G+P6yPZrvhoLjJ4qpkunplHN
         GeUWu6LsKUiFhhf1fTeGclON8qHsTTpCHZ9R8/3sl+W4d8VbPfdCHLCCeU0DxRdYXZ9m
         FF9A4Qn3Cn4zO6neUzscSxzK53oX6Lhj38CYxOBniGjMJ+ucWm+7iEFj9qRB06harXJ7
         a1MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794790527; x=1795395327;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tHvPQe4HpyczbEAadyOzEDu8/2y5zcaLrE7JpDBzJdM=;
        b=lCkES8dDqDCa55TGoNfGOmWMmP68WPOOEcUkx2mZsfe94a2SFTT6Yx0rAnNiGFb/mR
         1jyBPeTucOS7zggqr4LHnTt5E8B+wALSdsrmW7zltKVESDFlMxjLT5Wf9EL/wUF8vyCC
         Yr4k/JWC4v/+YJ5oRyYKxPohf4M0OunHye28iKYrWjLJVdHk/+AHeGqiKv/ZnF7nplfy
         dEoTRlGAO17n1fWBW39KLZ4OGvrMt03rtd6aWhHKV7mmR/tEie3Yn1HF6A3wXKkz0/RX
         PLLyq3sKM6rRM+nz/MQMmNmsKM/hiMetRhZNwCmwx3ljFobL+mtZZNwLj4bcNX4UHzGi
         pIBg==
X-Forwarded-Encrypted: i=1; AL+hErFWVJT/R8Xzfm1locTrSyEQWpSs7KR/qEG716uz9UIHo77irngklhNo7rdhcfKd9xfiD3tOITWn/+Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+a3U2thTsnJ43V8PQydjAiytZoXNSzFiUWH4n60AsQIXtJ6JFI
	lGN4C23WXADS8zQqG5pJts/vbUXC9wIXn0abRYSf6nlRofitR2/u7D9FEQm1TdREHg5bT9ShfIo
	yyuv/Qg==
X-Received: from pjbob15.prod.google.com ([2002:a17:90b:390f:b0:3b1:7f3c:405d])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5806:b0:3a7:e11c:4e6e
 with SMTP id 98e67ed59e1d1-3b1b0b8b064mr8426816a91.59.1794790526466; Sun, 15
 Nov 2026 16:55:26 -0800 (PST)
Date: Mon, 16 Nov 2026 00:55:26 +0000
In-Reply-To: <20261103202211.13820-5-gnoack3000@gmail.com>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261103202211.13820-1-gnoack3000@gmail.com> <20261103202211.13820-5-gnoack3000@gmail.com>
Message-ID: <avpUW_zBBph5d40d@google.com>
Subject: Re: [PATCH v2 4/8] man/man7/unix.7: SCM_SECURITY: Generalize to other
 LSMs, not just SELinux
From: Kuniyuki Iwashima <kuniyu@google.com>
To: "=?utf-8?Q?G=C3=BCnther?= Noack" <gnoack3000@gmail.com>
Cc: Alejandro Colomar <alx+linux-man@kernel.org>, linux-man@vger.kernel.org, 
	Michael Kerrisk <mtk.manpages@gmail.com>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 03 Nov 2026 21:22:06 +0100, G=C3=BCnther Noack wrote:
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

nit: s/null/NUL/

otherwise looks good

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
