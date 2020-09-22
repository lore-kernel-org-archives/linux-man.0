Return-Path: <SRS0=K4+z=C7=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DCDEC2D0E2
	for <linux-man@archiver.kernel.org>; Tue, 22 Sep 2020 15:44:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1910F2388B
	for <linux-man@archiver.kernel.org>; Tue, 22 Sep 2020 15:44:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l4QjSYL0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726682AbgIVPoX (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Tue, 22 Sep 2020 11:44:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726566AbgIVPoX (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Tue, 22 Sep 2020 11:44:23 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B3F0C061755
        for <linux-man@vger.kernel.org>; Tue, 22 Sep 2020 08:44:23 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id e17so3851947wme.0
        for <linux-man@vger.kernel.org>; Tue, 22 Sep 2020 08:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fVImbFenIXvvRSIyy9qms7t9U5BPRZMAL44UUGmYoWI=;
        b=l4QjSYL0qiDyEyY3gNVGZSoZl2ohurN6zY8KK2x6p6DZBszuHHFJmrmIxd524+PqhH
         5PA0KbeJRKDFdRulCCH2PZ2aIyg/rNttiZ6SUsvhpOTPH0BaZL0UtG42ZbYJpWl7d/Ad
         zqVZmcdJb0Za+DEPzlsz7AoMSQioYAxSmyS074EnDx6cnLzHNGOogjFJw4SIx3S+5RfI
         +RFugEViuk/8+Hi9e4xW3CBlhEh+k+UBdTP6Lf4nr6QWR1hfldT4wjFCI3wUB0U/hIyv
         w3iG2EWyX5YipLYu6SzvNJUXCzp1HdTML2NmoyC6UvXPhWcQbXe4xg7jxTojr2fcmmxE
         CRXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fVImbFenIXvvRSIyy9qms7t9U5BPRZMAL44UUGmYoWI=;
        b=mgm2lr7pdU4LUS3X5lO7QctwkXa/hBjDkq+tUNJKpRHfZ4IW40sIkZAsyO8Oh2v2t6
         9y3IOPgF6H7li7rPC2W9SPrlmJU3Jmv/bEeuBjQsvmSHuWvnpDinu3LtDev4X1dBxo7l
         G3XvktmXbkkAtLT1tdDg92jfhsm286ZuTM9UghEHB8wifZQZ1TRHCiZoceisoGRyBdUH
         bfdzzf5110traJJyVIDz5gQTsN9+ch1QHgWoFfNGPbH4VCKMWHvTLbXVH7Cxi1TPuMrZ
         XZjTdfrjMtR02wpTXb2zlb56dipQ7oY1afv0tWN5rlKQ89S1X5awO0qo+vy8bUvrS8u3
         coxw==
X-Gm-Message-State: AOAM530mtbbRgHFrJBXFq1UvqsKa93kungSL/sETLO4PhUYHmZmpSxuj
        JIS/kWe8J9rVguWggbEGUqo=
X-Google-Smtp-Source: ABdhPJy1wHfoi6rRdZtAHmT/ILUaaIgTN71OXVyioKvzmUfgShPuOn/0MTfr4EModHpVgVDagGdWPg==
X-Received: by 2002:a7b:c345:: with SMTP id l5mr1624145wmj.123.1600789460779;
        Tue, 22 Sep 2020 08:44:20 -0700 (PDT)
Received: from localhost.localdomain ([170.253.60.68])
        by smtp.googlemail.com with ESMTPSA id t1sm4802644wmi.16.2020.09.22.08.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 08:44:20 -0700 (PDT)
From:   Alejandro Colomar <colomar.6.4.3@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     linux-man@vger.kernel.org,
        Alejandro Colomar <colomar.6.4.3@gmail.com>
Subject: [PATCH 2/2] fexcept_t.3: New link to system_data_types(7)
Date:   Tue, 22 Sep 2020 17:38:23 +0200
Message-Id: <20200922153822.33728-2-colomar.6.4.3@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200922153822.33728-1-colomar.6.4.3@gmail.com>
References: <20200922153822.33728-1-colomar.6.4.3@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Signed-off-by: Alejandro Colomar <colomar.6.4.3@gmail.com>
---
 man3/fexcept_t.3 | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 man3/fexcept_t.3

diff --git a/man3/fexcept_t.3 b/man3/fexcept_t.3
new file mode 100644
index 000000000..db50c0f09
--- /dev/null
+++ b/man3/fexcept_t.3
@@ -0,0 +1 @@
+.so man7/system_data_types.7
-- 
2.28.0

