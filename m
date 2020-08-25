Return-Path: <SRS0=F5uD=CD=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0EC7C433E1
	for <linux-man@archiver.kernel.org>; Tue, 25 Aug 2020 11:13:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7559F2071E
	for <linux-man@archiver.kernel.org>; Tue, 25 Aug 2020 11:13:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729932AbgHYLNp (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Tue, 25 Aug 2020 07:13:45 -0400
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:55445 "EHLO
        smtpout1.mo804.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728117AbgHYLNl (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Tue, 25 Aug 2020 07:13:41 -0400
Received: from mxplan6.mail.ovh.net (unknown [10.108.20.240])
        by mo804.mail-out.ovh.net (Postfix) with ESMTPS id C48A45A82354;
        Tue, 25 Aug 2020 13:13:39 +0200 (CEST)
Received: from jwilk.net (37.59.142.105) by DAG4EX2.mxp6.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Tue, 25 Aug
 2020 13:13:38 +0200
Authentication-Results: garm.ovh; auth=pass (GARM-105G0065f429280-7123-4531-9c2e-fea8afe5a5d8,
                    087FA98AF2F14B9995D892140F96BF1CEE39D89D) smtp.auth=jwilk@jwilk.net
Date:   Tue, 25 Aug 2020 13:13:36 +0200
From:   Jakub Wilk <jwilk@jwilk.net>
To:     Michael Kerrisk <mtk.manpages@gmail.com>
CC:     <linux-man@vger.kernel.org>,
        Alejandro Colomar <colomar.6.4.3@gmail.com>
Subject: Re: [bug] Makefile: Broken link
Message-ID: <20200825111336.lk5va5qjdv5n5scc@jwilk.net>
References: <6cf23265-7ed5-4a33-accf-5c0e8f67f85f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <6cf23265-7ed5-4a33-accf-5c0e8f67f85f@gmail.com>
User-Agent: NeoMutt/20180716
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG9EX1.mxp6.local (172.16.2.81) To DAG4EX2.mxp6.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: bec6e017-eced-4c61-90b0-d6bae910c1e8
X-Ovh-Tracer-Id: 17465803780313503709
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedruddvtddgfeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfhfgggtuggjfghisehttdertddtredvnecuhfhrohhmpeflrghkuhgsucghihhlkhcuoehjfihilhhksehjfihilhhkrdhnvghtqeenucggtffrrghtthgvrhhnpedvffdttefhgfeljeejkefhgeffhfdutefgfeegudefueekfedvudekkeevtddvueenucffohhmrghinhepuggvsghirghnrdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghniedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehjfihilhhksehjfihilhhkrdhnvghtpdhrtghpthhtoheptgholhhomhgrrhdriedrgedrfeesghhmrghilhdrtghomh
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

* Alejandro Colomar <colomar.6.4.3@gmail.com>, 2020-08-25, 12:51:
>Line 32 on the Makefile has a broken link in a comment:
>
>https://lintian.debian.org/tags/manpage-has-errors-from-man.html

This Lintian tag was renamed recently:
https://salsa.debian.org/lintian/lintian/commit/844278682aafa1da

The current URL is:
https://lintian.debian.org/tags/groff-message.html

-- 
Jakub Wilk
