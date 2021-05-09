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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6A8BC43461
	for <linux-man@archiver.kernel.org>; Sun,  9 May 2021 21:44:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A7DBD613C9
	for <linux-man@archiver.kernel.org>; Sun,  9 May 2021 21:44:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230025AbhEIVpR (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sun, 9 May 2021 17:45:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230034AbhEIVpP (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sun, 9 May 2021 17:45:15 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 859DFC06175F
        for <linux-man@vger.kernel.org>; Sun,  9 May 2021 14:44:11 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id a4so14561299wrr.2
        for <linux-man@vger.kernel.org>; Sun, 09 May 2021 14:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=45p+hvoMudLhIzAvrpxzruGa6z2ctVkFIAetAOLESR8=;
        b=Lf/eZB4dLq9V9sVP0+hyMZ7POYe1fFORD25R6Fj1iliqYUO9CwUcT/vgmk7fsKccXv
         2R2daLcSdF0/9WKW4x4OmgB75LFMO+j1mB0JCyeclQyDf9CLvfz0xRWUmn4aTigaD99y
         1U8KLXuiDacVcdaGHFWEMgUAmcIlElDh8ZxEfW1YX4cNSPTAtgHwqChpGK45O6mxe/Rd
         h2dy+zrixZMzLOndtvcONrsbdUJmtY5nZQdRWDzs14eNlIYqNNA6r6vGFY+Gh919ZIcg
         PbIWPAWWAJNx1QV/4TPeE5s3oappNlJqXByh6JY56cxqWKLRVcIk3xzs61pZwn5kVKKi
         Ntvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=45p+hvoMudLhIzAvrpxzruGa6z2ctVkFIAetAOLESR8=;
        b=MXn7kIzwFS/CbtJdxg4Ub/11n6jlo9V7rNUaaWSqpCFmPPYkKjizvgWi0MsvLm7+lR
         uB49irBVxoKLTKyjLpwKqSwkI7YWb9TQzK3Ms5Cwj0hxZaJ0dvLmrLcfwF6/5NcVF1Mk
         suRFicyjsWswLwhKPzF/mJ5TP5LG+QRGHWT3C6/6ClvPQ4ZfUtPQFL4k2AJ86T+607Gj
         Ptnb690+378ZOIT9ZeZIxsS0jKcNAF+VZnlDraeW7P/b/1PQmC0u2X2F9euvqSEHH0MB
         UCez0FXXXK4HIzlzEK0P0gGZtf7iPnsPFZB1aDmof/28097/54nbgaNhElSteJ6DetUN
         nJlQ==
X-Gm-Message-State: AOAM530XDAqsoKoc7ihqYbO65o6r8kmEEn28wQaMizYXT0vwos5Jtr1K
        6v2BLaKtc6i8d/4n8xrbMlU=
X-Google-Smtp-Source: ABdhPJxrNjxFCBzfprm1iqLGSvO1qh7o3BbtwhA4RVkImi1QwbYuCqvswlkVw+UIjydJ+9cnnBir6A==
X-Received: by 2002:adf:de87:: with SMTP id w7mr26739816wrl.195.1620596650398;
        Sun, 09 May 2021 14:44:10 -0700 (PDT)
Received: from localhost.localdomain ([170.253.36.171])
        by smtp.googlemail.com with ESMTPSA id u6sm16495530wml.6.2021.05.09.14.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 May 2021 14:44:10 -0700 (PDT)
From:   Alejandro Colomar <alx.manpages@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     Alejandro Colomar <alx.manpages@gmail.com>,
        linux-man@vger.kernel.org
Subject: [PATCH] strsignal.3: SYNOPSIS: Add missing 'const'
Date:   Sun,  9 May 2021 23:39:14 +0200
Message-Id: <20210509213930.94120-20-alx.manpages@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210509213930.94120-1-alx.manpages@gmail.com>
References: <20210509213930.94120-1-alx.manpages@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

glibc uses 'const' in sigdescr_np(), sigabbrev_np().
Let's use it here too.

.../glibc$ grep_glibc_prototype sigdescr_np
string/string.h:469:
extern const char *sigdescr_np (int __sig) __THROW;
.../glibc$ grep_glibc_prototype sigabbrev_np
string/string.h:466:
extern const char *sigabbrev_np (int __sig) __THROW;
.../glibc$

Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>
---
 man3/strsignal.3 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man3/strsignal.3 b/man3/strsignal.3
index 6a5a1e610..bc4120303 100644
--- a/man3/strsignal.3
+++ b/man3/strsignal.3
@@ -36,8 +36,8 @@ strsignal, sigdescr_np, sigdescr_np, sys_siglist \- return string describing sig
 .B #include <string.h>
 .PP
 .BI "char *strsignal(int " sig );
-.BI "char *sigdescr_np(int " sig );
-.BI "char *sigabbrev_np(int " sig );
+.BI "const char *sigdescr_np(int " sig );
+.BI "const char *sigabbrev_np(int " sig );
 .PP
 .BI "extern const char *const " sys_siglist [];
 .fi
-- 
2.31.1

