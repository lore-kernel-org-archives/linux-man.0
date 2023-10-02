Return-Path: <linux-man-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFBB8E74919
	for <linux-man@archiver.kernel.org>; Mon,  2 Oct 2023 19:51:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238950AbjJBTvS (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 2 Oct 2023 15:51:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238933AbjJBTvR (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Mon, 2 Oct 2023 15:51:17 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DCA291
        for <linux-man@vger.kernel.org>; Mon,  2 Oct 2023 12:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1696276275; x=1727812275;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NmmoouRFpcFfCXk1lGzWHULRNCZ8+WliGa5i3a2rGp4=;
  b=kao8QphiPM0nAWCccE/ked/CstuEotOSOchLY3ThJG3mcKCwArrkrst5
   Qi4OdauSsc98stkZHhPE1q4wtRHlrLBbLa0iLMT1y/Ec/7+XHbkuRFqvd
   yXmhBGnqEMC7x87HoM5KUqTSrPPsjreBzHy3xwkqag6r+upsRVQkWL+ml
   j/51BJZ918B2LLuhXVMae7TOJqH3frFltj1rG2iVr50lqnkQPGlXKi8D7
   uqO4k4te6sBGLCxu8CbD0pVOOEUX2UrclAygsJPK87b/l114qtAfU6OXU
   DIySvaDOmx6P9UDrNi2G9aY2aOPrXZUaU26C64jNYQaS0cq+vQenX9YvA
   w==;
X-CSE-ConnectionGUID: wxLD4crfTBmP3fcAafztCg==
X-CSE-MsgGUID: k16GGXpAQdGt2gC+YxFFlg==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="238286351"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Oct 2023 12:51:14 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 2 Oct 2023 12:51:14 -0700
Received: from brunhilda.pdev.net (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Mon, 2 Oct 2023 12:51:13 -0700
From:   Don Brace <don.brace@microchip.com>
To:     <alx@kernel.org>
CC:     <linux-man@vger.kernel.org>
Subject: [PATCH v4 2/5] smartpqi: update FILES section
Date:   Mon, 2 Oct 2023 14:54:01 -0500
Message-ID: <20231002195404.153182-3-don.brace@microchip.com>
X-Mailer: git-send-email 2.42.0.296.g493f462273
In-Reply-To: <20231002195404.153182-1-don.brace@microchip.com>
References: <20231002195404.153182-1-don.brace@microchip.com>
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
index 5ccbbe1c4ef1..34864e60755b 100644
--- a/man4/smartpqi.4
+++ b/man4/smartpqi.4
@@ -115,7 +115,7 @@ for controller ready. The valid range is 0 or 30-1800. The default value
 is 0, which causes the driver to use a timeout of 180 seconds.
 .SH FILES
 .SS Device nodes
-Logical drives are accessed via the SCSI disk driver
+Disk drives are accessed via the SCSI disk driver
 .RI ( sd ),
 tape drives via the SCSI tape driver
 .RI ( st ),
-- 
2.42.0.296.g493f462273

