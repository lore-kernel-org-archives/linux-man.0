Return-Path: <SRS0=H3nP=BL=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68A0AC433E0
	for <linux-man@archiver.kernel.org>; Sat,  1 Aug 2020 04:05:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 47A5B2076A
	for <linux-man@archiver.kernel.org>; Sat,  1 Aug 2020 04:05:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725280AbgHAEF6 (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sat, 1 Aug 2020 00:05:58 -0400
Received: from [220.88.252.109] ([220.88.252.109]:47749 "EHLO
        mail.stackframe.dev" rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org
        with ESMTP id S1725275AbgHAEF6 (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sat, 1 Aug 2020 00:05:58 -0400
X-Greylist: delayed 537 seconds by postgrey-1.27 at vger.kernel.org; Sat, 01 Aug 2020 00:05:58 EDT
Received: from stackframe.dev (stackframe-dev [220.88.252.109])
        by mail.stackframe.dev (Postfix) with ESMTPS id 0E11B2391F;
        Sat,  1 Aug 2020 12:57:00 +0900 (KST)
Date:   Sat, 1 Aug 2020 12:56:58 +0900
From:   Gibeom Gwon <gb.gwon@stackframe.dev>
To:     mtk.manpages@gmail.com
Cc:     linux-man@vger.kernel.org
Subject: [PATCH] feature_test_macros.7: tfix
Message-ID: <20200801035658.GA683@stackframe.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Signed-off-by: Gibeom Gwon <gb.gwon@stackframe.dev>
---
 man7/feature_test_macros.7 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man7/feature_test_macros.7 b/man7/feature_test_macros.7
index 445295acc..53689d781 100644
--- a/man7/feature_test_macros.7
+++ b/man7/feature_test_macros.7
@@ -50,7 +50,7 @@ itself includes
 .EX
 #include <abc.h>
 #define _GNU_SOURCE
-#include <xys.h>
+#include <xyz.h>
 .EE
 .in
 .PP
-- 
2.27.0

