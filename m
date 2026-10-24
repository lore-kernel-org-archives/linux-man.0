Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792820661;
	b=1B7/gL4eY2swM6kb8BsbQ/3wyRtamNL63xmMFzKtJyUdY+CzPpMIRTJC3rzcl1nPHTXv
	 0Kie8SUhmUUtlg/asX+rBTMJRfkgWQxq0ZYsFJjQ/mSUSf1nDXGt4s1LUJewAA5/pfvsX
	 G50JTC0ju2ERCrHvZgBCe6jMgn85P/ounU5gq58mLtgtie3/ZRoSsNzoja6bDrcsmDb9r
	 jSOatjVMaBuL9VjzZfQFP+EhPFYQjiqVfoMo/ae8G54Vy0o+4bHEA6zSMhLdl6QFO2cd/
	 xaxRv4HSihQen6wdGsGBVJu53BDqidDlXXuPJLY4Txrwf99szcDaX8+8TMHDTv17+sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792820661;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=RNYQYEOxXiVYJ3h9tG9QBEeX8AF/aJm8aeklJyQsXRM=;
	b=0CxX+yx1iPV4CksRp85RYbWPRxJI8RHlsFOJ9drXqcibX8LiIXZq7r6fKnUKoufwQwDT
	 NhTIx+tUPMbqHHRI6WwiJB2jLsH6aieg8mqjw5Xj1Nh/9/7UTdqope5QtmI6f2TtvY4GJ
	 xV8qANU83at0nGZfEqsJH3b9jLypHhCw1j4KGaSgDB41n6j00DCSw47kwbS559DFug7lG
	 +zWRTHAVjBpNvnH5+cqVCjb95cj7LfBS/oEhE3QW4SAOPuxmmNcz/RUmS5jhWTQbyDcFb
	 pV6sYkQh+6v5gDGY4X7N5aPyIoMXYVqEwyHBOgLzp+Fun11TBgtalQZsJbBIJFV7ujA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=kDDqDHfj;
	arc=none smtp.remote-ip=209.85.210.200
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE92A606A31A
	for <linux-man@vger.kernel.org>; Sat, 24 Oct 2026 05:44:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE92A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=kDDqDHfj
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a06da65d92so974828b3a.0
        for <linux-man@vger.kernel.org>; Fri, 23 Oct 2026 22:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792820660; x=1793425460; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RNYQYEOxXiVYJ3h9tG9QBEeX8AF/aJm8aeklJyQsXRM=;
        b=kDDqDHfj9ciPexFaqsci+JIK0VPQOKT1Ibywz8zLYWfXMJSgpsDZOUOU0f57TeDewR
         8x1cksFf3FZZtx4p3Qe0xYFTfetl5M7fwBtF9bfZJW3fSyvlSA+HexoZJ7lZb120bqgc
         PL4wR31lY1QxEBfdVqnMqOG06D5T07mhhZ4I8GKSAWeOXpqANNUFPPbzBdpzpkW/ZqYb
         57rOW65MQ3wfcdbXlENtHva3hSuMvofaIcxD1ev6pibHGce1rML4NCedevA1BUyCq1BT
         vpa3KHL2PtJbKmR5F4IsxkAoO8iwE8AYmuMHIRmuF3ikh57Z7ZUKX3GHlnhBaH+KwHyI
         QpDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792820660; x=1793425460;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RNYQYEOxXiVYJ3h9tG9QBEeX8AF/aJm8aeklJyQsXRM=;
        b=ZO45E0CyTB4pIsBZYE9s2G6eJfRMFmVIHs5qsKrcmOmV3/VYliKMUGfSZpOcVWSDyI
         WzOD2nSIshbTeNbCGWA4mgac1cPdoXytlzqeRZybYtzHivsqKZGfp93WWLU5d9FK7W0b
         G0FqZZ/szZwW6xNcTu8eLVcrB8Yc0590y1uyf3tfuvlJsjWXSUNpOTyXOGM+Xk+0yISQ
         4Ok2vPB1Yv8pZ3L3cKgbK5fYqk/tp7zPWu7UTxdhdBWowGeDtA6UDxSVvWiRi8sxh6M7
         0looqboPIc3HztOWhhFCAahkbDgOc0ELm2VOpBwcmcM3Zi9YzNRxvtxDHcp2C54wZkUV
         V6Lw==
X-Forwarded-Encrypted: i=1; AKwUvBx/k1xVDscR2xbimVYCzEDLVxHYKHW/O1Ct9ud+GUtWO96ikg7QZsksbACuZfFW9mZnbtLmjUG3y8w=@vger.kernel.org
X-Gm-Message-State: AFq9FYIaP/qBsc0OeLBvc6mXO0LclK9hIfotsJ9zOZQqUlwUTS6QyXdK
	NBmfSb2/Uhr21msxto7YSh5rAlb5uxj8wmDK7GSXmM86F1OHK2MgyG03FaDtfX40ePIpHiaDZdF
	lCTneiA==
X-Received: from pfnw9.prod.google.com ([2002:aa7:8589:0:b0:87f:c4bd:8a29])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:12d6:b0:8a0:1931:e6f7
 with SMTP id d2e1a72fcca58-8a367a2e34dmr1038923b3a.10.1792820659815; Fri, 23
 Oct 2026 22:44:19 -0700 (PDT)
Date: Sat, 24 Oct 2026 05:44:19 +0000
In-Reply-To: <20261021210800.27338-7-gnoack3000@gmail.com>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261021210800.27338-2-gnoack3000@gmail.com> <20261021210800.27338-7-gnoack3000@gmail.com>
Message-ID: <atxEv-WBlsqEYo4b@google.com>
Subject: Re: [PATCH 5/8] man/man7/unix.7: SOCK_RAW is accepted as an alias for SOCK_DGRAM
From: Kuniyuki Iwashima <kuniyu@google.com>
To: "=?utf-8?Q?G=C3=BCnther?= Noack" <gnoack3000@gmail.com>
Cc: Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 21 Oct 2026 23:07:57 +0200, G=C3=BCnther Noack wrote:
> unix_create() in linux.git net/unix/af_unix.c does:
>=20
> 	case SOCK_RAW:
> 		sock->type =3D SOCK_DGRAM;
> 		fallthrough;
> 	case SOCK_DGRAM:
>=20
> so both socket(AF_UNIX, SOCK_RAW, 0) and the equivalent socketpair()
> invocation succeed and create datagram sockets.
>=20
> Cc: Kuniyuki Iwashima <kuniyu@google.com>
> Assisted-by: LLM
> Signed-off-by: G=C3=BCnther Noack <gnoack3000@gmail.com>
> ---
>=20
> Notes:
>     For completeness;
>    =20
>     It is more complete to spell it out, but on the other hand, people
>     should not be passing the SOCK_RAW type when they really mean
>     SOCK_DGRAM.  I'm on the fence about whether this is useful.  If you
>     want to omit this one, it also feels reasonable.

Yes, please drop this patch.

There is fallback but only for a historical reason; just to
support too old BSD program IIRC.

We should not say it's officially supported when it's just
converted to SOCK_DGRAM.


>=20
>  man/man7/unix.7 | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/man/man7/unix.7 b/man/man7/unix.7
> index 232fdbf4c3cd..29843235def0 100644
> --- a/man/man7/unix.7
> +++ b/man/man7/unix.7
> @@ -39,6 +39,11 @@ and (since Linux 2.6.4)
>  for a sequenced-packet socket that is connection-oriented,
>  preserves message boundaries,
>  and delivers messages in the order that they were sent.
> +On Linux,
> +.B SOCK_RAW
> +.\" unix_create() in net/unix/af_unix.c
> +is also accepted as an alias for
> +.BR SOCK_DGRAM .
>  .P
>  UNIX domain sockets support passing file descriptors or process credenti=
als
>  to other processes using ancillary data.
> --=20
> 2.56.0
>=20
