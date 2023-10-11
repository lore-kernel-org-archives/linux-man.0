Return-Path: <linux-man-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0713CD98EB
	for <linux-man@archiver.kernel.org>; Wed, 11 Oct 2023 03:50:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229495AbjJKDuk (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Tue, 10 Oct 2023 23:50:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbjJKDuj (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Tue, 10 Oct 2023 23:50:39 -0400
X-Greylist: delayed 511 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 10 Oct 2023 20:50:37 PDT
Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A251392
        for <linux-man@vger.kernel.org>; Tue, 10 Oct 2023 20:50:37 -0700 (PDT)
Received: from [2601:18c:9101:a8b6:6e0b:84ff:fee2:98bb] (helo=imladris.surriel.com)
        by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.96.1)
        (envelope-from <riel@shelob.surriel.com>)
        id 1qqQ6f-0006gO-0x;
        Tue, 10 Oct 2023 23:41:57 -0400
Date:   Tue, 10 Oct 2023 23:41:53 -0400
From:   Rik van Riel <riel@surriel.com>
To:     Alejandro Colomar <alx@kernel.org>
Cc:     linux-man@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        kernel-team@meta.com, Eric Biederman <ebiederm@xmission.com>
Subject: [PATCH] execve.2: execve also returns E2BIG if a string is too long
Message-ID: <20231010234153.021826b1@imladris.surriel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: riel@surriel.com
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Document that if a command line or environment string is too long (> MAX_ARG_STRLEN), execve will also return E2BIG.

Signed-off-by: Rik van Riel <riel@surriel.com>
---
 man2/execve.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/execve.2 b/man2/execve.2
index 0d9582492ad1..c1a359d01872 100644
--- a/man2/execve.2
+++ b/man2/execve.2
@@ -449,7 +449,7 @@ The total number of bytes in the environment
 .RI ( envp )
 and argument list
 .RI ( argv )
-is too large.
+is too large, or an argument or environment string is too long.
 .TP
 .B EACCES
 Search permission is denied on a component of the path prefix of
-- 
2.41.0


