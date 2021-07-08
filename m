Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81CF6C07E96
	for <linux-man@archiver.kernel.org>; Thu,  8 Jul 2021 15:38:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5A2AC61920
	for <linux-man@archiver.kernel.org>; Thu,  8 Jul 2021 15:38:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231941AbhGHPlB (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Thu, 8 Jul 2021 11:41:01 -0400
Received: from 8.mo548.mail-out.ovh.net ([46.105.45.231]:42555 "EHLO
        8.mo548.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231804AbhGHPlB (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Thu, 8 Jul 2021 11:41:01 -0400
X-Greylist: delayed 7526 seconds by postgrey-1.27 at vger.kernel.org; Thu, 08 Jul 2021 11:41:01 EDT
Received: from mxplan6.mail.ovh.net (unknown [10.109.143.174])
        by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 29D821FF1A;
        Thu,  8 Jul 2021 13:10:58 +0000 (UTC)
Received: from jwilk.net (37.59.142.95) by DAG4EX2.mxp6.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.10; Thu, 8 Jul
 2021 15:10:57 +0200
Authentication-Results: garm.ovh; auth=pass (GARM-95G001144a3b12-0684-49df-a6dd-8e3299bd8f36,
                    A1FE38477F9A9F1AE3DC32770B9A4BD99AC82036) smtp.auth=jwilk@jwilk.net
X-OVh-ClientIp: 5.173.81.109
Date:   Thu, 8 Jul 2021 15:10:55 +0200
From:   Jakub Wilk <jwilk@jwilk.net>
To:     <linux-man@vger.kernel.org>
CC:     Eugene Syromyatnikov <evgsyr@gmail.com>
Subject: Re: [PATCH v2] getrlimit.2: old_getrlimit/ugetrlimit and
 RLIM_INFINITY discrepancies
Message-ID: <20210708131054.o4sgoy7barhl3kmu@jwilk.net>
References: <20210708121713.GA15864@asgard.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20210708121713.GA15864@asgard.redhat.com>
User-Agent: NeoMutt/20180716
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG3EX2.mxp6.local (172.16.2.22) To DAG4EX2.mxp6.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: e568ad57-c1a0-49b2-b224-9e407528451c
X-Ovh-Tracer-Id: 17969643991864432538
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrtdeggdehlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepfffhvffukfhfgggtuggjfghisehttdertddtredvnecuhfhrohhmpeflrghkuhgsucghihhlkhcuoehjfihilhhksehjfihilhhkrdhnvghtqeenucggtffrrghtthgvrhhnpeettdetkeevleeuiefhjefhueeuveefieehgfefleevtdeijefhudeuffdvfeefvdenucffohhmrghinhepohhrrdgtiienucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghniedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehjfihilhhksehjfihilhhkrdhnvghtpdhrtghpthhtohepvghvghhshihrsehgmhgrihhlrdgtohhm
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

* Eugene Syromyatnikov <evgsyr@gmail.com>, 2021-07-08, 14:17:
>+Original Linux implementation used signed types for limits; that was changed
>+(along with the value of the
>+.B RLIM_INFINITY
>+constant)
>+.\" http://repo.or.cz/davej-history.git/blobdiff/129f8758d8c41e0378ace0b6e2f56bbb8a1ec694..15305d2e69c3a838bacd78962c07077d2821f255:/include/linux/resource.h
>+during 2.4 development cycle, as it wasn't compatible

Oh, interesting.

That would explain why the man page incorrectly claims the upper limit 
for RLIMIT_AS is 2 GiB on 32-bit systems.

>+Also worth noting that Several architectures decided not to change

s/Several/several/;
or maybe s/Also worth noting that //.

-- 
Jakub Wilk
