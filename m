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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4816C43464
	for <linux-man@archiver.kernel.org>; Fri, 18 Sep 2020 20:45:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6A395208DB
	for <linux-man@archiver.kernel.org>; Fri, 18 Sep 2020 20:45:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ILTU7Rlz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726247AbgIRUpZ (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Fri, 18 Sep 2020 16:45:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726174AbgIRUpZ (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Fri, 18 Sep 2020 16:45:25 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A584AC0613CE
        for <linux-man@vger.kernel.org>; Fri, 18 Sep 2020 13:45:24 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id x14so6845772wrl.12
        for <linux-man@vger.kernel.org>; Fri, 18 Sep 2020 13:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=cc:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8pdXX8FynLdvPp4vqYSul6kC5EmTNEbU1oPwOpHyeQI=;
        b=ILTU7RlzSH467HruScOf8DIohAis9UyRUC/kdfVZU0k8ImJxbt6M1nxBp+RfkOGVii
         fyuDTcs2vueRHAbFn03oVsFGy5ZdUuRiJHl7c4IEqFkI3OFljE693oa3pEEDs+j4B0gY
         a1y0PB/IhjP7S2GHPeIMU9HCqkxoEl8hEqB2N4hkZmx8vgIqLFPUcCFGo93+l7Smb35/
         1Vsk7vVZqyHISbf7Ul+Ow6r93uGzswHAsDufR4ob7wnt3V3zxoSvXHpgcgFg4LvC8BPS
         SI7HPFLsUZepP6tiAjCSZ1slCSAJOBI0ZUOtVQzCQ8yQYsf9YbA5qHZBFixD2Q4+0LJI
         35nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:cc:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8pdXX8FynLdvPp4vqYSul6kC5EmTNEbU1oPwOpHyeQI=;
        b=PBqYLvpbKuxS7GaeAOMDxQ0Zm5LeJxLAIpaqRkj/j+jijTzHtJPtgARYBdqv59j/1v
         aJR2a5gIphHKkATLYTejkBWh0VuSq6TYybSBOVdmgqxWkXSACjludHgwSXP2+rKRv+um
         0ktd84WodLxypIa4olnI/kTgHijLhnQtACgoYNq2V66JjmbrkqRlpMZ0NWKlWKBr7uO4
         pLpSDop5tZ/BhHo3VzW1sg8UQV9KnqFYEDIEGy2QFxGugQuwbNDZKls3s7cIss8vSv2M
         XOmE/419vu4Y2voBqtFNGOSlukEg0Tat7QFXjdc/07af5vdOwnfMt+leaBNB9/Svgqvi
         jooA==
X-Gm-Message-State: AOAM531NdWPaoILcA4lWhr7y7noLegnNaT/8PPQFtvG9YCpnF0ZKhPRJ
        TBKxdC71fRDowGnPxa+7GUA=
X-Google-Smtp-Source: ABdhPJwupbugWSoSVw9UCBgwuClEOvd8bTYO4rWZpCzzVASbfL5eJ2P0e/ET3pFCum/zK2Ev+hYigA==
X-Received: by 2002:adf:ec92:: with SMTP id z18mr42345541wrn.53.1600461923347;
        Fri, 18 Sep 2020 13:45:23 -0700 (PDT)
Received: from ?IPv6:2001:a61:2479:6801:d8fe:4132:9f23:7e8f? ([2001:a61:2479:6801:d8fe:4132:9f23:7e8f])
        by smtp.gmail.com with ESMTPSA id z15sm7330826wrv.94.2020.09.18.13.45.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2020 13:45:22 -0700 (PDT)
Cc:     mtk.manpages@gmail.com, linux-man@vger.kernel.org,
        libc-alpha@sourceware.org
Subject: Re: [PATCH 3/3] regmatch_t.3: New page for new documented type in
 system_data_types(7)
To:     Alejandro Colomar <colomar.6.4.3@gmail.com>
References: <20200918132943.55424-1-colomar.6.4.3@gmail.com>
 <20200918132943.55424-4-colomar.6.4.3@gmail.com>
From:   "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Message-ID: <4de9a11b-5bcb-4a37-1a15-a476c94277fe@gmail.com>
Date:   Fri, 18 Sep 2020 22:45:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200918132943.55424-4-colomar.6.4.3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

On 9/18/20 3:29 PM, Alejandro Colomar wrote:
> Signed-off-by: Alejandro Colomar <colomar.6.4.3@gmail.com>


Thanks, Alex. Patch applied. But title should say "New link...",
rather than "New page..." (I fixed it).

Cheers,

Michael


> ---
>  man3/regmatch_t.3 | 1 +
>  1 file changed, 1 insertion(+)
>  create mode 100644 man3/regmatch_t.3
> 
> diff --git a/man3/regmatch_t.3 b/man3/regmatch_t.3
> new file mode 100644
> index 000000000..db50c0f09
> --- /dev/null
> +++ b/man3/regmatch_t.3
> @@ -0,0 +1 @@
> +.so man7/system_data_types.7
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
