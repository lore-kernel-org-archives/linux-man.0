Return-Path: <SRS0=qeIG=EC=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3E48C5517A
	for <linux-man@archiver.kernel.org>; Tue, 27 Oct 2020 16:42:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 78A0D206F7
	for <linux-man@archiver.kernel.org>; Tue, 27 Oct 2020 16:42:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ab6cKouZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1811798AbgJ0Qmf (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Tue, 27 Oct 2020 12:42:35 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:45655 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1802032AbgJ0Qmb (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Tue, 27 Oct 2020 12:42:31 -0400
Received: by mail-wr1-f67.google.com with SMTP id e17so2633887wru.12
        for <linux-man@vger.kernel.org>; Tue, 27 Oct 2020 09:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=cc:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lDnSx6ODKjeV6qkIAQSz+a3TFCNYhJHCIvuFxtCkJp4=;
        b=ab6cKouZzm7C3WvbfgLkfLcI/c64ukqOZv6IEy5/iQJr4FB+4eYZh+CR7pxQgTCm3R
         h8QcaCGi5gz9KjWK4BpqzqLO3YNEN7Y9x/v9itJlmT8UXD7VBAThmjRe4NPMRWAgs6ad
         i2i2qj4eQJ3XfA2/LlrMopzmPH+wqajZOVqlND2cb85d4Z5AfOEBievf/3auwv8kC8zd
         bpBPLRkdH1k3F+8qLkj4pfu2hDQ5HDUlRvEZ09XfevUm+LCX8o0tY5wi3/VPRooC5slQ
         /wWGBiEpWr7ckG9JM7tIYwiBSUb5NVc6d6ogb3zcFjLGSnhW4eFVwHNXIwxfIVYsZQY+
         F57w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:cc:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lDnSx6ODKjeV6qkIAQSz+a3TFCNYhJHCIvuFxtCkJp4=;
        b=IP9LTgGstsK6NY7GjLdyeT0GK/Ire20aYkzN9AALJOutuGsEmhbE3uK5gNqr32FhNq
         h4ltZvVttZDrMnuwl7b+OFwDO+H2tUDu0B2jRB5sdSCiUOzFh0kCthe1dx43CABgnrTp
         wFPA0AX11+9E0nMODp379A0XLbHjHmDoM3DfjJuo7E8IlUCI0byCR5uGLCwNQ+4PmDNZ
         /C7n88c2QzfpOvhjEKRIEJg/67S1Qtj7oFKsC7M/4lkNz7bDYAHJa7oaTCzvfp7WTfLr
         2YwF1OFQVXR4Opx8wK2yYc5ZXPQNu5ZweHGi5qoGdoMBWfZjSuVPUp9qMMRITJVcDjzd
         AZ+A==
X-Gm-Message-State: AOAM531mrmOg4S/CJ7Cr/mRRntfurZQBFquOL/3aduY2nKE1P3WCMJPr
        yyEeDHQCp6JDiHYxF3YVw9k=
X-Google-Smtp-Source: ABdhPJzgKW67TbQAyHto/OCgjbv5jJL/+dEbKQzL9BA4WVSf1TAP3kiD6CVJDJ0HFWEdc187abwZ7Q==
X-Received: by 2002:a5d:6681:: with SMTP id l1mr3951609wru.356.1603816948088;
        Tue, 27 Oct 2020 09:42:28 -0700 (PDT)
Received: from ?IPv6:2001:a61:245a:d801:2e74:88ad:ef9:5218? ([2001:a61:245a:d801:2e74:88ad:ef9:5218])
        by smtp.gmail.com with ESMTPSA id a2sm2591415wrs.55.2020.10.27.09.42.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2020 09:42:27 -0700 (PDT)
Cc:     mtk.manpages@gmail.com, linux-man@vger.kernel.org,
        libc-alpha@sourceware.org
Subject: Re: [PATCH 5/6] system_data_types.7: Add 'off64_t'
To:     Alejandro Colomar <colomar.6.4.3@gmail.com>
References: <20201027162114.47521-1-colomar.6.4.3@gmail.com>
 <20201027162114.47521-6-colomar.6.4.3@gmail.com>
From:   "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Message-ID: <4ccde54d-32a4-a560-39e3-d61e1e613762@gmail.com>
Date:   Tue, 27 Oct 2020 17:42:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201027162114.47521-6-colomar.6.4.3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

On 10/27/20 5:21 PM, Alejandro Colomar wrote:
> Signed-off-by: Alejandro Colomar <colomar.6.4.3@gmail.com>
> ---
>  man7/system_data_types.7 | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)

I think we shouldn't document this.
See https://www.opengroup.org/platform/lfs.html

This type, and the _LARGEFILE64_SOURCE macro date
to a time of transition in the 1990s. It's largely
irrelevant now, i think.

Thanks,

Michael

> diff --git a/man7/system_data_types.7 b/man7/system_data_types.7
> index 313cf059e..0558060d3 100644
> --- a/man7/system_data_types.7
> +++ b/man7/system_data_types.7
> @@ -751,6 +751,37 @@ and
>  .I off_t
>  types in this page.
>  .RE
> +.\"------------------------------------- off64_t ----------------------/
> +.TP
> +.I off64_t
> +.RS
> +.IR Include :
> +.IR <sys/types.h> .
> +.PP
> +Used for file sizes.
> +It is a 64-bit signed integer type.
> +.PP
> +.IR "Conforming to" :
> +Present in glibc.
> +It is not standardized by the C language standard nor POSIX.
> +.PP
> +.IR Notes :
> +The feature test macro
> +.B _LARGEFILE64_SOURCE
> +has to be defined for this type to be available.
> +.PP
> +.IR "See also" :
> +.BR readahead (2),
> +.BR sync_file_range (2),
> +.BR lseek64 (3),
> +.BR feature_test_macros (7)
> +.PP
> +See also the
> +.I loff_t
> +and
> +.I off_t
> +types in this page.
> +.RE
>  .\"------------------------------------- off_t ------------------------/
>  .TP
>  .I off_t
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
