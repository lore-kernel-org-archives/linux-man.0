Return-Path: <SRS0=Eeob=BC=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93C75C433E4
	for <linux-man@archiver.kernel.org>; Thu, 23 Jul 2020 21:53:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6D2C1206E3
	for <linux-man@archiver.kernel.org>; Thu, 23 Jul 2020 21:53:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726697AbgGWVxn (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Thu, 23 Jul 2020 17:53:43 -0400
Received: from smtp.gentoo.org ([140.211.166.183]:33284 "EHLO smtp.gentoo.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726368AbgGWVxn (ORCPT <rfc822;linux-man@vger.kernel.org>);
        Thu, 23 Jul 2020 17:53:43 -0400
Received: from vapier.lan (localhost [127.0.0.1])
        by smtp.gentoo.org (Postfix) with ESMTP id E78CF34F1D6;
        Thu, 23 Jul 2020 21:53:41 +0000 (UTC)
From:   Mike Frysinger <vapier@gentoo.org>
To:     Michael Kerrisk <mtk.manpages@gmail.com>
Cc:     linux-man@vger.kernel.org
Subject: [PATCH] trim leading blank comment line
Date:   Thu, 23 Jul 2020 17:53:40 -0400
Message-Id: <20200723215340.13867-1-vapier@gentoo.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

From: Mike Frysinger <vapier@chromium.org>

Very few pages do this, so trim them.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 man5/repertoiremap.5        | 1 -
 man7/keyrings.7             | 1 -
 man7/persistent-keyring.7   | 1 -
 man7/process-keyring.7      | 1 -
 man7/session-keyring.7      | 1 -
 man7/thread-keyring.7       | 1 -
 man7/user-keyring.7         | 1 -
 man7/user-session-keyring.7 | 1 -
 8 files changed, 8 deletions(-)

diff --git a/man5/repertoiremap.5 b/man5/repertoiremap.5
index a76e866f8f43..06d4814d5722 100644
--- a/man5/repertoiremap.5
+++ b/man5/repertoiremap.5
@@ -1,4 +1,3 @@
-.\"
 .\" %%%LICENSE_START(GPLv2+_DOC_FULL)
 .\" This is free documentation; you can redistribute it and/or
 .\" modify it under the terms of the GNU General Public License as
diff --git a/man7/keyrings.7 b/man7/keyrings.7
index 0983a4da948e..cbe8a6fb0ebd 100644
--- a/man7/keyrings.7
+++ b/man7/keyrings.7
@@ -1,4 +1,3 @@
-.\"
 .\" Copyright (C) 2014 Red Hat, Inc. All Rights Reserved.
 .\" Written by David Howells (dhowells@redhat.com)
 .\" and Copyright (C) 2016 Michael Kerrisk <mtk.manpages@gmail.com>
diff --git a/man7/persistent-keyring.7 b/man7/persistent-keyring.7
index 3367ec153f47..de56255c1d68 100644
--- a/man7/persistent-keyring.7
+++ b/man7/persistent-keyring.7
@@ -1,4 +1,3 @@
-.\"
 .\" Copyright (C) 2014 Red Hat, Inc. All Rights Reserved.
 .\" Written by David Howells (dhowells@redhat.com)
 .\"
diff --git a/man7/process-keyring.7 b/man7/process-keyring.7
index c4dbd127f5a3..9f48aa9c2143 100644
--- a/man7/process-keyring.7
+++ b/man7/process-keyring.7
@@ -1,4 +1,3 @@
-.\"
 .\" Copyright (C) 2014 Red Hat, Inc. All Rights Reserved.
 .\" Written by David Howells (dhowells@redhat.com)
 .\"
diff --git a/man7/session-keyring.7 b/man7/session-keyring.7
index 0b886be5e702..829d1e975e36 100644
--- a/man7/session-keyring.7
+++ b/man7/session-keyring.7
@@ -1,4 +1,3 @@
-.\"
 .\" Copyright (C) 2014 Red Hat, Inc. All Rights Reserved.
 .\" Written by David Howells (dhowells@redhat.com)
 .\"
diff --git a/man7/thread-keyring.7 b/man7/thread-keyring.7
index a09ab4c565e9..0cc429b58c91 100644
--- a/man7/thread-keyring.7
+++ b/man7/thread-keyring.7
@@ -1,4 +1,3 @@
-.\"
 .\" Copyright (C) 2014 Red Hat, Inc. All Rights Reserved.
 .\" Written by David Howells (dhowells@redhat.com)
 .\"
diff --git a/man7/user-keyring.7 b/man7/user-keyring.7
index f13674eeeaa3..de2d7029e699 100644
--- a/man7/user-keyring.7
+++ b/man7/user-keyring.7
@@ -1,4 +1,3 @@
-.\"
 .\" Copyright (C) 2014 Red Hat, Inc. All Rights Reserved.
 .\" Written by David Howells (dhowells@redhat.com)
 .\"
diff --git a/man7/user-session-keyring.7 b/man7/user-session-keyring.7
index 91664dd50297..0934e08e2122 100644
--- a/man7/user-session-keyring.7
+++ b/man7/user-session-keyring.7
@@ -1,4 +1,3 @@
-.\"
 .\" Copyright (C) 2014 Red Hat, Inc. All Rights Reserved.
 .\" Written by David Howells (dhowells@redhat.com)
 .\"
-- 
2.26.2

