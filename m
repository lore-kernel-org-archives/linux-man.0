Return-Path: <linux-man-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59290C61DA4
	for <linux-man@archiver.kernel.org>; Mon, 13 Mar 2023 21:49:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbjCMVty (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 13 Mar 2023 17:49:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230034AbjCMVty (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Mon, 13 Mar 2023 17:49:54 -0400
Received: from 10.mo548.mail-out.ovh.net (10.mo548.mail-out.ovh.net [46.105.77.235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA63D1DB89
        for <linux-man@vger.kernel.org>; Mon, 13 Mar 2023 14:49:49 -0700 (PDT)
Received: from mxplan6.mail.ovh.net (unknown [10.108.1.235])
        by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 00C1D203DE;
        Mon, 13 Mar 2023 21:30:46 +0000 (UTC)
Received: from jwilk.net (37.59.142.107) by DAG4EX1.mxp6.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Mon, 13 Mar
 2023 22:30:46 +0100
Authentication-Results: garm.ovh; auth=pass (GARM-107S0014d6ffcc7-b1e7-42df-8663-a81dbd7c6071,
                    505FDAC645318A2B1E575A389E4C96BF7D656245) smtp.auth=jwilk@jwilk.net
X-OVh-ClientIp: 5.172.255.130
Date:   Mon, 13 Mar 2023 22:30:44 +0100
From:   Jakub Wilk <jwilk@jwilk.net>
To:     Alejandro Colomar <alx.manpages@gmail.com>
CC:     <linux-man@vger.kernel.org>
Subject: Re: [PATCH] arc4random.3: New page documenting the arc4random(3)
 family of functions
Message-ID: <20230313213044.scl37hpwvuyo2dif@jwilk.net>
References: <20230101162627.28031-1-alx@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230101162627.28031-1-alx@kernel.org>
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG3EX2.mxp6.local (172.16.2.22) To DAG4EX1.mxp6.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 6cef3fb0-46e2-42e0-9fb2-426a2d762d78
X-Ovh-Tracer-Id: 10810327959602648986
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvddvgedgudegjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepfffhvfevuffkfhggtggujghisehttdertddttddvnecuhfhrohhmpeflrghkuhgsucghihhlkhcuoehjfihilhhksehjfihilhhkrdhnvghtqeenucggtffrrghtthgvrhhnpeeutddtteelhfffuddvhefgfedujeeltdekheduveekkeelfeduuedvgeejudffgfenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehjfihilhhksehjfihilhhkrdhnvghtqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegrlhigrdhmrghnphgrghgvshesghhmrghilhdrtghomhdplhhinhhugidqmhgrnhesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheegkedpmhhouggvpehsmhhtphhouhht
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

* Alejandro Colomar <alx.manpages@gmail.com>, 2023-01-01 17:26:
>+.SH LIBRARY
>+Standard C library
>+.RI ( libc ", " -lc )

That should be \-lc, but... To be frank, I'd just remove the whole 
section. Most people shouldn't use -lc, and those who do need it can 
figure it out on their own.

-- 
Jakub Wilk
