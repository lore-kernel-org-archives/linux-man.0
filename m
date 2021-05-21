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
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC40BC04FF3
	for <linux-man@archiver.kernel.org>; Fri, 21 May 2021 21:17:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B7787613EC
	for <linux-man@archiver.kernel.org>; Fri, 21 May 2021 21:17:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229583AbhEUVSd (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Fri, 21 May 2021 17:18:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbhEUVSd (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Fri, 21 May 2021 17:18:33 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6192C0613CE
        for <linux-man@vger.kernel.org>; Fri, 21 May 2021 14:17:09 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id x7so2684417wrt.12
        for <linux-man@vger.kernel.org>; Fri, 21 May 2021 14:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kqdOic8RoRKMHnQkK9Z08RK8B15VUZpim/HB7TlU8Qo=;
        b=HoRnAgcavDXz3W9ZYa8IjyD69M+ICLcsqdA4arhH+kExf2uXd9kai4lEmGHem5N82o
         9u6b6+KSZaFc60bz5jC0MBFuAdUGE8r7Szu+g7RFY5qNvsNxFm+MPsc/7XiQkq2Odn2Z
         sQ/qBuGtiKykkiSP3aJYxVgfY8yIlnznYIf3L8suwiKdLPlb5Lry+rz86YHEwV2UXyGV
         mng+A6eGizcXP2bVhzWGXpv7p0DEaZpLEywLRQED9p0jrEoS4XeKjJsZez5hNu4c3RVn
         JJnh9L0mf9kEYrN1XrVzHR4qJLzbglGLgRcjuaXouFeITXrSC7FQZOeSckmKbWN9q7xn
         vc+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kqdOic8RoRKMHnQkK9Z08RK8B15VUZpim/HB7TlU8Qo=;
        b=J3NJIh6LfJFvGv1g3WohDcFLl1SOgEaDL9dEkgIz1pKkc2J7PJoy1sJdL5oloLz+qK
         f+hosoRKawPRxWN99eMsn3IayM3rif7JJuhAnfoxFgTwKLWTGuoTndcvGe9vqm+6k7Ku
         OK5OmRbiZ2HSXk06JHWeJZbSj3gkZEw9Zp3+lqnzVEmg7IIriLuGlUYd/qJgWzz184b/
         vCwlNOdhvNOzWEEgxlGuPIL4C/vkV9OgCmbLCoCvIWA18NlWtTeG+dOyjoysCTnhnmVu
         TEgAqC1cwFNEI2a2sY1O+89q8HFuZAyBnS/X/VIL9hbbOeDbOgHZmbd13R00ntbAryxg
         w1xQ==
X-Gm-Message-State: AOAM531TSquuzPbeQhduAF+1gqjXHMibvLVWY/kOMPPk+UE2zqve4yYB
        DYf4fQ60QZ2jdRaqbFulAvY=
X-Google-Smtp-Source: ABdhPJy/7iaq1ex6Fw4NSP4b3Khl6+ZXSzPikQFLED9n1YuS7W2ewpfCGp/lrxHd0/eh1J00EkJlnQ==
X-Received: by 2002:a5d:568c:: with SMTP id f12mr11882396wrv.382.1621631828452;
        Fri, 21 May 2021 14:17:08 -0700 (PDT)
Received: from localhost.localdomain ([170.253.36.171])
        by smtp.googlemail.com with ESMTPSA id v10sm3944489wrq.0.2021.05.21.14.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 14:17:08 -0700 (PDT)
From:   Alejandro Colomar <alx.manpages@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     Alejandro Colomar <alx.manpages@gmail.com>,
        linux-man@vger.kernel.org
Subject: [PATCH 2/4] keyctl.2: Add LIBRARY section
Date:   Fri, 21 May 2021 23:16:52 +0200
Message-Id: <20210521211652.49949-3-alx.manpages@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210521211652.49949-1-alx.manpages@gmail.com>
References: <20210521211652.49949-1-alx.manpages@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>
---
 man2/keyctl.2 | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/man2/keyctl.2 b/man2/keyctl.2
index 7f5fcb951..4b4eeee04 100644
--- a/man2/keyctl.2
+++ b/man2/keyctl.2
@@ -28,6 +28,13 @@
 .TH KEYCTL 2 2021-03-22 Linux "Linux Key Management Calls"
 .SH NAME
 keyctl \- manipulate the kernel's key management facility
+.SH LIBRARY
+Linux kernel, glibc - standard C library
+.RI ( libc ", " -lc )
+.PP
+Alternatively, libkeyutils
+.RI ( libkeyutils ", " -lkeyutils );
+see NOTES.
 .SH SYNOPSIS
 .nf
 .BR "#include <linux/keyctl.h>" "     /* Definition of " KEY* " constants */"
@@ -1955,8 +1962,6 @@ This system call is a nonstandard Linux extension.
 A wrapper is provided in the
 .IR libkeyutils
 library.
-When employing the wrapper in that library, link with
-.IR \-lkeyutils .
 However, rather than using this system call directly,
 you probably want to use the various library functions
 mentioned in the descriptions of individual operations above.
-- 
2.31.1

