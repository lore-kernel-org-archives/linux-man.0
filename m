Return-Path: <SRS0=8s0N=AM=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28830C433DF
	for <linux-man@archiver.kernel.org>; Wed,  1 Jul 2020 23:38:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0D396207E8
	for <linux-man@archiver.kernel.org>; Wed,  1 Jul 2020 23:38:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726464AbgGAXiE (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Wed, 1 Jul 2020 19:38:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726438AbgGAXiE (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Wed, 1 Jul 2020 19:38:04 -0400
Received: from inpost.hi.is (inpost.hi.is [IPv6:2a00:c88:4000:1650::165:62])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41718C08C5C1
        for <linux-man@vger.kernel.org>; Wed,  1 Jul 2020 16:38:04 -0700 (PDT)
Received: from hekla.rhi.hi.is (hekla.rhi.hi.is [IPv6:2a00:c88:4000:1650::165:2])
        by inpost.hi.is (8.14.7/8.14.7) with ESMTP id 061Nc1mR023542
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Wed, 1 Jul 2020 23:38:01 GMT
DKIM-Filter: OpenDKIM Filter v2.11.0 inpost.hi.is 061Nc1mR023542
Received: from hekla.rhi.hi.is (localhost [127.0.0.1])
        by hekla.rhi.hi.is (8.14.4/8.14.4) with ESMTP id 061Nc1DN029267;
        Wed, 1 Jul 2020 23:38:01 GMT
Received: (from bjarniig@localhost)
        by hekla.rhi.hi.is (8.14.4/8.14.4/Submit) id 061Nc1TZ029248;
        Wed, 1 Jul 2020 23:38:01 GMT
Date:   Wed, 1 Jul 2020 23:38:01 +0000
From:   Bjarni Ingi Gislason <bjarniig@rhi.hi.is>
To:     mtk.manpages@gmail.com
Cc:     linux-man@vger.kernel.org
Subject: [PATCH] man8/*: ffix, change '-' to '\-' for options
Message-ID: <20200701233801.GA29209@rhi.hi.is>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.20 (2009-12-10)
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

  Change '-' to '\-' for the prefix of names to indicate an option.

Signed-off-by: Bjarni Ingi Gislason <bjarniig@rhi.hi.is>
---
 man8/nscd.8 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man8/nscd.8 b/man8/nscd.8
index a0b3733e4..8ddc538d3 100644
--- a/man8/nscd.8
+++ b/man8/nscd.8
@@ -87,7 +87,7 @@ invalidates its cache:
 .PP
 .in +4n
 .EX
-$ \fBnscd -i\fP \fI<database>\fP
+$ \fBnscd \-i\fP \fI<database>\fP
 .EE
 .in
 .SH SEE ALSO
-- 
2.27.0
