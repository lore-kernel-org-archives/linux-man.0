Return-Path: <SRS0=d1fi=DB=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62F83C4727D
	for <linux-man@archiver.kernel.org>; Thu, 24 Sep 2020 11:07:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1853120702
	for <linux-man@archiver.kernel.org>; Thu, 24 Sep 2020 11:07:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nIU7Yy0q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbgIXLHZ (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Thu, 24 Sep 2020 07:07:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726672AbgIXLHY (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Thu, 24 Sep 2020 07:07:24 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 318F1C0613CE
        for <linux-man@vger.kernel.org>; Thu, 24 Sep 2020 04:07:24 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id r7so3841460ejs.11
        for <linux-man@vger.kernel.org>; Thu, 24 Sep 2020 04:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=cc:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=M3vMDRjI1kQ57/pYnYpU6MoqNWmEaOj+PqYooo7C9Ns=;
        b=nIU7Yy0qHh6oJtisJjJSNhX4FMSlXo+Ir2B/c6FbV5ts0D2rCYCj9y0ksyPgf0w/Rf
         nVSlDiZyfoqeaCT4SXlCeYzNS+YRwcWT4LHDPBaYYXeyjfqvxtTdPSVtYqWbVT1JykG0
         pkCC2AM2q044+h3yXh0f9VmvuFclHsHXDPjDpb+4jMZYMsnC3UM4XwlYBG+WmBF9QUtC
         zbMCai4XN/a1SvCmwK9wp/Vxw02Bdo3u2tBJTJ4CUnprNEfmIA3AnlJ/5DqHFHcETSol
         E5ourQ9jiF7BJN6nQp6s40gC/IaJD7FBA6CzXKar8E47JZF9lXXAoSqpttFoB/ABAu6q
         WiEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:cc:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=M3vMDRjI1kQ57/pYnYpU6MoqNWmEaOj+PqYooo7C9Ns=;
        b=R1u8DoPv9B2aP1lSditesIy2Hy0JjvO49Bm04K+ybWxClIVQ7agbGR8avCR+jhrYaX
         Cqw8O51BibX6SdCYtAPEJJVgDih2+n+5fh1gwEDUUaPT79YwdKGJvafBj6H3W+5ChsQZ
         +zdHXEwSzK6Os8NOImt/PuuB3vPU67pGNbe/s58/3e819p9CGQMuk9cKzKZEuAHbTiQP
         1ww3fZYFSZmd5/cfeLrjoXO9qFCP1PEcfj8uQ2oMqjtBxRD4tjmKG9WtZuEKdPOxv4RN
         wJwLSTGag4Uk0VSz0NZbRJwEI3gIEt3m8oVLBAMiC8Ni4u2MzQDheyucIeNptzEBLTwx
         grRA==
X-Gm-Message-State: AOAM530HZv/5Pb6jw9+jPXl71jccZ16SWuJrhIo87oOr8ouzfq2PWETO
        g6UnjilJEBwmM3Flwl+wa0BWFab4/zk=
X-Google-Smtp-Source: ABdhPJwQyCO5lGPSQjTgiwlgVvbZV7HNN+sn7awWcfZSi77S1qf82zTK6U5cG9mkRi4gkegWAgqI7A==
X-Received: by 2002:a17:906:4941:: with SMTP id f1mr391845ejt.417.1600945642653;
        Thu, 24 Sep 2020 04:07:22 -0700 (PDT)
Received: from ?IPv6:2001:a61:2479:6801:d8fe:4132:9f23:7e8f? ([2001:a61:2479:6801:d8fe:4132:9f23:7e8f])
        by smtp.gmail.com with ESMTPSA id z18sm2084640ejb.92.2020.09.24.04.07.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2020 04:07:22 -0700 (PDT)
Cc:     mtk.manpages@gmail.com, linux-man@vger.kernel.org
Subject: Re: [PATCH 5/6] system_data_types.7: Add lldiv_t
To:     Alejandro Colomar <colomar.6.4.3@gmail.com>
References: <20200924101308.78204-1-colomar.6.4.3@gmail.com>
 <20200924101308.78204-5-colomar.6.4.3@gmail.com>
From:   "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Message-ID: <95c3d6e5-0fbf-bbb8-b236-96a7822d7906@gmail.com>
Date:   Thu, 24 Sep 2020 13:07:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200924101308.78204-5-colomar.6.4.3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

On 9/24/20 12:13 PM, Alejandro Colomar wrote:
> Signed-off-by: Alejandro Colomar <colomar.6.4.3@gmail.com>
> ---
>  man7/system_data_types.7 | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/man7/system_data_types.7 b/man7/system_data_types.7
> index 1f7c172d7..c3add1400 100644
> --- a/man7/system_data_types.7
> +++ b/man7/system_data_types.7
> @@ -248,6 +248,28 @@ Conforming to: C99 and later; POSIX.1-2001 and later.
>  .IP
>  See also:
>  .BR ldiv (3)
> +.\"------------------------------------- lldiv_t ----------------------/
> +.TP
> +.I lldiv_t
> +.IP
> +Include:
> +.IR <stdlib.h> .
> +.IP
> +.EX
> +typedef struct {
> +    long long   quot; /* Quotient */
> +    long long   rem;  /* Remainder */
> +} lldiv_t;
> +.EE
> +.IP
> +It is the type of the value returned by the
> +.I lldiv (3)
> +function.
> +.IP
> +Conforming to: C99 and later; POSIX.1-2001 and later.
> +.IP
> +See also:
> +.BR lldiv (3)
>  .\"------------------------------------- pid_t ------------------------/
>  .TP
>  .I pid_t
> 


Applied.

Thanks,

Michael



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
