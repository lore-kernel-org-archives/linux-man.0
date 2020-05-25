Return-Path: <SRS0=2H52=7H=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09636C433E0
	for <linux-man@archiver.kernel.org>; Mon, 25 May 2020 13:21:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DB9452070A
	for <linux-man@archiver.kernel.org>; Mon, 25 May 2020 13:21:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388737AbgEYNVw (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 25 May 2020 09:21:52 -0400
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:48491 "EHLO
        smtpout1.mo804.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388685AbgEYNVw (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Mon, 25 May 2020 09:21:52 -0400
Received: from mxplan6.mail.ovh.net (unknown [10.108.16.90])
        by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 98C9D3E3ECF1;
        Mon, 25 May 2020 15:21:50 +0200 (CEST)
Received: from jwilk.net (37.59.142.105) by DAG4EX2.mxp6.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1779.2; Mon, 25 May
 2020 15:21:49 +0200
Authentication-Results: garm.ovh; auth=pass (GARM-105G006981292c2-b354-4456-9145-88ed51820015,6F6664E83CEDE23F121728FE43BC1480B95F6CB9) smtp.auth=jwilk@jwilk.net
From:   Jakub Wilk <jwilk@jwilk.net>
To:     Michael Kerrisk <mtk.manpages@gmail.com>
CC:     <linux-man@vger.kernel.org>
Subject: [PATCH] prctl.2: tfix
Date:   Mon, 25 May 2020 15:21:48 +0200
Message-ID: <20200525132148.9935-1-jwilk@jwilk.net>
X-Mailer: git-send-email 2.27.0.rc0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG5EX1.mxp6.local (172.16.2.41) To DAG4EX2.mxp6.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: e33720a2-1358-4f92-858f-14a954c9fa08
X-Ovh-Tracer-Id: 14298365870790072285
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedruddvtddgiedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvffufffkofgggfgtihesthekredtredttdenucfhrhhomheplfgrkhhusgcuhghilhhkuceojhifihhlkhesjhifihhlkhdrnhgvtheqnecuggftrfgrthhtvghrnhepffduveevtefgffegjeefvedutdehheetffekhefgueevheduteehvedvudejtdfgnecuffhomhgrihhnpehvihgrrdhirhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnheirdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepjhifihhlkhesjhifihhlkhdrnhgvthdprhgtphhtthhopehlihhnuhigqdhmrghnsehvghgvrhdrkhgvrhhnvghlrdhorhhg
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Remove duplicated word.

Signed-off-by: Jakub Wilk <jwilk@jwilk.net>
---
 man2/prctl.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/prctl.2 b/man2/prctl.2
index 968a75ab4..605194fc7 100644
--- a/man2/prctl.2
+++ b/man2/prctl.2
@@ -884,7 +884,7 @@ The attribute is likewise accessible via
 .IR /proc/self/task/[tid]/comm ,
 where
 .I [tid]
-is the the thread ID of the calling thread, as returned by
+is the thread ID of the calling thread, as returned by
 .BR gettid (2).
 .\" prctl PR_GET_NAME
 .TP
-- 
2.27.0.rc0

