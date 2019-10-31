Return-Path: <SRS0=VfPy=YY=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79061CA9EC3
	for <linux-man@archiver.kernel.org>; Thu, 31 Oct 2019 06:06:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4B77A20650
	for <linux-man@archiver.kernel.org>; Thu, 31 Oct 2019 06:06:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ak5vz9gz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726370AbfJaGGr (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Thu, 31 Oct 2019 02:06:47 -0400
Received: from mail-wm1-f49.google.com ([209.85.128.49]:39391 "EHLO
        mail-wm1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726331AbfJaGGq (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Thu, 31 Oct 2019 02:06:46 -0400
Received: by mail-wm1-f49.google.com with SMTP id t26so518331wmi.4
        for <linux-man@vger.kernel.org>; Wed, 30 Oct 2019 23:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=cc:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wJRgSEkHcMfcw4cY6J+zeBx5WkRuwuxzxqXDZpGqyCY=;
        b=ak5vz9gzN/WmDV0soOpzhX7EewvEyBzhsJXqug/E1GoL1cXjmG5DQ16coDb9sS3WJs
         GtLIQW7jpxZbw4lAeirDqDf9YJieKYfOi9PWd8yKjwf0Oz6IReFunddlAkq7UWZ7dacA
         ksE5xyU05HOjf1jQ6FJeBi9UmGjVj9smIk5MY5MfVEe8qM9fsz79AxZgTNVIMgXo/eg6
         4c1gbuJaCRG/9SERNuzqJTPT3tnXRt2xuRooXgLpEp4IO7Jj7fbQXa5cGPM18ggnNe9A
         KJheeSewh7caHw8V87YKC9FkHBIGUoIZiOHNPJRahvnkY1ieOOki1XCpMYcybPcKCfDh
         uHLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:cc:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wJRgSEkHcMfcw4cY6J+zeBx5WkRuwuxzxqXDZpGqyCY=;
        b=W5Xm3tAB4+L8+h2KBme1YK3UGeoKTjdmH0spC73n3LgcKxqzhOQttQ8TNqMoQ6OeKm
         pM/71Ng8HjHE0X/hG8oEAR/VemCdMcjeT11FdOa/eneiNkg7ygaOKQGoyMPpxCR3VwHW
         GG6sm8t0xlIw8tqKAWrvxcDWwxX3rREBOg2TAkDk34iVSqjfjMEF3GuUJzk3kQVDLoYO
         UjtlygveCeF8tFNBuqS8ohJVE9GRKCXzfG3e5odWLoLGfwbB50bqh0djZYokU2EaNF32
         OfDlpLII2iRTrqa1m87BveUpFSlzJ9Ig3enuD7Z3yuH+blbZ9buy8sI8qRfFg3oIpXZK
         2OHQ==
X-Gm-Message-State: APjAAAULaSJ/T1Fm+3nFpnlSzV/c68xn0aNXZIp4ht0ythrzg0Xuhd45
        VJBz0Eps+A1CFLaWNR7q3hahSU6EPiQ=
X-Google-Smtp-Source: APXvYqx2zzkzKEcd9uj0H/t9hvVV6uwNqvw9IsNyJDcn/0/uPDkAVwlKT/wQBEyNmLBPu6hqL01UFw==
X-Received: by 2002:a7b:cd05:: with SMTP id f5mr3027775wmj.24.1572502004461;
        Wed, 30 Oct 2019 23:06:44 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2f38:d7b0:e8b5:a4a9:346b:8c65? ([2a01:e35:2f38:d7b0:e8b5:a4a9:346b:8c65])
        by smtp.gmail.com with ESMTPSA id u68sm2737847wmu.12.2019.10.30.23.06.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2019 23:06:43 -0700 (PDT)
Cc:     mtk.manpages@gmail.com, linux-man <linux-man@vger.kernel.org>
Subject: Re: For review: documentation of clone3() system call
To:     "G. Branden Robinson" <g.branden.robinson@gmail.com>
References: <CAKgNAkjo2WHq+zESU1iuCHJJ0x-fTNrakS9-d1+BjzUuV2uf2Q@mail.gmail.com>
 <20191026022805.nwdjdnteapbudnyi@localhost.localdomain>
From:   "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Message-ID: <26fdf724-121b-a722-94bf-6b94d1c87565@gmail.com>
Date:   Thu, 31 Oct 2019 07:06:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20191026022805.nwdjdnteapbudnyi@localhost.localdomain>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Hi Branden,

On 10/26/19 4:28 AM, G. Branden Robinson wrote:
> At 2019-10-25T18:59:31+0200, Michael Kerrisk (man-pages) wrote:
> [...]
>>                clone()         clone(3)        Notes
> [...]
>>         Glibc does not provide a  wrapper  for  clone(3);  call  it  using
>>         syscall(2).
> [...]
> 
> "clone3()" is probably what was intended.

Thanks. I happened to already notice and fix this.

Cheers,

Michael

