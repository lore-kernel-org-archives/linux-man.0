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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3D2DC433DB
	for <linux-man@archiver.kernel.org>; Mon, 15 Feb 2021 13:17:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C1A8564DEE
	for <linux-man@archiver.kernel.org>; Mon, 15 Feb 2021 13:17:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230175AbhBONRV (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 15 Feb 2021 08:17:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230098AbhBONRT (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Mon, 15 Feb 2021 08:17:19 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63D2FC061574
        for <linux-man@vger.kernel.org>; Mon, 15 Feb 2021 05:16:38 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id z63so4014465wmg.4
        for <linux-man@vger.kernel.org>; Mon, 15 Feb 2021 05:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fP/CglUMVqcfcdsMMm+EhRPYiccGGibc0fTfKRkJAU0=;
        b=BI2zwRWp5fRU7zPYg+x/XAb45KNTbkVFn4P3HAExHqlRcuX1BmxnaWQ7+L7Zh6q6Ry
         0EztFyZ1gbbUcMwnz/7fSIfz4+fv3rgfpLvWA8J9bqvhmkn1TH8BpH7eEKc+rfL4C+Z1
         7vOBWnhM+jP8yxgy5xMweFBeXoE9+vxkke7moFaViGMDsBhVOQkq8cdrvm4vX9chVN6a
         JucXFugg25/X56Ql32Fk1bj4HvFAApB72z3tM/7CL2zAzBPwWe1JyaHtSMlujaf15gB2
         5s0eisWn1h3j0WmlU5SywkAfbH90AoE62oZSdjlsqsVjZcDOdux5l9MznxWoco7s2mGn
         wtlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fP/CglUMVqcfcdsMMm+EhRPYiccGGibc0fTfKRkJAU0=;
        b=uUnJrLjjbsiA0A4Df04yJGKhtgqJ7IxuyX4h7DWwm5r9zSxEh3nZxs09pG9AYNvBFV
         qcD0y5aPankz/NzMJHFNBkJYpN11mIhkOQeozDHuZeiL6NZUgvYExj02plBfEipBD4OL
         6OMXDCmaDtkci+oqup5X//Acayd5GAAI6ibsfwuhcA7/IrPG9CCn2JPbnT+e/yUcgamD
         9A2R0TD3IZSKjp6uhSIvg+2Q6egD9kaIzs/iV+45M8gCsaOfDhLx0hw25uXJPxP9HXGe
         VkneL/gG3vt65YPQ3MgOjA6ib4p1BDyF1IJoSH3gksIE2zP77FaUkKGZpBIX5aQ6IiTg
         Gcyw==
X-Gm-Message-State: AOAM5323Rej9XuQUVXuNybpTmb8CIPmfidZZauh5mmUa80XO3R7uV7/o
        rJSrz8VRirgnIiOFX8DwVl4=
X-Google-Smtp-Source: ABdhPJzB+CCgnsQzxL161FTB/sVTfYywSp7C9a6FySO5jURWVxsgei/aWH256hJM4Fvg+8K8cg4SCw==
X-Received: by 2002:a7b:c953:: with SMTP id i19mr2026065wml.75.1613394997257;
        Mon, 15 Feb 2021 05:16:37 -0800 (PST)
Received: from debian.vlc ([170.253.51.130])
        by smtp.gmail.com with ESMTPSA id d15sm19309504wru.80.2021.02.15.05.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 05:16:36 -0800 (PST)
From:   Alejandro Colomar <alx.manpages@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     Alejandro Colomar <alx.manpages@gmail.com>,
        linux-man@vger.kernel.org
Subject: [PATCH] sched_setattr.2: Add note about missing glibc wrappers
Date:   Mon, 15 Feb 2021 14:15:12 +0100
Message-Id: <20210215131522.450666-2-alx.manpages@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

......

.../glibc$ grep_glibc_prototype sched_setattr
.../glibc$ grep_glibc_prototype sched_getattr
.../glibc$

Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>
---
 man2/sched_setattr.2 | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/man2/sched_setattr.2 b/man2/sched_setattr.2
index ecbdbffc4..c79b74a49 100644
--- a/man2/sched_setattr.2
+++ b/man2/sched_setattr.2
@@ -37,6 +37,9 @@ set and get scheduling policy and attributes
 .BI "                  unsigned int " size ", unsigned int " flags );
 .fi
 .\" FIXME . Add feature test macro requirements
+.PP
+.IR Note :
+There are no glibc wrappers for these system calls; see NOTES.
 .SH DESCRIPTION
 .SS sched_setattr()
 The
@@ -388,6 +391,9 @@ These system calls first appeared in Linux 3.14.
 .SH CONFORMING TO
 These system calls are nonstandard Linux extensions.
 .SH NOTES
+Glibc does not provide wrappers for these system calls; call them using
+.BR syscall (2).
+.PP
 .BR sched_setattr ()
 provides a superset of the functionality of
 .BR sched_setscheduler (2),
-- 
2.30.0

