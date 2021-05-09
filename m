Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7214C43460
	for <linux-man@archiver.kernel.org>; Sun,  9 May 2021 21:44:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7F6F2613C5
	for <linux-man@archiver.kernel.org>; Sun,  9 May 2021 21:44:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229973AbhEIVpD (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sun, 9 May 2021 17:45:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229955AbhEIVpD (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sun, 9 May 2021 17:45:03 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7542BC06175F
        for <linux-man@vger.kernel.org>; Sun,  9 May 2021 14:43:59 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id n2so14605835wrm.0
        for <linux-man@vger.kernel.org>; Sun, 09 May 2021 14:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ta9ln0wh8y1lBiX/r2zviEBmO6Qh6qgdOXUn7bI13ig=;
        b=tdCHuJe466pauw95zxBmH15L+/kYwJevpdI8fv3dozpKBVoJuJQDaE7ra6r8GXwjpl
         g0umyqVLiv5+f+drZF4kVNhiSGmRC/LiNiO020MzUeP4ktAXqAsxgrckzhdB2cqqdcdV
         4siRU8N9N4omrNW8Tk4jmfhlIGPW+H2Tz4EbF890e28MeebFHqPMMyaQKRg/l1sQSr93
         1pm4jZKOYeP/o/2rlmkePTBgJhL2jnq8u9KhCagaBwstsMQD6j26LTI7H9gAkDksPxJT
         g2AqGN9KSeN5whLrHfcjg6EJYcLexftt8pAP0RI3RiVlhzsy749k1hWRnuH2Oz4wDSDI
         DylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ta9ln0wh8y1lBiX/r2zviEBmO6Qh6qgdOXUn7bI13ig=;
        b=PysQwFLHLLjVLAmZedhkrhzEut6NQBWkgWxG9Ru8V9wM7dDOhk+G/NBBIfI/cKN2yb
         L0152h4Rs8FHGC7O5142rAjHO30eS6GrSs5YlZqkoNk+FEl7UcnCy8XLlM/D0QxmYAPp
         PCyKaTaReudRy8i+ait4LGEFwPUsCmDBESO6xNWAKLiTKqGvqAvPF/CaKo4/+WEXBYvg
         YTFSlksCDlzqYxAxI90+pJnc3aOG6071wPEOKu0KIPCYlhZCSxl0yg7L5Lb0fUpORG0p
         kXW1lOyjtvm7dWNDbXMcaHXyJu2TQZM5QNJK4SQ7vH/cwa+dOeS5ligUSsXWbGqyNQtd
         cj4w==
X-Gm-Message-State: AOAM5301B2+oPqVjLdKoVd2Lknr6GJTl4041IG3uZThgGM16l+K6xlUH
        /LK1XwCsg+tmXc6krhHnvxVqk51/fsLoSQ==
X-Google-Smtp-Source: ABdhPJy9RnNcUWPUbBAs4xlfGMVBZvIvThV1t6et4ZFOp/2i+bWkcpLxeiMnVHidZIwGwAvRN/y+Tg==
X-Received: by 2002:adf:f751:: with SMTP id z17mr26251355wrp.175.1620596638261;
        Sun, 09 May 2021 14:43:58 -0700 (PDT)
Received: from localhost.localdomain ([170.253.36.171])
        by smtp.googlemail.com with ESMTPSA id u6sm16495530wml.6.2021.05.09.14.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 May 2021 14:43:58 -0700 (PDT)
From:   Alejandro Colomar <alx.manpages@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     Alejandro Colomar <alx.manpages@gmail.com>,
        linux-man@vger.kernel.org, Jakub Wilk <jwilk@jwilk.net>
Subject: [PATCH] scripts/bash_aliases: man_gitstaged(): Script around a porcelain git command
Date:   Sun,  9 May 2021 23:38:57 +0200
Message-Id: <20210509213930.94120-3-alx.manpages@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210509213930.94120-1-alx.manpages@gmail.com>
References: <20210509213930.94120-1-alx.manpages@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

The output of 'git status' is not stable.

The more stable 'git status --porcelain' is more complex,
and scripting around it would be more complex.

However, 'git diff --staged --name-only' produces
the output that we were lookiong for.

Reported-by: Jakub Wilk <jwilk@jwilk.net>
Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>
---
 scripts/bash_aliases | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/scripts/bash_aliases b/scripts/bash_aliases
index 8cedc4efc..d9b6047d1 100644
--- a/scripts/bash_aliases
+++ b/scripts/bash_aliases
@@ -153,13 +153,11 @@ function pdfman()
 
 function man_gitstaged()
 {
-	git status							\
-	|sed "/Changes not staged for commit:/q"			\
-	|grep -E "^\s*(modified|deleted|new file):"			\
-	|sed "s/^.*:\s*/, /"						\
+	git diff --staged --name-only					\
+	|sed "s/$/, /"							\
 	|sed "s%man[1-9]/%%"						\
 	|tr -d '\n'							\
-	|sed "s/^, //"
+	|sed "s/, $//"
 }
 
 ########################################################################
-- 
2.31.1

