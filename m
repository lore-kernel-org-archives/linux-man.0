Return-Path: <SRS0=0E5y=62=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F060CA90AF
	for <linux-man@archiver.kernel.org>; Tue, 12 May 2020 16:37:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3508A206CC
	for <linux-man@archiver.kernel.org>; Tue, 12 May 2020 16:37:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728163AbgELQh5 (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Tue, 12 May 2020 12:37:57 -0400
Received: from foss.arm.com ([217.140.110.172]:58244 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726367AbgELQh5 (ORCPT <rfc822;linux-man@vger.kernel.org>);
        Tue, 12 May 2020 12:37:57 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 26EE011B3;
        Tue, 12 May 2020 09:37:57 -0700 (PDT)
Received: from e103592.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6EDD23F305;
        Tue, 12 May 2020 09:37:56 -0700 (PDT)
From:   Dave Martin <Dave.Martin@arm.com>
To:     mtk.manpages@gmail.com
Cc:     linux-man@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 12/14] prctl.2: Clarify the unsupported hardware case of EINVAL
Date:   Tue, 12 May 2020 17:36:57 +0100
Message-Id: <1589301419-24459-13-git-send-email-Dave.Martin@arm.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1589301419-24459-1-git-send-email-Dave.Martin@arm.com>
References: <1589301419-24459-1-git-send-email-Dave.Martin@arm.com>
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

prctls that are architecture-specific won't work on other
architectures, and arch-specific prctls that manipulate optional
hardware features likewise won't work if that hardware feature is
not present.

The established pattern seems to be to treat such prctls as if they
are unimplemented, when attempted on the wrong hardware.

Cover these cases with some generic weasel words in the closet
existing EINVAL clause.

Signed-off-by: Dave Martin <Dave.Martin@arm.com>
---
 man2/prctl.2 | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/man2/prctl.2 b/man2/prctl.2
index 2361b44..7f511d2 100644
--- a/man2/prctl.2
+++ b/man2/prctl.2
@@ -1616,7 +1616,8 @@ is an invalid address.
 .B EINVAL
 The value of
 .I option
-is not recognized.
+is not recognized,
+or not supported on this system.
 .TP
 .B EINVAL
 .I option
-- 
2.1.4

