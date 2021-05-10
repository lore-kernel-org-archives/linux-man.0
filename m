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
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3B97C433B4
	for <linux-man@archiver.kernel.org>; Mon, 10 May 2021 17:56:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C43B9610FA
	for <linux-man@archiver.kernel.org>; Mon, 10 May 2021 17:56:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233289AbhEJR6E (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 10 May 2021 13:58:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232654AbhEJR6E (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Mon, 10 May 2021 13:58:04 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1D1DC061574
        for <linux-man@vger.kernel.org>; Mon, 10 May 2021 10:56:57 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id d4so17521853wru.7
        for <linux-man@vger.kernel.org>; Mon, 10 May 2021 10:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZnGiNPpnl4zTiZh46oCJ46cAdiY6iB3b5ES3yuphXmw=;
        b=HnH4Um83rr97Psdr2bbGtg0jwCCZu1EjsAR59JvPGgCAw+7/KdAf3p+F9mkwNZ83HB
         MtO4E3hVG3IZgs5ercmBJPcIwbvIJAKDA904OrDsJMHrsqcsoJxmgnpXoN9cVrKY7q7D
         zShU3DMnFJwlo1jyinEmigL2dEN15a9bm/ZODh93USmoJYhza10iZshkGasBTXmzfOMk
         fnvOSnBERDZOyUOHOnqmx9RPcX/c2jE1aMB93YGCvVcDbNRwXIVE7zwjHAP543/iVd5c
         w8+bpKhSHiW4AzTGA2NiUjr4jyiV85pd4+L5kcF1dIsG8Xn1ET02EvtZGbgVKNbm0XbJ
         JWIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZnGiNPpnl4zTiZh46oCJ46cAdiY6iB3b5ES3yuphXmw=;
        b=a3xEXWufWKgmKy7xzFi/wxjV6+3HPtYHOKi/3xJUSjNxS9wOypTs7Q45/xTuuhDCpr
         haZAhfZdJXNPwtmB13V8LtawiquSgv8Jm49Krho4tx+cv0UoSlHaVMfXKcM7qbopCYhR
         sBtN/bWnpQRbU6ChIpmAHkjAWrbdBm/MG300vHBoyloBqG6m+KLRkmySmFDnPSOQNQQk
         jnyK6cHpl81tTO1hboh6zqoRZPT3XOV28y09Y+0D5XtBTYGD/L6dCQvhHClAkvqTwf9L
         S9ryqatD2GcR8grZd77DEWSebS25a3AmTEOJYb+LQORNVQk20hFooiP9iraXd9CLeaXQ
         rvKg==
X-Gm-Message-State: AOAM532Uz2QS7mkbK4qRHMW6me753uXWaTRXzOTtnJI1A09sve1JkrhI
        7gHwFF5bk/OvM7WZn04MrvA=
X-Google-Smtp-Source: ABdhPJwyGr7OyzsFfX/JK8zc2alJi0004ZSOOG0pjjwxF/13irhXX+HI78z2K4MjDBA+u1nyByDiGw==
X-Received: by 2002:adf:ec82:: with SMTP id z2mr31890967wrn.214.1620669416525;
        Mon, 10 May 2021 10:56:56 -0700 (PDT)
Received: from sqli.sqli.com ([195.53.121.100])
        by smtp.googlemail.com with ESMTPSA id m13sm24318830wrw.86.2021.05.10.10.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 10:56:56 -0700 (PDT)
From:   Alejandro Colomar <alx.manpages@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     Florian Weimer <fweimer@redhat.com>, Jakub Wilk <jwilk@jwilk.net>,
        Alejandro Colomar <alx.manpages@gmail.com>,
        linux-man@vger.kernel.org, libc-alpha@sourceware.org
Subject: [PATCH 27/39] openat2.2: Use syscall(SYS_...); for system calls without a wrapper; fix includes too
Date:   Mon, 10 May 2021 19:55:36 +0200
Message-Id: <20210510175546.28445-28-alx.manpages@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210510175546.28445-1-alx.manpages@gmail.com>
References: <20210510175546.28445-1-alx.manpages@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>
---
 man2/openat2.2 | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/man2/openat2.2 b/man2/openat2.2
index 1662bd066..efa840206 100644
--- a/man2/openat2.2
+++ b/man2/openat2.2
@@ -26,16 +26,21 @@
 openat2 \- open and possibly create a file (extended)
 .SH SYNOPSIS
 .nf
-.B #include <sys/stat.h>
-.B #include <fcntl.h>
-.B #include <linux/openat2.h>
+.BR "#include <fcntl.h>" \
+"          /* Definition of " O_* " and " S_* " constants */"
+.BR "#include <linux/openat2.h>" "  /* Definition of " RESOLVE_* " constants */"
+.BR "#include <sys/syscall.h>" "    /* Definition of " SYS_* " constants */"
+.B #include <unistd.h>
 .PP
-.BI "long openat2(int " dirfd ", const char *" pathname ,
-.BI "            struct open_how *" how ", size_t " size );
+.BI "long syscall(SYS_openat2, int " dirfd ", const char *" pathname ,
+.BI "             struct open_how *" how ", size_t " size );
 .fi
 .PP
 .IR Note :
-There is no glibc wrapper for this system call; see NOTES.
+glibc provides no wrapper for
+.BR openat2 (),
+necessitating the use of
+.BR syscall (2).
 .SH DESCRIPTION
 The
 .BR openat2 ()
@@ -494,9 +499,6 @@ The semantics of
 were modeled after FreeBSD's
 .BR O_BENEATH .
 .SH NOTES
-Glibc does not provide a wrapper for this system call; call it using
-.BR syscall (2).
-.\"
 .SS Extensibility
 In order to allow for future extensibility,
 .BR openat2 ()
-- 
2.31.1

