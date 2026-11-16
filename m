Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794790281;
	b=NdNGHniI9qK0kIpB2wfE9p1PhTdbV/5VAd+DckWd/gR0kXUXkR0UYiCV7wKDRfCceFlo
	 7OsMFOw/q8AaoNYfiS41tE/GWNHisvnDDUybMPUJHoPNUrubOQ1l6kSWbxpbOOcgB4hBT
	 hEJphyJu0OlF62WSYNucL2gQYWsECNEfwn/nUm9Bb+LqBWr7Z5Gkon+zSKaURIjd4XknK
	 K6iACEpnNM2ZR7rvUYouqW3qCcn2F1SZOrxhsnd0LSwCTVfq8Ft2rSkw+BF/WKVPYHIbV
	 vUi2p2OA5n0BEKcSUvopFaRNzOd5eA6SqdnpLFPNPkEZ+jLcoNeQ7SNmjQ0sDdElQwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794790281;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=6dN0tbN8V70YxKH46SCZDmNw1DyDWLlzHZjGMAqjNwM=;
	b=MQXr2SUr4+o2NrAKep2iHXDKDFzoKswpdgmXFv8rJQElmkMABOicbV+hQazAFv0e/L8J
	 rtNzu5Z77FrMmb9ODe/3AszR+5M0zyd/iFFjki2HW+nsrJkSOdCztARX6uwOBu3LEGQVo
	 nxYTFJ5/gRkoO76KnI9/z0kzHGnY4o55VjgpVp9U1cTcouCkNYNO16GlaKVUbzOvGx8Pt
	 lFzzlMRz1wgoXvbRNJR0qhJ5TZ2WJgiqfL2UIS7fEzyo17cGWmQuy1mJdol5ArsuKvBdw
	 VcdQjM/oRYvZjrSWPYMWK5Yh0MC/bzkFvqWRznnUO9M4/zDpBJIq+Mah8YKesA8xGiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OHIdKPOG;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9EB606A323
	for <linux-man@vger.kernel.org>; Mon, 16 Nov 2026 00:51:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F9EB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OHIdKPOG
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e95f8543c9so40073355ad.3
        for <linux-man@vger.kernel.org>; Sun, 15 Nov 2026 16:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794790281; x=1795395081; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6dN0tbN8V70YxKH46SCZDmNw1DyDWLlzHZjGMAqjNwM=;
        b=OHIdKPOGwRTRxuEcbdIksMVP5ciFb7h2LMaqPSFYsS4TV1scjr0KUE2ZAsMyzIIo/7
         fWU3Wp6vQDqy5RPdLBUUIB3bX7OBl1v/khw7SIg+4uQbUClxVh+VsUaH/M99T0J0zPxu
         p5gWCEbsLGSxqHkHwXvNL8GrcIPVz/Xg+iYk3ArwKLC6J8/XRCooYhJv4nkfcGkjPR8W
         QI0x2ekKQ3mrop9swAs6eVZiCB7tSnODfVp3QkP+/wAMNwM3/+D46C0PkXSeE8wMvGKQ
         zCcXxc49RzhoATUrIlQ4vPJsJRUWe7VR/cbB8ASGtqr4Jd+OGuxd97SOuFc8OPzR0/cb
         ZEYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794790281; x=1795395081;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6dN0tbN8V70YxKH46SCZDmNw1DyDWLlzHZjGMAqjNwM=;
        b=Ib7BGiU7bl2AHC4Qhp/Xxr695Po+ElTq8kP/E7uk8Ue8ZIF+UEUzobSxnqNau4ioHw
         qSN9QQS7xgd04GRId1BL8+CueGgQKxgSTbQZc4vFl3VEHbaZxSgImZ07wPbWR39AhZwF
         SnKeYoG0CaCokDHbsoid8ZoXj3tP2GJ/Svwa3giZzmSNjKHB6h4OtfrtgFjk7lj7Cltz
         oCsRWXPFVC1HUiew42kXxP7dhgfAymjlssJuc7GagI5brr95QFzwACa2copkITEnRWn0
         VUYGnA3rUpLRBbb1eiK0s1o9SXiMmlADvyuzbd0VQdOUTAnIgz9hLN9ztqFsncfFUS6X
         O24A==
X-Forwarded-Encrypted: i=1; AL+hErE1GrcqrBagXF8hdUq6ZYchsbw9txGCADrzf+LzWSg1cvY4vZusr9Yu8R1SqxQrs7qqVyIHOKW3al0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/D1/F34gct2p6VPfmRKDemQPw6CJEH6aDO2QtQX2gaQc48pebk
	Dhc28/Il1XKEsVHnXO8w4FSZHfrqloFUHeD7LsHFfx6zI1LiDMgWgMDX87K3HrWAtRGXMpz4FtO
	Z77ORkg==
X-Received: from plbkv6.prod.google.com ([2002:a17:903:28c6:b0:2ed:630:40ae])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1b2d:b0:2e9:8e0a:cc4d
 with SMTP id d9443c01a7336-2ee0dee4092mr83401325ad.41.1794790280169; Sun, 15
 Nov 2026 16:51:20 -0800 (PST)
Date: Mon, 16 Nov 2026 00:51:19 +0000
In-Reply-To: <20261103202136.13574-7-gnoack3000@gmail.com>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261103202136.13574-1-gnoack3000@gmail.com> <20261103202136.13574-7-gnoack3000@gmail.com>
Message-ID: <avpTfVwL7BEtKjeO@google.com>
Subject: Re: [PATCH v2 6/6] man/man7/unix.7: ERRORS: Document EACCES, EAGAIN,
 EMSGSIZE, ENOSPC, and EPERM
From: Kuniyuki Iwashima <kuniyu@google.com>
To: "=?utf-8?Q?G=C3=BCnther?= Noack" <gnoack3000@gmail.com>
Cc: Alejandro Colomar <alx+linux-man@kernel.org>, linux-man@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 03 Nov 2026 21:21:36 +0100, G=C3=BCnther Noack wrote:
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

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
