Return-Path: <linux-man-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5DCBC4332F
	for <linux-man@archiver.kernel.org>; Wed,  1 Nov 2023 16:32:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231759AbjKAQcQ (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Wed, 1 Nov 2023 12:32:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231233AbjKAQcP (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Wed, 1 Nov 2023 12:32:15 -0400
X-Greylist: delayed 536 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 01 Nov 2023 09:32:12 PDT
Received: from smtpout3.mo529.mail-out.ovh.net (smtpout3.mo529.mail-out.ovh.net [46.105.54.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4503A11D
        for <linux-man@vger.kernel.org>; Wed,  1 Nov 2023 09:32:12 -0700 (PDT)
Received: from mxplan6.mail.ovh.net (unknown [10.109.143.118])
        by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 4F3E520521;
        Wed,  1 Nov 2023 16:23:13 +0000 (UTC)
Received: from jwilk.net (37.59.142.110) by DAG4EX1.mxp6.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 1 Nov
 2023 17:23:12 +0100
Authentication-Results: garm.ovh; auth=pass (GARM-110S00431a560a5-87eb-4fed-b590-f87825a56159,
                    C3C47EF67A37C87AE86152C9AD52F034635D95B4) smtp.auth=jwilk@jwilk.net
X-OVh-ClientIp: 5.172.255.239
Date:   Wed, 1 Nov 2023 17:23:10 +0100
From:   Jakub Wilk <jwilk@jwilk.net>
To:     Alejandro Colomar <alx@kernel.org>
CC:     Helge Kreutzmann <debian@helgefjell.de>,
        Mario =?utf-8?Q?Bl=C3=A4ttermann?= <mario.blaettermann@gmail.com>,
        <linux-man@vger.kernel.org>
Subject: Re: Issue in man page mount_namespaces.7
Message-ID: <20231101162310.u4b46gii47yjhsgt@jwilk.net>
References: <ZUJaY1wRIqZXKjpA@meinfjell.helgefjelltest.de>
 <ZUJ1VK9_7tBuMBBg@debian>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZUJ1VK9_7tBuMBBg@debian>
X-Originating-IP: [37.59.142.110]
X-ClientProxiedBy: DAG9EX2.mxp6.local (172.16.2.82) To DAG4EX1.mxp6.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 3a61a52e-02b1-4fe5-a4f8-d2abae3e1cf4
X-Ovh-Tracer-Id: 8894890741290817504
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedruddtgedgkeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpeffhffvvefukfhfgggtugfgjghisehtkeertddttdejnecuhfhrohhmpeflrghkuhgsucghihhlkhcuoehjfihilhhksehjfihilhhkrdhnvghtqeenucggtffrrghtthgvrhhnpeehteeitdehgeelhfekhfduhfeufeehueffleehteefgeduvdeuleefjefhveeijeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdduuddtpdehrddujedvrddvheehrddvfeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeojhifihhlkhesjhifihhlkhdrnhgvtheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheprghlgieskhgvrhhnvghlrdhorhhgpdguvggsihgrnheshhgvlhhgvghfjhgvlhhlrdguvgdpmhgrrhhiohdrsghlrggvthhtvghrmhgrnhhnsehgmhgrihhlrdgtohhmpdhlihhnuhigqdhmrghnsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehvdelpdhmohguvgepshhmthhpohhuth
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

* Alejandro Colomar <alx@kernel.org>, 2023-11-01 16:57:
>On Wed, Nov 01, 2023 at 02:02:11PM +0000, Helge Kreutzmann wrote:
>> Without further ado, the following was found:
>>
>> Issue:    mount point → mount ?
>
>I'm not sure that improves significantly.  Is there any difference
>between a 'mount' and a 'mount point'?

We discussed it last year:
https://lore.kernel.org/linux-man/20221205123809.5p66jmpalhd4bhoq@jwilk.net/

-- 
Jakub Wilk
