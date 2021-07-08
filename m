Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52FEBC07E96
	for <linux-man@archiver.kernel.org>; Thu,  8 Jul 2021 10:09:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3605561451
	for <linux-man@archiver.kernel.org>; Thu,  8 Jul 2021 10:09:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231474AbhGHKMe (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Thu, 8 Jul 2021 06:12:34 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:39764 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231470AbhGHKMe (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Thu, 8 Jul 2021 06:12:34 -0400
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out2.suse.de (Postfix) with ESMTP id B38DF201A7;
        Thu,  8 Jul 2021 10:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1625738991; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=CpzAq9mfunTIYUqCMEm5J6WhsrTT6hUBFad7V04ft2g=;
        b=AGvWOMPvp8Is47vOgt9IzxZJoKyLkIsaSR/+1YjE/JFtjeJLP/J6m9uMw4mNl5ak7IdUV5
        uGDTH2Q8xC29QMuBH9oH4a6SML5GVvcR12qB4eTpeVAfzL9IzXVgIVjsGKnJXCX1b6sIVT
        GXNBTpvAieZXvcahpQEmrvnbJZyhi9w=
Received: from g78.suse.de (unknown [10.163.24.38])
        by relay2.suse.de (Postfix) with ESMTP id 653C3A3B98;
        Thu,  8 Jul 2021 10:09:51 +0000 (UTC)
From:   Richard Palethorpe <rpalethorpe@suse.com>
To:     linux-man@vger.kernel.org
Cc:     Richard Palethorpe <rpalethorpe@suse.com>,
        Alejandro Colomar <alx.manpages@gmail.com>,
        Michael Kerrisk <mtk.manpages@gmail.com>
Subject: [PATCH] wait.2: Add ESRCH for when pid == INT_MIN
Date:   Thu,  8 Jul 2021 11:08:53 +0100
Message-Id: <20210708100853.17391-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Please see upstream commit:

 commit dd83c161fbcc5d8be637ab159c0de015cbff5ba4
 Author: zhongjiang <zhongjiang@huawei.com>
 Date:   Mon Jul 10 15:53:01 2017 -0700

     kernel/exit.c: avoid undefined behaviour when calling wait4()

It avoids negating INT_MIN by returning early with ESRCH.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 man2/wait.2 | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/man2/wait.2 b/man2/wait.2
index 5ae955b3f..63d872ee6 100644
--- a/man2/wait.2
+++ b/man2/wait.2
@@ -455,6 +455,15 @@ was caught; see
 The
 .I options
 argument was invalid.
+.TP
+.B ESRCH
+(for
+.BR wait ()
+or
+.BR waitpid ())
+.I pid
+is equal to
+.I INT_MIN
 .SH CONFORMING TO
 SVr4, 4.3BSD, POSIX.1-2001.
 .SH NOTES
-- 
2.31.1

