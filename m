Return-Path: <SRS0=bNUP=45=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DA31C10DCE
	for <linux-man@archiver.kernel.org>; Thu, 12 Mar 2020 08:17:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 443D5206F1
	for <linux-man@archiver.kernel.org>; Thu, 12 Mar 2020 08:17:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OdyoXEHt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726099AbgCLIRR (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Thu, 12 Mar 2020 04:17:17 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:52303 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726044AbgCLIRQ (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Thu, 12 Mar 2020 04:17:16 -0400
Received: by mail-wm1-f65.google.com with SMTP id 11so5022582wmo.2
        for <linux-man@vger.kernel.org>; Thu, 12 Mar 2020 01:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=cc:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jHqULnOXtzu6eQqV/EPPMn/Ko20zxjL4MMm7eLLSGAg=;
        b=OdyoXEHtb1ddhTBXrLFMOj5CDehk/7QRlrCFFTHODGohMaiBlZcYqlWu5337CeNMbQ
         yXBBa+rew9ptDMl1UfzQnyJzCQdpjHYbblwzgGfd0dd/HMHGucZk0tPvqDUU1ifho96R
         /ld2neDPm7YKOhqXJntjYB0SzTh7JnmrsoWmjuh/Oud5ndB0OQ45FBqeW7z7wmgL2SVI
         N6hlyj6coSHauIKSmeOL5s8yQLZ8O36mKcb6fIDcnLdkADjHjF8+CLdCvHXSlAbH6bFN
         w7Tb+8PfPdpxzkzWCqiuYL0gsC1FnH64B1ilQ4xzWT36k+BC/E8I/lQixnmgp6uY3+ut
         saxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:cc:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jHqULnOXtzu6eQqV/EPPMn/Ko20zxjL4MMm7eLLSGAg=;
        b=CIgRxk5aAgFYs9M4n/+cQ6fM71CsvJ/9SSDW2xmr3BoRRfP4zGevQSXGCcVgoTQuqP
         X0uYXLh8/adiA3iHdZkHNtsl+6rwnc5b17R403RnOLm8hXfapTQkchg+P4t559+YcgJN
         VfJlRVG5q+W0C1l1qZ/y7YZ5AQOJ5M75RBnyqNWdhI8dasUjEFX35OehYvayNcwDnRcV
         XgBxl7seV+MEDbPUIoD7QwfrOyywmgmMCvQ+MvT3E5g++2yw/rJqvJAabyFTZJrtxN2Z
         pgpI2JFk89Enidbyv7G87W1MY+2cYdEeYjgCnnp3vnYtH/C6e6FPCqZEQj58CBR7sWuV
         0mrg==
X-Gm-Message-State: ANhLgQ1S0kck7rPJu4AKBGxdoigrwmmQdORX7p+PLdLt2ohv+GcOkCLT
        7I3RUo6C+Okrqz6fNuM9VfSWcoq0F90=
X-Google-Smtp-Source: ADFU+vuv5e0Uwo6/p8/qcSKziu3he9mCjWrJCcWtRHig42xGbSYlvfS4kbK4/UvTJDO9I6fFcFBz0g==
X-Received: by 2002:a1c:e109:: with SMTP id y9mr3438833wmg.62.1584001033557;
        Thu, 12 Mar 2020 01:17:13 -0700 (PDT)
Received: from [10.5.49.236] ([195.171.175.163])
        by smtp.gmail.com with ESMTPSA id j205sm11658072wma.42.2020.03.12.01.17.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2020 01:17:13 -0700 (PDT)
Cc:     mtk.manpages@gmail.com, linux-man@vger.kernel.org
Subject: Re: [PATCH 3/3] socket.7: tfix
To:     Jakub Wilk <jwilk@jwilk.net>
References: <20200306114104.1179-1-jwilk@jwilk.net>
 <20200306114104.1179-3-jwilk@jwilk.net>
From:   "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Message-ID: <a16678d9-2d38-35cd-c334-2fd466ad7d43@gmail.com>
Date:   Thu, 12 Mar 2020 09:17:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200306114104.1179-3-jwilk@jwilk.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

On 3/6/20 12:41 PM, Jakub Wilk wrote:
> Signed-off-by: Jakub Wilk <jwilk@jwilk.net>

Thanks, Jakub! Patch applied.

Cheers,

Michael


> ---
>  man7/socket.7 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man7/socket.7 b/man7/socket.7
> index aadbe6ab5..7f309cb8e 100644
> --- a/man7/socket.7
> +++ b/man7/socket.7
> @@ -887,7 +887,7 @@ event is returned.
>  .\" It does not affect wake up.
>  .IP
>  Background: this option was added when waking up on an error condition
> -occurred occured only via the
> +occurred only via the
>  .IR readfds
>  and
>  .IR writefds
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
