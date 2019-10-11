Return-Path: <SRS0=eUeQ=YE=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB4BAC47404
	for <linux-man@archiver.kernel.org>; Fri, 11 Oct 2019 21:45:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ACA712054F
	for <linux-man@archiver.kernel.org>; Fri, 11 Oct 2019 21:45:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rz3M+oXN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729273AbfJKVpz (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Fri, 11 Oct 2019 17:45:55 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36009 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727197AbfJKVpz (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Fri, 11 Oct 2019 17:45:55 -0400
Received: by mail-wr1-f66.google.com with SMTP id y19so13407756wrd.3
        for <linux-man@vger.kernel.org>; Fri, 11 Oct 2019 14:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=cc:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=v85+whEMrArBmatl0bUtY11T9mANlgRSMP/RakXi/Uo=;
        b=rz3M+oXNnwYHW44ssZAZzcWQ/1BM6WEvexgtJghhZqMDUxXzacHSWpjvXsf8HzUscN
         gWGBDkVsjnBlZy6BfaeT7Avt61WUdOpBre+ECoCdibey0Q06568LqCJfkfeAcYWf0t2I
         eXz7YFdkXuHVu9ps8eIrS4VuKwZqrkqmKGvPMqsXr4HyAYqn0idgq3TNXRVxApPBApf/
         5QSqXlbwjeksU0wM3Pixim89S4TQiRDuIOiI60mXadtXamGpRLJxECACRLHha4b1qkJR
         eOakSfwGqSq4waFi0ZuxkH3Z/kdRXfYFkEMpmLUPGCeOGrigkkht2P8rF75HzR7PRg1T
         U3ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:cc:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=v85+whEMrArBmatl0bUtY11T9mANlgRSMP/RakXi/Uo=;
        b=DLo+hK2l3qQHZXBVqmQuceAUIaFWxGpHK/6DXPsSPlRxVbdTQlAIzY2z4uXJiEjx2q
         7G80R6fMdxg+tFKlKKrxt9f9pBzJ+1JlDbt62vp4n7HBJeWXkIUUEg7cjcBUOtUSDDz0
         WLQMqtlQpYP1CxkiXpH+8Jl2WXZQRhRxQV/Khk3c6T6W7q6oHdeigR0+4UHGjNzwkjGY
         1PcYvBbuow0JlhWMsnW1Ixh8zbaxgOm2qMTylQdZxPl/YLoYHQMhoXTFq8cMLZczR2sp
         HHxwkso9IL8IEeTr4l2givF1ctoUAaIlkToUozZpq4ugUNytfEiUyEZ5Yl7ME6R2ZXV2
         1pyQ==
X-Gm-Message-State: APjAAAU16oQGnH2qPpJm9doprr6bhfvOetgU4OoqAG8rO52UA8kggKLr
        teC4tE5dNJr2c5hzfbKFcU+14Ggs
X-Google-Smtp-Source: APXvYqxE8RVJech53i7odbotcyRYc88xH0U/I+Yhu+R+5g0E8fQsUwg4UvwYpnIrnHkZAd/wBcf9Ww==
X-Received: by 2002:adf:f547:: with SMTP id j7mr15668172wrp.26.1570830352767;
        Fri, 11 Oct 2019 14:45:52 -0700 (PDT)
Received: from ?IPv6:2001:a61:3a5c:9a01:fb47:94a9:abbd:4835? ([2001:a61:3a5c:9a01:fb47:94a9:abbd:4835])
        by smtp.gmail.com with ESMTPSA id a3sm17461104wmc.3.2019.10.11.14.45.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2019 14:45:52 -0700 (PDT)
Cc:     mtk.manpages@gmail.com, linux-man@vger.kernel.org
Subject: Re: [PATCH] strptime.3: tfix
To:     Jakub Wilk <jwilk@jwilk.net>
References: <20191011202450.2067-1-jwilk@jwilk.net>
From:   "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Message-ID: <e8ada78e-093d-5de9-5b1f-03bafd6226b6@gmail.com>
Date:   Fri, 11 Oct 2019 23:45:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20191011202450.2067-1-jwilk@jwilk.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Hello Jakub,

On 10/11/19 10:24 PM, Jakub Wilk wrote:
> Escape hyphens.
> 
> Signed-off-by: Jakub Wilk <jwilk@jwilk.net>

Thanks. Applied.

Cheers,

Michael

> ---
>  man3/strptime.3 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/man3/strptime.3 b/man3/strptime.3
> index 6a82b04f4..29366339e 100644
> --- a/man3/strptime.3
> +++ b/man3/strptime.3
> @@ -142,7 +142,7 @@ to non-Americans, especially since
>  .B %d/%m/%y
>  is widely used in Europe.
>  The ISO 8601 standard format is
> -.BR %Y-%m-%d .)
> +.BR %Y\-%m\-%d .)
>  .TP
>  .B %H
>  The hour (0\(en23).
> @@ -362,7 +362,7 @@ This leads to
>  .TP
>  .B %F
>  Equivalent to
> -.BR %Y-%m-%d ,
> +.BR %Y\-%m\-%d ,
>  the ISO 8601 date format.
>  .TP
>  .B %g
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
