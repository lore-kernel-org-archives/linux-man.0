Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40DAEC433E0
	for <linux-man@archiver.kernel.org>; Wed, 30 Dec 2020 23:21:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1410F207A9
	for <linux-man@archiver.kernel.org>; Wed, 30 Dec 2020 23:21:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726290AbgL3XVJ (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Wed, 30 Dec 2020 18:21:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726277AbgL3XVJ (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Wed, 30 Dec 2020 18:21:09 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F7A4C061573
        for <linux-man@vger.kernel.org>; Wed, 30 Dec 2020 15:20:28 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id e25so6034860wme.0
        for <linux-man@vger.kernel.org>; Wed, 30 Dec 2020 15:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PZDf5OeZmC0TResQ0vU4cpEOeXeYZdBC6t+TsUTs7cw=;
        b=MbIzp2lfv3Tmbsftnx3r9Ow0CVe/XsPPulrO3xbn4KzuNKHZU+1G6cQpWoiGnskt3U
         DDirNSF6X+Dbtil9x9IuFVTd99xnHAYmxweJSQBEL7v6aITAHDZb+MHOkHVOU7deNRhB
         RPvU4eQpq+HaxunqHD0hKt3tzNCiyhiM6uwnr3uxXLcOEjq8oUOHU10DJ+cToGQk0lZN
         +PuidiJ6zkvLu389K4BNeCcm8V93WOA5gW+GfWATkPV67S9FmeSWZei6YhnWbgu0ng8h
         lwgo5iFOZUzlcTpbSM5Jn2rPB0Jm6PCUnPbmbFBlQpwvj+QGiy/PMM1M5mnX7Lqi7svK
         ZfFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PZDf5OeZmC0TResQ0vU4cpEOeXeYZdBC6t+TsUTs7cw=;
        b=BvYCiYVwpsjWqC/Cwz2e/94VFJ8baSXRr+2z3Jr+85QRH8wxClCZqHniqPHoMm1zRd
         iiZx+ioa0V+yVNw5yqMml+Nj5SCnVvKGZzgIDwaz+1AogkQfmVvzcgmsSq+U9kTm5vL9
         WgUvMBSeSSlAw0etyu8lSWYeDPEsm148o90MnEShu2ifb62QkIUwRkCznGm6Twu5hDxp
         ENFQHsUGJ0CMnOlw8XkEcX4Ua6yrXYFR1uGaC+WbrDMWgARbhSrD+9oTlnMoBW4uJiTv
         dPWzqGET7eWGWBs6/6ztAm1dxsq4Q227DHAcSUbVx3SUSjDsLFlBsoX3Rt/nPO8l1P0K
         k0qQ==
X-Gm-Message-State: AOAM530DXhzgGCuV7n5ajjqahH2iWqITlf3gy5YvLkDEpfxIVgipFWU2
        UyiBXeKxYmWAutdQPGaqQnRQF8TD55U=
X-Google-Smtp-Source: ABdhPJySMLUfucifnluon1ZUotteDa3+FPD3dCBupGrsOIsZYFapDbY2mURBgSQIJ2QZVeuNUjn28A==
X-Received: by 2002:a1c:151:: with SMTP id 78mr9557982wmb.24.1609370427219;
        Wed, 30 Dec 2020 15:20:27 -0800 (PST)
Received: from [192.168.0.160] ([170.253.49.0])
        by smtp.gmail.com with ESMTPSA id f9sm74021621wrw.81.2020.12.30.15.20.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Dec 2020 15:20:26 -0800 (PST)
Subject: Re: [PATCH] copy_file_range.2: SYNOPSIS: Fix prototype parameter
 types
To:     "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc:     linux-man@vger.kernel.org
References: <20201230214147.874671-5-alx.manpages@gmail.com>
 <2b1cbbc7-a1f3-dbef-1d23-d96409e4490c@gmail.com>
From:   "Alejandro Colomar (man-pages)" <alx.manpages@gmail.com>
Message-ID: <a27fb355-f3be-036a-459a-1769e72e3a70@gmail.com>
Date:   Thu, 31 Dec 2020 00:20:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <2b1cbbc7-a1f3-dbef-1d23-d96409e4490c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org



On 12/30/20 11:43 PM, Michael Kerrisk (man-pages) wrote:
> Hi Alex,
> 
> On 12/30/20 10:41 PM, Alejandro Colomar wrote:
>> Glibc uses 'off64_t' instead of 'loff_t'.
> 
> Okay.
> 
>> This patch doesn't change the types in the code example,
>> because it uses the Linux syscall, and not the glibc wrapper.
> 
> I think the example probably also needs fixing then. There's
> no longer a need for syscall(2) in this example, I think.

Hi Michael,

I thought the same, but glibc 2.26 is still supported,
and lacks the wrapper.
Would you change it already?

Thanks,

Alex

> 
> Thanks,
> 
> Michael
> 
>> ......
>>
>> $ syscall='copy_file_range';
>> $ ret='ssize_t';
>> $ find glibc/ -type f -name '*.h' \
>>   |xargs pcregrep -Mn "(?s)^[\w\s]*${ret}\s*${syscall}\s*\(.*?;";
>> glibc/posix/unistd.h:1121:
>> ssize_t copy_file_range (int __infd, __off64_t *__pinoff,
>> 			 int __outfd, __off64_t *__poutoff,
>> 			 size_t __length, unsigned int __flags);
>>
>> Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>
>> ---
>>  man2/copy_file_range.2 | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/man2/copy_file_range.2 b/man2/copy_file_range.2
>> index 1692aa44a..6f4708c4b 100644
>> --- a/man2/copy_file_range.2
>> +++ b/man2/copy_file_range.2
>> @@ -30,8 +30,8 @@ copy_file_range \- Copy a range of data from one file to another
>>  .B #define _GNU_SOURCE
>>  .B #include <unistd.h>
>>  .PP
>> -.BI "ssize_t copy_file_range(int " fd_in ", loff_t *" off_in ,
>> -.BI "                        int " fd_out ", loff_t *" off_out ,
>> +.BI "ssize_t copy_file_range(int " fd_in ", off64_t *" off_in ,
>> +.BI "                        int " fd_out ", off64_t *" off_out ,
>>  .BI "                        size_t " len ", unsigned int " flags );
>>  .fi
>>  .SH DESCRIPTION
>>
> 
> 
