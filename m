Return-Path: <SRS0=cK25=3A=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D743C282DD
	for <linux-man@archiver.kernel.org>; Sat, 11 Jan 2020 15:00:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F36132072E
	for <linux-man@archiver.kernel.org>; Sat, 11 Jan 2020 15:00:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729863AbgAKPAY (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sat, 11 Jan 2020 10:00:24 -0500
Received: from git.icu ([163.172.180.134]:50676 "EHLO git.icu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729696AbgAKPAY (ORCPT <rfc822;linux-man@vger.kernel.org>);
        Sat, 11 Jan 2020 10:00:24 -0500
X-Greylist: delayed 567 seconds by postgrey-1.27 at vger.kernel.org; Sat, 11 Jan 2020 10:00:23 EST
Received: from localhost.localdomain (unknown [212.58.119.197])
        by git.icu (Postfix) with ESMTPSA id ED2652200EE;
        Sat, 11 Jan 2020 14:50:53 +0000 (UTC)
From:   Shawn Landden <shawn@git.icu>
Cc:     linux-man@vger.kernel.org, Shawn Landden <shawn@git.icu>
Subject: [PATCH] bcmp: note that this function is no longer legacy due to LLVM 9
Date:   Sat, 11 Jan 2020 18:50:49 +0400
Message-Id: <20200111145049.5393-1-shawn@git.icu>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Signed-off-by: Shawn Landden <shawn@git.icu>
---
 man3/bcmp.3 | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/man3/bcmp.3 b/man3/bcmp.3
index ba9838019..18d238720 100644
--- a/man3/bcmp.3
+++ b/man3/bcmp.3
@@ -70,15 +70,21 @@ T{
 .BR bcmp ()
 T}	Thread safety	MT-Safe
 .TE
 .SH CONFORMING TO
 4.3BSD.
-This function is deprecated (marked as LEGACY in POSIX.1-2001): use
-.BR memcmp (3)
-in new programs.
+This function was deprecated (marked as LEGACY) by POSIX.1-2001).
 POSIX.1-2008 removes the specification of
 .BR bcmp ().
+LLVM 9, released in 2019, revived
+.BR bcmp ()
+and generates calls to it instead of
+.BR memcmp (3)
+as appropiate as an optimization (as
+.BR bcmp ()
+need not traverse memory in-order).
+.\" http://releases.llvm.org/9.0.0/docs/ReleaseNotes.html#noteworthy-optimizations
 .SH SEE ALSO
 .BR bstring (3),
 .BR memcmp (3),
 .BR strcasecmp (3),
 .BR strcmp (3),
-- 
2.20.1

