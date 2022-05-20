Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3211DC433F5
	for <linux-man@archiver.kernel.org>; Fri, 20 May 2022 14:17:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350191AbiETORa (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Fri, 20 May 2022 10:17:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349233AbiETOR3 (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Fri, 20 May 2022 10:17:29 -0400
X-Greylist: delayed 159 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 20 May 2022 07:17:28 PDT
Received: from joooj.vinc17.net (joooj.vinc17.net [155.133.131.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26B8D167E0
        for <linux-man@vger.kernel.org>; Fri, 20 May 2022 07:17:27 -0700 (PDT)
Received: from smtp-zira.vinc17.net (128.119.75.86.rev.sfr.net [86.75.119.128])
        by joooj.vinc17.net (Postfix) with ESMTPSA id C30B8274;
        Fri, 20 May 2022 16:14:46 +0200 (CEST)
Received: by zira.vinc17.org (Postfix, from userid 1000)
        id EE1832800218; Fri, 20 May 2022 16:14:45 +0200 (CEST)
From:   Vincent Lefevre <vincent@vinc17.net>
To:     linux-man@vger.kernel.org,
        Alejandro Colomar <alx.manpages@gmail.com>,
        Michael Kerrisk <mtk.manpages@gmail.com>
Cc:     Vincent Lefevre <vincent@vinc17.net>
Subject: [PATCH] printf.3: Document 'l' length modifier for a, A, e, E, f, F, g, and G
Date:   Fri, 20 May 2022 16:10:40 +0200
Message-Id: <20220520141040.1136383-1-vincent@vinc17.net>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Signed-off-by: Vincent Lefevre <vincent@vinc17.net>
---
 man3/printf.3 | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/man3/printf.3 b/man3/printf.3
index 4fa1f11f3..63ea3092f 100644
--- a/man3/printf.3
+++ b/man3/printf.3
@@ -502,7 +502,17 @@ argument, or a following
 .B s
 conversion corresponds to a pointer to
 .I wchar_t
-argument.
+argument. In C99, on a following
+.BR a ,
+.BR A ,
+.BR e ,
+.BR E ,
+.BR f ,
+.BR F ,
+.BR g ,
+or
+.B G
+conversion, this length modifier is ignored.
 .TP
 .B ll
 (ell-ell).
-- 
2.36.1

