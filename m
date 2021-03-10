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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D87B9C4332D
	for <linux-man@archiver.kernel.org>; Wed, 10 Mar 2021 18:33:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AF7E464FB9
	for <linux-man@archiver.kernel.org>; Wed, 10 Mar 2021 18:33:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233257AbhCJScg (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Wed, 10 Mar 2021 13:32:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232598AbhCJScM (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Wed, 10 Mar 2021 13:32:12 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8922CC061760
        for <linux-man@vger.kernel.org>; Wed, 10 Mar 2021 10:32:12 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id n11-20020a05600c4f8bb029010e5cf86347so1942782wmq.1
        for <linux-man@vger.kernel.org>; Wed, 10 Mar 2021 10:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+bzWvWDLSxoT6KTAh+c1ca6ECWOIV1SYop1drWRGp9k=;
        b=UAV9I7rB2VrAPiDYlpX6WftzY9yu07/Frz6CFSdRf5WveCTBMUe9Ja+0covzUGLsfc
         wepvWEriwi+XxEW4j4r1fiKVcleTk27rGHwMBK0aVtcApI9EMXxC3ZDMXYX0yhw8R5xR
         lITGjP+OxbYYjO0D+evZMVRg3bWEac14y1U8p5MW4nKLeiWm9V0EYfxETq/74viGHWl3
         fYZ3rz/uYOExwQPw9WatUdLIDa474dopObKDX7KlpFEwJBst9B9KLWS48JmYDGpb0fBN
         /McaePVp9dUPuo9W1tKXScuaLK9uRD7DWnxcoy0NGboZSG1nJWOLTytdcakgb4n8xjA0
         BfhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+bzWvWDLSxoT6KTAh+c1ca6ECWOIV1SYop1drWRGp9k=;
        b=ahcOGOWvjjQq4vVigU38nSmQC1jeQXQC7/adrGJE0wTqmNjSzyhAzvrZyn2J0xWfu3
         j2MduJAsN16DfuODqWaJPcy7jnfWZzfV7rfSdSrwbXQ/ldNQaomDtZ0iyPpwNQRcO+ya
         N420jwfXjMOumFqP5dQTPuV4usXDbaItzoK5x7Yui6DXcp1Ds9d/xA3GQCN62hhb+CMh
         R8QgNKOi/gaxgAfgU5n69X7cpQwpt0n9eELN57JDpgDlDIXlmpUYMyrkAeMCnFX2ZVg9
         1dYwV9TXtSLQN8eD457S5CAlQezZbbf9E1JLN08klxlFsl7Eij2D3p4n1FBK1o/qvXXN
         /skg==
X-Gm-Message-State: AOAM532gBCCClbwZ36G8PXp8Pjs1owBNmm/8EGY5W1SfER+0dMRKCh6L
        TywrOcBhSs58O3NbK+G5J8Y=
X-Google-Smtp-Source: ABdhPJzjb2/By5pS2u2sqtxNmmtWyHrzyB5V+7X/3DpQB6WzzeYDtSbFdabqArePslKRCe10aCnaUw==
X-Received: by 2002:a1c:4986:: with SMTP id w128mr4610975wma.37.1615401131356;
        Wed, 10 Mar 2021 10:32:11 -0800 (PST)
Received: from localhost.localdomain ([170.253.51.130])
        by smtp.googlemail.com with ESMTPSA id k11sm325374wmj.1.2021.03.10.10.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 10:32:11 -0800 (PST)
From:   Alejandro Colomar <alx.manpages@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     Alejandro Colomar <alx.manpages@gmail.com>,
        linux-man@vger.kernel.org, libc-alpha@sourceware.org
Subject: [PATCH 06/24] setnetgrent.3: SYNOPSIS: Use 'restrict' in prototypes
Date:   Wed, 10 Mar 2021 19:31:32 +0100
Message-Id: <20210310183149.194717-7-alx.manpages@gmail.com>
X-Mailer: git-send-email 2.30.1.721.g45526154a5
In-Reply-To: <20210310183149.194717-1-alx.manpages@gmail.com>
References: <20210310183149.194717-1-alx.manpages@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

glibc uses 'restrict' in getnetgrent(), getnetgrent_r().
Let's use it here too.

.../glibc$ grep_glibc_prototype getnetgrent
resolv/netdb.h:410:
extern int getnetgrent (char **__restrict __hostp,
			char **__restrict __userp,
			char **__restrict __domainp);
.../glibc$ grep_glibc_prototype getnetgrent_r
resolv/netdb.h:430:
extern int getnetgrent_r (char **__restrict __hostp,
			  char **__restrict __userp,
			  char **__restrict __domainp,
			  char *__restrict __buffer, size_t __buflen);
.../glibc$

Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>
---
 man3/setnetgrent.3 | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/man3/setnetgrent.3 b/man3/setnetgrent.3
index 440cf2846..2a783ee58 100644
--- a/man3/setnetgrent.3
+++ b/man3/setnetgrent.3
@@ -18,12 +18,14 @@ handle network group entries
 .BI "int setnetgrent(const char *" netgroup );
 .B "void endnetgrent(void);"
 .PP
-.BI "int getnetgrent(char **" host ", char **" user ", char **" domain );
-.BI "int getnetgrent_r(char **" host ", char **" user ","
-.BI "                  char **" domain ", char *" buf ", size_t " buflen );
+.BI "int getnetgrent(char **restrict " host ,
+.BI "            char **restrict " user ", char **restrict " domain );
+.BI "int getnetgrent_r(char **restrict " host ,
+.BI "            char **restrict " user ", char **restrict " domain ,
+.BI "            char *restrict " buf ", size_t " buflen );
 .PP
-.BI "int innetgr(const char *" netgroup ", const char *" host ","
-.BI "                  const char *" user ", const char *" domain );
+.BI "int innetgr(const char *" netgroup ", const char *" host ,
+.BI "            const char *" user ", const char *" domain );
 .fi
 .PP
 .RS -4
-- 
2.30.1.721.g45526154a5

