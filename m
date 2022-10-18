Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFAF5C4332F
	for <linux-man@archiver.kernel.org>; Tue, 18 Oct 2022 08:24:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230375AbiJRIYy (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Tue, 18 Oct 2022 04:24:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230006AbiJRIYx (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Tue, 18 Oct 2022 04:24:53 -0400
Received: from isrv.corpit.ru (isrv.corpit.ru [86.62.121.231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02FF93340D
        for <linux-man@vger.kernel.org>; Tue, 18 Oct 2022 01:24:47 -0700 (PDT)
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
        by isrv.corpit.ru (Postfix) with ESMTP id DE8E340B04;
        Tue, 18 Oct 2022 11:24:45 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
        by tsrv.corpit.ru (Postfix) with SMTP id 3E09413A;
        Tue, 18 Oct 2022 11:24:48 +0300 (MSK)
Received: (nullmailer pid 1244611 invoked by uid 1000);
        Tue, 18 Oct 2022 08:24:45 -0000
From:   Michael Tokarev <mjt@tls.msk.ru>
Subject: [patch wfix] system_data_types.7: fix typo in regmatch_t description
To:     linux-man@vger.kernel.org,
        Alejandro Colomar <alx.manpages@gmail.com>,
        Michael Kerrisk <mtk.manpages@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Date:   Tue, 18 Oct 2022 11:24:45 +0300
Message-Id: <1666081485.302285.1244610.nullmailer@msgid.tls.msk.ru>
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

The description of rm_eo in regmatch_t structure has a typo
which makes it difficult to understand. Fix this.

Reported-By: Nicolás A. Ortega Froysa <nicolas@ortegas.org>
Signed-off-By: Michael Tokarev <mjt@tls.msk.ru>

--- a/man7/system_data_types.7
+++ b/man7/system_data_types.7
@@ -1018,7 +1018,7 @@
 typedef struct {
     regoff_t    rm_so; /* Byte offset from start of string
                           to start of substring */
-    regoff_t    rm_eo; /* Byte offset from start of string of
+    regoff_t    rm_eo; /* Byte offset from start of string to
                           the first character after the end of
                           substring */
 } regmatch_t;
