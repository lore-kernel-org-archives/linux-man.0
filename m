Return-Path: <SRS0=Uwhb=7K=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F547C433DF
	for <linux-man@archiver.kernel.org>; Thu, 28 May 2020 09:28:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F0772075F
	for <linux-man@archiver.kernel.org>; Thu, 28 May 2020 09:28:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728290AbgE1J22 (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Thu, 28 May 2020 05:28:28 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:54331 "EHLO
        smtpout1.mo529.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728199AbgE1J22 (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Thu, 28 May 2020 05:28:28 -0400
Received: from mxplan6.mail.ovh.net (unknown [10.109.156.137])
        by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 4CFF938842F1;
        Thu, 28 May 2020 11:28:26 +0200 (CEST)
Received: from jwilk.net (37.59.142.104) by DAG4EX2.mxp6.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1779.2; Thu, 28 May
 2020 11:28:25 +0200
Authentication-Results: garm.ovh; auth=pass (GARM-104R0056824c66e-8f2e-4e91-aa78-0cdcb4c31b2a,8037D1D33340B24F6A97D359A5944E3808DD67EF) smtp.auth=jwilk@jwilk.net
Date:   Thu, 28 May 2020 11:28:21 +0200
From:   Jakub Wilk <jwilk@jwilk.net>
To:     Michael Kerrisk <mtk.manpages@gmail.com>
CC:     Jonny Grant <jg@jguk.org>, <linux-man@vger.kernel.org>
Subject: Re: core sysctl
Message-ID: <20200528092821.z6esjkiyocn5qp2m@jwilk.net>
References: <9e98156e-3ba9-e656-bb8f-c54229b5ac11@jguk.org>
 <CAKgNAkhkASJ8+Xe64_ifM1_GgrNSCd6Vx0GDdkJ7aFfJ7RG=7A@mail.gmail.com>
 <0e0f3d4e-b811-3423-ffe9-2fd68900c1a0@jguk.org>
 <CAKgNAkgRSAf2MVA-XMbvoQTk88T5j=Hn2-nyzZBo-tVrLxvbsA@mail.gmail.com>
 <0e4f5e7d-85bc-11d6-c73a-16509ab2a3e9@jguk.org>
 <6d57dced-2c9d-480b-8e4e-02ecbe42e4a9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <6d57dced-2c9d-480b-8e4e-02ecbe42e4a9@gmail.com>
User-Agent: NeoMutt/20180716
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG3EX1.mxp6.local (172.16.2.21) To DAG4EX2.mxp6.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 584cee15-b081-4ad9-81f4-fa4a322ca7bf
X-Ovh-Tracer-Id: 9527927964158056413
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedruddviedgtdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfhfgggtuggjfghisehttdertddtredvnecuhfhrohhmpeflrghkuhgsucghihhlkhcuoehjfihilhhksehjfihilhhkrdhnvghtqeenucggtffrrghtthgvrhhnpefhfedvfeehvefhkeeltdejgeelteefvdefvdduvdefgfduueeitdeitedvtdehgfenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnheirdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepjhifihhlkhesjhifihhlkhdrnhgvthdprhgtphhtthhopehlihhnuhigqdhmrghnsehvghgvrhdrkhgvrhhnvghlrdhorhhg
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

* Michael Kerrisk <mtk.manpages@gmail.com>, 2020-05-28, 11:16:
>+.I core_patter

Trailing "n" is missing.

-- 
Jakub Wilk
