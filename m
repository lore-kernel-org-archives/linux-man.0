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
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF7A0C433EF
	for <linux-man@archiver.kernel.org>; Sat, 11 Sep 2021 16:01:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A5147611CC
	for <linux-man@archiver.kernel.org>; Sat, 11 Sep 2021 16:01:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232347AbhIKQCn (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sat, 11 Sep 2021 12:02:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230489AbhIKQCn (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sat, 11 Sep 2021 12:02:43 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57587C061574
        for <linux-man@vger.kernel.org>; Sat, 11 Sep 2021 09:01:30 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id w29so6596283wra.8
        for <linux-man@vger.kernel.org>; Sat, 11 Sep 2021 09:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bX5mY6iXq2runcN1CF/cJRSxpnJY+dCOo5T+jjnMx3w=;
        b=OutGXp9uJavmbISYwp7iMBKHtB8+Cx/3jVxuH+oCMM4RAPVAhQfzltI0I2RbIazZZc
         4QwDzLjpul4S7VXBXhjl6mBS6e9tehjsjX4pf63s2fK/8E/AxRHfcfcjOyqThVN077d/
         TyFvb+OQJNWA0qw5fYKZwWVk06paH5zL7pL5H5QhtqVdxVAG7qE8ctVFWEMaYGRrdqJw
         nwi070nwjccEqMuwg5w+LwxhNiuhKpHpo/TzXPlXhINxjqeiQKF5LV9olJ3U4V0a2zkX
         7882OMhBuw5nZ7i1fvTXN6Q5yM19Iy2MQKqBnaTKoBA0/487GRcxY20bSjzSoABEV9Ej
         axWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bX5mY6iXq2runcN1CF/cJRSxpnJY+dCOo5T+jjnMx3w=;
        b=ZWFmOrKGbLI6jiZzLAj+bIwFPZ3JRyCbLh1knn0I8HI6x/PojGe7FzxrAurRSRCgHx
         /031Zzpf34BcInOygKZUkP76VTkkyqXBbyUKaios+OvBxClGlVAzVv5c70yYee1RQXpv
         vOQZHe20HML6rRzC/qxdlZb4Rfl9jQY39ko7hmuE9gPm2k1CTLxIUit4b8J8L+s7EDW2
         wUys4uU8UCLDccUkRH1rJShm+5wMFKutrnGEhrAQ/yd31KOB2dhOsHbTWgBBrcJRR/Vn
         0jFw0YCwEh7qSqRPFFM2+7kCTBP1cCRKLTJeWd+1PsBexfps+S3k6F8+g/j+S8HuxRwp
         2hKw==
X-Gm-Message-State: AOAM533vgQjduis3/BtFhOnLi/Bplw8SQlA0dZYYk7bp8pgJCoohbwne
        /YGXwWUUtd8d/2FcE7PpYj5At8/X2Uk=
X-Google-Smtp-Source: ABdhPJw+5XU3H2GKvogPyAS/Q6mQOaU8871rJ9injrSH8vsatB+LUkQevxdnGwGKJKB9lO6wTaR95g==
X-Received: by 2002:adf:c18d:: with SMTP id x13mr3624495wre.83.1631376089030;
        Sat, 11 Sep 2021 09:01:29 -0700 (PDT)
Received: from sqli.sqli.com ([195.53.121.100])
        by smtp.googlemail.com with ESMTPSA id i9sm1947313wmi.44.2021.09.11.09.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Sep 2021 09:01:28 -0700 (PDT)
From:   Alejandro Colomar <alx.manpages@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     Alejandro Colomar <alx.manpages@gmail.com>,
        linux-man@vger.kernel.org
Subject: [PATCH 02/45] keyctl.2: Add LIBRARY section
Date:   Sat, 11 Sep 2021 18:00:35 +0200
Message-Id: <20210911160117.552617-3-alx.manpages@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210911160117.552617-1-alx.manpages@gmail.com>
References: <20210911160117.552617-1-alx.manpages@gmail.com>
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
index 4e3ca5dac..226ae2800 100644
--- a/man2/keyctl.2
+++ b/man2/keyctl.2
@@ -28,6 +28,13 @@
 .TH KEYCTL 2 2021-08-27 Linux "Linux Key Management Calls"
 .SH NAME
 keyctl \- manipulate the kernel's key management facility
+.SH LIBRARY
+Standard C library
+.RI ( libc ", " -lc )
+.PP
+Alternatively, Linux Key Management Utilities
+.RI ( libkeyutils ", " -lkeyutils );
+see NOTES.
 .SH SYNOPSIS
 .nf
 .BR "#include <linux/keyctl.h>" "     /* Definition of " KEY* " constants */"
@@ -1958,8 +1965,6 @@ library.
 (The accompanying package provides the
 .I <keyutils.h>
 header file.)
-When employing the wrapper in that library, link with
-.IR \-lkeyutils .
 However, rather than using this system call directly,
 you probably want to use the various library functions
 mentioned in the descriptions of individual operations above.
-- 
2.33.0

