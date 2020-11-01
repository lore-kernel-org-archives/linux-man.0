Return-Path: <SRS0=bVpu=EH=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 950A2C2D0A3
	for <linux-man@archiver.kernel.org>; Sun,  1 Nov 2020 15:15:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 44AD02224E
	for <linux-man@archiver.kernel.org>; Sun,  1 Nov 2020 15:15:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p4GJiihD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726541AbgKAPPs (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sun, 1 Nov 2020 10:15:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726499AbgKAPPs (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sun, 1 Nov 2020 10:15:48 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D9D7C0617A6
        for <linux-man@vger.kernel.org>; Sun,  1 Nov 2020 07:15:48 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id y12so11676041wrp.6
        for <linux-man@vger.kernel.org>; Sun, 01 Nov 2020 07:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WvcJ7qH7Qnz1sajneMjjpriHoNAR0aFra0L6ofGuYXo=;
        b=p4GJiihDy7cvGrrLByyUWOQN7OrCogZG/rBVPEBt2eQXDJy/fM+yjD7QIP7Ja65SDB
         kRS7o3bu9Gr4m8A2cUxKv22HfeDd52hBHNt+vCJ/aotxI0rA5er/zNBDCBpylBV4x1uQ
         x4euH0fp3GYQNvw/isrGW+KpQarVfancKjFFQk/YzXRj55DfVn3NQMyBcWaoMWK/xdFG
         pdSVu7aykZ2R8JHgP2/j8lyZ17Nd2BEaluqTFH4/54mlCMEP1BK0c8NQBnNZCCdVUMPv
         /jh5lbS+BJbd3uaUtQ7r/MBJSO7tPjXtkjWyasxFoPWRHwiuIk4lAVP2axwJhBt3GXIX
         g96A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WvcJ7qH7Qnz1sajneMjjpriHoNAR0aFra0L6ofGuYXo=;
        b=VGu0I+JjYqoxEXyF7KNdOvkcLJLUg58FUE7DT6GPi8UIbImKRRT7AxPhbRZG7pLimN
         eUhiVzl8pCU8a+CkOz+wy8B9rBdFUVjFDSWB4+ZyNJv8WMICjuvCSRobHlxT/pk5JucY
         cEyaUGQsgjynL81dVrAAnvxfla8CMdQ4tZx+vmRp+/7hja5qQz9SUP7EnRZEZqicngRn
         pVpQCFn1fR1d8jKtgWm5yKQTEJaYFNq+mWhg4p0+yXTWIN9jaTzeT8VD7TMts2284AIF
         UC01XtNwxuPB1plPjKtGhCpbbFFsccYrI2vwx349SM2jz46oz5FfDGQ1w/LM3M1AHn6O
         7uEQ==
X-Gm-Message-State: AOAM531OZuENIzmVtnm5fRRf05PVOofpqeonwNaGmqkS6V71DIWmAgUE
        Zx08220a8QVQIZbN+DDcSC8=
X-Google-Smtp-Source: ABdhPJwIc8UaKI/wjjdVCGXBOSaqYycFG2DZWgM/iezh2RKyZTcY6zWv7ORUPT2rsuejDOjSAFkQ/A==
X-Received: by 2002:adf:ce91:: with SMTP id r17mr15555594wrn.326.1604243746721;
        Sun, 01 Nov 2020 07:15:46 -0800 (PST)
Received: from localhost.localdomain ([170.253.49.0])
        by smtp.googlemail.com with ESMTPSA id i33sm19505430wri.79.2020.11.01.07.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2020 07:15:45 -0800 (PST)
From:   Alejandro Colomar <colomar.6.4.3@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     Alejandro Colomar <colomar.6.4.3@gmail.com>,
        linux-man@vger.kernel.org
Subject: [PATCH] openat.2: SYNOPSIS: return long
Date:   Sun,  1 Nov 2020 16:15:38 +0100
Message-Id: <20201101151538.195120-1-colomar.6.4.3@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

The Linux kernel uses long as the return type for this syscall.
As glibc provides no wrapper, use the same type the kernel uses.

Signed-off-by: Alejandro Colomar <colomar.6.4.3@gmail.com>
---
 man2/openat2.2 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man2/openat2.2 b/man2/openat2.2
index 3ea50138b..80e75139e 100644
--- a/man2/openat2.2
+++ b/man2/openat2.2
@@ -31,8 +31,8 @@ openat2 \- open and possibly create a file (extended)
 .B #include <fcntl.h>
 .B #include <openat2.h>
 .PP
-.BI "int openat2(int " dirfd ", const char *" pathname ,
-.BI "            struct open_how *" how ", size_t " size ");"
+.BI "long openat2(int " dirfd ", const char *" pathname ,
+.BI "            struct open_how *" how ", size_t " size );
 .fi
 .PP
 .IR Note :
-- 
2.28.0

