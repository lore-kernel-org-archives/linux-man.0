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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73E06C433E0
	for <linux-man@archiver.kernel.org>; Mon, 15 Feb 2021 13:17:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 41E9B64DEE
	for <linux-man@archiver.kernel.org>; Mon, 15 Feb 2021 13:17:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229666AbhBONRn (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 15 Feb 2021 08:17:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230239AbhBONRk (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Mon, 15 Feb 2021 08:17:40 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 280CEC0613D6
        for <linux-man@vger.kernel.org>; Mon, 15 Feb 2021 05:16:59 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id v1so8836183wrd.6
        for <linux-man@vger.kernel.org>; Mon, 15 Feb 2021 05:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dSHWn7kZI3gE7QY/vcg6HzyqpUSCbntisIALFW+yU0I=;
        b=u3u6f3ZHHdFRHAsv8rhOYl8jAuiyu9puu+IRm0YmSSGQV8RlcYYruIGzin+69O3oEU
         o5DX/9EuimztNt9PjlYxKpsKb6ohVn3uSUnAhOW0wIc7lPWN+uMz3sO4pFofPBNJTR7J
         BPlshjfzMpvrp2TK0wj4R0qrI/Z3I6F1r5ErNm4fNeDB4TT4j2L15SZtXYJFiFjtRLB4
         5IdF+HMvg6JcZogbHw/swV9d8LSWcKVyRuugqB0Ekb3vonAAP7EciIGTcoFDqMYwq5Db
         Xy7T+rhNZpfPWNA6PVRzCMLRhw6NSEZGKZPsM3RSnGMTZOzc/CcCNKFAyjkqVoYROLXl
         dFVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dSHWn7kZI3gE7QY/vcg6HzyqpUSCbntisIALFW+yU0I=;
        b=R1Oi1BLwRxBCLl+lAhzdaFEVON8j23DsDq2UVFU2K3msDjD2Hn70W0IH7zvSbyh3bP
         vrblFeUvm/t7A4BHZSnJdFJfndDT/G7oxfDUzeOD5u/KEI9qpKMKv8xwULhDknEEng/o
         7fKN2NSQtCflrcKIrc+TfkR6Ga5+RatGTv83eTBjfTXBbA0TexRGck9XhVwjckJAgrrC
         Gi8ulzbEHgk75NbLuVZtlHzTf+IB9yr5taaZ+2vQKW6rn9VBq3h2Mz1v/OU5witB3kyY
         mJ1b+cgM7EIpLCyw9zgODKEtTDo6t4frbpbdvp+3gym4ZE4/Y8UPbYvNlYldoS7k/x2G
         T90A==
X-Gm-Message-State: AOAM532C7yGVOpegztowBwbBpzDZru7oJ2TCQsp2glCFsT9/Vd3RZpVw
        D0brydpQ0YKeIw4G07GwD98R25zcNrc=
X-Google-Smtp-Source: ABdhPJxmqwJuUVCKGBwMQulMCh7NjSk3ZSUALdn5YonJbnXaJAk+7mnR1dWmvZ+O9E2AoMV2LnZDsA==
X-Received: by 2002:a5d:698b:: with SMTP id g11mr18654635wru.211.1613395017957;
        Mon, 15 Feb 2021 05:16:57 -0800 (PST)
Received: from debian.vlc ([170.253.51.130])
        by smtp.gmail.com with ESMTPSA id d15sm19309504wru.80.2021.02.15.05.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 05:16:57 -0800 (PST)
From:   Alejandro Colomar <alx.manpages@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     Alejandro Colomar <alx.manpages@gmail.com>,
        linux-man@vger.kernel.org
Subject: [PATCH] setfsgid.2: tfix
Date:   Mon, 15 Feb 2021 14:15:16 +0100
Message-Id: <20210215131522.450666-4-alx.manpages@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

The type of fsgid is git_t, and not uid_t.  Fix it.

......

.../glibc$ grep_glibc_prototype setfsgid
sysdeps/unix/sysv/linux/sys/fsuid.h:31:
extern int setfsgid (__gid_t __gid) __THROW;
.../glibc$

Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>
---
 man2/setfsgid.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/setfsgid.2 b/man2/setfsgid.2
index e2d4d09f3..3fd22f3a5 100644
--- a/man2/setfsgid.2
+++ b/man2/setfsgid.2
@@ -36,7 +36,7 @@ setfsgid \- set group identity used for filesystem checks
 .nf
 .B #include <sys/fsuid.h>
 .PP
-.BI "int setfsgid(uid_t " fsgid );
+.BI "int setfsgid(gid_t " fsgid );
 .fi
 .SH DESCRIPTION
 On Linux, a process has both a filesystem group ID and an effective group ID.
-- 
2.30.0

