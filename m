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
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD324C433ED
	for <linux-man@archiver.kernel.org>; Wed, 14 Apr 2021 19:51:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7D16761132
	for <linux-man@archiver.kernel.org>; Wed, 14 Apr 2021 19:51:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238322AbhDNTwL (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Wed, 14 Apr 2021 15:52:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234955AbhDNTwH (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Wed, 14 Apr 2021 15:52:07 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E43EC061574
        for <linux-man@vger.kernel.org>; Wed, 14 Apr 2021 12:51:45 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id a4so21017301wrr.2
        for <linux-man@vger.kernel.org>; Wed, 14 Apr 2021 12:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KVcofknTELEABjqCnd/BNhjMP1Hg1oOmCiu4ds2YFGs=;
        b=ULiJc6I230muaEcJ4HV+hqllOknsQOWftUQ3WfvxQZ7eAda1B/FBmC6Hc7/3oPtsGX
         QwlHb3Nds3oUcsOtex3ZdLvFTJc/W8wsx4TJ+5sDed8WcbYY6hFycWbz06JI9WOw9e0u
         DLr4I5Qn/a/Fe4AtlFVIIFodhxCk+1J4hzX1Jh42f2d6V0MY7beShtgPfJBQNltBpzFe
         HzisFbZfOgtwwNbo6jkbbOs7aXZB+VrBTgXJb1fW65EAFUKnWd/eFPFHl9+XOKsW8EbF
         2sb+vANqcRApgtSfqtnKmqa0YcGQ7Mx8CJYnZvg9SQ3YX/G50QwCJfqCx3A8eWeE0HVx
         kbrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KVcofknTELEABjqCnd/BNhjMP1Hg1oOmCiu4ds2YFGs=;
        b=UR2//FUAN+X/ETN8/IvUb5lOFwyTYgwaSAqzWzbasGDP0S+wUERGjbQDY1C192BgOS
         /FMTgY6bo2OISpE5yF9x1c9TsliWrqOBH+nuva9j9GSxiBu7rt0HBbFNCAL4KK5IbEw8
         7iww1BKKgGS8Fmhbz5WS6XCYb6YcJr2cmi9mbT2B6ORZW5A9gIqZ8L7AnXYZ7MNsu5J8
         eqHVTeEr2+Cx4YeUqQHCC8LXRZXPLGxIy7+znApm+T5Uq6wDsB1YR7JKnlS1NJS3MUa0
         Oc+GARbMDCerYoWnvqvhuaGz7HJ1BKMmtnuX7Gpugra9oYIr95BFyWleIIXsyKZp9LBs
         Ly9Q==
X-Gm-Message-State: AOAM5322HKNGeppfz1B1gp6e9mgxRwPKRhn/Dly5n7rPdfy1E4gBi8GA
        iCo1nsNFDa8vLqPLFBDHNZA7V7Cjrds=
X-Google-Smtp-Source: ABdhPJxHHiG9M52lOFLjdPxpB8RO5X2K7XSZx6bc0p1EfeDd9R3qlL2Mp/mqUB1qAhFnD3b88svxrA==
X-Received: by 2002:adf:f944:: with SMTP id q4mr40595183wrr.281.1618429903960;
        Wed, 14 Apr 2021 12:51:43 -0700 (PDT)
Received: from [10.8.0.194] ([195.53.121.100])
        by smtp.gmail.com with ESMTPSA id k11sm312548wmj.1.2021.04.14.12.51.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Apr 2021 12:51:43 -0700 (PDT)
Subject: Re: [PATCH] sigaltstack.2: tfix
To:     Borislav Petkov <bp@alien8.de>
Cc:     Michael Kerrisk <mtk.manpages@gmail.com>, linux-man@vger.kernel.org
References: <20210414121630.16201-1-bp@alien8.de>
From:   "Alejandro Colomar (man-pages)" <alx.manpages@gmail.com>
Message-ID: <c5b41732-6df8-8cd6-7779-91a9b4b8f938@gmail.com>
Date:   Wed, 14 Apr 2021 21:51:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210414121630.16201-1-bp@alien8.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Hello Borislav,

On 4/14/21 2:16 PM, Borislav Petkov wrote:
> From: Borislav Petkov <bp@suse.de>
> 
> Add a missing "to" in an "in order to" formulation.
> 
> Signed-off-by: Borislav Petkov <bp@suse.de>

Patch applied.

Thanks,

Alex

> ---
>   man2/sigaltstack.2 | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/sigaltstack.2 b/man2/sigaltstack.2
> index c8d5c184f3ab..53268ccbea96 100644
> --- a/man2/sigaltstack.2
> +++ b/man2/sigaltstack.2
> @@ -111,7 +111,7 @@ Clear the alternate signal stack settings on entry to the signal handler.
>   When the signal handler returns,
>   the previous alternate signal stack settings are restored.
>   .IP
> -This flag was added in order make it safe
> +This flag was added in order to make it safe
>   to switch away from the signal handler with
>   .BR swapcontext (3).
>   Without this flag, a subsequently handled signal will corrupt
> 


-- 
Alejandro Colomar
Linux man-pages comaintainer; https://www.kernel.org/doc/man-pages/
http://www.alejandro-colomar.es/
