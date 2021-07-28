Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C421C4338F
	for <linux-man@archiver.kernel.org>; Wed, 28 Jul 2021 20:22:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1D23F60F12
	for <linux-man@archiver.kernel.org>; Wed, 28 Jul 2021 20:22:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231158AbhG1UWL (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Wed, 28 Jul 2021 16:22:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231539AbhG1UWL (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Wed, 28 Jul 2021 16:22:11 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07633C061757
        for <linux-man@vger.kernel.org>; Wed, 28 Jul 2021 13:22:09 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id e2so4027393wrq.6
        for <linux-man@vger.kernel.org>; Wed, 28 Jul 2021 13:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=eHW/q7KaVYcGdNY2FUkQ1lAgr1SCvK57BZ9568zq7kA=;
        b=Oc+vxf2X/m3wZkj9LBJnWl+uOx2npZ5UddZeb2aa/fmo328e8tP8E+Ggql1QT249ZX
         OCOQxSut0YHXBInZAlpyjxMIYfsvk3j61WbzX1+BWEqTnQY/5KNyZsW5l5JWQ/orf+wi
         r44zM+5oROsjFTY6wpY+GohLNH2v8GXKAGllwPusJGMBxtkLZnnSJ8H47KOmBIEnr0Th
         h9L6AymZk8cYbSoSb6L63wBkXprXOG7wZxIBPIONvu3CIP+hYexkjZO+wfLhgqyXHYjv
         dybypYjVEeDw3DZ4Sl0Jkr4JmMXSI81HFYJ5uZGCZfxeEaA4RmtGFbdc4+rltaK6lJ13
         cJFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eHW/q7KaVYcGdNY2FUkQ1lAgr1SCvK57BZ9568zq7kA=;
        b=qTRqxgZGIuCS7tC9zzu+lgO0q/mx3lNkLqKjazA9SWj1DhyZGDx5ZYEBisvb9RRmEu
         s2tU43+zQtUmFgA+sUJLmkmx82PnhPtvx1A8YnGcNeDLyq1nATm9mgz2rxOIFJ0ffjCq
         jjFnqMaqEqfP9NomdUhTlGWuwifH9Ys8DoZdMHluIUd68wRlklLiX4h7p0BlpR1RnDw+
         nPV9A44wZojKuucbulYS6eCy34rSUUdVinjxkS17ETEMtSJm6EjkzyC2ps8FhkADgmCI
         6aHvz/wx+bkrywR4JThlkR0XQgM9JcY8rERkB10PjboWyFl6AyQzWQV2uuZ3ujm3EZra
         jQgA==
X-Gm-Message-State: AOAM533C4Z1UkEy81UY0gW0tE6M+u/wHQeb4ICD1EyyJbAFADiuq3FJf
        JOAa4j2Qu8z4C6eFJ4pKxlgI2b7fGd0=
X-Google-Smtp-Source: ABdhPJxuQvgRhRZyNuYJyF9PfP3GX1hQEd8N/DtKtC3o5wYjnhjVWrF0JxUKBvKAFnWOZ73I8ba0MQ==
X-Received: by 2002:a05:6000:110:: with SMTP id o16mr1153228wrx.2.1627503727711;
        Wed, 28 Jul 2021 13:22:07 -0700 (PDT)
Received: from [10.8.0.150] ([195.53.121.100])
        by smtp.gmail.com with ESMTPSA id u2sm7570659wmm.37.2021.07.28.13.22.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jul 2021 13:22:07 -0700 (PDT)
Subject: Re: [PATCH] tkill.2: tfix
To:     Sagar Patel <sagarmp@cs.unc.edu>
Cc:     linux-man@vger.kernel.org
References: <20210724045855.82231-1-sagarmp@cs.unc.edu>
 <92994df0-fec0-3e5b-74ea-14a7d4a31411@gmail.com>
 <CAMGmevCXTOx+WgnJAzob8TVP5_Zi=T0W9=jcJSWQzAjRsendXA@mail.gmail.com>
From:   "Alejandro Colomar (man-pages)" <alx.manpages@gmail.com>
Message-ID: <5dfa520b-feab-6b80-8d58-5751bc7d0a03@gmail.com>
Date:   Wed, 28 Jul 2021 22:22:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAMGmevCXTOx+WgnJAzob8TVP5_Zi=T0W9=jcJSWQzAjRsendXA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Hi Sagar.

On 7/28/21 6:20 PM, Sagar Patel wrote:
> Thank you, Alex!

:)

> 
>> Oops, my bad!  Patch applied.
> 
> If you don't mind me asking, where has the patch been applied? I don't
> see it on the kernel.org repo [1].

Sure, I don't yet have a kernel account, so my tree is on github: 
<https://github.com/alejandro-colomar/man-pages>.

I forwarded it right now in a patch set to Michael's tree (the one in 
kernel.org).

Cheers,

Alex

> 
> [1]: https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/
> 
> —Sagar Patel
> 


-- 
Alejandro Colomar
Linux man-pages comaintainer; https://www.kernel.org/doc/man-pages/
http://www.alejandro-colomar.es/
