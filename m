Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35F23C5519F
	for <linux-man@archiver.kernel.org>; Wed, 18 Nov 2020 16:22:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C1371247DC
	for <linux-man@archiver.kernel.org>; Wed, 18 Nov 2020 16:22:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Su7vdk+6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726089AbgKRQWA (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Wed, 18 Nov 2020 11:22:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbgKRQWA (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Wed, 18 Nov 2020 11:22:00 -0500
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com [IPv6:2607:f8b0:4864:20::a44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1229C0613D4
        for <linux-man@vger.kernel.org>; Wed, 18 Nov 2020 08:21:59 -0800 (PST)
Received: by mail-vk1-xa44.google.com with SMTP id n189so600991vkb.3
        for <linux-man@vger.kernel.org>; Wed, 18 Nov 2020 08:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K8RmJ6583kn36tl0y/pk4VUasnmo3J+EkhpquBGIyPY=;
        b=Su7vdk+6Pxa70+YWzlJJRhYHAX+NkgMlwLd1krqBnxjE8W+xsLtD0Y3jd/v/ltbDJZ
         1ur16lR1idrNj7+br4H30Vh25RwzSDxvJN4rkYApjeXwlGBVTLj+kj4s7ZADOtAZlq4b
         +jLdEsmRUqhweHgdzxzkrIm7M1rwhsFVMegPg+lDK8R1r/kNTdaP8Bjz1iCyLLkHAIUv
         UDkgW4bRqgtNAsznQR2cg1rkWroKPpuKz50g8emoJArV9W8nvzQQ6kgYTO17Sga3UVyB
         ++nqQ9isEzgUJRCrvZ0KI7k6zgNGJAFv73g/ygu3rKn8Rr0ubHeJuLjqZs+yRfFF9aNV
         esuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K8RmJ6583kn36tl0y/pk4VUasnmo3J+EkhpquBGIyPY=;
        b=hy7psqznIh6fZEIECi8V59oHPHEvOGIM2fS5vcmry5fYnDswTgs077FICXWxrPr556
         zuBWp2672VTVWJB601QLkY50oLpRGeIIIlPrTdh1Ec9YVT2cpYWQontk5Y4/i4ByiZL9
         9op0od/T5zvyFMOTYFjtuX4KJSO7lOacAeO26M/LreSWB7Ju8xKh/vrUe6+8sayaA6Ea
         sLgC0+MTI5Bu7WR9tddd5MtB9FrYWlXKmzk0CwVAuNvpUvFqLeeGrIACsPMHlxULp5dX
         uWE2Of4KsDUGTUArrelJ6aZPf7Pk8JLrornjL2pUQUEtD+T0/miKzdN8eHRu21sbk2BU
         jLKg==
X-Gm-Message-State: AOAM532BmzvZiKwA1OdvQ+JiykvwYmQTEtVLRSQ9RyENgkoXNw/x4wCF
        C80UcezqqM1+30BjHfZdOVWAzMK4cF4=
X-Google-Smtp-Source: ABdhPJxMIzSEaRwP+B6gBh3d5XiDD3+fHtCacYB9oVYTDnOsTnyzzYmCBavwEPD4H6Tpf8Zv10OVKg==
X-Received: by 2002:a1f:9004:: with SMTP id s4mr4010035vkd.22.1605716518447;
        Wed, 18 Nov 2020 08:21:58 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id h16sm2347799uaw.7.2020.11.18.08.21.57
        for <linux-man@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2020 08:21:57 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id p12so859227uam.1
        for <linux-man@vger.kernel.org>; Wed, 18 Nov 2020 08:21:57 -0800 (PST)
X-Received: by 2002:ab0:16da:: with SMTP id g26mr3072595uaf.122.1605716516969;
 Wed, 18 Nov 2020 08:21:56 -0800 (PST)
MIME-Version: 1.0
References: <20201118144617.986860-1-willemdebruijn.kernel@gmail.com> <20201118144617.986860-2-willemdebruijn.kernel@gmail.com>
In-Reply-To: <20201118144617.986860-2-willemdebruijn.kernel@gmail.com>
From:   Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date:   Wed, 18 Nov 2020 11:21:19 -0500
X-Gmail-Original-Message-ID: <CA+FuTSdFTDFwOVyws19CaAP_6+c5gTrvA0ybvDo3LJ-VhPz1eQ@mail.gmail.com>
Message-ID: <CA+FuTSdFTDFwOVyws19CaAP_6+c5gTrvA0ybvDo3LJ-VhPz1eQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] epoll: add nsec timeout support with epoll_pwait2
To:     linux-fsdevel@vger.kernel.org
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Soheil Hassas Yeganeh <soheil.kdev@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, Shuo Chen <shuochen@google.com>,
        linux-man@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

On Wed, Nov 18, 2020 at 9:46 AM Willem de Bruijn
<willemdebruijn.kernel@gmail.com> wrote:
>
> From: Willem de Bruijn <willemb@google.com>
>
> Add syscall epoll_pwait2, an epoll_wait variant with nsec resolution
> that replaces int timeout with struct timespec. It is equivalent
> otherwise.
>
>     int epoll_pwait2(int fd, struct epoll_event *events,
>                      int maxevents,
>                      const struct timespec *timeout,
>                      const sigset_t *sigset);
>
> The underlying hrtimer is already programmed with nsec resolution.
> pselect and ppoll also set nsec resolution timeout with timespec.
>
> The sigset_t in epoll_pwait has a compat variant. epoll_pwait2 needs
> the same.
>
> For timespec, only support this new interface on 2038 aware platforms
> that define __kernel_timespec_t. So no CONFIG_COMPAT_32BIT_TIME.
>
> Changes
>   v3:
>   - rewrite: add epoll_pwait2 syscall instead of epoll_create1 flag
>   v2:
>   - cast to s64: avoid overflow on 32-bit platforms (Shuo Chen)
>   - minor commit message rewording
>
> Signed-off-by: Willem de Bruijn <willemb@google.com>
>
> ---

> diff --git a/arch/x86/entry/syscalls/syscall_32.tbl b/arch/x86/entry/syscalls/syscall_32.tbl
> index 109e6681b8fa..9a4e8ec207fc 100644
> --- a/arch/x86/entry/syscalls/syscall_32.tbl
> +++ b/arch/x86/entry/syscalls/syscall_32.tbl
> @@ -447,3 +447,4 @@
>  440    i386    process_madvise         sys_process_madvise
>  441    i386    watch_mount             sys_watch_mount
>  442    i386    memfd_secret            sys_memfd_secret
> +443    i386    epoll_pwait2            sys_epoll_pwait2                compat_sys_epoll_pwait2

I should have caught this sooner, but this does not work as intended.

x86 will still call epoll_pwait2 with old_timespec32.

One approach is a separate epoll_pwait2_time64 syscall, similar to
ppoll_time64. But that was added to work around legacy 32-bit ppoll.
Not needed for a new API.

In libc, ppoll_time64 is declared with type struct __timespec64. That
type is not defined in Linux uapi. Will need to look at this some
more.
