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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EED2C4338F
	for <linux-man@archiver.kernel.org>; Sun,  8 Aug 2021 20:11:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4019660F35
	for <linux-man@archiver.kernel.org>; Sun,  8 Aug 2021 20:11:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230049AbhHHULv (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sun, 8 Aug 2021 16:11:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229977AbhHHULv (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sun, 8 Aug 2021 16:11:51 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85517C061760
        for <linux-man@vger.kernel.org>; Sun,  8 Aug 2021 13:11:31 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id j3so14158663plx.4
        for <linux-man@vger.kernel.org>; Sun, 08 Aug 2021 13:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=cc:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qaih8mFjlI11ItFduB8HyHYxQ2RUnv7G6KlwSolt3qs=;
        b=OKM0wM6zHZiPNRbk2q8TDCyr4HT7zCyaDvzJX+/7IRgF3R/R9QGV3iy1FQExJj+6EX
         HvZxdLZO/ctPBXXC1G739+8woauOwsVYjOksptODXDSUsai4224NM/IKWR0bChgQQSXO
         3z7JvZhNnHfZzZktYA2hWQeye9gQokHvvStVQmb5bgvLV4YVLtAdsBzOyjY1R56h3pz+
         qY7N6BrwhKVPnZQ9f2uFPZYqSHIZldttYoR1AgX+hsU+c3IVVohDr1ZkzcLcA9SLFdl8
         Aui04NtI6rTUxDrqt25/01b/+u6iAxBle0ugK9I1iwc+Zy5gqssxnBu4gRVnHPB4Whx+
         l9CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:cc:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qaih8mFjlI11ItFduB8HyHYxQ2RUnv7G6KlwSolt3qs=;
        b=ABPefuUtGMCUiNZglI0RE3fxAAZTW6cP5tLjTDNCAabMa97D44cnqLiAoh2qTELIz1
         gPWQIgYybxnYgYTlsgoeipgGkWdkrgO29aeGUnygsED7tajOAKALkGdOe+Wu2EoL84jb
         RBvIVNCEdp3I1lIcxq6TJM90BKtyvwCgjtLBTn9TW/t0dokaPveKjcFVaX5PURBcYc8b
         yY5cIfCdOvgonQUG+Wn4EhrqROEDTRi6X1AMSKy9Yp7wsVPHI3ZUHcKEGB5horyvOSd2
         M/I3NALlCu+kwFg185J2J9kCRKxZZ8lXBTN/fColYbWGGeBOSDJdO6DvRQSFBw4vTPv6
         rVng==
X-Gm-Message-State: AOAM530KKs7a/ls14hxGo8P9RUDx/kssTYSnP4ivfsDUXoNZbycnbtLd
        +w8oAr9ov3M3YkdtzcQNgKD4u8ivCzg=
X-Google-Smtp-Source: ABdhPJyBbGp9gT1HNiNZ7hXdbLjyc3UYedKP4PwT74gVTYypo7PvcSQpCariTngbevQkKOsoU63v1w==
X-Received: by 2002:a63:6ca:: with SMTP id 193mr401439pgg.265.1628453490914;
        Sun, 08 Aug 2021 13:11:30 -0700 (PDT)
Received: from [192.168.1.71] (122-61-176-117-fibre.sparkbb.co.nz. [122.61.176.117])
        by smtp.gmail.com with ESMTPSA id w2sm15475523pjq.5.2021.08.08.13.11.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Aug 2021 13:11:30 -0700 (PDT)
Cc:     mtk.manpages@gmail.com,
        =?UTF-8?B?0L3QsNCx?= <nabijaczleweli@nabijaczleweli.xyz>,
        linux-man@vger.kernel.org
Subject: Re: [PATCH 19/23] regex.3: wfix
To:     Alejandro Colomar <alx.manpages@gmail.com>
References: <20210808084133.734274-1-alx.manpages@gmail.com>
 <20210808084133.734274-20-alx.manpages@gmail.com>
From:   "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Message-ID: <6c93d914-6f65-c02d-5a8b-e78321e6044e@gmail.com>
Date:   Sun, 8 Aug 2021 22:11:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210808084133.734274-20-alx.manpages@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Hallo наб and Alex,

On 8/8/21 10:41 AM, Alejandro Colomar wrote:
> From: наб <nabijaczleweli@nabijaczleweli.xyz>
> 
> "address of regcomp() initialized buffer" ->
> "address of regcomp()-initialized buffer"
> 
> Signed-off-by: Ahelenia Ziemiańska <nabijaczleweli@nabijaczleweli.xyz>
> Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>

Thanks, applied.

Cheers,

Michael



> ---
>  man3/regex.3 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/man3/regex.3 b/man3/regex.3
> index b6a83271c..368f48d78 100644
> --- a/man3/regex.3
> +++ b/man3/regex.3
> @@ -66,8 +66,8 @@ All regular expression searching must be done via a compiled pattern
>  buffer, thus
>  .BR regexec ()
>  must always be supplied with the address of a
> -.BR regcomp ()
> -initialized pattern buffer.
> +.BR regcomp ()-initialized
> +pattern buffer.
>  .PP
>  .I cflags
>  is the
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
