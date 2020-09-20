Return-Path: <SRS0=ulXM=C5=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2BA3C43463
	for <linux-man@archiver.kernel.org>; Sun, 20 Sep 2020 18:06:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5F0E4207EA
	for <linux-man@archiver.kernel.org>; Sun, 20 Sep 2020 18:06:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C7Kg7Akm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726109AbgITSGt (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sun, 20 Sep 2020 14:06:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726043AbgITSGs (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sun, 20 Sep 2020 14:06:48 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6C14C061755
        for <linux-man@vger.kernel.org>; Sun, 20 Sep 2020 11:06:48 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id t10so10460694wrv.1
        for <linux-man@vger.kernel.org>; Sun, 20 Sep 2020 11:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JsVDb2hMRgSLPnc4mk4Nlvsn5K67SWK3I/WWGjwUNgw=;
        b=C7Kg7Akm/Jy5yBZ84wGo8F6oUBDAizDZSl8G/FpxHem1vuH9dhIAyeck54cQ+FI32m
         iKVA4C8PJ+8Trfb5GgUTUZb8DwurILAdZih5OqLAjVg+ORDhqj0al9pRUmrgagZsdx/k
         Nat0UejwTJFFgr24FpuWIDeVEGXp1ZPhn79ldeIVoFNq76rlHz6r1OT42WcmN9K0wdmk
         LGSK86HKOGYUz54Y/Dz3ne/x8IcAdAzIZ86q6Cq1JtsEXkK54VyAtuTt28NXKy1AaSiq
         clEwaeVPrmsBk5x/Ajb6pD4C5fZtYX0nFkp0AXpdhxdZsJj3UgGMgTZ6lciZiIfgBfN/
         aQNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JsVDb2hMRgSLPnc4mk4Nlvsn5K67SWK3I/WWGjwUNgw=;
        b=J5H35GtZfN2Nki0v8NKq5f7iOncClQVgdAELODp+3W0/jfh7x8bcpuIPQvMCNNJkIT
         1vsUKKVfvWbDHUAWZqZu0Xyzye1VqpDXgd9xiGptU1I4BsmiU7rpvw6ns86eLhlNGwEN
         jBvj3n+69zzVd+O33AM2CQldNNqXsAotRb0yAXPCvC5a0HMBoEkxhgq9pbBqDJIobuiY
         tTdByC1O3ipMIPZxOwCWGa9qQIEne22YSpVbGZrMFgwxL4nTHdXmsfaj66T2srgXi+hO
         JkmqAnIIwjtPYGyJYwpWjzWbpmh39diNhIqRj6vuhofO/p2gaY270fPnH40W5J0N0gF+
         njjA==
X-Gm-Message-State: AOAM531gfXVq2ZMisNgPPPOgAs8vPdLUKIU3yqLQMy53UfzHyw9e0oe1
        /z6bZE6H6/jR/kdFtfVwQzQ=
X-Google-Smtp-Source: ABdhPJzeEdhaRS7Cjk1YhNZKH4YM0NfK2E4sO6brNL5Vmf1T/cgTokDiJus+G1WW3Uwn6m0lyXTvxA==
X-Received: by 2002:adf:f207:: with SMTP id p7mr51943500wro.152.1600625207218;
        Sun, 20 Sep 2020 11:06:47 -0700 (PDT)
Received: from localhost.localdomain ([93.115.133.118])
        by smtp.googlemail.com with ESMTPSA id d2sm16402029wro.34.2020.09.20.11.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2020 11:06:46 -0700 (PDT)
From:   Alejandro Colomar <colomar.6.4.3@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     linux-man@vger.kernel.org, libc-alpha@sourceware.org,
        Alejandro Colomar <colomar.6.4.3@gmail.com>
Subject: [PATCH v2 9/9] siginfo_t.3: New link to new documented type in system_data_types(7)
Date:   Sun, 20 Sep 2020 20:05:52 +0200
Message-Id: <20200920180551.63608-2-colomar.6.4.3@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <a5e4490c-b796-c13f-fb74-75ebc7dbe321@gmail.com>
References: <a5e4490c-b796-c13f-fb74-75ebc7dbe321@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Signed-off-by: Alejandro Colomar <colomar.6.4.3@gmail.com>
---
 man3/siginfo_t.3 | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 man3/siginfo_t.3

diff --git a/man3/siginfo_t.3 b/man3/siginfo_t.3
new file mode 100644
index 000000000..db50c0f09
--- /dev/null
+++ b/man3/siginfo_t.3
@@ -0,0 +1 @@
+.so man7/system_data_types.7
-- 
2.28.0

