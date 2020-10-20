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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10192C4363A
	for <linux-man@archiver.kernel.org>; Tue, 20 Oct 2020 14:23:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B30042224F
	for <linux-man@archiver.kernel.org>; Tue, 20 Oct 2020 14:23:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DbBBriUo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408041AbgJTOXp (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Tue, 20 Oct 2020 10:23:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407989AbgJTOXp (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Tue, 20 Oct 2020 10:23:45 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93308C061755
        for <linux-man@vger.kernel.org>; Tue, 20 Oct 2020 07:23:43 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id c77so1995324wmd.4
        for <linux-man@vger.kernel.org>; Tue, 20 Oct 2020 07:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mmsFsfv/B3MScHqyQjkwZ06nYyX1lorlGxlwweOx9HM=;
        b=DbBBriUoYCCI1iSy3gYl6weSxrBocX/ViIsL1SEEUcdBxoQyhM7Tr+A5xlULdWXLgK
         BANh17r1W9M1+8y8Gkt+kjvWIq3cyffPfwTgDyEOC4uWXBoBDFM+sLpz/9/59KaPDLoS
         6qpFJ2eWsYnM7XlniBJCFSVEApeCZNRzoN8bku1Z3Xqbb9W5HpuMcTmHksIssFfMDfYp
         d/3yHuZyA0s42irVVK11g/46AncZ7T0WsZpINt3D+pxTv10j8WKy1JFhacajNnvH1diy
         j1nJZAm3db/ax6oadQl12/SKllN57YG65AEwiSt2/Pb0+Pl52+0ZuluM8lTiwB4RW7sr
         SVpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mmsFsfv/B3MScHqyQjkwZ06nYyX1lorlGxlwweOx9HM=;
        b=hOiuz1yU2ZW9yzLbq+Hv+YkbScgRHE2NlAYxJsejeqJNvJ6l3UA3B0gTUZxFl8ruNQ
         GhlWFylqw30cJ7feHBDevfa7ojLZy8jiYQUx6R6aPKUrqiallNYTRPqXdas3+I8cT4gp
         rPnZe3YB+2TMGQhsK4h6ell6YCQ8wEG3oDezqekmdBTqeNXSFJCUhXjCdgwytqguraC+
         Hitam66QzE8+6Xh6id5xmxU4G4thnHerhvcz9Z5B72XHVPna/9ysseGqDY5Mui5Wd/Y/
         0XtszdA0AJI3nMgK/YdFo8lKUD3Zs57xyDHc15y1LKAs9Y1UVN8Fo1AU2RbwBA/tu9DW
         VgyQ==
X-Gm-Message-State: AOAM532t1EsoBVRe2vQ5H/SwTXicErci+EDSF0nbkQ7XhoaBxQOwdr16
        NFGp4QHpKXAuX6d2xeLtcE2JOqLc+1w=
X-Google-Smtp-Source: ABdhPJwzYi91lN0Rs2ouQc9UcGgwdgVzhI3NkaYttd6hm89/a1v1oAeSeg/TDyUhcWV+UX/OYzPc2g==
X-Received: by 2002:a1c:a749:: with SMTP id q70mr1309267wme.117.1603203822369;
        Tue, 20 Oct 2020 07:23:42 -0700 (PDT)
Received: from localhost.localdomain ([170.253.60.68])
        by smtp.googlemail.com with ESMTPSA id s19sm3422153wmc.0.2020.10.20.07.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2020 07:23:41 -0700 (PDT)
From:   Alejandro Colomar <colomar.6.4.3@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     Alejandro Colomar <colomar.6.4.3@gmail.com>,
        linux-man@vger.kernel.org, libc-alpha@sourceware.org
Subject: [PATCH 20/22] list.3: EXAMPLES: ffix: Use man markup
Date:   Tue, 20 Oct 2020 16:21:45 +0200
Message-Id: <20201020142146.61837-21-colomar.6.4.3@gmail.com>
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
 man3/list.3 | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/man3/list.3 b/man3/list.3
index b22453ab9..bb64fff92 100644
--- a/man3/list.3
+++ b/man3/list.3
@@ -262,8 +262,7 @@ Present on the BSDs
 (LIST macros first appeared in 4.4BSD).
 .SH BUGS
 .SH EXAMPLES
-.Ss List example
-.Bd -literal
+.EX
 #include <stddef.h>
 #include <stdio.h>
 #include <stdlib.h>
@@ -314,7 +313,7 @@ main(void)
 
     exit(EXIT_SUCCESS);
 }
-.Ed
+.EE
 .SH SEE ALSO
 .BR insque (3),
 .BR queue (3)
-- 
2.28.0

