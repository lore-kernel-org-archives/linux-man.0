Return-Path: <SRS0=SL3d=C3=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFD72C43463
	for <linux-man@archiver.kernel.org>; Fri, 18 Sep 2020 17:05:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7BCDF20DD4
	for <linux-man@archiver.kernel.org>; Fri, 18 Sep 2020 17:05:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tJ/QwvY7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726044AbgIRRFG (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Fri, 18 Sep 2020 13:05:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725955AbgIRRFG (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Fri, 18 Sep 2020 13:05:06 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A543EC0613CE
        for <linux-man@vger.kernel.org>; Fri, 18 Sep 2020 10:05:05 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id a17so6339423wrn.6
        for <linux-man@vger.kernel.org>; Fri, 18 Sep 2020 10:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Lam0AIFJ1s7ztQIVz6fWGXXy75KVP7HCMRgiuQj0lxM=;
        b=tJ/QwvY7Iwwqng40lSnMjho93PHn5zQQ9vDMaoqrKAsBr8rLDNp0RQgqsSTCB+Xkk6
         8L5kugV8eaxCWE+sv7Y0GaqBnMvMUcKXKFXZ6z3lSsj/Z5LuqumuyoJbQNQjiyxHpKyC
         Z59emBKXXxNlmOF3K1ZCFCU0GUT32EuJoay0IpvpfZzmeTP40pxo0G6HX0k8wuEchhQ6
         4dVQAkbQilTsaVy2mcMcWhul5W9MnkO/eYRoP8lshPbt8+IcWxXamxmT/PGR1SeiX+2c
         PGAVGkC+pQXabeCPbbumMW3kzzWTVVN9Nw57i/Qh2PH4PX5W2cr4LBP23bWGWxJyQMpM
         WL3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Lam0AIFJ1s7ztQIVz6fWGXXy75KVP7HCMRgiuQj0lxM=;
        b=V8+e+HQFDP3Z4iS5SQgHKLv2MgLHejdj7SKbfkdqO8NXDAIaHxnOjiq1BSMuyfK9Xd
         WYBW2ZpwfKOIwp8jp4vNoQSFcbGmh5QyEUcRVJ/2v+UtM87DZ/Sv6trGFaqjZwMX8iMe
         fp+HaLB/MuxwLHbcQSWuuOyOWtjMIUK/R2a9FN9IQvSKrT1SQGJdE0Coa23jO4eCSrnS
         kbPdPZtXVcQ87S1SdfsV8fSvqHKpSlVb7WaHclBh3wiv8UOCNg3iser0KrZAETaVnV3N
         pobGHx0nlXR5vsUbS/AQSMtu1HdBT99Fjytl1dvJU0+JzMTo03yImhKvBhaGMCx26yxi
         /+fQ==
X-Gm-Message-State: AOAM531PPqvZ6xZNrawqWktpaRB5MraGroBE/YGsVRuSywzne3/9Feiu
        bcWJB/NKLG6KBQxEyBM0hzA=
X-Google-Smtp-Source: ABdhPJzi7rfVM1lLSvVmd9YUERSBAp5v4x+RiHDlm33MWAQXTijv2jNV4/+5JaEjy/pe1MEQ2rec8A==
X-Received: by 2002:a5d:6343:: with SMTP id b3mr41257439wrw.179.1600448703872;
        Fri, 18 Sep 2020 10:05:03 -0700 (PDT)
Received: from localhost.localdomain ([170.253.60.68])
        by smtp.googlemail.com with ESMTPSA id q18sm6321208wre.78.2020.09.18.10.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2020 10:05:03 -0700 (PDT)
From:   Alejandro Colomar <colomar.6.4.3@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     linux-man@vger.kernel.org, libc-alpha@sourceware.org,
        Alejandro Colomar <colomar.6.4.3@gmail.com>
Subject: [PATCH 4/9] sigevent.3: New link to new documented type in system_data_types(7)
Date:   Fri, 18 Sep 2020 19:04:38 +0200
Message-Id: <20200918170442.94920-5-colomar.6.4.3@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200918170442.94920-1-colomar.6.4.3@gmail.com>
References: <20200918170442.94920-1-colomar.6.4.3@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Signed-off-by: Alejandro Colomar <colomar.6.4.3@gmail.com>
---
 man3/sigevent.3 | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 man3/sigevent.3

diff --git a/man3/sigevent.3 b/man3/sigevent.3
new file mode 100644
index 000000000..db50c0f09
--- /dev/null
+++ b/man3/sigevent.3
@@ -0,0 +1 @@
+.so man7/system_data_types.7
-- 
2.28.0

