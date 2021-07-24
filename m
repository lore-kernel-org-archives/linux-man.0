Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51A4EC4338F
	for <linux-man@archiver.kernel.org>; Sat, 24 Jul 2021 04:59:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 216FD60E9C
	for <linux-man@archiver.kernel.org>; Sat, 24 Jul 2021 04:59:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbhGXETS (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sat, 24 Jul 2021 00:19:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbhGXETS (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sat, 24 Jul 2021 00:19:18 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF016C061575
        for <linux-man@vger.kernel.org>; Fri, 23 Jul 2021 21:59:50 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id 184so3528957qkh.1
        for <linux-man@vger.kernel.org>; Fri, 23 Jul 2021 21:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nkVXavrYL8moIq90Q2hFGaKJetjLIl+udMDOqJzvQhM=;
        b=b6qEoSZVQuC1vmv9uNSCOapOCNjT6nVt5WKTzYuISqQ791dweGknBfqOnyfMUhiR22
         JFbGsNv7khcVqE1wlIHxSI2zNxM8ucUvsELPDh2W0+FvN8m0k+rBHX39sPPYynVu1eSi
         iJMxUzbMyJ6HIvy5ZVjCPIrpYY0uhqtfpZuNw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nkVXavrYL8moIq90Q2hFGaKJetjLIl+udMDOqJzvQhM=;
        b=L+vTaid9WLg/TEFnaenXil1qbCt1GNoQ/TF2G+nyVIErtQYtFy3ltVAaNkg7l2ajTc
         M4ri70SPaTmjVl6BtNoOCcFRfaYE3UUxuoguTTAkGyb1Us98/qN/zxF+PjPjqqsysKTB
         urj1h8f5VLi3qZ+wAH4TCUTvN6zHfYrC1y6svaq8lx8RXszGMYZZ/5rp+F4xKYXHXbNn
         m77kLJZdJZEmcG5TIetJ7lvJAxNtdPcQkh9DlZG0DdYADMO5tdVGkTXSQwt+tKGi9FuV
         /aKFv1p/PULnMSiphidp8TKnvGvxuHGFYw+RCramdw7ps0Fmtm4+WlArvpsKRVUFttGy
         1W9A==
X-Gm-Message-State: AOAM533kjH4jTFMAIB4DyBZpAwPz88lLsg7INGXEst6VtDz8/JtcdTRv
        wDCSSkV677lb7Iytw9/VXGb1wKdr4ezQ6vnB9S+t8lhiPGCjyJx0SW3rTq7XXG7i92w8vDX20mb
        nLEeDSlGNvoVHtdV+jaZBp2LsN3k0NziYtwZAIs6BVLqJyNAXNcK3bJRmYKwxpyjxZxoi5ufz
X-Google-Smtp-Source: ABdhPJwdjUWTb+1VdR+k0X1m13Im7FNfBlghB0BqGTRAH+nk2J0BnbRca009N/VOxBOxedNrTFCQow==
X-Received: by 2002:a37:9445:: with SMTP id w66mr8012509qkd.410.1627102789572;
        Fri, 23 Jul 2021 21:59:49 -0700 (PDT)
Received: from localhost.localdomain (2603-6080-6104-99b0-b920-c658-93d1-d2cb.res6.spectrum.com. [2603:6080:6104:99b0:b920:c658:93d1:d2cb])
        by smtp.gmail.com with ESMTPSA id d25sm12237745qtq.55.2021.07.23.21.59.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Jul 2021 21:59:49 -0700 (PDT)
From:   Sagar Patel <sagarmp@cs.unc.edu>
To:     linux-man@vger.kernel.org
Cc:     alx.manpages@gmail.com, Sagar Patel <sagarmp@cs.unc.edu>
Subject: [PATCH] tkill.2: tfix
Date:   Sat, 24 Jul 2021 00:58:55 -0400
Message-Id: <20210724045855.82231-1-sagarmp@cs.unc.edu>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Correct function signature by adding missing parenthesis.
---
 man2/tkill.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/tkill.2 b/man2/tkill.2
index 6ff930e17..6e1afcd36 100644
--- a/man2/tkill.2
+++ b/man2/tkill.2
@@ -39,7 +39,7 @@ tkill, tgkill \- send a signal to a thread
 .PP
 .B #include <signal.h>
 .PP
-.BI "int tgkill, pid_t " tgid ", pid_t " tid ", int " sig );
+.BI "int tgkill(pid_t " tgid ", pid_t " tid ", int " sig );
 .fi
 .PP
 .IR Note :
-- 
2.30.1 (Apple Git-130)

