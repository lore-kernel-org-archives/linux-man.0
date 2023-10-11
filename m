Return-Path: <linux-man-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68182CDB47C
	for <linux-man@archiver.kernel.org>; Wed, 11 Oct 2023 19:00:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232997AbjJKTAl (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Wed, 11 Oct 2023 15:00:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233070AbjJKTAk (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Wed, 11 Oct 2023 15:00:40 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B01C90
        for <linux-man@vger.kernel.org>; Wed, 11 Oct 2023 12:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1697050839; x=1728586839;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CgN8erIPG66f9xfBEd48UrB4IFudWXJ1g+D2GlZXvTM=;
  b=NfWHpysZcqTxOxdxxxSomDI7Dxkk/BBbvef2CyCbfBpRB/0AsYAt+w0p
   MnXT/6w21Sggyqz1l+nXSqhui53Gnyy6RimPly6bIErfy43VIc7RT0yGe
   iDG7fOY9MrG5bXuj9yPa4omUVQzPxsHg0vKi5Q7IZRQEeraEG794JfGyR
   pazkC7vC97UBTFZh8LpSO2YdIR8O8zfMXr6lPEq3ss4ijAaZ2Wtiz5jye
   D0+c6cvFjarRX4dEOYlAZtXhNDkPol0dObx8iMix1aA8P8tvR5y8dcOOm
   hAWdUWZJeZ2jhqxKOXtwooZPTvTiA6eRCPnOJQ8F/y9IO4qpigkLRMXwy
   g==;
X-CSE-ConnectionGUID: pm9Ss1vOTz6bptA6m+j7Tg==
X-CSE-MsgGUID: EptaTHsbQm+4PevKj6lSKA==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; 
   d="scan'208";a="10302995"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Oct 2023 12:00:38 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 11 Oct 2023 12:00:25 -0700
Received: from brunhilda.pdev.net (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Wed, 11 Oct 2023 12:00:24 -0700
From:   Don Brace <don.brace@microchip.com>
To:     <alx@kernel.org>
CC:     <linux-man@vger.kernel.org>
Subject: [PATCH v7 1/4] smartpqi: update host attribute descriptions
Date:   Wed, 11 Oct 2023 14:00:21 -0500
Message-ID: <20231011190024.42728-2-don.brace@microchip.com>
X-Mailer: git-send-email 2.42.0.345.gaab89be2eb
In-Reply-To: <20231011190024.42728-1-don.brace@microchip.com>
References: <20231011190024.42728-1-don.brace@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Minor description changes for host attributes.

Just some small changes to the host attribute descriptions.
Remove the "version" sysfs entry. This entry was changed
to two sysfs entries: driver_version and firmware_version.

Reviewed-by: Scott Benesh <scott.benesh@microchip.com>
Reviewed-by: Scott Teel <scott.teel@microchip.com>
Reviewed-by: Mike McGowen <mike.mcgowen@microchip.com>
Reviewed-by: Kevin Barnett <kevin.barnett@microchip.com>
Signed-off-by: Don Brace <don.brace@microchip.com>
---
 man4/smartpqi.4 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man4/smartpqi.4 b/man4/smartpqi.4
index 393545d3728d..1e5b6d76f548 100644
--- a/man4/smartpqi.4
+++ b/man4/smartpqi.4
@@ -138,12 +138,12 @@ The host
 attribute is a write-only attribute.
 Writing to this attribute will cause the driver to scan for new,
 changed, or removed devices (e.g., hot-plugged tape drives, or newly
-configured or deleted logical drives) and notify the SCSI mid-layer of
+configured or deleted logical volumes) and notify the SCSI mid-layer of
 any changes detected.
 Usually this action is triggered automatically by configuration
 changes, so the user should not normally have to write to this file.
 Doing so may be useful when hot-plugging devices such as tape drives or
-entire storage boxes containing pre-configured logical drives.
+entire storage boxes containing pre-configured logical volumes.
 .TP
 .IR /sys/class/scsi_host/host * /version
 The host
-- 
2.42.0.345.gaab89be2eb

