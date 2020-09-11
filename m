Return-Path: <SRS0=glPb=CU=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0F8DC43461
	for <linux-man@archiver.kernel.org>; Fri, 11 Sep 2020 23:15:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6985D221F0
	for <linux-man@archiver.kernel.org>; Fri, 11 Sep 2020 23:15:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A3Wo4z3l"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725882AbgIKXPC (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Fri, 11 Sep 2020 19:15:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725864AbgIKXOi (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Fri, 11 Sep 2020 19:14:38 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F353C0613ED
        for <linux-man@vger.kernel.org>; Fri, 11 Sep 2020 16:14:37 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id e17so5768493wme.0
        for <linux-man@vger.kernel.org>; Fri, 11 Sep 2020 16:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AChm2Pl4FJmFXVe0uCOH468cj1im1LSUlGjpN5BJs/E=;
        b=A3Wo4z3lxBdYoGYH1glFYLOB8pAcfyUgiW2YY58OGM5ICcE3kr/XYeF8Dl48f4F6WG
         MQdbhmsX9tsSUe3qMJydUzf+SDbqfhsvVzvKGfDensE1WTSJKC4gkZQQhZ/yOzDhCrUz
         nYkaa5ffi2Qd8SgLXcA/GmuKTHlyzU/TCn04IRQi00lIFO+TbifnvmHyHj6yws9sct3R
         FMOXOjZ3Aeia216Qeteo15xDuLfUlp6Zj+I0apjIr029CxEesyUmpWuoNft10cqAtQRI
         Qse4UWftpV7K8GkVIvwQTj8u91s8sCpV0Z5enwz+VsO4/nVRSwuwMGzIZVd5QM5qxB7E
         iJ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AChm2Pl4FJmFXVe0uCOH468cj1im1LSUlGjpN5BJs/E=;
        b=LAA2VVhLvgpfmIimDpuyUi3xCl36AOwTr3Gxk3u+fnh9NjpfSm0WA2dltOYLnzpUAi
         KPLyg6d0i+cM+ZkOcK5AmBIl8LvsOcRIPBQo2gcCF5uXkmrUcCFruZVjTKTRGNrO9QU+
         UNx8VmusGefvP3kgG9XRe84l+4weyhuqzUGv5/MNIUrv8O/KT5cs4FfKmlFPbsxh9HEA
         Sw7JtGRbWO1sGP3IK5eeqqkh4hZz0X678KZJaLKGAsBUElZefa3pWem/xOCzEmv3cXjv
         NrrrzSDhhzijYL7e6R4ZzhiZ6uD7h8IMwI+wH+oG7jfNX42UpbSHAfbNhFM1D8x+RvX0
         32KQ==
X-Gm-Message-State: AOAM530dMm93P4SFjGN9/4XSdhCIVjU6A1+uWoo3UQ7f+IDRimz0OyQ8
        bnRS4Ah7fAY1+/ngGG9rxUw=
X-Google-Smtp-Source: ABdhPJxtH+4VFAZFh5vFjiDY0PVb7tM+3VegfcGNyw+Ou8MHJPMKuBXPCYk3IfM+8Gi/lO1fwf6I+A==
X-Received: by 2002:a7b:cbd4:: with SMTP id n20mr4625311wmi.105.1599866074986;
        Fri, 11 Sep 2020 16:14:34 -0700 (PDT)
Received: from localhost.localdomain ([170.253.60.68])
        by smtp.googlemail.com with ESMTPSA id b76sm7300806wme.45.2020.09.11.16.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2020 16:14:34 -0700 (PDT)
From:   Alejandro Colomar <colomar.6.4.3@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     linux-man@vger.kernel.org,
        Alejandro Colomar <colomar.6.4.3@gmail.com>
Subject: [PATCH 02/12] malloc_hook.3: Remove unneeded cast, and print 'size_t' with "%zu"
Date:   Sat, 12 Sep 2020 01:14:02 +0200
Message-Id: <20200911231411.28406-3-colomar.6.4.3@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200911231411.28406-1-colomar.6.4.3@gmail.com>
References: <20200911231411.28406-1-colomar.6.4.3@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Signed-off-by: Alejandro Colomar <colomar.6.4.3@gmail.com>
---
 man3/malloc_hook.3 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man3/malloc_hook.3 b/man3/malloc_hook.3
index a509dc72f..fb45e30f2 100644
--- a/man3/malloc_hook.3
+++ b/man3/malloc_hook.3
@@ -130,8 +130,8 @@ my_malloc_hook(size_t size, const void *caller)
     old_malloc_hook = __malloc_hook;
 
     /* printf() might call malloc(), so protect it too. */
-    printf("malloc(%u) called from %p returns %p\en",
-            (unsigned int) size, caller, result);
+    printf("malloc(%zu) called from %p returns %p\en",
+            size, caller, result);
 
     /* Restore our own hooks */
     __malloc_hook = my_malloc_hook;
-- 
2.28.0

