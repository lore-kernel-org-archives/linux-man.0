Return-Path: <SRS0=Kheo=3J=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDF8EC2D0DB
	for <linux-man@archiver.kernel.org>; Mon, 20 Jan 2020 16:58:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BF49121835
	for <linux-man@archiver.kernel.org>; Mon, 20 Jan 2020 16:58:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726876AbgATQ64 (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 20 Jan 2020 11:58:56 -0500
Received: from mail-vk1-f170.google.com ([209.85.221.170]:37586 "EHLO
        mail-vk1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726642AbgATQ64 (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Mon, 20 Jan 2020 11:58:56 -0500
Received: by mail-vk1-f170.google.com with SMTP id b129so108124vka.4
        for <linux-man@vger.kernel.org>; Mon, 20 Jan 2020 08:58:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=tWr7H9tbkXozPL1Gez6wABF6PpqMQcbnxBHNrjFkpIY=;
        b=sxswFgZUVe1FcPl1qO+Gsyu7ypG8y9iy0SRc9s+T9qTeQS1SFbMmlb2ZoUpCDwo2V5
         GVSnzLVP/moncvsDeVOSups6/qLCDaWUW5SS6ulrC7fEgiaCjcUyge6Pk5H1pWRJA3hR
         Kkmy117GCVVdKvc8DIzZzj/x18WaR1wac/VlhdAhXSaAwLtfKHGOVS1zj/f0ONKm7Fwh
         ooomz1o1NorIfAijeM4mcskhJ/cZBhRxALKKC4N61V4JOlxV9LVRWZSHNCwk3uGmp89H
         sg8lPC2ggxLxchGgzdWAhGJGNKCWlPW4z7Uyv6rdR+zh4NbJ6D8BvkZhgY7d2bRwYlDB
         /u9g==
X-Gm-Message-State: APjAAAUWqog8vNubKQKXEPKTpn/a5FKbTyEztrswMd3OlenHD3oXc5br
        RrG1UltIqSNlmH5UNiCRylO4pIgmkL942aaBwbPwDlxKyt77Xg==
X-Google-Smtp-Source: APXvYqzSCnDrORNJDhfWDvNYJenikqe1OcESdRSepEDMnfGZOxCPOYrQtJfkH724+7VMaDWhFBf80DoNLJfrL9dHTzc=
X-Received: by 2002:a1f:cec2:: with SMTP id e185mr86393vkg.22.1579539535244;
 Mon, 20 Jan 2020 08:58:55 -0800 (PST)
MIME-Version: 1.0
From:   Nick Shipp <ns@segbrk.com>
Date:   Mon, 20 Jan 2020 11:58:44 -0500
Message-ID: <CADjEuPv0ujm9hsvrou2giOeqzZNyKN+vWuHgudvcNNs-ffwCFA@mail.gmail.com>
Subject: [patch] inotify.7: Merge late perror() into fprintf()
To:     mtk.manpages@gmail.com
Cc:     linux-man@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

fprintf may have overridden errno before perror could print it in this
example.
---
 man7/inotify.7 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man7/inotify.7 b/man7/inotify.7
index c052acfe6..995a3116f 100644
--- a/man7/inotify.7
+++ b/man7/inotify.7
@@ -1045,8 +1045,8 @@ main(int argc, char* argv[])
         wd[i] = inotify_add_watch(fd, argv[i],
                                   IN_OPEN | IN_CLOSE);
         if (wd[i] == \-1) {
-            fprintf(stderr, "Cannot watch '%s'\en", argv[i]);
-            perror("inotify_add_watch");
+            fprintf(stderr, "Cannot watch '%s': %s\en",
+                    argv[i], strerror(errno));
             exit(EXIT_FAILURE);
         }
     }
--
2.25.0
