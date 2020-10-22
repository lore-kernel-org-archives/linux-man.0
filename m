Return-Path: <SRS0=NG0T=D5=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93B76C56201
	for <linux-man@archiver.kernel.org>; Thu, 22 Oct 2020 15:41:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2C8742463F
	for <linux-man@archiver.kernel.org>; Thu, 22 Oct 2020 15:41:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sBywALDI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2901461AbgJVPlF (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Thu, 22 Oct 2020 11:41:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2895638AbgJVPlE (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Thu, 22 Oct 2020 11:41:04 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3294C0613CE
        for <linux-man@vger.kernel.org>; Thu, 22 Oct 2020 08:41:00 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id k18so2784167wmj.5
        for <linux-man@vger.kernel.org>; Thu, 22 Oct 2020 08:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0M5bS9wwdu5/kobwt9AsN2XLWmLOEwHNBIMV9+VOea0=;
        b=sBywALDIxT9npDmd8ti5zf6cTd8YIxuOskzJzURpBCN2YWKLazIWGRp7ODDPrrhtrn
         XEt0OvZauc97WFacHU8PeikHXgcDnU247e6x/oVJ6YPudkKlOVnzrQm9cyKJqYa17iFH
         JJLEk2LdlCX92yqwHMSjnrXQ7jJQqfbVodY55EsYhM54jqpOhpn4yoLi5iogsE6U8BtF
         jjSiszRDyRXCDEc1r1QQDqSgzL/SeKdN33M8IH6xU+Dis8x2kSL+xVhOnyTxICmAIQOS
         V6/L5/a5WFNl1cO7hqQkLnOLQlaxQbjgrNLTteJRd0e6DGDla1gYtN2BzTLithw9Jpln
         LgvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0M5bS9wwdu5/kobwt9AsN2XLWmLOEwHNBIMV9+VOea0=;
        b=jq+Lp2tS8TmCcovmsYlfvEp+VO+0wFcAUqVxcTovVZhC8wEPs3D33PT1eSP/eWw/qo
         iR+/xUDUNBPYsrgv+M5B9zG3wfqj68nsgc3P3E8uZVbB8nz3AqpVNgtZ5J8K1M7jXHMJ
         cvZAtcmjOHRe/rPn0Xx/VBXiCk5Ehl7J5AXtEzitnfVdItApFUYA4iykW9LzEkxCJPdw
         5LSYHjKWmNnfDzycQr9LLmB0C8OkBOr6vJC1Qx44jnJKSsCNS0/9fTsvDia9iZaKeZ6Z
         EwdqzYEgfmmDjSI1Vw0oHQbqW5jUB4r4UqevSqhL1JvL2XMRzYCDNDY2eCdYdlgBaj0A
         MlGQ==
X-Gm-Message-State: AOAM533LMzdNyU3UtWOA4Vt5qbEx5+2JNhRxAn4AHOcNZCeMXW/dpE/H
        DPXj0jnYKJhTXZ3FX0WM3ko=
X-Google-Smtp-Source: ABdhPJzO/w8NMQ7+wZVKLLtvgbGQW1vBlN0amzzfOuYRYLDQ7GczOMO+3xt0Ja8IJ54kAb0X0q7Q6Q==
X-Received: by 2002:a1c:20ce:: with SMTP id g197mr3143734wmg.18.1603381259663;
        Thu, 22 Oct 2020 08:40:59 -0700 (PDT)
Received: from debian-VLC.home ([170.253.60.68])
        by smtp.googlemail.com with ESMTPSA id f14sm4907745wrr.80.2020.10.22.08.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 08:40:58 -0700 (PDT)
From:   Alejandro Colomar <colomar.6.4.3@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     Alejandro Colomar <colomar.6.4.3@gmail.com>,
        linux-man@vger.kernel.org
Subject: [PATCH] list.3: Sort alphabetically
Date:   Thu, 22 Oct 2020 17:40:40 +0200
Message-Id: <20201022154039.30048-1-colomar.6.4.3@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Signed-off-by: Alejandro Colomar <colomar.6.4.3@gmail.com>
---
 man3/list.3 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man3/list.3 b/man3/list.3
index 0cbccfe00..ea1c76b4d 100644
--- a/man3/list.3
+++ b/man3/list.3
@@ -63,9 +63,9 @@ LIST_REMOVE
 .\".PP
 .\".BI "LIST_FOREACH_FROM(TYPE *" var ", LIST_HEAD *" head ", LIST_ENTRY " NAME ");"
 .\".PP
-.\".BI "LIST_FOREACH_SAFE(TYPE *" var ", LIST_HEAD *" head ", LIST_ENTRY " NAME ", TYPE *" temp_var ");"
-.\".PP
 .\".BI "LIST_FOREACH_FROM_SAFE(TYPE *" var ", LIST_HEAD *" head ", LIST_ENTRY " NAME ", TYPE *" temp_var ");"
+.\".PP
+.\".BI "LIST_FOREACH_SAFE(TYPE *" var ", LIST_HEAD *" head ", LIST_ENTRY " NAME ", TYPE *" temp_var ");"
 .PP
 .B LIST_HEAD(HEADNAME, TYPE);
 .PP
-- 
2.28.0

