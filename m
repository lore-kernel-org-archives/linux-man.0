Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792819680;
	b=bDS8lDfIteLfVIqrB9zQD+1nJgbH1wSRg4yHCNXLvXjnxNbQGIwvfmXA6eWqcpoPeN72
	 McSAk184LppoJn3ha/WD7RoxB5ItGg2fTb4jPLAHn+3iYg8uH9Vjp0mVP45Ubazes/rO7
	 Rre+4gcck7RoBb/e18t+WsbODL7myOtMuoqT7WIxXt9T4Qqj8WtSYv+s4yPnv7HfdhKrR
	 wlSeA77heXlUf1RqQtYZ7cPSZqburgszqyekOyeq8appou93ZBVt+Vq7k7KN1PKiGQVM/
	 /uHSxfmvBHj9Cmrq09N901xMSrHC54QwIF9lAfa6zQKQtYfxwgONhA0ZtODic89Ygiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792819680;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=ftOrWppvP5CVJuOMh3y6nFmBZ3El6fkY8RnALQM68YM=;
	b=bxqGiXD2gNjVpKGUS7JSPXcmrEHNLPPBmMwVHbStjuRJPhJMS+bz8leI6I5WlJBq56Hm
	 p43smX1XHIOIOgqw8iIfI3NDwjc+iQvnXFY0v6zA29HGuROuL60Y0H0DfWVrRRnB71aVm
	 auS1KIpbiVSQgjiMI+aSXKekpQn9Xdsf+Xyu5BJn4s+96x2ERo2+z9jsOSm419LC88wOO
	 BSVff21+HwlRDAd2vwaLhCLd5tTTVQce3h5QnQzAC3x9b8cpcokQs1jPlsOp4mwSiDIP7
	 49KnQx8zXXg/DS2YI5ydVVUv4g/cAZgvcIwrJgfgYlkZQNQRoiw6gVKF6vPGjZY4K3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=sYGZDBdO;
	arc=none smtp.remote-ip=209.85.210.200
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1A8606A31F
	for <linux-man@vger.kernel.org>; Sat, 24 Oct 2026 05:28:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A1A8606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=sYGZDBdO
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a0688a43d3so1120078b3a.0
        for <linux-man@vger.kernel.org>; Fri, 23 Oct 2026 22:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792819679; x=1793424479; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ftOrWppvP5CVJuOMh3y6nFmBZ3El6fkY8RnALQM68YM=;
        b=sYGZDBdOD/QdzpIDvVWNdAntOTuJmuzeeBsxMVJcWYt48oP++u1a3ZMt69Sx7o9BHq
         Inn3ZNpyp77mCRTLYdF825VR98LVqtNeujwOVPOKluZLg+3js4233+oT+GXw91xV0QWs
         4OhtQ0YOUPWBIngvI8QuM1vE41euEwO869HpLbQI9u/tBWi2dw+XpapT8UOb6PJFF/MS
         F5SUG38swnXlvJABQg7Cvg5wfdM3HhWFlpt+rLlGUaLpax8nXc458QHEw5rBEAgnjJwd
         8WrQvizXmxl2AST8il3MXfgD9HFefDrEXlmUzBjNtwEt6b2sU1NqHMM8OC3KPgjdc7VE
         F6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792819679; x=1793424479;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ftOrWppvP5CVJuOMh3y6nFmBZ3El6fkY8RnALQM68YM=;
        b=S4XN2KtotY8NbYnhWMlWmVP2rw1mhLRex79OovQdb3xqkygA6u6Dvml9BdSXqRmGTb
         S/nnbLIqd8IxDFzny2cOMcV27Z40nCKC7KSESR1v/BUrzw00p3JQjGQuBdk0iqOS1HfT
         y2uVWe6wfIgaPWg0S02rXzyxR55eIozSg7dbAsy8ozfB+q4FnBfOMgNyPjy4IxhGya1C
         2YiWoFhvB6Nvc2VVpwD3vIlZ+zJl21yRMoSW1LzzNVoOXcxCLTyswu/fwfI6nOMgiusC
         4tc9Q4TVFDdY0fYU3JZMtVXowGhtv8EeMLbYeE9YPqyESO1N0Fe6Hk4hStgPo9gr+pfG
         ZubQ==
X-Forwarded-Encrypted: i=1; AKwUvBystp9TKhLakLzSdyi1i1qmCbmj21D32ybDZBf0/OUp9qAwbast9em6wHae8l8MPDptIuEna0F2AU8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIegCHz5dSU1p3pmTCwVq69A6+Ck4pqi1MnJKlTzN4lbfdjAbNL
	p2rRhGGRIpj1ClkI9QYH5HcvkKThHmpWCcaBdyDkpB1Z8J4OR1pzENRw2UeE7tNcT5ozE5H8KYx
	kYPso5w==
X-Received: from pfbln15.prod.google.com ([2002:a05:6a00:3ccf:b0:8a0:5d5d:e180])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:798c:b0:3e2:8f64:e500
 with SMTP id adf61e73a8af0-3e7cd4c0827mr778790637.62.1792819679395; Fri, 23
 Oct 2026 22:27:59 -0700 (PDT)
Date: Sat, 24 Oct 2026 05:27:58 +0000
In-Reply-To: <20261021210800.27338-3-gnoack3000@gmail.com>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261021210800.27338-2-gnoack3000@gmail.com> <20261021210800.27338-3-gnoack3000@gmail.com>
Message-ID: <atxB1K4h1XLZiUFo@google.com>
Subject: Re: [PATCH 1/8] man/man7/socket.7: SO_PEEK_OFF: This option is no
 longer specific to unix(7)
From: Kuniyuki Iwashima <kuniyu@google.com>
To: "=?utf-8?Q?G=C3=BCnther?= Noack" <gnoack3000@gmail.com>
Cc: Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org, 
	Jon Maloy <jmaloy@redhat.com>, samanthakumar <samanthakumar@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 21 Oct 2026 23:07:53 +0200, G=C3=BCnther Noack wrote:
> The option is implemented through proto_ops->set_peek_off, which is
> nowadays also set for UDP and TCP sockets:
>=20
> 	linux.git 627d2d6b5500 (2016-04-05; "udp: enable MSG_PEEK at non-zero of=
fset")
> 		Linux 4.7, UDP over IPv4 and IPv6
> 	linux.git 05ea491641d3 (2024-04-11; "tcp: add support for SO_PEEK_OFF so=
cket option")
> 		Linux 6.10, TCP over IPv4
> 	linux.git be9a4fb831b8 (2024-08-29; "tcp: add SO_PEEK_OFF socket option =
tor TCPv6")
> 		Linux 6.12, TCP over IPv6
>=20
> Cc: Jon Maloy <jmaloy@redhat.com>
> Cc: samanthakumar <samanthakumar@google.com>
> Cc: Kuniyuki Iwashima <kuniyu@google.com>
> Assisted-by: LLM
> Signed-off-by: G=C3=BCnther Noack <gnoack3000@gmail.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
