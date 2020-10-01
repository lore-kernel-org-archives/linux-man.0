Return-Path: <SRS0=pEEh=DI=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EBC8C47420
	for <linux-man@archiver.kernel.org>; Thu,  1 Oct 2020 10:16:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C89B120838
	for <linux-man@archiver.kernel.org>; Thu,  1 Oct 2020 10:16:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jkd4EeLG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731921AbgJAKQr (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Thu, 1 Oct 2020 06:16:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731917AbgJAKQr (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Thu, 1 Oct 2020 06:16:47 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A1EBC0613D0
        for <linux-man@vger.kernel.org>; Thu,  1 Oct 2020 03:16:47 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id k18so2407027wmj.5
        for <linux-man@vger.kernel.org>; Thu, 01 Oct 2020 03:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k5Kk4ATWYgwm7wNjn7PMh+R+Jh/ADNh5ZDzLRpv9AzQ=;
        b=Jkd4EeLGK+qrESCNepFfH1HXBgy7tCo8aNbitPosPRIbyBBqtYUs5YpQaFgnUIospW
         b4pj6fn4s+Ijq15R9pgdi+oAVw4tbCF5GpcKUrPBMvwUJ1xH/Vd8LGMJZBiBWFgwCz1i
         1bPalDk9OGHwU0FvwiEKlhe0k2lIaAPGlF9YzddEW+KlaYTJLOONTObkRYcx0xHrG3RM
         2MNEK0TkRd40Ss1unSNrLLQ+KfecOFTFWB+uCsCmqtDCG7Ym7/247eHuS4WXdsSwoqj5
         nHowFYGoajsMMCojP349Bi8DFsnngU7keTvxJ7SSvIAwukpOSjzdYQ799Xa7RbGsPZHu
         /0tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k5Kk4ATWYgwm7wNjn7PMh+R+Jh/ADNh5ZDzLRpv9AzQ=;
        b=GUblMayPxWT26EBAALUKzLsMhJQRuzRb8bx4hZfC1cw3dObbW54mWqxOAjE5/1Ti2W
         XeFWigFIHc2bhmi7NgbtEYJrS16PYa8ATdhwMhUDwuV11LLcRusENDMYTaRrFCahv6uu
         xap+mqXln+JzBRZB/NNuwJBLNMVgU43V/CmRcVPy1o0sk4uKgI6ZuErSmTw39XV3ysw+
         57UMn59Q9YKnVZaOL2iC8aorCezHXIedn20vAi2syr0zLkifYUF14hW0ScDlQRTutRkO
         g9AXV4Yu19EeRSdmIbFO/+QZWIEFd0qDZkTv4HWloC+Dlue6gOPl83u90KcTg94SMXE8
         6/dA==
X-Gm-Message-State: AOAM533O8YwUfjkdOG6En4SzgjcAOLkd4Wx7SKUlnZvFKswWrzhL6Zha
        32F6aVp0mbw8XQPqYDBarU8=
X-Google-Smtp-Source: ABdhPJy+bYpyI+Q28tgnBI/5/PqTiJdOjtXZkD6ElMPV8cdBEeqy6Ut3/Updji7VXSnlp4PxaGQ6IQ==
X-Received: by 2002:a1c:6341:: with SMTP id x62mr7728595wmb.70.1601547405868;
        Thu, 01 Oct 2020 03:16:45 -0700 (PDT)
Received: from localhost.localdomain ([170.253.60.68])
        by smtp.googlemail.com with ESMTPSA id i15sm8671922wrb.91.2020.10.01.03.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 03:16:45 -0700 (PDT)
From:   Alejandro Colomar <colomar.6.4.3@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     colomar.6.4.3@gmail.com, linux-man@vger.kernel.org,
        libc-alpha@sourceware.org, gcc@gcc.gnu.org
Subject: [PATCH 16/16] uintptr_t.3: New link to system_data_types(7)
Date:   Thu,  1 Oct 2020 12:16:00 +0200
Message-Id: <20201001101559.77163-17-colomar.6.4.3@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201001101559.77163-1-colomar.6.4.3@gmail.com>
References: <20201001101559.77163-1-colomar.6.4.3@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Signed-off-by: Alejandro Colomar <colomar.6.4.3@gmail.com>
---
 man3/uintptr_t.3 | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 man3/uintptr_t.3

diff --git a/man3/uintptr_t.3 b/man3/uintptr_t.3
new file mode 100644
index 000000000..db50c0f09
--- /dev/null
+++ b/man3/uintptr_t.3
@@ -0,0 +1 @@
+.so man7/system_data_types.7
-- 
2.28.0

