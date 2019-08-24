Return-Path: <SRS0=GIqg=WU=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61A51C3A59E
	for <linux-man@archiver.kernel.org>; Sat, 24 Aug 2019 21:11:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2E0CA20870
	for <linux-man@archiver.kernel.org>; Sat, 24 Aug 2019 21:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1566681110;
	bh=gW9WBX2j0CKKO/pFh4YFuv/x5jdIuPYIXiEFLUn9oS4=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=SLTA7pyicmGseC2U1unE7/KphdMXLYtUeC7Py9P9X1+DbIAcCesTondHsotQ1NcbV
	 /zay0iKv592cU+FrnAIggyTUf7awkAOfgebTpWbYF7qjGkLzEEV0afIhylHVPkratc
	 bOHPdWg8Z+fHwl64fsRBGAHY+NvRmZMptTiQjChA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727907AbfHXVLt (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sat, 24 Aug 2019 17:11:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:53140 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727777AbfHXVLt (ORCPT <rfc822;linux-man@vger.kernel.org>);
        Sat, 24 Aug 2019 17:11:49 -0400
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net [24.5.143.220])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CA87120870;
        Sat, 24 Aug 2019 21:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566681108;
        bh=gW9WBX2j0CKKO/pFh4YFuv/x5jdIuPYIXiEFLUn9oS4=;
        h=From:To:Cc:Subject:Date:From;
        b=uyFKtHS6twMXUOE77JsBPoYa6XDnIjTuELU3sm66R2LmZo78VX4ptpGvQfSz55Tk2
         O/8SxIMatNfyHembhSXXEsW3AOA+7Tr27yyYhwUD2emILIVy4thgyMwbmcPVcBGTXU
         cm9JIyzNAhSETqHvr6vIiFpnfwlZ39OQ+euiSDUE=
From:   Eric Biggers <ebiggers@kernel.org>
To:     mtk.manpages@gmail.com
Cc:     linux-man@vger.kernel.org
Subject: [PATCH] socket.2: tfix
Date:   Sat, 24 Aug 2019 14:11:07 -0700
Message-Id: <20190824211107.16912-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

From: Eric Biggers <ebiggers@google.com>

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 man2/socket.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/socket.2 b/man2/socket.2
index 14f832022..0b3b90bb8 100644
--- a/man2/socket.2
+++ b/man2/socket.2
@@ -151,7 +151,7 @@ T}
 T{
 .B AF_PPPOX
 T}:T{
-Generic PPP transport layer, for setting up up L2 tunnels
+Generic PPP transport layer, for setting up L2 tunnels
 (L2TP and PPPoE)
 T}
 T{
-- 
2.23.0

