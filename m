Return-Path: <SRS0=cK25=3A=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 190F4C282DD
	for <linux-man@archiver.kernel.org>; Sat, 11 Jan 2020 15:11:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EA06C2082E
	for <linux-man@archiver.kernel.org>; Sat, 11 Jan 2020 15:11:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729852AbgAKPLJ (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sat, 11 Jan 2020 10:11:09 -0500
Received: from forward102p.mail.yandex.net ([77.88.28.102]:50108 "EHLO
        forward102p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729839AbgAKPLJ (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sat, 11 Jan 2020 10:11:09 -0500
Received: from mxback30j.mail.yandex.net (mxback30j.mail.yandex.net [IPv6:2a02:6b8:0:1619::230])
        by forward102p.mail.yandex.net (Yandex) with ESMTP id 15CFD1D414A0
        for <linux-man@vger.kernel.org>; Sat, 11 Jan 2020 18:02:23 +0300 (MSK)
Received: from sas1-e20a8b944cac.qloud-c.yandex.net (sas1-e20a8b944cac.qloud-c.yandex.net [2a02:6b8:c14:6696:0:640:e20a:8b94])
        by mxback30j.mail.yandex.net (mxback/Yandex) with ESMTP id Ggv49J7GZf-2MJq1sPA;
        Sat, 11 Jan 2020 18:02:23 +0300
Received: by sas1-e20a8b944cac.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id XtnMJP9O9Z-2LWOeH82;
        Sat, 11 Jan 2020 18:02:21 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Shawn Landden <shawn@git.icu>
To:     linux-man@vger.kernel.org
Cc:     Shawn Landden <shawn@git.icu>
Subject: [PATCH] memcmp.3: note about optimization to bcmp in LLVM 9
Date:   Sat, 11 Jan 2020 19:02:16 +0400
Message-Id: <20200111150216.5956-1-shawn@git.icu>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

---
 man3/memcmp.3 | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/man3/memcmp.3 b/man3/memcmp.3
index 247eed223..6afca5ea4 100644
--- a/man3/memcmp.3
+++ b/man3/memcmp.3
@@ -84,10 +84,17 @@ because the required CPU time depends on the number of equal bytes.
 Instead, a function that performs comparisons in constant time is required.
 Some operating systems provide such a function (e.g., NetBSD's
 .BR consttime_memequal ()),
 but no such function is specified in POSIX.
 On Linux, it may be necessary to implement such a function oneself.
+.PP
+LLVM 9, released in 2019, and later will optimize a call
+.BR memcmp ()
+to a call to
+.BR bcmp (3)
+if the return value is only checked for equilivence to zero.
+.\" http://releases.llvm.org/9.0.0/docs/ReleaseNotes.html#noteworthy-optimizations
 .SH SEE ALSO
 .BR bcmp (3),
 .BR bstring (3),
 .BR strcasecmp (3),
 .BR strcmp (3),
-- 
2.20.1

