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
	by smtp.lore.kernel.org (Postfix) with ESMTP id F38EEC433EF
	for <linux-man@archiver.kernel.org>; Sat, 11 Sep 2021 16:01:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D947C60E9B
	for <linux-man@archiver.kernel.org>; Sat, 11 Sep 2021 16:01:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232995AbhIKQC7 (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sat, 11 Sep 2021 12:02:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232960AbhIKQC6 (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sat, 11 Sep 2021 12:02:58 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 889A4C06175F
        for <linux-man@vger.kernel.org>; Sat, 11 Sep 2021 09:01:45 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id e26so3375262wmk.2
        for <linux-man@vger.kernel.org>; Sat, 11 Sep 2021 09:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z1QgzQ57MX/DVASgXk+kFWFZuQ92vXSbktrVPeShA00=;
        b=Po1d3i0EgOO7Tkp9ywnIHBzafGOXqfFeezaPmDjozy4X+GQi4v2O30bK+cF0lPLzYl
         Ku1jnPQVSrrPNqbFKmnUTUBuaeQ8rqbrGOhdqytZjSYzDfLM3NANcr/H964VJ5ttZZHI
         wuJWOqA8XMfixBFo2u9lOsF7svZnz4h1/AaoT6tSgmSVamHP9RVGxTatcTqac/sJtSo/
         vE7oU46CONULqKsSoyXov0dAx1Uw5X1kSOpttBJ7Q2DJaREQj4WtrNYHzfY/uH0J5j+M
         uP3CVz7PChLQ7wteZwyY2zOZJTY8DubhjqAon4qsGjb5xNEvb6b8IVE2RF1Bc3xrbHy0
         /ykA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z1QgzQ57MX/DVASgXk+kFWFZuQ92vXSbktrVPeShA00=;
        b=F+XvoIkqJDTmPeCQ6JnrkS1P3zR069D9ZX66wLyF7oi533H3KIfOaknGYJ2qgk2g3o
         Hg7RBJwi+og/TfjVrtw8pfAfhw+Fh0H7wJqermkVkoyARkhBK9qFrUNAxyOMnj90BQlM
         ACjPLl7TBf9yU81gIXT/pI0bGkFzaZ+88/M1B+hE8rlfJjGgxzFZW5Ja8NxDJzH6VD7i
         Rmx+sLH1LyI4vSyAOKdTAfUsjioSmBZBYNQ3ckXLbgozYrmaAZFVjis5eNSjMasopZho
         mrV0KTzBDPR4DlOJKQWPberhKfj9a7ZZjacu91K0mR4aJaxVDJLqbglC49w1EP9mvwIR
         7bqA==
X-Gm-Message-State: AOAM532tBeYYvL9P90nZUm/FbAe33ultgBbyenHANAuxsrQVJMqS1KBq
        3nuhzoxAkrIcjVXTqsj+37N+1dXh3g8=
X-Google-Smtp-Source: ABdhPJyQ1u1DyNi2CcNBBXWBYldJ2IQRJgkm6EeqG6qbty6pj8kSbaNRXucEJRFTNb1205PDgjKqKg==
X-Received: by 2002:a7b:c20f:: with SMTP id x15mr3213474wmi.143.1631376104165;
        Sat, 11 Sep 2021 09:01:44 -0700 (PDT)
Received: from sqli.sqli.com ([195.53.121.100])
        by smtp.googlemail.com with ESMTPSA id i9sm1947313wmi.44.2021.09.11.09.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Sep 2021 09:01:43 -0700 (PDT)
From:   Alejandro Colomar <alx.manpages@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     Alejandro Colomar <alx.manpages@gmail.com>,
        linux-man@vger.kernel.org
Subject: [PATCH 18/45] umount.2: Add LIBRARY section
Date:   Sat, 11 Sep 2021 18:00:51 +0200
Message-Id: <20210911160117.552617-19-alx.manpages@gmail.com>
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
 man2/umount.2 | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/man2/umount.2 b/man2/umount.2
index e9059c405..a18cf6175 100644
--- a/man2/umount.2
+++ b/man2/umount.2
@@ -30,6 +30,9 @@
 .TH UMOUNT 2 2021-08-27 "Linux" "Linux Programmer's Manual"
 .SH NAME
 umount, umount2 \- unmount filesystem
+.SH LIBRARY
+Standard C library
+.RI ( libc ", " -lc )
 .SH SYNOPSIS
 .nf
 .B "#include <sys/mount.h>"
-- 
2.33.0

