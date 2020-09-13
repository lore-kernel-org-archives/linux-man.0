Return-Path: <SRS0=Zlmw=CW=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA45DC433E2
	for <linux-man@archiver.kernel.org>; Sun, 13 Sep 2020 08:29:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B5922078D
	for <linux-man@archiver.kernel.org>; Sun, 13 Sep 2020 08:29:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="quHivYdJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725921AbgIMI3F (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sun, 13 Sep 2020 04:29:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725914AbgIMI3C (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sun, 13 Sep 2020 04:29:02 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91230C061574
        for <linux-man@vger.kernel.org>; Sun, 13 Sep 2020 01:29:01 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id q9so7892700wmj.2
        for <linux-man@vger.kernel.org>; Sun, 13 Sep 2020 01:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wyCWos4r4aFbEeT/ss6hqJBv/Q21EU4IC5ir46LgCwI=;
        b=quHivYdJM+p+czXwHjHwFp+LPpMHeehiXf1gK0gRMmbWm1fPV95mXpCR8QirrGwzY0
         T9YiMj9MlivSPVDi98JY/HuZkD3hexWWqbe96MU/A2FGWY0SMTbq9YgDSzFc3pg122zP
         yPowbEQizIfVbahpSvc7fep52Ls8BfKPQfBT80MtMn4p0EZLHtvtnJwZSkVOoixGOnPN
         4vVwiRHmuF5/wyzW3rL/KEXQGJHL33ZSOeR/CbrcNCUEKYw8LiMFqML8eHvFEatEDOAd
         vvOKrN3dzOFwNfOY1SKxFGABYbtryQN9Et9Fpv8co2e5z2qSPNyNrXpB4qIs8WC875Bz
         KQmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wyCWos4r4aFbEeT/ss6hqJBv/Q21EU4IC5ir46LgCwI=;
        b=WTIX+BPU3McsbEWF6n4Pl9lR42d7hdQ7YoCoSQC1Szo42/GrUm0wVGcLNw6+uyZZLu
         +Mz5ni7kSI5l8rGowCqdng0I00ymTFZMoEtjs4hv4pHNUyLUpdus8tL8FIt83uWFp5WL
         mWO7Y8guT5vrgQrN/IMFwTfu7X2xAqexz8wIOrVOF7fI7ZZl5Ukc/e5FLxmSLuQ34X4U
         E1j1WKkhmqfv6kTLIrPOdUcv2aodLtzKlx/hCeNn/apfyxvlFy1U1ecA6OCfAU6lvAjV
         v3hfNwqVeglVCYRGB+JJpYSPJ3eANH9lVPO0Rbs43rnrCOcUw2yVhkFDqv7fuGb5QJKJ
         g/Iw==
X-Gm-Message-State: AOAM5312nWnHAzLcgRLXAxCIFTh2cpoEQ9jSEBBnBnNL4gfnsZYtqrO2
        CZX58kR0eX2f1Hax/ncr9IcbEzgrq3fCGg==
X-Google-Smtp-Source: ABdhPJzs7LwetYmR1Kdh05rxssSZuJjok/YDFsy7xlMVNHSBhIUmOxZIxh54CAELg91EZrszKts8Sw==
X-Received: by 2002:a1c:a784:: with SMTP id q126mr9632072wme.38.1599985739970;
        Sun, 13 Sep 2020 01:28:59 -0700 (PDT)
Received: from [192.168.0.160] ([93.115.133.118])
        by smtp.gmail.com with ESMTPSA id t15sm13546223wmj.15.2020.09.13.01.28.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2020 01:28:59 -0700 (PDT)
Subject: Re: [PATCH 05/12] getpwent_r.3: Cast 'uid_t' to 'intmax_t' for
 printf()
To:     "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc:     linux-man@vger.kernel.org
References: <20200911231411.28406-1-colomar.6.4.3@gmail.com>
 <20200911231411.28406-6-colomar.6.4.3@gmail.com>
 <867a2a99-5d14-6c01-62fc-f4daef538289@gmail.com>
From:   Alejandro Colomar <colomar.6.4.3@gmail.com>
Message-ID: <b686b723-1daf-54ac-db56-2b45021b40e2@gmail.com>
Date:   Sun, 13 Sep 2020 10:28:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <867a2a99-5d14-6c01-62fc-f4daef538289@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Hi Michael,

On 9/13/20 8:01 AM, Michael Kerrisk (man-pages) wrote:
> Casting to long is the historical practice here, and should be sufficient,
> don't you think? I realize there's an argument for making all of these
> system data type casts intmax_t / uintmax_t. But the counterarguments
> (admittedly not compelling), are:

I was casting to (long) until I accidentally met with a cast to
(intmax_t) in ftw.3 (now I realize it was the only one in all of the
pages; lucke me).

I saw there a good point in using those types and tried it to see what
you think about them.  I still haven't sent you a big patchset with
s/(long)/(intmax_t)/ because I was waiting for this discussion :)

>
> * Some people might still be confined to a pre C-99 world

I guess that people are dealing with very special hardware/software
and can be trusted to understand what the C99 types are and which
pre-C99 do the job for them; intmax_t.3 might also help ;).

If someone doesn't live in such a special world and just doesn't
know the types, it's a good moment to learn them.

> * Churn (lots of changes)

True ...  But if changes are trivial enough, maybe a single big patch
can do it.

> * (long) is a sufficient cast for all of these types
>   (except off_t).

I don't like exceptions very much.  Maybe someone sees (long) all over
the place and thinks 'long' is enough everywhere and misuses it.

>
> Your thoughts?

Your thoughts?

Thanks,

Alex
