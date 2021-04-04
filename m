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
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBF20C43470
	for <linux-man@archiver.kernel.org>; Sun,  4 Apr 2021 11:59:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C8EF061365
	for <linux-man@archiver.kernel.org>; Sun,  4 Apr 2021 11:59:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230449AbhDDL7z (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sun, 4 Apr 2021 07:59:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230446AbhDDL7z (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sun, 4 Apr 2021 07:59:55 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D592CC061756
        for <linux-man@vger.kernel.org>; Sun,  4 Apr 2021 04:59:50 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id j18so8598165wra.2
        for <linux-man@vger.kernel.org>; Sun, 04 Apr 2021 04:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xbl3Scz+Whx5QdNUVdsmqGH+HBuFLIhFEIq1ddPemjU=;
        b=lk4ShBJKJF5Zss5tam3OEld5UjQfNGc0vrlbcCbI9WDdGv+bwJ7IcLYSaF78bWyamt
         xiegyTRGxNYt9Ms7eHxBF+ObLtfWI5dWDZX39Yq+4khFJrz0+D1WmC/wOYydbaKdGpRT
         NVeWM3ZEJUlX3BAaDzvDZ95o4yNfJtGhIbnWG0Ua/l7QAPvUgNua4osyhLG7Hsb9f4mC
         rzq8yN2k0CuSI/e+t16RbyHtF4EmbJguVnkHfyGAKiiQAQpCmNUb1VKSXagqVxVBLw2H
         KGEsSArSX4K+kBwfx/gPyIz3jC8GCNsU90S8R4zm7edRtDzQkGt1v51VA88UX48Yo5b/
         urMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xbl3Scz+Whx5QdNUVdsmqGH+HBuFLIhFEIq1ddPemjU=;
        b=SxhbqQ6/mg1gAdP8IAs588FlHGEYQDu6Xd3d1IqvxaKSOQ8iSRaXBz49ZTm1tYibIl
         OeCNtOhVTj72pV3uOsYsEQ27LqV4POXoIbAgA8HiiRqCXVyRLUT2I1yUI4tUKi25upsd
         UBnktQ6179lCiuthf8nXQBV9/IFXdL1KdEI0mdHIB+UVVnR2CQRw91p8fhdX4dBHXHg7
         gsaz6qf2BNnPrkPms7+p7BRBRYFjbiw+fW5wYXPQXSr0Kf1AXKnmA1Wkj4OZpHTz6GYE
         mJa24f/3PDDjhd7qZXo/I4Qlongvc0YqpOOjBGpM/BzqWO5BVPTGHRViF8fTLJzXJ9F8
         pkMw==
X-Gm-Message-State: AOAM531FamUC90x6JbW/czR0qatqC6mvEP5hmEBdjGlSFE8Xdxn+Kvfu
        QUHG9ASgt368NmvmCFCTMy4=
X-Google-Smtp-Source: ABdhPJz10uorz7kosqPgXgbFbzRGXzb+WP320MIbrA0KIw3KAvXTDMhNHIDTD7qyb8HiF6S3NqvYEw==
X-Received: by 2002:a5d:424c:: with SMTP id s12mr25042794wrr.161.1617537589661;
        Sun, 04 Apr 2021 04:59:49 -0700 (PDT)
Received: from localhost.localdomain ([170.253.36.171])
        by smtp.googlemail.com with ESMTPSA id u2sm23786967wrp.12.2021.04.04.04.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 04:59:49 -0700 (PDT)
From:   Alejandro Colomar <alx.manpages@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     Alejandro Colomar <alx.manpages@gmail.com>,
        linux-man@vger.kernel.org, libc-alpha@sourceware.org
Subject: [PATCH v5 24/35] getunwind.2: Use syscall(SYS_...); for system calls without a wrapper
Date:   Sun,  4 Apr 2021 13:58:37 +0200
Message-Id: <20210404115847.78166-25-alx.manpages@gmail.com>
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
 man2/getunwind.2 | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/man2/getunwind.2 b/man2/getunwind.2
index 45535dccf..2c44506c7 100644
--- a/man2/getunwind.2
+++ b/man2/getunwind.2
@@ -29,16 +29,14 @@
 getunwind \- copy the unwind data to caller's buffer
 .SH SYNOPSIS
 .nf
-.B #include <syscall.h>
 .B #include <linux/unwind.h>
+.BR "#include <sys/syscall.h>" "      /* Definition of " SYS_* " constants */"
+.B #inlcude <unistd.h>
 .PP
-.BI "long getunwind(void " *buf ", size_t " buf_size );
+.BI "long syscall(SYS_getunwind, void " *buf ", size_t " buf_size );
 .fi
-.PP
-.IR Note :
-There is no glibc wrapper for this system call; see NOTES.
 .SH DESCRIPTION
-.I Note: this function is obsolete.
+.I Note: this system call is obsolete.
 .PP
 The
 IA-64-specific
@@ -102,9 +100,5 @@ and is available only on the IA-64 architecture.
 This system call has been deprecated.
 The modern way to obtain the kernel's unwind data is via the
 .BR vdso (7).
-.PP
-Glibc does not provide a wrapper for this system call;
-in the unlikely event that you want to call it, use
-.BR syscall (2).
 .SH SEE ALSO
 .BR getauxval (3)
-- 
2.31.0

