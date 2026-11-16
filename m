Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794790409;
	b=IvduHvp+EmulP226DcZWUo67yNYK9a7dlYqdfsrEvQZCHZUYSyLdSs1Y+4nc+Aff7QI5
	 QLATNIWLOGcwVKeFzR7MajE4P4olB/b7EOqslhCSDWtwv8SfcnCUkSgU+4neRxV0UG4hV
	 bgFj65D2C4VKBUYWwO7xtH2IFWw1yfhL15X2c91zgeL9nex/TqXwYrBe7ElY7VFnVyJmP
	 cr8LqiJ/Zlq2r9VEPoFdzgE5GOOL5wLRXTctkVRpaVbVxYcaLZ37YIeZ7+yshxRTNiSJz
	 4zV2w0xImsFAetSW6lqHb6ZZww6VAgPpoF4ZOia6sZHT5IvroDRWbM1aU2SXDw27a2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794790409;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=vYYoU80Tohg/0oxyo+Icnbr1Wm6f9XxeIRRSCZSGuuE=;
	b=Wbqk6XUkqbvrIu0f6tHFblGn7sdiqUwWzOIctIzP42yG6wOn9GTz6mIqL5bBTO+4pHVn
	 vdml73gerC9s9fHkd3fyEJXuVx+EKHbFc76/U4JK/7QisQXsiO8t2KPkStOfsI/Rb4Qa0
	 gEq7NsWdQ3XbGknbUu2RA1LZbiBEfkj7+nOmyuk2wQyitClJhyYYwAHcvuKatJRXN0O/f
	 kii9aLrQMvs5RyPx1fYvPTl1MX82Y8UQRCY9orDWVbMg5UQihtlsdPtYAPFCSYy2eF0Hy
	 IhV//M3z6OH8LQweV0SGkFkhfkyNEdr2R4fSR7ykHmUl2a5/UtwcQRY+rRQewzCcciQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VSJdR+la;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917EE606A334
	for <linux-man@vger.kernel.org>; Mon, 16 Nov 2026 00:53:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 917EE606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VSJdR+la
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ed47dc8f3dso45146725ad.2
        for <linux-man@vger.kernel.org>; Sun, 15 Nov 2026 16:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794790409; x=1795395209; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vYYoU80Tohg/0oxyo+Icnbr1Wm6f9XxeIRRSCZSGuuE=;
        b=VSJdR+laSKUc9Nr8EkMnhSpaX0hBFE1Dvy2tggQPSjid7pJFdX2devKKjOfdyYcSzT
         cDM/fplZAGHjKWSD5uZbVptkPf3k3MEy22qPQ2MQcQEvEJcNYJ9rBoOBCacENi2CAHYF
         6BQhz0wogH8AmoU/pM/WIBb/tWBFrYW451YdNpQVAXiy+f0DwvxJR43TOMFDRYDjUh0i
         fTrwUythTkg2k2le1WjHz1n4zZu/rq+EgPSuoU63JKo5RktKybHBHjVT5NE3nZyOURFY
         fvtmei8QkZvITOxS3VSVWhsUr53MVfqDJ3I6os02ldj5GXWYysNRBhnJ4l8S4DJb5z+W
         sPcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794790409; x=1795395209;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vYYoU80Tohg/0oxyo+Icnbr1Wm6f9XxeIRRSCZSGuuE=;
        b=xjM+GNUBkxjMytA/cO5UDkh+TQMyjUBL8iujIy3MofVpDtC8c5f1KRd4hXLDNeW01Z
         0ILXcc7Uu/q45gcQYmwhDiEGxgRV1OEGKWpNEUNjymyu/61l/X2hRG/0u4voQGsqj8cj
         NCI/Sd0+t1Op58H7SSiFvx/pFT/5KcfD/bSzdmmuQ52jypBDK4XMFniOYRz8G5qBY+El
         bacenNstH+PPzW4ES7hMy59MfCZB77BUlHvITUh2d1OKCdRKqsEpwKAS7zp9fiw4jhqG
         R7+QdaM4DrPzKKlaeUdEm+/p8M0CxDUmIDE+jQwOxP+ZqkSRKiQUVNoTK8az+HN/5tp7
         3Ebg==
X-Forwarded-Encrypted: i=1; AL+hErHwqSKYH7Ko+uaLrInfmvITQfuTU4earzT0vFvcUOHlNejFbb6CxD59OvbsDAhzqeaNIfSjss9voAg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mpEKpk4LFmF1VgWoeVGHvcLpgW4dOmQUBdx6+dwTIoxMEr3o8
	48D+CnnvomCP9vYv0mE8wsGnb0EHFXnaF5Lax++GvMvPblhCKLshwduWsKn7HdoUoD96tspL01A
	VWxHqbg==
X-Received: from pldr2.prod.google.com ([2002:a17:903:4102:b0:2e9:3e55:fe6])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:cf4c:b0:2ea:9ca2:6313
 with SMTP id d9443c01a7336-2ee0d9fce6bmr87319585ad.5.1794790408736; Sun, 15
 Nov 2026 16:53:28 -0800 (PST)
Date: Mon, 16 Nov 2026 00:53:28 +0000
In-Reply-To: <20261103202211.13820-4-gnoack3000@gmail.com>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261103202211.13820-1-gnoack3000@gmail.com> <20261103202211.13820-4-gnoack3000@gmail.com>
Message-ID: <avpUAEkxyr8ZvDpw@google.com>
Subject: Re: [PATCH v2 3/8] man/man7/unix.7: Autobind: Clarify when it
 happens, and mention SO_PASSPIDFD
From: Kuniyuki Iwashima <kuniyu@google.com>
To: "=?utf-8?Q?G=C3=BCnther?= Noack" <gnoack3000@gmail.com>
Cc: Alejandro Colomar <alx+linux-man@kernel.org>, linux-man@vger.kernel.org, 
	Michael Kerrisk <mtk.manpages@gmail.com>, Alexander Mikhalitsyn <alexander@mihalicyn.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 03 Nov 2026 21:22:05 +0100, G=C3=BCnther Noack wrote:
> Autobind happens if either one of SO_PASSCRED/SO_PASSPIDFD is set and
> either connect() or sendmsg() happens.  Mention SO_PASSPIDFD and
> clarify that autobind does not happen immediately when setting these
> socket options.
>=20
> In linux.git net/unix/af_unix.c, unix_autobind() is called by
> unix_dgram_connect(), unix_stream_connect() and unix_dgram_sendmsg(),
> if the socket has no address and unix_may_passcred() is true.
>=20
> unix_may_passcred() is also true when SO_PASSPIDFD is set, which was
> added in linux.git 5e2ff6704a27 (2023-06-12; "scm: add SO_PASSPIDFD and
> SCM_PIDFD"), Linux 6.5.
>=20
> Also, the old text said "not yet connected", but the condition is
> about the socket not being bound.
>=20
> Fixes: 9d1fd1157306 (1999-06-15, 2022-12-19; "man-pages 1.24")
> Fixes: 0cf2caa41ea6 (2010-10-10; "unix.7: Document the autobind feature")
> Cc: Michael Kerrisk <mtk.manpages@gmail.com>
> Cc: Alexander Mikhalitsyn <alexander@mihalicyn.com>
> Cc: Kuniyuki Iwashima <kuniyu@google.com>
> Assisted-by: LLM
> Signed-off-by: G=C3=BCnther Noack <gnoack3000@gmail.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
