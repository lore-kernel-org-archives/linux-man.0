Return-Path: <linux-man-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B825EB64DA
	for <linux-man@archiver.kernel.org>; Fri, 14 Jul 2023 04:08:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233666AbjGNEIe (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Fri, 14 Jul 2023 00:08:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbjGNEId (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Fri, 14 Jul 2023 00:08:33 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 046252713
        for <linux-man@vger.kernel.org>; Thu, 13 Jul 2023 21:08:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9678061BCE
        for <linux-man@vger.kernel.org>; Fri, 14 Jul 2023 04:08:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DECBEC433C7;
        Fri, 14 Jul 2023 04:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689307712;
        bh=4S1grJh1/bWHWeboA+M1tvvqRNq3jrdpnayjNm/ulOU=;
        h=From:To:Cc:Subject:Date:From;
        b=UuBag1xjhSq0GxDrdmWog4Dbj0vDrZs5QmHPAFfgb2944ccYVnHB5ymSgNBTPJJqY
         xWMIY2N3/Lcjyz81vkwljH+xxqOOl9xlqKWgKMssiJtPFPOsdcWwuMGjlxbrzLmglz
         1KaC7XplVmp1LnlSTZb8UnRgvD6MuNbdYoWU1LymecMtxjP3PZDCM+8pAQUg5JkEEH
         P4YdzCbkmjB+C4GW5+k7110ycaDKU9H9YzM6j7pNA3/Zl7o+Zch8V2OFqYigegFx4V
         FDaEqoZH61lXEnU37K4MIUoEOCKBq7Q5BT4rTYNuI917+tS35t2PtbRmSExkdh95hg
         oCNABb9LL9LNg==
From:   Eric Biggers <ebiggers@kernel.org>
To:     Alejandro Colomar <alx.manpages@gmail.com>
Cc:     linux-man@vger.kernel.org
Subject: [PATCH] socket.7: tfix
Date:   Thu, 13 Jul 2023 21:08:12 -0700
Message-ID: <20230714040812.6384-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

From: Eric Biggers <ebiggers@google.com>

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 man7/socket.7 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man7/socket.7 b/man7/socket.7
index 59a7a3f49..985f52e55 100644
--- a/man7/socket.7
+++ b/man7/socket.7
@@ -539,7 +539,7 @@ flows are received.
 It allows each worker thread to be associated with
 a NIC HW receive queue and service all the connection
 requests received on that RX queue.
-This mapping between a app thread and
+This mapping between an app thread and
 a HW NIC queue streamlines the
 flow of data from the NIC to the application.
 .TP
-- 
2.41.0

