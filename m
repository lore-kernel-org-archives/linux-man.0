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
	by smtp.lore.kernel.org (Postfix) with ESMTP id F30A3C47082
	for <linux-man@archiver.kernel.org>; Sun, 23 May 2021 11:22:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DA0CD61057
	for <linux-man@archiver.kernel.org>; Sun, 23 May 2021 11:22:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231728AbhEWLYE (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sun, 23 May 2021 07:24:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231720AbhEWLYE (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sun, 23 May 2021 07:24:04 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06542C061574
        for <linux-man@vger.kernel.org>; Sun, 23 May 2021 04:22:38 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id p7so21791573wru.10
        for <linux-man@vger.kernel.org>; Sun, 23 May 2021 04:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=96iE4OOI49D+EVz777RdyvGuAzHPoma4F3HuMlksDew=;
        b=EbGP8Lf6ip1SPxV+I7fxys6NDvy5Kgv2IeXw/4TsbZCVJVOxTrmPBEwHsH1G++YmRg
         IfFSxdLoYvfw3kkPdnrok9LOo5UT2SbY5ziDcnzCEJAdNGSn+Qeyr5hfu+pmHrKToBDW
         BguVKNf9+/Lmf3eKyk6NixaYEsLR1NuPkurQa/0xBG8iPsikYT8jR/I6HuzGgK5+8tEq
         loAVeG1pyWVtwliTPfgQt6cInbkfq30H/NYWAgEvSiSbA6BE+jI3tsGNDacldvRz3p41
         ItS7JiwaWO283U7PNoOhgZ3RN190G7T8O/UZ3LAxNeQsVyFcIC7V+/JeGRq8KIssR0K+
         MnhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=96iE4OOI49D+EVz777RdyvGuAzHPoma4F3HuMlksDew=;
        b=mdUXQ/PxomO9w4y7zbsUtb60WcnzV5ji8kf1Vmvn8Rc5Egw1qvOBaOz4RgpsUcdIuJ
         L6hcw0hpZiHT2xhM9fo70YBpyJDFL9exOZWWzIEoD7zlzv675eaBAakIpu3HqQTi3P2w
         7sCnedS6Zrk4ZhmmHaTHKJgNz9H0Lz28xwGFhxlKn+8pjRytU2BmypMzzOjV+zL+IIZq
         QDhaFh6gunQtyKorQ5+Lb/2RUWLAgYF4NQR+5pcDkDGslUzS1d51H2SwFlH7HVPfp6oj
         IQYCAWBh8tolUbIG9KHrLzu653rSCcF2zWn9pIRemh/pf+8Jd8jwQtJOP6dQ2kosqQ3A
         +UgQ==
X-Gm-Message-State: AOAM530tCuhHsPPSmdCifu83jFvWbKlm3I7I5PyO7PtubFEFexQ3kDKz
        PgpXmnX8mpFMDVUJ1nbnhls=
X-Google-Smtp-Source: ABdhPJyYOxZ+j/2s5dvp0qjxOqlTF5c0OkgGtWxaUFPS/PjxfQsu3ckhqAt2qTq3FjNJXd/1PGJR5Q==
X-Received: by 2002:a5d:6c6f:: with SMTP id r15mr17165318wrz.79.1621768956733;
        Sun, 23 May 2021 04:22:36 -0700 (PDT)
Received: from sqli.sqli.com ([195.53.121.100])
        by smtp.googlemail.com with ESMTPSA id x10sm8273921wrt.65.2021.05.23.04.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 May 2021 04:22:36 -0700 (PDT)
From:   Alejandro Colomar <alx.manpages@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     Alejandro Colomar <alx.manpages@gmail.com>,
        linux-man@vger.kernel.org
Subject: [PATCH 8/8] mode_t.3: New link to system_data_types(7)
Date:   Sun, 23 May 2021 13:22:13 +0200
Message-Id: <20210523112213.170202-8-alx.manpages@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210523112213.170202-1-alx.manpages@gmail.com>
References: <20210523112213.170202-1-alx.manpages@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>
---
 man3/mode_t.3 | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 man3/mode_t.3

diff --git a/man3/mode_t.3 b/man3/mode_t.3
new file mode 100644
index 000000000..db50c0f09
--- /dev/null
+++ b/man3/mode_t.3
@@ -0,0 +1 @@
+.so man7/system_data_types.7
-- 
2.31.1

