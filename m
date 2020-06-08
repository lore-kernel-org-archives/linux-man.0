Return-Path: <SRS0=NY7b=7V=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E669AC433E0
	for <linux-man@archiver.kernel.org>; Mon,  8 Jun 2020 11:21:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C0BE9206C3
	for <linux-man@archiver.kernel.org>; Mon,  8 Jun 2020 11:21:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729487AbgFHLVH (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 8 Jun 2020 07:21:07 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:52035 "EHLO
        smtpout1.mo529.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729437AbgFHLVG (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Mon, 8 Jun 2020 07:21:06 -0400
Received: from mxplan6.mail.ovh.net (unknown [10.108.1.149])
        by mo529.mail-out.ovh.net (Postfix) with ESMTPS id DA5013AFF4AE;
        Mon,  8 Jun 2020 13:21:04 +0200 (CEST)
Received: from jwilk.net (37.59.142.101) by DAG4EX2.mxp6.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1779.2; Mon, 8 Jun 2020
 13:21:03 +0200
Authentication-Results: garm.ovh; auth=pass (GARM-101G0043c9e43d6-de9e-494a-b2c7-a2e7d7b761d8,368C03C927F0AF698E250ECFC0A01E71EF814895) smtp.auth=jwilk@jwilk.net
Date:   Mon, 8 Jun 2020 13:21:01 +0200
From:   Jakub Wilk <jwilk@jwilk.net>
To:     Walter Harms <wharms@bfs.de>
CC:     John Marshall <John.W.Marshall@glasgow.ac.uk>,
        Michael Kerrisk <mtk.manpages@gmail.com>,
        <linux-man@vger.kernel.org>
Subject: Re: AW: [patch] random.3: wfix: RAND_MAX is for rand(3)
Message-ID: <20200608112101.fuilahvdbacmdah6@jwilk.net>
References: <02185B3C-F6E5-4674-BB34-E549E04C5B37@glasgow.ac.uk>
 <627c601ec03b4da9b1ce98ee0e61a6ba@bfs.de>
 <20200608110416.GA21314@Johns-MacBook-Pro.local>
 <f653054ab6ae480b8286386c432cf8b9@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <f653054ab6ae480b8286386c432cf8b9@bfs.de>
User-Agent: NeoMutt/20180716
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG5EX2.mxp6.local (172.16.2.42) To DAG4EX2.mxp6.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 96ca2bab-1757-4b69-93e3-0299348f6f67
X-Ovh-Tracer-Id: 2242792618128431072
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrudehuddggeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfhfgggtuggjfghisehttdertddtredvnecuhfhrohhmpeflrghkuhgsucghihhlkhcuoehjfihilhhksehjfihilhhkrdhnvghtqeenucggtffrrghtthgvrhhnpeevfeejudehkefffeelfedtgeeghedtheeiueeitdfhveehieeijeehteevkeejleenucffohhmrghinhepohhpvghnghhrohhuphdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnheirdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepjhifihhlkhesjhifihhlkhdrnhgvthdprhgtphhtthhopehlihhnuhigqdhmrghnsehvghgvrhdrkhgvrhhnvghlrdhorhhg
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

* Walter Harms <wharms@bfs.de>, 2020-06-08, 11:10:
>INT32_MAX is not mentioned in the POSIX page

Yes, it is:
https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/stdint.h.html#tag_13_47_03_02

-- 
Jakub Wilk
