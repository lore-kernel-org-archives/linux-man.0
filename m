Return-Path: <linux-man-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7D5DCA1001
	for <linux-man@archiver.kernel.org>; Tue,  5 Sep 2023 16:27:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352464AbjIEQ11 (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Tue, 5 Sep 2023 12:27:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354524AbjIEMTm (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Tue, 5 Sep 2023 08:19:42 -0400
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBEA51A8
        for <linux-man@vger.kernel.org>; Tue,  5 Sep 2023 05:19:36 -0700 (PDT)
Received: from submission (posteo.de [185.67.36.169]) 
        by mout02.posteo.de (Postfix) with ESMTPS id 1FF04240105
        for <linux-man@vger.kernel.org>; Tue,  5 Sep 2023 14:19:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
        t=1693916374; bh=tPkc/e+g2kvoqyqmuceTWKgjcC9EoW2xQySCy3fLfms=;
        h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
         Content-Transfer-Encoding:From;
        b=pVca6fbBhmWKrmF7cUB7vyVaUOnZWG5Ort9H6myc5I/rWt0YoEuK9ui5LCo5ZBO44
         dNxGnGItx48TSzBWGt9zZxX/zWlctbGEIChcyFhsLIv7wtSNMobjYv2vC8qYNW3N8j
         MyqHyVszVa1QY8kXbxyLHUuAqRn4XxFKJfTK4eJxZyODyvmXrmMm2CU53xkcemFLnG
         A8z5NGQg76cy/2zuniDZvr67xrsGA6vlfycyS2QLlzFGCrQFVPSQZQ96kNykuwdSxL
         Mpz5v7WORqXnO/HWZ7rB/4zJCgK5RKlzAJFuWw1Bd32tE5Q++WAybf1libHE0mwyiI
         GBjq31jns7zDw==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4Rg4Ls40P8z6tvx;
        Tue,  5 Sep 2023 14:19:33 +0200 (CEST)
From:   Tom Schwindl <schwindl@posteo.de>
To:     Alejandro Colomar <alx@kernel.org>
Cc:     linux-man@vger.kernel.org
Subject: [PATCH] popen.3: wfix
Date:   Tue,  5 Sep 2023 12:18:22 +0000
Message-ID: <20230905121822.17672-1-schwindl@posteo.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

---
 man3/popen.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/popen.3 b/man3/popen.3
index 533561d60454..9530acfaa217 100644
--- a/man3/popen.3
+++ b/man3/popen.3
@@ -188,7 +188,7 @@ before
 .BR popen ().
 .PP
 Failure to execute the shell is indistinguishable from the shell's failure
-to execute command, or an immediate exit of the command.
+to execute the command, or an immediate exit of the command.
 The only hint is an exit status of 127.
 .\" .SH HISTORY
 .\" A
-- 
2.41.0

