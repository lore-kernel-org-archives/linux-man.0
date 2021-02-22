Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 083F8C433E0
	for <linux-man@archiver.kernel.org>; Mon, 22 Feb 2021 09:15:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ADB7861493
	for <linux-man@archiver.kernel.org>; Mon, 22 Feb 2021 09:15:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229886AbhBVJOv (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 22 Feb 2021 04:14:51 -0500
Received: from 7.mo51.mail-out.ovh.net ([46.105.33.25]:37635 "EHLO
        7.mo51.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230316AbhBVJOV (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Mon, 22 Feb 2021 04:14:21 -0500
Received: from mxplan6.mail.ovh.net (unknown [10.109.138.109])
        by mo51.mail-out.ovh.net (Postfix) with ESMTPS id C9F2C267DF5;
        Mon, 22 Feb 2021 08:56:44 +0100 (CET)
Received: from jwilk.net (37.59.142.99) by DAG4EX2.mxp6.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Mon, 22 Feb
 2021 08:56:43 +0100
Authentication-Results: garm.ovh; auth=pass (GARM-99G00307164c15-a97b-4d30-8c6e-47b226b8153a,
                    A2E1988F04140D9B9A9FE8CB33A6270137CAA94F) smtp.auth=jwilk@jwilk.net
X-OVh-ClientIp: 5.173.80.132
From:   Jakub Wilk <jwilk@jwilk.net>
To:     Michael Kerrisk <mtk.manpages@gmail.com>
CC:     <linux-man@vger.kernel.org>
Subject: [PATCH] scripts/bash_aliases: tfix
Date:   Mon, 22 Feb 2021 08:56:42 +0100
Message-ID: <20210222075642.6416-1-jwilk@jwilk.net>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG3EX1.mxp6.local (172.16.2.21) To DAG4EX2.mxp6.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 7a3ed92f-3bb6-468a-96bd-3c32f2258461
X-Ovh-Tracer-Id: 7186619105554585565
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrkedvgdduudefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvffufffkofgggfgtihesthekredtredttdenucfhrhhomheplfgrkhhusgcuhghilhhkuceojhifihhlkhesjhifihhlkhdrnhgvtheqnecuggftrfgrthhtvghrnhepvdehjeejffejjedvkeehheejieelhffftdduteefheeukeeuiedvudehveehfefhnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnheirdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepjhifihhlkhesjhifihhlkhdrnhgvthdprhgtphhtthhopehlihhnuhigqdhmrghnsehvghgvrhdrkhgvrhhnvghlrdhorhhg
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk@jwilk.net>
---
 scripts/bash_aliases | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/bash_aliases b/scripts/bash_aliases
index c0c8bc33e..a14c65cd4 100644
--- a/scripts/bash_aliases
+++ b/scripts/bash_aliases
@@ -128,7 +128,7 @@ function man_lsfunc()
 	|uniq;
 }
 
-#  pdfman()  reanders a manual page in PDF
+#  pdfman()  renders a manual page in PDF
 # Usage example:  .../man-pages$ pdfman man2/membarrier.2;
 
 function pdfman()
-- 
2.30.1

