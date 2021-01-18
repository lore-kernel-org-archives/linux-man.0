Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52363C433E0
	for <linux-man@archiver.kernel.org>; Mon, 18 Jan 2021 15:51:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 191E122AAA
	for <linux-man@archiver.kernel.org>; Mon, 18 Jan 2021 15:51:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406007AbhARPvF (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 18 Jan 2021 10:51:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405973AbhARPvC (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Mon, 18 Jan 2021 10:51:02 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DCD4C061574
        for <linux-man@vger.kernel.org>; Mon, 18 Jan 2021 07:50:22 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id y187so14214038wmd.3
        for <linux-man@vger.kernel.org>; Mon, 18 Jan 2021 07:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=StxFtUL60oHIz8LJ2xm/Dkgar87Emx5fy6AgVv8zqY4=;
        b=tSRp9dVgfJTnAD8DoDX2HuKxq7sc0ws9jNBK/xVIJGF3iR1JGOYms0yiAfuromEZmq
         5k3MY50kr+jP33kJpEBINaWnQMDZ4bpTCwtPwrW3eifAhpFJ+xoIFCf9WItriLhtsSUW
         jy+f6h0L8f6B6jixNcXoNOYcOz5UUakU3ATWEWjYekNSq5jpueWwjmHSJ7n2ah81XEWR
         AxnxCkGGrrv1VDMFxNIqe6RG49oGhjBOP/ZRzQ/Kcq8vMsl4mILcKzNtPb4yWVyPjMtB
         od1sUaUjZmw2xsDwb6aCiGhgf/05/rott6GMwK9+sUaozngEVWtlYgOobxP6LWsL2I+X
         SadA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=StxFtUL60oHIz8LJ2xm/Dkgar87Emx5fy6AgVv8zqY4=;
        b=ZTBhX0hQjvRIrrJwRbAq1daKBnv/oiJOLAKfytin1U1FEWinWfC412bCpbIvYiOMZx
         0OSDUM6CiTO3sgswJPF4nhSUjUeZSLnywkQP6yNynsKiLOWYkSkR1x6+rPnd6LBeWKZN
         +oVSafvz6ho1y5yMgfybiSZH1sKxBSMf/vLzv1r0wjqHFB00t6+sw+NiDAZPdAvKt7Io
         uH8VnVplMAUEN/CoMqv6juZouW1bF1zDx/pLbODgmDcO8yXDpmwe60O9mpXjCO8joJIH
         jP2pJTsnukKLqTwOOSStYQc8O/gRQmhOdQMkBwnaCPHdJsEysu8qaMgyP/5yjo+xaWhU
         lwgQ==
X-Gm-Message-State: AOAM530CV/mvmzdloVBaz9w2vKo/xA2AiCxDl0nLRZDFTLXckWTWtIiT
        8CSCznhTEMO1S3HyVK/yKsHo1/qa4bM=
X-Google-Smtp-Source: ABdhPJwNjuN/3FrMM6RUvHJOx7GP5sVd3VfSg2Oe39KhZRxIHRTJGIWpTdJOtQEZpvO5++5ygGS05Q==
X-Received: by 2002:a1c:998a:: with SMTP id b132mr40760wme.40.1610985020852;
        Mon, 18 Jan 2021 07:50:20 -0800 (PST)
Received: from [192.168.1.143] ([170.253.51.130])
        by smtp.gmail.com with UTF8SMTPSA id x7sm25705102wmi.11.2021.01.18.07.50.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jan 2021 07:50:20 -0800 (PST)
Subject: Re: [PATCH 1/2] cacheflush.2: tfix
To:     "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>,
        Jakub Wilk <jwilk@jwilk.net>
Cc:     linux-man@vger.kernel.org
References: <20210118090811.6495-1-jwilk@jwilk.net>
 <30f96038-c892-2f3a-a6fa-ae1a9ceffcdd@gmail.com>
From:   "Alejandro Colomar (man-pages)" <alx.manpages@gmail.com>
Message-ID: <405ec319-8226-4f93-2237-0a886dd16210@gmail.com>
Date:   Mon, 18 Jan 2021 16:50:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:84.0) Gecko/20100101
 Thunderbird/84.0
MIME-Version: 1.0
In-Reply-To: <30f96038-c892-2f3a-a6fa-ae1a9ceffcdd@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

On 1/18/21 4:45 PM, Michael Kerrisk (man-pages) wrote:
> On 1/18/21 10:08 AM, Jakub Wilk wrote:
>> Signed-off-by: Jakub Wilk <jwilk@jwilk.net>
> 
> Alex, you grabbed the 2/2. What about this 1/2?

Hi Michael,

I didn't receive it.
Maybe there's some lag in vger.
You can apply it yourself, as they seem to be independent.


Thanks,

Alex

> 
> Thanks,
> 
> Michael
> 
>> ---
>>  man2/cacheflush.2 | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/man2/cacheflush.2 b/man2/cacheflush.2
>> index 12be4c94a..44fc064a8 100644
>> --- a/man2/cacheflush.2
>> +++ b/man2/cacheflush.2
>> @@ -27,7 +27,7 @@
>>  cacheflush \- flush contents of instruction and/or data cache
>>  .SH SYNOPSIS
>>  .nf
>> -.B #inlcude <sys/cachectl.h>
>> +.B #include <sys/cachectl.h>
>>  .PP
>>  .BI "int cacheflush(void *" addr ", int "nbytes ", int "cache );
>>  .fi
>>
> 
> 


-- 
Alejandro Colomar
Linux man-pages comaintainer; https://www.kernel.org/doc/man-pages/
http://www.alejandro-colomar.es/
