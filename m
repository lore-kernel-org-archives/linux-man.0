Return-Path: <SRS0=qeIG=EC=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C149C5517A
	for <linux-man@archiver.kernel.org>; Tue, 27 Oct 2020 16:21:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3E9F821556
	for <linux-man@archiver.kernel.org>; Tue, 27 Oct 2020 16:21:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L0ZMlDrU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1808744AbgJ0QVb (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Tue, 27 Oct 2020 12:21:31 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:37033 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1808746AbgJ0QV3 (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Tue, 27 Oct 2020 12:21:29 -0400
Received: by mail-wr1-f65.google.com with SMTP id w1so2609134wrm.4
        for <linux-man@vger.kernel.org>; Tue, 27 Oct 2020 09:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YBEbTSbmKWImcwfQ+AAdKi1H8P/aEwwIKbQuJfbNp2g=;
        b=L0ZMlDrURSWFM2Fj1MG2gBWxT3M2lSQRZRDDMsk3xpMEmV0u9dnyE65fOPmq3IeKGm
         KuLppNDEVMPmdhH5tSAkNvJnehH8SkILblHQd7gy50MGmSmMtiqlkyCudsBUuvHaJMdG
         RNK8d7NqJ+nD4HnL3b+y5iCGifnrckNL2595znVvhikm824T0Fdn/+0VhR4gsH/YLohI
         nTzMetDpUBSbhcn6DQfm+DEijiLhSJliejAfXfF7rf8CSo224uyi43LK0dAxzvqaU02c
         UkJ0Ivla9LjyTwTnPdaoZpNSWyqIfUiGhXGVXGSnhRFWOOOnmU5LLzpe/PFvE3KgCINE
         97tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YBEbTSbmKWImcwfQ+AAdKi1H8P/aEwwIKbQuJfbNp2g=;
        b=VGMfanWH4IgNRUOfxlCKI9Y+qeoHS3ki9hj2PdkseQpPo4sOXpPVfIDuD2ZLc3l0gx
         SNxLAA6CMwXzPl9d8LRWy/Rpt7jM6ES9CC3T42/bNpAcBJ+z7SUIS/o8kCT020p9NMoU
         tA3tPw2Vtk6QjhqfQ2vaeCDokDuI5JoTQyAkXSbu5cUBQpX7yvuuZr19J3sxR4ARH+g1
         3IiNIBW7AU6vL5w0lUOXHZjOl6lwG3N2S3idT5P8whrlNf94jY3WMug+pC3QsVoQpQQk
         //utL8FGs+mcTomBgZxDI43OyDi17FqxB28PmAt512/FQiMm5k2GsvthYTmPYmqUqXaV
         ZeFA==
X-Gm-Message-State: AOAM531g5Rhvcvwn/IW0hPiJ8pcw6VABuJWWslS05w9Hml6VepSxxwRC
        yVwTimyBflmWA5G55o4vA3ikx7uh4+c=
X-Google-Smtp-Source: ABdhPJwwXzipYMGabO2seK8pbkuvybG2AIcqVI4WvodIqgNX5L+xyUkpCzM39C1CjPzFH3QGxyxCyw==
X-Received: by 2002:adf:fc08:: with SMTP id i8mr4039334wrr.116.1603815688053;
        Tue, 27 Oct 2020 09:21:28 -0700 (PDT)
Received: from localhost.localdomain ([170.253.60.68])
        by smtp.googlemail.com with ESMTPSA id u5sm3108839wru.63.2020.10.27.09.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 09:21:27 -0700 (PDT)
From:   Alejandro Colomar <colomar.6.4.3@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     Alejandro Colomar <colomar.6.4.3@gmail.com>,
        linux-man@vger.kernel.org, libc-alpha@sourceware.org
Subject: [PATCH 5/6] system_data_types.7: Add 'off64_t'
Date:   Tue, 27 Oct 2020 17:21:13 +0100
Message-Id: <20201027162114.47521-6-colomar.6.4.3@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201027162114.47521-1-colomar.6.4.3@gmail.com>
References: <20201027162114.47521-1-colomar.6.4.3@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Signed-off-by: Alejandro Colomar <colomar.6.4.3@gmail.com>
---
 man7/system_data_types.7 | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/man7/system_data_types.7 b/man7/system_data_types.7
index 313cf059e..0558060d3 100644
--- a/man7/system_data_types.7
+++ b/man7/system_data_types.7
@@ -751,6 +751,37 @@ and
 .I off_t
 types in this page.
 .RE
+.\"------------------------------------- off64_t ----------------------/
+.TP
+.I off64_t
+.RS
+.IR Include :
+.IR <sys/types.h> .
+.PP
+Used for file sizes.
+It is a 64-bit signed integer type.
+.PP
+.IR "Conforming to" :
+Present in glibc.
+It is not standardized by the C language standard nor POSIX.
+.PP
+.IR Notes :
+The feature test macro
+.B _LARGEFILE64_SOURCE
+has to be defined for this type to be available.
+.PP
+.IR "See also" :
+.BR readahead (2),
+.BR sync_file_range (2),
+.BR lseek64 (3),
+.BR feature_test_macros (7)
+.PP
+See also the
+.I loff_t
+and
+.I off_t
+types in this page.
+.RE
 .\"------------------------------------- off_t ------------------------/
 .TP
 .I off_t
-- 
2.28.0

