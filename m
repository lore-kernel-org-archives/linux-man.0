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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C301C43460
	for <linux-man@archiver.kernel.org>; Sun,  4 Apr 2021 11:59:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 07D7161365
	for <linux-man@archiver.kernel.org>; Sun,  4 Apr 2021 11:59:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229801AbhDDL7k (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sun, 4 Apr 2021 07:59:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbhDDL7k (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sun, 4 Apr 2021 07:59:40 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B7A9C061756
        for <linux-man@vger.kernel.org>; Sun,  4 Apr 2021 04:59:35 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id a6so2590362wrw.8
        for <linux-man@vger.kernel.org>; Sun, 04 Apr 2021 04:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rTKYkInho8e1sIcxIAxFLuyehNxSK3JnEgfyns2WLcw=;
        b=E6f5hl6foSXEG2K13cUz6gsQngybl68FKROrkQ7fVoU7Vi/feP63GWLiEo2A9RJIuR
         COaAf0hEVzlUAueWM+4tmffRwibH4wBvEq68KtPb+TWIOI4hZc2OfhrimiBN18/WcyV1
         1QM5m/rqJoPLPsfAqLmyX4TuGrgiG93syKnhne7AFl9ri2nYVY+q/OfWJ+qzwFUqDJVc
         O1tKKaA0AQDTnZs3w1InQWHL0J3vv8qeRn+EHgNPMlDvQ3e65JJuhvwe8ji0N17VVvaW
         3bEeZc2G54FCawyRRZlDWctLX5PKolR7iAk9kSHi0bp0CybuGx/fTkRBzJPbN3LtzcSo
         KPZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rTKYkInho8e1sIcxIAxFLuyehNxSK3JnEgfyns2WLcw=;
        b=DWTe/pGnk38nWxFUq/Ywkws+2WCBizFrwggSDWMPwExdpF0bezT+9F5itej9CFhlDc
         TNPVMKnHx1DQ2kJ1mmCQC2MI26mswXCs6nerrBt9WnE8uSA0s30PIy7tBe7vOdtYPIV7
         UNNEC3z3SsNkGIqAKPFrYbmMf3bielgR2PFGE73mhFHldUIorKUh2rCL4/HMaW3p/ExS
         aNlhfQF0sfNSebDsy4P72pp+LdRv5xbw39ifx3riNAXCne0d7NCsvphKDP6+A4eaPOwS
         BlyRTcIrkPOgA1sRGFz0iVCIK+KbTdJrYaS+JnIm5iCyBsU2b9OjOA23GKGTceQAZtsU
         dMqw==
X-Gm-Message-State: AOAM531D1fWRbP/JD+iliXqDl+Eas3+0AeGZ3QyCK9BX6qVJzZ2+o578
        tjqnGYm/AnuKtGU1wM35a5A=
X-Google-Smtp-Source: ABdhPJy7cJJNuVzrdGoj/8sMH+oKyCnsvqANGPosPD6meh7ugeFRiqO/NfeOKSoc+c9VfWWa39Znuw==
X-Received: by 2002:a5d:4566:: with SMTP id a6mr11397497wrc.250.1617537574420;
        Sun, 04 Apr 2021 04:59:34 -0700 (PDT)
Received: from localhost.localdomain ([170.253.36.171])
        by smtp.googlemail.com with ESMTPSA id u2sm23786967wrp.12.2021.04.04.04.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 04:59:34 -0700 (PDT)
From:   Alejandro Colomar <alx.manpages@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     Alejandro Colomar <alx.manpages@gmail.com>,
        linux-man@vger.kernel.org, libc-alpha@sourceware.org
Subject: [PATCH v5 02/35] sockaddr.3: New link to system_data_types(7)
Date:   Sun,  4 Apr 2021 13:58:15 +0200
Message-Id: <20210404115847.78166-3-alx.manpages@gmail.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210403194026.102818-1-alx.manpages@gmail.com>
References: <20210403194026.102818-1-alx.manpages@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>
---
 man3/sockaddr.3 | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 man3/sockaddr.3

diff --git a/man3/sockaddr.3 b/man3/sockaddr.3
new file mode 100644
index 000000000..db50c0f09
--- /dev/null
+++ b/man3/sockaddr.3
@@ -0,0 +1 @@
+.so man7/system_data_types.7
-- 
2.31.0

