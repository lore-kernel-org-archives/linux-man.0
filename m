Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33552C433ED
	for <linux-man@archiver.kernel.org>; Mon,  5 Apr 2021 13:13:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 13386611BE
	for <linux-man@archiver.kernel.org>; Mon,  5 Apr 2021 13:13:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237389AbhDENNW (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 5 Apr 2021 09:13:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237306AbhDENNW (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Mon, 5 Apr 2021 09:13:22 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A103C061756
        for <linux-man@vger.kernel.org>; Mon,  5 Apr 2021 06:13:16 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id v11so10876457wro.7
        for <linux-man@vger.kernel.org>; Mon, 05 Apr 2021 06:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CWOc2CsusP2KjzP5xX15AmpwDGKtWGSiK9E6KWQkxxg=;
        b=I7ohGmTUNZyAa7YzrKpkXqSwQW9siZ8Et1Z8780KdKIBt2rgCZ3TpfdHLBKsW9WGEQ
         5LSBhpi2TSbceSb7AWa7it9pNcdsFFPf5sbg5jtcg0JzaXTwpuHfymUPJp5rVQ8JP787
         +tcaYoruUo6pBMO9c8rnbN4j4LmZudXACQqqwu+zkTus5Ef4BSuN9d57bK6P8bFBbXy2
         gkv3xvIq3QwtE3sXUBxTgLImGnHYU3DsaycuwskPrAgBGT7rCU+BnND0fMZPm84gM3pt
         CuzPxma2VT7dkINdvmyn5I+AhC3GRQq22pbD+AUTdjvkmveK/CPxrjWXEh16hz5+QtQF
         FSWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CWOc2CsusP2KjzP5xX15AmpwDGKtWGSiK9E6KWQkxxg=;
        b=fIJGrBn4tCgBlKQZX9JIx6VcELj3DaAdaX5mlLKIJJGosq/aKTRERAvGYzj++3CxOZ
         68fbtbPrI53QBIFX078sINJoVvGepHR23IPgHqmouE/caCHvfpgigHU8zVgdr3Y9JQlW
         KC7RUCgxaS7EqnJ+Ds/eqXJwQ5gPR6cDIkX0dpRTL0cf5Xy7MkcE3Oq2UciEBI5aIUfz
         jRR5Fh4wQJjDVeleGsYb86rul2cEl/RdlhsfUoz8g5KzOTkrIMpys2k6zOH7PWn9piNW
         saBXNQ70x9hei18fb5REX3gv/gdbsFMrmc/k70WJjk1nHqCjCv6cT9QN4eu9AL2uxoBt
         jtgQ==
X-Gm-Message-State: AOAM532WMncLRCsCIpnYsMslWqfzPTvTAQCAKqYzrNqKZLOdSQ0AFnmc
        YMVkXepd2rx7VoduSTGN9U/wN/DzSnk=
X-Google-Smtp-Source: ABdhPJxCusoiRnEFCpodvAvTr7/tlGF5Y6QPR8Yh/z/JgkuM+bd19kf+Dhff3Na8SUMv+FIirYTFng==
X-Received: by 2002:a5d:604d:: with SMTP id j13mr3095626wrt.161.1617628394834;
        Mon, 05 Apr 2021 06:13:14 -0700 (PDT)
Received: from localhost.localdomain ([170.253.36.171])
        by smtp.googlemail.com with ESMTPSA id p12sm27657929wrx.28.2021.04.05.06.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 06:13:14 -0700 (PDT)
From:   Alejandro Colomar <alx.manpages@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     Alyssa Ross <hi@alyssa.is>, linux-man@vger.kernel.org,
        Alejandro Colomar <alx.manpages@gmail.com>
Subject: [PATCH 1/5] scanf.3: clarify that %n supports type modifiers
Date:   Mon,  5 Apr 2021 15:13:04 +0200
Message-Id: <20210405131307.2892-2-alx.manpages@gmail.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210405131307.2892-1-alx.manpages@gmail.com>
References: <20210405131307.2892-1-alx.manpages@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

From: Alyssa Ross <hi@alyssa.is>

My initial reading of this was that type modifiers were probably not
supported.  But they are, and this is actually documented further up,
in the type modifiers documentation.  But to make it clearer, let's
copy the language that printf(3) has in its %n section.

Signed-off-by: Alyssa Ross <hi@alyssa.is>
Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>
---
 man3/scanf.3 | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/man3/scanf.3 b/man3/scanf.3
index e6d00c9f1..bd49a6caf 100644
--- a/man3/scanf.3
+++ b/man3/scanf.3
@@ -526,7 +526,9 @@ the next pointer must be a pointer to a pointer to
 Nothing is expected; instead, the number of characters consumed thus far
 from the input is stored through the next pointer, which must be a pointer
 to
-.IR int .
+.IR int ,
+or variant whose size matches the (optionally)
+supplied integer length modifier.
 This is
 .I not
 a conversion and does
-- 
2.31.0

