Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC15EC433E0
	for <linux-man@archiver.kernel.org>; Tue, 22 Dec 2020 05:56:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 856FA23120
	for <linux-man@archiver.kernel.org>; Tue, 22 Dec 2020 05:56:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725782AbgLVF4j (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Tue, 22 Dec 2020 00:56:39 -0500
Received: from mail.cn.fujitsu.com ([183.91.158.132]:16816 "EHLO
        heian.cn.fujitsu.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725300AbgLVF4j (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Tue, 22 Dec 2020 00:56:39 -0500
X-IronPort-AV: E=Sophos;i="5.78,438,1599494400"; 
   d="scan'208";a="102808616"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 22 Dec 2020 13:55:51 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
        by cn.fujitsu.com (Postfix) with ESMTP id 4AE854CE4B3E;
        Tue, 22 Dec 2020 13:55:47 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 22 Dec 2020 13:55:46 +0800
From:   Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To:     <mtk.manpages@gmail.com>
CC:     <linux-man@vger.kernel.org>, Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Subject: [PATCH] semctl.2: Correct SEM_STAT_ANY description
Date:   Tue, 22 Dec 2020 13:55:43 +0800
Message-ID: <1608616543-21436-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 4AE854CE4B3E.AEBB4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Since kernel commit a280d6dc77eb ("ipc/sem: introduce semctl(SEM_STAT_ANY)"),
it only skips read access check when using SEM_STAT_ANY command. And it should
use the semid_ds struct instead of seminfo struct. Fix this.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 man2/semctl.2 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man2/semctl.2 b/man2/semctl.2
index dd3fb077b..a7462c5cc 100644
--- a/man2/semctl.2
+++ b/man2/semctl.2
@@ -297,8 +297,8 @@ all semaphore sets on the system.
 .TP
 .BR SEM_STAT_ANY " (Linux-specific, since Linux 4.17)"
 Return a
-.I seminfo
-structure containing the same information as for
+.I semid_ds
+structure as for
 .BR SEM_STAT .
 However,
 .I sem_perm.mode
-- 
2.23.0



