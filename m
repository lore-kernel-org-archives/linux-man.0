Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93A6AC04FF3
	for <linux-man@archiver.kernel.org>; Fri, 21 May 2021 23:26:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 79052613F7
	for <linux-man@archiver.kernel.org>; Fri, 21 May 2021 23:26:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230154AbhEUX1a (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Fri, 21 May 2021 19:27:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230146AbhEUX1a (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Fri, 21 May 2021 19:27:30 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6794CC061574
        for <linux-man@vger.kernel.org>; Fri, 21 May 2021 16:26:05 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id a4so22550439wrr.2
        for <linux-man@vger.kernel.org>; Fri, 21 May 2021 16:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rwPkusHIQr3xDMeEi4vP0rcGAwmX6cCLiPQo/5QP3Eg=;
        b=Uz+/2pZJA3tvzjXCntL3TJDdTC/mYm9T82E3pAxTNKGDHOEX2loWgX+j8WcmX4qW6M
         XafVjwUKRIPApEOmXxzeavXvxWQIlbMeWougZGEb8Y9Hj0G0Ws71bFu2r9MAsGq8aapA
         CiouyCbnDCvT72inVsbp4k0dViS1CL6jsEGxKQu8wECZahOooY4/JjZndlwge0tjLxty
         R0dC99MXejWfjPNzQrxZdRgrYysIIMkR2dTp7+ti+IosBvogyK8SaUCzW+GUXki5z8DZ
         TrrW5YgEdLQZl+0Bxb+LrxLjfqv5xm6U0dgS4WTTXZuvUzFNGX7sffNIm9ox1G4ECfRw
         S0jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rwPkusHIQr3xDMeEi4vP0rcGAwmX6cCLiPQo/5QP3Eg=;
        b=WKZKzjh5oypcNbmn8Pokbio0+C1Nzxi34jGjnWx/HvN/+MDoJTXFVSsKLiITNH9DWS
         0faiE7LJhUxU8sajJ5UoY5az4RXtkb+Czf8P4gKAVZDMSjMEesKiGz9tYCoYKbmeSTpm
         Gc+fUQUXLCqVo04aiCvFlLaFhnuLu/YxdEsyJsSbsB+/NNorTpC9CR3olaYK8i1FVO9e
         dYVeYOlj0zw7lnOiCSjIWLT2GvhlZZPV+7Yp1Wyy0TMiuSBOXTufXpcKxO24gKUJGSRC
         1OWX0kqG8ID9RYjpmmVdsYVwnWvMvq7uRWVTOyyUvMDK9Bkv/llPGOoz0QLrvjFVB0t+
         2K+A==
X-Gm-Message-State: AOAM531qypXTsCOFfsGVvD0XdRdx51IptVvxWAiiPO6w8JT22x2ZooBb
        UfRHCDhhWKOH9dAs3C44BYc=
X-Google-Smtp-Source: ABdhPJy2zKjZ1RK9sY9EwHa6zx1UCnKG23f7HFV056xi5J6Ux02n4ZcbnBoROuobTx5YOJdp/n2sWw==
X-Received: by 2002:adf:f946:: with SMTP id q6mr11443282wrr.283.1621639564117;
        Fri, 21 May 2021 16:26:04 -0700 (PDT)
Received: from localhost.localdomain ([170.253.36.171])
        by smtp.googlemail.com with ESMTPSA id z12sm1150639wmc.5.2021.05.21.16.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 16:26:03 -0700 (PDT)
From:   Alejandro Colomar <alx.manpages@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     Alejandro Colomar <alx.manpages@gmail.com>,
        linux-man@vger.kernel.org
Subject: [PATCH 09/10] sigprocmask.2: Use syscall(SYS_...); for raw system calls
Date:   Sat, 22 May 2021 01:25:52 +0200
Message-Id: <20210521232553.161080-9-alx.manpages@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210521232553.161080-1-alx.manpages@gmail.com>
References: <20210521232553.161080-1-alx.manpages@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>
---
 man2/sigprocmask.2 | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/man2/sigprocmask.2 b/man2/sigprocmask.2
index a622e4c18..b82386f14 100644
--- a/man2/sigprocmask.2
+++ b/man2/sigprocmask.2
@@ -37,12 +37,16 @@ sigprocmask, rt_sigprocmask \- examine and change blocked signals
 .BI "int sigprocmask(int " how ", const sigset_t *restrict " set ,
 .BI "                sigset_t *restrict " oldset );
 .PP
+.BR "#include <signal.h>" "           /* Definition of " SIG_* " constants */"
+.BR "#include <sys/syscall.h>" "      /* Definition of " SYS_* " constants */"
+.B #include <unistd.h>
+.PP
 /* Prototype for the underlying system call */
-.BI "int rt_sigprocmask(int " how ", const kernel_sigset_t *" set ,
+.BI "int syscall(SYS_rt_sigprocmask, int " how ", const kernel_sigset_t *" set ,
 .BI "                kernel_sigset_t *" oldset ", size_t " sigsetsize );
 .PP
 /* Prototype for the legacy system call (deprecated) */
-.BI "int sigprocmask(int " how ", const old_kernel_sigset_t *" set ,
+.BI "int syscall(SYS_sigprocmask, int " how ", const old_kernel_sigset_t *" set ,
 .BI "                old_kernel_sigset_t *" oldset );
 .fi
 .PP
-- 
2.31.1

