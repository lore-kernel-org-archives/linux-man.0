Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA066C433E0
	for <linux-man@archiver.kernel.org>; Mon,  8 Mar 2021 19:24:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 90AEC65290
	for <linux-man@archiver.kernel.org>; Mon,  8 Mar 2021 19:24:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231154AbhCHTXh (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 8 Mar 2021 14:23:37 -0500
Received: from mslow2.mail.gandi.net ([217.70.178.242]:37149 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230046AbhCHTXV (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Mon, 8 Mar 2021 14:23:21 -0500
Received: from relay6-d.mail.gandi.net (unknown [217.70.183.198])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 1DC6C3B2BD8
        for <linux-man@vger.kernel.org>; Mon,  8 Mar 2021 19:07:36 +0000 (UTC)
X-Originating-IP: 50.39.163.217
Received: from localhost (unknown [50.39.163.217])
        (Authenticated sender: josh@joshtriplett.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id CF2B3C0005;
        Mon,  8 Mar 2021 19:07:10 +0000 (UTC)
Date:   Mon, 8 Mar 2021 11:07:07 -0800
From:   Josh Triplett <josh@joshtriplett.org>
To:     linux-man@vger.kernel.org,
        Alejandro Colomar <alx.manpages@gmail.com>,
        Michael Kerrisk <mtk.manpages@gmail.com>
Subject: [PATCH] Remove obsolete admonishment of the GZIP environment variable
Message-ID: <f48a311d2b3c32d87ee5e4d1679bd83c61b8d72e.1615230417.git.josh@joshtriplett.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

gzip deprecated the GZIP environment variable long ago.

Signed-off-by: Josh Triplett <josh@joshtriplett.org>
---
 man7/environ.7 | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/man7/environ.7 b/man7/environ.7
index ee8ca97f6..77d9d3950 100644
--- a/man7/environ.7
+++ b/man7/environ.7
@@ -339,16 +339,10 @@ etc.).
 However, in some traditional uses such an environment variable
 gives options for the program instead of a pathname.
 Thus, one has
-.BR MORE ,
-.BR LESS ,
-and
-.BR GZIP .
+.BR MORE and
+.BR LESS .
 Such usage is considered mistaken, and to be avoided in new
 programs.
-The authors of
-.I gzip
-should consider renaming their option to
-.BR GZIP_OPT .
 .SH SEE ALSO
 .BR bash (1),
 .BR csh (1),
-- 
2.30.1

