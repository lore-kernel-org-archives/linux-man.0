Return-Path: <SRS0=HENb=EI=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5E9CC00A89
	for <linux-man@archiver.kernel.org>; Mon,  2 Nov 2020 17:41:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 76DFB21556
	for <linux-man@archiver.kernel.org>; Mon,  2 Nov 2020 17:41:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dxdksiz1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725980AbgKBRlI (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 2 Nov 2020 12:41:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725846AbgKBRlH (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Mon, 2 Nov 2020 12:41:07 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8977DC0617A6
        for <linux-man@vger.kernel.org>; Mon,  2 Nov 2020 09:41:07 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id x6so15968856ljd.3
        for <linux-man@vger.kernel.org>; Mon, 02 Nov 2020 09:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c+TvPmHQ2nkS3Tj49aBS8v8pNHLHHlpiXtqgkBZn2ho=;
        b=dxdksiz1AzwxfQIDQZyWnIgIjbtLquSrE+xgA3HuVe2Ntv4nL6Krx658CWZicFbMlu
         fKgdJZqSSwANULyF1MX9OJP91Lh5DW38fV7pk/EhuzoDY13/yt3VvTURvuoDHWJLgHcu
         +91aucuiCYDz8t7pkIyeH/1ebWeCTxfAJC0XHH3L3dOj3Y5Fg9CoCbgualttNNJOHszs
         DwvIfhNvYn0brQy5tZdbJbCCa+l2SBTi/G6s7YMsWkMxuwlKBNCly1yHWnKdZpf+SwqU
         OJmZN2XDgqwG/V+g/Vos6KfZWOJ+5eyAILRUPsBesOVUt3bGOaiypCa2v1G8x50RvuLO
         4LKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c+TvPmHQ2nkS3Tj49aBS8v8pNHLHHlpiXtqgkBZn2ho=;
        b=EbipBSXL8CRFgzn2S3FIzGbf/EiORe2OrRxBbJJnG7Xi7u4zX3gpNJe5MEyBsda0Nr
         +RfEeLTWtK6kfW+r0J1Fl7sga+W66F0tH9NLPKOrBFqzHDssy4TzWzQhNNnjeuSqJt1Z
         MKDqWkivfZ88UB5dB/7WiZZ69nvHKdbQ904OMTSS9eAuOIj6EismmFI0ZuvxTq8ihHhl
         nrYm7tAiGriU7N2zg018REKFCaP5Qadng2R/db7mipIFMglKUH8EMau5yQxooDhE+DSj
         phb4/7oNBO9LME0lSWkB8ocA0kULhUCOypW5eWFNDHZCikWAsRoj6hgXlhIn+YrKuBHL
         +Rww==
X-Gm-Message-State: AOAM530bgXEO/fw69WG9S6AStKLX7UFC6+HTuSTAj2jKMM5gjtKupDlX
        m+BAWXg1nbuN3GdFS19/RqBAqGTQdTzJW0EVF+9AoA==
X-Google-Smtp-Source: ABdhPJw2P4J9xzy8WqXd9KRrUcLQvPb3AWdcHP2ujGn+aMqXHYLb+ZRRN8GRPLHNd9A2xZWjHp47uD+sn4FM4XKLOco=
X-Received: by 2002:a2e:2202:: with SMTP id i2mr6511350lji.70.1604338865161;
 Mon, 02 Nov 2020 09:41:05 -0800 (PST)
MIME-Version: 1.0
References: <20201101200440.17328-1-colomar.6.4.3@gmail.com> <786665141.6911.1604320238880.JavaMail.zimbra@efficios.com>
In-Reply-To: <786665141.6911.1604320238880.JavaMail.zimbra@efficios.com>
From:   Peter Oskolkov <posk@google.com>
Date:   Mon, 2 Nov 2020 09:40:53 -0800
Message-ID: <CAPNVh5d-DVLjLg+CBrnPpvSQKE1=cZVAzDhX_eZjoU2+=qhcNw@mail.gmail.com>
Subject: Re: [PATCH] membarrier.2: Update prototype
To:     Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc:     Alejandro Colomar <colomar.6.4.3@gmail.com>,
        Peter Oskolkov <posk@posk.io>,
        Michael Kerrisk <mtk.manpages@gmail.com>,
        linux-man <linux-man@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        paulmck <paulmck@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Paul Turner <pjt@google.com>,
        Chris Kennelly <ckennelly@google.com>, shuah <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

On Mon, Nov 2, 2020 at 4:30 AM Mathieu Desnoyers
<mathieu.desnoyers@efficios.com> wrote:
>
> ----- On Nov 1, 2020, at 3:04 PM, Alejandro Colomar colomar.6.4.3@gmail.com wrote:
>
> > The Linux kernel now uses 'flags' and added a new argument: 'cpu_id'.
> > These changes were introduced to the kernel
> > in commit 2a36ab717e8fe678d98f81c14a0b124712719840.
>
[...]
> Peter (Oskolkov), can you contribute a patch detailing the new membarrier flags and cpu_id
> arguments to the man pages project ?

Yes, sure, I'll prepare a patch in the next day or two.

Thanks,
Peter

[...]
