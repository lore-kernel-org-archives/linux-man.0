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
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDC93C433E0
	for <linux-man@archiver.kernel.org>; Mon, 15 Feb 2021 13:17:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AEA6864E26
	for <linux-man@archiver.kernel.org>; Mon, 15 Feb 2021 13:17:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230104AbhBONRT (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 15 Feb 2021 08:17:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230098AbhBONRQ (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Mon, 15 Feb 2021 08:17:16 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C790C06178A
        for <linux-man@vger.kernel.org>; Mon, 15 Feb 2021 05:16:26 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id l12so8877596wry.2
        for <linux-man@vger.kernel.org>; Mon, 15 Feb 2021 05:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P2cjEIFkuciR/M8+N/u1ua689/M2hgEKGNDcWkOnGHQ=;
        b=fUv2OUHYRbbs9Yf0k3EyJcXny0OJBBHSuAebN7zDqXnvggS3g3vfRL+jSyKbJGzqHq
         ZwyHkNKhQ6b69sxdtcz6thVC45akS+euMuKqhD7EEKYQkpbHdTslHsp2YL/rURah1Bbs
         5Kju/ZKfhVv5wsgQ5bLsVioLOHBkfZcoylvObAO8DoRsWymuyMpyjI9wScM874NOJRYF
         lkzuAoekgqJfRYlIiWYJ5PmPKj80Gc8dGDwbTT+7VEf0QxZu+woxq7OxIVAhMq61D9AX
         VNZUUjcgU9OUXTf5AxP3AWDdDhm9qaTN4WzGcVzRG6Et8d0ulutn/Mny8/JraU8Okza+
         UoFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P2cjEIFkuciR/M8+N/u1ua689/M2hgEKGNDcWkOnGHQ=;
        b=Df6M9ZlqJn+WgcT7mFoJLw7dtJpVE6bKJu887524H7RuRSUiw+rrEN8suXefpc6Yku
         YzNUz/CwMJa5PjydZ2Sks6/k2+HjW9RWS8hCTQazEax3Z3JUXkOXnl+OR8u+LrUOuEPH
         Ia++lon4uoxnq6dJ+EeK8eD0iyDN5v3xTybHd+KPrnGxedQCjH9+HUqS+lFolxh2GvLh
         /dTWZNB3GKAW94s7qC8cqrUh4dfOrFVoJgcNaw1xSTvksR3mU3S7k/PB8vabg2II0nZE
         46Ee/9yI6im+UrBYGDOZT6j7hMbRPWCPh7/Cu9Q0ZWzk1skRvcYpROxYn/TYj4AzcuMY
         lnuw==
X-Gm-Message-State: AOAM5309uW+oKPlnJ+smFQgB3USuvJXcjqXZWdsWI5IbFm+pToJkSqg0
        dbkbqWjasYk9KdfmrkfjhuPT8QRmULM=
X-Google-Smtp-Source: ABdhPJyNkN1YddS+SEOMVuHaKuwwP4xZpN3q6Ck1EmQKZs4OGInYm//Je7u/XwUO2O4SWmjr9gaKEg==
X-Received: by 2002:a5d:44cf:: with SMTP id z15mr18751914wrr.191.1613394984963;
        Mon, 15 Feb 2021 05:16:24 -0800 (PST)
Received: from debian.vlc ([170.253.51.130])
        by smtp.gmail.com with ESMTPSA id d15sm19309504wru.80.2021.02.15.05.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 05:16:24 -0800 (PST)
From:   Alejandro Colomar <alx.manpages@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     Alejandro Colomar <alx.manpages@gmail.com>,
        linux-man@vger.kernel.org
Subject: [PATCH] s390_pci_mmio_write.2: SYNOPSIS: Add 'const' qualifier
Date:   Mon, 15 Feb 2021 14:15:10 +0100
Message-Id: <20210215131522.450666-1-alx.manpages@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

s390_pci_mmio_write() uses 'const void *' instead of 'void *'.
Fix it.

......

.../linux$ grep_syscall s390_pci_mmio_write
arch/s390/pci/pci_mmio.c:119:
SYSCALL_DEFINE3(s390_pci_mmio_write, unsigned long, mmio_addr,
		const void __user *, user_buffer, size_t, length)
.../linux$

Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>
---
 man2/s390_pci_mmio_write.2 | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/man2/s390_pci_mmio_write.2 b/man2/s390_pci_mmio_write.2
index a9088c25f..9bee6a21f 100644
--- a/man2/s390_pci_mmio_write.2
+++ b/man2/s390_pci_mmio_write.2
@@ -30,10 +30,10 @@ MMIO memory page
 .nf
 .B #include <asm/unistd.h>
 .PP
-.BI "int s390_pci_mmio_write(unsigned long " mmio_addr ","
-.BI "                        void *" user_buffer ", size_t " length ");"
-.BI "int s390_pci_mmio_read(unsigned long " mmio_addr ","
-.BI "                        void *" user_buffer ", size_t " length ");"
+.BI "int s390_pci_mmio_write(unsigned long " mmio_addr ,
+.BI "                       const void *" user_buffer ", size_t " length );
+.BI "int s390_pci_mmio_read(unsigned long " mmio_addr ,
+.BI "                       void *" user_buffer ", size_t " length );
 .fi
 .PP
 .IR Note :
-- 
2.30.0

