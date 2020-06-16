Return-Path: <SRS0=QK8X=75=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64391C433DF
	for <linux-man@archiver.kernel.org>; Tue, 16 Jun 2020 22:38:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 479E9207E8
	for <linux-man@archiver.kernel.org>; Tue, 16 Jun 2020 22:38:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725901AbgFPWi7 (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Tue, 16 Jun 2020 18:38:59 -0400
Received: from gateway32.websitewelcome.com ([192.185.145.187]:25078 "EHLO
        gateway32.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725849AbgFPWi6 (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Tue, 16 Jun 2020 18:38:58 -0400
X-Greylist: delayed 1391 seconds by postgrey-1.27 at vger.kernel.org; Tue, 16 Jun 2020 18:38:58 EDT
Received: from cm10.websitewelcome.com (cm10.websitewelcome.com [100.42.49.4])
        by gateway32.websitewelcome.com (Postfix) with ESMTP id BB7696FCA0
        for <linux-man@vger.kernel.org>; Tue, 16 Jun 2020 17:15:46 -0500 (CDT)
Received: from gator3278.hostgator.com ([198.57.247.242])
        by cmsmtp with SMTP
        id lJrujlc8gXGIklJrujIWX8; Tue, 16 Jun 2020 17:15:46 -0500
X-Authority-Reason: nr=8
Received: from 89-69-237-178.dynamic.chello.pl ([89.69.237.178]:44778 helo=comp.lan)
        by gator3278.hostgator.com with esmtpa (Exim 4.93)
        (envelope-from <arkadiusz@drabczyk.org>)
        id 1jlJrt-003cuF-MK; Tue, 16 Jun 2020 17:15:46 -0500
From:   Arkadiusz Drabczyk <arkadiusz@drabczyk.org>
To:     mtk.manpages@gmail.com
Cc:     linux-man@vger.kernel.org
Subject: [PATCH v2] fread.3: Explain that file position is moved after calling fread()/fwrite()
Date:   Wed, 17 Jun 2020 00:15:20 +0200
Message-Id: <20200616221520.21741-1-arkadiusz@drabczyk.org>
X-Mailer: git-send-email 2.9.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator3278.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - drabczyk.org
X-BWhitelist: no
X-Source-IP: 89.69.237.178
X-Source-L: No
X-Exim-ID: 1jlJrt-003cuF-MK
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 89-69-237-178.dynamic.chello.pl (comp.lan) [89.69.237.178]:44778
X-Source-Auth: arkadiusz@drabczyk.org
X-Email-Count: 1
X-Source-Cap: cmt1bXZicmg7cmt1bXZicmg7Z2F0b3IzMjc4Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Corresponding manpage on FreeBSD already contains that information.

Signed-off-by: Arkadiusz Drabczyk <arkadiusz@drabczyk.org>
---
 man3/fread.3 | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/man3/fread.3 b/man3/fread.3
index 2dd7be9..2dcca9b 100644
--- a/man3/fread.3
+++ b/man3/fread.3
@@ -92,6 +92,9 @@ is 1.
 If an error occurs, or the end of the file is reached,
 the return value is a short item count (or zero).
 .PP
+The file position indicator for the stream is advanced by the number
+of bytes successfully read or written.
+.PP
 .BR fread ()
 does not distinguish between end-of-file and error, and callers must use
 .BR feof (3)
-- 
2.9.0

