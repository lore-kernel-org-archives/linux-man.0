Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32C0AC433FE
	for <linux-man@archiver.kernel.org>; Thu, 13 Oct 2022 00:49:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232084AbiJMAtF (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Wed, 12 Oct 2022 20:49:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232438AbiJMAsu (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Wed, 12 Oct 2022 20:48:50 -0400
Received: from smtp.gentoo.org (mail.gentoo.org [IPv6:2001:470:ea4a:1:5054:ff:fec7:86e4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01792107CDC
        for <linux-man@vger.kernel.org>; Wed, 12 Oct 2022 17:42:53 -0700 (PDT)
From:   Sam James <sam@gentoo.org>
To:     Alejandro Colomar <alx.manpages@gmail.com>,
        Michael Kerrisk <mtk.manpages@gmail.com>
Cc:     linux-man@vger.kernel.org, Sam James <sam@gentoo.org>
Subject: [PATCH] time_t.3type: reference _TIME_BITS
Date:   Thu, 13 Oct 2022 01:33:13 +0100
Message-Id: <20221013003313.1809731-1-sam@gentoo.org>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Just like we do with _FILE_OFFSET_BITS in off_t.3type.

Reference: https://wiki.gentoo.org/wiki/Project:Toolchain/time64_migration
Reference: https://sourceware.org/pipermail/libc-alpha/2022-January/134985.html
Signed-off-by: Sam James <sam@gentoo.org>
---
 man3type/time_t.3type | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/man3type/time_t.3type b/man3type/time_t.3type
index d40dd0c0d..9b8f07356 100644
--- a/man3type/time_t.3type
+++ b/man3type/time_t.3type
@@ -70,6 +70,12 @@ POSIX.1-2001 and later.
 POSIX.1-2001 and later.
 .PD
 .SH NOTES
+On some architectures,
+the width of
+.I time_t
+can be controlled with the feature test macro
+.BR _TIME_BITS .
+.PP
 .TP
 .I time_t
 The following headers also provide
-- 
2.38.0

