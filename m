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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9F62C43463
	for <linux-man@archiver.kernel.org>; Fri, 18 Sep 2020 17:05:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8C02220DD4
	for <linux-man@archiver.kernel.org>; Fri, 18 Sep 2020 17:05:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J735Ji7b"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726290AbgIRRFJ (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Fri, 18 Sep 2020 13:05:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726250AbgIRRFJ (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Fri, 18 Sep 2020 13:05:09 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE6FFC0613CE
        for <linux-man@vger.kernel.org>; Fri, 18 Sep 2020 10:05:08 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id j2so6356185wrx.7
        for <linux-man@vger.kernel.org>; Fri, 18 Sep 2020 10:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H+CkArZ5VWtQCTVtTOwWWAlnvz7yGJkBxEgazsWO8GA=;
        b=J735Ji7bDQpMoNgk2RFXQg+ZG4u88z8OTMsQbwjcMyJWl01y1t/vrgM0LBk6Nk9V1e
         Z+ye5r4gsOeUUHj2E4kP+8R43+Gba2Lu0GFQq9q87cHetosqIIrKI6+Iq1lyEiquqVfI
         e5isV/WgDwZ20GJYuSWl9lE0cDhEOsZrXSIevLmGBZSvLsVriwC9E5s7cqGyD0h88tyb
         nQtB0bOYrt47eaoF3CBgkuYOItzShVLWZcKzQRj1oB0XEHNeAv+hlCjeF+RusdP3FlTG
         X6bfKiNAc2hT9X/F5uke30RGdGA0mJxCI+KZP/eq2HUYrDN7vET9uQs88muWpY328qKe
         wOIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H+CkArZ5VWtQCTVtTOwWWAlnvz7yGJkBxEgazsWO8GA=;
        b=HX8rtmPVGfYzi+Eyo4VKkba5VTzEVyyGmnqXRtjgagqZ8GinMeZd+N0G4GMHMgLesQ
         IA8MmFIOmSG0AvmCuD9iSJxtde6RDR7vlF7949E026VmCvAiaG6YGlyL4mL2yGArUsQ3
         vBg78ji9ADkM+rJWum2V5FA6amIEXNA6UTu5cji6c6zT72gYt5ulaf6fabSx4yIYd8d4
         WdGQX3a64iFxq25g4xbSpKHpQUcK6ER4pltPw1go7/makoGjWphMtpiw2Fudlm0unkFU
         aXu+wTWdpXbFAQvTXPbBWRZIfovC2OSvuuMsAPxVA0sMN+nKPe3Uf5b4ix6i5Qhf6Sdo
         fFfg==
X-Gm-Message-State: AOAM53329rD2XB76j5w349Juu4O6oMzdY9I3mOQ+ayT59G5cVNCAs/9t
        K7kzdJOFIH35i0NuI0LFr/0=
X-Google-Smtp-Source: ABdhPJwmBzip9CD2+f2bdKGpZAzrc/ilk4DtpLjslGTKtt0b7QJJWYew717mn0GV1XUZ8dLah5JYnw==
X-Received: by 2002:a5d:4a0e:: with SMTP id m14mr41218996wrq.313.1600448707557;
        Fri, 18 Sep 2020 10:05:07 -0700 (PDT)
Received: from localhost.localdomain ([170.253.60.68])
        by smtp.googlemail.com with ESMTPSA id q18sm6321208wre.78.2020.09.18.10.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2020 10:05:07 -0700 (PDT)
From:   Alejandro Colomar <colomar.6.4.3@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     linux-man@vger.kernel.org, libc-alpha@sourceware.org,
        Alejandro Colomar <colomar.6.4.3@gmail.com>
Subject: [PATCH 7/9] aiocb.3: New link to new documented type in system_data_types(7)
Date:   Fri, 18 Sep 2020 19:04:41 +0200
Message-Id: <20200918170442.94920-8-colomar.6.4.3@gmail.com>
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
 man3/aiocb.3 | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 man3/aiocb.3

diff --git a/man3/aiocb.3 b/man3/aiocb.3
new file mode 100644
index 000000000..db50c0f09
--- /dev/null
+++ b/man3/aiocb.3
@@ -0,0 +1 @@
+.so man7/system_data_types.7
-- 
2.28.0

