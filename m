Return-Path: <SRS0=8MFf=26=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 491D1C282DD
	for <linux-man@archiver.kernel.org>; Thu,  9 Jan 2020 15:46:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 292472067D
	for <linux-man@archiver.kernel.org>; Thu,  9 Jan 2020 15:46:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728293AbgAIPqg (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Thu, 9 Jan 2020 10:46:36 -0500
Received: from mx2.suse.de ([195.135.220.15]:47488 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731203AbgAIPqg (ORCPT <rfc822;linux-man@vger.kernel.org>);
        Thu, 9 Jan 2020 10:46:36 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 20D00ACA4;
        Thu,  9 Jan 2020 15:46:35 +0000 (UTC)
From:   Petr Vorel <pvorel@suse.cz>
To:     linux-man@vger.kernel.org
Cc:     Petr Vorel <pvorel@suse.cz>,
        Michael Kerrisk <mtk.manpages@gmail.com>,
        Li Wang <liwang@redhat.com>, Cyril Hrubis <chrubis@suse.cz>
Subject: [PATCH 1/1] syscall.2: Update Feature Test Macro Requirements
Date:   Thu,  9 Jan 2020 16:46:26 +0100
Message-Id: <20200109154626.6206-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Reported-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 man2/syscall.2 | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/man2/syscall.2 b/man2/syscall.2
index 9091b34bb..3fc32cb7a 100644
--- a/man2/syscall.2
+++ b/man2/syscall.2
@@ -44,12 +44,22 @@
 syscall \- indirect system call
 .SH SYNOPSIS
 .nf
-.BR "#define _GNU_SOURCE" "         /* See feature_test_macros(7) */"
 .B #include <unistd.h>
 .BR "#include <sys/syscall.h>   "  "/* For SYS_xxx definitions */"
 .PP
 .BI "long syscall(long " number ", ...);"
 .fi
+.PP
+.in -4n
+Feature Test Macro Requirements for glibc (see
+.BR feature_test_macros (7)):
+.in
+.PP
+.BR syscall ():
+.ad l
+    /* Since glibc 2.19: */ _DEFAULT_SOURCE
+    /* Glibc versions <= 2.19: */ _BSD_SOURCE || _SVID_SOURCE
+.ad
 .SH DESCRIPTION
 .BR syscall ()
 is a small library function that invokes
-- 
2.24.1

