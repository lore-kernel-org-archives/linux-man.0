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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E983C47084
	for <linux-man@archiver.kernel.org>; Mon, 24 May 2021 09:13:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1F6C7610A5
	for <linux-man@archiver.kernel.org>; Mon, 24 May 2021 09:13:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232514AbhEXJO4 (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 24 May 2021 05:14:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232539AbhEXJOx (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Mon, 24 May 2021 05:14:53 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66175C06138B
        for <linux-man@vger.kernel.org>; Mon, 24 May 2021 02:13:23 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id j14so25990988wrq.5
        for <linux-man@vger.kernel.org>; Mon, 24 May 2021 02:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZRh7ZoEat+SU8N4jfFfRsviIJfwN/8ZJALXoyiIUAgM=;
        b=m/VxgVNKTCRAFYEznaLUzdifBvWTuxLGWMeJrmYDQwRLrQk1YCHKUrkQ75Ymz3kUcQ
         mQQl53xFl+pI8cW5p5rdagUqTOcMI30JMc4Uq/PG5YS5K8kOVtZSKs9mFlc2zqB4aTJU
         37ESJy08ihPTNH7ui/M6x81Xpy51YV2/fiKAzHKW5EvCcNEdTpQDx8vGwxDm/XRpBAcV
         8vv/m62LZ10befeEjzwQ/xof4ERQi8qWDqAidkdXm+DZbPJNAZ9RlvVMdTdAFPBx8XM6
         CauvWO5lYkelzqCKDHjQIAL93/40qf5ToANhaeG6ePd9zlyYB0RD5T6YJgVoE4nm93XU
         63Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZRh7ZoEat+SU8N4jfFfRsviIJfwN/8ZJALXoyiIUAgM=;
        b=qHT2A9rIILXzXiZSyL+wTuDgzSh01LK42HQq09d7sR2NOW4Urad0k248qk70rTW4Kl
         n6y5rZc9rJ/au+q/CqRlRa4v4jxK9tLL36a6YdL6hkzdYX5KhSo7HRBC7u9ON9DfsAib
         oS92TK2bT6teC9pgWpNZ90ly/gXc3xNysuP5eeR50lTWMnGD775AYuP3eyQe9Pkj0BVw
         RpEPqw+mdQulMgi+A/dSNy4xKNLsP28aujGVOoeoMw2yB1gVsG28cDfMXOoTcxEvlAPL
         t9tj4tmtLwDhzuxtYyPCFm+dHe+KF1sjVyKg+gUggep6Lcd3iH8ptHxl4ZPiHeKp0JpH
         KqhA==
X-Gm-Message-State: AOAM533r1KPt+VW7jUD9jDizRxF4tzs24HeUgHy0nO0J0fUtTzev0Tzm
        huczN9yZT06EHfN0VGIOYc0=
X-Google-Smtp-Source: ABdhPJwAz/ciKpErTwmu0qXfnE7YNdMZJUuUMELvFT8jX5gwDzbvVxkOI3dGU89gBgK8hcsTQ3s+GQ==
X-Received: by 2002:a05:6000:154e:: with SMTP id 14mr21051571wry.271.1621847602121;
        Mon, 24 May 2021 02:13:22 -0700 (PDT)
Received: from sqli.sqli.com ([195.53.121.100])
        by smtp.googlemail.com with ESMTPSA id d3sm11512059wrs.41.2021.05.24.02.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 02:13:21 -0700 (PDT)
From:   Alejandro Colomar <alx.manpages@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     Alejandro Colomar <alx.manpages@gmail.com>,
        "G . Branden Robinson" <g.branden.robinson@gmail.com>,
        linux-man@vger.kernel.org
Subject: [PATCH v2 2/3] stat-struct.3: New link to system_data_types(7)
Date:   Mon, 24 May 2021 11:13:08 +0200
Message-Id: <20210524091309.384317-2-alx.manpages@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <943e5523-4bc9-ca71-561c-1f172aec622e@gmail.com>
References: <943e5523-4bc9-ca71-561c-1f172aec622e@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>
Cc: G. Branden Robinson <g.branden.robinson@gmail.com>
---
 man3/stat-struct.3 | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 man3/stat-struct.3

diff --git a/man3/stat-struct.3 b/man3/stat-struct.3
new file mode 100644
index 000000000..db50c0f09
--- /dev/null
+++ b/man3/stat-struct.3
@@ -0,0 +1 @@
+.so man7/system_data_types.7
-- 
2.31.1

