Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93A37C4338F
	for <linux-man@archiver.kernel.org>; Sun,  8 Aug 2021 01:13:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 78A2F60F02
	for <linux-man@archiver.kernel.org>; Sun,  8 Aug 2021 01:13:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229882AbhHHBON (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sat, 7 Aug 2021 21:14:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229865AbhHHBON (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sat, 7 Aug 2021 21:14:13 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F469C061760
        for <linux-man@vger.kernel.org>; Sat,  7 Aug 2021 18:13:55 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id u2so12434015plg.10
        for <linux-man@vger.kernel.org>; Sat, 07 Aug 2021 18:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=cc:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CCJMcmIKk1slFnMN3s6iZLnbd+jyDtFeH4BxiFFS+/8=;
        b=n+qcuV4ct9UBC7WnlwYR2WO/it14qzNK2+SjqYBjNKTZSloAVhaTLN/kcZBnxQF9Hm
         XCpqxMxbwUAmY65e4l3095ijgoJMMAF1HAQ8nZRCvcnKEkprtkBBaSjfiX8i9vvP2qZG
         MskQ6yTUwUyAeJtg0Y/DCFOAov9naPQof6D2UD+Kt51PLgq2rE2Nq2noRpnNKxVF0IJB
         J4wmZa4OMZTA8pYy57BOKD4C7AHN0dxX3JFIuKceqlfU9NBjgcfYyMIU70rIvaw8k9iJ
         S08y2sFrhtpaK3C1fD75qRqt3MT6hRSs+jDdZI4U0QZXXi/fFzx3a+nzksLse9N2ZOce
         HdLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:cc:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CCJMcmIKk1slFnMN3s6iZLnbd+jyDtFeH4BxiFFS+/8=;
        b=YCT6xuzA5PpxpvH5DqXeOSjOER/SIDGXPVHgIGa36WcVyvNp8KJilphlmVqZmBwYCw
         J5rHHhIci27LngD0O6b9oXEaG4BAUeqii5rxEM6CM9mIB6yw2JhB2gDD8JA0JR/ACvLv
         Aja7nuKRQzm9beStsqk7Ut1Yv94fEVGXT3kMFFssrJSkOBFhOlDoQR51gU562X71LNg8
         +EvP7K/V0zEWtHIL2pKYv9l90TA2ngUHUhWrPY9k8gWscONWujstcYTzqyC19/TbQxH1
         zHDY+ylNJ26v9ljVQhwee64W5xbORWvzMrHlv0mKRGrBm/YxrGCdE6mChwqCsEvhv7YP
         WAiA==
X-Gm-Message-State: AOAM530QDQzzZFRCNBZrrNsE3+nlSDlXca0E2mcJi7H/IhNPnyBtekq4
        fWev+Y3bwhS8+F3EYzTSjTV4f1cdUCo=
X-Google-Smtp-Source: ABdhPJzVuz4Zmo0lPJXjMO/LOpvX2yobflORQeAiOoA4hO1MeG/3wNAHCI2Ezd60sRm4NxWibwaTZQ==
X-Received: by 2002:a63:57:: with SMTP id 84mr15557pga.241.1628385235005;
        Sat, 07 Aug 2021 18:13:55 -0700 (PDT)
Received: from [192.168.1.71] (122-61-176-117-fibre.sparkbb.co.nz. [122.61.176.117])
        by smtp.gmail.com with ESMTPSA id p21sm11201606pfo.8.2021.08.07.18.13.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Aug 2021 18:13:54 -0700 (PDT)
Cc:     mtk.manpages@gmail.com, Jakub Wilk <jwilk@jwilk.net>,
        linux-man@vger.kernel.org
Subject: Re: [PATCH 21/32] seccomp_unotify.2: tfix
To:     Alejandro Colomar <alx.manpages@gmail.com>
References: <20210728202008.3158-1-alx.manpages@gmail.com>
 <20210728202008.3158-22-alx.manpages@gmail.com>
From:   "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Message-ID: <edd81f10-de2b-3a48-eed4-642d9e1c443b@gmail.com>
Date:   Sun, 8 Aug 2021 03:13:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210728202008.3158-22-alx.manpages@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Hi Jakub, Alex,

On 7/28/21 10:19 PM, Alejandro Colomar wrote:
> From: Jakub Wilk <jwilk@jwilk.net>
> 
> Remove duplicated word.
> 
> Signed-off-by: Jakub Wilk <jwilk@jwilk.net>
> Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>

Thanks. Patch applied.

Cheers,

Michael

> ---
>  man2/seccomp_unotify.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/seccomp_unotify.2 b/man2/seccomp_unotify.2
> index ae449ae36..2605be9fb 100644
> --- a/man2/seccomp_unotify.2
> +++ b/man2/seccomp_unotify.2
> @@ -1105,7 +1105,7 @@ Alternatively, in the
>  example, the supervisor might use
>  .BR poll (2)
>  to monitor both the notification file descriptor
> -(so as as to discover when the target's
> +(so as to discover when the target's
>  .BR accept (2)
>  call has been interrupted) and the listening file descriptor
>  (so as to know when a connection is available).
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
