Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A567C2D0E4
	for <linux-man@archiver.kernel.org>; Sun, 15 Nov 2020 11:28:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AE9FE2222E
	for <linux-man@archiver.kernel.org>; Sun, 15 Nov 2020 11:28:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dNDFUYt4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726826AbgKOL1v (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sun, 15 Nov 2020 06:27:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726982AbgKOL1D (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sun, 15 Nov 2020 06:27:03 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D952C0613D1
        for <linux-man@vger.kernel.org>; Sun, 15 Nov 2020 03:27:03 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id b6so15573934wrt.4
        for <linux-man@vger.kernel.org>; Sun, 15 Nov 2020 03:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=13ZcHQzPZCArMK8P81x8lnxea84h0kDtOBjLtxeaLYM=;
        b=dNDFUYt4iRNIE3QwBzMqOtn2WUVB4cHxg8Y2DdGTfQVDe5uin3KFQV/SLwG2u4zTZs
         757ktB3yTfCIxtbq2EU6LOlvQhSl+yxld7ts1etPrhXJXsB/O/gc8JsIe1L79BgUvBrU
         NDHlcrjUz9e+lWYsQQ6H3BGbeFRLBNH7wSdKwdECphms2jatqCzdP1xvslB4jSLz7YrE
         ZQQ/1JlPWzHzh/pmO8MFJbJxY6aagSiZU2XhLUk3RwV8VUZ6ovG6Fc99Uh5Wsy0ECbAi
         KSmk+f6jdF8fgyNU6AmhXdbUM5KprIP31RWmuFa2asv5vxhi1n0up1xeYVH8tJw0VSq+
         YDFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=13ZcHQzPZCArMK8P81x8lnxea84h0kDtOBjLtxeaLYM=;
        b=ge12WfbjvISgouceW+btmiIZbtMUO4CFmbpR6ggA1TTCRD9SIGjB7C/xim8ZhBf0+s
         j/ts7StY5+GmKW7ZN6e6wF5JcfYrc7qGvMRHZ+NpvIea18MsOkWs+Sype5gLDXpr9zvX
         I4W4/rAmLVHNJTQAlYK7AfHZ/6VqiO9g6Lrqq4MDslN3MEBkXuuDwDV5dP+4xdo5O94c
         BuZVX9jBhdft4Yq5gl8Kso6W0n8zqDdtucs8qYtY7STxQ4Hh2ULe3AfwjI3yo0p4FlEa
         lgLdXSGqCZ+78tQmUqSTElTyvEM/mBgBT5Ncm9dnzjee+WTPsFVL0Gezfi9Ol7+qQnQ8
         YV/w==
X-Gm-Message-State: AOAM532xdFTlrjY8Bbonujd2efQLs7Vpi2XKY3UPxksT6mPsFR369YSL
        LWJrhdEP5gHZMO5x3dVuenw=
X-Google-Smtp-Source: ABdhPJy+gYLIT0AFjzxyCF1TxymyV/GjDPruUfIJwIlN3544x7jWjPFgsPeJ3M7bnqVEJOLss+krTg==
X-Received: by 2002:adf:db0f:: with SMTP id s15mr13988809wri.354.1605439622049;
        Sun, 15 Nov 2020 03:27:02 -0800 (PST)
Received: from localhost.localdomain ([170.253.49.0])
        by smtp.googlemail.com with ESMTPSA id d128sm276788wmc.7.2020.11.15.03.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2020 03:27:01 -0800 (PST)
From:   Alejandro Colomar <alx.manpages@gmail.com>
X-Google-Original-From: Alejandro Colomar <colomar.6.4.3@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     Alejandro Colomar <colomar.6.4.3@gmail.com>,
        linux-man@vger.kernel.org
Subject: [PATCH] locale.5, ipv6.7: ffix
Date:   Sun, 15 Nov 2020 12:26:40 +0100
Message-Id: <20201115112639.18291-1-colomar.6.4.3@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

[.B XX_*] is the most extended form in the pages.

Signed-off-by: Alejandro Colomar <colomar.6.4.3@gmail.com>
---
 man5/locale.5 | 2 +-
 man7/ipv6.7   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/man5/locale.5 b/man5/locale.5
index 5210f5c6f..f46b8129a 100644
--- a/man5/locale.5
+++ b/man5/locale.5
@@ -620,7 +620,7 @@ a string that identifies this locale category definition,
 a semicolon, and
 .IP *
 one of the
-.BI LC_ *
+.B LC_*
 identifiers.
 .PP
 The
diff --git a/man7/ipv6.7 b/man7/ipv6.7
index 9692ec1ec..b4b6a88ce 100644
--- a/man7/ipv6.7
+++ b/man7/ipv6.7
@@ -398,9 +398,9 @@ for that instead.
 .BR SOL_IPV6 ,
 .B SOL_ICMPV6
 and other
-.BR SOL_ *
+.B SOL_*
 socket options are nonportable variants of
-.BR IPPROTO_ * .
+.BR IPPROTO_* .
 See also
 .BR ip (7).
 .SH BUGS
-- 
2.28.0

