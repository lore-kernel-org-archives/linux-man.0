Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793054533;
	b=u2pGhmO+NCKK8r3vcI7BYyoQxmOu0OUwauxldiicqNiqQhKTBj2JDU64v5s1kcEqYWZ/
	 uDOXKnIR6N0HDM11YqxhA6FfjkR1fhQG2XCAOR6Ysv6H5jHlV2jS5mvb6HpGz9MFJbYQe
	 PD5TxbbuvPyiWfDVarXz1v+yoFTV0LciLiMTnw53gfV2yGocTiXpCbrxl5/zOEZiNqvsu
	 s/Kyy9qYvYj7YzmmeYCLuTOkhijp3g7EyC21mvq/H3xvys/KOqTS4vzZZ+qDkGf666RTT
	 icHUqUYNowuZ4T45GtH3yMOTuh8ZyXcq+VFAuN4A8PnbERqteZMzSuPQfjnyDUrHFOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793054533;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=efT/UfLm3+w13Lwuzf/pYWjlQIj+PLwHfRkZFo4jRrg=;
	b=ROCsre/64hKn+pFPrhsocmSiWTHtYtNiOkbxFaxNq9X+0M7xEXAWD3ayNE8QQm0YrS+Z
	 0QJFE951I1z6RfggYvZIWzDQ2ARKx4A9w0ZONulkO3vmL1eO7hMnT9P74zr8lS0Kf9qGZ
	 ENKUk9g16IMM372VS0CH/3mCGuWtKaRmkfZ7D27rzHvK0r8ErbhdiwtNVKPoh63JQu6SP
	 aY9Gsimi4VDPw+EcYAM8NKWPKJ0NEjCIlckagqqzLiUF/ofLF5QC3AjH/qDsgzti2oaqY
	 zo9Db2ziEyHGyMBxvH/nAX/a8MHoRrnj8LitALlIY41C9zKlZKb/Ctm1GoYtt+UaKxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IAQqGd4H;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C68606A31B
	for <linux-man@vger.kernel.org>; Mon, 26 Oct 2026 22:42:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58C68606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IAQqGd4H
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48df54150dfso1915010f8f.0
        for <linux-man@vger.kernel.org>; Mon, 26 Oct 2026 15:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793054531; x=1793659331; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=efT/UfLm3+w13Lwuzf/pYWjlQIj+PLwHfRkZFo4jRrg=;
        b=IAQqGd4HSDgKc94v41QeBPtuCAbZIq0B0GVx6rzXg+80z2KJaVKnAuuCM2U3bGqW+b
         gU2KT7lOL7x8tcBk5XBhJwfScda5hPrRsX5oDhEte8KrqkxDhADJyP284pDXQcXKl4rz
         liG3unE8ZFG38iYgGuK0J2n/XZ5dAsCL+/0i8KCijBkm176/dQdbiqNGdkxFIogu1Zc4
         9nbbJO1lEjAoIXwU3e+1cO+D+NEl0WHxmSwPcIERwcNYC0zHjjPKshAcpYKhzQZ4JUdm
         6R94gQogD+vNe75bBU4SW+ESOX5HjOFxMQvHQUDVcdyPTsDVt4ftSy9O8V7/W2gS3s1l
         VF2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793054531; x=1793659331;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=efT/UfLm3+w13Lwuzf/pYWjlQIj+PLwHfRkZFo4jRrg=;
        b=1Y2pX3a0HkAnrHIwbIsWzEGL4pu9KS26Ypn97aMp5I1V4IDXDaktVLMlKYI03UIkCk
         5YNmEUIy8sLSylQ0851ZXA8A22ucMhXjhSGwho785PzMjLfwTFXM96r+tryIFyA2pObU
         9+QZAi0LZ7rYeSlGsg2cuxHqXToiee1U/OGJiJE41fsLL+VF3TPOkMBIxXRphurDFGyk
         pH5k0CpEUthhkhGU9A9K89zF9zVDDLKJZCqf7V4zWGiKoQRmXJFfV5eUBRJYMyMMQ3tS
         Du0mOnGOt9w1jlMMf+TY2xdkatz3+LTvIEAM7p2zYA2aRO71kmWBVpTvH3Bzdw1e3H6v
         /rkA==
X-Forwarded-Encrypted: i=1; AKwUvBxMWACE369WkQCOuYwY8L0ofx6vrhl/02PSpu54tORRaTCs8ue6J6VGOlEF6XdN9DxPYsBdtLP4sbU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLhyke/KmUq/iV8EUm6dqxvKvr8teTR09Njagjc4o+QEyZh4WQ6
	kojxuaazE7lQCUn3zMDOHYQUGO+0S10lRahstGKDqJfLWBnGJOdRwN2A
X-Gm-Gg: AYBFou0kLXHCtgjjuhVvtdsZJC4EknKAjKDyNtdWyegnY37fk7/cwr0E5kOvx1h2/z8
	xy2wQdUjFQsHopQmo9HCUxriTWG7eZOwdh/QMdFspyn7NXOV8dsp8USi05WigqHLMqUeywZQpay
	yqYbeVvlN9OX+70ZgN0RKBnIT+ptlGsR6u8yBKPhvdTR5QpE0X8fRaIaRpV8PCqoPx6YIj8DWIf
	jpYo2KiN6fYd+DqSLsxngdcO6a6NRxOjjGf0QOlbYAQe2fAEpti4UNxmTjuhf10Ds4jnw08oqOb
	LUYUsOnNWP59nI3fZMm+3+ByxN7fKRSDsyZo3llmX3p2crKFVdIKgTZGuOeqg4hRdoZ0K+IQHvn
	SsRU46FVBu/jfw1hxWAAtje7ExIIYcjnewI6037caIO/jMOx8QwtC2ZSsr2tbYwB4A4uXHAuvby
	7y8cliVctT+aik+XDmyO3SaCQ+yHvAjGsV7LA/d5lH/BSes9k7siPkvU6WXjQ3zV29HWfHQW3rm
	TRX4y1adi7xDBGOYpM60o0rjLNz1F2Wh9x7y4kAt3BZbWL/hkycBGqUjtmMx8CSxw6456xZ4oDo
	8KXa
X-Received: by 2002:a05:600c:4583:b0:4a1:825a:56fd with SMTP id 5b1f17b1804b1-4a35acc2773mr168087175e9.32.1793054531276;
        Mon, 26 Oct 2026 15:42:11 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd47basm20665434f8f.32.2026.10.26.15.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 15:42:11 -0700 (PDT)
Date: Mon, 26 Oct 2026 23:42:09 +0100
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: Kuniyuki Iwashima <kuniyu@google.com>, linux-man@vger.kernel.org
Subject: Re: [PATCH 5/7] man/man7/unix.7: SO_PASSSEC: wfix
Message-ID: <20261026.df68852fedeb@gnoack.org>
References: <20261021212256.27961-1-gnoack3000@gmail.com>
 <20261021212256.27961-6-gnoack3000@gmail.com>
 <atw7vbZdVk2RJWw6@google.com>
 <atxr50Vql9s6XW4F@debian>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <atxr50Vql9s6XW4F@debian>

On Sat, Oct 24, 2026 at 10:36:33AM +0200, Alejandro Colomar wrote:
> > Date: 2026-10-24 05:02:06+0000
> > From: Kuniyuki Iwashima <kuniyu@google.com>
> > Patch 4 touches here, why not squash ?
> 
> I prefer not squashing.  It makes the commit messages more specific,
> which is easier to understand and review in the future.

Ack, leaving it unsquashed.

–Günther
