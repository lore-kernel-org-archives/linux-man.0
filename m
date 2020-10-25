Return-Path: <SRS0=EgWi=EA=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 214ADC388F7
	for <linux-man@archiver.kernel.org>; Sun, 25 Oct 2020 12:12:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D8708222E8
	for <linux-man@archiver.kernel.org>; Sun, 25 Oct 2020 12:12:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1415628AbgJYMMN (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sun, 25 Oct 2020 08:12:13 -0400
Received: from vmicros1.altlinux.org ([194.107.17.57]:60672 "EHLO
        vmicros1.altlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1415627AbgJYMMN (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sun, 25 Oct 2020 08:12:13 -0400
X-Greylist: delayed 521 seconds by postgrey-1.27 at vger.kernel.org; Sun, 25 Oct 2020 08:12:13 EDT
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
        by vmicros1.altlinux.org (Postfix) with ESMTP id 704B572CCE7;
        Sun, 25 Oct 2020 15:03:31 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
        id 6327F7CF9A3; Sun, 25 Oct 2020 15:03:31 +0300 (MSK)
Date:   Sun, 25 Oct 2020 15:03:31 +0300
From:   "Dmitry V. Levin" <ldv@altlinux.org>
To:     Michael Kerrisk <mtk.manpages@gmail.com>
Cc:     linux-man@vger.kernel.org
Subject: [PATCH] tailq.3: tfix
Message-ID: <20201025120331.GA9442@altlinux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Signed-off-by: Dmitry V. Levin <ldv@altlinux.org>
---
 man3/tailq.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/tailq.3 b/man3/tailq.3
index 73e28e7fc..a782a51e2 100644
--- a/man3/tailq.3
+++ b/man3/tailq.3
@@ -58,7 +58,7 @@ TAILQ_REMOVE
 \- implementation of a doubly linked tail queue
 .SH SYNOPSIS
 .nf
-.B #include sys/queue.h
+.B #include <sys/queue.h>
 .PP
 .BI "void TAILQ_CONCAT(TAILQ_HEAD *" head1 ", TAILQ_HEAD *" head2 ","
 .BI "                TAILQ_ENTRY " NAME ");"

-- 
ldv
