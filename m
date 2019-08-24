Return-Path: <SRS0=GIqg=WU=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 983BAC3A59E
	for <linux-man@archiver.kernel.org>; Sat, 24 Aug 2019 21:12:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 66E1D20870
	for <linux-man@archiver.kernel.org>; Sat, 24 Aug 2019 21:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1566681130;
	bh=xw4adpbZyAoZVjRzBL0bqA345zueB5rSauVQ/+7lPuc=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=Pjw8xwMX/hr5pEDpkFAUcbLInUUkleVyljVpuNSKA+dbu8W9Z1q6RvcelUrSSrdSQ
	 1dzqW+47CMZK+HvQugamx1JWN9YmOqBRuWdOFhlkIHjE75Ntf0lqYGbjIcwqgKLayx
	 SO9P2RJ+GwbipjRlJkw+/zhI+QikmLdjcV6nlUzs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727969AbfHXVMK (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sat, 24 Aug 2019 17:12:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:53174 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727954AbfHXVMK (ORCPT <rfc822;linux-man@vger.kernel.org>);
        Sat, 24 Aug 2019 17:12:10 -0400
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net [24.5.143.220])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3DEE222CE3;
        Sat, 24 Aug 2019 21:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566681129;
        bh=xw4adpbZyAoZVjRzBL0bqA345zueB5rSauVQ/+7lPuc=;
        h=From:To:Cc:Subject:Date:From;
        b=jwNBObV9aMUg2SImlpIGOjf/kti0GrXs+4cB3jg8rCoWfJ49Z0RuwVo0vroFUmZ5q
         rb2GVJeRGxyNSUkoCbjd98o/HIRtnLJFSX3e/HPZCmjLaVQegEovWqHFDpaxzY1NJs
         JOxM14Nez2480TZZAWlSO2ZyOAVbJOsmu1jlL6rY=
From:   Eric Biggers <ebiggers@kernel.org>
To:     mtk.manpages@gmail.com
Cc:     linux-man@vger.kernel.org
Subject: [PATCH] cgroups.7: tfix
Date:   Sat, 24 Aug 2019 14:11:54 -0700
Message-Id: <20190824211154.17028-1-ebiggers@kernel.org>
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
 man7/cgroups.7 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man7/cgroups.7 b/man7/cgroups.7
index 7a349c1dd..ca212cb98 100644
--- a/man7/cgroups.7
+++ b/man7/cgroups.7
@@ -919,7 +919,7 @@ Changing the ownership of this file means that the delegatee
 can move processes into the root of the delegated subtree.
 .TP
 .IR /dlgt_grp/cgroup.subtree_control " (cgroups v2 only)"
-Changing the ownership of this file means that that the delegatee
+Changing the ownership of this file means that the delegatee
 can enable controllers (that are present in
 .IR /dlgt_grp/cgroup.controllers )
 in order to further redistribute resources at lower levels in the subtree.
-- 
2.23.0

