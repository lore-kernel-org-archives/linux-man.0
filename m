Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7A47C4320A
	for <linux-man@archiver.kernel.org>; Tue, 10 Aug 2021 19:43:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8945D60F94
	for <linux-man@archiver.kernel.org>; Tue, 10 Aug 2021 19:43:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230056AbhHJToN (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Tue, 10 Aug 2021 15:44:13 -0400
Received: from zimbra.cs.ucla.edu ([131.179.128.68]:43386 "EHLO
        zimbra.cs.ucla.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbhHJToL (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Tue, 10 Aug 2021 15:44:11 -0400
X-Greylist: delayed 379 seconds by postgrey-1.27 at vger.kernel.org; Tue, 10 Aug 2021 15:44:11 EDT
Received: from localhost (localhost [127.0.0.1])
        by zimbra.cs.ucla.edu (Postfix) with ESMTP id AF7691600EB;
        Tue, 10 Aug 2021 12:37:31 -0700 (PDT)
Received: from zimbra.cs.ucla.edu ([127.0.0.1])
        by localhost (zimbra.cs.ucla.edu [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id g0-eA3Vdeja3; Tue, 10 Aug 2021 12:37:26 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by zimbra.cs.ucla.edu (Postfix) with ESMTP id CCA671600EF;
        Tue, 10 Aug 2021 12:37:26 -0700 (PDT)
X-Virus-Scanned: amavisd-new at zimbra.cs.ucla.edu
Received: from zimbra.cs.ucla.edu ([127.0.0.1])
        by localhost (zimbra.cs.ucla.edu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id NEBGiLpo7wEk; Tue, 10 Aug 2021 12:37:26 -0700 (PDT)
Received: from penguin.cs.ucla.edu (Penguin.CS.UCLA.EDU [131.179.64.200])
        by zimbra.cs.ucla.edu (Postfix) with ESMTPSA id ACD6F160060;
        Tue, 10 Aug 2021 12:37:26 -0700 (PDT)
From:   Paul Eggert <eggert@cs.ucla.edu>
To:     linux-man@vger.kernel.org, alx.manpages@gmail.com,
        mtk.manpages@gmail.com
Cc:     Paul Eggert <eggert@cs.ucla.edu>
Subject: [[patch] 2/2] malloc_hook.3: modernize for glibc 2.34
Date:   Tue, 10 Aug 2021 12:37:08 -0700
Message-Id: <20210810193708.10277-2-eggert@cs.ucla.edu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210810193708.10277-1-eggert@cs.ucla.edu>
References: <20210810193708.10277-1-eggert@cs.ucla.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

---
 man3/malloc_hook.3 | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/man3/malloc_hook.3 b/man3/malloc_hook.3
index 6d944003b..7b76bbc9b 100644
--- a/man3/malloc_hook.3
+++ b/man3/malloc_hook.3
@@ -11,7 +11,7 @@
 .SH NAME
 __malloc_hook, __malloc_initialize_hook,
 __memalign_hook, __free_hook, __realloc_hook,
-__after_morecore_hook \- malloc debugging variables
+__after_morecore_hook \- malloc debugging variables (DEPRECATED)
 .SH SYNOPSIS
 .nf
 .B "#include <malloc.h>"
@@ -86,11 +86,18 @@ The use of these hook functions is not safe in multit=
hreaded programs,
 and they are now deprecated.
 From glibc 2.24 onwards, the
 .B __malloc_initialize_hook
-variable has been removed from the API.
+variable has been removed from the API,
+and from glibc 2.34 onwards, all
+the hook variables have been removed from the API.
 .\" https://bugzilla.redhat.com/show_bug.cgi?id=3D450187
 .\" http://sourceware.org/bugzilla/show_bug.cgi?id=3D9957
 Programmers should instead preempt calls to the relevant functions
-by defining and exporting functions such as "malloc" and "free".
+by defining and exporting
+.BR malloc (),
+.BR free (),
+.BR realloc (),
+and
+.BR calloc ().
 .SH EXAMPLES
 Here is a short example of how to use these variables.
 .PP
--=20
2.31.1

