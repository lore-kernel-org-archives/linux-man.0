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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71A46C43460
	for <linux-man@archiver.kernel.org>; Sun,  9 May 2021 21:44:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 37631613CA
	for <linux-man@archiver.kernel.org>; Sun,  9 May 2021 21:44:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229968AbhEIVpF (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sun, 9 May 2021 17:45:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229980AbhEIVpE (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sun, 9 May 2021 17:45:04 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE553C061573
        for <linux-man@vger.kernel.org>; Sun,  9 May 2021 14:44:00 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id x5so14536757wrv.13
        for <linux-man@vger.kernel.org>; Sun, 09 May 2021 14:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aO/75rPRJ9WQBLdRoX43tyfctoCAZsu2O6Uwfzv/yeU=;
        b=KC0kwpMUM2Hd9z8CgCHWUeb5Q9ksDhNFii8BOEaZ5yOtLAuTW9OaSp8UBQod5RP5vM
         X/gkjmb1sqCyDzLDvXfsHpl4pS5pRqhbQ5mSClSUyujGtLdWtZnxBC9wTJtFTzsJQop/
         WgtRVeDpnMchrjgKcgqWfCfKOQs/oVYCof/ZbnIFEnlm1tEe3IwDRnau+HqENYWuQJJk
         +WbZA0RMmiKD6PvH/YxzSVOWI5NnY3+ZI0shbI2X/8AGAFqcwlnktiSYSgrXvVjpbm8o
         9fxgHN/+aAGtXLcmlwbZeef1jcskOlj+47EXvA/wEbpn3Cws3CWKEJGwPtovCMWhVpnI
         cVeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aO/75rPRJ9WQBLdRoX43tyfctoCAZsu2O6Uwfzv/yeU=;
        b=Zo860/GX3f+5Xz55OjFPqAKu9WIzukCE1lzvkLf6bwFkdzhSnqIpKLsMlwSm/NhsDg
         GhBmvzE5dMW1a0DZJcqp7UOSBDOJqmKFbvIw5KUKhvda8rjgZe5XOhk5E2P5zEugbIj4
         4jVp7hXbDW37bLDXvfNqkWPWxTTuWrNNxHo4hSXwMhmVut1h6a2LMBvxnPvt/Pivfihp
         YJrdbkEJBZ8hzv1Ep126udgXoMQKHEuKpTrcdRV4fC3Mfs65erpnNJ/oUqnXwmMOL2aU
         8NNxpGxecJSWyKzo7A2gLM6oufCJisUv9XC7FlvB+ktnXn0udJZczrjWLp9mhqivd4CE
         3sCg==
X-Gm-Message-State: AOAM5307ypfuFWc4spWA4b5+UlGjYy679rf1QvCIn6nKZIqWBUA69uhR
        TQBNZDeRgFHbygO/vQ1gUMw=
X-Google-Smtp-Source: ABdhPJyD7r2xWP3ynN0oOFj+VCkw0jAY1Z2OKezoFudKFfsn+KYiMnQ+T7lTTp3G6XpkgIVl8dQDHQ==
X-Received: by 2002:a05:6000:2a2:: with SMTP id l2mr26871490wry.285.1620596639557;
        Sun, 09 May 2021 14:43:59 -0700 (PDT)
Received: from localhost.localdomain ([170.253.36.171])
        by smtp.googlemail.com with ESMTPSA id u6sm16495530wml.6.2021.05.09.14.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 May 2021 14:43:59 -0700 (PDT)
From:   Alejandro Colomar <alx.manpages@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     Alejandro Colomar <alx.manpages@gmail.com>,
        linux-man@vger.kernel.org
Subject: [PATCH] dladdr.3: SYNOPSIS: Add missing 'const'
Date:   Sun,  9 May 2021 23:38:59 +0200
Message-Id: <20210509213930.94120-5-alx.manpages@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210509213930.94120-1-alx.manpages@gmail.com>
References: <20210509213930.94120-1-alx.manpages@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Glibc uses 'const' for the 1st parameter of these functions.
Fix the prototypes.

......

.../glibc$ grep_glibc_prototype dladdr
dlfcn/dlfcn.h:98:
extern int dladdr (const void *__address, Dl_info *__info)
     __THROW __nonnull ((2));
.../glibc$ grep_glibc_prototype dladdr1
dlfcn/dlfcn.h:102:
extern int dladdr1 (const void *__address, Dl_info *__info,
		    void **__extra_info, int __flags) __THROW __nonnull ((2));
.../glibc$

Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>
---
 man3/dladdr.3 | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/man3/dladdr.3 b/man3/dladdr.3
index 19944174b..c95df4e49 100644
--- a/man3/dladdr.3
+++ b/man3/dladdr.3
@@ -31,9 +31,9 @@ dladdr, dladdr1 \- translate address to symbolic information
 .B #define _GNU_SOURCE
 .B #include <dlfcn.h>
 .PP
-.BI "int dladdr(void *" addr ", Dl_info *" info );
-.BI "int dladdr1(void *" addr ", Dl_info *" info ", void **" \
-        extra_info ", int " flags );
+.BI "int dladdr(const void *" addr ", Dl_info *" info );
+.BI "int dladdr1(const void *" addr ", Dl_info *" info ", void **" extra_info ,
+.BI "            int " flags );
 .PP
 Link with \fI\-ldl\fP.
 .fi
-- 
2.31.1

