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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77166C433B4
	for <linux-man@archiver.kernel.org>; Sat,  3 Apr 2021 19:41:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 473F961350
	for <linux-man@archiver.kernel.org>; Sat,  3 Apr 2021 19:41:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236787AbhDCTmB (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sat, 3 Apr 2021 15:42:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236736AbhDCTmB (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sat, 3 Apr 2021 15:42:01 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C93DC0613E6
        for <linux-man@vger.kernel.org>; Sat,  3 Apr 2021 12:41:58 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id t5-20020a1c77050000b029010e62cea9deso3810660wmi.0
        for <linux-man@vger.kernel.org>; Sat, 03 Apr 2021 12:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ch5eqq1avqKbROCSo5D535aJuRy/ICKQTAFg9B9mLAY=;
        b=JmsEhWmXLlffhj1yz3xKtVfEFuWQpeIM88DfvnflExCsSFpQpBdF0bC3kJmgc7BzQk
         iWqeiyowGVO0V8Yipk3pHUnOFmMFKLJRBlJ4S8AjjZP8mpU8zBe2+Npr6K1OUfmEZV25
         oVlJz/0nN/3zPqh4dmQSsyZ7WgzprRSGQp06kSsCiuyVBaP2nPYuMsfH8dmuEiY3YbL4
         fcH/SxvKai4kOVGVoQh+yrfX/412EMnBVEd39W0XIsPBQf50HG6gKiqv7Pt7MaTu5Ycn
         STbYeNDWBX1OjFOJ+p94clg8XQPiWTGs3cRDGXArpfAg/KCYoIz1vAtJd6wRraQU+5qM
         L28g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ch5eqq1avqKbROCSo5D535aJuRy/ICKQTAFg9B9mLAY=;
        b=sCo2ejrtK7rsGnri2owURn9B1A5x5bkppH9usC0/DjMwps1CYWrMCgGUOuB4Ijt8S/
         fpWT8QJki/Cr7zSme8kWk0C1jc3XoOOx8KsdSr7w3du/0qAxuMgl33HGQcmAZnPWzYqj
         HCfXy8DKYwTXloa/P2t1evNHbqDSjSBNtpAA/i+WVrnjgtRMC0JqclihoRS2IyHZegMY
         F1FvwvRU2bAGPfaY5yKg32LIdS7c7a5gBL/H8LXsqn7qpCg3RfA9XV2KbheBGTP1VSgn
         LvnMPZRMF7OQhCI/VRwutiKvw+8znsxpg3uCr1D1oMPqY/TU97iGX5HLbD1xrGNI59Q9
         UDzg==
X-Gm-Message-State: AOAM532pmzhQOMXybzms81atHnlAsq/kgBllH8MnPGUK6ZWgOEN7BRrk
        JMRUWkDlCz9obrYK5Cc95bDSY+TOfJE=
X-Google-Smtp-Source: ABdhPJyVYI9DIheGbrRCThZjvhuS8HEToEcli8x0lkT6ChrMQejyQienwf7as3uVQHM1RvcOkUGLQw==
X-Received: by 2002:a1c:4b15:: with SMTP id y21mr18656342wma.94.1617478916908;
        Sat, 03 Apr 2021 12:41:56 -0700 (PDT)
Received: from localhost.localdomain ([170.253.36.171])
        by smtp.googlemail.com with ESMTPSA id n1sm25211056wro.36.2021.04.03.12.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Apr 2021 12:41:56 -0700 (PDT)
From:   Alejandro Colomar <alx.manpages@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     Alejandro Colomar <alx.manpages@gmail.com>,
        linux-man@vger.kernel.org, libc-alpha@sourceware.org
Subject: [PATCH v4 13/35] dup.2: SYNOPSIS: Use consistent comments through pages
Date:   Sat,  3 Apr 2021 21:40:05 +0200
Message-Id: <20210403194026.102818-14-alx.manpages@gmail.com>
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
 man2/dup.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/dup.2 b/man2/dup.2
index 725b9d7d5..b9e0828b0 100644
--- a/man2/dup.2
+++ b/man2/dup.2
@@ -45,7 +45,7 @@ dup, dup2, dup3 \- duplicate a file descriptor
 .BI "int dup2(int " oldfd ", int " newfd );
 .PP
 .BR "#define _GNU_SOURCE" "             /* See feature_test_macros(7) */"
-.BR "#include <fcntl.h>" "              /* Obtain O_* constant definitions */"
+.BR "#include <fcntl.h>" "              /* Definition of " O_* " constants */"
 .B #include <unistd.h>
 .PP
 .BI "int dup3(int " oldfd ", int " newfd ", int " flags );
-- 
2.31.0

