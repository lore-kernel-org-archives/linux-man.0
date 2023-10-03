Return-Path: <linux-man-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F09BCE8FDAF
	for <linux-man@archiver.kernel.org>; Tue,  3 Oct 2023 19:51:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241026AbjJCTwA (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Tue, 3 Oct 2023 15:52:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240895AbjJCTwA (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Tue, 3 Oct 2023 15:52:00 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A4BF9E
        for <linux-man@vger.kernel.org>; Tue,  3 Oct 2023 12:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1696362716; x=1727898716;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u5PvBHarj/3WFts+7dc4pxyeAGYNvLTKp06lXpBuRGk=;
  b=R1XhjdY5GMPKb+X1MiEJcn1GESJSf6I6bAv0pQFNBjy5fmKV6U0rpp8w
   1zhl+CpRc/dXPgGKtPzGW3eHt53+a/7cvL9qy2IK1EWaY4KqPQ/P2ckQ3
   LMpMfOtstev2shviGq+2Pyq6Kzkdpewb8bYdU3zmBiG8nVhltjuPFWnfL
   jFR+qaKjIirgiWWvacJRQwlOad9jPgbH8Ve4P8TnlkMoecj6uzrwddajG
   anCSgM+ZlxFY5JBq9TeSMqybJgMF5fqoMhWlwSuAjbgfT3RjfV2F8uv3a
   SFgJbqz0gQ+GyZ9osRwnYKfIe22e/aHS7k7mtcZBxEyBftmG0iKsOh2mf
   g==;
X-CSE-ConnectionGUID: PERcvWxwSMWyMCgYNEDaRA==
X-CSE-MsgGUID: lJPhlaJeSb2Xeao81ePFDg==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; 
   d="scan'208";a="8177845"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 03 Oct 2023 12:51:56 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 3 Oct 2023 12:51:49 -0700
Received: from brunhilda.pdev.net (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Tue, 3 Oct 2023 12:51:49 -0700
From:   Don Brace <don.brace@microchip.com>
To:     <alx@kernel.org>
CC:     <linux-man@vger.kernel.org>
Subject: [PATCH v6 2/6] smartpqi: update FILES section
Date:   Tue, 3 Oct 2023 14:54:35 -0500
Message-ID: <20231003195439.253129-3-don.brace@microchip.com>
X-Mailer: git-send-email 2.42.0.296.g493f462273
In-Reply-To: <20231003195439.253129-1-don.brace@microchip.com>
References: <20231003195439.253129-1-don.brace@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Minor description changes for Device nodes.

Change "Logical drives" to "Disk drives".

Reviewed-by: Scott Benesh <scott.benesh@microchip.com>
Reviewed-by: Scott Teel <scott.teel@microchip.com>
Reviewed-by: Mike McGowen <mike.mcgowen@microchip.com>
Reviewed-by: Kevin Barnett <kevin.barnett@microchip.com>
Signed-off-by: Don Brace <don.brace@microchip.com>
---
 man4/smartpqi.4 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man4/smartpqi.4 b/man4/smartpqi.4
index e12d82296108..92bc5402b866 100644
--- a/man4/smartpqi.4
+++ b/man4/smartpqi.4
@@ -116,7 +116,7 @@ The valid range is 0 or [30, 1800]. The default value is 0,
 which causes the driver to use a timeout of 180 seconds.
 .SH FILES
 .SS Device nodes
-Logical drives are accessed via the SCSI disk driver
+Disk drives are accessed via the SCSI disk driver
 .RI ( sd ),
 tape drives via the SCSI tape driver
 .RI ( st ),
-- 
2.42.0.296.g493f462273

