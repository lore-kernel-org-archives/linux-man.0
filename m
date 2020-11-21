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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E47EC388F9
	for <linux-man@archiver.kernel.org>; Sat, 21 Nov 2020 17:39:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F23A822201
	for <linux-man@archiver.kernel.org>; Sat, 21 Nov 2020 17:39:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tHzWwUV+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbgKURjh (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sat, 21 Nov 2020 12:39:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726305AbgKURjh (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sat, 21 Nov 2020 12:39:37 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4913C0613CF
        for <linux-man@vger.kernel.org>; Sat, 21 Nov 2020 09:39:36 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id a186so11162215wme.1
        for <linux-man@vger.kernel.org>; Sat, 21 Nov 2020 09:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=flUyRx2GhEKQqIT6P1BSFIyX7Xqjuyc7v4Xmf6EJxWw=;
        b=tHzWwUV+vV4NlLuukv3Te0oNS35uHWF6QcUWsXwDej/4gGLLxh+jORsngo+atbEi3J
         Njsw5rKp9IPgYxvgO+0yOLcVH0QmQq04GFuOgskhzrnwBAVqlZOBkcrRPw8TzNiIb2f5
         dpKAQWJvm8ygVQQKEiv0Iz8Aw65+lTroJ6cCsQ1jukDG3AMP08DGR6zxQdcMg7YiI6r2
         Eyk6yU+FhtfqIN34nWU15jVO8IH403vbA3FT+FU0VgXhiD1pax91NJC/w+pD7B8rTv8k
         HXaPW6MZ4B6pbPxaFPYv3faX6PyOjwLNDV8iUDXV3oLuP8DtAopHMF11PM3idX5giGK8
         eFlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=flUyRx2GhEKQqIT6P1BSFIyX7Xqjuyc7v4Xmf6EJxWw=;
        b=n1bNg7wUC81CIeAaztHtuijHWUYXAuC9vCurkitnyR3RTZazWrr3+nANgkwUDcQyFv
         SPdo0aHZOtMD0+m2piUEbKQxWTYvPx/Rv5qcWimNDlxAozDV9h2nr7B2XFTeZq6GgHB1
         FOlchiMDpc+t7hGt9cVt10K7wm6WHPeG7FB/KznJXpQ/Ee9tSj+Lr6zVTmu9COGyBAz/
         NM5qas5jpTpjGucl1CiweDzJGNStypnufbbtmVpqlzpTheyn9Y2S7RPm931PMgBRgPR/
         UkDfh008TyEp8SyMAeD3Oh2iS01Ll+o1YpLgRKsoiwuT0M9Aq4DDBclDx4x2MHkof+K7
         N5Ng==
X-Gm-Message-State: AOAM530MA3Qwwb7chLGWlJRzxa+ejVuLQxZQT/BDO78IbH7UGhSoICQ/
        sKSl5M2NuoZe+UtyaFWTNv8=
X-Google-Smtp-Source: ABdhPJwuMnRpZ29d0Wd2GHdlRufqSWr+EXGmyQvBj/ZmJ3m6tOgeshIAgaa9ERWrGfnCx1wdWotmyQ==
X-Received: by 2002:a1c:e455:: with SMTP id b82mr15795841wmh.117.1605980375083;
        Sat, 21 Nov 2020 09:39:35 -0800 (PST)
Received: from localhost.localdomain ([170.253.51.130])
        by smtp.gmail.com with ESMTPSA id d3sm9282887wre.91.2020.11.21.09.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2020 09:39:34 -0800 (PST)
From:   Alejandro Colomar <alx.manpages@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     Alejandro Colomar <alx.manpages@gmail.com>,
        linux-man@vger.kernel.org
Subject: [PATCH] utmp.5: Oxford comma
Date:   Sat, 21 Nov 2020 18:39:04 +0100
Message-Id: <20201121173903.12429-1-alx.manpages@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Found using:
$ grep -rn '\\f., [^ ]*\\f. and' man?

I also updated the markup in that paragraph: \f -> .

Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>
---
 man5/utmp.5 | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/man5/utmp.5 b/man5/utmp.5
index 3b8340858..3b8afc199 100644
--- a/man5/utmp.5
+++ b/man5/utmp.5
@@ -176,9 +176,18 @@ records may be located by
 .PP
 When
 .BR init (1)
-finds that a process has exited, it locates its utmp
-entry by \fIut_pid\fP, sets \fIut_type\fP to \fBDEAD_PROCESS\fP, and
-clears \fIut_user\fP, \fIut_host\fP and \fIut_time\fP with null bytes.
+finds that a process has exited, it locates its utmp entry by
+.IR ut_pid ,
+sets
+.I ut_type
+to
+.BR DEAD_PROCESS ,
+and clears
+.IR ut_user ,
+.IR ut_host ,
+and
+.I ut_time
+with null bytes.
 .PP
 .BR xterm (1)
 and other terminal emulators directly create a
-- 
2.29.2

