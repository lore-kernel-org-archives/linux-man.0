Return-Path: <SRS0=2Qzo=2C=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68A20C43603
	for <linux-man@archiver.kernel.org>; Thu, 12 Dec 2019 07:23:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3E5EC206DA
	for <linux-man@archiver.kernel.org>; Thu, 12 Dec 2019 07:23:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728015AbfLLHXk (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Thu, 12 Dec 2019 02:23:40 -0500
Received: from mail.cn.fujitsu.com ([183.91.158.132]:18506 "EHLO
        heian.cn.fujitsu.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727994AbfLLHXk (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Thu, 12 Dec 2019 02:23:40 -0500
X-IronPort-AV: E=Sophos;i="5.69,304,1571673600"; 
   d="scan'208";a="80101010"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 12 Dec 2019 15:23:37 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
        by cn.fujitsu.com (Postfix) with ESMTP id B0CAB4CE26D7;
        Thu, 12 Dec 2019 15:14:58 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 12 Dec 2019 15:23:34 +0800
From:   Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To:     <mtk.manpages@gmail.com>
CC:     <linux-man@vger.kernel.org>, Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Subject: [PATCH] capget.2: Correct info about EPERM error
Date:   Thu, 12 Dec 2019 15:23:55 +0800
Message-ID: <1576135435-907-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: B0CAB4CE26D7.A1193
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

I see kernel code security/commoncap.c cap_capset function, it only
verifies the new_Effective is a subset of the new_Permitted. It doesn't
verify whether the new_Inheritable is a subset of the new_Permitted.

I found it when I cleanup ltp capset02 test code.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 man2/capget.2 | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/man2/capget.2 b/man2/capget.2
index 94d38d877..6cad3d5d8 100644
--- a/man2/capget.2
+++ b/man2/capget.2
@@ -195,8 +195,7 @@ One of the arguments was invalid.
 .TP
 .B EPERM
 An attempt was made to add a capability to the Permitted set, or to set
-a capability in the Effective or Inheritable sets that is not in the
-Permitted set.
+a capability in the Effective sets that is not in the Permitted set.
 .TP
 .B EPERM
 The caller attempted to use
-- 
2.18.0



