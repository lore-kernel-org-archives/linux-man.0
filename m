Return-Path: <SRS0=7aiR=DC=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CFCEC4727F
	for <linux-man@archiver.kernel.org>; Fri, 25 Sep 2020 07:33:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CD59823718
	for <linux-man@archiver.kernel.org>; Fri, 25 Sep 2020 07:33:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kXsyvY8/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727428AbgIYHdB (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Fri, 25 Sep 2020 03:33:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727431AbgIYHdA (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Fri, 25 Sep 2020 03:33:00 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E66B4C0613D4
        for <linux-man@vger.kernel.org>; Fri, 25 Sep 2020 00:32:59 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id e11so1250820wme.0
        for <linux-man@vger.kernel.org>; Fri, 25 Sep 2020 00:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ub3H0wp/qznahPWZNcCvHQSjOa92NHyCM5KAapG2ta0=;
        b=kXsyvY8/sg8g9cRWadw3mIqyArf0d/tIfEBpcevg9+7vjD43SiyEkyRYNhApDwaUao
         JSO0V8tq77DkflQqRAJN3ydRmNpg1/vdDQFg0YKSDxIVra6zkha6ACjLUw+SqXyZxgMn
         cVxkl7VmPPoEjqHYtxYTeGfJ2OveXZncLaWHxTcYhPagmo+ZMP0FigJw2EyYGCDrsQmn
         r+ZeXTzxXmfDwXM058JrSOuYJqch3E0xN83NpnINCDsxstgXbbitL7A/aM1BcWm9SFx9
         JznnvewKXtGrGznZi6Vy4tb4aFjpahVluyy2xhOiBkIP4S5IMDSBOnB4402yceXyqEaY
         RVlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ub3H0wp/qznahPWZNcCvHQSjOa92NHyCM5KAapG2ta0=;
        b=t9X8BDlQbgKGdJMB96eBs/qXQx/W12qVK3JYxM4J9m0czN3zYSm086nifztrK0omx7
         W/NK2d5ScyKIIqiBjGxKOeG2qofBgRwhyVFkjePvvFJN/YAq3bRZjuuwBtA2Z1tOdUkm
         qiQvQ1Ms7Xtc40F5qWi73lXmm+LSCoEKP6SGCJOHHicTt0pJ0Eg/rOY/+8+7VBt81tEs
         i/8cui+3JRb1YzmdVrwjgQ1XJpnhH1MDAkSneISIVbU+p4/hiBKZ1DzwzKeDMdj/Nx3G
         LSbAte1mXagm941dKwLQI3lfaAjg+cHqBR4rn3BSJcJ9GBTXCf05I87HnaniuCX4raKA
         GxHQ==
X-Gm-Message-State: AOAM532r9EZgSJ4JPpLFFVVGWTnppiCotQ1v/2AoGMMIA5I5Dm3oftg+
        pqC4tSwH9dl18CLq6Xn9wiA=
X-Google-Smtp-Source: ABdhPJweWk/sZ7Iu2MRb7Ioud4e0n1jXwJQlNMOCmuIjYum/ydILtW6OwNfGrKMi4tuH6acqjgbIHA==
X-Received: by 2002:a7b:c92c:: with SMTP id h12mr1599994wml.121.1601019178640;
        Fri, 25 Sep 2020 00:32:58 -0700 (PDT)
Received: from localhost.localdomain ([170.253.60.68])
        by smtp.googlemail.com with ESMTPSA id n2sm1974314wma.29.2020.09.25.00.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2020 00:32:58 -0700 (PDT)
From:   Alejandro Colomar <colomar.6.4.3@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     linux-man@vger.kernel.org, libc-alpha@sourceware.org,
        Alejandro Colomar <colomar.6.4.3@gmail.com>
Subject: [PATCH 03/10] lconv.3: New link to system_data_types(7)
Date:   Fri, 25 Sep 2020 09:31:34 +0200
Message-Id: <20200925073140.173394-4-colomar.6.4.3@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200925073140.173394-1-colomar.6.4.3@gmail.com>
References: <20200925073140.173394-1-colomar.6.4.3@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Signed-off-by: Alejandro Colomar <colomar.6.4.3@gmail.com>
---
 man3/lconv.3 | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 man3/lconv.3

diff --git a/man3/lconv.3 b/man3/lconv.3
new file mode 100644
index 000000000..db50c0f09
--- /dev/null
+++ b/man3/lconv.3
@@ -0,0 +1 @@
+.so man7/system_data_types.7
-- 
2.28.0

