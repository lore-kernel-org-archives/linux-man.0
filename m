Return-Path: <SRS0=7aiR=DC=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EDF3C4727F
	for <linux-man@archiver.kernel.org>; Fri, 25 Sep 2020 07:33:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DAF9D235FA
	for <linux-man@archiver.kernel.org>; Fri, 25 Sep 2020 07:33:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RtD9e/B1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727443AbgIYHdH (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Fri, 25 Sep 2020 03:33:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727441AbgIYHdH (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Fri, 25 Sep 2020 03:33:07 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24192C0613CE
        for <linux-man@vger.kernel.org>; Fri, 25 Sep 2020 00:33:07 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id q9so1989373wmj.2
        for <linux-man@vger.kernel.org>; Fri, 25 Sep 2020 00:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hCakttq2xJC+3A2ls+Ur67tsq8FdsIDuSbR0awxBJns=;
        b=RtD9e/B1itrgip0GmD+1A4r1gu9YfxjgNkfyFoyPog6MmAFq5maQcvnPA5ky4/1Cwz
         2GmkI7qqw2ifQit5pXBQkGYAPZOMPE77SIBgszAK5n0Gzn/F9GtJTWT9JutJvbDOmDu4
         Ut32FNtIUeCM+k9O8i21bzZJ0l4oKhig2i/xf32/gg1Jc2j7xXSes/FnQAz4j/fmbkty
         ktMVM3nqLpzK9xGuExkSyeEaFFJLHhvOCl+9rQhOJluTYQNe7lQMFZh4vfaujcdopp+f
         MOuOKADKcWiwuefDJmLsQDQDqQip/LtoK391hbK7xCw17x7406BHST8ZBErj11NtyQ3L
         6BOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hCakttq2xJC+3A2ls+Ur67tsq8FdsIDuSbR0awxBJns=;
        b=X8Vp6N6KfsJD8vj28DZB3r8PkthUY4duMkpFo57/6p/JRit3qGiZEdT2f2ixMrdXE2
         B3EmRpm7UZpN8iU80uPsiTwO53tjA+WZ40PA1betuPE9f/9hQkopjCK0Y7Zk7DTmqb0Q
         hOZe+Hjh/RRxECC6vBfVWMNAnfcB6iy8Br4cutzHhDDi8LbeoTFTAy3VXE9QS0INJoP0
         Ef+UAxK5AakxXZfL/cb1aD8fNUviHDtSWUNLbNseZFw6vOzu6XbVKLX2yNk6IDA9ifIK
         8si753bd4xqoDW/0pkurEI7ep+xAx0uSRDQIqnScRk81cxj7z8rJxzgQJqgjNuRojFNa
         U2Tg==
X-Gm-Message-State: AOAM533sre3lk517GyFDwtn/ZRMbs9H/6Pfb/aXjir2ZUhO4/BDyXtHm
        oOuXtqxGam5CBk0eZJxIV6o=
X-Google-Smtp-Source: ABdhPJxZqYlzXVgjBMwIQkKOpOhv00QQtOlmgILVVjS9bDAlKZEWYalhFT9b1B5KQKaH4aa3v7PSmg==
X-Received: by 2002:a1c:bcd4:: with SMTP id m203mr1571082wmf.75.1601019185890;
        Fri, 25 Sep 2020 00:33:05 -0700 (PDT)
Received: from localhost.localdomain ([170.253.60.68])
        by smtp.googlemail.com with ESMTPSA id n2sm1974314wma.29.2020.09.25.00.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2020 00:33:05 -0700 (PDT)
From:   Alejandro Colomar <colomar.6.4.3@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     linux-man@vger.kernel.org, libc-alpha@sourceware.org,
        Alejandro Colomar <colomar.6.4.3@gmail.com>
Subject: [PATCH 09/10] seccomp.2: Use ARRAY_SIZE() macro instead of raw sizeof division
Date:   Fri, 25 Sep 2020 09:31:40 +0200
Message-Id: <20200925073140.173394-10-colomar.6.4.3@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200925073140.173394-1-colomar.6.4.3@gmail.com>
References: <20200925073140.173394-1-colomar.6.4.3@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Signed-off-by: Alejandro Colomar <colomar.6.4.3@gmail.com>
---
 man2/seccomp.2 | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/man2/seccomp.2 b/man2/seccomp.2
index d6b856c32..82eb04dc6 100644
--- a/man2/seccomp.2
+++ b/man2/seccomp.2
@@ -1051,6 +1051,7 @@ cecilia
 #include <sys/prctl.h>
 
 #define X32_SYSCALL_BIT 0x40000000
+#define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
 
 static int
 install_filter(int syscall_nr, int t_arch, int f_errno)
@@ -1101,7 +1102,7 @@ install_filter(int syscall_nr, int t_arch, int f_errno)
     };
 
     struct sock_fprog prog = {
-        .len = sizeof(filter) / sizeof(filter[0]),
+        .len = ARRAY_SIZE(filter),
         .filter = filter,
     };
 
-- 
2.28.0

