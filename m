Return-Path: <SRS0=TgrO=D6=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 995EDC4363A
	for <linux-man@archiver.kernel.org>; Fri, 23 Oct 2020 14:58:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3B83F2085B
	for <linux-man@archiver.kernel.org>; Fri, 23 Oct 2020 14:58:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uQhmgHjK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S465411AbgJWO6h (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Fri, 23 Oct 2020 10:58:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S465408AbgJWO6g (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Fri, 23 Oct 2020 10:58:36 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B359C0613CE
        for <linux-man@vger.kernel.org>; Fri, 23 Oct 2020 07:58:36 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id e17so2204367wru.12
        for <linux-man@vger.kernel.org>; Fri, 23 Oct 2020 07:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kwBfRLIMtYcJfYNBrMa04rkg4sHfbGqiCDb5zf43pJM=;
        b=uQhmgHjKP6nTlX8qW1hXVsYKFlX9KYKbV3fUZJZ95b9XeUSBfhnGzGPCTanAj4Fw37
         PfEkWaQGIwLWLKas0TIrSlTBXukAl90GO3xsKcG584jvI7VPhbtibRPsSFe71o70fok2
         mA1aky0W4rToCkm0sZamW5NFohaQQTrdRAMaUbvU/FwgYfI3FmCFpRdQgCbCBYGDE+T0
         Lbk/8ImTBxsATNjE8yR/qA+uGNWS8wHwtEBnwP2ByTMOOmdKF/lhcAF576krnpCC6yOR
         BNpjtGx7n0XvN746M8xRFTatmwkgVvIhp0IlVtE1vpHLRC5x8kTuWgwLR8FdzTDC2kaD
         DeXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kwBfRLIMtYcJfYNBrMa04rkg4sHfbGqiCDb5zf43pJM=;
        b=Uo4+Cuz/2kHAdy+gHZzVK8NmIvktpNfp9hFoxPKvq4oRIQvWXSDyyd9kLnJ4UAPBkC
         0Sxvewv0W3LOkTVZX4l27jbj5qL59CDo5scvtqI9aKaeorcBiryQATOvNzZ1bCiPKsjv
         vHdQF3HI0Sx06x4wzf7Mt9nqxCw2TntSViAiXHzUisjhUWOc9ZLaqxWNIFw2LG8iZ3Zs
         hkx+8YZIs412cwT9Ta5mlsZ+R3sYcvNGc+6/7bTiYmzgd2jSCOWFT9D4/ZT/0qqZyclP
         jFn2nOz19EzmiO0iEcUyIaPPXFPEkPsrcBySjd7lPzGlBcwfv6xRzvLR6OSzk8YiPzOy
         Okng==
X-Gm-Message-State: AOAM5332aX57uUBN0aDQNbzEqyCz3y1knpC22ESs3flZYMdgT+44o3KP
        Mo3jrxdFxesBgGC4j3z4u9oYTphGNiI=
X-Google-Smtp-Source: ABdhPJw8L1HkbA28/9VTvd2PjhSz4vxakHxN35sw/IUvL0KzXAlIF+lR8AAS+yRL+uYj8QaoxbA+wA==
X-Received: by 2002:adf:fac3:: with SMTP id a3mr2923267wrs.240.1603465115312;
        Fri, 23 Oct 2020 07:58:35 -0700 (PDT)
Received: from localhost.localdomain ([170.253.60.68])
        by smtp.googlemail.com with ESMTPSA id m8sm3755268wrw.17.2020.10.23.07.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 07:58:34 -0700 (PDT)
From:   Alejandro Colomar <colomar.6.4.3@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     Alejandro Colomar <colomar.6.4.3@gmail.com>,
        linux-man@vger.kernel.org, libc-alpha@sourceware.org
Subject: [PATCH 06/11] queue.3: ffix
Date:   Fri, 23 Oct 2020 16:57:32 +0200
Message-Id: <20201023145736.102750-7-colomar.6.4.3@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201023145736.102750-1-colomar.6.4.3@gmail.com>
References: <20201023145736.102750-1-colomar.6.4.3@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Signed-off-by: Alejandro Colomar <colomar.6.4.3@gmail.com>
---
 man3/queue.3 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man3/queue.3 b/man3/queue.3
index 26e304b2f..79cdca318 100644
--- a/man3/queue.3
+++ b/man3/queue.3
@@ -76,8 +76,8 @@
 .Nm TAILQ_LAST ,
 .Nm TAILQ_NEXT ,
 .Nm TAILQ_PREV ,
-.Nm TAILQ_REMOVE ,
-.\" .Nm TAILQ_SWAP ,
+.Nm TAILQ_REMOVE
+.\" .Nm TAILQ_SWAP
 .Nd implementations of singly-linked lists, singly-linked tail queues,
 lists, tail queues, and circular queues
 .Sh SYNOPSIS
-- 
2.28.0

