Return-Path: <SRS0=on+3=DO=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D673C4363C
	for <linux-man@archiver.kernel.org>; Wed,  7 Oct 2020 06:53:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D3D0B20797
	for <linux-man@archiver.kernel.org>; Wed,  7 Oct 2020 06:53:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H2L+THlT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727261AbgJGGx5 (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Wed, 7 Oct 2020 02:53:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbgJGGx5 (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Wed, 7 Oct 2020 02:53:57 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F4127C061755;
        Tue,  6 Oct 2020 23:53:56 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id f21so1118663wml.3;
        Tue, 06 Oct 2020 23:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=cc:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=z3XB1xSaIVxoCVFV+AIEHdeC2vRDuyX8I/AvqLi7N88=;
        b=H2L+THlTzRfz5/3byTG37OmbuDrd0ZgYdwhG5F7zp1ezKqDAso825mZMJrkB6GLTuf
         0e1PfBnifQN7LAy6EgPWJH5c3wyE4xUgVd+2+FPV5qV0MZprS2EdVMqGgV4rl+wm6mCj
         tiHdTLERFygeWrEaFsp5wLlV0uLXZ9Gbggx2AFjTsDWmLGGpAs8P2KR6WwhqgC+zpCav
         4xUGl8G8c7NlnW1x49QfTLBfxJ91tx+XnMOYD7nYnT7CGhTNxYEBoldGpiLbiP1/cdAm
         6rn+o/waQIazqFm3iRo0BCCXpSpXRdONzYJv/If5FTeNplPMWW50XeHZyfHv/x8ck/JZ
         VWrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:cc:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=z3XB1xSaIVxoCVFV+AIEHdeC2vRDuyX8I/AvqLi7N88=;
        b=oDM5Avt5ZEqV8gLLSEk9k96LJVzr7nKXXgdi2wP5as9frnC3aS4Fz7FZA5mUsVDg7O
         VRaAtH9prK6LcRqZHdjKiRrF56S6NB+j0joSVrEv7ArYLpvTUU1xSC3z+YXkowWzDAHy
         yV2stjh9WYNBYxih1CmH62y9MRmVGvMQ6cYzBojVn0hfzVct3TGjrXwuJH7HJDigqxAB
         1NoMqkTnXYRV1ZXTsWN/nF8XBZ07q5MwcuclG/zubucJbcocNEGAnB25wUsp2TyHt7/L
         DoyMa/TSZVsVdRxiTrHELBk7e/Lj65tPy4voqYvVA8UrIhvatzF8NL8+3nRWxiaZ5+RL
         3cRQ==
X-Gm-Message-State: AOAM533nQg9O9KmLlq8an8LY9fhJ13mr/uc62XjkgZj/CZuuuPUAtJUO
        pW5GxtFlxgIMKYAcMHPtkVYoj0EP7bFvwA==
X-Google-Smtp-Source: ABdhPJwJq72/bBf9D8rLb782aBEYIY6MXK33Uf83vsHI80STDbhIjSQlKpejF4CPAgNDDbnhf1znew==
X-Received: by 2002:a7b:c0d8:: with SMTP id s24mr1571629wmh.156.1602053635461;
        Tue, 06 Oct 2020 23:53:55 -0700 (PDT)
Received: from [192.168.43.156] (dynamic-046-114-000-081.46.114.pool.telefonica.de. [46.114.0.81])
        by smtp.gmail.com with ESMTPSA id o6sm1447830wrm.69.2020.10.06.23.53.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2020 23:53:54 -0700 (PDT)
Cc:     mtk.manpages@gmail.com, linux-man@vger.kernel.org,
        libc-alpha@sourceware.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] system_data_types.7: Add 'off_t'
To:     Alejandro Colomar <colomar.6.4.3@gmail.com>
References: <20201005221247.13065-1-colomar.6.4.3@gmail.com>
From:   "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Message-ID: <b24d9f74-d07c-5d07-0788-eb8f1711d71d@gmail.com>
Date:   Wed, 7 Oct 2020 08:53:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201005221247.13065-1-colomar.6.4.3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

On 10/6/20 12:12 AM, Alejandro Colomar wrote:
> Signed-off-by: Alejandro Colomar <colomar.6.4.3@gmail.com>

Hi Alex,

Thanks, patch applied. And I trimmed the "See also" a little.
I'd hold off on documenting loff_t and off64_t for the 
moment. As you note in another mail, the *lseek* man page
situation is a bit of a mess. I'm not yet sure what to do.

Thanks,

Michael

> ---
>  man7/system_data_types.7 | 50 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/man7/system_data_types.7 b/man7/system_data_types.7
> index b8cbc8ffe..916efef08 100644
> --- a/man7/system_data_types.7
> +++ b/man7/system_data_types.7
> @@ -629,6 +629,56 @@ C99 and later; POSIX.1-2001 and later.
>  See also:
>  .BR lldiv (3)
>  .RE
> +.\"------------------------------------- off_t ------------------------/
> +.TP
> +.I off_t
> +.RS
> +Include:
> +.IR <sys/types.h> .
> +Alternatively,
> +.IR <aio.h> ,
> +.IR <fcntl.h> ,
> +.IR <stdio.h> ,
> +.IR <sys/mman.h> ,
> +.IR <sys/stat.h.h> ,
> +or
> +.IR <unistd.h> .
> +.PP
> +Used for file sizes.
> +According to POSIX,
> +this shall be a signed integer type.
> +.PP
> +Versions:
> +.I <aio.h>
> +and
> +.I <stdio.h>
> +define
> +.I off_t
> +since POSIX.1-2008.
> +.PP
> +Conforming to:
> +POSIX.1-2001 and later.
> +.PP
> +See also:
> +.BR fallocate (2),
> +.BR lseek (2),
> +.BR mmap (2),
> +.BR mmap2 (2),
> +.BR posix_fadvise (2),
> +.BR pread (2),
> +.BR preadv (2),
> +.BR truncate (2),
> +.BR fseeko (3),
> +.BR getdirentries (3),
> +.BR lockf (3),
> +.BR posix_fallocate (3)
> +.\".PP		TODO: loff_t, off64_t
> +.\"See also the
> +.\".I loff_t
> +.\"and
> +.\".I off64_t
> +.\"types in this page.
> +.RE
>  .\"------------------------------------- pid_t ------------------------/
>  .TP
>  .I pid_t
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
