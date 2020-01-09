Return-Path: <SRS0=8MFf=26=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7842C33CA2
	for <linux-man@archiver.kernel.org>; Thu,  9 Jan 2020 15:37:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B893E2067D
	for <linux-man@archiver.kernel.org>; Thu,  9 Jan 2020 15:37:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729912AbgAIPhH (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Thu, 9 Jan 2020 10:37:07 -0500
Received: from mx2.suse.de ([195.135.220.15]:41062 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728098AbgAIPhH (ORCPT <rfc822;linux-man@vger.kernel.org>);
        Thu, 9 Jan 2020 10:37:07 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 50C29ABC7;
        Thu,  9 Jan 2020 15:37:06 +0000 (UTC)
From:   Petr Vorel <pvorel@suse.cz>
To:     linux-man@vger.kernel.org
Cc:     Petr Vorel <pvorel@suse.cz>,
        Michael Kerrisk <mtk.manpages@gmail.com>
Subject: [PATCH 1/1] malloc.3: Remove duplicate _DEFAULT_SOURCE
Date:   Thu,  9 Jan 2020 16:36:51 +0100
Message-Id: <20200109153651.4847-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Fixes: d8d701003 ("malloc.3: Since glibc 2.29, realloc() is exposed by
defining _DEFAULT_SOURCE")

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 man3/malloc.3 | 1 -
 1 file changed, 1 deletion(-)

diff --git a/man3/malloc.3 b/man3/malloc.3
index 111e2a067..c3b688ab3 100644
--- a/man3/malloc.3
+++ b/man3/malloc.3
@@ -51,7 +51,6 @@ Feature Test Macro Requirements for glibc (see
 .PP
 .BR reallocarray ():
 .ad l
-_GNU_SOURCE
     Since glibc 2.29:
         _DEFAULT_SOURCE
     Glibc 2.28 and earlier:
-- 
2.24.1

