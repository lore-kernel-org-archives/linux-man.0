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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E90DC433ED
	for <linux-man@archiver.kernel.org>; Mon,  5 Apr 2021 11:41:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D32CC61399
	for <linux-man@archiver.kernel.org>; Mon,  5 Apr 2021 11:41:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234951AbhDELli (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 5 Apr 2021 07:41:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232755AbhDELlh (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Mon, 5 Apr 2021 07:41:37 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6D27C061756
        for <linux-man@vger.kernel.org>; Mon,  5 Apr 2021 04:41:31 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id l18so12228449edc.9
        for <linux-man@vger.kernel.org>; Mon, 05 Apr 2021 04:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=cc:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=15paRyA8laMJyXP2qTLEEsnZaba5+nG0DfzyEVH4DBU=;
        b=Jc5iaWmMSjzhPIVJquhBTzl3YOCAOL5KiiVUsv2rUyW50kf0XFJtE48VP/dXPwmWE0
         GovTz1Y0jPBYJnkYQ6ZVafVFbRsT0Zaxx2mZup1N5kWdAD+U3HGAkH3BYiZrtmTsN+wF
         DKIYoA3Zk/az2uFULBpY0N5yq/892aQXE6LiDHbPir1qHeeqkqEcyR0sHKQLuz/9vnQZ
         xelcnc8m5VbzxHdrCTIxpM4CywkGYxDYejM6zqv+a7acGw1N51y6P0qUXnNXlSVMjXcU
         zDFgPYgbXBX5lR0AN8RJfrMAo1kElnPVMgBUuYy4OdxmOn6OSVLXf1uHKcFp6MAk8F4C
         ZsDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:cc:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=15paRyA8laMJyXP2qTLEEsnZaba5+nG0DfzyEVH4DBU=;
        b=FOM1VEmd7jjMablIKa0+Uxr63iUVMSmITQIjpseOod/pD26HrmpD5nAhxWmf2ccGHn
         JbUfJVteSCmZZ6ukG/5inUxrRi3v61/+UXzsBML/AZaZoeNRZTDJ05VPpwGZVW+P1GqH
         X3ksdeoE1cnq8X+Eiomb/RVoARPV43G9eQtBq2s5Ko2HBHITgzX6DxFJ0wIHipQcWRNg
         eejoHpXkQjVNXxm+73kt0xkq4fAuTsFPWSz+qT+0x4Fg/VkYZ60/pTOP3IZMF8lUXIXA
         Sqx8C8WPbijuZhFz30m1t4v4im6fhZdgorYJxdjSuIAk8Z9QCvgvQXGzanOlG2HYoHMc
         +7gQ==
X-Gm-Message-State: AOAM530/xk5m9ZnyLGP2bTsZiOZDtedXzQ+iY7P3I8iBPhu/0dYo2QL8
        sYC7Gwcl2fqQkPnRLwYbt6I=
X-Google-Smtp-Source: ABdhPJw4qiKt4QsguT4J6TARU2wKRgUy2ibZ88LCMsX9N2RVEVlJ9O565De998petzZXgIA8zZNucA==
X-Received: by 2002:a05:6402:354d:: with SMTP id f13mr31367744edd.228.1617622890370;
        Mon, 05 Apr 2021 04:41:30 -0700 (PDT)
Received: from ?IPv6:2001:a61:2553:a401:cfc6:2039:a9ec:21ff? ([2001:a61:2553:a401:cfc6:2039:a9ec:21ff])
        by smtp.gmail.com with ESMTPSA id nd36sm8598709ejc.21.2021.04.05.04.41.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Apr 2021 04:41:30 -0700 (PDT)
Cc:     mtk.manpages@gmail.com, linux-man@vger.kernel.org,
        libc-alpha@sourceware.org
Subject: Re: [PATCH v5 27/35] init_module.2: Use syscall(SYS_...); for system
 calls without a wrapper
To:     Alejandro Colomar <alx.manpages@gmail.com>
References: <20210403194026.102818-1-alx.manpages@gmail.com>
 <20210404115847.78166-28-alx.manpages@gmail.com>
From:   "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Message-ID: <93823d67-51a2-bf74-7a83-7a8b625b2da4@gmail.com>
Date:   Mon, 5 Apr 2021 13:41:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210404115847.78166-28-alx.manpages@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Hi Alex,

On 4/4/21 1:58 PM, Alejandro Colomar wrote:
> Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>
> ---
>  man2/init_module.2 | 20 ++++++++------------
>  1 file changed, 8 insertions(+), 12 deletions(-)


Patch applied.

Thanks,

Michael


> diff --git a/man2/init_module.2 b/man2/init_module.2
> index e158ce9fa..13d1b7f0a 100644
> --- a/man2/init_module.2
> +++ b/man2/init_module.2
> @@ -29,14 +29,15 @@
>  init_module, finit_module \- load a kernel module
>  .SH SYNOPSIS
>  .nf
> -.BI "int init_module(void *" module_image ", unsigned long " len ,
> -.BI "                const char *" param_values );
> -.BI "int finit_module(int " fd ", const char *" param_values ,
> -.BI "                 int " flags );
> -.fi
> +.BR "#include <linux/module.h>" "    /* Definition of " MODULE_* " constants */"
> +.BR "#include <sys/syscall.h>" "     /* Definition of " SYS_* " constants */"
> +.B #include <unistd.h>
>  .PP
> -.IR Note :
> -There are no glibc wrappers for these system calls; see NOTES.
> +.BI "int syscall(SYS_init_module, void *" module_image ", unsigned long " len ,
> +.BI "            const char *" param_values );
> +.BI "int syscall(SYS_finit_module, int " fd ", const char *" param_values ,
> +.BI "            int " flags );
> +.fi
>  .SH DESCRIPTION
>  .BR init_module ()
>  loads an ELF image into kernel space,
> @@ -268,11 +269,6 @@ manually declare the interface in your code;
>  alternatively, you can invoke the system call using
>  .BR syscall (2).
>  .PP
> -Glibc does not provide a wrapper for
> -.BR finit_module ();
> -call it using
> -.BR syscall (2).
> -.PP
>  Information about currently loaded modules can be found in
>  .IR /proc/modules
>  and in the file trees under the per-module subdirectories under
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
