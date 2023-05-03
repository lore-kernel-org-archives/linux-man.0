Return-Path: <linux-man-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE298C77B7F
	for <linux-man@archiver.kernel.org>; Wed,  3 May 2023 18:57:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbjECS5m (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Wed, 3 May 2023 14:57:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229828AbjECS5l (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Wed, 3 May 2023 14:57:41 -0400
X-Greylist: delayed 4201 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 03 May 2023 11:57:40 PDT
Received: from 8.mo552.mail-out.ovh.net (8.mo552.mail-out.ovh.net [46.105.37.156])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02B7910D9
        for <linux-man@vger.kernel.org>; Wed,  3 May 2023 11:57:39 -0700 (PDT)
Received: from mxplan6.mail.ovh.net (unknown [10.109.143.174])
        by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 6469E25F8B;
        Wed,  3 May 2023 15:57:40 +0000 (UTC)
Received: from jwilk.net (37.59.142.105) by DAG4EX1.mxp6.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 3 May
 2023 17:57:39 +0200
Authentication-Results: garm.ovh; auth=pass (GARM-105G006cda145ab-5940-4420-8043-e4ee5aee19c5,
                    AB1C2182D6A126058706FFD0D1EE887043C1DE6E) smtp.auth=jwilk@jwilk.net
X-OVh-ClientIp: 5.172.255.151
From:   Jakub Wilk <jwilk@jwilk.net>
To:     Michael Kerrisk <mtk.manpages@gmail.com>,
        Alejandro Colomar <alx.manpages@gmail.com>
CC:     <linux-man@vger.kernel.org>
Subject: [PATCH] resolv.conf.5: tfix
Date:   Wed, 3 May 2023 17:57:38 +0200
Message-ID: <20230503155738.2719-1-jwilk@jwilk.net>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG6EX1.mxp6.local (172.16.2.51) To DAG4EX1.mxp6.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 93f5c58d-893b-49c3-96b9-5734bcbadbf9
X-Ovh-Tracer-Id: 9544253511390451680
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrfedvkedgledvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffoggfgtghisehtkeertdertddtnecuhfhrohhmpeflrghkuhgsucghihhlkhcuoehjfihilhhksehjfihilhhkrdhnvghtqeenucggtffrrghtthgvrhhnpeefhfetfffhffehtedufedvfeehfffgudeljeehieetiefhfeffjeevleejveehieenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddthedphedrudejvddrvdehhedrudehudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehjfihilhhksehjfihilhhkrdhnvghtqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehmthhkrdhmrghnphgrghgvshesghhmrghilhdrtghomhdprghlgidrmhgrnhhprghgvghssehgmhgrihhlrdgtohhmpdhlihhnuhigqdhmrghnsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehhedvpdhmohguvgepshhmthhpohhuth
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk@jwilk.net>
---
 man5/resolv.conf.5 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man5/resolv.conf.5 b/man5/resolv.conf.5
index 7e207b0f4..5687e4c08 100644
--- a/man5/resolv.conf.5
+++ b/man5/resolv.conf.5
@@ -215,7 +215,7 @@ is still used,
 .BR getaddrinfo (3)
 with
 .B AI_PASSIVE
-will stillproduce IPv6 addresses,
+will still produce IPv6 addresses,
 and configured IPv6 name servers are still used.
 To produce correct Name Error (NXDOMAIN) results,
 AAAA queries are translated to A queries.
-- 
2.40.1

