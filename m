Return-Path: <SRS0=pEEh=DI=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8448C4727C
	for <linux-man@archiver.kernel.org>; Thu,  1 Oct 2020 15:07:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 930B6207F7
	for <linux-man@archiver.kernel.org>; Thu,  1 Oct 2020 15:07:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DKDPCen8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732339AbgJAPHB (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Thu, 1 Oct 2020 11:07:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732213AbgJAPHB (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Thu, 1 Oct 2020 11:07:01 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96D89C0613E2
        for <linux-man@vger.kernel.org>; Thu,  1 Oct 2020 08:07:00 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id c18so6187850wrm.9
        for <linux-man@vger.kernel.org>; Thu, 01 Oct 2020 08:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AwOZyVYQNg4ux1AD3RCkex0kGOjU2OZ3DDHKyxH9RQk=;
        b=DKDPCen87pG3VIOIkzj3PkoTE4PpVYpFSm7gEdVNWuuwphUFwIHuKNNBO/eZzE5LIW
         r5UrKOD7T/gdb8nnuw8GP64vLJLv3rDJUeKPGs2lDsA1dy71YVyi+Evg58ePvBn05BBP
         wGK2vIVipXLxYh/c+Ok+K6q5NwdvtxSN+yBJ+Fyt2iiRPgtSu9L4RiIUYsDIt7Iaxmun
         B4qn7rMp5fM8VDNqxxJoeMD0FnQrAujjkGNRoTsWC05TPGruz8vH6lWRCNq5YuzpCUik
         2ftiCw/05q5ote4UChK7H3dunXTWjiA42LNd3Tex79yGr+JCO5pvabseA11ojgwPExtg
         FkkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AwOZyVYQNg4ux1AD3RCkex0kGOjU2OZ3DDHKyxH9RQk=;
        b=LEdwAauy+HmTZTsvRzumpU3WehiDBG6XrobgdbJOSuEN/mDAZQxi/jAieKAzHuT15S
         HjKAel7JbpCiIZ5WYa7zyIC15ihr+nG9r0NIjOEJlFWPyYHPuxVl/DbG4A8ZEphMWnKa
         p7ZbEaDVj95LoRM/PtlqeyCDtlEROU0nMkA9tZpn5L87M6/STqH6hdLr3pGOwfnjOdTS
         7V/Xk74Jm++hjrf+yksG+bYHrIIer1LPqAamqs2iBI6lvcaXYGKJulBiN3lcGzDlZ/7S
         xVyPTAxaoNn+Pt6cSQTpefzdj4NFc5BHNRntsY0DeSkFsQ/SnvyHs403n4gQxOAa+7XW
         j97g==
X-Gm-Message-State: AOAM531NVPXtKNuCTNRwGMbDacYB6yf8eCm1hQA42Uxe5ohd2RryZu0k
        L0G4evdJRMLYPIhVjKONw/Y=
X-Google-Smtp-Source: ABdhPJxl7tN2/AvOmB1d+heczLc0/NMLrbwwHQigxUSjufNh7mRBApTgA05BA9cr7MIMkvjuZokgmw==
X-Received: by 2002:adf:f58b:: with SMTP id f11mr9509840wro.250.1601564819335;
        Thu, 01 Oct 2020 08:06:59 -0700 (PDT)
Received: from localhost.localdomain ([170.253.60.68])
        by smtp.googlemail.com with ESMTPSA id f5sm351238wmh.16.2020.10.01.08.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 08:06:58 -0700 (PDT)
From:   Alejandro Colomar <colomar.6.4.3@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     Alejandro Colomar <colomar.6.4.3@gmail.com>,
        linux-man@vger.kernel.org, gcc@gcc.gnu.org,
        libc-alpha@sourceware.org
Subject: [PATCH 1/2] system_data_types.7: Add 'void *'
Date:   Thu,  1 Oct 2020 17:06:38 +0200
Message-Id: <20201001150638.102544-2-colomar.6.4.3@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201001150638.102544-1-colomar.6.4.3@gmail.com>
References: <20201001150638.102544-1-colomar.6.4.3@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Signed-off-by: Alejandro Colomar <colomar.6.4.3@gmail.com>
---
 man7/system_data_types.7 | 42 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 40 insertions(+), 2 deletions(-)

diff --git a/man7/system_data_types.7 b/man7/system_data_types.7
index e42cf2557..f10f12754 100644
--- a/man7/system_data_types.7
+++ b/man7/system_data_types.7
@@ -679,7 +679,6 @@ See also the
 .I uintptr_t
 and
 .I void *
-.\" TODO: Document void *
 types in this page.
 .RE
 .\"------------------------------------- lconv ------------------------/
@@ -1781,7 +1780,6 @@ See also the
 .I intptr_t
 and
 .I void *
-.\" TODO: Document void *
 types in this page.
 .RE
 .\"------------------------------------- va_list ----------------------/
@@ -1815,6 +1813,46 @@ See also:
 .BR va_copy (3),
 .BR va_end (3)
 .RE
+.\"------------------------------------- void * -----------------------/
+.TP
+.I void *
+.RS
+According to the C language standard,
+a pointer to any object type may be converted to a pointer to
+.I void
+and back.
+POSIX further requires that any pointer,
+including pointers to functions,
+may be converted to a pointer to
+.I void
+and back.
+.PP
+Conversions from and to any other pointer type are done implicitly,
+not requiring casts at all.
+.PP
+The conversion specifier for
+.I void *
+for the
+.BR printf (3)
+and the
+.BR scanf (3)
+families of functions is
+.BR p ;
+resulting commonly in
+.B %p
+for printing
+.I void *
+values.
+.PP
+Conforming to:
+C99 and later; POSIX.1-2001 and later.
+.PP
+See also the
+.I intptr_t
+and
+.I uintptr_t
+types in this page.
+.RE
 .\"--------------------------------------------------------------------/
 .SH NOTES
 The structures described in this manual page shall contain,
-- 
2.28.0

