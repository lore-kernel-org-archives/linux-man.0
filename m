Return-Path: <SRS0=MTOS=76=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E34E9C433DF
	for <linux-man@archiver.kernel.org>; Wed, 17 Jun 2020 12:26:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9DC4320CC7
	for <linux-man@archiver.kernel.org>; Wed, 17 Jun 2020 12:26:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=jguk.org header.i=@jguk.org header.b="mbT7wH2E"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725901AbgFQM0Z (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Wed, 17 Jun 2020 08:26:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725860AbgFQM0Z (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Wed, 17 Jun 2020 08:26:25 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77BB7C061573
        for <linux-man@vger.kernel.org>; Wed, 17 Jun 2020 05:26:23 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id r7so2150952wro.1
        for <linux-man@vger.kernel.org>; Wed, 17 Jun 2020 05:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jguk.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xqyfOwzU2G5TV7uvCFjzCV2McV62EnLpX6tN9Uc33HI=;
        b=mbT7wH2EdMxQt6qoTukvKFeXt7fAX3CwXjI5YcKmaJiXvhsjz53U+q/6UdzBwg96Z9
         ttYJYxGRYsXGdC5grffgV6eCwFjW2a2tyM5rjaQlfeBCFqNDuKEAZ31W6Fb7hnKiNgpn
         23gDesvgXG9zKzm45K45171I8gh1/ZfhTBdwrJCxm3x91Wqk61c/fyqTeSJP2CQysvf8
         b5qMh+SwV+v5FQoEBGltVZ18Cr/BdVWtJDUyde2s+0myqkMQbECpc6DOYSx4+RjdkHl/
         fIL4wHgcaaA3x70GgK/vuWmzkD/sgZvQsLRvsbGK9ayUGUBnaREtUsWHonblh30rIh1f
         kC2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xqyfOwzU2G5TV7uvCFjzCV2McV62EnLpX6tN9Uc33HI=;
        b=BNIV0p0uTERAzq3MYO+buTSvvDWe48be//OpvtoheSJr/iPv94djbFAX97KtHt3Q/z
         MlXLQux0E3/uNUKYkpBDq4QYWmYEpZ9en1kqS73JBI/X/8/dkxQJ2D/9ZzoZoCcAC5hQ
         71cUFkWARxtBxYXCPkR0mm8XaxSw6gcORheSyIZHQ7DBYBN3BhVAKrATkgI1z5+TfHrC
         /DroVsii7RUssFo/RH4t/L10EohVIdrDn/EebfU9ASq0lugp3HWwgQrwpI/17YtGLK3U
         EcDd5CUS9C3YOqdZrpKSN/C+FNy1vqkoZXCVPrO1y9NZdBGw7Ss1WugDxpeSiBcH243U
         FmqQ==
X-Gm-Message-State: AOAM533jWAkOAh/fSR3GvfYtZAOz2x7tnXemoCOuoZkGGljt/ziW9Vls
        RwkpOcsOfV410Ju7F91ao/sExWeJrXA=
X-Google-Smtp-Source: ABdhPJyhkJ846eT2KXAFv3By/4gr3dNLuopJ1YjEMQ5B/amLOE/ny8AKZUtNnqt1rwTUmw2RYLIo6Q==
X-Received: by 2002:adf:fc0c:: with SMTP id i12mr8176014wrr.365.1592396781981;
        Wed, 17 Jun 2020 05:26:21 -0700 (PDT)
Received: from [192.168.0.12] (cpc87281-slou4-2-0-cust47.17-4.cable.virginm.net. [92.236.12.48])
        by smtp.gmail.com with ESMTPSA id j18sm35138619wrn.59.2020.06.17.05.26.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2020 05:26:21 -0700 (PDT)
Subject: Re: gettid
To:     Ponnuvel Palaniyappan <pponnuvel@gmail.com>
Cc:     Jakub Wilk <jwilk@jwilk.net>,
        Michael Kerrisk <mtk.manpages@gmail.com>,
        linux-man@vger.kernel.org
References: <23ca3363-5a24-9862-4872-811678527b50@jguk.org>
 <20200617102232.7zzi2klj3onh2nur@jwilk.net>
 <cbbb7e4f-8774-c598-e9d3-6f13142dc3d3@jguk.org>
 <CAOL8xrW0O0gmVjx03ji9XEsLb_gg=zZ336P0Y=21KbKdOhM_vw@mail.gmail.com>
From:   Jonny Grant <jg@jguk.org>
Message-ID: <880daed8-229b-1637-7b6d-a7126433b26e@jguk.org>
Date:   Wed, 17 Jun 2020 13:26:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAOL8xrW0O0gmVjx03ji9XEsLb_gg=zZ336P0Y=21KbKdOhM_vw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org



On 17/06/2020 13:10, Ponnuvel Palaniyappan wrote:
> The default C++ mode, when no -std= is specified, for g++ 9.3.0 is
> gnu++14 (it's the same for g++ 10.1.0, too).
> 
>> Looks like it is set by default, even when specifying the C++ standard version for g++
> Why this happens is explained in libstd++'s faq:
> https://gcc.gnu.org/onlinedocs/libstdc++/faq.html#faq.predefined

Fair enough
