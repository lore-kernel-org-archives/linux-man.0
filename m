Return-Path: <linux-man-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06FA0C61DA4
	for <linux-man@archiver.kernel.org>; Mon, 13 Mar 2023 16:56:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230370AbjCMQ4X (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 13 Mar 2023 12:56:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230263AbjCMQ4U (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Mon, 13 Mar 2023 12:56:20 -0400
Received: from 1.mo552.mail-out.ovh.net (1.mo552.mail-out.ovh.net [178.32.96.117])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D0F059E4E
        for <linux-man@vger.kernel.org>; Mon, 13 Mar 2023 09:56:18 -0700 (PDT)
Received: from mxplan6.mail.ovh.net (unknown [10.108.16.105])
        by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 4FD3D2D490;
        Mon, 13 Mar 2023 15:21:41 +0000 (UTC)
Received: from jwilk.net (37.59.142.107) by DAG4EX1.mxp6.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Mon, 13 Mar
 2023 15:52:11 +0100
Authentication-Results: garm.ovh; auth=pass (GARM-107S001c7037c6b-6608-4e5e-b65a-ec2cc11aee51,
                    505FDAC645318A2B1E575A389E4C96BF7D656245) smtp.auth=jwilk@jwilk.net
X-OVh-ClientIp: 5.172.255.122
Date:   Mon, 13 Mar 2023 15:52:09 +0100
From:   Jakub Wilk <jwilk@jwilk.net>
To:     "T.J. Alumbaugh" <talumbau@google.com>
CC:     Alejandro Colomar <alx.manpages@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Yu Zhao <yuzhao@google.com>, <linux-man@vger.kernel.org>
Subject: Re: [PATCH v2 1/1] posix_fadvise.2: NOREUSE now supported.
Message-ID: <20230313145209.snt5ci5sjop2utq4@jwilk.net>
References: <20230313134614.780515-1-talumbau@google.com>
 <20230313134614.780515-2-talumbau@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230313134614.780515-2-talumbau@google.com>
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG1EX1.mxp6.local (172.16.2.1) To DAG4EX1.mxp6.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 42a24d25-7d7a-44b5-8b13-2dd7d0ad0815
X-Ovh-Tracer-Id: 4079135366767957923
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvddvgedgjeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujghisehttdertddttddvnecuhfhrohhmpeflrghkuhgsucghihhlkhcuoehjfihilhhksehjfihilhhkrdhnvghtqeenucggtffrrghtthgvrhhnpeeutddtteelhfffuddvhefgfedujeeltdekheduveekkeelfeduuedvgeejudffgfenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehjfihilhhksehjfihilhhkrdhnvghtqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehtrghluhhmsggruhesghhoohhglhgvrdgtohhmpdgrlhigrdhmrghnphgrghgvshesghhmrghilhdrtghomhdprghkphhmsehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdphihuiihhrghosehgohhoghhlvgdrtghomhdplhhinhhugidqmhgrnhesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheehvddpmhhouggvpehsmhhtphhouhht
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

* T.J. Alumbaugh <talumbau@google.com>, 2023-03-13 13:46:
>POSIX_FADVISE_NOREUSE is now supported in Linux[1].

s/FADVISE/FADV/?

-- 
Jakub Wilk
