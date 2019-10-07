Return-Path: <SRS0=fLbv=YA=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCECAECE58C
	for <linux-man@archiver.kernel.org>; Mon,  7 Oct 2019 13:53:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 98BB520673
	for <linux-man@archiver.kernel.org>; Mon,  7 Oct 2019 13:53:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727324AbfJGNxe (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 7 Oct 2019 09:53:34 -0400
Received: from mx2.suse.de ([195.135.220.15]:53562 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726334AbfJGNxe (ORCPT <rfc822;linux-man@vger.kernel.org>);
        Mon, 7 Oct 2019 09:53:34 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id C94DDB12F;
        Mon,  7 Oct 2019 13:53:32 +0000 (UTC)
From:   Petr Vorel <pvorel@suse.cz>
To:     linux-man@vger.kernel.org
Cc:     Petr Vorel <pvorel@suse.cz>,
        Michael Kerrisk <mtk.manpages@gmail.com>
Subject: [PATCH 1/1] getdents.2: Mention glibc support for getdents64()
Date:   Mon,  7 Oct 2019 15:53:15 +0200
Message-Id: <20191007135315.2214-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 man2/getdents.2 | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/man2/getdents.2 b/man2/getdents.2
index 712d23c58..a6b7aad1f 100644
--- a/man2/getdents.2
+++ b/man2/getdents.2
@@ -40,7 +40,8 @@ getdents, getdents64 \- get directory entries
 .fi
 .PP
 .IR Note :
-There are no glibc wrappers for these system calls; see NOTES.
+There is no glibc wrapper for getdents().
+Wrapper for getdents64() was added in glibc 2.30; see NOTES.
 .SH DESCRIPTION
 These are not the interfaces you are interested in.
 Look at
@@ -203,9 +204,11 @@ File descriptor does not refer to a directory.
 SVr4.
 .\" SVr4 documents additional ENOLINK, EIO error conditions.
 .SH NOTES
-Glibc does not provide a wrapper for these system calls; call them using
+Library support for getdents64() was added in glibc 2.30;
+there is no glibc wrapper for getdents();
+call getdents() (or getdents64() on earlier versions) requires using
 .BR syscall (2).
-You will need to define the
+In that case you will need to define the
 .I linux_dirent
 or
 .I linux_dirent64
-- 
2.23.0

