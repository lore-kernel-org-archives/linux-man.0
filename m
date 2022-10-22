Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91540C433FE
	for <linux-man@archiver.kernel.org>; Sat, 22 Oct 2022 18:57:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbiJVS5b (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sat, 22 Oct 2022 14:57:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbiJVS5a (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sat, 22 Oct 2022 14:57:30 -0400
Received: from smtp.gentoo.org (dev.gentoo.org [IPv6:2001:470:ea4a:1:5054:ff:fec7:86e4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63B4815A8C5
        for <linux-man@vger.kernel.org>; Sat, 22 Oct 2022 11:57:29 -0700 (PDT)
Received: by smtp.gentoo.org (Postfix, from userid 559)
        id 061CB3412B5; Sat, 22 Oct 2022 18:57:29 +0000 (UTC)
From:   Mike Frysinger <vapier@gentoo.org>
To:     Michael Kerrisk <mtk.manpages@gmail.com>,
        Alejandro Colomar <alx.manpages@gmail.com>
Cc:     linux-man@vger.kernel.org
Subject: [PATCH] man-pages.7: use . consistently in bulleted list
Date:   Sat, 22 Oct 2022 23:28:01 +0545
Message-Id: <20221022174301.11895-1-vapier@gentoo.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 man7/man-pages.7 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man7/man-pages.7 b/man7/man-pages.7
index 941832f15329..212327c7773c 100644
--- a/man7/man-pages.7
+++ b/man7/man-pages.7
@@ -1134,7 +1134,7 @@ Always do this if the explanatory text includes a shell session log.
 If you include a shell session log demonstrating the use of a program
 or other system feature:
 .IP * 3
-Place the session log above the source code listing
+Place the session log above the source code listing.
 .IP *
 Indent the session log by four spaces.
 .IP *
-- 
2.37.3

