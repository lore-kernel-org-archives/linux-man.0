Return-Path: <SRS0=EslP=6L=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2170DC54FD0
	for <linux-man@archiver.kernel.org>; Mon, 27 Apr 2020 14:15:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E48E8206B6
	for <linux-man@archiver.kernel.org>; Mon, 27 Apr 2020 14:15:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727022AbgD0OPF (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 27 Apr 2020 10:15:05 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:34153 "EHLO
        smtpout1.mo529.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726651AbgD0OPF (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Mon, 27 Apr 2020 10:15:05 -0400
Received: from mxplan6.mail.ovh.net (unknown [10.109.143.167])
        by mo529.mail-out.ovh.net (Postfix) with ESMTPS id F2D2E321AC75;
        Mon, 27 Apr 2020 16:15:03 +0200 (CEST)
Received: from jwilk.net (37.59.142.99) by DAG4EX2.mxp6.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1779.2; Mon, 27 Apr
 2020 16:15:02 +0200
Date:   Mon, 27 Apr 2020 16:14:53 +0200
From:   Jakub Wilk <jwilk@jwilk.net>
To:     Michael Kerrisk <mtk.manpages@gmail.com>
CC:     Helge Kreutzmann <debian@helgefjell.de>,
        <linux-man@vger.kernel.org>
Subject: Re: Errors in man pages, here: random(4): Singular/Plural
Message-ID: <20200427141453.irpiezazavf656kz@jwilk.net>
References: <20200419064819.GA31654@Debian-50-lenny-64-minimal>
 <32c7d19a-ac60-0250-869a-5b5c707b56e2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <32c7d19a-ac60-0250-869a-5b5c707b56e2@gmail.com>
User-Agent: NeoMutt/20180716
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG7EX1.mxp6.local (172.16.2.61) To DAG4EX2.mxp6.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 170f41e1-a925-4f11-9c5e-01a9956a822c
X-Ovh-Tracer-Id: 16782382540271048669
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrheelgdejvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepfffhvffukfhfgggtugfgjggfihesthekredttderjeenucfhrhhomheplfgrkhhusgcuhghilhhkuceojhifihhlkhesjhifihhlkhdrnhgvtheqnecuffhomhgrihhnpegtrghmsghrihgughgvrdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnheirdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepjhifihhlkhesjhifihhlkhdrnhgvthdprhgtphhtthhopehlihhnuhigqdhmrghnsehvghgvrhdrkhgvrhhnvghlrdhorhhg
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

* Michael Kerrisk (man-pages) <mtk.manpages@gmail.com>, 2020-04-20, 08:12:
>>vary → varies ?
>>
>>"This file gives the size of the entropy pool.  The semantics of this file "
>>"vary across kernel versions:"
>
>"semantics" is considered a plural noun, so "vary" is right.

I don't think that's correct. Despite the trailing "s", "semantics" is 
not plural; it's uncountable.

https://dictionary.cambridge.org/dictionary/english/semantics includes 
the following examples:

   The semantics of the language _is_ based on a translation, ...

   Action semantics _is_ useful for reasoning about language implementations.

-- 
Jakub Wilk
