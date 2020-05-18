Return-Path: <SRS0=OSNg=7A=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D459C433E1
	for <linux-man@archiver.kernel.org>; Mon, 18 May 2020 15:38:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5749720657
	for <linux-man@archiver.kernel.org>; Mon, 18 May 2020 15:38:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726958AbgERPiq (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 18 May 2020 11:38:46 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:56673 "EHLO
        smtpout1.mo529.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727020AbgERPip (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Mon, 18 May 2020 11:38:45 -0400
Received: from mxplan6.mail.ovh.net (unknown [10.109.138.217])
        by mo529.mail-out.ovh.net (Postfix) with ESMTPS id AE4A63668186;
        Mon, 18 May 2020 17:38:43 +0200 (CEST)
Received: from jwilk.net (37.59.142.104) by DAG4EX2.mxp6.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1779.2; Mon, 18 May
 2020 17:38:42 +0200
Authentication-Results: garm.ovh; auth=pass (GARM-104R00544cae2b8-27dd-4380-8605-75372a417abe,9658B802E4FA7A730EAC3406F5570557D9389AB2) smtp.auth=jwilk@jwilk.net
Date:   Mon, 18 May 2020 17:38:41 +0200
From:   Jakub Wilk <jwilk@jwilk.net>
To:     Rohit Saily <rohit@rohitsaily.com>
CC:     Michael Kerrisk <mtk.manpages@gmail.com>,
        <linux-man@vger.kernel.org>
Subject: Re: PRINTF(3) Miswriting
Message-ID: <20200518153841.5urnrimzrqadvpvy@jwilk.net>
References: <CAEYDfj7TDMwUy08DiHRde6D8Qam79tALL0u=Bf2tVghKn8jeMw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEYDfj7TDMwUy08DiHRde6D8Qam79tALL0u=Bf2tVghKn8jeMw@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG5EX1.mxp6.local (172.16.2.41) To DAG4EX2.mxp6.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 3d2c0864-6d96-4284-871d-d2d0bcde6719
X-Ovh-Tracer-Id: 12394750600556238813
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedruddthedgleduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfhfgggtugfgjggfihesthekredttderjeenucfhrhhomheplfgrkhhusgcuhghilhhkuceojhifihhlkhesjhifihhlkhdrnhgvtheqnecuggftrfgrthhtvghrnhephffftdeuleevvdfffefgjeevhedujefgieektedujeeiuedvgffhuddugeffueejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghniedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehjfihilhhksehjfihilhhkrdhnvghtpdhrtghpthhtoheplhhinhhugidqmhgrnhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Hi Rohit!

* Rohit Saily <rohit@rohitsaily.com>, 2020-05-16, 18:04:
>I am having difficulty understanding a sentence in the PRINTF(3) man 
>page's explanation of the 'a' and 'A' conversion specifiers, more 
>specifically it is the following sentence:
>
>>The digit before the decimal point is unspecified for nonnormalized 
>>numbers, and nonzero but other‐wise unspecified for normalized 
>>numbers.
>
>My confusion arises due to the fact that the two posible cases are 
>described with the same outcome,

I believe the wording is correct. The outcome is not always the same: 
the leading digit zero is allowed only for non-normalized numbers.

For example, printf("%a", 1.0) could produce any of these outputs:

   0x8.0p-3
   0x4.0p-2
   0x2.0p-1
   0x1.0p+0

but not:

   0x0.8p+1

On the other hand, assuming the IEEE 754 binary64 format, 
printf("%a\n", 0x0.8p-1022) could produce any of these:

   0x8.0p-1026
   0x4.0p-1025
   0x2.0p-1024
   0x1.0p-1023
   0x0.8p-1022

-- 
Jakub Wilk
