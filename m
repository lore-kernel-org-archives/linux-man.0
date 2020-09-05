Return-Path: <SRS0=Bu2X=CO=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C6C0C43461
	for <linux-man@archiver.kernel.org>; Sat,  5 Sep 2020 10:51:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B64F920757
	for <linux-man@archiver.kernel.org>; Sat,  5 Sep 2020 10:51:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U6QC8rHo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728328AbgIEKvG (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sat, 5 Sep 2020 06:51:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726597AbgIEKvF (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sat, 5 Sep 2020 06:51:05 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5A1AC061244
        for <linux-man@vger.kernel.org>; Sat,  5 Sep 2020 03:51:02 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id z4so9892534wrr.4
        for <linux-man@vger.kernel.org>; Sat, 05 Sep 2020 03:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=afecpaiVj/oApcU0olwsB+l9rKBlKEmVQ43TaRM0h6k=;
        b=U6QC8rHokOdkT6cKYQbN0QRhsM6hxaC2Ue+Ac5W/9i9sb5l2SsZdlHXugMGrIKzAXm
         iKRxYjjHCfw/MMmD4EUvG/VQxajD5NJKT90FCINr3QJqyTHh4vzrCtfiLKV6bJPknlRi
         EAi/QL3TGv/JJ6iw2mKAETfg1n87I6F1v5Bvo05xRkUHYFFIRkvDY8fJ438WMVa4OGje
         M6JFEFqVWkattN+wZX+s+247uDf/9LIMaEQo7K42dyNRizT5hyzhQE5XXNs/uHvidrOW
         ahzkEKFwEPk7B2/CftDePO+H/5nADEolvlHIFiTH63VLXa2sfBTtfoNAMK/dDbKwj49c
         iiKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=afecpaiVj/oApcU0olwsB+l9rKBlKEmVQ43TaRM0h6k=;
        b=bvkym+LRiEx02uq+zIIP8XM7b1sWb2GdND4ff184xWxNYB5EVSItEGbSHjCXviEfYE
         9MuzwDORRzP9xEYpmdaBWzTUhHHPGKqF4N3IE1FSqbaqwY2WrUqzQySIhBkoTbU9a4Ex
         A/GuhjV7BfAtqwxQEHRHpWNTZDLMCb5iFuXuPWXfM6cHr9IUaBTjk4NmpkxD39MRRtLR
         pkUF9quojUGT/vRQ/Vh+ZX++A37I2WLOn8EDlNoeMWoQCeHSzDBCO2sREgXhhADary+C
         CaX66bMg4FDdA5KJUYg3b0BM1BrxQp6WYSqWazp0O2vx5jhJDlWLyKCEFgnoWrLpf8za
         5eHw==
X-Gm-Message-State: AOAM533wQ+sNz0yViOrt4levfnr3dJcltp7AbK3XogpHMBbcNOys7hwv
        H3O78sIBV4cqurX6t41FtvU=
X-Google-Smtp-Source: ABdhPJz+siIhqe5/bWLy0ToaE67fl6qPuXMP0Rtk9pYwwK6dYzHgD1L6pcfaJGbhj80mbVjU3cEUUQ==
X-Received: by 2002:a5d:5261:: with SMTP id l1mr11756880wrc.193.1599303058842;
        Sat, 05 Sep 2020 03:50:58 -0700 (PDT)
Received: from localhost.localdomain ([93.115.133.118])
        by smtp.googlemail.com with ESMTPSA id f23sm19412770wmc.3.2020.09.05.03.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 03:50:58 -0700 (PDT)
From:   Alejandro Colomar <colomar.6.4.3@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     linux-man@vger.kernel.org,
        Alejandro Colomar <colomar.6.4.3@gmail.com>
Subject: [PATCH] tsearch.3: Simplify type usage and remove unneeded casts
Date:   Sat,  5 Sep 2020 12:50:25 +0200
Message-Id: <20200905105024.163147-1-colomar.6.4.3@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

The type of `var` is `int **`, and it will work with tsearch()
anyway because of implicit cast from `void *`, so declaring it as an
`int **` simplifies the code.

Signed-off-by: Alejandro Colomar <colomar.6.4.3@gmail.com>
---
 man3/tsearch.3 | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/man3/tsearch.3 b/man3/tsearch.3
index 32ddb8127..65fcadc52 100644
--- a/man3/tsearch.3
+++ b/man3/tsearch.3
@@ -323,8 +323,7 @@ action(const void *nodep, VISIT which, int depth)
 int
 main(void)
 {
-    int i, *ptr;
-    void *val;
+    int i, *ptr, **val;
 
     srand(time(NULL));
     for (i = 0; i < 12; i++) {
@@ -333,7 +332,7 @@ main(void)
         val = tsearch((void *) ptr, &root, compare);
         if (val == NULL)
             exit(EXIT_FAILURE);
-        else if ((*(int **) val) != ptr)
+        else if (*val != ptr)
             free(ptr);
     }
     twalk(root, action);
-- 
2.28.0

