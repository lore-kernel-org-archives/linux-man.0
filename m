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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 027B4C433E0
	for <linux-man@archiver.kernel.org>; Wed, 30 Dec 2020 21:42:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE8842074D
	for <linux-man@archiver.kernel.org>; Wed, 30 Dec 2020 21:42:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbgL3Vmi (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Wed, 30 Dec 2020 16:42:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726388AbgL3Vmi (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Wed, 30 Dec 2020 16:42:38 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91A09C061573
        for <linux-man@vger.kernel.org>; Wed, 30 Dec 2020 13:41:57 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id r7so18632771wrc.5
        for <linux-man@vger.kernel.org>; Wed, 30 Dec 2020 13:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ib1vIWW7El2v5kzbpDW5TTyBLxVo4feesgt4af8ctcw=;
        b=UhpqjWqZkB0zVFdC7QwKRyxq+JavfblahKMJEnBWo3O11wXRwb+xB2r4UsxA404Uh3
         pvIGzEPhYA8Y1FI3tJd70oaRENFHuCcndiXfxzrH5iJTxVcLK/25I3UPogbr71pFwIhC
         qqlhydhvFD2znASIZYYRSxgbqxBxNIBx/naDFLNw9bY/zWuKVlqUEktXYue9OvM2qFBR
         1P37BMuIDzOAIsDI4NbdQQTBzQTfUQcgg154DL2fESqf8xZjumtW3I1/N2M3yj4tqJv3
         dK6zNHHiEL1YlGyBxS+kYDMgT1qQoNawCtQ8NQ7xz0nPyFOrjoYfd2Xsjr+YSh+aN0Hb
         3J6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ib1vIWW7El2v5kzbpDW5TTyBLxVo4feesgt4af8ctcw=;
        b=K7eyg5vvq1LrdZUg4QEw1JEKIekiUp+PULrA9yob/J8Gy7fZIplpLYGg+4/Le7j+F4
         4AT5aQPF+NPegVAKVYiiUKQuAryGBUA0sNilPZFV9Kti2eadLu2L8FeNyKFczqs+YQH2
         cVn15lyNtJumjo8t6gKtN+dU9yYgYtMQzhBCqLxd7H7Ifzcgz8edYYcR2NPYuczhI0aW
         sck3qYblhk4aAqjqDwo9pdW4OlBUEr1d+HMt+tYFLVZWMQQeLy7L+aCE6q9Uu8mElP53
         6DVGA4MpiYW8FEjgJma8MMJH7nOmJkZUFBpYinlEJg2kdRd89MJck4sxxx5GscB+ftsT
         WxdQ==
X-Gm-Message-State: AOAM532yVuPjQMF1mBRYGtuabuAkiZEsd+wBmTpu8kgEqZWy2DEHxr9h
        lmAMdg888+snDJ8Wbf59BUc=
X-Google-Smtp-Source: ABdhPJy6HhA5ySTXZzhUjHBc7x7mTZFfbATEfnMi2vHk9UhHygRl3bzPsfGhGxo/khZLBePM+Nd/oQ==
X-Received: by 2002:adf:e84c:: with SMTP id d12mr64303718wrn.382.1609364516283;
        Wed, 30 Dec 2020 13:41:56 -0800 (PST)
Received: from localhost.localdomain ([170.253.49.0])
        by smtp.googlemail.com with ESMTPSA id 67sm9519234wmb.47.2020.12.30.13.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Dec 2020 13:41:55 -0800 (PST)
From:   Alejandro Colomar <alx.manpages@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     Alejandro Colomar <alx.manpages@gmail.com>,
        linux-man@vger.kernel.org
Subject: [PATCH] execveat.2: srcfix
Date:   Wed, 30 Dec 2020 22:41:41 +0100
Message-Id: <20201230214147.874671-1-alx.manpages@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Use .nf/.fi in the SYNOPSIS.

Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>
---

 man2/execveat.2 | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/man2/execveat.2 b/man2/execveat.2
index 7c31d8f17..c5cd843f9 100644
--- a/man2/execveat.2
+++ b/man2/execveat.2
@@ -27,13 +27,13 @@
 .SH NAME
 execveat \- execute program relative to a directory file descriptor
 .SH SYNOPSIS
+.nf
 .B #include <unistd.h>
 .PP
-.BI "int execveat(int " dirfd ", const char *" pathname ","
-.br
-.BI "             char *const " argv "[], char *const " envp "[],"
-.br
+.BI "int execveat(int " dirfd ", const char *" pathname ,
+.BI "             char *const " argv "[], char *const " envp [],
 .BI "             int " flags );
+.fi
 .SH DESCRIPTION
 .\" commit 51f39a1f0cea1cacf8c787f652f26dfee9611874
 The
@@ -224,7 +224,8 @@ where scripts recursively employ
 .\" For an example, see Michael Kerrisk's 2015-01-10 reply in this LKML
 .\" thread (http://thread.gmane.org/gmane.linux.kernel/1836105/focus=20229):
 .\"
-.\"     Subject: [PATCHv10 man-pages 5/5] execveat.2: initial man page.\"                        for execveat(2
+.\"     Subject: [PATCHv10 man-pages 5/5] execveat.2: initial man page
+.\"                        for execveat(2)
 .\"     Date: Mon, 24 Nov 2014 11:53:59 +0000
 .SH SEE ALSO
 .BR execve (2),
-- 
2.29.2

