Return-Path: <linux-man-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A624BC61DA4
	for <linux-man@archiver.kernel.org>; Sat, 11 Mar 2023 12:00:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229735AbjCKMAI (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sat, 11 Mar 2023 07:00:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230000AbjCKMAG (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sat, 11 Mar 2023 07:00:06 -0500
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96FB7E827B
        for <linux-man@vger.kernel.org>; Sat, 11 Mar 2023 04:00:02 -0800 (PST)
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
         client-signature RSA-PSS (2048 bits) client-digest SHA256)
        (Client CN "mail.riseup.net", Issuer "R3" (not verified))
        by mx1.riseup.net (Postfix) with ESMTPS id 4PYhLT5g68zDqV7;
        Sat, 11 Mar 2023 12:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
        t=1678536001; bh=r6+aRAK9ykWFdvD5eDSR5Mq65bD09wH2Rl8dRlYdtEU=;
        h=Date:From:To:Cc:Subject:From;
        b=jwmQfN5oaDTLETjL1Lnka6MUDQCMG0uwRtz+ey0dbc+Sgc6RKgrXdsnEs8MJ59/7d
         hyfS8Z1KEVJfMQCEC3y4MvR/DHQtHD7hyQ+scl9AdmKhZ6/lcoV3ao893EV9OWBMwo
         4uZG76zzpyyUDPhCYbl7rBzBDvMVI3JLbWVx7nNI=
X-Riseup-User-ID: 8C3D3F73E495292F2CCB41D6A6DA78607BBD2CB8D4ACDF95E965177317D73779
Received: from [127.0.0.1] (localhost [127.0.0.1])
         by fews2.riseup.net (Postfix) with ESMTPSA id 4PYhLR6N4xz1yTL;
        Sat, 11 Mar 2023 11:59:59 +0000 (UTC)
Date:   Sat, 11 Mar 2023 11:59:54 +0000
From:   Samanta Navarro <ferivoz@riseup.net>
To:     linux-man@vger.kernel.org
Cc:     alx.manpages@gmail.com, mtk.manpages@gmail.com
Subject: [PATCH] ldconfig.8: tfix
Message-ID: <20230311115954.yg5v3asurx7idr2e@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Typo found with codespell.

Signed-off-by: Samanta Navarro <ferivoz@riseup.net>
---
 man8/ldconfig.8 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man8/ldconfig.8 b/man8/ldconfig.8
index 36b891dab..2f974ad7d 100644
--- a/man8/ldconfig.8
+++ b/man8/ldconfig.8
@@ -130,7 +130,7 @@ Ignore auxiliary cache file.
 .TP
 .B \-l
 (Since glibc 2.2)
-Interpret each operand as a libary name and configure its links.
+Interpret each operand as a library name and configure its links.
 Intended for use only by experts.
 .TP
 .B \-n
-- 
2.39.2

