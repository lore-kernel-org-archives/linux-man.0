Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5E8BECAAA1
	for <linux-man@archiver.kernel.org>; Tue, 30 Aug 2022 20:28:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230092AbiH3U26 (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Tue, 30 Aug 2022 16:28:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229640AbiH3U25 (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Tue, 30 Aug 2022 16:28:57 -0400
X-Greylist: delayed 598 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 30 Aug 2022 13:28:55 PDT
Received: from 7.mo552.mail-out.ovh.net (7.mo552.mail-out.ovh.net [188.165.59.253])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 082B476766
        for <linux-man@vger.kernel.org>; Tue, 30 Aug 2022 13:28:54 -0700 (PDT)
Received: from mxplan6.mail.ovh.net (unknown [10.108.1.235])
        by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 5B09E27892;
        Tue, 30 Aug 2022 20:13:16 +0000 (UTC)
Received: from jwilk.net (37.59.142.110) by DAG4EX1.mxp6.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Tue, 30 Aug
 2022 22:13:15 +0200
Authentication-Results: garm.ovh; auth=pass (GARM-110S0040c2a8c86-c3d6-4b1a-b654-76d5d9888c96,
                    DD0743956CE8223FDAF572D0F4F9E873376A8952) smtp.auth=jwilk@jwilk.net
X-OVh-ClientIp: 5.172.255.251
Date:   Tue, 30 Aug 2022 22:13:12 +0200
From:   Jakub Wilk <jwilk@jwilk.net>
To:     Michael Kerrisk <mtk.manpages@gmail.com>,
        Alejandro Colomar <alx.manpages@gmail.com>
CC:     <linux-man@vger.kernel.org>
Subject: Re: [PATCH] ioctl_ns.2, stat.2: drop unneeded uintmax_t casts.
Message-ID: <20220830201312.mgt63423nskuenzl@jwilk.net>
References: <20220830195800.1779-1-jwilk@jwilk.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20220830195800.1779-1-jwilk@jwilk.net>
X-Originating-IP: [37.59.142.110]
X-ClientProxiedBy: DAG5EX2.mxp6.local (172.16.2.42) To DAG4EX1.mxp6.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 4b07642e-0367-4ecc-bf00-057e10341336
X-Ovh-Tracer-Id: 8024288636069599197
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekfedgudeglecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepfffhvfevuffkfhggtggujghisehttdertddttddvnecuhfhrohhmpeflrghkuhgsucghihhlkhcuoehjfihilhhksehjfihilhhkrdhnvghtqeenucggtffrrghtthgvrhhnpeeutddtteelhfffuddvhefgfedujeeltdekheduveekkeelfeduuedvgeejudffgfenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddutdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghniedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehjfihilhhksehjfihilhhkrdhnvghtpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqmhgrnhesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheehvd
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Oops, that's not how I wanted the subject to look like.
If it not too much work, please make it s/drop/Drop/ and remove the 
trailing full stop.

-- 
Jakub Wilk
