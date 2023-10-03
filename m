Return-Path: <linux-man-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1129E8FDB1
	for <linux-man@archiver.kernel.org>; Tue,  3 Oct 2023 19:51:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241007AbjJCTwA (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Tue, 3 Oct 2023 15:52:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240981AbjJCTv7 (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Tue, 3 Oct 2023 15:51:59 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0991A1
        for <linux-man@vger.kernel.org>; Tue,  3 Oct 2023 12:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1696362716; x=1727898716;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b5Ak0utOPyrLwMrYWntg7GTpynz+z3rEuuPGF5w13uY=;
  b=W/FWyAueSlnUSwUhf1V7k500QLAe/Mh23+aEToqWjV1ttp0shVEZeXa7
   VVzQZzNl1jL3Xs3HeoBZelFu4OxyxS3bij6jluL8lrL5ertUpr01Sicg0
   zdtkSLahxYkzH1fzL1afRBVRThkrCf29osxE9GqPKdVSe2eeddrTOnOmM
   9EqDIQ7RpbUWS4Tyrd9skWGgvFn2nUoHg+tvnEtPNcwXATtPzG3Y2A5Uu
   TyxBCvAuYFbjg1kZxkdiK/e+eulHzqm6b/b3gcnV6hElKyVZ0mZM6osix
   Ysc3yi5KL+eTuDWOiag5QQBhudmZsaVeMKPP9SJ9NPqp0KEJ5ttQeOjjO
   A==;
X-CSE-ConnectionGUID: meeTLBFeSJ2hm6xK2zVK2g==
X-CSE-MsgGUID: EcPiEMAlQO6jLxVtFXCE4Q==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; 
   d="scan'208";a="7932340"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 03 Oct 2023 12:51:54 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 3 Oct 2023 12:51:49 -0700
Received: from brunhilda.pdev.net (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Tue, 3 Oct 2023 12:51:49 -0700
From:   Don Brace <don.brace@microchip.com>
To:     <alx@kernel.org>
CC:     <linux-man@vger.kernel.org>
Subject: [PATCH v6 1/6] smartpqi: add module parameter ctrl_ready_timeout
Date:   Tue, 3 Oct 2023 14:54:34 -0500
Message-ID: <20231003195439.253129-2-don.brace@microchip.com>
X-Mailer: git-send-email 2.42.0.296.g493f462273
In-Reply-To: <20231003195439.253129-1-don.brace@microchip.com>
References: <20231003195439.253129-1-don.brace@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Allow user to change the length of time that the driver
will wait for the controller to become ready.

Reviewed-by: Scott Benesh <scott.benesh@microchip.com>
Reviewed-by: Scott Teel <scott.teel@microchip.com>
Reviewed-by: Mike McGowen <mike.mcgowen@microchip.com>
Reviewed-by: Kevin Barnett <kevin.barnett@microchip.com>
Signed-off-by: Don Brace <don.brace@microchip.com>
---
 man4/smartpqi.4 | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/man4/smartpqi.4 b/man4/smartpqi.4
index 32f9240e37f2..e12d82296108 100644
--- a/man4/smartpqi.4
+++ b/man4/smartpqi.4
@@ -17,6 +17,7 @@ smartpqi \- Microchip Smart Storage SCSI driver
 .RB [ expose_ld_first= { 0 | 1 }]
 .RB [ hide_vsep= { 0 | 1 }]
 .RB [ disable_managed_interrupts= { 0 | 1 }]
+.RB [ ctrl_ready_timeout= { 0 | [30, 1800] }]
 .YS
 .SH DESCRIPTION
 .B smartpqi
@@ -107,6 +108,12 @@ Disables driver utilization of Linux kernel managed interrupts for controllers.
 The managed interrupts feature automatically distributes interrupts
 to all available CPUs and assigns SMP affinity.
 The default value is 0 (managed interrupts enabled).
+.TP
+.BR ctrl_ready_timeout= { 0 | [30, 1800] }
+This option specifies the timeout in seconds for the driver to wait
+for the controller to be ready.
+The valid range is 0 or [30, 1800]. The default value is 0,
+which causes the driver to use a timeout of 180 seconds.
 .SH FILES
 .SS Device nodes
 Logical drives are accessed via the SCSI disk driver
-- 
2.42.0.296.g493f462273

