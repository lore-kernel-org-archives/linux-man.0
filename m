Return-Path: <linux-man-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83ACFC64EC7
	for <linux-man@archiver.kernel.org>; Sat, 25 Feb 2023 10:57:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229458AbjBYK5M (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sat, 25 Feb 2023 05:57:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjBYK5M (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sat, 25 Feb 2023 05:57:12 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ACBDCC1F
        for <linux-man@vger.kernel.org>; Sat, 25 Feb 2023 02:57:11 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id r7so1658327wrz.6
        for <linux-man@vger.kernel.org>; Sat, 25 Feb 2023 02:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xXTBjv5G4SoVxL0GChLyGI+5/nura4pZEnicSCcgZ/w=;
        b=g5JPf+36UyVKIDYoxnF85rB5fG9Qh/Bukqm57ATvP7I1p7V2hvCXOlP13jwrgW+UZD
         Wer3P6B/xrRs01MAl5meqljNdHupTZ7EdxdHE2c40X9ZJ5N4Sz9qYuAWqjyte/uAq/2o
         4RZ/vC9BV8fHtJZaEYV4jgPlK4TRBtQtJygyMHKnjTvPdVHgce95SWPPOa/dhaV4UITm
         WKS9P21OYCpHjQQV4+1slb9AP2kYS0h6krJPmi9koGkcSdu/k5uLO5+oPek2R2Yg8AFY
         D+qsaVkGSVvxBPcxfWL+9roTp/cVDYtM6IFCXZqn06etZpJlBlDNm/AOyvTl7UfFhuVh
         unvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xXTBjv5G4SoVxL0GChLyGI+5/nura4pZEnicSCcgZ/w=;
        b=rTrvo7pD01h4sWKxvhAux9FPdwt41R1QfT8BQNtW574clCtWBsUoA23M61s21+zPVE
         qFD66b6IF1dLZwx/jdefUaVIsDTbvyGfULejF4Q+JHLcX6jPU3xbM3ky3M5WNjZFU9Mf
         yKE32DTqYFS8Y9VNCCbs7n9+IujlV399qHTbuh+nZrnG1Cthyn3RHemd0j78A7cwE74s
         GZ5dWqa52gm+2fUq7aLSMLhW+8nN5ka1KOb1kOetCaF3MpTCrhcpzpe2MIwhMP9NJWYO
         YC8XjmQUzKXpM2ulIAT1Qo15Q/Opqk/OX06GFp9XW/hQbGcyfPE5AMW7dCbOVlb7UYfF
         lPag==
X-Gm-Message-State: AO0yUKVA44RrhvYiJGO9OBBV1XeU+F0MTO3FLQI1lUIMyLEV+gQOC8Wf
        tVo3tgM7XS+wh8qd17u3NbYe32nxoug=
X-Google-Smtp-Source: AK7set9SRe4nEFbVVJkxAloen72iNWIma7kO0zMOR0ef4wQjSdL4om5frJcHzLLi+WbbPyAVlEJ+gA==
X-Received: by 2002:a5d:50c4:0:b0:2c5:5ef8:fa3c with SMTP id f4-20020a5d50c4000000b002c55ef8fa3cmr17385712wrt.52.1677322629452;
        Sat, 25 Feb 2023 02:57:09 -0800 (PST)
Received: from localhost.localdomain ([2a02:587:6e15:d61a:5cc8:cceb:8cd5:6326])
        by smtp.gmail.com with ESMTPSA id c10-20020a5d4f0a000000b002c54911f50bsm1435449wru.84.2023.02.25.02.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Feb 2023 02:57:06 -0800 (PST)
From:   Fotios Valasiadis <fvalasiad@gmail.com>
To:     linux-man@vger.kernel.org
Cc:     alx.manpages@gmail.com, mtk.manpages@gmail.com,
        lineprinter0@gmail.com, Fotios Valasiadis <fvalasiad@gmail.com>,
        "Dmitry V . Levin" <ldv@strace.io>
Subject: [PATCH] ptrace.2: Add details about usage of PTRACE_GET_SYSCALL_INFO
Date:   Sat, 25 Feb 2023 12:56:01 +0200
Message-Id: <20230225105601.6079-1-fvalasiad@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Document the role of PTRACE_O_TRACESYSGOOD option in connection with PTRACE_GET_SYSCALL_INFO.

Signed-off-by: Fotios Valasiadis <fvalasiad@gmail.com>
Cowritten-by: Dmitry V. Levin <ldv@strace.io>
Complements: fc91449cb "ptrace.2: Document PTRACE_GET_SYSCALL_INFO"
---
 man2/ptrace.2 | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/man2/ptrace.2 b/man2/ptrace.2
index 55d9fd36d..ad0543b0b 100644
--- a/man2/ptrace.2
+++ b/man2/ptrace.2
@@ -1111,6 +1111,15 @@ stop.
 .B PTRACE_SYSCALL_INFO_NONE
 No component of the union contains relevant information.
 .RE
+.IP
+Note that in case of
+syscall entry or exit stops, the data returned by
+.B PTRACE_GET_SYSCALL_INFO
+is limited to type
+.B PTRACE_SYSCALL_INFO_NONE
+unless
+.B PTRACE_O_TRACESYSGOOD
+option is set before the corresponding ptrace stop has occurred.
 .\"
 .SS Death under ptrace
 When a (possibly multithreaded) process receives a killing signal
-- 
2.39.2

