Return-Path: <SRS0=wOXt=D3=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 127EEC388F7
	for <linux-man@archiver.kernel.org>; Tue, 20 Oct 2020 14:23:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B1B0822244
	for <linux-man@archiver.kernel.org>; Tue, 20 Oct 2020 14:23:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iz8XUQKp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408038AbgJTOXo (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Tue, 20 Oct 2020 10:23:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407989AbgJTOXo (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Tue, 20 Oct 2020 10:23:44 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E8C5C0613CE
        for <linux-man@vger.kernel.org>; Tue, 20 Oct 2020 07:23:42 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 13so2007278wmf.0
        for <linux-man@vger.kernel.org>; Tue, 20 Oct 2020 07:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qKxFdoB7BkFr4yTxpHUhm8llf8mmFKw38T1ZVFXcz9c=;
        b=iz8XUQKptFGUUjc3zT55c5/qnxV7K+ID76pdFg6QV+g/4fHwWwEEM2vLmbxm3zk1Sv
         abzOu9v9nYpPuvasYqtAOaD3FWaybw+UuBBr9YFoTj+eJ/FqQz8iCb/h4N00NNE4Zdpv
         zLcVVilZo/eFNVkLErGoyTGnoegf+6cuptU4M+hDkIpKYdV9QxTidBFinP/L0NpZ9Iyx
         01FlPziMhWEqrAOOW24MHYo3hQuIJRfFCCo4Y+cNteTUn2osgEBkvTTtsQg6sm+C21nA
         NxDcHpbvBTf/eioaD/KEHmtao0SD563sb1yZZ1PihQjYWknyeDQ/+bGcx+zy3ulytf/X
         WbmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qKxFdoB7BkFr4yTxpHUhm8llf8mmFKw38T1ZVFXcz9c=;
        b=Xlg7QtF4an2n2OHTAhUKIVdO69Q59UP92CJ69V58RSoF6Ry/ciyDnbvkD2Npl6zYHP
         U92yCBP44fd4A3dOm+zkdn9AiL4iUdjtsAzCUeCpX1oy09cfk/TzAifiDg67aJ+9liM0
         0ZyT0WFHKrPvIO/M1qnRsw5S9xZQS6USADMSO/yrTA1JbKx0ZrjXa1JjeDwfW7eh4RSD
         PFcfdRERSMivcAyzrUhPYBjbcufc3TPY13/UwhBd4u4cPpIVoWXTvu+bo3ppApE6a83I
         /ZLqpBsnshGLWkHyoM5JaU2lPxibeRPerkVYCzTfkPcVF/xSPV8IvnlVb52wZvqZnuNE
         iaBA==
X-Gm-Message-State: AOAM533oO1x/jggGejvCPZ2+zhV07IxkPZO1vMcBWi6FlQxgwKQzDiLk
        PJdnPoarmudfMBjOPecQ6eA=
X-Google-Smtp-Source: ABdhPJwJksIHeJBSVlSDTZ9mKaaJgFqClyF3ph/sgrnsViH3X5tOjY5iKgnrMn8G79hRh3aKOPNFmg==
X-Received: by 2002:a1c:9641:: with SMTP id y62mr3317887wmd.145.1603203821264;
        Tue, 20 Oct 2020 07:23:41 -0700 (PDT)
Received: from localhost.localdomain ([170.253.60.68])
        by smtp.googlemail.com with ESMTPSA id s19sm3422153wmc.0.2020.10.20.07.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2020 07:23:40 -0700 (PDT)
From:   Alejandro Colomar <colomar.6.4.3@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     Alejandro Colomar <colomar.6.4.3@gmail.com>,
        linux-man@vger.kernel.org, libc-alpha@sourceware.org
Subject: [PATCH 19/22] list.3, queue.3: EXAMPLES: Move example program from queue.3 to list.3
Date:   Tue, 20 Oct 2020 16:21:44 +0200
Message-Id: <20201020142146.61837-20-colomar.6.4.3@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201020142146.61837-1-colomar.6.4.3@gmail.com>
References: <20201020142146.61837-1-colomar.6.4.3@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Signed-off-by: Alejandro Colomar <colomar.6.4.3@gmail.com>
---
 man3/list.3  | 53 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 man3/queue.3 | 53 ----------------------------------------------------
 2 files changed, 53 insertions(+), 53 deletions(-)

diff --git a/man3/list.3 b/man3/list.3
index 82ab4dae4..b22453ab9 100644
--- a/man3/list.3
+++ b/man3/list.3
@@ -262,6 +262,59 @@ Present on the BSDs
 (LIST macros first appeared in 4.4BSD).
 .SH BUGS
 .SH EXAMPLES
+.Ss List example
+.Bd -literal
+#include <stddef.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <sys/queue.h>
+
+struct entry {
+    int data;
+    LIST_ENTRY(entry) entries;              /* List. */
+};
+
+LIST_HEAD(listhead, entry);
+
+int
+main(void)
+{
+    struct entry    *n1, *n2, *n3, *np;
+    struct listhead head;                   /* List head. */
+    int     i;
+
+    LIST_INIT(&head);                       /* Initialize the list. */
+
+    n1 = malloc(sizeof(struct entry));      /* Insert at the head. */
+    LIST_INSERT_HEAD(&head, n1, entries);
+
+    n2 = malloc(sizeof(struct entry));      /* Insert after. */
+    LIST_INSERT_AFTER(n1, n2, entries);
+
+    n3 = malloc(sizeof(struct entry));      /* Insert before. */
+    LIST_INSERT_BEFORE(n2, n3, entries);
+
+    i = 0;                                  /* Forward traversal. */
+    LIST_FOREACH(np, &head, entries)
+        np->data = i++;
+
+    LIST_REMOVE(n2, entries);               /* Deletion. */
+    free(n2);
+                                            /* Forward traversal. */
+    LIST_FOREACH(np, &head, entries)
+        printf("%i\en", np->data);
+                                            /* List Deletion. */
+    n1 = LIST_FIRST(&head);
+    while (n1 != NULL) {
+        n2 = LIST_NEXT(n1, entries);
+        free(n1);
+        n1 = n2;
+    }
+    LIST_INIT(&head);
+
+    exit(EXIT_SUCCESS);
+}
+.Ed
 .SH SEE ALSO
 .BR insque (3),
 .BR queue (3)
diff --git a/man3/queue.3 b/man3/queue.3
index 6ee793e25..0f55a899e 100644
--- a/man3/queue.3
+++ b/man3/queue.3
@@ -1155,59 +1155,6 @@ main(void)
     exit(EXIT_SUCCESS);
 }
 .Ed
-.Ss List example
-.Bd -literal
-#include <stddef.h>
-#include <stdio.h>
-#include <stdlib.h>
-#include <sys/queue.h>
-
-struct entry {
-    int data;
-    LIST_ENTRY(entry) entries;              /* List. */
-};
-
-LIST_HEAD(listhead, entry);
-
-int
-main(void)
-{
-    struct entry    *n1, *n2, *n3, *np;
-    struct listhead head;                   /* List head. */
-    int     i;
-
-    LIST_INIT(&head);                       /* Initialize the list. */
-
-    n1 = malloc(sizeof(struct entry));      /* Insert at the head. */
-    LIST_INSERT_HEAD(&head, n1, entries);
-
-    n2 = malloc(sizeof(struct entry));      /* Insert after. */
-    LIST_INSERT_AFTER(n1, n2, entries);
-
-    n3 = malloc(sizeof(struct entry));      /* Insert before. */
-    LIST_INSERT_BEFORE(n2, n3, entries);
-
-    i = 0;                                  /* Forward traversal. */
-    LIST_FOREACH(np, &head, entries)
-        np->data = i++;
-
-    LIST_REMOVE(n2, entries);               /* Deletion. */
-    free(n2);
-                                            /* Forward traversal. */
-    LIST_FOREACH(np, &head, entries)
-        printf("%i\en", np->data);
-                                            /* List Deletion. */
-    n1 = LIST_FIRST(&head);
-    while (n1 != NULL) {
-        n2 = LIST_NEXT(n1, entries);
-        free(n1);
-        n1 = n2;
-    }
-    LIST_INIT(&head);
-
-    exit(EXIT_SUCCESS);
-}
-.Ed
 .Ss Tail queue example
 .Bd -literal
 #include <stddef.h>
-- 
2.28.0

