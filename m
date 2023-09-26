Return-Path: <linux-man-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28450E7E65A
	for <linux-man@archiver.kernel.org>; Tue, 26 Sep 2023 19:13:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235674AbjIZTNH (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Tue, 26 Sep 2023 15:13:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235687AbjIZTNE (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Tue, 26 Sep 2023 15:13:04 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC078136
        for <linux-man@vger.kernel.org>; Tue, 26 Sep 2023 12:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1695755578; x=1727291578;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Gj8DIF1T1uNBINTrLbSg0eI92yaSz/EIFbhzA1iAvyA=;
  b=iaOmh/0cvpxgIH8sTA6vJJotRmpanP9eXlPEn84QIHtJzpTPBif8p2KI
   X0qCzmo1WUWeuxv6hr4t2c3Vqy9npeqkWBqTJQ9buuDjo8B5IIuckErUM
   IbIr7aibXcFjIs94pT8Js3DYWAU5DNMuFlSae+gPP0OAF+elFV5B5xkxN
   c4v184Hp/cBXjgmgh+mltlNTNUy6hEbx/B0WAqsyazoxoFh/A+TDg1j7m
   SgNn4z91V0n3tl9BoeaFo+R8nOX/ZX4gt5+iyHFDRtNr2GL0TPVIr77nz
   Pr0mOL8UbNqc+BNPA50wSfZzfUe6GR4/1T5jImSJkT4mpHcL1VdUzVz+7
   g==;
X-CSE-ConnectionGUID: QkVnHYi7QvGtzdlA0nOndg==
X-CSE-MsgGUID: SKDCFb7WSUKc9VQkqEposQ==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="237306756"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 26 Sep 2023 12:12:56 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 26 Sep 2023 12:12:55 -0700
Received: from brunhilda.pdev.net (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Tue, 26 Sep 2023 12:12:55 -0700
From:   Don Brace <don.brace@microchip.com>
To:     <mtk.manpages@gmail.com>, <alx@kernel.org>
CC:     <linux-man@vger.kernel.org>
Subject: [PATCH v3 07/10] smartpqi: update device attribute descriptions
Date:   Tue, 26 Sep 2023 14:12:02 -0500
Message-ID: <20230926191206.627678-8-don.brace@microchip.com>
X-Mailer: git-send-email 2.42.0.158.g94e83dcf5b
In-Reply-To: <20230926191206.627678-1-don.brace@microchip.com>
References: <20230926191206.627678-1-don.brace@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Small updates to device attribute descriptions.

Reviewed-by: Scott Benesh <scott.benesh@microchip.com>
Reviewed-by: Scott Teel <scott.teel@microchip.com>
Reviewed-by: Mike McGowen <mike.mcgowen@microchip.com>
Reviewed-by: Kevin Barnett <kevin.barnett@microchip.com>
Signed-off-by: Don Brace <don.brace@microchip.com>
---
 man4/smartpqi.4 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man4/smartpqi.4 b/man4/smartpqi.4
index 165eee6848c3..635b3fa185ab 100644
--- a/man4/smartpqi.4
+++ b/man4/smartpqi.4
@@ -250,7 +250,7 @@ is the logical unit number (LUN).
 The
 .I raid_level
 attribute is read-only.
-This attribute contains the RAID level of each logical drive.
+This attribute contains the RAID level of the logical volume.
 .IP
 For example:
 .IP
@@ -266,7 +266,7 @@ RAID 0
 The
 .I sas_address
 attribute is read-only.
-This attribute contains the unique identifier of the disk.
+This attribute contains the SAS address of the device.
 .IP
 For example:
 .IP
-- 
2.42.0.158.g94e83dcf5b

