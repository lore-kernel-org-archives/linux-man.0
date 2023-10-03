Return-Path: <linux-man-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF9D0E8FDB3
	for <linux-man@archiver.kernel.org>; Tue,  3 Oct 2023 19:51:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241035AbjJCTwB (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Tue, 3 Oct 2023 15:52:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240981AbjJCTwA (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Tue, 3 Oct 2023 15:52:00 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 797BC93
        for <linux-man@vger.kernel.org>; Tue,  3 Oct 2023 12:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1696362717; x=1727898717;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kGq8xmiJWFK2Q+9S93VopJ4bRaBoSj12J4Aq7e15V4I=;
  b=w9WTiH94dKX/kykTrTzhX6e+SfjJC3X9B8gnMTgCaV+D/l6LFr0K2rC1
   aMwku1ncJuVHGMrhb79mH/1lCAr2k8QI1qMxr72v4Zy3j20J8H41Vkj2c
   nh3obpmYZni9f+w7ofzhtDHCgIiP64y9oS4oCZImwBdeuMuK71+1FiHOk
   EBqYuAu27qPXDyoil8RKNumvuclfOMZfAkIW9Pg1Pj75qwvA/8wHrravS
   tEqNimCYgbjoeUSv/a/6bJR1xLew1FcdFvvywsa+/O+fZe0f2JpTOrC5d
   0NTKsC4p5WYvmypaNePeNip/N2yfrqYr787IbAXYWKjODOX4k37R4XQkg
   g==;
X-CSE-ConnectionGUID: meeTLBFeSJ2hm6xK2zVK2g==
X-CSE-MsgGUID: xPCQXF4SQRej8Ele+N2mNQ==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; 
   d="scan'208";a="7932342"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 03 Oct 2023 12:51:55 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 3 Oct 2023 12:51:51 -0700
Received: from brunhilda.pdev.net (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Tue, 3 Oct 2023 12:51:50 -0700
From:   Don Brace <don.brace@microchip.com>
To:     <alx@kernel.org>
CC:     <linux-man@vger.kernel.org>
Subject: [PATCH v6 6/6] smartpqi: add HISTORY section
Date:   Tue, 3 Oct 2023 14:54:39 -0500
Message-ID: <20231003195439.253129-7-don.brace@microchip.com>
X-Mailer: git-send-email 2.42.0.296.g493f462273
In-Reply-To: <20231003195439.253129-1-don.brace@microchip.com>
References: <20231003195439.253129-1-don.brace@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Enumerate old sysfs entries replaced by newer entries.

Suggested-by: Alejandro Colomar <alx@kernel.org>
Signed-off-by: Don Brace <don.brace@microchip.com>
---
 man4/smartpqi.4 | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/man4/smartpqi.4 b/man4/smartpqi.4
index 7477ee714e5b..4a2d44d6101b 100644
--- a/man4/smartpqi.4
+++ b/man4/smartpqi.4
@@ -468,6 +468,13 @@ refer to the User Guide for the controller,
 which can be found by searching for the specific controller at
 .UR https://www.microchip.com/design-centers/storage
 .UE .
+.SH HISTORY
+.I /sys/class/scsi_host/host*/version
+was replaced by two sysfs entries:
+.IP
+.I /sys/class/scsi_host/host*/driver_version
+.IP
+.I /sys/class/scsi_host/host*/firmware_version
 .SH SEE ALSO
 .BR cciss (4),
 .BR hpsa (4),
-- 
2.42.0.296.g493f462273

