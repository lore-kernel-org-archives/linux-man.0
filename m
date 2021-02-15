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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DEA0C433DB
	for <linux-man@archiver.kernel.org>; Mon, 15 Feb 2021 19:48:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 64E2B64E08
	for <linux-man@archiver.kernel.org>; Mon, 15 Feb 2021 19:48:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229919AbhBOTsn (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 15 Feb 2021 14:48:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229866AbhBOTsn (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Mon, 15 Feb 2021 14:48:43 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16F64C061574
        for <linux-man@vger.kernel.org>; Mon, 15 Feb 2021 11:48:03 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id o10so4754745wmc.1
        for <linux-man@vger.kernel.org>; Mon, 15 Feb 2021 11:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=cc:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4kL8f4uE19LsjBDIEqCvtZz2KMa8SZdiVxuAwaACDUI=;
        b=O6uUP2ymFNIug1Y5MmZmPuQxmEGPANrty3xHiN/5y/3lH7tYWm2aPczDVyt0Sz+/E8
         pN98t4uE3wHRKKIffCjCPPx0Od3FjPBr5u+iq1fIYNIVykCAHvl1AuAk1tWWbH5fb2AF
         i+Uds/1ES5XV9n2YdsJsrMQiQIKfXNPz3XkVkrg22uz+rHwSq9LDfgawLj5KHCsdkC20
         LzxlB5co467OwJUfDj1UL5rwRknMTbr4a7RP/X/r5kZaT1KxAgQN9bRWq3xIyVYbsmeR
         BDKHVAq9InGTuWXFxB7ytkcVAu8VP8FxaX9CRCKBGgzSoQyXY2s5+1s0XJFcB2oADcCL
         BqVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:cc:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4kL8f4uE19LsjBDIEqCvtZz2KMa8SZdiVxuAwaACDUI=;
        b=WIgFWZOXNVl6Qc/xcMUsmO6Cl40KJdaAP5oaxUgLV4PZFKKVWRNj3G3AEW6jX8V9xF
         Fn4YsUGB87bfofHcLt56FHYB+mhY2iMrPlLdpUu55NglTJCVrdMfrNOESwRFpdWpLKx8
         DWMWdVC2v5gSRB0AwQPsUo/fj3Hbse8PItJHtaC9Z5uNe/+jzpPbl8qu2V7TrrESSQGf
         fjDYZBhg0+csBaLxqc7IB97YQSygKDfVw9rTpushcSv/bk1MhMWuYPRk0dlf/8ay3yal
         Dhbe1N2Q1IUPlRUhxH6BDb/IUfRTjQz3wv6szdrVsD7/6YWgIMEdyysGKY4lPm3sBCrn
         07Dw==
X-Gm-Message-State: AOAM533gNgXzsSQKcNdgp1P9sXulE0Yetla7FcSMXGFrA/UzU13kvvNf
        S5H3b7g0WeJ06uaDLw8viYhjUDK8xDnejA==
X-Google-Smtp-Source: ABdhPJx0/axDSOLqa993GarUXzm6CIefbPvD+o+SQYlg9qxQBIa85R3wzbi6I+6g2Rq4RmOVVEkN5g==
X-Received: by 2002:a05:600c:21d2:: with SMTP id x18mr376113wmj.186.1613418481652;
        Mon, 15 Feb 2021 11:48:01 -0800 (PST)
Received: from ?IPv6:2001:a61:3a2d:1d01:e14:1e8b:dca4:7d73? ([2001:a61:3a2d:1d01:e14:1e8b:dca4:7d73])
        by smtp.gmail.com with ESMTPSA id b75sm457449wmd.10.2021.02.15.11.48.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Feb 2021 11:48:01 -0800 (PST)
Cc:     mtk.manpages@gmail.com, linux-man@vger.kernel.org
Subject: Re: [PATCH] execve.2: spfix
To:     Jakub Wilk <jwilk@jwilk.net>
References: <20210215134658.3581-1-jwilk@jwilk.net>
From:   "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Message-ID: <ea29fabc-e5b2-9908-9839-1db83c990b65@gmail.com>
Date:   Mon, 15 Feb 2021 20:47:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210215134658.3581-1-jwilk@jwilk.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Hi Jakub,

On 2/15/21 2:46 PM, Jakub Wilk wrote:
> "Mibibytes" is a misspelling of "mebibytes",
> but let's use more familiar "MiB" instead.

Thanks. Patch applied.

Cheers,

Michael

> Signed-off-by: Jakub Wilk <jwilk@jwilk.net>
> ---
>  man2/execve.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/execve.2 b/man2/execve.2
> index 639e3b4b9..027a0efd2 100644
> --- a/man2/execve.2
> +++ b/man2/execve.2
> @@ -424,7 +424,7 @@ ensures that the new program always has some stack space.)
>  Additionally, the total size is limited to 3/4 of the value
>  of the kernel constant
>  .B _STK_LIM
> -(8 Mibibytes).
> +(8 MiB).
>  Since Linux 2.6.25,
>  the kernel also places a floor of 32 pages on this size limit,
>  so that, even when
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
