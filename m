Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 439B5C6369E
	for <linux-man@archiver.kernel.org>; Wed, 18 Nov 2020 16:51:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D95912483B
	for <linux-man@archiver.kernel.org>; Wed, 18 Nov 2020 16:51:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="b7Z6EyXP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727966AbgKRQuq (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Wed, 18 Nov 2020 11:50:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:37352 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726643AbgKRQuq (ORCPT <rfc822;linux-man@vger.kernel.org>);
        Wed, 18 Nov 2020 11:50:46 -0500
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7AF9F2483B;
        Wed, 18 Nov 2020 16:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605718245;
        bh=qsoOEUiiSDhIbJk1yoympSyQi0isGZFJw9HB88FY0GI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=b7Z6EyXPTD/9sEhG7ZMPv/G6SLqjaEyvVLcpW6WQ4v4y+L/gnYXEFCPOBNeZbMrn0
         G0ojKy7PtDG6l9oXwOFzMLQ5cJyanYybxC5fzWzv+6EipxpzdAkTf7MXci8LdOyG15
         +rR9vk4b5/ybjgJauwqE0vcqa4yD1/XmO5CD8Ams=
Received: by mail-ot1-f43.google.com with SMTP id i18so2408033ots.0;
        Wed, 18 Nov 2020 08:50:45 -0800 (PST)
X-Gm-Message-State: AOAM532FuLBvQ9qFSjcEuPBg6Vk2MYOV6LSgbqR0NPyNoSRnEAg1hfDs
        qi+SJj/Yuus7GVKu5ttb/03wrfqNvBs/Omka6Gw=
X-Google-Smtp-Source: ABdhPJxupkceoVI99EaTH/OeU3OUcnij4CgpA5a8Wi79SEyNJovflKu43G/vaNsBQP8FnFO82UaoBBmRkGjoFVc/aXo=
X-Received: by 2002:a05:6830:22d2:: with SMTP id q18mr6434729otc.305.1605718244685;
 Wed, 18 Nov 2020 08:50:44 -0800 (PST)
MIME-Version: 1.0
References: <20201118144617.986860-1-willemdebruijn.kernel@gmail.com>
 <20201118144617.986860-2-willemdebruijn.kernel@gmail.com> <CA+FuTSdFTDFwOVyws19CaAP_6+c5gTrvA0ybvDo3LJ-VhPz1eQ@mail.gmail.com>
In-Reply-To: <CA+FuTSdFTDFwOVyws19CaAP_6+c5gTrvA0ybvDo3LJ-VhPz1eQ@mail.gmail.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Wed, 18 Nov 2020 17:50:28 +0100
X-Gmail-Original-Message-ID: <CAK8P3a09jUv8YiuZAi5Q-SW4k20Pw0mXdHj9DVznbQ=Kxm2gig@mail.gmail.com>
Message-ID: <CAK8P3a09jUv8YiuZAi5Q-SW4k20Pw0mXdHj9DVznbQ=Kxm2gig@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] epoll: add nsec timeout support with epoll_pwait2
To:     Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc:     Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Soheil Hassas Yeganeh <soheil.kdev@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, Shuo Chen <shuochen@google.com>,
        linux-man <linux-man@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

On Wed, Nov 18, 2020 at 5:21 PM Willem de Bruijn
<willemdebruijn.kernel@gmail.com> wrote:
> > diff --git a/arch/x86/entry/syscalls/syscall_32.tbl b/arch/x86/entry/syscalls/syscall_32.tbl
> > index 109e6681b8fa..9a4e8ec207fc 100644
> > --- a/arch/x86/entry/syscalls/syscall_32.tbl
> > +++ b/arch/x86/entry/syscalls/syscall_32.tbl
> > @@ -447,3 +447,4 @@
> >  440    i386    process_madvise         sys_process_madvise
> >  441    i386    watch_mount             sys_watch_mount
> >  442    i386    memfd_secret            sys_memfd_secret
> > +443    i386    epoll_pwait2            sys_epoll_pwait2                compat_sys_epoll_pwait2
>
> I should have caught this sooner, but this does not work as intended.
>
> x86 will still call epoll_pwait2 with old_timespec32.
>
> One approach is a separate epoll_pwait2_time64 syscall, similar to
> ppoll_time64. But that was added to work around legacy 32-bit ppoll.
> Not needed for a new API.
>
> In libc, ppoll_time64 is declared with type struct __timespec64. That
> type is not defined in Linux uapi. Will need to look at this some
> more.

The libc __timespec64 corresponds to the __kernel_timespec64
structure in uapi. It is defined to only have 'long' nanoseconds
member because that's what c99 and posix require, but the bits
are in the position that matches the lower 32 bits of the 64-bit
tv_nsec in the kernel, and get_timespec64() performs the
necessary conversion to either check or zero the upper bits.

I think all you need in user space is to pass the timeout as a
__timespec64 structure and add a conversion in the exported
library interface.

       Arnd
