Return-Path: <SRS0=SL3d=C3=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C67ACC43464
	for <linux-man@archiver.kernel.org>; Fri, 18 Sep 2020 21:42:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 61901205CB
	for <linux-man@archiver.kernel.org>; Fri, 18 Sep 2020 21:42:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ncKJQNdO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726154AbgIRVmp (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Fri, 18 Sep 2020 17:42:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbgIRVmo (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Fri, 18 Sep 2020 17:42:44 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E4D6C0613CE
        for <linux-man@vger.kernel.org>; Fri, 18 Sep 2020 14:42:44 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id l9so6925506wme.3
        for <linux-man@vger.kernel.org>; Fri, 18 Sep 2020 14:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=cc:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7z38FvwOUycXsPUUtB+4Hutwi/nRUIgwtj+4eeHeZZg=;
        b=ncKJQNdO8CxMFYBmlHucnuxP6n9+H+S3DWVxfoqhWbmY4sZkDt0CJRVVJkcX1HeS5a
         wr+km8XJq7Irli1HYxcais20ZhdGQYSx+adapCKc4NBWlVab1D/6CfBH4mULjcHgS9EG
         FpWDBcJFml8tW+iSOu7kc7xhZ95byDRC1bEYE7lLTiuG6FeZBISJj5VpwLYVJIIjJye2
         IOGnSoZ3YLG/q6x617QDvW3UrQEJm2SYJC4VXJ+9rlL+xgM+FCBtJy9bwAWovza+4bsP
         Vn6q5HcPt2WQ1WWUEVy/ReMYCei39Oq64eWefIoxLCN1NUzt+XnpGOwtvybbGpfTbkms
         yRUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:cc:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7z38FvwOUycXsPUUtB+4Hutwi/nRUIgwtj+4eeHeZZg=;
        b=G6NU0QcuUFY0s3ZPV+ggAtuik+YblWPmsjOiNDK/sE5QEYYnvLFdF1GjC/hATxVsq8
         qN3/mNEhU3MyyS+K2PQmPUlTcXEp5gPmNcGaVWDyJl2zUqLB4ArXZHhpjw6iUn+5NTji
         MhOq0QGygTk6T3An6Q5P8OPtjTuCq2NuZeG8Z1Kg/C2kiQfRkHe6YpiyuxQQOtKG95RP
         n16j/aiBky7+stNCkqlE9zQ/OoIFzjZdNOKMvNAP7GAwUJAVY97JyL44k7SS0+E5hsaH
         XqgToe0cmfYEbsFi4qqX/CWfe+TX8a/vNkh5FvOHaeQab3I9mjvOrKXmLRNosmxYpxRb
         cZ7A==
X-Gm-Message-State: AOAM532g2N7v6upyLCIWOW3AWNAgeMqcwGjBA7b1Xb/vybIlH23e4toX
        W9Hq4g0llPwfou1EJSmwdT8=
X-Google-Smtp-Source: ABdhPJzl5EO9FM+1AdQcmtxG1mozC0oFPz7u4tl/FAkZGKpWlN1F2jYLviU/x8GhYMsKBH5a/KR//w==
X-Received: by 2002:a1c:f612:: with SMTP id w18mr17093465wmc.47.1600465362139;
        Fri, 18 Sep 2020 14:42:42 -0700 (PDT)
Received: from ?IPv6:2001:a61:2479:6801:d8fe:4132:9f23:7e8f? ([2001:a61:2479:6801:d8fe:4132:9f23:7e8f])
        by smtp.gmail.com with ESMTPSA id m3sm7019512wrs.83.2020.09.18.14.42.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2020 14:42:41 -0700 (PDT)
Cc:     mtk.manpages@gmail.com, linux-man@vger.kernel.org,
        libc-alpha@sourceware.org
Subject: Re: [PATCH 8/9] system_data_types.7: Document siginfo_t
To:     Alejandro Colomar <colomar.6.4.3@gmail.com>
References: <20200918170442.94920-1-colomar.6.4.3@gmail.com>
 <20200918170442.94920-9-colomar.6.4.3@gmail.com>
From:   "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Message-ID: <a5e4490c-b796-c13f-fb74-75ebc7dbe321@gmail.com>
Date:   Fri, 18 Sep 2020 23:42:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200918170442.94920-9-colomar.6.4.3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Hi Alex,

See below.


On 9/18/20 7:04 PM, Alejandro Colomar wrote:
> Note: There are a few members off this structure that are
> not required by POSIX (XSI extensions, and such).
> 
> I simply chose to not document them at all.
> 
> Signed-off-by: Alejandro Colomar <colomar.6.4.3@gmail.com>
> ---
>  man7/system_data_types.7 | 35 ++++++++++++++++++++++++++++++++---
>  1 file changed, 32 insertions(+), 3 deletions(-)
> 
> diff --git a/man7/system_data_types.7 b/man7/system_data_types.7
> index f7d25bec9..b705ed5ae 100644
> --- a/man7/system_data_types.7
> +++ b/man7/system_data_types.7
> @@ -213,6 +213,35 @@ See also:
>  See also the
>  .I aiocb
>  structure in this page.
> +.\"------------------------------------- siginfo_t --------------------/
> +.TP
> +.I siginfo_t
> +.IP
> +Include:
> +.IR <signal.h> ;
> +or
> +.IR <sys/wait.h> .
> +.IP
> +.EX
> +typedef struct {
> +    int             si_signo; /* Signal number */
> +    int             si_code; /* Signal code */
> +
> +    pid_t           si_pid; /* Sending process ID */
> +    uid_t           si_uid; /* Real user ID of sending process */
> +    void           *si_addr; /* Address of faulting instruction */
> +    int             si_status; /* Exit value or signal */
> +
> +    union sigval    si_value; /* Signal value */
> +} siginfo_t;
> +.EE
> +.\".IP
> +.\" FIXME: Add a description?
> +.IP
> +Conforming to: POSIX.1-2001 and later.
> +.IP
> +See also:
> +.BR regexec (3)

Long day for both of us, and I think the line above shows that :-).

I'm not applying this patch (or the corresponding link patch)... 

For "description" (in the next iteration of this patch),
I think you should defer to sigaction(2).

Thanks

Michael

>  .\"------------------------------------- sigval -----------------------/
>  .TP
>  .I sigval
> @@ -239,9 +268,9 @@ See also:
>  See also the
>  .I sigevent
>  structure
> -.\"and the
> -.\".I siginfo_t	FIXME
> -.\"type
> +and the
> +.I siginfo_t
> +type
>  in this page.
>  .\"------------------------------------- size_t -----------------------/
>  .TP
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
