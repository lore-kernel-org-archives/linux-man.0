Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C30EC388F7
	for <linux-man@archiver.kernel.org>; Fri, 13 Nov 2020 10:21:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C3A2322245
	for <linux-man@archiver.kernel.org>; Fri, 13 Nov 2020 10:21:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VAlfXz6F"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726184AbgKMKVH (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Fri, 13 Nov 2020 05:21:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726176AbgKMKVH (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Fri, 13 Nov 2020 05:21:07 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7F2FC0613D1
        for <linux-man@vger.kernel.org>; Fri, 13 Nov 2020 02:21:06 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id 19so7625831wmf.1
        for <linux-man@vger.kernel.org>; Fri, 13 Nov 2020 02:21:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fHUR/KaxNP0b1xT2eooUVLxgd5/jt6lj9xxMHEvU59Y=;
        b=VAlfXz6FuJfB5hnH0dz+VfGfpM+i4KLKF/g8+IfZgHWx3DHpVA4qlMvxzBy7dwFAEK
         Ha+53/WdxFcbraWk55ACJlEURRzLdFpfB+NARRlW292myYWmLwBzYYAciIPOeDzci57I
         rvF9ZqKiU/rx6Q9W9KxuhgNfcJFg26AlLnzALZTkz26nCrwaa67iu0y0Y1lxWsJiMgMT
         +zTpsOaUnA4/A82yphBxGkyV32stQ9+W+mf6N48d0gZ78jN9QZfie5arNnOzeLy73HS2
         9T8ugy92EfRHEjlqk+Kw9ZPnX6FzpwzJitpEAIz8rDDJK2R2GUNfqNS7zfC2vK8S/KIw
         aJ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fHUR/KaxNP0b1xT2eooUVLxgd5/jt6lj9xxMHEvU59Y=;
        b=qLza21IPS8rrYOSmrcs7iFUqNx54wB7PKvrs0w6gcSbA66F0PFNqx3jDuj09Hfnnvb
         x9n9fJCdHAwWdjISbgXxjara9yOed2kRAR/7u01poahfAsqPKhVRUVL8JP/GtPBQLfs6
         7x42C2zeLyySzHb4eLt7o+WX1A5f+pkDfas5Or3SAZ3+eg7Mqjq6PMPYK9+I0fbr3iT6
         z0o3kBDbWmZF55/MrFz5PkSglDYSjtOL1DSgUQfgLlNUgeI0QqRHmsZ7S3LS8mJg4Zot
         HXLGusln3kspdPgFV/X6/rLfoLVeFs2flpPRVo/f/pZYd5SeWrQ2d7fIwVFtFFsgIAV0
         8juw==
X-Gm-Message-State: AOAM531BmKYhm7rxKRuHRwSiWNt7TmU8wHUYVG5SABnpVmBZxyGXVf8K
        6YneR7JgGR7WB8XSSxfFgtsPsCDg25JJHQ==
X-Google-Smtp-Source: ABdhPJzImFJr97sKqwroKx+gCGUaNLjmutnxlUEs3QxdcyP4U5tON/u2ps5BpxSlAlnhDabTFnkjCA==
X-Received: by 2002:a1c:bcc1:: with SMTP id m184mr1732552wmf.132.1605262865324;
        Fri, 13 Nov 2020 02:21:05 -0800 (PST)
Received: from [192.168.1.143] ([170.253.51.130])
        by smtp.gmail.com with ESMTPSA id h15sm10314613wrw.15.2020.11.13.02.21.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2020 02:21:04 -0800 (PST)
Subject: Re: Format inline code
To:     "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>,
        "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc:     linux-man <linux-man@vger.kernel.org>
References: <f10acb37-f929-c1fd-9827-c33aaf2955a1@gmail.com>
 <20201106093845.12897-1-colomar.6.4.3@gmail.com>
 <3f041e44-c5c7-f17a-9e99-125eeb6ccb0c@gmail.com>
 <387259c5-3051-8058-e99c-b17873fe7187@gmail.com>
 <CAKgNAkjsnu9+rxdLgZ5VzYxjFf_c1Ed0JUQ8=KHkK6Qw9X4B-Q@mail.gmail.com>
 <bb5f3aad-d766-fb9e-e77a-09009fb7b599@gmail.com>
 <20201113082759.vqeufvucqg3agdhh@localhost.localdomain>
 <0323a942-1d12-9378-bdc0-8690adc1aaee@gmail.com>
From:   Alejandro Colomar <colomar.6.4.3@gmail.com>
Message-ID: <4f2a13f8-4237-9252-e64c-aa61d7394f78@gmail.com>
Date:   Fri, 13 Nov 2020 11:21:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <0323a942-1d12-9378-bdc0-8690adc1aaee@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org



On 11/13/20 10:00 AM, Michael Kerrisk (man-pages) wrote:
[...]
> But in the "-branden" version I see
> 
> [[
> .RS 6n
> ]]
> 
> If I understand correctly, then that number is calculated based on the
> ".IP * 2" that precedes it. That doesn't seem good (since, maybe at 
> some point, one might want to change the .IP yo say ".IP  1) 3",
> and then one has to fix the .RS lines. Am I missing something?

Hi Branden,

I agree with Michael:
The number by which we indent the code should be 4 always,
and the code needed for that
should be independent of surrounding code.
.RS 6 is 2 + 4 because you're adding the 2 of the .IP.
I don't like it.

I think there's no consistent solution using .RS.

Thanks,

Alex
