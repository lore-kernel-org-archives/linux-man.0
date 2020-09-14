Return-Path: <SRS0=trGW=CX=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CA43C43461
	for <linux-man@archiver.kernel.org>; Mon, 14 Sep 2020 19:38:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 64D97207EA
	for <linux-man@archiver.kernel.org>; Mon, 14 Sep 2020 19:38:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IO6wp6FT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725961AbgINTid (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 14 Sep 2020 15:38:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725914AbgINTib (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Mon, 14 Sep 2020 15:38:31 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B89B3C06174A
        for <linux-man@vger.kernel.org>; Mon, 14 Sep 2020 12:38:30 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id x19so1138410oix.3
        for <linux-man@vger.kernel.org>; Mon, 14 Sep 2020 12:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=Aq8LWZc8f73ZtkExUBb19aY77hQM68tRUlfl3AXudEw=;
        b=IO6wp6FTG10bMfXCoatuR5t8iN+7KkTsg02WWrAsYvSJexCDb8NcIj09K+X0xSu/9/
         85KeA7WpSt65BMN8obtszkbNgAsdCS7HR5XIQq4AuTKts2z2UxOocNP3x9RmiM4gzKkD
         LvXHpYM3UUEdgrFg0v6jIvqwq9ljEGilZD05rQGQ27w/YIrseRFWicfEv8sfcKztEmJ/
         k6gEWNO2DQlh62wuwr2Z9FzeKXb9Mv7QUVyDFsIR/a7AoZlNJ1rWW8v+1VMSbcKP8bMe
         bXzRcc+NnYOikGbyN4P7pvZlHWBDxPMDxLhkH11l4LdQNlJ82t/3bmdRwdo37VBm0RWR
         Gpug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=Aq8LWZc8f73ZtkExUBb19aY77hQM68tRUlfl3AXudEw=;
        b=Js4FlPHi8T28vS0puDEF/u64c3Wyj1b673M9UGNNQddr109o77+v0rdWOia2J1+qfI
         uZ2kpuNOxpqDSyxKbWqOjn68DHs9TOLnQrzoG1XsRrMxJa8EM58Dh6aXo6XdlpOHh0FX
         3SUvCvILGJGitRQoFfxTOJubPBg7KItmDtA9/YgjqQmYDq+GyaAp4ouN8d+QrGbxMPkl
         v/pKavgFUjtUFldQovMrTcMOVDxSsyiXPF1BRIEP5nWhpbkJpFC3FZo/vJFD7euLBFTy
         0L2wfy7sxzQldFgjE6UfY9TDBKvEJLkaBAI1XSlS7ebM+18ZcsNtHaj6LBupXyWl7z4R
         O4AQ==
X-Gm-Message-State: AOAM533i+sL68bjFmqYvUR5Q5jr4IMzctr49qhgjHVMz+OaWl8lwOcu8
        DSr0IIalhziq0mJ94ljDKaZDxf1GvUQ2lubujRw=
X-Google-Smtp-Source: ABdhPJzRDzhR/J5LMHJ170PScqHZ930gJLkAaGZscIDvtE2uqr/MDhnZNfktvrNEuj/SCabBchw/P4EkUf+eA89/0cY=
X-Received: by 2002:aca:2301:: with SMTP id e1mr680540oie.177.1600112309698;
 Mon, 14 Sep 2020 12:38:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200911231411.28406-1-colomar.6.4.3@gmail.com>
 <20200911231411.28406-4-colomar.6.4.3@gmail.com> <af4a408c-7e6e-4074-2c61-461e7f167a55@gmail.com>
 <20200914085831.pdvkioetcw7fe4l7@jwilk.net>
In-Reply-To: <20200914085831.pdvkioetcw7fe4l7@jwilk.net>
Reply-To: mtk.manpages@gmail.com
From:   "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Date:   Mon, 14 Sep 2020 21:38:18 +0200
Message-ID: <CAKgNAkgMZmVApcz4cokd-V3qBRiXdEOEV14k=NzsvykKZ-Q3og@mail.gmail.com>
Subject: Re: [PATCH 03/12] pthread_getcpuclockid.3: Cast 'time_t' to
 'intmax_t' for printf()
To:     Jakub Wilk <jwilk@jwilk.net>
Cc:     Alejandro Colomar <colomar.6.4.3@gmail.com>,
        linux-man <linux-man@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Hi Jakub,

On Mon, 14 Sep 2020 at 10:58, Jakub Wilk <jwilk@jwilk.net> wrote:
>
> * Michael Kerrisk <mtk.manpages@gmail.com>, 2020-09-13, 07:58:
> >Casting to long is the historical practive here, and should be
> >sufficient, don't you think?
>
> It general, the practice of casting time_t to long is wrong. There are
> existing systems that have 64-bit time_t but 32-bit long.
>
> In this particular case, we're measuring CPU time, so there's
> practically no danger of overflow.

Yes, what you say makes sense.

> I'd either cast it to int (to make the code shortest and simplest) or to
> intmax_t (to be pedantically correct).

As per the patch from Alex, we'll universally move to intmax_t/uintmax_t casts.

Thanks,

Michael
-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
