Return-Path: <SRS0=d19B=3K=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6577C2D0CE
	for <linux-man@archiver.kernel.org>; Tue, 21 Jan 2020 19:46:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 52F8E21835
	for <linux-man@archiver.kernel.org>; Tue, 21 Jan 2020 19:46:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rc6fU8po"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727523AbgAUTqP (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Tue, 21 Jan 2020 14:46:15 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:44514 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726229AbgAUTqO (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Tue, 21 Jan 2020 14:46:14 -0500
Received: by mail-pg1-f196.google.com with SMTP id x7so2047697pgl.11
        for <linux-man@vger.kernel.org>; Tue, 21 Jan 2020 11:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=cc:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ecKxbY4QOqeGYrc8LUoDOpTBXEmvZyxpcrTcx7oRWBU=;
        b=Rc6fU8pok8bWnNa5FA2C272o3fWkQmXMhhEX8TOr4t7DsDHK3Em3Gt5gzZt7UQFBCo
         65IqISFlC/37+pPZs84o/L805buCXzCfz1SIwyPxo4fYdepFT10GCYfqjw0J8kM1IKoE
         9NUHyOh6kE2e8E0Vz4bMfwtzwq7FzZ6GSWGSmn1Fy3cNNE+d67WGLaqSexcH6xET6HIn
         epjXdJgDefacEXyGseCBtOGjB4P0M0I09U3lukgHOkBmAOEH6KPpDghwL53r9DoOgQBe
         2Ny5ehWyPeJu2JmFo5HVIVxx+1UJDOx0TmIpDJ+AOiohk1i4o4/C18ZPsFtFCvEZq+r5
         ex/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:cc:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ecKxbY4QOqeGYrc8LUoDOpTBXEmvZyxpcrTcx7oRWBU=;
        b=kensra7akAdavVCjSyMWn1Uy3390QCb4XoYebMmfk59A0klnMXugE1gTfaXsBsBb+m
         /DwDsDDJt8tcIJ/gJkMFV5ChGBcZcgsaK5Y8LU6Dlu1OS92KAxMtr5qAc9qdJAyGBMUA
         sfJTZlhroBMYR+UVmrWQsTlo7/EkLeNIGE99YyIgi7djwGdl32q48y1KmtxbG6CiPsfC
         HmAiLOR5Wjl0QDBeogqMfXrRHLrbI8ADHxnMfOdt5oa9krtbwnTwY874mKIGbBxH/c3d
         N//XPdoHvIVaueuEed1PRCa/5fNR+7nD29ApkknmQE6V2k58sDULy6zvuxb1nGveFuqO
         iRrw==
X-Gm-Message-State: APjAAAUnm3bzNvSohJsDfSuYVbGk96wCgnpntdTkyXNCmlKB7bORXMC4
        2XrzdBTaxMrwDxJxHT4U08bcHukj
X-Google-Smtp-Source: APXvYqwOgnHgcNeN/1fuY5ZJcL0q21H7WTMYM9ZKmFk7tGlS8pWy/RSFbEfGsUAogJYztfvQ4moU6Q==
X-Received: by 2002:a65:56c6:: with SMTP id w6mr7369083pgs.167.1579635974070;
        Tue, 21 Jan 2020 11:46:14 -0800 (PST)
Received: from [192.168.1.72] (122-58-99-230-adsl.sparkbb.co.nz. [122.58.99.230])
        by smtp.gmail.com with ESMTPSA id b12sm43722870pfi.157.2020.01.21.11.46.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2020 11:46:13 -0800 (PST)
Cc:     mtk.manpages@gmail.com, linux-man@vger.kernel.org
Subject: Re: [patch] inotify.7: Merge late perror() into fprintf()
To:     Nick Shipp <ns@segbrk.com>
References: <CADjEuPv0ujm9hsvrou2giOeqzZNyKN+vWuHgudvcNNs-ffwCFA@mail.gmail.com>
From:   "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Message-ID: <a2e44f8d-2e91-2fb1-e6f4-9c75f1176196@gmail.com>
Date:   Tue, 21 Jan 2020 20:46:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <CADjEuPv0ujm9hsvrou2giOeqzZNyKN+vWuHgudvcNNs-ffwCFA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Hello Nick,

On 1/20/20 5:58 PM, Nick Shipp wrote:
> fprintf may have overridden errno before perror could print it in this
> example.

Thanks. Patch applied.

Cheers,

Michael

> ---
>  man7/inotify.7 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/man7/inotify.7 b/man7/inotify.7
> index c052acfe6..995a3116f 100644
> --- a/man7/inotify.7
> +++ b/man7/inotify.7
> @@ -1045,8 +1045,8 @@ main(int argc, char* argv[])
>          wd[i] = inotify_add_watch(fd, argv[i],
>                                    IN_OPEN | IN_CLOSE);
>          if (wd[i] == \-1) {
> -            fprintf(stderr, "Cannot watch '%s'\en", argv[i]);
> -            perror("inotify_add_watch");
> +            fprintf(stderr, "Cannot watch '%s': %s\en",
> +                    argv[i], strerror(errno));
>              exit(EXIT_FAILURE);
>          }
>      }
> --
> 2.25.0
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
