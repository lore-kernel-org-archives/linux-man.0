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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00047C433B4
	for <linux-man@archiver.kernel.org>; Sat, 15 May 2021 18:24:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D60F06112D
	for <linux-man@archiver.kernel.org>; Sat, 15 May 2021 18:24:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234318AbhEOS0C (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sat, 15 May 2021 14:26:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234129AbhEOS0B (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sat, 15 May 2021 14:26:01 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BA1EC061573
        for <linux-man@vger.kernel.org>; Sat, 15 May 2021 11:24:48 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id d11so2255650wrw.8
        for <linux-man@vger.kernel.org>; Sat, 15 May 2021 11:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v4bRiH135eVABUrxOLDxtIGmrRaLw8IN1yhbcQUf88A=;
        b=feYvPksJwh+2WWOeWr5EPeebAuI+aJiStpMFzZn+xbkN583WWADI1S2QuWx47mOEyQ
         5GyhYbMlEH3y0JMjMDjqMFoc27uhjLwaBFPuum6OQh/wdiM3E4J4aQyroMLqTr1bXTK9
         GLGCzb3mFs4gNxcCWl9H7Yrepdn5KC4MrXZWC+PZJgr0V/SAQSd7WJWf4sznBpdXg6Ku
         AsZK4mSv56erw5akh+2PeXqHqIf29u3HVETK6RM6QMw+Z/eajfm/1QV+XXsywZuIf25z
         K36ES2XxNEEM1qtwv7KQsg6s7GgYoWTkBfC9ByuOup8l+Ji6t0325wyj4eJWM6WVR5dK
         ETog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v4bRiH135eVABUrxOLDxtIGmrRaLw8IN1yhbcQUf88A=;
        b=AEXB/sApq161U43h0A+052sefoXqffC9xw+Rqik2cm/7CMKdH/nU+BRYfIUHT/wW6d
         MMP+Ce7l6JN+Qs2nz1celKeamM6CFz392DW/06WNuPt8KAVWLsJEwu6qqqNEE3l5DQkP
         vOvDs2XqO98f806Ks87SckAPwXyQkZM7Ax1untVs0vcD/MQoARNjV70s7C/WnDNOCa2T
         2uZ+bqRExultPFbxyai63/vmm9CCsyVhCkXr0nIubEjxMyn4JNExGdI60R8u4GGoCnYi
         c7c97OLaHh+EwPhChd+R5VGjtHZV5U3C0y3WapLHIRLkFwg1gBQbUIYuSr1i8NIpq31B
         3dQg==
X-Gm-Message-State: AOAM533gvgpY1RaN0ifce8IQ7+H1TrAKWGONg1GfmiY9VA81fSFtwxau
        SVnDDSR4+7wbQ+sQY4Yv40E=
X-Google-Smtp-Source: ABdhPJxe595PCScOtDoT1WWFk8qRqHBkW3xJWbyJaHkwiGnT559VSTKBS2+ddu+FwfVwAdYRKZO7mQ==
X-Received: by 2002:a5d:64e5:: with SMTP id g5mr66456248wri.30.1621103086414;
        Sat, 15 May 2021 11:24:46 -0700 (PDT)
Received: from localhost.localdomain ([170.253.36.171])
        by smtp.googlemail.com with ESMTPSA id x11sm10116191wrl.13.2021.05.15.11.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 May 2021 11:24:46 -0700 (PDT)
From:   Alejandro Colomar <alx.manpages@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     Alejandro Colomar <alx.manpages@gmail.com>,
        linux-man@vger.kernel.org, Kees Cook <keescook@chromium.org>,
        Tyler Hicks <tyhicks@canonical.com>,
        Will Drewry <wad@chromium.org>
Subject: [RFC PATCH] seccomp.2: Document why each header is needed
Date:   Sat, 15 May 2021 20:22:55 +0200
Message-Id: <20210515182254.186607-1-alx.manpages@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Tyler Hicks <tyhicks@canonical.com>
Cc: Will Drewry <wad@chromium.org>
Cc: Michael Kerrisk <mtk.manpages@gmail.com>
---

Hi,

I'm not sure about this one.  Please check if these are correct, and if some
include is missing or can be removed, according to what we're doing with the
other pages.

Cheers,

Alex

 man2/seccomp.2 | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/man2/seccomp.2 b/man2/seccomp.2
index 584a16f22..1be7d6766 100644
--- a/man2/seccomp.2
+++ b/man2/seccomp.2
@@ -30,11 +30,11 @@
 seccomp \- operate on Secure Computing state of the process
 .SH SYNOPSIS
 .nf
-.B #include <linux/seccomp.h>
-.B #include <linux/filter.h>
-.B #include <linux/audit.h>
-.B #include <linux/signal.h>
-.B #include <sys/ptrace.h>
+.BR "#include <linux/seccomp.h>" "  /* Definition of " SECCOMP_* " constants */"
+.BR "#include <linux/filter.h>" "   /* Definition of " "struct sock_fprog" " */"
+.BR "#include <linux/audit.h>" "    /* Definition of " AUDIT_* " constants */"
+.BR "#include <linux/signal.h>" "   /* Definition of " SIG* " constants */"
+.BR "#include <sys/ptrace.h>" "     /* Definition of " PTRACE_* " constants */"
 .\" Kees Cook noted: Anything that uses SECCOMP_RET_TRACE returns will
 .\"                  need <sys/ptrace.h>
 .PP
-- 
2.31.1

