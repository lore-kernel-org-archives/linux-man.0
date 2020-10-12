Return-Path: <SRS0=Y2gB=DT=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39C09C43457
	for <linux-man@archiver.kernel.org>; Mon, 12 Oct 2020 13:11:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E95352076C
	for <linux-man@archiver.kernel.org>; Mon, 12 Oct 2020 13:11:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730460AbgJLNLZ (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 12 Oct 2020 09:11:25 -0400
Received: from l2mail1.panix.com ([166.84.1.75]:64913 "EHLO l2mail1.panix.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730352AbgJLNLR (ORCPT <rfc822;linux-man@vger.kernel.org>);
        Mon, 12 Oct 2020 09:11:17 -0400
X-Greylist: delayed 1033 seconds by postgrey-1.27 at vger.kernel.org; Mon, 12 Oct 2020 09:11:17 EDT
Received: from mailbackend.panix.com (mailbackend.panix.com [166.84.1.89])
        by l2mail1.panix.com (Postfix) with ESMTPS id 4C8zBz4GNRzDPn
        for <linux-man@vger.kernel.org>; Mon, 12 Oct 2020 08:54:03 -0400 (EDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
        by mailbackend.panix.com (Postfix) with ESMTPSA id 4C8zBy1q5gz18sg
        for <linux-man@vger.kernel.org>; Mon, 12 Oct 2020 08:54:02 -0400 (EDT)
Received: by mail-ej1-f43.google.com with SMTP id qp15so23010685ejb.3
        for <linux-man@vger.kernel.org>; Mon, 12 Oct 2020 05:54:02 -0700 (PDT)
X-Gm-Message-State: AOAM533luMGDad0wyqYGmddmkdtAA6XfCc89ZMBniGU13b3p/68y7/Wy
        0yd0mLxKvLeWDR0X11Z1hWkeYqZ4nawIhG56mo4=
X-Google-Smtp-Source: ABdhPJwnjwzJ5OOlpXgyWebIgU//AEYkQp8RYu/aOgm37+ErJAhFaX4AptXIN8u+JIaPrgG0ztW0KZkXogbPXcPtql0=
X-Received: by 2002:a17:906:a848:: with SMTP id dx8mr27123424ejb.552.1602507241219;
 Mon, 12 Oct 2020 05:54:01 -0700 (PDT)
MIME-Version: 1.0
References: <20201010190226.19236-1-colomar.6.4.3@gmail.com>
In-Reply-To: <20201010190226.19236-1-colomar.6.4.3@gmail.com>
From:   Zack Weinberg <zackw@panix.com>
Date:   Mon, 12 Oct 2020 08:53:50 -0400
X-Gmail-Original-Message-ID: <CAKCAbMi5W41NviKbYS+V5U5sWk7FEpSj3EAUCJCr-UTr2JCkBw@mail.gmail.com>
Message-ID: <CAKCAbMi5W41NviKbYS+V5U5sWk7FEpSj3EAUCJCr-UTr2JCkBw@mail.gmail.com>
Subject: Re: [PATCH] queue.3: Replace incomplete example by a complete example
To:     Alejandro Colomar <colomar.6.4.3@gmail.com>
Cc:     "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>,
        linux-man <linux-man@vger.kernel.org>,
        GNU C Library <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

On Sat, Oct 10, 2020 at 3:04 PM Alejandro Colomar via Libc-alpha
<libc-alpha@sourceware.org> wrote:
>
> I think this page needs a big overhaul.
>
> First of all, it's a very big page,
> where it's a bit difficult to go to the subsection you want.
> Then, the examples are incomplete.
> And also, the language of the page is weird.

<sys/queue.h> was, IIUC, originally an implementation detail of the
original BSD kernel, not intended for use elsewhere. Elsewhere started
using it anyway, and that's why glibc has it; there was, at one time,
enough user space software that assumed its existence to make a
compatibility implementation worthwhile. But I don't think its use
should be encouraged in new software, and in fact I'm not sure it
should be documented at all.

zw
