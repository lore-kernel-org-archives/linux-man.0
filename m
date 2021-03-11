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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D27BC43619
	for <linux-man@archiver.kernel.org>; Thu, 11 Mar 2021 22:34:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 340C064F8C
	for <linux-man@archiver.kernel.org>; Thu, 11 Mar 2021 22:34:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbhCKWeT (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Thu, 11 Mar 2021 17:34:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229900AbhCKWdx (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Thu, 11 Mar 2021 17:33:53 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBD46C061760
        for <linux-man@vger.kernel.org>; Thu, 11 Mar 2021 14:33:52 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id o26so2659470wmc.5
        for <linux-man@vger.kernel.org>; Thu, 11 Mar 2021 14:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=myGBFmTyq8yKUO/9bCCE9EWQo9Gph4cL/zgnQG+CavY=;
        b=f7l4VzDWYEMxc3HRtWWafyaA+UsZIbpRR2ZDVQOdDCkNpOmfcDwYnLlQMwVB+MR2rC
         R8Odj/qc9FpjutPOuIPBdvY07kjSKPA6rUYH8+IoG5iP2F8gL9fqV4PYeZpi2C/uYl+6
         8jvgGCgrqK4bGW7eiggFx0+BWl3wNeSRldbPxFG14ApJsiMz4EJX3BJvAqVBwTwDmbG/
         0jxTYDmKjYF2zKGGsNK6bJI3afKXo8xixQzkK/7CgwhuVl7CKK5zFjLAMfcwrUb0ts/h
         rOamWP7osXOgozbtGVwokxLGkq6y0U9MDb3he/QmqhPmi92G1lq1RXnLfDAJ/RbRwkR8
         uJYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=myGBFmTyq8yKUO/9bCCE9EWQo9Gph4cL/zgnQG+CavY=;
        b=my9XLV/v3BPGarmbDxZInBqgAnXK70k+WKDVqItIAYzmagwlvCG/tc5VuFV8K8Rb3I
         jkUcPeeUzmSnAHJtroEbIiGPLZBbpgh5IBjr4aLzBEebfffoTamGVv08dMjLRiif1aj3
         Ahwi68Cec86oskHCJkeVUqMFkFsppAViq3k7ut2nv63ctYYR1OHG0N7zDf7AhuDWYTP+
         3Fk/6vffr4TpCwQIeWg+HcJ1mkvyLUWkQ9GWaiuX7Wq70AQANHyMyis3adVx3lGN/4fi
         4T1pX66nGY3iVtkdR0aJFMiCpigWxJpa9HxnmIs1Supj6F7++6T32vhFLW8x5N9ut8uC
         NEMg==
X-Gm-Message-State: AOAM530g/yyYVQyDViUH5BurLLWM0pbjEV+0lfSOBdzvQsQSnrh1Rimy
        X4+mHeBzqUO7TxC8bUwQHROlBWYvf8g=
X-Google-Smtp-Source: ABdhPJyOlK5Qv/x7vKMNCOqiIwTZej2GPlz+bwVC7FrvJM6+WqoeLpaJFh8uZkfHxd7nIsEjjnLkOQ==
X-Received: by 2002:a1c:6a05:: with SMTP id f5mr10053202wmc.75.1615502031708;
        Thu, 11 Mar 2021 14:33:51 -0800 (PST)
Received: from localhost.localdomain ([170.253.36.171])
        by smtp.googlemail.com with ESMTPSA id v2sm22365771wmj.1.2021.03.11.14.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 14:33:51 -0800 (PST)
From:   Alejandro Colomar <alx.manpages@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     Alejandro Colomar <alx.manpages@gmail.com>,
        linux-man@vger.kernel.org, libc-alpha@sourceware.org
Subject: [PATCH 12/17] wcsrtombs.3: SYNOPSIS: Use 'restrict' in prototypes
Date:   Thu, 11 Mar 2021 23:33:25 +0100
Message-Id: <20210311223330.722437-13-alx.manpages@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210311223330.722437-1-alx.manpages@gmail.com>
References: <20210311223330.722437-1-alx.manpages@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Both POSIX and glibc use 'restrict' in wcsrtombs().
Let's use it here too.

.../glibc$ grep_glibc_prototype wcsrtombs
wcsmbs/wchar.h:343:
extern size_t wcsrtombs (char *__restrict __dst,
			 const wchar_t **__restrict __src, size_t __len,
			 mbstate_t *__restrict __ps) __THROW;
.../glibc$

Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>
---
 man3/wcsrtombs.3 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man3/wcsrtombs.3 b/man3/wcsrtombs.3
index df5518080..b5e9a68ad 100644
--- a/man3/wcsrtombs.3
+++ b/man3/wcsrtombs.3
@@ -20,8 +20,8 @@ wcsrtombs \- convert a wide-character string to a multibyte string
 .nf
 .B #include <wchar.h>
 .PP
-.BI "size_t wcsrtombs(char *" dest ", const wchar_t **" src ,
-.BI "                 size_t " len ", mbstate_t *" ps );
+.BI "size_t wcsrtombs(char *restrict " dest ", const wchar_t **restrict " src ,
+.BI "                 size_t " len ", mbstate_t *restrict " ps );
 .fi
 .SH DESCRIPTION
 If
-- 
2.30.1

