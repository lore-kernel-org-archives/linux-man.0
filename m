Return-Path: <SRS0=EgWi=EA=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FCC2C388F7
	for <linux-man@archiver.kernel.org>; Sun, 25 Oct 2020 11:41:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C2609222B9
	for <linux-man@archiver.kernel.org>; Sun, 25 Oct 2020 11:41:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D6rRtvS2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1415448AbgJYLlF (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sun, 25 Oct 2020 07:41:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731993AbgJYLlE (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sun, 25 Oct 2020 07:41:04 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B33BDC0613CE
        for <linux-man@vger.kernel.org>; Sun, 25 Oct 2020 04:41:04 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id f37so5586489otf.12
        for <linux-man@vger.kernel.org>; Sun, 25 Oct 2020 04:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=FsNJJVelriisZg4HIW+0jFy6LfvwhH/ch3cvGal6sVo=;
        b=D6rRtvS2trCc3KL4ERBWgZjQVHCDAA62k4uUq6ovChp5NREPPhaWC4oIgSnr9fRtpX
         fEhQmt45Uer9jnmTtNZDL1n3YNzC2LRCkhW6Xoe8oL6d4ZzwaqjL1/9RCDved/CmxgX+
         5rDmExZ+5QuH4wE39S7PcP13tbeolhGKYpjGsGKgeRHfLfYIeQrFCwTOxMIu2tWMrZcH
         NsW+a0uI1+L5R1IDk6MQDQEhXYvCTgQ4Z8DF51DDiY1jJ+29F1hQQOL4HILmsOBAm1Os
         wBDhJQj0egO69uUTc23zZ/9lTUagT8wnDUYrAo0lw+RzAXijcUKwaVPB74K9RPb3Nfoc
         LzzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=FsNJJVelriisZg4HIW+0jFy6LfvwhH/ch3cvGal6sVo=;
        b=RyoHoMsBRrcJivJfQ5b2J9CLh16rOEJkeyH9Zual5DaXp6/JZj/Ltje100U3jAR1/D
         FGHXT7+ac2FPjuSYnszEatnL0uZe2NjkaQTGsJ7BGZxbNnnm7dOgi1y3uTZTExcWWQ5L
         VkENf4tmgeKKsJlwc2ma85q24+sqO8y3umAJslPLshX4UvvCBZhFLgUDlXPek1ZPAOHx
         bLxLJzjOJeqJwSTtegZOJWfzFTpcQxhevZDW65P+dPXmgLanTMDAGBKH9PgmOhFmOEr5
         3oioljbDCopqKe7P539NzApIoa2JS+3hiUBxWfSccxvNlsEYGDTl+wdjb+wnNvPro21Q
         K5lw==
X-Gm-Message-State: AOAM531gjkC2srtwldZ4yOrityB8RafawJlu7ECEau9mHGSl9Hqkjmxf
        TNpSkSetjNNYnRKWIXHY0uChSDFv9oMdtRnYCfRKxPOQ
X-Google-Smtp-Source: ABdhPJxJNb/CUATkjSmexueLkmNqEvAeOTmDzs8z9srl7EntlUelAO8BlYLgOGrGvDrned6gVzmcOtRRcUFgeAXVwI8=
X-Received: by 2002:a05:6830:22eb:: with SMTP id t11mr9088882otc.114.1603626063967;
 Sun, 25 Oct 2020 04:41:03 -0700 (PDT)
MIME-Version: 1.0
References: <20201025102132.41223-1-colomar.6.4.3@gmail.com>
In-Reply-To: <20201025102132.41223-1-colomar.6.4.3@gmail.com>
Reply-To: mtk.manpages@gmail.com
From:   "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Date:   Sun, 25 Oct 2020 12:40:52 +0100
Message-ID: <CAKgNAki=bmA=xh-djZUr5wxaPZ-QpDihvu6BrJFOeX=t4uv6qw@mail.gmail.com>
Subject: Re: [PATCH 1/2] queue.3: Add self to copyright notice
To:     Alejandro Colomar <colomar.6.4.3@gmail.com>
Cc:     linux-man <linux-man@vger.kernel.org>,
        "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Hi Alex,

On Sun, 25 Oct 2020 at 11:24, Alejandro Colomar <colomar.6.4.3@gmail.com> wrote:
>
> Signed-off-by: Alejandro Colomar <colomar.6.4.3@gmail.com>

Thanks. Applied.

> ---
>
> Hi Michael,
>
> After these 2 patches, I think I'll only add one more patch
> to all of the pages improving a bit the SYNOPSIS
> (taking a good idea from OpenBSD's queue(3)).

Thanks for the background.

> I guess you're about to release, so please wait for that one :)

Yes, within the next week or so.

Thanks,

Michael

> I'll have it in a few minutes, anyway :p
>
> Cheers,
>
> Alex
>
>  man3/queue.3 | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/man3/queue.3 b/man3/queue.3
> index 1c9a6f573..3931f8c96 100644
> --- a/man3/queue.3
> +++ b/man3/queue.3
> @@ -1,5 +1,6 @@
>  .\" Copyright (c) 1993
> -.\"    The Regents of the University of California.  All rights reserved.
> +.\"    The Regents of the University of California.  All rights reserved.
> +.\" and Copyright (c) 2020 by Alejandro Colomar <colomar.6.4.3@gmail.com>
>  .\"
>  .\" %%%LICENSE_START(BSD_3_CLAUSE_UCB)
>  .\" Redistribution and use in source and binary forms, with or without
> --
> 2.28.0
>


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
