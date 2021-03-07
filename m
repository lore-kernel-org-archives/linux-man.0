Return-Path: <SRS0=03Fy=IF=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25186C433E6
	for <linux-man@archiver.kernel.org>; Sun,  7 Mar 2021 23:02:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E2D1865159
	for <linux-man@archiver.kernel.org>; Sun,  7 Mar 2021 23:02:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231761AbhCGXCC (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sun, 7 Mar 2021 18:02:02 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:39283 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232266AbhCGXB0 (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sun, 7 Mar 2021 18:01:26 -0500
Received: from localhost (unknown [50.39.163.217])
        (Authenticated sender: josh@joshtriplett.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 9E91F200009;
        Sun,  7 Mar 2021 23:01:24 +0000 (UTC)
Date:   Sun, 7 Mar 2021 15:01:22 -0800
From:   Josh Triplett <josh@joshtriplett.org>
To:     linux-man@vger.kernel.org,
        Alejandro Colomar <alx.manpages@gmail.com>,
        Michael Kerrisk <mtk.manpages@gmail.com>
Subject: [PATCH 2/2] exec.3: Clarify that execvpe uses PATH from the caller,
 not envp
Message-ID: <f2486cd0e9643b1eac6d83468197c2f821a17ab6.1615157989.git.josh@joshtriplett.org>
References: <849c71e0a6503e276e4563ff00f2f5f83e4a58aa.1615157989.git.josh@joshtriplett.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <849c71e0a6503e276e4563ff00f2f5f83e4a58aa.1615157989.git.josh@joshtriplett.org>
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Checked via the latest glibc source. execvpe calls getenv("PATH") and
searches that; the PATH in envp does not affect the search.

Signed-off-by: Josh Triplett <josh@joshtriplett.org>
---
 man3/exec.3 | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/man3/exec.3 b/man3/exec.3
index 3d936d08d..9c5b02b5c 100644
--- a/man3/exec.3
+++ b/man3/exec.3
@@ -146,6 +146,13 @@ a list that includes the directories returned by
 and possibly also the current working directory;
 see NOTES for further details.
 .PP
+.BR execvpe ()
+searches for the program using the value of
+.B PATH
+from the caller's environment, not from the
+.I envp
+argument.
+.PP
 If the specified filename includes a slash character, then
 .B PATH
 is ignored, and the file at the specified pathname is executed.
-- 
2.30.1

