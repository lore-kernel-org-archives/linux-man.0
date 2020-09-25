Return-Path: <SRS0=7aiR=DC=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 620FFC4363D
	for <linux-man@archiver.kernel.org>; Fri, 25 Sep 2020 12:02:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0FE632083B
	for <linux-man@archiver.kernel.org>; Fri, 25 Sep 2020 12:02:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KML2/Krn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728369AbgIYMCr (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Fri, 25 Sep 2020 08:02:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728366AbgIYMCr (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Fri, 25 Sep 2020 08:02:47 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E51CC0613CE
        for <linux-man@vger.kernel.org>; Fri, 25 Sep 2020 05:02:47 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id ay8so2199938edb.8
        for <linux-man@vger.kernel.org>; Fri, 25 Sep 2020 05:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=cc:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=o6Q2Wf2UXYka+K/5QiCYrWpW9sZOf3LirV5QupyzvyM=;
        b=KML2/KrnKq9erNyeBCrMjaE2YlK+UXXHq1uN0LiZge+myw/iMVxwu3z+8o2fblKzDb
         BhZFnF4KdkJHQ7wj2L9UM1Q3RINu/UDStIsdiyro20sLFdoYJJxFmhelnsOyRjLvtiCc
         V3Vly4vPgVUFdS44z35nTaW5IW25fDxzVUrvcftDc9GC+gYV3d5kTfbpBeEv4OtxTZGk
         vjwEpr3teJgueGm24OGZepk+FyGITjbptDvU4GqKBiBKYQQfjcykOuZT2VhmuUyQS1Gj
         qy5hcnqoWV03W7qb7BSzVuRkGq5TcCj0Qa0HCIifLdS8dOL/JXBWJpR44kHp3TfF/iYu
         jLcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:cc:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=o6Q2Wf2UXYka+K/5QiCYrWpW9sZOf3LirV5QupyzvyM=;
        b=bhzNzb++eCyoXc0Vl8Uk0EoHCqfNnR0uUpPmK/RgX7AQVlCL4k4DDXvwqgc3J7eX1e
         50coakAGpSeiNnqE4D5Zs67lGjV28psQ0V+/4CTSKzhRxVUZRHazt8jBKACfFB1qJTT8
         uHu5Qtr3mOp65HnBZF0/E8Ha4PUwClX/4dww7/aY5AjTiMkuGpJMQ7+SpFIIgN7GJL2a
         eVO61Fd3ubEBykcltE8+qvhYIs3PbArweIwRlPtVV3J6xVN6KheZOIyH/mrF/wfgPSbX
         Y79j3IILbCxcn2IzZiUa31cG7m2Zn/0CbUa6SxoqRjgGPkOAqWgsNqQmevUCCc/tLajl
         FhuQ==
X-Gm-Message-State: AOAM532YOCTpVw0oZSEVF/MfFofO9nIMwc5FID0X3brns3A7bNPIaIDL
        veKNpR4oBR0AyxP4DMl0iJMu5CMxGE0=
X-Google-Smtp-Source: ABdhPJyU6pmfpzQwiISB+c5PiUNh8+ysF62XbKIBbVb63phTsm74DzfudG6rMF3qugXMQ04jUMb1XQ==
X-Received: by 2002:a05:6402:b64:: with SMTP id cb4mr899256edb.25.1601035365389;
        Fri, 25 Sep 2020 05:02:45 -0700 (PDT)
Received: from ?IPv6:2001:a61:2479:6801:d8fe:4132:9f23:7e8f? ([2001:a61:2479:6801:d8fe:4132:9f23:7e8f])
        by smtp.gmail.com with ESMTPSA id p25sm1660310edm.60.2020.09.25.05.02.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2020 05:02:44 -0700 (PDT)
Cc:     mtk.manpages@gmail.com, linux-man@vger.kernel.org
Subject: Re: [PATCH v2 2/2] system_data_types.7: srcfix
To:     Alejandro Colomar <colomar.6.4.3@gmail.com>
References: <16c0890e-33c0-d052-d7ee-39385cd79299@gmail.com>
 <20200925112822.223218-1-colomar.6.4.3@gmail.com>
From:   "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Message-ID: <2a399b41-0fe7-4c38-c014-100728790f41@gmail.com>
Date:   Fri, 25 Sep 2020 14:02:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200925112822.223218-1-colomar.6.4.3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Hi Alex,

On 9/25/20 1:28 PM, Alejandro Colomar wrote:
> The contents of each type are a logic block that is indented as a block.
> They are not separate paragraphs that happen to be indented separately,
> but a set of continuous paragraphs, all in the same level,
> indented as a block from the list entry--the name of the type--.
> Therefore, it makes more sense to use block indentation, represented by
> .RS/.RE, rather than indenting each paragraph separately.
> That way it's also easier to further indent a separate paragraph inside
> a block, which happens for example in the case of float_t & double_t.
> It's simply much easier now to use .IP specifically in those cases where
> you want to indent just a single paragraph.
> 
> Also added an ending separator comment line just after the last type.
> 
> Signed-off-by: Alejandro Colomar <colomar.6.4.3@gmail.com>

Patch applied. Thanks!

> ---
> 
> Hi Michael,
> 
> 
> On 2020-09-25 12:40, Michael Kerrisk (man-pages) wrote:
>> Just to confirm: I think I'm supposed to waiting on a revised
>> version of this patch, right? (This version of the patch doesn't
>> apply in my tree.)
>>
>> Thanks,
>>
>> Michael
> 
> Right.
> 
> It was somewhat complicated to fix the commits in the middle
> and rebase and then fix breakages and rebase again and fix more commits...
> I learned a lot of git today :)

:-}. Okay -- you can probably give me lessons!

Okay -- I declare a sync-point: as far as I know, I have nothing
outstanding from you. Let me know if I missed something.

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
