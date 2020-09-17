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
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE6E4C43461
	for <linux-man@archiver.kernel.org>; Thu, 17 Sep 2020 10:48:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9258F2074B
	for <linux-man@archiver.kernel.org>; Thu, 17 Sep 2020 10:48:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V/bjLc5q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726241AbgIQKsQ (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Thu, 17 Sep 2020 06:48:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726701AbgIQKof (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Thu, 17 Sep 2020 06:44:35 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83898C06178A
        for <linux-man@vger.kernel.org>; Thu, 17 Sep 2020 03:44:20 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id o5so1499305wrn.13
        for <linux-man@vger.kernel.org>; Thu, 17 Sep 2020 03:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cS6CZNq72V+mdL5McyYiXnZSorDqtGwRRph/rr7wLD4=;
        b=V/bjLc5qsTgXVwe6fsjRNlfbvAyUpqxMfUymAxt8glMZBIX7Q88rHbVOrkSYlxsAIQ
         Msj9wKk2NpfRgf3q3xfFQv5Bxxp8lWq2+HvDUvOUl5o+mQ2LJC2HcZ1o3cUUvpysgJY+
         +AzRrz36JwPDW3FFyr8IzNAQm1vHkzzFFLU9LxMXYXpAnIC42sa74m89CYJyyTaTJdAm
         47pvJKtR6DOePs3X21w74yyaH2elQ1fHjdePxIh8YK79LkYmR3XlfBpmUk9TVk8kz1e9
         rLdFTJdChKhhp3u7o6LM58Liu/WJUpqZuTKsoJtPHwj5JfTivv9GvuLa97vD/9ao5EyZ
         gpjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cS6CZNq72V+mdL5McyYiXnZSorDqtGwRRph/rr7wLD4=;
        b=VuLz6E+rYUJVTGz2orrdBllzyvLFOiXQb/iaaYjR0RY20XwK+3CNmxLHl7a+fciCf4
         gjaH3CDfkL2sbnDFeulcB8H848Lh5/VA0ks/DDlibRraxf1+Td+E4YLb/I2qkgyr/kYt
         cGvpILGDOoFdJFi27l8bueLNrRtEWUfsriAInwmPuRhwIMvru/QFhwmxulRUAUq33Vv2
         zV1M0HJnguMCiuSkAtxZqyU4RUZGMJhy5nTG+GNafi+6L+CYaJhzbTVl/RTYqwzj0Q8C
         afSXkp2i2jAUrBNyvNcxi7pcSP7JoUg1UqHqAjwdvlKUiGj6B7dd4AB5zSMFVz2t0QHu
         U07A==
X-Gm-Message-State: AOAM532k/9LW525Yss2y/bzp/Zm/IGjWPU9RprQTs50If50TUi/Mm86l
        IuekH8cygyDo07Dt4Y9YzRsGl6DR0MQg9A==
X-Google-Smtp-Source: ABdhPJyZxdWTCwn8kWvj6fI/gC2vxVuYUz/hXrt3JUZuQ86FmMSlSGucVP9WIkzL/i61YEyQSMES+A==
X-Received: by 2002:a5d:4cc1:: with SMTP id c1mr31399107wrt.122.1600339459219;
        Thu, 17 Sep 2020 03:44:19 -0700 (PDT)
Received: from localhost.localdomain ([170.253.60.68])
        by smtp.googlemail.com with ESMTPSA id l16sm42807186wrb.70.2020.09.17.03.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 03:44:18 -0700 (PDT)
From:   Alejandro Colomar <colomar.6.4.3@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     linux-man@vger.kernel.org, tg@mirbsd.org, fweimer@redhat.com,
        jwilk@jwilk.net, libbsd@lists.freedesktop.org,
        Andries.Brouwer@cwi.nl, Alejandro Colomar <colomar.6.4.3@gmail.com>
Subject: [PATCH v7 3/8] ssize_t.3: Add link page
Date:   Thu, 17 Sep 2020 12:43:01 +0200
Message-Id: <20200917104305.12270-4-colomar.6.4.3@gmail.com>
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
 man3/ssize_t.3 | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 man3/ssize_t.3

diff --git a/man3/ssize_t.3 b/man3/ssize_t.3
new file mode 100644
index 000000000..db50c0f09
--- /dev/null
+++ b/man3/ssize_t.3
@@ -0,0 +1 @@
+.so man7/system_data_types.7
-- 
2.28.0

