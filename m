Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 608D3C4332F
	for <linux-man@archiver.kernel.org>; Thu, 13 Oct 2022 21:06:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229657AbiJMVGi (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Thu, 13 Oct 2022 17:06:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229812AbiJMVGh (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Thu, 13 Oct 2022 17:06:37 -0400
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A168183D92
        for <linux-man@vger.kernel.org>; Thu, 13 Oct 2022 14:06:30 -0700 (PDT)
From:   Sam James <sam@gentoo.org>
To:     Alejandro Colomar <alx.manpages@gmail.com>,
        Michael Kerrisk <mtk.manpages@gmail.com>
Cc:     linux-man@vger.kernel.org, Sam James <sam@gentoo.org>
Subject: [PATCH v2] feature_test_macros.7: document -D_FORTIFY_SOURCE=3
Date:   Thu, 13 Oct 2022 22:06:26 +0100
Message-Id: <20221013210626.1553315-1-sam@gentoo.org>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Reference: https://developers.redhat.com/blog/2021/04/16/broadening-compiler-checks-for-buffer-overflows-in-_fortify_source
Reference: https://developers.redhat.com/articles/2022/09/17/gccs-new-fortification-level
Signed-off-by: Sam James <sam@gentoo.org>
---
 man7/feature_test_macros.7 | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/man7/feature_test_macros.7 b/man7/feature_test_macros.7
index cdd962f7f..f057c1c87 100644
--- a/man7/feature_test_macros.7
+++ b/man7/feature_test_macros.7
@@ -634,9 +634,23 @@ and result in compiler warnings;
 other checks take place at run time,
 and result in a run-time error if the check fails.
 .IP
+With
+.B _FORTIFY_SOURCE
+set to 3, additional checking is added to intercept some function
+calls used with an argument of variable size where the compiler can
+deduce an upper bound for its value.
+For example, a program where malloc's size argument is variable
+can now be fortified.
+.IP
 Use of this macro requires compiler support, available with
 .BR gcc (1)
 since version 4.0.
+.IP
+For use of
+.B _FORTIFY_SOURCE
+set to 3, then
+.BR gcc (1)
+version 12.0 or later is required.
 .SS Default definitions, implicit definitions, and combining definitions
 If no feature test macros are explicitly defined,
 then the following feature test macros are defined by default:
-- 
2.38.0

