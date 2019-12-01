Return-Path: <SRS0=WW8X=ZX=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0F25C432C0
	for <linux-man@archiver.kernel.org>; Sun,  1 Dec 2019 12:16:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C3E992073C
	for <linux-man@archiver.kernel.org>; Sun,  1 Dec 2019 12:16:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EtAnc85o"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726363AbfLAMQj (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sun, 1 Dec 2019 07:16:39 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:37164 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725993AbfLAMQj (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sun, 1 Dec 2019 07:16:39 -0500
Received: by mail-wm1-f68.google.com with SMTP id f129so19943783wmf.2
        for <linux-man@vger.kernel.org>; Sun, 01 Dec 2019 04:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=j/LtOu0Bw3WbAhWSjtarTHbdpQ8Ch/0xCTaxuRRvJ34=;
        b=EtAnc85oJfaYdQQ68Zhcle+XR9SecJvqWP11zGVFQ7pLCYxpsEQ8Yg6UYRvVM3/RyU
         qveEIQ4qWHUvtLG6xsVv4kLsBGBa8TKTKvb29AgPhIbrRWIBP0dv3zvM0k56JSu/L80o
         ktzXuYPiwmBdwQDVeee4xkSglpQAfmUqFUdunbo/vAG39thQxw3RA8PU0+xSONU17vTv
         UVUViI/g5Hw2sLLdTK2giQGGxbW2KuWwdgeKfSZo7XN1YNBOuHF5XINtalPin33oUA0J
         x9nLvDE2Jz0E922lEo1esiLgS3EWV4aZPXiIDJBqseGDPywqjLnMbWLex9QFvosdRdw5
         9hew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=j/LtOu0Bw3WbAhWSjtarTHbdpQ8Ch/0xCTaxuRRvJ34=;
        b=Pt0ZGfVUHKZ0ADPVFWrUt8dD7dQuKOcIgpBFEBthRR5xxOReioPjjPvMgF9IS7CEWS
         5fA0Nebj+la2/gGP2EXWYeDzRQ0iwJOBYI5ILaT7lIOOk8zsx+Li828XP6lUvf0fEcxv
         0A2qcqjpJ6qD0D3eZFFt8wirr4WGqEzWzMSfHj65/ruon3jhKfbljM6s/p00LoMobzB7
         zo1P9mAJBW2+jpvZOeeH5zEJcJXV9maxB2bAQ4HwAEovXgXsUNSTOR85EBEumfu5oAo6
         T8d9Ic4L3FlE/oHaRD71OWjyuo94/FHQaTMm9V5Ces2nvsVmmbwXqKsQYuccTXbCPRfF
         WCTg==
X-Gm-Message-State: APjAAAUdVUghmBpsH5Vg6c3LT3u41zzgyakleBOKWSSGJHeAGOOzdg1j
        if/6X7+2y6/tSBZh8xiOPg2PlRjh
X-Google-Smtp-Source: APXvYqwYTsp1ro/0TlSTAF53TKTJgFkez4y6yIAFfExxQ2H8NU+Oc1lBzxQ8a6RM4Wh/ethh3TKOvw==
X-Received: by 2002:a1c:4e1a:: with SMTP id g26mr24085241wmh.138.1575202596999;
        Sun, 01 Dec 2019 04:16:36 -0800 (PST)
Received: from localhost.localdomain (cpc73834-dals21-2-0-cust682.20-2.cable.virginm.net. [82.0.142.171])
        by smtp.gmail.com with ESMTPSA id a3sm11569897wmh.5.2019.12.01.04.16.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Dec 2019 04:16:36 -0800 (PST)
Subject: Re: [PATCH 1/2] clone.2: tfix
To:     Adrian Reber <areber@redhat.com>,
        Christian Brauner <christian.brauner@ubuntu.com>
Cc:     linux-man@vger.kernel.org
References: <20191128124650.364810-1-areber@redhat.com>
From:   "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Message-ID: <6b32d7e1-b4d5-2174-6514-451708950432@gmail.com>
Date:   Sun, 1 Dec 2019 13:16:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191128124650.364810-1-areber@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Hi Adrian,

On 11/28/19 1:46 PM, Adrian Reber wrote:
> added two missing parentheses
> 
> Signed-off-by: Adrian Reber <areber@redhat.com>
> ---
>   man2/clone.2 | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/man2/clone.2 b/man2/clone.2
> index e5ab2a096..076b9258e 100644
> --- a/man2/clone.2
> +++ b/man2/clone.2
> @@ -1349,13 +1349,13 @@ For example, on aarch64,
>   .I stack
>   must be a multiple of 16.
>   .TP
> -.BR EINVAL " (" clone3 "() only"
> +.BR EINVAL " (" clone3 "() only)"
>   .B  CLONE_DETACHED
>   was specified in the
>   .I flags
>   mask.
>   .TP
> -.BR EINVAL " (" clone "() only"
> +.BR EINVAL " (" clone "() only)"
>   .B CLONE_PIDFD
>   was specified together with
>   .B CLONE_DETACHED
> 
> base-commit: 445fc03eebeee9b0e9ccaa4e2361f91f30749e8e

Thanks. Applied.

Cheers,

Michael

