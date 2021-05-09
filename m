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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D561C43460
	for <linux-man@archiver.kernel.org>; Sun,  9 May 2021 21:44:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E7C50613CA
	for <linux-man@archiver.kernel.org>; Sun,  9 May 2021 21:44:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230039AbhEIVpd (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sun, 9 May 2021 17:45:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230087AbhEIVp0 (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sun, 9 May 2021 17:45:26 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AF55C06138C
        for <linux-man@vger.kernel.org>; Sun,  9 May 2021 14:44:17 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id y124-20020a1c32820000b029010c93864955so10034322wmy.5
        for <linux-man@vger.kernel.org>; Sun, 09 May 2021 14:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oB3NQtRKRYuvuhwTSIgBlvvZWzEVsNHJ1ZgLBZyEvGE=;
        b=IQR+hva88hInshBEpXnTVq0XfZSXApNnx9ZTxtt0MUVNazwmQnAE5LqcQnzOb1OhRk
         SI78TT1Qw+vPTrhu+bpZpoeaJYxzeM5uGSqWT66GFU3rIEcrBoNyAfVKERqK41y7s/t2
         kt7tvh87G+HS2dMg8I2EeZJO1V3se+DK8KG7sRGmJGWt5GH6EqnirrFpdEleJmV/3GuW
         Y2gTwVyzNCpID1y8MibfmJ/EqZpHeuHkNwojLAfKYFwZa+xbTzCnGwTnwfTGW/q7a9Yu
         vCXQ3EaAM/ToVKrYtq7CGLAz9BfN9QTWLu8lX85RivsFKNlL4Tylmx5lkJ3ktLsnZaTv
         oPIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oB3NQtRKRYuvuhwTSIgBlvvZWzEVsNHJ1ZgLBZyEvGE=;
        b=e5ea7iEfbD3A8h0cFQuXuALUo2jF/X847yibVQSt4Jem0tW5RN85qr++rK1I5r8Vqc
         DNjI9V91yls8Qwao2ocH3KSO11sOm0T2lYjbYrOzOZylwN6aTZvWnDQnRWo3y4G2+/aD
         Evp7xRCHNdZYJQuQAlDQPvx7XkE/OerQiRS3ygFFEFgQLQh4ID+kbif4N3NOOidH58we
         KlRQafAIuJdEkGUy6l55+DqVTh5/lTitr/TjSVHI91ofPn383s6SFhdS/JpoXheblJLz
         ffbZZDTdqfd3cZhEQVYycRIsz7enes9qpD72eQYOnhJiFpTcAhyU7l0gRFS4PoLmxl5f
         LExw==
X-Gm-Message-State: AOAM532ySeflQPtvUGU/ISmJLiwvO7158+cYxxvMKRrx+f8akBr1HdTI
        z/SJ5VEg82pzPAc/5kLM3pWVnqIWgWJAcw==
X-Google-Smtp-Source: ABdhPJytyz5H93dAQUCAc1IUT6soMBFop6b3vtOSWfLflmCnX5sRq67Y7zUTQf7LtDOCbOi+mvOf3w==
X-Received: by 2002:a1c:b7c4:: with SMTP id h187mr22487093wmf.178.1620596656203;
        Sun, 09 May 2021 14:44:16 -0700 (PDT)
Received: from localhost.localdomain ([170.253.36.171])
        by smtp.googlemail.com with ESMTPSA id u6sm16495530wml.6.2021.05.09.14.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 May 2021 14:44:15 -0700 (PDT)
From:   Alejandro Colomar <alx.manpages@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     Alejandro Colomar <alx.manpages@gmail.com>,
        linux-man@vger.kernel.org
Subject: [PATCH] bswap.3: bswap_*() are implemented using functions
Date:   Sun,  9 May 2021 23:39:23 +0200
Message-Id: <20210509213930.94120-29-alx.manpages@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210509213930.94120-1-alx.manpages@gmail.com>
References: <20210509213930.94120-1-alx.manpages@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

See <bits/byteswap.h> in glibc.
These macros call functions of the form __bswap_N(),
which use uintN_t.

Eventhough it's true that they are macros,
it's transparent to the user.

The user will see their results casted to unsigned types
after the conversion do to the underlying functions,
so it's better to document these as the underlying functions,
specifying the types.

Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>
---
 man3/bswap.3 | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/man3/bswap.3 b/man3/bswap.3
index 937ef0416..369daa411 100644
--- a/man3/bswap.3
+++ b/man3/bswap.3
@@ -29,19 +29,19 @@ bswap_16, bswap_32, bswap_64 \- reverse order of bytes
 .nf
 .B #include <byteswap.h>
 .PP
-.BI bswap_16( x );
-.BI bswap_32( x );
-.BI bswap_64( x );
+.BI "uint16_t bswap_16(uint16_t " x );
+.BI "uint32_t bswap_32(uint32_t " x );
+.BI "uint64_t bswap_64(uint64_t " x );
 .fi
 .SH DESCRIPTION
-These macros return a value in which the order of the bytes
+These functions return a value in which the order of the bytes
 in their 2-, 4-, or 8-byte arguments is reversed.
 .SH RETURN VALUE
-These macros return the value of their argument with the bytes reversed.
+These functions return the value of their argument with the bytes reversed.
 .SH ERRORS
-These macros always succeed.
+These functions always succeed.
 .SH CONFORMING TO
-These macros are GNU extensions.
+These functions are GNU extensions.
 .SH EXAMPLES
 The program below swaps the bytes of the 8-byte integer supplied as
 its command-line argument.
-- 
2.31.1

