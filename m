Return-Path: <SRS0=p67J=XF=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08EB1C3A5A2
	for <linux-man@archiver.kernel.org>; Tue, 10 Sep 2019 10:51:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CC84C20692
	for <linux-man@archiver.kernel.org>; Tue, 10 Sep 2019 10:51:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iRVel/fP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729465AbfIJKv6 (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Tue, 10 Sep 2019 06:51:58 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:46878 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729301AbfIJKv6 (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Tue, 10 Sep 2019 06:51:58 -0400
Received: by mail-wr1-f66.google.com with SMTP id d17so6453343wrq.13
        for <linux-man@vger.kernel.org>; Tue, 10 Sep 2019 03:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=cc:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OBBGedRY5HdSw8Zb1LAB6rkms2jD1tntil6Dt2Mqadk=;
        b=iRVel/fPud1/wsGwLbVyLHMWCIZxub6LkO611/eI8pFprI+p6Eijr8lbWhwkfD9+D7
         74EnbtSGAVgd6ekIG2KVGx/FBggyYXsOK/mKQLpu4Gon+5llNGBsSBXGY7FJ3DnxnPJK
         LDvnwD76un0LZdm1AZ9LNKprGqr4tC+FmO+kyiiXrBH/DgMj/Me6UH0FYzS23DnImQeH
         4AO89lqM1tUcZdkqXPNEgWJYXnW/uERzL0jPrsMFu0FlYh7x19gX6cdapc11WndCj76J
         LXuY0FBmzu/5gAJtuifdOLvX3HBT2odkKedzYq4nuiA5lEA/W//ZehCqXE4Zwx8tWY23
         2jrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:cc:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OBBGedRY5HdSw8Zb1LAB6rkms2jD1tntil6Dt2Mqadk=;
        b=Kq6K+1y3Ytw44d6+p1zIBvtEVujXXV7V+9dCSulmV5QetkIeMDRc32AaJBIK3be+eh
         /WNGtrCBqoSNPWkmtZYoUy23I8jjQkKJzGuKCCWsXNvUVkgh1IsfQYRqIjONvUbNj6t0
         IyrZiTygXu9pu8wEcIhmGDN/xj1+I14NmBW0z9puDNTVt9dBjoFfUHnrZmaX8al5+g8d
         UTZyMG7NujGefYKpATmkkqpXVAMiPjywPDJ4Uzc52Hp4wk7ShzkWyPRZ4Gch+CyEDjp5
         kb7tMdk9fUe7jOd5MH461haQs+cjK1BXaSzacG/DoqdNC2yX8HcAq9mwiR9jm6d4p8wA
         zodA==
X-Gm-Message-State: APjAAAV3huyyrsXaC1S2RRXpGhy7SCqTMFctVmS5enVq7FPEIZIX14V7
        mq/Npzx6fMd2O/2vMlcx5MVXYUve
X-Google-Smtp-Source: APXvYqyreMHm19WGDOWgj2s3qxkuE/qzBpO5QVlqX0cEk3v+pWTeLzLA+8npJih3Q3CUh/4UAlxIOg==
X-Received: by 2002:adf:ecc6:: with SMTP id s6mr10355305wro.333.1568112716260;
        Tue, 10 Sep 2019 03:51:56 -0700 (PDT)
Received: from [10.0.20.253] ([95.157.63.22])
        by smtp.gmail.com with ESMTPSA id c10sm21723796wrf.58.2019.09.10.03.51.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Sep 2019 03:51:55 -0700 (PDT)
Cc:     mtk.manpages@gmail.com,
        Elvira Khabirova <lineprinter@altlinux.org>,
        linux-man@vger.kernel.org
Subject: Re: [PATCH] ptrace.2: document PTRACE_GET_SYSCALL_INFO
To:     "Dmitry V. Levin" <ldv@altlinux.org>
References: <20190902123858.GA8956@altlinux.org>
From:   "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Message-ID: <0eb09cbc-8035-ee82-9c75-6525d91e7138@gmail.com>
Date:   Tue, 10 Sep 2019 12:51:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190902123858.GA8956@altlinux.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Hello Dmitry,

On 9/2/19 2:38 PM, Dmitry V. Levin wrote:
> PTRACE_GET_SYSCALL_INFO request was introduced by Linux kernel commit
> 201766a20e30f982ccfe36bebfad9602c3ff574a aka v5.3-rc1~65^2~23.
> 
> Signed-off-by: Dmitry V. Levin <ldv@altlinux.org>
> ---
>  man2/ptrace.2 | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/man2/ptrace.2 b/man2/ptrace.2
> index 8b8daf238..3b774f87b 100644
> --- a/man2/ptrace.2
> +++ b/man2/ptrace.2
> @@ -1005,6 +1005,27 @@ of the
>  .IR "struct user_desc"
>  is ignored; in other words,
>  this ptrace operation can't be used to allocate a free TLS entry.)
> +.TP
> +.BR PTRACE_GET_SYSCALL_INFO " (since Linux 5.3)"
> +.\" commit 201766a20e30f982ccfe36bebfad9602c3ff574a
> +Retrieve information about the syscall that caused the stop.
> +The information is placed into the buffer pointed by
> +.I data
> +argument, which should be a pointer to a buffer of type
> +.IR "struct ptrace_syscall_info" .
> +The
> +.I addr
> +argument contains the size of the buffer pointed to
> +by
> +.I data
> +argument (i.e.,
> +.IR "sizeof(struct ptrace_syscall_info)" ).
> +The return value contains the number of bytes available
> +to be written by the kernel.
> +If the size of data to be written by the kernel exceeds the size
> +specified by
> +.I addr
> +argument, the output is truncated.
>  .\"
>  .SS Death under ptrace
>  When a (possibly multithreaded) process receives a killing signal

Thanks for this patch. I've applied, tweaked the wording very
slightly, and pushed.

However, this patch lacks an important piece: documentation of
'struct ptrace_syscall_info'. I could take a shot at this, but 
I see you already wrote a test program for this ptrace operation. 
Would you be willing to add a patch that documents the structure?

Thanks,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
