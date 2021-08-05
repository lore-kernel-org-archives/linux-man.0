Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A44CC4338F
	for <linux-man@archiver.kernel.org>; Thu,  5 Aug 2021 07:04:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1A0E860F58
	for <linux-man@archiver.kernel.org>; Thu,  5 Aug 2021 07:04:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235809AbhHEHE1 (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Thu, 5 Aug 2021 03:04:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238035AbhHEHEY (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Thu, 5 Aug 2021 03:04:24 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C026DC061765
        for <linux-man@vger.kernel.org>; Thu,  5 Aug 2021 00:04:08 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id h13so5110693wrp.1
        for <linux-man@vger.kernel.org>; Thu, 05 Aug 2021 00:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=76c16sdOYREh+nLA62WmhMAlqg14LqK+hzoezj0qS2g=;
        b=i4eHbHXeSYdjNLGUu2WuZYUtg9EdbabX5VBX+5csnU1nQd5qROWKGVtiD6M1nv1rZH
         y0nX5xUELYr/EBrih4XRYraggcn/1onyiqGm/KyoKAgG4UtRWoOgcckAWXRkgJpdqToz
         BYlq9DEocVU9wB6QlwS5c2QYsbV43ObPyb1PUwnRlcFHSeTNmP5YRKjjufvMq32NE8+y
         ZgBvGcmi1SOltuDulZBaPNDSgB0OW3nOwPwNxzrTyzb+qDFADtuFTDRNIFX5P3H/A9WO
         /+b2M4stZK/XKK+hN+M7DtmqGoENko+4aIsQcRcRm+P36Jy8FWhTf1YjDjSH3rqt17cC
         aW/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=76c16sdOYREh+nLA62WmhMAlqg14LqK+hzoezj0qS2g=;
        b=iOISgZMd+8R+FBhaFR/TL6TT57uAHcTLfdrAL2aYWSJrG/MDy00anncguOJT2qAhvq
         eHWIZxww19XmxRzcqp4Us6VYM3TjZsbLraX1apt9+VvDU6Dev1MdpWH/tc/n/dVpCxUu
         7swWdHVTunrCvjgmj43VL2IP9aBJvyKIyRqvmXMggsKme+/tq6asj5d55eQ06R4DWCCn
         GuVJLMQGwOXNRu+dFPwkSZ2kiLx5wFX8aa7rbd8r9U9lyOdoVqwE/SPihm3Km7xGAdze
         jm4M+IUr9PKRDsMwWgjjWYhqc/AJ4+4MQRmFdP7nWv5T5jjk36waxMN5i+Z99UKqCm7m
         6RGw==
X-Gm-Message-State: AOAM5329CsOTapxGutVHRDU57UrnuGT44bZUcUWMwfbazKUpa6lbaFVM
        +PTIqXCWJ61YRO08UYvwyng=
X-Google-Smtp-Source: ABdhPJwAAY94Glpi0CYGxGm0pd6IgOTPORpnbWJZ7js8OWVBf1PAcgiLXg891YXSeJTcqhqr0Rg6ug==
X-Received: by 2002:a5d:4a44:: with SMTP id v4mr3304395wrs.219.1628147047346;
        Thu, 05 Aug 2021 00:04:07 -0700 (PDT)
Received: from [10.8.0.10] ([195.53.121.100])
        by smtp.gmail.com with ESMTPSA id g12sm5000565wri.49.2021.08.05.00.04.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Aug 2021 00:04:07 -0700 (PDT)
Subject: Re: [pr] nscd.conf.5: describe reloading, clarifications, v3
To:     Greg Banks <gbanks@linkedin.com>
Cc:     Michael Kerrisk <mtk.manpages@gmail.com>,
        "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>,
        DJ Delorie <dj@redhat.com>,
        "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
References: <BL0PR2101MB13165DA16EA08B6ECF60D1CAA1F19@BL0PR2101MB1316.namprd21.prod.outlook.com>
From:   "Alejandro Colomar (man-pages)" <alx.manpages@gmail.com>
Message-ID: <0c851411-caf6-5178-09c5-f5d54fb12c97@gmail.com>
Date:   Thu, 5 Aug 2021 09:04:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <BL0PR2101MB13165DA16EA08B6ECF60D1CAA1F19@BL0PR2101MB1316.namprd21.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Hi greg,

On 8/4/21 3:46 PM, Greg Banks wrote:
> The following changes since commit 4a4b5ecfe1f8c5b5f7eaf0e28778db6c6991ae33:
> 
>    nscd.conf.5: describe reloading, clarifications, v3 (2021-08-04 06:17:39 -0700)
> 
> are available in the Git repository at:
> 
>    git@github.com:gnb/man-pages.git nscd.conf.5
> 
> for you to fetch changes up to 4a4b5ecfe1f8c5b5f7eaf0e28778db6c6991ae33:
> 
>    nscd.conf.5: describe reloading, clarifications, v3 (2021-08-04 06:17:39 -0700)
> 
> ----------------------------------------------------------------
> 

Okay, this works.  Could you please do this and also send the patch to 
the list inline (that way it's easier to comment)?  If it is reformatted 
and doesn't arrive to the list, I'll forward it.

About the patch itself, please respect the right margin at column 80, 
and also s/i.e./i.e.,/

Thanks,

Alex


-- 
Alejandro Colomar
Linux man-pages comaintainer; https://www.kernel.org/doc/man-pages/
http://www.alejandro-colomar.es/
