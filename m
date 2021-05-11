Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAD70C433B4
	for <linux-man@archiver.kernel.org>; Tue, 11 May 2021 09:47:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A53F361925
	for <linux-man@archiver.kernel.org>; Tue, 11 May 2021 09:47:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231131AbhEKJs6 (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Tue, 11 May 2021 05:48:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230434AbhEKJs5 (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Tue, 11 May 2021 05:48:57 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F69BC061574
        for <linux-man@vger.kernel.org>; Tue, 11 May 2021 02:47:50 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id v12so19440240wrq.6
        for <linux-man@vger.kernel.org>; Tue, 11 May 2021 02:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5XVM/OZL87iCcqjbLCuAJdjz1MO4GpWHnWcF+BZdS0g=;
        b=gzhCx6uBac3YE/K1K9A+j+b0h6/Jku1/O6h1LV6OC0tNGchtL8XSSBvECDQupxWJIJ
         /8SqIoEQzp7ZfPLuJPUgy4yfdB+bvxv8jcqjSoA4jYaPP0xBp+mUmQobRnTRbKAj7oJg
         sOxgTClK5VufE/mAXMvyorw/uJNgAUpphbp6cRq/X7u+h4lVNlOAtpUMA7TVBtqrJY/t
         kzXqGfJk1YDAEza3KovTBOhhaRckqqEhwUUhQjpxNY6WmN/M75ngK0HJkxSJ0O6ropdR
         63NFZQzH6ztJIlbAj4dudHvQZlqWHe6ID5aV56EwR4bDH6qXVx4egTnxZFCtK2fyhIee
         HEwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5XVM/OZL87iCcqjbLCuAJdjz1MO4GpWHnWcF+BZdS0g=;
        b=tvnlqqATa+q8rm1z+La4JdvCwppgG31v6YCfls7Kso/GRF7GUEwRly18mZkChUHA+A
         ute1ANq3d0n/Uu+4meo88Kbch9oYHjH32/1I5OMksxak9GoLFC8PB09pK/eQYQamxGRo
         Km3VtSAzl+Rlq56YRReka0Ih35SecW4qMrZOpqzqS2Qc1lXJ3K7mALC1rrXX1u45A7hu
         hr4x5+gIKpWCPRFpjKd4vqbRyeQ8WyBz9iH1+6BerfqHmIeXYIhZL9VBKfOk44T0ytfI
         r9uJEC2NZ7hbD73u3eBlGopKH4y4/h+CFbByx7hkosXE01K32iHOSFHPzMB7h3dayd3h
         CcVQ==
X-Gm-Message-State: AOAM533HPB0QIMclNVg41IP4VI3vSC+9NIWqicfQlhLN0+nw+pDxq00e
        n+P2EmX9b/y5CKOaIncS5KLvhg+WpHo=
X-Google-Smtp-Source: ABdhPJzNSKzqeS2uHaHPC6M9Tu7inYi3pWk4Q5qzSe32ndj0AHGhUkJTrUXVD7/feqL+JMEnOMSj3A==
X-Received: by 2002:a05:6000:1868:: with SMTP id d8mr36383286wri.74.1620726469446;
        Tue, 11 May 2021 02:47:49 -0700 (PDT)
Received: from [192.168.43.70] ([46.222.232.120])
        by smtp.gmail.com with ESMTPSA id g25sm3114940wmk.43.2021.05.11.02.47.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 May 2021 02:47:49 -0700 (PDT)
Subject: Re: [PATCH 4/5] sigvec.3: tfix
To:     Akihiro Motoki <amotoki@gmail.com>
Cc:     mtk.manpages@gmail.com, linux-man@vger.kernel.org
References: <20210511093046.98430-1-amotoki@gmail.com>
From:   "Alejandro Colomar (man-pages)" <alx.manpages@gmail.com>
Message-ID: <2569ea48-1603-f050-71c0-b78713f971de@gmail.com>
Date:   Tue, 11 May 2021 11:47:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210511093046.98430-1-amotoki@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Hi Akihiro,

On 5/11/21 11:30 AM, Akihiro Motoki wrote:
> Signed-off-by: Akihiro Motoki <amotoki@gmail.com>


Patch applied.

Thanks,

Alex

> ---
>   man3/sigvec.3 | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man3/sigvec.3 b/man3/sigvec.3
> index f7ca776ed..b6644393b 100644
> --- a/man3/sigvec.3
> +++ b/man3/sigvec.3
> @@ -135,7 +135,7 @@ This field may contain zero or more of the following flags:
>   .TP
>   .B SV_INTERRUPT
>   If the signal handler interrupts a blocking system call,
> -then upon return from the handler the system call s not be restarted:
> +then upon return from the handler the system call is not restarted:
>   instead it fails with the error
>   .BR EINTR .
>   If this flag is not specified, then system calls are restarted
> 


-- 
Alejandro Colomar
Linux man-pages comaintainer; https://www.kernel.org/doc/man-pages/
Senior SW Engineer; http://www.alejandro-colomar.es/
