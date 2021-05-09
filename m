Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E333C433ED
	for <linux-man@archiver.kernel.org>; Sun,  9 May 2021 23:49:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DA40E6113E
	for <linux-man@archiver.kernel.org>; Sun,  9 May 2021 23:49:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229898AbhEIXuT (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sun, 9 May 2021 19:50:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229882AbhEIXuS (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sun, 9 May 2021 19:50:18 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CC04C061573
        for <linux-man@vger.kernel.org>; Sun,  9 May 2021 16:49:14 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id s20so8226533plr.13
        for <linux-man@vger.kernel.org>; Sun, 09 May 2021 16:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=cc:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VK+GAOfpZb2H49meLe8ZF6427EgJ1Ek38Gv4gmh7M6o=;
        b=eLUjhZl7XRxAQu0wet9Q+rP4WOyecUhWyumbcFFb3R3WtKeWlmfeWBptx8T5VqJLm9
         /CrPmuiywmAdPZ6havUXN8yGqTHy2kCnWNh82zLrNSrt/0Qo3uUQaGTPYT/7k8Gnsxo+
         Rkc+GRxy2ZpMYW8gxGYv+UHNPjD0jP3oblqME+y3a7W3qDSqBwyoLO8N6hAvrSA01HrV
         fPPPTMb93CfpIRtozRaFufbm+bOG2BLfkg1FBxe5AmWkFgRNuaQjMKkrH966tAM8Gw9T
         3Q94Ip0VNlEL6C2TWyy4RRt3N99JofPGCnZiYY/zdd7gVQUdBjxuAwnfsZRLRFvAwIMN
         9ybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:cc:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VK+GAOfpZb2H49meLe8ZF6427EgJ1Ek38Gv4gmh7M6o=;
        b=V8MW1MN3NTcP/HtZ2Ih+vBIqMMOvDZqUM0bZxU3Slj/mBYUjQe+8/vek4E5K8W5lVV
         UmhWMkXiFtAvKIhhe8NrWTK2AUbsjVxh61jDCXMmHjMb9u3YuRF2U0UPScy4EIlnnOyJ
         cRUwLc1nbcKbuu1m29DRJDYxTeQeWfc/n7PPoXexRA6YMf7IpF5pYYzr0e6n0crixNqe
         JoCGZZTtfvf2Xy+5GgWX5HXVIwPG2LrllQ+gkDf7H53mqQUC/eQQRc+aPIARg/Dr0FYT
         07B5W113NeztSL+kCxCNxjo7grvQf5o/6Vefa4Hl17E1Uvnbrzx+1ZLaM25mjhyqheji
         EA1w==
X-Gm-Message-State: AOAM530OWy2QluVsnMgKsXc/JahtEPswjCcAA+hTWHQw4gPP4eD+f208
        uaUT+N+KrQjfzKqg+X0VPkVr1U1FpcM=
X-Google-Smtp-Source: ABdhPJy1Ch3NyCRKjvieM6n0Ls0ZQ3e3OoIZaDY4yMFtyRrjZayv98yPRYnUhcSK3k4qQg2NuSFAOA==
X-Received: by 2002:a17:90a:6289:: with SMTP id d9mr24316348pjj.84.1620604153748;
        Sun, 09 May 2021 16:49:13 -0700 (PDT)
Received: from [192.168.192.21] (47-72-82-130.dsl.dyn.ihug.co.nz. [47.72.82.130])
        by smtp.gmail.com with ESMTPSA id h1sm9343335pfo.200.2021.05.09.16.49.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 May 2021 16:49:13 -0700 (PDT)
Cc:     mtk.manpages@gmail.com, linux-man@vger.kernel.org
Subject: Re: [PATCH] cpow.3: Use 'complex' after the type consistently
To:     Alejandro Colomar <alx.manpages@gmail.com>
References: <20210509213930.94120-1-alx.manpages@gmail.com>
 <20210509213930.94120-30-alx.manpages@gmail.com>
From:   "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Message-ID: <20353b65-6aed-1270-7286-20cb7ae18aaa@gmail.com>
Date:   Mon, 10 May 2021 11:49:10 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210509213930.94120-30-alx.manpages@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Hi Alex,

On 5/10/21 9:39 AM, Alejandro Colomar wrote:
> Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>

Applied.

Thanks,

Michael


> ---
>  man3/cpow.3 | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/man3/cpow.3 b/man3/cpow.3
> index 494b88f74..be93bff74 100644
> --- a/man3/cpow.3
> +++ b/man3/cpow.3
> @@ -11,10 +11,10 @@ cpow, cpowf, cpowl \- complex power function
>  .nf
>  .B #include <complex.h>
>  .PP
> -.BI "double complex cpow(double complex " x ", complex double " z ");"
> -.BI "float complex cpowf(float complex " x ", complex float " z ");"
> +.BI "double complex cpow(double complex " x ", double complex " z );
> +.BI "float complex cpowf(float complex " x ", float complex " z );
>  .BI "long double complex cpowl(long double complex " x ,
> -.BI "                          complex long double " z ");"
> +.BI "                          long double complex " z );
>  .PP
>  Link with \fI\-lm\fP.
>  .fi
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
