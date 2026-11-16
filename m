Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794790757;
	b=zgyov9cIlsTcB0B169WQh2e7RyI6/Uzr88H8xzOdUl5p2fIa4CfC5IlKf63qklgd8Hp2
	 z/7oMKw2OOONqILSXelWLQUx2DIlPFrZuYmQumRmrghMuhefgdyN1p3FZHQhPL03r4rWS
	 IjT98okYpYAk6QOTozbUuPAo4be97c83SxF4JU+WDSbFo61B8weMXtEUDyEVKB9AimneE
	 A89DYCdgGw3K0ARA8v54fNVkix43ciIkQU/RbBukDjy9RurT1xo4szs7Z1bdjjYEqiFQN
	 /RxJSLL3kpQSi1oVUOJPxJ2Mg83XnOp0G7u/3L238iJ8bQL90JyVg3xLZl3sz/d18pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794790757;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=YkbEZk00UysPVBgDAnuRJPGugxmj/LxUYkjLenssCDI=;
	b=Il4uqiO/B+aY71h/B5A1uLTdAoZnA8nvz3euG+0zCmOirKvanBRkhIyeqPpFA/pz3NWv
	 O66/i52CHMqQ5SGxlu2DLrbRQiumXqHJL5BowXsgFMte+tpsbEKY+cph/xjygZGWV5xAf
	 TF5h65z/YW1FRdoSm97H/p1BImc5CRYs/J3yPS/yioIJ5IJ+mNEs6jeSWzWrMtDx2ypXt
	 SKCIIWBsoKVgF2KiUXU+r/iRHr1x8pTU+KNBNNIjl4NUW802N7pH50DQzj/MWQtgSx1uB
	 BLkW5qg4D7j+OjVo2H4vCb579PiSkMotLZrUfGFsAFrUU8mlYHpNufJ9EsJdke/ulVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="hqYb3D/H";
	arc=none smtp.remote-ip=209.85.216.72
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA73F606A31F
	for <linux-man@vger.kernel.org>; Mon, 16 Nov 2026 00:59:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA73F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hqYb3D/H
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b1a6447f1fso2455174a91.1
        for <linux-man@vger.kernel.org>; Sun, 15 Nov 2026 16:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794790756; x=1795395556; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YkbEZk00UysPVBgDAnuRJPGugxmj/LxUYkjLenssCDI=;
        b=hqYb3D/HWP+8C1jjEr3UzUWdsZuhDGZ7pJWcuQQA/LEL49hvqEkE30DawFpxdfbD9C
         yD5sk11v/DxZhjwWiIHwRyqfVyd8wFASw6XtKiWwwdIghOj/xkhco2j+7w7hz/M82T+X
         wNbOQ6wfAQcRC7LSwSljgtoaZU1M4uO02NvCXbwp4JfcrTKnYrfAhEpDnEaB03DMMTv0
         XSo4jdkoZW+9oSLwouWRbZxlL6UbiqZ5ULebm4XPX9wmr0dH9T1RLOfghACVVeGhlZrI
         3nImQUPDNPS4opxupclrt91GfK7zVfyo7JquOpa+RETI/SRcJXMaBNdZOWpXH7EZwCam
         keCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794790756; x=1795395556;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YkbEZk00UysPVBgDAnuRJPGugxmj/LxUYkjLenssCDI=;
        b=tx6TCADtbyhEaWUCaEKBsx9ettLytHnPoeLKvWq7xD7ioNFTEGtgFGS0Dw9m7EwGYg
         rR03AF0mf/Uze2kU0//541/qd/WIMsm6x14HFKUJTrR9C064YaGcU3ly+YNw6tg4C4qg
         fcOAkUCVC2w1si0BFYdkt3oIoPgPHrDOGlSy7J1dcqLrjK6Pb22X0zlud/LzETEilY/2
         1u8efXzolhYAyKh0a/Sl+MDvud5ZCMISOECO/mh+kI9Lq/9D8om4vvHaKQ141bFCPoSz
         Jir5286G//0F7rU1adsl+k0yQPWqSel5xK14REXEctklwSvP+XP8yT0VQDLGcVo9Y8bi
         NUjQ==
X-Forwarded-Encrypted: i=1; AL+hErG9vi1blX/xUqyyz8l2yqEsxsKshbiDYs/XS0Xpo6PdfqtX6NbpzpP4sWeN2pXPDP6JS+a0I/3kTwA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9X6O8yAGGFPKH7JYPy+klXSVCHx0ndxou7k0lWHraWSvOFe80M
	pSxZvv6DCyzCXPikm/yRTFjkGU/49+ZvX28qgbWqKsKz4tjRlJpya0ar9+TKm3v5fTsv00Ppkmp
	uWyiIZQ==
X-Received: from pjbsd6.prod.google.com ([2002:a17:90b:5146:b0:3b0:994b:db90])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:e18c:b0:3a0:ace4:d2b4
 with SMTP id 98e67ed59e1d1-3b1b0a0d930mr7757244a91.23.1794790755938; Sun, 15
 Nov 2026 16:59:15 -0800 (PST)
Date: Mon, 16 Nov 2026 00:59:15 +0000
In-Reply-To: <20261103202211.13820-9-gnoack3000@gmail.com>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261103202211.13820-1-gnoack3000@gmail.com> <20261103202211.13820-9-gnoack3000@gmail.com>
Message-ID: <avpVWjq2CPwgHZrx@google.com>
Subject: Re: [PATCH v2 8/8] man/man7/unix.7: Remove mentions of "namespace" in
 the general sense
From: Kuniyuki Iwashima <kuniyu@google.com>
To: "=?utf-8?Q?G=C3=BCnther?= Noack" <gnoack3000@gmail.com>
Cc: Alejandro Colomar <alx+linux-man@kernel.org>, linux-man@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 03 Nov 2026 21:22:10 +0100, G=C3=BCnther Noack wrote:
> In unix(7), the word "namespace" is often used in the general sense of
> the word, which becomes confusing now that the man page also discusses
> its interaction with the Linux namespace concept (see namespaces(7)).
>=20
> Remove the remaining uses of the word "namespace" in the places where
> it is not referring to Linux namespaces.
>=20
> Signed-off-by: G=C3=BCnther Noack <gnoack3000@gmail.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
