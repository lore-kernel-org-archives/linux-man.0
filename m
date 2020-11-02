Return-Path: <SRS0=HENb=EI=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F1EAC00A89
	for <linux-man@archiver.kernel.org>; Mon,  2 Nov 2020 04:20:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E99FB21556
	for <linux-man@archiver.kernel.org>; Mon,  2 Nov 2020 04:20:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zlima12.com header.i=@zlima12.com header.b="N5mfuyx+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727561AbgKBEUs (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sun, 1 Nov 2020 23:20:48 -0500
Received: from smtp.zlima12.com ([107.172.191.159]:48284 "EHLO
        smtp.zlima12.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727555AbgKBEUs (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sun, 1 Nov 2020 23:20:48 -0500
X-Greylist: delayed 537 seconds by postgrey-1.27 at vger.kernel.org; Sun, 01 Nov 2020 23:20:48 EST
Date:   Sun, 1 Nov 2020 23:11:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zlima12.com; s=dkim;
        t=1604290310; bh=U7IpiO++n4s8fk9sP9ZpYIaH8Rfpie29/FnMig6UcuM=;
        h=Date:From:To:Cc:Subject;
        b=N5mfuyx+8fIMav5hm7f7bZ9h+nT2qUyOSH+b+rFTieNcsIhNQE9RlSBS8TJlusSzo
         B+BQlCpNMq7WpgjjQWJCsqwIm5Obhkrheb2v3G1JyRrxE3PhLVFZZJqv46XhjNZVZ+
         RvqW5NxEw7duEegKtFuyU5FXqvPl4ed0cUwb8j4wZ/AtExyt+b9FKhvIrt6fiYrQ0Q
         yuNzjUpNMxsiLGHKD7jDaTGPj1z/nq1GB5xGBES8S6Z86VP+/JNx7BXkvV9XY/shhs
         eQ6E3GZImbYcFtEXoLQH2/rlAkDIgmwAdymZu5SlG53MRUNJjeC8JrDwZmWFUm/yoX
         YbHnRSmabbYYA==
From:   "John A. Leuenhagen" <john@zlima12.com>
To:     mtk.manpages@gmail.com
Cc:     linux-man@vger.kernel.org
Subject: [patch] feature_test_macros.7: tfix
Message-ID: <20201102040951.7xkhsyaosgynozqm@Zulu-1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Signed-off-by: John A. Leuenhagen <john@zlima12.com>
---
 man7/feature_test_macros.7 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man7/feature_test_macros.7 b/man7/feature_test_macros.7
index 2d7bcacfc..350e47c76 100644
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
2.29.1

