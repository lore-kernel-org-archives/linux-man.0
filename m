Return-Path: <SRS0=EgWi=EA=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE7B0C388F7
	for <linux-man@archiver.kernel.org>; Sun, 25 Oct 2020 10:24:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 59CAE22269
	for <linux-man@archiver.kernel.org>; Sun, 25 Oct 2020 10:24:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oZ/B67lv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1414946AbgJYKYH (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sun, 25 Oct 2020 06:24:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1414941AbgJYKYG (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sun, 25 Oct 2020 06:24:06 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AF34C0613D0
        for <linux-man@vger.kernel.org>; Sun, 25 Oct 2020 03:24:06 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id n6so8956805wrm.13
        for <linux-man@vger.kernel.org>; Sun, 25 Oct 2020 03:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fdGaAW9Akr/gmxuZahJxB9vp/UBO55/5ktZwOfQ9fMo=;
        b=oZ/B67lvgaqxZZ7+9+OvtiCbEmRuDxaEVQSuCb/T/ARZimMFrfIbw+JOVsJBLc7JN/
         lR7jwL3dr06FaUHd8H2OxnlbcCHyX8GaPH92SP9XAnVA2A9lPxMEPXWMR01DSeXjMDC8
         zXESCmwfBU5ZFcjo+lu/MllTd78v6AtENDm8Am0Jf/u/h4NJy4I0QaqIm/m1QHIucPFT
         d8a4VABraz9TrSfCNPlbdthgdqN0bhcNPsourh1pzclgOS1EKFqkQ+fHVM/HgdwpfT4z
         NWpN5ZWIpjK7SttRbjrW/r8cv7yX0T1t+PW4kz8PaZUbfG7DPQezB6lT6JHKujguaxr9
         M2TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fdGaAW9Akr/gmxuZahJxB9vp/UBO55/5ktZwOfQ9fMo=;
        b=rS5e+h+gpS9dkthJKXRBFk5U0BiBaPz3NGNjtawpyd7QbO4lOtOOOGj3cpzAKx6qDw
         zFmY4wJhNDm8znaKeZjMYVvmApE5zzbMnAbStP43daIuQTf/6Iv3zI/i7zc4nccVrGAA
         KblLLXhYA491SWZIUzSBFokXC3Ibx0uYcGFALjj4diIUVsm/LFmwLAp+y4wmNAsg4Opp
         kA1u5b10ybMnqmKkfhkQlzE2qL9kW3M4+zqeVolSPX67SZ+lCBQCbQF1lF5YXKmMhWmK
         NR54x/oN1cJxbksqNrgnIpCs8Y1U0ZQ5GZSC2QPeQlRbhDZ6cdfjaw1qr3ZYCQtrAfQN
         1lEg==
X-Gm-Message-State: AOAM531EQb9OT4b3nXh0q8xr3TFnZC0jzAQsyvS/5u2Yd06kuGt9tj+L
        lbDUhXD2eO8v6CVoeQW/UbI=
X-Google-Smtp-Source: ABdhPJyUCQmRGfVxYLOTydx/gxkvIjJuLP3i0OL5MlL5TxUjVDhjf3lblymmIoB8I72bIgD20NY+Hw==
X-Received: by 2002:a5d:40cb:: with SMTP id b11mr12844002wrq.254.1603621444986;
        Sun, 25 Oct 2020 03:24:04 -0700 (PDT)
Received: from localhost.localdomain ([170.253.60.68])
        by smtp.googlemail.com with ESMTPSA id s185sm15724860wmf.3.2020.10.25.03.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2020 03:24:04 -0700 (PDT)
From:   Alejandro Colomar <colomar.6.4.3@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     Alejandro Colomar <colomar.6.4.3@gmail.com>,
        linux-man@vger.kernel.org, libc-alpha@sourceware.org
Subject: [PATCH 1/2] queue.3: Add self to copyright notice
Date:   Sun, 25 Oct 2020 11:21:32 +0100
Message-Id: <20201025102132.41223-1-colomar.6.4.3@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Signed-off-by: Alejandro Colomar <colomar.6.4.3@gmail.com>
---

Hi Michael,

After these 2 patches, I think I'll only add one more patch
to all of the pages improving a bit the SYNOPSIS
(taking a good idea from OpenBSD's queue(3)).

I guess you're about to release, so please wait for that one :)
I'll have it in a few minutes, anyway :p

Cheers,

Alex

 man3/queue.3 | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/man3/queue.3 b/man3/queue.3
index 1c9a6f573..3931f8c96 100644
--- a/man3/queue.3
+++ b/man3/queue.3
@@ -1,5 +1,6 @@
 .\" Copyright (c) 1993
-.\"	The Regents of the University of California.  All rights reserved.
+.\"    The Regents of the University of California.  All rights reserved.
+.\" and Copyright (c) 2020 by Alejandro Colomar <colomar.6.4.3@gmail.com>
 .\"
 .\" %%%LICENSE_START(BSD_3_CLAUSE_UCB)
 .\" Redistribution and use in source and binary forms, with or without
-- 
2.28.0

