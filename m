Return-Path: <SRS0=F1MC=WW=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60FECC3A59F
	for <linux-man@archiver.kernel.org>; Mon, 26 Aug 2019 21:05:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3C06B217F5
	for <linux-man@archiver.kernel.org>; Mon, 26 Aug 2019 21:05:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726160AbfHZVFL (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 26 Aug 2019 17:05:11 -0400
Received: from 3.mo4.mail-out.ovh.net ([46.105.57.129]:59897 "EHLO
        3.mo4.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726150AbfHZVFK (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Mon, 26 Aug 2019 17:05:10 -0400
X-Greylist: delayed 16801 seconds by postgrey-1.27 at vger.kernel.org; Mon, 26 Aug 2019 17:05:10 EDT
Received: from player731.ha.ovh.net (unknown [10.109.143.223])
        by mo4.mail-out.ovh.net (Postfix) with ESMTP id 1FFC0203C73
        for <linux-man@vger.kernel.org>; Mon, 26 Aug 2019 18:19:27 +0200 (CEST)
Received: from jwilk.net (user-5-173-40-35.play-internet.pl [5.173.40.35])
        (Authenticated sender: jwilk@jwilk.net)
        by player731.ha.ovh.net (Postfix) with ESMTPSA id 44E688F3F6D0;
        Mon, 26 Aug 2019 16:19:24 +0000 (UTC)
From:   Jakub Wilk <jwilk@jwilk.net>
To:     Michael Kerrisk <mtk.manpages@gmail.com>
Cc:     linux-man@vger.kernel.org
Subject: [PATCH] ld.so.8: tfix
Date:   Mon, 26 Aug 2019 18:19:21 +0200
Message-Id: <20190826161921.9860-1-jwilk@jwilk.net>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 472315011673020285
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrudehgedgleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenuc
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Escape hyphens.

Signed-off-by: Jakub Wilk <jwilk@jwilk.net>
---
 man8/ld.so.8 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man8/ld.so.8 b/man8/ld.so.8
index 3747a1ab3..2dce42a67 100644
--- a/man8/ld.so.8
+++ b/man8/ld.so.8
@@ -428,7 +428,7 @@ loading a new shared object, resolving a symbol,
 or calling a symbol from another shared object\(emby
 calling an appropriate function within the audit shared object.
 For details, see
-.BR rtld-audit (7).
+.BR rtld\-audit (7).
 The auditing interface is largely compatible with that provided on Solaris,
 as described in its
 .IR "Linker and Libraries Guide" ,
@@ -783,7 +783,7 @@ mtrr, pat, pbe, pge, pn, pse36, sep, ss, sse, sse2, tm
 .BR getauxval (3),
 .BR elf (5),
 .BR capabilities (7),
-.BR rtld-audit (7),
+.BR rtld\-audit (7),
 .BR ldconfig (8),
 .BR sln (8)
 .\" .SH AUTHORS
-- 
2.23.0

