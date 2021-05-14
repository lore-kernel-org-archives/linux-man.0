Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5A2EC433ED
	for <linux-man@archiver.kernel.org>; Fri, 14 May 2021 13:26:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BAD39611CA
	for <linux-man@archiver.kernel.org>; Fri, 14 May 2021 13:26:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230125AbhENN1y (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Fri, 14 May 2021 09:27:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230075AbhENN1y (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Fri, 14 May 2021 09:27:54 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5FF4C061574
        for <linux-man@vger.kernel.org>; Fri, 14 May 2021 06:26:42 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id n2so30112095wrm.0
        for <linux-man@vger.kernel.org>; Fri, 14 May 2021 06:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YagRrgJ08sLqt39s0bZPcckaHamBMhjebC0Qr1w281w=;
        b=UA6/OJhCezPLasHXoIOjyJxNWdXrYPTSYLde+/1QbHBpn7INf68EDZojutxaXfq7TH
         2m6oqxrHT8Dx0prndkdPPZYxEFr4hfdtImMdQEm/k0UfSqHuDLirRIe/XvAhryYXp5tP
         vCn/Tf3HhAMdctoDyaTIgPejhjaSfp9BqTRlwDU8zS8RN4vPYcWkspgeez/Rhwar9Tx6
         2KZy7B8YRGp5zhv5LMDCo/ewZ35GanZ2AYYD0tHbwoLENvmtFYJ6AOswSkDMIOh0FknI
         j8puO7Fw3UiK6oghkhIjwPoYDL/gcchwBg+Qoj2HpvTywODZ285hI5LaMpB+dz/MqoS4
         bUCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YagRrgJ08sLqt39s0bZPcckaHamBMhjebC0Qr1w281w=;
        b=mKrNHm3O6mQUMor+MzuqerxZfbLB3zIYM8/mPTizl/uK0dRsju/vgJQaDomGBJbSqS
         b0p/fOXjLI1w6/mItQzJGlbAA8Shcatx4SdeApBxb850ngsozE3hJZbogAk64zivbjiw
         muG6gA1wf9UwaE5Ng/61Ycxi/abwk2BIoyeBU6QyM+5B2FhZRb67fJA5PJ3tnFJCcKff
         LbzXaFFAWkCHBnVBUQOd6j+bVBJYw98T6z4gZhRw993/X2cjQtIozFIHqFGGu6tYYU/G
         WE1Ic5s1y7f7umP9wQtPKG3n7xJQb53wCj1xNspJEuU1XeFmXD1d8kmy7bsnfpbKQb3j
         9QmA==
X-Gm-Message-State: AOAM530bMqSZZv2wtM+AqECNPVXMeBDFBEVdvdoQ74Bv6WeYCfzp1joA
        b5Shzn8pKyACgL6PiZIVuuY=
X-Google-Smtp-Source: ABdhPJykYoSAMsyZOcHY2aI4cbpcuIR3uHe9e87aKRUhGH/1dOzSaD++XigEoTqTMBzx2HBv8Pwz7Q==
X-Received: by 2002:adf:e4c4:: with SMTP id v4mr16291513wrm.346.1620998800208;
        Fri, 14 May 2021 06:26:40 -0700 (PDT)
Received: from sqli.sqli.com ([195.53.121.100])
        by smtp.googlemail.com with ESMTPSA id p20sm6460843wmq.10.2021.05.14.06.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 May 2021 06:26:39 -0700 (PDT)
From:   Alejandro Colomar <alx.manpages@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     Alejandro Colomar <alx.manpages@gmail.com>,
        linux-man@vger.kernel.org, jwakely@redhat.com
Subject: [PATCH v2] getaddrinfo.3: Fix includes
Date:   Fri, 14 May 2021 15:26:35 +0200
Message-Id: <20210514132635.17844-1-alx.manpages@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <499d96ce-cc52-e463-7bd2-86f7bea7e260@gmail.com>
References: <499d96ce-cc52-e463-7bd2-86f7bea7e260@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

- Remove unnecessary includes
- Add a comment about why each include is needed
- Sort alphabetically

All this has been done using iwyu(1):

$ iwyu getaddrinfo_server.c 2>&1 \
  | sed -e '\,^#,s,//,/*,' -e '\,^#,s,$, */,' \
  | sed '/^#/s/\w*\.\.\./.../';

getaddrinfo_server.c should add these lines:

getaddrinfo_server.c should remove these lines:
- #include <sys/types.h>  // lines 1-1

The full include-list for getaddrinfo_server.c:
#include <netdb.h>       /* for addrinfo, gai_strerror, freeaddrinfo, ... */
#include <stdio.h>       /* for fprintf, NULL, stderr, printf */
#include <stdlib.h>      /* for exit, EXIT_FAILURE */
#include <string.h>      /* for memset */
#include <sys/socket.h>  /* for bind, recvfrom, sendto, socket, ... */
#include <unistd.h>      /* for close, ssize_t */
$ iwyu getaddrinfo_client.c 2>&1 \
  | sed -e '\,^#,s,//,/*,' -e '\,^#,s,$, */,' \
  | sed '/^#/s/\w*\.\.\./.../';

getaddrinfo_client.c should add these lines:

getaddrinfo_client.c should remove these lines:
- #include <sys/types.h>  // lines 1-1

The full include-list for getaddrinfo_client.c:
 #include <netdb.h>       /* for addrinfo, freeaddrinfo, gai_strerror, ... */
 #include <stdio.h>       /* for fprintf, stderr, perror, printf, NULL, size_t */
 #include <stdlib.h>      /* for exit, EXIT_FAILURE, EXIT_SUCCESS */
 #include <string.h>      /* for memset, strlen */
 #include <sys/socket.h>  /* for connect, socket, AF_UNSPEC, SOCK_DGRAM */
 #include <unistd.h>      /* for close, read, write, ssize_t */
$

Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>
---

 man3/getaddrinfo.3 | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/man3/getaddrinfo.3 b/man3/getaddrinfo.3
index 35071b733..aa3b81165 100644
--- a/man3/getaddrinfo.3
+++ b/man3/getaddrinfo.3
@@ -660,13 +660,12 @@ The programs are an echo server and client for UDP datagrams.
 .SS Server program
 \&
 .EX
-#include <sys/types.h>
-#include <stdio.h>
-#include <stdlib.h>
-#include <unistd.h>
-#include <string.h>
-#include <sys/socket.h>
-#include <netdb.h>
+#include <netdb.h>       /* for addrinfo, gai_strerror, freeaddrinfo, ... */
+#include <stdio.h>       /* for fprintf, NULL, stderr, printf */
+#include <stdlib.h>      /* for exit, EXIT_FAILURE */
+#include <string.h>      /* for memset */
+#include <sys/socket.h>  /* for bind, recvfrom, sendto, socket, ... */
+#include <unistd.h>      /* for close, ssize_t */
 
 #define BUF_SIZE 500
 
@@ -755,13 +754,12 @@ main(int argc, char *argv[])
 .SS Client program
 \&
 .EX
-#include <sys/types.h>
-#include <sys/socket.h>
-#include <netdb.h>
-#include <stdio.h>
-#include <stdlib.h>
-#include <unistd.h>
-#include <string.h>
+#include <netdb.h>       /* for addrinfo, freeaddrinfo, gai_strerror, ... */
+#include <stdio.h>       /* for fprintf, stderr, perror, printf, NULL, size_t */
+#include <stdlib.h>      /* for exit, EXIT_FAILURE, EXIT_SUCCESS */
+#include <string.h>      /* for memset, strlen */
+#include <sys/socket.h>  /* for connect, socket, AF_UNSPEC, SOCK_DGRAM */
+#include <unistd.h>      /* for close, read, write, ssize_t */
 
 #define BUF_SIZE 500
 
-- 
2.31.1

