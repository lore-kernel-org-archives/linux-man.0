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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2F7BC433F5
	for <linux-man@archiver.kernel.org>; Sat, 11 Sep 2021 16:01:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BAD7A60E9B
	for <linux-man@archiver.kernel.org>; Sat, 11 Sep 2021 16:01:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232708AbhIKQCx (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sat, 11 Sep 2021 12:02:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230513AbhIKQCu (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sat, 11 Sep 2021 12:02:50 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F37BFC061757
        for <linux-man@vger.kernel.org>; Sat, 11 Sep 2021 09:01:37 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id y132so3370745wmc.1
        for <linux-man@vger.kernel.org>; Sat, 11 Sep 2021 09:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LnLYXKrhbf/vcTFoXlA5ZUG/t5PhE/W4Y0eTsTUY68M=;
        b=feQqbaxEkzh34ksDkt9ZW0sbGX4qNU75vOsRiraQICPzA6jwWIK04HPAJR7ivjQuqh
         E2u//jFtNiy6HtNkj7A898T67PbwywvpRb4gKDRfj4FyrgtbzBxfgSjtE+KJKHfeG1lh
         rLREIKQJyioWuKQO2to0Gt9fXcFOspYFjjqQs/sH2hj2H5h8IKqmjOeFePGJyP5r9Cz3
         yMKbzASgjltrA0u1FC6dQLHPBqta3CN4Icrlrv2P1UMh8fYiRrFwxvUFQQInIJfM5RLl
         8Uv+QlLdDNWkcSnITkeXuqsb6geSDQdN9w4EowLhlpig08cCkkhzWBI7d8zJg7/GhtGw
         IVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LnLYXKrhbf/vcTFoXlA5ZUG/t5PhE/W4Y0eTsTUY68M=;
        b=Cg6toU6zjQXDIISvjurMDN+qZn2EgQhRrtVUZNhG67iBrmjg3vtqAea0aLqtXe4NnT
         Z8QN9AhCReiUdUecUsQ2wxd7veDF8zchaqLyfaAng9P82LSrvgzvR1/xRHOI4aRMOvH6
         2PVHzjeI5vwBWJgT6c14aI7Rhc6sY+UMsJ8GvZ5tk/ut9ZN8wnrUHDYWaJSpv0ufk/6I
         bw62E6e4tOOWFuGXv0VMiUWcniWTKw3CpZrs9aHay3zmx/cCCmO3HEjs1ckzqmkpG7tF
         ew+w5JqNDV8v6NFhGLAmGFVeMlcLf8uruoTL0S3mOOMkNyu/LZHU9LxzJ3mxbfRo6iao
         vKzQ==
X-Gm-Message-State: AOAM5311hyiyjW0Q/NEFFQcduV4/UMyDWwU0RukpzirWH25kP1OxIYrn
        UBtp6YsWxb6rDIsbxp0Rtvc=
X-Google-Smtp-Source: ABdhPJzXF+segJEPFiC5xLRpegUke9t3nmPr9sRktygtaJAeFqt4gFoWkqDTDKcD2uiGaaaMtEQXVA==
X-Received: by 2002:a1c:4e14:: with SMTP id g20mr3182393wmh.64.1631376096600;
        Sat, 11 Sep 2021 09:01:36 -0700 (PDT)
Received: from sqli.sqli.com ([195.53.121.100])
        by smtp.googlemail.com with ESMTPSA id i9sm1947313wmi.44.2021.09.11.09.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Sep 2021 09:01:36 -0700 (PDT)
From:   Alejandro Colomar <alx.manpages@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     Alejandro Colomar <alx.manpages@gmail.com>,
        linux-man@vger.kernel.org
Subject: [PATCH 10/45] vhangup.2: Add LIBRARY section
Date:   Sat, 11 Sep 2021 18:00:43 +0200
Message-Id: <20210911160117.552617-11-alx.manpages@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210911160117.552617-1-alx.manpages@gmail.com>
References: <20210911160117.552617-1-alx.manpages@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>
---
 man2/vhangup.2 | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/man2/vhangup.2 b/man2/vhangup.2
index 688c5d480..affba8110 100644
--- a/man2/vhangup.2
+++ b/man2/vhangup.2
@@ -28,6 +28,9 @@
 .TH VHANGUP 2 2021-03-22 "Linux" "Linux Programmer's Manual"
 .SH NAME
 vhangup \- virtually hangup the current terminal
+.SH LIBRARY
+Standard C library
+.RI ( libc ", " -lc )
 .SH SYNOPSIS
 .nf
 .B #include <unistd.h>
-- 
2.33.0

