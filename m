Return-Path: <linux-man-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C465CD6E73
	for <linux-man@archiver.kernel.org>; Wed, 11 Oct 2023 14:11:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232381AbjJKOL6 (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Wed, 11 Oct 2023 10:11:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232125AbjJKOL5 (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Wed, 11 Oct 2023 10:11:57 -0400
Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F2F294;
        Wed, 11 Oct 2023 07:11:55 -0700 (PDT)
Received: from [2601:18c:9101:a8b6:6e0b:84ff:fee2:98bb] (helo=imladris.surriel.com)
        by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.96.1)
        (envelope-from <riel@shelob.surriel.com>)
        id 1qqZw2-0003Dg-2T;
        Wed, 11 Oct 2023 10:11:38 -0400
Date:   Wed, 11 Oct 2023 10:11:34 -0400
From:   Rik van Riel <riel@surriel.com>
To:     Alejandro Colomar <alx@kernel.org>
Cc:     linux-man@vger.kernel.org, kernel-team@meta.com,
        LKML <linux-kernel@vger.kernel.org>,
        Eric Biederman <ebiederm@xmission.com>,
        Matthew House <mattlloydhouse@gmail.com>
Subject: [PATCH v2] execve.2: execve also returns E2BIG if a string is too
 long
Message-ID: <20231011101134.709b8089@imladris.surriel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: riel@surriel.com
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

The execve syscall returns -E2BIG in 3 cases:
- The total length of the command line arguments and environment is too large.
- An argument or environment string is longer than MAX_ARG_STRLEN.
- The full path to the executable exceeds MAX_ARG_STRLEN.

Spell out all 3 cases in the -E2BIG section.

Discovered by moving a too large commandline parameter to an environment
variable, and finding that things still did not work. Examined the code
in fs/exec.c to get the details.

Signed-off-by: Rik van Riel <riel@surriel.com>
Suggested-by: Matthew House <mattlloydhouse@gmail.com>
---
 man2/execve.2 | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/man2/execve.2 b/man2/execve.2
index 0d9582492ad1..85c6ec15df3c 100644
--- a/man2/execve.2
+++ b/man2/execve.2
@@ -449,7 +449,8 @@ The total number of bytes in the environment
 .RI ( envp )
 and argument list
 .RI ( argv )
-is too large.
+is too large, an argument or environment string is too long, or
+the full path name to the executable is too long.
 .TP
 .B EACCES
 Search permission is denied on a component of the path prefix of
-- 
2.41.0


