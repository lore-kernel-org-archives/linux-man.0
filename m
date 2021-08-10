Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 521DEC4338F
	for <linux-man@archiver.kernel.org>; Tue, 10 Aug 2021 07:12:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2CCD861051
	for <linux-man@archiver.kernel.org>; Tue, 10 Aug 2021 07:12:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229480AbhHJHMq (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Tue, 10 Aug 2021 03:12:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbhHJHMn (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Tue, 10 Aug 2021 03:12:43 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C20ACC0613D3;
        Tue, 10 Aug 2021 00:12:21 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id c16so19741111plh.7;
        Tue, 10 Aug 2021 00:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=cc:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ehXmyKvN8kss/jfEeUYnXkhGYphO5Th0k62KABCdSyc=;
        b=QnkWXH3KfA1HA+w5xWE0trLsN+GUAK6H7yiuwuVHFfa4ATTh2vuxEOJnXwnm+gD9DC
         acrk9DXtXVEdG23LT+wy82QORBXcOyOxWttLxBO6wk3YuoamXaqjYjSkqdmF6gaI/10q
         S+PP9pkBGXpVpCwIRLpSOXN7M8jaLe+SQl2aaUFW4v+YPKrBGxDcEkYgGzNfYVF8maKZ
         XvOiJTVVFjB6fga9iq3BJhEGdu9//Kl5OCkTAlN4Xq2dLuuVKuPLxpfHrtziNKFxqpAL
         KT1QkcF0y+Erm9PHGmrIFKs1faBbFw8PFwhpcFS6pyZ1zTmf8QOQrzjbnFVR6pGYzsVd
         zo1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:cc:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ehXmyKvN8kss/jfEeUYnXkhGYphO5Th0k62KABCdSyc=;
        b=qXB0RHeqiNEaSSaX4D/ibsMs3zk7+R/2tWmfIUucur8gGlhqnbd1/niRDhCFNfaFiO
         lbeDA5WsIc2HumXwzPNNAVl9kjNwTysXj86jC+zwMAJnrjdOI+Q5cEImucGKnmDwFpuQ
         vRLbc4+AnZ6kPCvEZkq9f1rha1tPSNA2EroBvr1UczhBaX7fExQicRsH+5UbOyrMxvdk
         E57ECBJ49WYR0Ln97h9jMO6qGQT6GJwiWtVmWH/eB0idZVC19BzFWcwzB48SMVWKDMDg
         RhCgdmKjzpFWzNaZ3HPDcRROrAjG7+yXI6FgLQdEqCVoc9i0qam4yf8wxgN1+MKRnwxJ
         ZgQg==
X-Gm-Message-State: AOAM533u2y1bCLD7qtzprGORb9ryDjNrjQ9cSIRm5W3DnBWyUtiIy4kt
        sQXAPCPE5GYMVGx6LXlODhQ=
X-Google-Smtp-Source: ABdhPJxQ+/dMFZkiowAoR2uGvr2PJJpknfXC4mgX+YtBG2Z6ZrSLZNwpFA26VSpHW8a81yIMmjDVUw==
X-Received: by 2002:a63:fd54:: with SMTP id m20mr308868pgj.104.1628579541307;
        Tue, 10 Aug 2021 00:12:21 -0700 (PDT)
Received: from [192.168.1.71] (122-61-176-117-fibre.sparkbb.co.nz. [122.61.176.117])
        by smtp.gmail.com with ESMTPSA id n1sm27941449pgt.63.2021.08.10.00.12.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Aug 2021 00:12:20 -0700 (PDT)
Cc:     mtk.manpages@gmail.com, Alejandro Colomar <alx.manpages@gmail.com>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        linux-man <linux-man@vger.kernel.org>,
        Christoph Hellwig <hch@infradead.org>
Subject: Re: Questions re the new mount_setattr(2) manual page
To:     Christian Brauner <christian.brauner@ubuntu.com>
References: <b58e2537-03f4-6f6c-4e1b-8ddd989624cc@gmail.com>
From:   "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Message-ID: <b23122c0-893a-c1b4-0b2d-3a332af4151f@gmail.com>
Date:   Tue, 10 Aug 2021 09:12:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <b58e2537-03f4-6f6c-4e1b-8ddd989624cc@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Hi Christian,

One more question...

>>       The propagation field is used to specify the propagation typ
>>       of the mount or mount tree.  Mount propagation options are
>>       mutually exclusive; that is, the propagation values behave
>>       like an enum.  The supported mount propagation types are:

The manual page text doesn't actually say it, but if the 'propagation'
field is 0, then this means leave the propagation type unchanged, 
right? This of course should be mentioned in the manual page.

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
