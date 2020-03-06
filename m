Return-Path: <SRS0=XLqC=4X=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E926C3F2D7
	for <linux-man@archiver.kernel.org>; Fri,  6 Mar 2020 06:01:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7CFFF2072A
	for <linux-man@archiver.kernel.org>; Fri,  6 Mar 2020 06:01:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725855AbgCFGBA (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Fri, 6 Mar 2020 01:01:00 -0500
Received: from smtp.gentoo.org ([140.211.166.183]:58942 "EHLO smtp.gentoo.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725847AbgCFGA7 (ORCPT <rfc822;linux-man@vger.kernel.org>);
        Fri, 6 Mar 2020 01:00:59 -0500
Received: from vapier.lan (localhost [127.0.0.1])
        by smtp.gentoo.org (Postfix) with ESMTP id E8AD434EDD4;
        Fri,  6 Mar 2020 06:00:58 +0000 (UTC)
From:   Mike Frysinger <vapier@gentoo.org>
To:     Michael Kerrisk <mtk.manpages@gmail.com>
Cc:     linux-man@vger.kernel.org
Subject: [PATCH] mlock.2: fix missing func styling
Date:   Fri,  6 Mar 2020 01:00:57 -0500
Message-Id: <20200306060057.21910-1-vapier@gentoo.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 man2/mlock.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/mlock.2 b/man2/mlock.2
index 1e3d13257d1c..920b09d969ee 100644
--- a/man2/mlock.2
+++ b/man2/mlock.2
@@ -273,7 +273,7 @@ glibc support was added in version 2.27.
 .SH CONFORMING TO
 POSIX.1-2001, POSIX.1-2008, SVr4.
 .PP
-mlock2 ()
+.BR mlock2 ()
 is Linux specific.
 .SH AVAILABILITY
 On POSIX systems on which
-- 
2.23.0

