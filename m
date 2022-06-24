Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8922EC43334
	for <linux-man@archiver.kernel.org>; Fri, 24 Jun 2022 03:04:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229683AbiFXDEe (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Thu, 23 Jun 2022 23:04:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231199AbiFXDCT (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Thu, 23 Jun 2022 23:02:19 -0400
Received: from smtp.gentoo.org (woodpecker.gentoo.org [IPv6:2001:470:ea4a:1:5054:ff:fec7:86e4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10D4125592
        for <linux-man@vger.kernel.org>; Thu, 23 Jun 2022 20:00:02 -0700 (PDT)
From:   Sam James <sam@gentoo.org>
To:     linux-man@vger.kernel.org
Cc:     Alejandro Colomar <alx.manpages@gmail.com>,
        Michael Kerrisk <mtk.manpages@gmail.com>,
        Sam James <sam@gentoo.org>
Subject: [PATCH] updwtmp.3: Add #define GNU_SOURCE for updwtmpx
Date:   Fri, 24 Jun 2022 03:59:11 +0100
Message-Id: <20220624025911.728497-1-sam@gentoo.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=216168
Signed-off-by: Sam James <sam@gentoo.org>
---
 man3/updwtmp.3 | 1 +
 1 file changed, 1 insertion(+)

diff --git a/man3/updwtmp.3 b/man3/updwtmp.3
index bd84b91cd..175bec772 100644
--- a/man3/updwtmp.3
+++ b/man3/updwtmp.3
@@ -66,6 +66,7 @@ glibc provides (since version 2.1):
 .PP
 .in +4n
 .EX
+.BR "#define _GNU_SOURCE          " "/* See feature_test_macros(7) */"
 .B #include <utmpx.h>
 .BI "void updwtmpx (const char *" wtmpx_file ", const struct utmpx *" utx );
 .EE
-- 
2.36.1

