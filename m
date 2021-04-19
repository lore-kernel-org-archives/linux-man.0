Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84952C433ED
	for <linux-man@archiver.kernel.org>; Mon, 19 Apr 2021 22:17:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E78561077
	for <linux-man@archiver.kernel.org>; Mon, 19 Apr 2021 22:17:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231890AbhDSWRq (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 19 Apr 2021 18:17:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbhDSWRq (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Mon, 19 Apr 2021 18:17:46 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00229C06174A
        for <linux-man@vger.kernel.org>; Mon, 19 Apr 2021 15:17:14 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id q123-20020a1c43810000b029012c7d852459so237977wma.0
        for <linux-man@vger.kernel.org>; Mon, 19 Apr 2021 15:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qHD+7w833v3NL61ac4at9+raA6bkOPDhVX7DsJI/Hwg=;
        b=h9Xw0RTXuBM4Ex3ox2G8nLFZ7lahO/sdvoDxBG0wAmTSI0rtaCbEXRmEnN3R2nh+8v
         GAmsdSD7x/blwnOv+C2yhaHFB/Ve+k/KsevSTxnhIHRou9qrvnzlodSwNDBaEypbrjw5
         u6xQrrKuRZc3JD02ljirm+KErjjQ25UNRxL8jnkxE0xCm7Ov3dsljiTmp3dcwOHyD7pJ
         E3Z45Ewke5ZYqUEUUBwC5LaReoy4sGeFR+cfmgEPX4WQVYclXFj3hCvug3GQzXxEttRG
         7mAC4ahHRm9tJOS+gWm78KjN/KMjLt5pBfqlUbb+hr6tVFc00xTOS0YnRmK0evHrVBN6
         JUiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qHD+7w833v3NL61ac4at9+raA6bkOPDhVX7DsJI/Hwg=;
        b=bxu+1Z8udoHGsvutZDKR1B+QmUaL0nY02br8p25yX3ZV8eWG7QM8epcCtAljYhb9FW
         4zT5OKlGjFrAbq4viWd/OesCkhtzK/ziql3TD0ZWDIX8jwTd2D1CTcle4iDAKDYgfIYe
         D5vFozciehUWrzm0H9sgpqnRVoHq6op0dpcLbwVCcOkQ2oOH8KIDf4fDdQ2zqGz9rFPy
         hSq5Sd14+/3IGJDUByq1g8oiZuyXm5MwUkmla0C77yZD+U8eoZUSkyEMNB9XxMhvKd9b
         HV0XdTplp1gdxpxeYFiPRpo6dV5hH96M5M3F4vPmDmHmfvexIS5MoHpLst4Pf0Bf2XOT
         IvFw==
X-Gm-Message-State: AOAM532eG6QxT57VjeFQp/5vGJY4GEnwm5yhWU4WWgsy6e9LSMAF2Y1v
        iUgpCUKkC65U1elOBRHQBeTA9xYjE9Y=
X-Google-Smtp-Source: ABdhPJzikydOWhN+P4FMmy9hthkGspMCAJU5d7jNiD6PSD+bmnhXH6BRF/7wYriRLmMnESaV+ibFPA==
X-Received: by 2002:a1c:a78b:: with SMTP id q133mr1205600wme.68.1618870633771;
        Mon, 19 Apr 2021 15:17:13 -0700 (PDT)
Received: from [10.8.0.194] ([195.53.121.100])
        by smtp.gmail.com with ESMTPSA id w22sm1046430wmc.13.2021.04.19.15.17.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Apr 2021 15:17:13 -0700 (PDT)
Subject: Re: [PATCH] clone.2: tfix
To:     Johannes Berg <johannes@sipsolutions.net>
Cc:     Michael Kerrisk <mtk.manpages@gmail.com>, linux-man@vger.kernel.org
References: <20210419200127.158029-1-johannes@sipsolutions.net>
From:   "Alejandro Colomar (man-pages)" <alx.manpages@gmail.com>
Message-ID: <a0078a56-a086-a74d-83ba-7cb63cd7004e@gmail.com>
Date:   Tue, 20 Apr 2021 00:17:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210419200127.158029-1-johannes@sipsolutions.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Hello Johannes,

On 4/19/21 10:01 PM, Johannes Berg wrote:
> Despite my mention of this spawning a hilarious discussion
> on IRC, this alignment restriction should be 128-bit, not
> 126-bit.
> 
> Signed-off-by: Johannes Berg <johannes@sipsolutions.net>

Nice typo :)
Patch applied.

Thanks,

Alex

> ---
>   man2/clone.2 | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/clone.2 b/man2/clone.2
> index 818e584ceee1..838fbd669c57 100644
> --- a/man2/clone.2
> +++ b/man2/clone.2
> @@ -1418,7 +1418,7 @@ was an invalid.
>   .TP
>   .BR EINVAL " (AArch64 only, Linux 4.6 and earlier)"
>   .I stack
> -was not aligned to a 126-bit boundary.
> +was not aligned to a 128-bit boundary.
>   .TP
>   .B ENOMEM
>   Cannot allocate sufficient memory to allocate a task structure for the
> 


-- 
Alejandro Colomar
Linux man-pages comaintainer; https://www.kernel.org/doc/man-pages/
http://www.alejandro-colomar.es/
