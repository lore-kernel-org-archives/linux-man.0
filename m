Return-Path: <SRS0=M0jM=4L=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82685C35673
	for <linux-man@archiver.kernel.org>; Sun, 23 Feb 2020 23:39:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 60335206E0
	for <linux-man@archiver.kernel.org>; Sun, 23 Feb 2020 23:39:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727115AbgBWXjt (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sun, 23 Feb 2020 18:39:49 -0500
Received: from inpost.hi.is ([130.208.165.62]:45848 "EHLO inpost.hi.is"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726534AbgBWXjt (ORCPT <rfc822;linux-man@vger.kernel.org>);
        Sun, 23 Feb 2020 18:39:49 -0500
Received: from hekla.rhi.hi.is (hekla.rhi.hi.is [IPv6:2a00:c88:4000:1650::165:2])
        by inpost.hi.is (8.14.7/8.14.7) with ESMTP id 01NNdjnS023967
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Sun, 23 Feb 2020 23:39:45 GMT
DKIM-Filter: OpenDKIM Filter v2.11.0 inpost.hi.is 01NNdjnS023967
Received: from hekla.rhi.hi.is (localhost [127.0.0.1])
        by hekla.rhi.hi.is (8.14.4/8.14.4) with ESMTP id 01NNdjfH009806;
        Sun, 23 Feb 2020 23:39:45 GMT
Received: (from bjarniig@localhost)
        by hekla.rhi.hi.is (8.14.4/8.14.4/Submit) id 01NNdjdv009805;
        Sun, 23 Feb 2020 23:39:45 GMT
Date:   Sun, 23 Feb 2020 23:39:45 +0000
From:   Bjarni Ingi Gislason <bjarniig@rhi.hi.is>
To:     mtk.manpages@gmail.com
Cc:     linux-man@vger.kernel.org
Subject: [PATCH] man7/namespaces.7: srcfix: Make the number of .RS/.RE macros
 equal
Message-ID: <20200223233945.GA9772@rhi.hi.is>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.20 (2009-12-10)
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

  Changes are based on the latest (23th Februar 2020) revision of my
local git repository.

  Add a '.RE' macro to terminate the last .RS block.

  There is no change in the output.

Signed-off-by: Bjarni Ingi Gislason <bjarniig@rhi.hi.is>
---
 man7/namespaces.7 | 1 +
 1 file changed, 1 insertion(+)

diff --git a/man7/namespaces.7 b/man7/namespaces.7
index ec1e2cb62..fa6a5837a 100644
--- a/man7/namespaces.7
+++ b/man7/namespaces.7
@@ -340,6 +340,7 @@ for the creator UID in the ancestor namespace is not exceeded.
 The aforementioned point ensures that creating a new user namespace
 cannot be used as a means to escape the limits in force
 in the current user namespace.
+.RE
 .\"
 .SS Namespace lifetime
 Absent any other factors,
-- 
2.25.0
