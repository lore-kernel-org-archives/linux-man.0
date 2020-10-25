Return-Path: <SRS0=EgWi=EA=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED174C5517A
	for <linux-man@archiver.kernel.org>; Sun, 25 Oct 2020 09:37:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B14E92225E
	for <linux-man@archiver.kernel.org>; Sun, 25 Oct 2020 09:37:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h+30Sswl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1414869AbgJYJhO (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sun, 25 Oct 2020 05:37:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1414867AbgJYJhN (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sun, 25 Oct 2020 05:37:13 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39F07C0613D0
        for <linux-man@vger.kernel.org>; Sun, 25 Oct 2020 02:37:13 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id s9so8717196wro.8
        for <linux-man@vger.kernel.org>; Sun, 25 Oct 2020 02:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bvARcU6hfWaEKpxggJ8hlpovH82zzk3JbPnktz8aXkg=;
        b=h+30SswlIqwOkOrbcGSjpQA8KjL4ian56QjzsnXvRemT8ftJJApQGdY+EJ1sMDWj6i
         RffU3d1zC41MKSPNkP9YWTkhwZqRdyBdKPBEzYLogw+SOOOdbDxTEmG66dhWLfeeq/Xl
         7ojkwhyJO5NmNfGjNMXnGpkEgdTL4v5lCYu9d6uPk6E4zrr1y6ZPaBfzEWUCI/3DlDlZ
         sxCMfW2+EVoBEdUhaLPC2DF9e2OAF5evSWu59k+8LsQ5uyrM4IXK+XSmcOcB9BHS7elv
         rhXoFz6VxmErtPRMQRLLgNz4jPgD6lD09fWqXumFfN5DLe1LAA+pk5NFL5bWpL6FrU7E
         bD6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bvARcU6hfWaEKpxggJ8hlpovH82zzk3JbPnktz8aXkg=;
        b=IrOmIurrOYxLmeNw4WaZl8uz13iKxJzCa/qn1+O3ZnME+RcP4g9uXV/tyvmLDiyZtp
         YulQ2LCC2/LdlXhdD+DNIoI6um3iGhb0W1NJwnHz3NVrEqeJNGhbkEC20iT5GlcCSWEg
         7oOw3D5NGIkTArpRk77uLJxMGBfJlLVGhfpYe5XN0OXZRwwZJC5j8ZNBfTLQ/sUq5UIu
         FcEdNbxjagKmoxVagrX1SUCIoBLqwD2hdrI57fTRLMwsqm1WyDBEYGZZmt7KwBlyXXkY
         fzq9/pHOWU+YLHdDdoSva6A1d3/JtURLBsTch+I5MFRxTXXR7X+iUctQi1SEA7noNBiI
         cdvg==
X-Gm-Message-State: AOAM531kCFJnFNu0IJVDP/UMnUxnO5B9hGPlBWahGNT/gtT2N0SVhm9s
        02G5HRsO7vpcsYwO9FXMDdI=
X-Google-Smtp-Source: ABdhPJx+JhOgy10SH6kqSm7+sRVqE0kSX0IOa1pcluvn+Qh2MtChtzG4S7Y6ayjoV9v8ipPY63npFA==
X-Received: by 2002:adf:8bdd:: with SMTP id w29mr12929575wra.276.1603618631964;
        Sun, 25 Oct 2020 02:37:11 -0700 (PDT)
Received: from localhost.localdomain ([170.253.60.68])
        by smtp.googlemail.com with ESMTPSA id m8sm15776446wrw.17.2020.10.25.02.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2020 02:37:11 -0700 (PDT)
From:   Alejandro Colomar <colomar.6.4.3@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     Alejandro Colomar <colomar.6.4.3@gmail.com>,
        linux-man@vger.kernel.org, libc-alpha@sourceware.org
Subject: [PATCH 01/10] tailq.3: New page that will hold the (tailq) contents of queue.3
Date:   Sun, 25 Oct 2020 10:36:43 +0100
Message-Id: <20201025093651.4616-2-colomar.6.4.3@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201025093651.4616-1-colomar.6.4.3@gmail.com>
References: <20201025093651.4616-1-colomar.6.4.3@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Signed-off-by: Alejandro Colomar <colomar.6.4.3@gmail.com>
---
 man3/tailq.3 | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 man3/tailq.3

diff --git a/man3/tailq.3 b/man3/tailq.3
new file mode 100644
index 000000000..c53b3ca4c
--- /dev/null
+++ b/man3/tailq.3
@@ -0,0 +1,40 @@
+.\" Copyright (c) 1993
+.\"    The Regents of the University of California.  All rights reserved.
+.\" and Copyright (c) 2020 by Alejandro Colomar <colomar.6.4.3@gmail.com>
+.\"
+.\" %%%LICENSE_START(BSD_3_CLAUSE_UCB)
+.\" Redistribution and use in source and binary forms, with or without
+.\" modification, are permitted provided that the following conditions
+.\" are met:
+.\" 1. Redistributions of source code must retain the above copyright
+.\"    notice, this list of conditions and the following disclaimer.
+.\" 2. Redistributions in binary form must reproduce the above copyright
+.\"    notice, this list of conditions and the following disclaimer in the
+.\"    documentation and/or other materials provided with the distribution.
+.\" 3. Neither the name of the University nor the names of its contributors
+.\"    may be used to endorse or promote products derived from this software
+.\"    without specific prior written permission.
+.\"
+.\" THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
+.\" ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+.\" IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+.\" ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
+.\" FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
+.\" DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
+.\" OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
+.\" HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
+.\" LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
+.\" OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
+.\" SUCH DAMAGE.
+.\" %%%LICENSE_END
+.\"
+.\"
+.TH TAILQ 3 2020-10-21 "GNU" "Linux Programmer's Manual"
+.SH NAME
+.SH SYNOPSIS
+.SH DESCRIPTION
+.SH RETURN VALUE
+.SH CONFORMING TO
+.SH BUGS
+.SH EXAMPLES
+.SH SEE ALSO
-- 
2.28.0

