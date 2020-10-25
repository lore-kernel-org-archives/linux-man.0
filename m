Return-Path: <SRS0=EgWi=EA=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41FFCC55178
	for <linux-man@archiver.kernel.org>; Sun, 25 Oct 2020 20:47:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0852E20757
	for <linux-man@archiver.kernel.org>; Sun, 25 Oct 2020 20:47:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DPbNbctO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1418734AbgJYUrY (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sun, 25 Oct 2020 16:47:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1418732AbgJYUrY (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sun, 25 Oct 2020 16:47:24 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2907C061755
        for <linux-man@vger.kernel.org>; Sun, 25 Oct 2020 13:47:23 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id y12so10196360wrp.6
        for <linux-man@vger.kernel.org>; Sun, 25 Oct 2020 13:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=suY3VFmiG5RlAWtElZfLgcss632YJEEsOaOV/IQdtYM=;
        b=DPbNbctOvpoTOk780pgUP+u/CHj8qts2lPuiRzrIxLYe3oMZqxW+9LKjMOXcuTZkpY
         sAvRMk5suF5bUFP7MyF0PeCEOemaJu2QvRccdZeKHI3SBgogrif4UmRsTZuxss2jWYgu
         qWxpYzX08YZ4u2ZgvfE7RhVhZAA/iT1Y9+Sn4zJVX0ZbXeriV8DleipFYN596IFzbkO6
         IIZC+VNPrbrhIxnEReRC8EPWcAp1u3+4H+M2E1mJilIlbtB+/Aojqi1b9W5IY562qcT2
         BhCtwpdJdqZ9v0l6BQ4M9HoeD2KCrGmnlF2E/OQqO2ntR1WIQMHT4qhzbGl8EckXh62S
         RlEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=suY3VFmiG5RlAWtElZfLgcss632YJEEsOaOV/IQdtYM=;
        b=LzuXmLLHvXMdZbQGTrCD+mMIMW+QXJAVOGu6HkWdsqtTRIOcS37AS4q1y0miutikr3
         fp5zeWzdMnA3ZNORTM7K4czPiarMdm/EK76HYt2uq9DjMcvCNELuGUJRUe2QUYwJxeFU
         v6RXnefsq85eU4fhTu1CdpAG21tGG+8ykE3dDsZnBKX8EfWuo+EGehUedKRgo9VfEpM2
         ClHoaInq2Ew/vI+sKWAlWVGZeZ7vz4+1O0kAHv73b9erSoTVrHkTRiM2vcPM3HTryT5U
         0ZP9z1NUfrqXsIgRAWYWcN+TRW0jj7xMfyM7M43z2P1d5ccLvBLEfE8UIuji+QoGk5er
         UMqA==
X-Gm-Message-State: AOAM5309VjbAQSc5M6YA+n9fvwqXu1UofCYceZPHZdFgXbuHaaGEQYoI
        vBKihtrS+aF+LkX1ymC9n0ei7DVCzFM=
X-Google-Smtp-Source: ABdhPJw8MzwuALaylp3LOu0p1P0xlhHe+86n2eq0ctMOHXitV+uxximM+lfvzV5Vs8XasTTEdJ+wRg==
X-Received: by 2002:a5d:4103:: with SMTP id l3mr14321260wrp.260.1603658842709;
        Sun, 25 Oct 2020 13:47:22 -0700 (PDT)
Received: from localhost.localdomain ([170.253.60.68])
        by smtp.googlemail.com with ESMTPSA id p11sm18700339wrm.44.2020.10.25.13.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2020 13:47:22 -0700 (PDT)
From:   Alejandro Colomar <colomar.6.4.3@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     Alejandro Colomar <colomar.6.4.3@gmail.com>,
        linux-man@vger.kernel.org
Subject: [PATCH 1/3] queue.3, queue.7: Move queue.3 to queue.7
Date:   Sun, 25 Oct 2020 21:46:16 +0100
Message-Id: <20201025204617.6802-2-colomar.6.4.3@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201025204617.6802-1-colomar.6.4.3@gmail.com>
References: <20201025204617.6802-1-colomar.6.4.3@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

After forking slist.3, list.3, tailq.3, stailq.3 & circleq.3
in the previous commits,
this page no longer belongs in Section 3 of the manual pages.

According to its contents, the most suitable section is Section 7.

Because of legacy reasons, a link queue.3 -> queue(7)
would be appropriate.

Signed-off-by: Alejandro Colomar <colomar.6.4.3@gmail.com>
---
 man3/queue.3 => man7/queue.7 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename man3/queue.3 => man7/queue.7 (98%)

diff --git a/man3/queue.3 b/man7/queue.7
similarity index 98%
rename from man3/queue.3
rename to man7/queue.7
index cbe72e29d..1fe48bd57 100644
--- a/man3/queue.3
+++ b/man7/queue.7
@@ -29,7 +29,7 @@
 .\" %%%LICENSE_END
 .\"
 .\"
-.TH QUEUE 3 2015-02-7 "GNU" "Linux Programmer's Manual"
+.TH QUEUE 7 2015-02-7 "GNU" "Linux Programmer's Manual"
 .SH NAME
 queue \- implementations of linked lists and queues
 .SH DESCRIPTION
-- 
2.28.0

