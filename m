Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD447C433E0
	for <linux-man@archiver.kernel.org>; Wed, 10 Feb 2021 15:53:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 92D0164E85
	for <linux-man@archiver.kernel.org>; Wed, 10 Feb 2021 15:53:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229789AbhBJPxx (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Wed, 10 Feb 2021 10:53:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230005AbhBJPxv (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Wed, 10 Feb 2021 10:53:51 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E566C061574
        for <linux-man@vger.kernel.org>; Wed, 10 Feb 2021 07:53:11 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id g10so3172536wrx.1
        for <linux-man@vger.kernel.org>; Wed, 10 Feb 2021 07:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0fYmy7QhJPCyaE6NUF5p8Wm+pV5NZE0u4K2zczkhlaA=;
        b=Ca/l0X0BuQDxpNdecC79ZO7n97p1oFJY/X6cmpJ4dV4n5/GqMWMgjfQKMGwPBKnJrt
         je/IZQU+3CCvHbqoZHnUv5vjJoHmFKYqvGcy2KlXaDzAYXtZDUqTrfOg8RsrwkOOybs2
         HA3m1Ju7QEF4rp9ouulkTvb9VU22c33/eBftVkHLq2rrLiu/WawKhx3zxviu0myapUDf
         bWhoTEBZQlO4AK239F6jHU0W6SAIVWmkcOgOzoJFUcizcAcNbxZPhDN9ECpQCFZ2sSJz
         K/Up9ykapCcF6PypuOz7NaPZD6P0fVbfKfFSx42o/sl6vFEIzMNG5MGdVGBSO1hAyEJs
         KKvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0fYmy7QhJPCyaE6NUF5p8Wm+pV5NZE0u4K2zczkhlaA=;
        b=KxAFTS6yWjVtk3+CtuTt3M6vXs4PGR6sYZGzxXCaB0Spaclojo0fT4+tQVDQWmmijk
         2XWKGh335Q15FsdeaVlPEXWGs82Xz/gaznr6A9zAijx+GACiHySsWWhdkG42odXpZ6CB
         yFFc+5uqbqbiSE9zK7DH/XW2t4R1c17BF3JEN13SmQXxinD7ySqeOMVTQQR5PPUcR3kz
         f4R4vOY+ng0tNFlDAJH/j0c1MGvxTNW4EfC+KFwAckWsdT6AJIDDkU67JY0/Ps+pVc4c
         /OIIv2NEI60q+UvgSxtHUcHWv+Yq+PsPsFs5N0DfrmRMpWeZml7lgI2e3tTVPkeCDXNH
         R9nA==
X-Gm-Message-State: AOAM532zu4Z0LRRCCZGxooKh1qsGU5ylINYwKU7ZKpY4OUjLwzJE5uFY
        aYArYA317Nb6KZH5bi+3NlE=
X-Google-Smtp-Source: ABdhPJwEuz/9mqLYC2j7TfXL8GyuaYWE0sQyqmFDoSbYmplDbm8tZm3jROwVrTai7shtESAGUvW+4g==
X-Received: by 2002:adf:cd88:: with SMTP id q8mr3990973wrj.3.1612972389835;
        Wed, 10 Feb 2021 07:53:09 -0800 (PST)
Received: from [192.168.1.143] ([170.253.51.130])
        by smtp.gmail.com with UTF8SMTPSA id s6sm2905773wmh.2.2021.02.10.07.53.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Feb 2021 07:53:09 -0800 (PST)
Subject: Re: queue.7, stailq.3, (simpleq.3): Document SIMPLEQ as an alias of
 STAILQ
To:     Zack Weinberg <zackw@panix.com>
Cc:     "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>,
        linux-man <linux-man@vger.kernel.org>,
        "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
References: <f03cd3b3-8a47-3ec1-2d17-2760545c7b62@gmail.com>
 <17824adc-1b73-cae4-781a-6ad8893c3c66@gmail.com>
 <864a2689-0c9a-40c9-3732-d99bc44fed4d@gmail.com>
 <CAKCAbMgpXzH3nFyyn3fO3rjwNsG1ZBEkK89ce6r1JLPQL9oKZA@mail.gmail.com>
From:   "Alejandro Colomar (man-pages)" <alx.manpages@gmail.com>
Message-ID: <57071c04-e340-96d1-f21c-8e6f9691b351@gmail.com>
Date:   Wed, 10 Feb 2021 16:53:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:84.0) Gecko/20100101
 Thunderbird/84.0
MIME-Version: 1.0
In-Reply-To: <CAKCAbMgpXzH3nFyyn3fO3rjwNsG1ZBEkK89ce6r1JLPQL9oKZA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

On 2/10/21 4:38 PM, Zack Weinberg wrote:
> On Wed, Feb 10, 2021 at 10:13 AM Alejandro Colomar (man-pages) via
> Libc-alpha <libc-alpha@sourceware.org> wrote:
>>> BTW, a suggestion for glibc:  glibc could simplify the code with things like
>>>
>>> #define SIMPLEQ_ENTRY(type) STAILQ(type)
>> s/STAILQ/&_ENTRY/
>>>
>>> It would make it more obvious that they're the same thing.
> 
> I don't know about anyone else on the glibc team, but I personally
> consider the entirety of <sys/queue.h> to be provided only for some
> degree of backward compatibility with old applications that were
> ported from BSD; new code should not use it.  I'd *like* to formally
> deprecate it, but I expect that would cause too much breakage to be
> viable.  Anyway, I hope you can understand why I'm not interested in
> messing with its contents at all.
> 
> (Can we add a statement to the effect that new code should not use
> <sys/queue.h> to all of the related manpages, please?)
> 
> zw
> 

Hi Zack,

Would you mind explaining your reasons for the deprecation?  Performance?

What functions/macros should be used instead of the queue.h macros?

Thanks,

Alex

-- 
Alejandro Colomar
Linux man-pages comaintainer; https://www.kernel.org/doc/man-pages/
http://www.alejandro-colomar.es/
