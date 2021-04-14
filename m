Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5F7DC433ED
	for <linux-man@archiver.kernel.org>; Wed, 14 Apr 2021 12:16:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 961556100C
	for <linux-man@archiver.kernel.org>; Wed, 14 Apr 2021 12:16:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232983AbhDNMQ6 (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Wed, 14 Apr 2021 08:16:58 -0400
Received: from mail.skyhub.de ([5.9.137.197]:39480 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232412AbhDNMQ5 (ORCPT <rfc822;linux-man@vger.kernel.org>);
        Wed, 14 Apr 2021 08:16:57 -0400
Received: from zn.tnic (p200300ec2f0e8f000d8b3334e5756a5b.dip0.t-ipconnect.de [IPv6:2003:ec:2f0e:8f00:d8b:3334:e575:6a5b])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 945441EC0258;
        Wed, 14 Apr 2021 14:16:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1618402595;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:
         content-transfer-encoding:content-transfer-encoding:in-reply-to:
         references; bh=YhKDDgHiv9rxK05BxM0e6UZsfpIL0YSWJyUfLdVEHz8=;
        b=hPx6GRbIRHzY3z9uHplyB/MNhkkeIoFDsioYqmLX5DrTKCBReqGab1UM7GB0Ea/U7+Z2xE
        lTl4Mu1dHc16m+x8A5rvNeiBm0Oce15+upVA3/Ehqnh5F61IJCji+QNm1DodPKQ6vd1DQB
        sXxTb25+rqguRfxJVMACMl0HFKAm0Ug=
From:   Borislav Petkov <bp@alien8.de>
To:     linux-man@vger.kernel.org
Cc:     Alejandro Colomar <alx.manpages@gmail.com>,
        Michael Kerrisk <mtk.manpages@gmail.com>
Subject: [PATCH] sigaltstack.2: tfix
Date:   Wed, 14 Apr 2021 14:16:30 +0200
Message-Id: <20210414121630.16201-1-bp@alien8.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

From: Borislav Petkov <bp@suse.de>

Add a missing "to" in an "in order to" formulation.

Signed-off-by: Borislav Petkov <bp@suse.de>
---
 man2/sigaltstack.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/sigaltstack.2 b/man2/sigaltstack.2
index c8d5c184f3ab..53268ccbea96 100644
--- a/man2/sigaltstack.2
+++ b/man2/sigaltstack.2
@@ -111,7 +111,7 @@ Clear the alternate signal stack settings on entry to the signal handler.
 When the signal handler returns,
 the previous alternate signal stack settings are restored.
 .IP
-This flag was added in order make it safe
+This flag was added in order to make it safe
 to switch away from the signal handler with
 .BR swapcontext (3).
 Without this flag, a subsequently handled signal will corrupt
-- 
2.29.2

