Return-Path: <SRS0=KjTN=C2=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08D9EC2BBD1
	for <linux-man@archiver.kernel.org>; Thu, 17 Sep 2020 10:46:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AEB722074B
	for <linux-man@archiver.kernel.org>; Thu, 17 Sep 2020 10:46:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XSvgVf25"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726723AbgIQKpO (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Thu, 17 Sep 2020 06:45:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726721AbgIQKop (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Thu, 17 Sep 2020 06:44:45 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5011C061352
        for <linux-man@vger.kernel.org>; Thu, 17 Sep 2020 03:44:26 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id s12so1508667wrw.11
        for <linux-man@vger.kernel.org>; Thu, 17 Sep 2020 03:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vkFISHJPTGAMdtdOTulrCGkUb3NMawhfDSg3lMl9acM=;
        b=XSvgVf25PGx3b2xDJV8GU5UKiYCVmqSYlk/Qs+KzhBCMzeP1bf3WJJKC59qmtFQLf/
         BLgJqQmDXBZuHselSFyDO4JnmnTkP2Nln44unTE9Qpoi+iX1Yf5/H8y+mrs+/FM7WHlq
         yqsA4C9EsvVXXz5X19EpX852P3KXZxEeE+Jcug4m3O8H6I4Fpim83cU9t6FTA1ZgR+ha
         gnaAMlVuQCBkOxtndtwYlT0GFblnW2KP0yLXAPryaNaZucgEQCwYBwKkhkl8I7Rx7du1
         WnKTPe5DdOT7H7VywRwq/JMcCK1f0Ax5RjNalQWDr341UKwKDjOZZX367Li6iUwc8lmZ
         sOTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vkFISHJPTGAMdtdOTulrCGkUb3NMawhfDSg3lMl9acM=;
        b=pItJ5pAJh32ZqFgyhH2mdpdQN93yCQMw8DPokE5phT7GSFEwyU2ajg9jLYZN4mfc9r
         cpD3/bRKNt54/MlI/dYUiibXccHCwN2TsxDq9EVeN3kXzUihT7a/zjjxVgxC0Ei0s8eY
         hpVHe2H7XYg4LdPnHoKjFyEeklyorXPtLOSft56p/3iNpX4uJY+shPXFt3M3OUO9eBWs
         lZDglKvVIXeEZOEccDIYS9+XuzIt0bs6YOGZN1MJeQMQztyAJtQ5KHniW9guZ/cWKXhf
         e7e1hqx83ee1DW68CJPPVMbXufh5o4eMFoxLYWQn1vsQ+kRkG80F7ZUte8lfYOvjboXx
         2a9Q==
X-Gm-Message-State: AOAM530BjkVV81NeVwOTGjY5spawmXRGIuveCpMtyGTNCrHtWcJwDJa9
        pHqmsx2pFhSWYy+MSjYItjE=
X-Google-Smtp-Source: ABdhPJwyA2hntJhPJv78vZaP/O/PEAnh+fVtdiYMV4V4nfSgq0hYyGmsSUA7e5JDcMwUhK5bRf1IFA==
X-Received: by 2002:adf:8342:: with SMTP id 60mr34403501wrd.158.1600339465519;
        Thu, 17 Sep 2020 03:44:25 -0700 (PDT)
Received: from localhost.localdomain ([170.253.60.68])
        by smtp.googlemail.com with ESMTPSA id l16sm42807186wrb.70.2020.09.17.03.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 03:44:25 -0700 (PDT)
From:   Alejandro Colomar <colomar.6.4.3@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     linux-man@vger.kernel.org, tg@mirbsd.org, fweimer@redhat.com,
        jwilk@jwilk.net, libbsd@lists.freedesktop.org,
        Andries.Brouwer@cwi.nl, Alejandro Colomar <colomar.6.4.3@gmail.com>
Subject: [PATCH v7 8/8] timeval.3: Add link page
Date:   Thu, 17 Sep 2020 12:43:06 +0200
Message-Id: <20200917104305.12270-9-colomar.6.4.3@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <6dc80c25-85bf-925c-49c2-f79865027c0f@gmail.com>
References: <6dc80c25-85bf-925c-49c2-f79865027c0f@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Signed-off-by: Alejandro Colomar <colomar.6.4.3@gmail.com>
---
 man3/timeval.3 | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 man3/timeval.3

diff --git a/man3/timeval.3 b/man3/timeval.3
new file mode 100644
index 000000000..db50c0f09
--- /dev/null
+++ b/man3/timeval.3
@@ -0,0 +1 @@
+.so man7/system_data_types.7
-- 
2.28.0

