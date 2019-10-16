Return-Path: <SRS0=seh5=YJ=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62AEBECE599
	for <linux-man@archiver.kernel.org>; Wed, 16 Oct 2019 19:48:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2F73A21835
	for <linux-man@archiver.kernel.org>; Wed, 16 Oct 2019 19:48:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i+mgtuVJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394568AbfJPTsL (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Wed, 16 Oct 2019 15:48:11 -0400
Received: from mail-wr1-f54.google.com ([209.85.221.54]:32900 "EHLO
        mail-wr1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727148AbfJPTsK (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Wed, 16 Oct 2019 15:48:10 -0400
Received: by mail-wr1-f54.google.com with SMTP id b9so29445417wrs.0
        for <linux-man@vger.kernel.org>; Wed, 16 Oct 2019 12:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=cc:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8W9e+GemsQBnARjmgw7/vE22grqiMJ7bJFKEJSmPtTg=;
        b=i+mgtuVJWGeEM1B7uAnSGmnK3LDY38BojteiAVU52MaTvmmyTD64F1XUy9xgvx2gOL
         R0mUIjY9vXzLNIN2C08f2m56q7EAZfDf/Sw8dIb9M2CC4FU+mHS6IDuhj04UDvth+V2J
         aMiZecz/qCEofuh6c+svD00RS+7L4RGbDUIp741JgEqC2h+Jj3ADix9UJn1TIHbshXXs
         KyE5ApwW8ohg7p9ytnzg+3/6OSfLJ350Xhw4n5ouCy5RafPoQJIG1o2wmTT3bxacIHHS
         sTpPR/WM77a0Jp26weUK3M/o1n1HX6WRiKytrM28pPTc+0svvOejCMsxL/XOWHUDYgZa
         vFTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:cc:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8W9e+GemsQBnARjmgw7/vE22grqiMJ7bJFKEJSmPtTg=;
        b=lECE9CfpaBiMEsHZTrb5H7+rv3RX6kh/LS723htayf9mkSi88l1Us23meSY+m1B7vb
         MKXC9V2YzQ6OuUOikeJdoD+o8wAcbSKR4ND6UggnMo9Pg5MQCcDwkeRwMoY6nm6Qc2k8
         X7xJOugzgEXVkTjJRT1dXpAmb0e5txUHeh1nTNX65M9KOCSgssvEXTvX0n7iw5ISt/h/
         ua+r+E8wN1cNXbAsXeWajUmC+dWZdhILWN1N144yFrZExScGFIrlE7zPcB9pGq3cAzCD
         l9QAJZZ/pFmHOQOFBEfMDeCX+O6aWXDMT8fjjNFUvCdi7k5AF1NcVyN1i4QVpWwbTvnL
         UYGg==
X-Gm-Message-State: APjAAAXAiT56ccnSCla1xkc7FYp9jZVwP6hNh7hwCGmQRiMtfhCeNcVL
        3sVB1upiLcGqf8emasU4rsRyZ/wq
X-Google-Smtp-Source: APXvYqyo1I/vIHQewO5rqWaSG1stHhd/650ET+tv4YTNPA/ydFbTef9i2ynR01kde1xyxYLkppHybA==
X-Received: by 2002:a5d:4ec1:: with SMTP id s1mr3966024wrv.42.1571255288287;
        Wed, 16 Oct 2019 12:48:08 -0700 (PDT)
Received: from ?IPv6:2001:a61:3a5c:9a02:28a9:8c3d:9a0a:df63? ([2001:a61:3a5c:9a02:28a9:8c3d:9a0a:df63])
        by smtp.gmail.com with ESMTPSA id w18sm3553858wmc.9.2019.10.16.12.48.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Oct 2019 12:48:07 -0700 (PDT)
Cc:     mtk.manpages@gmail.com, linux-man@vger.kernel.org
Subject: Re: abort(3) manpage
To:     Mikael Magnusson <mikachu@gmail.com>
References: <CAHYJk3QmNT1OSFQ=jBX0qPAe+QZGL13oecnXKOBU0yFuB9Ar1Q@mail.gmail.com>
From:   "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Message-ID: <b65fcc71-76e6-83a7-5cd2-61e6803ba9bc@gmail.com>
Date:   Wed, 16 Oct 2019 21:48:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAHYJk3QmNT1OSFQ=jBX0qPAe+QZGL13oecnXKOBU0yFuB9Ar1Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

On 10/16/19 12:36 AM, Mikael Magnusson wrote:
> The abort(3) manpage starts with
>   The abort() first unblocks the SIGABRT signal,
> the word "function" is missing between "abort()" and "first".

Thanks, Mikael. Fixed.

Cheers,

Michael



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
