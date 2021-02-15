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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CEC7C433DB
	for <linux-man@archiver.kernel.org>; Mon, 15 Feb 2021 19:56:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E19B264E23
	for <linux-man@archiver.kernel.org>; Mon, 15 Feb 2021 19:56:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229961AbhBOT4b (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 15 Feb 2021 14:56:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229802AbhBOT40 (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Mon, 15 Feb 2021 14:56:26 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4142C061756
        for <linux-man@vger.kernel.org>; Mon, 15 Feb 2021 11:55:45 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id b3so10392595wrj.5
        for <linux-man@vger.kernel.org>; Mon, 15 Feb 2021 11:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=cc:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fAMdVakNuVIhUK91V6wrxlWkRVzGo4mfcu6AIeqe5Uo=;
        b=G9RxraPefuD3DQg0p1D2sePOGvQm8o4ahrx6FKwAYIJPDCX9NiK3wBpfnlvvxOsogQ
         4bnRcMXnXxbAAE7yXfcpWpoOryNQjejrczq3dWIdq+lAAGXrG45XTos+nBYNI3ySpCMM
         nwFLayX59JOU6oqaEvyn2pFyxdR2AmHAOf9D+K+XYRm/J/MTdoXgOWs+/OFMrjU/SVsx
         FPNJ9+XJMW0mwzPcTTHB0C8TfNaOgUYnL93gYtmsnJMBkMxZUkFLJSm8dr+1zpavaurn
         26WYqGSHzgRNcsMhRJHK6zcQVg50Fp2mw9dG0nUlF0cjIFuGxAHuDQ6s4roVlN2u7HX9
         8AGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:cc:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fAMdVakNuVIhUK91V6wrxlWkRVzGo4mfcu6AIeqe5Uo=;
        b=cUQQtnnpJTiiRxDORwhT9QGj7kikavmbVkzO/qXy50W8ghG/U0KHUowuF6TsKLZkQi
         AagvE4A1YlG1me2v/soJ4fEC5sPH3NtoLj2A2joRKtSpOa02c4mjHTwoJc0bEo1QA/a6
         fBoYBM1kaSVAW17SsRoYKuYCjND3yA2UY+Qwvt/JSMfHd1HyqNV5z7OEqfSf3dQGA7We
         L1DIcei+aahPc8xKVa4q+VPKNF7wRfKpmtyP9oCLwdlUKFGAmocQZZEVd3Lk2XCLI/E3
         FnuhftcIOAPkFGxrFTOS/y29IJWHW9rBpjvi2cEBRM9ORATJ8WZ5GUSvL3SnoH8d98ls
         6b9g==
X-Gm-Message-State: AOAM530f32LBCiNqELPwIOSTw3miMx5Nh+U5KMtzfHjgC6HnGgNLoFAs
        BmKS0QJ2gu4yfxlCRpW9Znq5QSTjqhr8Iw==
X-Google-Smtp-Source: ABdhPJzj8y7wWEBpDhp0dZsKxIk10pQliENDltUeJzGqXYsEaC7v4PtDvQlpz6ZG/2RVSrHg0MtDRA==
X-Received: by 2002:adf:de01:: with SMTP id b1mr11215382wrm.369.1613418944324;
        Mon, 15 Feb 2021 11:55:44 -0800 (PST)
Received: from ?IPv6:2001:a61:3a2d:1d01:e14:1e8b:dca4:7d73? ([2001:a61:3a2d:1d01:e14:1e8b:dca4:7d73])
        by smtp.gmail.com with ESMTPSA id y6sm447108wma.10.2021.02.15.11.55.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Feb 2021 11:55:43 -0800 (PST)
Cc:     mtk.manpages@gmail.com, linux-man@vger.kernel.org
Subject: Re: [PATCH] setfsgid.2: tfix
To:     Alejandro Colomar <alx.manpages@gmail.com>
References: <20210215131522.450666-4-alx.manpages@gmail.com>
From:   "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Message-ID: <e2560966-a299-f8f7-b008-7a73ffaf679f@gmail.com>
Date:   Mon, 15 Feb 2021 20:55:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210215131522.450666-4-alx.manpages@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Hi Alex,

On 2/15/21 2:15 PM, Alejandro Colomar wrote:
> The type of fsgid is git_t, and not uid_t.  Fix it.

Cute. That mistake has been present for about 25 years!

Patch applied.

Thanks,

Michael

> ......
> 
> .../glibc$ grep_glibc_prototype setfsgid
> sysdeps/unix/sysv/linux/sys/fsuid.h:31:
> extern int setfsgid (__gid_t __gid) __THROW;
> .../glibc$
> 
> Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>
> ---
>  man2/setfsgid.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/setfsgid.2 b/man2/setfsgid.2
> index e2d4d09f3..3fd22f3a5 100644
> --- a/man2/setfsgid.2
> +++ b/man2/setfsgid.2
> @@ -36,7 +36,7 @@ setfsgid \- set group identity used for filesystem checks
>  .nf
>  .B #include <sys/fsuid.h>
>  .PP
> -.BI "int setfsgid(uid_t " fsgid );
> +.BI "int setfsgid(gid_t " fsgid );
>  .fi
>  .SH DESCRIPTION
>  On Linux, a process has both a filesystem group ID and an effective group ID.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
