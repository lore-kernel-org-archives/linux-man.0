Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794790108;
	b=1PlUfbSdmzEKxHcYEslzuM+675DusGMciOxe+MuSjoW+SYq1BCh7PylJUN6ACt3xBwST
	 EN9KX5X29P5P7qs+kZWCJoHBcH3Ykor6cBUG2i3BaVihwZGJ2ZScgRSmSqG+lTcF5TD6o
	 KHEzj7HgHr+jAUFhxTCATtc2h6e59VPu8riaCWTtX2LqCtZLwGQ3l6PmnhksnmIAcrIyq
	 Blvjg5Az8aSS9sCexoJJk8rzbBe0zQDdIRhPdpYlxg/uWlbbnsa4hZtqkVhXSLX/fx3Wz
	 zwI//DOJEo9bplCG6OmTvgvCYRWXSjkw7fnDKDxnveLR6uh1mU6QBsAQjNA+tRAwZ9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794790108;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=2QSuctT4YvidP3fl470TOGAf8o2ewX8qStIO4CjJvOI=;
	b=iT+WHKDqIR3rrAs7H1n007bek5+4bQlDhbozwaTYMvqc65w14C1rHinKaCfoN34M5ttE
	 KlvCpHTfBNlt+hStGfDV+O1Nls0QDogcC49RFE5qcEQQ9j4Bp3jED79+na5gpwgZX6tul
	 QLS0NHFfVhGNzsh6iXNtPTcjQpCCP3nYWLD79bAADj7y+U+FfU77H4F8vLT/kySPRSbz/
	 hxbcRE+QmD0KijUL7Z3kyFI2NuOMosI2GONpvD4dWjN6BR5TNtst3aUAquQpckNWgEJNt
	 kVLu10Kmajulv8GCF0/wNM/jqQX7H1kboyWcm5OV3Lk3e//BpJk21Goe9bBUzbk1H1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NmBqjLuG;
	arc=none smtp.remote-ip=209.85.210.199
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CADA606A31F
	for <linux-man@vger.kernel.org>; Mon, 16 Nov 2026 00:48:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CADA606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NmBqjLuG
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a079256596so2008976b3a.0
        for <linux-man@vger.kernel.org>; Sun, 15 Nov 2026 16:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794790107; x=1795394907; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2QSuctT4YvidP3fl470TOGAf8o2ewX8qStIO4CjJvOI=;
        b=NmBqjLuGe9BXNpXCHpmPbLRodus8oqcabkmhx5yoM9yuIZv+OokylctAqbfO4xd5we
         /HvthZ50dgiYmowCvYmuYmFMZPuq5SeQ9qWeax4R2PUiMTzs4Q/Wt8g9vvNTE1p78oqu
         TBw867lXPEWhO1czcng86QWNZqZN4ZylWuqVYB+Z70JfalWyVrm55KKygQi3MNb6NNpn
         wMun5/MXEX7dg1HLGDL6YkADunI4w3IrcEEtlXXaJJaPSsNA7jRTeoUIBFPnViSkzqni
         gWZE73TVBIPSRem7qFzToFT5hGmfCoroNagPhxOdn2q53SKZ++jnjBc1DWx9+2Ew5zQK
         vp6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794790107; x=1795394907;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2QSuctT4YvidP3fl470TOGAf8o2ewX8qStIO4CjJvOI=;
        b=rFCCQoToO0VFsWLNGa4QCrnuhFQbvd+6i9+W7wZuqVQQZHpL9JXkah+xlsKWwGLHNQ
         pmNbJcjehdO6ffrTasmVwG7S4GjI6qf26TIZWieHlmCrhljuPo5llkKYpgF/T4bl3Kwq
         ikUqrS3v39zuXgBOmJNywvEbD8Y9PGn2G7LdHw1Py5Tl7DuD6eSmFrTPLy10XXWpqFz8
         VbTgLsp/Px8+v92AU9tbJxuL8AEzqx873LP7cQw6TC45CrWM3abWLMkLK90/KRUyat5V
         aZ32eXkjQl4GKlJ0UCQPLU0Wv4cbAT8+x+SvpjpXGmWleV8vMVP/0LG+sdqoPZoanBTK
         iHfg==
X-Forwarded-Encrypted: i=1; AL+hErFstb8waWpxrMQDmFx3Q+tPJDURuNcahTOGv7R3SSoQ2mXyUCSIxr70uHXSiXAKj99xa2LLbuOrMQU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9EZg5achJAJrSVltAqpFFcdGJkEEcpyEdyWdPXZ6Nyt6QKGNaB
	TAzdk0KWIVsNMgteysrqCQJfuT4sZei3DIBw9z5UaQ1aIP4NalmH5vh0sjKt13shFFu0Ue4Lmt+
	6QSQFvA==
X-Received: from pgby22-n2.prod.google.com ([2002:a05:6a02:6516:20b0:cdd:c2f7:a077])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:644c:b0:3eb:affa:32c9
 with SMTP id adf61e73a8af0-3f7a22a901fmr6049157637.0.1794790107436; Sun, 15
 Nov 2026 16:48:27 -0800 (PST)
Date: Mon, 16 Nov 2026 00:48:26 +0000
In-Reply-To: <20261103202136.13574-4-gnoack3000@gmail.com>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261103202136.13574-1-gnoack3000@gmail.com> <20261103202136.13574-4-gnoack3000@gmail.com>
Message-ID: <avpSdJAn4DSR8qnd@google.com>
Subject: Re: [PATCH v2 3/6] man/man7/unix.7: SIOCINQ: Document behavior for SOCK_SEQPACKET
From: Kuniyuki Iwashima <kuniyu@google.com>
To: "=?utf-8?Q?G=C3=BCnther?= Noack" <gnoack3000@gmail.com>
Cc: Alejandro Colomar <alx+linux-man@kernel.org>, linux-man@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 03 Nov 2026 21:21:33 +0100, G=C3=BCnther Noack wrote:
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

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
