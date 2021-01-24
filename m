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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C25FAC433E0
	for <linux-man@archiver.kernel.org>; Sun, 24 Jan 2021 22:32:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8856322C7B
	for <linux-man@archiver.kernel.org>; Sun, 24 Jan 2021 22:32:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725969AbhAXWcA (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sun, 24 Jan 2021 17:32:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725968AbhAXWb6 (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sun, 24 Jan 2021 17:31:58 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2262EC061573
        for <linux-man@vger.kernel.org>; Sun, 24 Jan 2021 14:31:18 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id i9so2606515wmq.1
        for <linux-man@vger.kernel.org>; Sun, 24 Jan 2021 14:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=cc:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=aBDjP79Axk+yF5PXUCB0CA8MwBt5KOE7UhyDh+zJ1AA=;
        b=ay3vOQPa8NJW/Q2As9YVaMt3N17wOum/mHab8hGQdPoncXKc9sB+GdYLKZEZjZ1gOP
         +FkiLWujvSNqhuq7C+inR4rfd54OztKzPUpL3oew7C/mT+fzCwxMM7o4SMXzDta3Dfhc
         +bum3xGuudIPkX/TkBZvOBFq4822ecAU2+fm5fFp13XS9Q2xzX18HjRefbAU5eZTzFwF
         EwbfTEIXYuXEEx2x4JFl+cux/3TfhX4S+GAx7f1gFN4ipYv1qZHlvwDja2pbEizj6/IP
         2Aq1+24sOtJDyOqJymfp7CgXNSSQjNSBqEuxao7k2ePy7REil/KlHlX2PsSvmQfkl0zR
         gSMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:cc:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aBDjP79Axk+yF5PXUCB0CA8MwBt5KOE7UhyDh+zJ1AA=;
        b=auhx+kKJ2++D/ravuMJWvmMmNmnUlRUP1vzGB+hBuPl7EBe0LnTkhXEsNmR5AMaPyW
         cEwNwr0pYcsHsZFMco3NxwjKaKW5OGOafI5Idw2l0C1Iwc70V0zznfhV5fH3uJEUXjF+
         DA8St0S6O+XLKAvyezL84Pg9HWd/vObh9mIFng0UIobXtlxaKlg/7R1lhn6fV/VyJV5d
         Kdahsao05/KIoJg0Ob/idx7mHznP/3O3DPDGOV9bGX3Bcoc2/ZcyHDCjmokd/RMGo6Qu
         +I6ELsII8tQ56JntyrxKo8Fgo6h+TUL66R9J0Ss8aLIhFFUSvgs+Cd+ksF+hT7w/hMmN
         RK6A==
X-Gm-Message-State: AOAM533BRW5oQHSlKUaIOT9vhEP4hgcEuUY8hWUWTKgyzBzYVTkxJlvO
        7X2m3rYqd8EjdyMpvD+zyBk=
X-Google-Smtp-Source: ABdhPJxc0JJJSoD5zzZ00XBEeL9Sw1T7bLRDMNYIpkYUlcYoQfyESvy1aDIA3Aro6osw/1Zl+skTPA==
X-Received: by 2002:a1c:96d7:: with SMTP id y206mr144382wmd.9.1611527476924;
        Sun, 24 Jan 2021 14:31:16 -0800 (PST)
Received: from ?IPv6:2a02:2455:e0:e000:3005:efab:c884:ced0? ([2a02:2455:e0:e000:3005:efab:c884:ced0])
        by smtp.gmail.com with ESMTPSA id k6sm9491879wro.27.2021.01.24.14.31.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Jan 2021 14:31:16 -0800 (PST)
Cc:     mtk.manpages@gmail.com, linux-man@vger.kernel.org,
        Jakub Wilk <jwilk@jwilk.net>
Subject: Re: [PATCH] MAINTAINER_NOTES: tfix
To:     Alejandro Colomar <alx.manpages@gmail.com>
References: <20210124151035.70536-7-alx.manpages@gmail.com>
From:   "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Message-ID: <1c292538-dd41-6353-dece-07c058cbcadd@gmail.com>
Date:   Sun, 24 Jan 2021 23:31:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210124151035.70536-7-alx.manpages@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

On 1/24/21 4:10 PM, Alejandro Colomar wrote:
> From: Jakub Wilk <jwilk@jwilk.net>
> 
> Signed-off-by: Jakub Wilk <jwilk@jwilk.net>
> Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>
> ---
>  MAINTAINER_NOTES | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks. Patch applied.

Cheers,

Michael

> diff --git a/MAINTAINER_NOTES b/MAINTAINER_NOTES
> index 056d02774..82830df66 100644
> --- a/MAINTAINER_NOTES
> +++ b/MAINTAINER_NOTES
> @@ -8,5 +8,5 @@ tzfile(5), zdump(8), and zic(8) come from the tz project
>  (https://www.iana.org/time-zones).
>  
>  bpf-helpers(7) is autogenerated from the kernel sources using scripts.
> -See man-pagfes commit 53666f6c30451cde022f65d35a8d448f5a7132ba dir
> +See man-pages commit 53666f6c30451cde022f65d35a8d448f5a7132ba for
>  details.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
