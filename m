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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84FCFC433FE
	for <linux-man@archiver.kernel.org>; Fri, 10 Sep 2021 22:47:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 693F26120D
	for <linux-man@archiver.kernel.org>; Fri, 10 Sep 2021 22:47:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233058AbhIJWsk (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Fri, 10 Sep 2021 18:48:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232523AbhIJWsj (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Fri, 10 Sep 2021 18:48:39 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB9ACC061574
        for <linux-man@vger.kernel.org>; Fri, 10 Sep 2021 15:47:27 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id b6so4684203wrh.10
        for <linux-man@vger.kernel.org>; Fri, 10 Sep 2021 15:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=isWc6B6dpoe1rM9XK67sfU4KBJwbadXnzZ6kadO7i1o=;
        b=oqVhGtf9hnz0OIqW7pOnD5cqaJ9t9eEo8hg2AZIvrBFPB1bqRpPeT2EsFA6ckbTH9G
         0Mn0Jybc9pnASrMoK6CWy6QlbJex6UtaPxn5t/YyKPqMlA/8aDrcjjecdjqsG6duFoqm
         gIc/rzzCUri4NyYT7cYixfpxN0KbHVhBaQdojTfIEV2W3kky5/WFyVYOM1R8KLm1imgy
         RXDW6xRIFRMAupHRjslLEWHu/YGcayr2MJ5VB6cK0GmcQMU0d4DwWmK8eQitZ9NuCyqU
         rMygy9PQBGdbO77w1NZH8W3eOZyoI5M+LldDqHEUE7b2lT3dJsNGWbAVpBJFSzwgZ+E7
         UKjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=isWc6B6dpoe1rM9XK67sfU4KBJwbadXnzZ6kadO7i1o=;
        b=Y9eYU2x20/7YUT+nDVzV49x/8WrFosYHYyYig+/1JiA9doNQ1WBxUvxYCxQYa8tn5X
         CvPaFFG+yuZJFMW4undoQtGu5aRtQUlmCe329MsrgBU2yLJ4/aE8uP+ZYKE5x5PiMpNJ
         eLn4y5zU0gkOI83QXFMznCiERVQorDZwDpWmsxm50r8R3koZlW+/WlOb1WIjwniwE9w1
         2YLwipePlupDKuuFgqMTYiLIUGqmalYeflHzK0lEWGNaWoBD/EBNmMw9m2Wv0b+48V7G
         vV8VOuY875InF4kQVLmEKSPzNOk7Pfs1Rui+aQAmprmznCrcNpd7qS+gGELYMyl87tfV
         e0aw==
X-Gm-Message-State: AOAM533mNa9va6+S8cUbWzRokKHrzNwLHSJEx5DSGFXSyp3GYNOk6+SQ
        RfoWXksr7P1jHusKEW2CC+APAwpq5AM=
X-Google-Smtp-Source: ABdhPJwMVPvTWnJvGfOJWl3Gjfzfy1FXLsA64CZeDv3Z4rQUg4v6yOHBh5ye0SdbeqfeB0gp6vmJQg==
X-Received: by 2002:a5d:58e2:: with SMTP id f2mr97278wrd.272.1631314046452;
        Fri, 10 Sep 2021 15:47:26 -0700 (PDT)
Received: from sqli.alejandro-colomar.es ([170.253.36.171])
        by smtp.googlemail.com with ESMTPSA id k18sm15520wmi.25.2021.09.10.15.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 15:47:26 -0700 (PDT)
From:   Alejandro Colomar <alx.manpages@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     Alejandro Colomar <alx.manpages@gmail.com>,
        linux-man@vger.kernel.org
Subject: [PATCH 08/15] process_madvise.2: ffix
Date:   Sat, 11 Sep 2021 00:47:09 +0200
Message-Id: <20210910224717.499502-9-alx.manpages@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210910224717.499502-1-alx.manpages@gmail.com>
References: <20210910224717.499502-1-alx.manpages@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

And srcfix too

Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>
---
 man2/process_madvise.2 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man2/process_madvise.2 b/man2/process_madvise.2
index 6a5c6ebb9..47a56b235 100644
--- a/man2/process_madvise.2
+++ b/man2/process_madvise.2
@@ -49,7 +49,7 @@ necessitating the use of
 .\" FIXME: See <https://sourceware.org/bugzilla/show_bug.cgi?id=27380>
 .SH DESCRIPTION
 The
-.BR process_madvise()
+.BR process_madvise ()
 system call is used to give advice or directions to the kernel about the
 address ranges of another process or of the calling process.
 It provides the advice for the address ranges described by
@@ -95,7 +95,7 @@ specifies the number of elements in the
 .I iovec
 structure.
 This value must be less than or equal to
-.BR IOV_MAX
+.B IOV_MAX
 (defined in
 .I <limits.h>
 or accessible via the call
-- 
2.33.0

