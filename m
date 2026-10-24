Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792820042;
	b=4BeEbUEj9HOgRPtK4aKkM3h+M9AIuSNYiW3gRbcK8fLQCjDCSQVIHPydUVOrqryoGf4u
	 bovKETNqn9m4u98fKHLoKTuVq4oqHCADLd7tG5iqbcf8hfpdyKNjGSLSOqCN04zV/RdEh
	 lGAGyEZHl+59alPghIj2tdXp0vA8ef5o+v2Yz0X9m2xu+ywa8Aex3R0jXBeU2BcqFNpaH
	 +dIeayZjmyeGUy5NJNOV5NPvE4BrZ8yobNVK4ABbKpHK5BgAfLJre7kCfzqlYzv8dsVCH
	 qOx8ANgdF7KyFTsHnV7CKQXMNcJT3KOgbkyzrRcYRiXTveYnGD33fEEn2LAkMgkkUQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792820042;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=bnVfzZCuMSg2zjqimrIh1BP/krr4tavzvHt793CNAds=;
	b=uJqQa/lLr/2Kvm3AYFIKLaD4EaC8GTYvFRRfrTyqKNU18G4ssaCVkLEdu/SSGLCQ6l49
	 8HZ/Oe+8hZO1WAPOSIx18IjiY8J8czlaQy4PO+cJQPNRHceMobrfbcl2ekNdczt4V4Vao
	 AvDaH5yRFeoRhc7gw43cnIE8N8UMOL+IfEuFvH844WMg1fTG/i9vZnGVsYYn14ySY71pY
	 hbl8wH+AMjGoPO8Zo2sN5w3um1ry5jCVTE+Po3F2t6kEx3WLmLnibPJF4muNesf5qqOz4
	 Ty6PTazGtWrZw4aZ7SUt4xX7fhrW+tfqLwn3bt28qrP6rVQr63UA8bhaf3ivQHPzVvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b="uV268R/c";
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979C360A262D
	for <linux-man@vger.kernel.org>; Sat, 24 Oct 2026 05:34:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 979C360A262D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=uV268R/c
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d5dbso1277634a91.1
        for <linux-man@vger.kernel.org>; Fri, 23 Oct 2026 22:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792820041; x=1793424841; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bnVfzZCuMSg2zjqimrIh1BP/krr4tavzvHt793CNAds=;
        b=uV268R/cTswZshk9L0P8Ka7Hi4j8eidIFK8vChLIZnSuz8veJwL9NwqM23vjG/EVnT
         0jYEeOjPYNtbDrlVTVBXkFnQFgdjGASRYlSQKqLgD3Hktk2Py7TkyuEOw6zo4ECC5hmN
         pdaXk22I4cH2vSd5UgwZmoS1q2yPoGJLGP1VcK3VVkX29Sz6Lpg77zxzUAwsigfZkr2U
         mpQ1yj5/pB/vdMr8EzzcBvs9jQ7ir+O4ks/ZLfWx2zzA3wCY/3w+r95KJObFj7thLZts
         CIFM7Pb5s0rqEm7i2Ygf931J/111eWvzngIxFkcLqXpS+qgiq3Uz03gHBwfxhTf9mdpj
         88WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792820041; x=1793424841;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bnVfzZCuMSg2zjqimrIh1BP/krr4tavzvHt793CNAds=;
        b=KgGxKWq15tLLRKadH4YVCh425E1ZchTTe3X32mXxOfmk+CFR8cjyJw/ST4fyeRMUtO
         h/xRiGEY9WfOPtaCzVYmmTCdTU2PsZkNNN0qHEIWkwUIwH92MxZ87cSm3/vPB2R5Lbvz
         OUHj76ZZ636MKS/+z/dKGsR4nd10F+d6+JVU9z+Mi2vcdThyAF57yitZWtN+6IXqKMho
         24DhnDBeCo8R9L2kRtBCRJ1CUJRKyKi9jzviLYnZrXCKGIMCp/PbELG5m91VpoQl3GK9
         4vVMsHhm90I2gpgMZBNTqiRu+Vw4DwoH5a5JmobWpT2S6W3Twopg8yZ2Pkzmpaj07uE/
         wGMg==
X-Forwarded-Encrypted: i=1; AKwUvBwQjNEBszcQCUxPj7aeXPl9/dwgBFL1rK0qi9MNw20Te2LGeITYnEQ1jiGEG0nSu61jghZBIrLXmZo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIeSNUjbyenrgOdkbCK2qBYVv3xJXi5N9x4pus1x2SCm7icpW63
	12Ps4Qt+y0tdnm7ENrsn61d8peTRcJYUKHXGLY2vfnAux/OQAoWXI+47X6XRfdMI/Bj2HP47KXs
	dmB6TaA==
X-Received: from pjps6.prod.google.com ([2002:a17:90a:a106:b0:3ad:c8d8:70c3])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4ad0:b0:3ab:d26b:c2e9
 with SMTP id 98e67ed59e1d1-3adead26b38mr1148751a91.33.1792820040663; Fri, 23
 Oct 2026 22:34:00 -0700 (PDT)
Date: Sat, 24 Oct 2026 05:34:00 +0000
In-Reply-To: <20261021210800.27338-5-gnoack3000@gmail.com>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261021210800.27338-2-gnoack3000@gmail.com> <20261021210800.27338-5-gnoack3000@gmail.com>
Message-ID: <atxCMPCa1YAcOLTq@google.com>
Subject: Re: [PATCH 3/8] man/man7/unix.7: SIOCINQ: Document behavior for SOCK_SEQPACKET
From: Kuniyuki Iwashima <kuniyu@google.com>
To: "=?utf-8?Q?G=C3=BCnther?= Noack" <gnoack3000@gmail.com>
Cc: Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 21 Oct 2026 23:07:55 +0200, G=C3=BCnther Noack wrote:
> Document the SIOCINQ behavior for SOCK_SEQPACKET,
> which sums up the lengths of all messages in the receive queue.
>=20
> Restructure sentence order, so that socket type differences are
> discussed in on paragraph, and commonalities in the next.
>=20
> For reference, the SIOCINQ lookup is implemented in
> unix_inq_len() in linux.git net/unix/af_unix.c.
>=20
> This function first rejects SIOCINQ for listening sockets with
> -EINVAL, then does a case analysis for the three types of Unix Domain
> Sockets:
>=20
> For SOCK_STREAM, the result is:
>=20
> 	return READ_ONCE(unix_sk(sk)->inq_len);
>=20
> For SOCK_SEQPACKET, the result is calculated using:
>=20
> 	skb_queue_walk(&sk->sk_receive_queue, skb)
>         	amount +=3D unix_skb_len(skb);
>=20
> For SOCK_DGRAM, the result is:
>=20
> 	skb =3D skb_peek(&sk->sk_receive_queue);
> 	if (skb)
> 		amount =3D skb->len;
>=20
> Cc: Kuniyuki Iwashima <kuniyu@google.com>
> Assisted-by: LLM
> Signed-off-by: G=C3=BCnther Noack <gnoack3000@gmail.com>
> ---
>=20
> Notes:
>     I double checked this all in the code, and quoted the code.  Both the
>     commit message and commit body were substantially edited based on the
>     initial LLM-based version.  (Nevertheless, I would have likely missed
>     the inaccuracy if the LLM hadn't found it.)
>    =20
>     The LLM initially just slapped an additional sentence into the
>     paragraph, but that was mixing the socket-type-specific concerns with
>     the general description -- I split that paragraph apart so that we
>     have one paragraph for the three socket types and one for the
>     socket-type-independent description.
>=20
>  man/man7/unix.7 | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
>=20
> diff --git a/man/man7/unix.7 b/man/man7/unix.7
> index d0c1765dfd79..4c46b54206a5 100644
> --- a/man/man7/unix.7
> +++ b/man/man7/unix.7
> @@ -606,6 +606,19 @@ can be:
>  For
>  .B SOCK_STREAM

and SOCK_SEQPACKET

>  sockets, this call returns the number of unread bytes in the receive buf=
fer.
> +For
> +.B SOCK_DGRAM
> +sockets,
> +the returned value is the same as
> +for Internet domain datagram sockets;
> +see
> +.BR udp (7).

Simply say it's the length of the first datagram.
so that we don't need to jump to udp doc.


> +For
> +.B SOCK_SEQPACKET
> +sockets,
> +this call returns the total number of bytes
> +in all messages queued in the receive buffer.
> +.IP
>  The socket must not be in LISTEN state, otherwise an error
>  .RB ( EINVAL )
>  is returned.
> @@ -625,13 +638,6 @@ defined in
>  .\" That number is normally larger than the number of bytes of pending
>  .\" output.  Since this info is, from userland's point of view, imprecis=
e,
>  .\" and it may well change, probably best not to document this now.
> -For
> -.B SOCK_DGRAM
> -sockets,
> -the returned value is the same as
> -for Internet domain datagram sockets;
> -see
> -.BR udp (7).
>  .SH ERRORS
>  .TP
>  .B EADDRINUSE
> --=20
> 2.56.0
>=20
