Return-Path: <SRS0=wOXt=D3=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51F6BC433E7
	for <linux-man@archiver.kernel.org>; Tue, 20 Oct 2020 11:31:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DE5F022242
	for <linux-man@archiver.kernel.org>; Tue, 20 Oct 2020 11:31:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389187AbgJTLbB (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Tue, 20 Oct 2020 07:31:01 -0400
Received: from turbocat.net ([88.99.82.50]:44996 "EHLO mail.turbocat.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389781AbgJTLbB (ORCPT <rfc822;linux-man@vger.kernel.org>);
        Tue, 20 Oct 2020 07:31:01 -0400
X-Greylist: delayed 472 seconds by postgrey-1.27 at vger.kernel.org; Tue, 20 Oct 2020 07:31:00 EDT
Received: from hps2020.home.selasky.org (unknown [178.17.145.105])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.turbocat.net (Postfix) with ESMTPSA id 6D9C626026B;
        Tue, 20 Oct 2020 13:23:05 +0200 (CEST)
Subject: Re: queue.3 overhaul
To:     Alejandro Colomar <colomar.6.4.3@gmail.com>, mtk.manpages@gmail.com
Cc:     linux-man <linux-man@vger.kernel.org>,
        "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
References: <33af3ca2-d6ea-5f75-6ad2-e2f43eefe4fa@gmail.com>
 <CAKgNAkhDZK9YyvDNr+s=bT9Y6BGCtC7mrGuYa+bdrzQnhGSjhw@mail.gmail.com>
 <907cf2f7-70de-42c3-a738-d7e6a14327de@gmail.com>
From:   Hans Petter Selasky <hps@selasky.org>
Message-ID: <e8cc9a94-d017-7f2b-cf5c-827cdcd6d2a0@selasky.org>
Date:   Tue, 20 Oct 2020 13:22:27 +0200
User-Agent: Mozilla/5.0 (X11; FreeBSD amd64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <907cf2f7-70de-42c3-a738-d7e6a14327de@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Hi,

You may want to import new queue macros from FreeBSD, especially for C++ 
use.

https://svnweb.freebsd.org/base/head/sys/sys/queue.h

https://svnweb.freebsd.org/base?view=revision&revision=284915

--HPS
