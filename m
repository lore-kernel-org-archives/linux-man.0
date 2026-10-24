Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792818128;
	b=o6oNLsWcfibnRZxs1UChvKkz4hS1tGBh6BGbBbBGgQaN/iQ/KIaQg+KUHSitd9npacAz
	 tSRjuNmjYpruoE5HjtS4khATHVj8oI9jIbC/e2upeJK+0S5aOjRNDGUx24uv4xej/66Fr
	 OqceAhl4J6I0yEApvYw12eJc/82DIUW1TwK9Ln75t7Say8LsvMERLsULQLUAmj/638zQJ
	 stUiFQT5UkOTRWGS32OBi9WbSxzTJRJPQkwPhtjDFr0THAkxYdUqFHsas4xRcQu3BNMeM
	 EDAyYluoPwdQ0ExMUsc94PlSTty3BQ8HiapdeG2tWSKwLfPsKlvvLM5qQoDkccmjz7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792818128;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=AlFWiu2Wi3zSVJOtObnRlLyBe3s6f6iAcelz1u33Rag=;
	b=TcbZVHmS2vSCgPcnA/0hfa5h824wBXtxxwJSmq9yof0447VJ4fFmIL6Az0PX/J4lGaj1
	 GaWx4fip8ZV1roOioSBvurDFkDlLJiSkguyUghZYZ15yMFK3j8qaX5rhYx3NGYKaCf9z2
	 mxh0n5IcntPKH0uqLd2FQRYgugEZZcaRRWJp2TLWTUw1JMWrQ2NgHK+oxM3y4OuzzdIhV
	 /xlizteE7/DBuh6BBEYrb0jXINjkwrguKkZ7spJAW0mvtYyCfio1KSlaFuc3PI7toVbx+
	 s2eFpojZVuHf88KjFtPLZSw4Gss68fNk/p5hT19oIazAyof8MvVzb8RC8tl6iXKfhTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=WTczXitg;
	arc=none smtp.remote-ip=209.85.216.72
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05C9606A31B
	for <linux-man@vger.kernel.org>; Sat, 24 Oct 2026 05:02:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C05C9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=WTczXitg
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3acc98e3b3cso1298728a91.3
        for <linux-man@vger.kernel.org>; Fri, 23 Oct 2026 22:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792818127; x=1793422927; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AlFWiu2Wi3zSVJOtObnRlLyBe3s6f6iAcelz1u33Rag=;
        b=WTczXitgxg+MnRboH8uWa/q2D+b5g+d5OiPfoKmN0vRdy6hjlXH1pmHN0MjFr6c/4V
         3647FgPsAEXw+Vh+UWT5rK/JMi3wEVCvuPrHee64P3EUKQknsS+Oao1oVCPNV3AsUIj8
         pFPFTsBE+3mjfiOFC+Hd1lNNBH+HPOsJdzFoElUJsB8+EI/niDe+XzNjyTIyOtzIwQXL
         9hIU3LRhIJb0BPZd6J6FiCX14CZnaPheGRD3gyQsNGG2PhJjyGqR77D9XPXmK1WvS/Dp
         GCVThYPS6CHmzjuEdKHLLEdyfPkjb16ucNgla5CM7TIHO4mDGrzaW2jjos3vju2bfiWk
         +Ifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792818127; x=1793422927;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AlFWiu2Wi3zSVJOtObnRlLyBe3s6f6iAcelz1u33Rag=;
        b=Fl+0nNlsPUlvXZJS4q9EtHOOMCMfESUlFaA7Iukh3hVQ+sQGF311/JrAgj8y0i95kt
         XEFGt+Opezc5l4DXhYE6gxUiDD+myJqpj7yHjm0/B2JPVCGn3zeVdQG82enlw5TQTmvk
         MRtDdJqFu7A4/S7aSskgLeIBlCsoDu3C3XTf8Z3/yEbgdlymZqEUFfu1QE/QF+LgrwOZ
         K70pZMYebQKMgZ0H9l9JgQbFgPYpNnyyk37F6lBIKTlX1dEK5Kgwj8V8NSGJ28rS7r+v
         IBx35KelW4YivwLJUPpadIXJbEJB+S0GVbSfP2z2Ctqjh6bRErxzk1C9GT3ZECO74W9L
         kUcw==
X-Forwarded-Encrypted: i=1; AKwUvBwLMj9tdHNExV1q8YgJ/5VEu2d2KA/j2+zS3jp6OakflZkrqDQE2QwKn4PUUqGkcSLAsqD5RRujJ70=@vger.kernel.org
X-Gm-Message-State: AFq9FYLUOmKyqGcrE6oYOmeku67Lwf4PFLXshbR8DfHXxUdt/qhkjqXA
	Gl9eFziqRQPcK+s6Wt1YyDg0KnoED0UuVvfqw48C41mwTc1+2P8CoiSkOWpHm5uXqOB6MTlAJej
	rk90ExQ==
X-Received: from pjbqd6.prod.google.com ([2002:a17:90b:3cc6:b0:3ab:147a:52a])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1c8f:b0:3a8:699f:959d
 with SMTP id 98e67ed59e1d1-3adeabe535bmr1184894a91.31.1792818126877; Fri, 23
 Oct 2026 22:02:06 -0700 (PDT)
Date: Sat, 24 Oct 2026 05:02:06 +0000
In-Reply-To: <20261021212256.27961-6-gnoack3000@gmail.com>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261021212256.27961-1-gnoack3000@gmail.com> <20261021212256.27961-6-gnoack3000@gmail.com>
Message-ID: <atw7vbZdVk2RJWw6@google.com>
Subject: Re: [PATCH 5/7] man/man7/unix.7: SO_PASSSEC: wfix
From: Kuniyuki Iwashima <kuniyu@google.com>
To: "=?utf-8?Q?G=C3=BCnther?= Noack" <gnoack3000@gmail.com>
Cc: Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 21 Oct 2026 23:22:54 +0200, G=C3=BCnther Noack wrote:
> Use "security context", as in the description of SCM_SECURITY.
>=20
> Cc: Kuniyuki Iwashima <kuniyu@google.com>
> Assisted-by: LLM
> Signed-off-by: G=C3=BCnther Noack <gnoack3000@gmail.com>
> ---
>  man/man7/unix.7 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/man/man7/unix.7 b/man/man7/unix.7
> index 4abd216d19c7..67dd10cc146f 100644
> --- a/man/man7/unix.7
> +++ b/man/man7/unix.7
> @@ -317,7 +317,7 @@ and returned as the result of
>  is an integer boolean flag.
>  .TP
>  .B SO_PASSSEC
> -Enables receiving of the security label of the peer socket
> +Enables receiving of the security context of the peer socket

Patch 4 touches here, why not squash ?


>  in an ancillary message of type
>  .B SCM_SECURITY
>  (see below).
> --=20
> 2.56.0
>=20
