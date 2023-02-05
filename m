Return-Path: <linux-man-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85DA7C636D4
	for <linux-man@archiver.kernel.org>; Sun,  5 Feb 2023 23:59:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbjBEX7L (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sun, 5 Feb 2023 18:59:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjBEX7K (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sun, 5 Feb 2023 18:59:10 -0500
Received: from omta002.cacentral1.a.cloudfilter.net (omta002.cacentral1.a.cloudfilter.net [3.97.99.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 764BF1422C
        for <linux-man@vger.kernel.org>; Sun,  5 Feb 2023 15:59:09 -0800 (PST)
Received: from shw-obgw-4003a.ext.cloudfilter.net ([10.228.9.183])
        by cmsmtp with ESMTP
        id OjxVpsn6jl2xSOouapRIho; Sun, 05 Feb 2023 23:59:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1675641548; bh=6ZxJp9F1huItBYuq2UcqzOG0Dx11SY/DCAl+u5lkMoE=;
        h=From:To:Cc:Subject:Date;
        b=jAelI+C11rIjkiBNy99URkPZDpdl5zOZKjNvP/KI+UMiyyYTZI8GIqtK/x8uxADeG
         cR6tl62F/la+OEHg9TJUCUsQ4490HPbYVUwsethrnOVYNO2rH71j5nkvUtccSb1vHB
         ECk/wap4nBa6hFjykLjPIK8XfYaAmMNz/qPWMWXzBg/7ABMTtyA0+kl4KqI4Ym00B9
         l7p3m5PNah/aZZLJUFLSAB0gSTXEGTZtIc6OV/W0VYYyUz1IIqFAuFQURrlfoq5Fee
         H/Tt/+2dqrGZQwZyo4OPFxWdYMBHE/TWYMxx4f/RBVKrv2AYYhFI+NNFuLLudCmBGV
         NBkaxBc2SBqaA==
Received: from localhost.localdomain ([184.64.124.72])
        by cmsmtp with ESMTP
        id OouZp57sIcyvuOouZpez0a; Sun, 05 Feb 2023 23:59:08 +0000
X-Authority-Analysis: v=2.4 cv=VbHkgXl9 c=1 sm=1 tr=0 ts=63e042cc
 a=oHm12aVswOWz6TMtn9zYKg==:117 a=oHm12aVswOWz6TMtn9zYKg==:17
 a=r77TgQKjGQsHNAKrUKIA:9 a=fXi9tmOXr48sxnaAg-8A:9 a=QEXdDO2ut3YA:10
 a=zvtHh1bzAPjQFlfCYOsA:9 a=B2y7HmGcmWMA:10
From:   Brian Inglis <Brian.Inglis@Shaw.ca>
To:     Linux Man-Pages <linux-man@vger.kernel.org>
Cc:     Alejandro Colomar <alx.manpages@gmail.com>
Subject: [PATCH 05/11] man2/reboot.2: show BCD dates in hex not decimal
Date:   Sun,  5 Feb 2023 16:58:49 -0700
Message-Id: <20230205235855.64261-1-Brian.Inglis@Shaw.ca>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------2.39.0"
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfAF81WZdtbx8eITBnLO7AcTGmehy2FTw04atSTpMH7/TpO0izShDHLxzr5cWCRJJvdaphQ+0MKUbBzs2tiYw4EkTrF5YJKS+EqmyZ1cCbJwd2bR9AUj/
 tOTbDWSBzOwk54lbc+5sExrsLX/F8tQg53xyGlZXAssiP7Lr8m3/p0nJMNpbwc2q4/XVrEe5kFd98FnmNUUdyJ/nK+3tCdPtZQB0BFO8IpD4ycIBgRuQXXOB
 Gckbm+sIT70QGyRLgfwkWlUucCeNnPtUUj2Vk42MPJF0OgNcOV9WtbWLW355PkJZ
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

This is a multi-part message in MIME format.
--------------2.39.0
Content-Type: text/plain; charset=UTF-8; format=fixed
Content-Transfer-Encoding: 8bit

---
 man2/reboot.2 | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)


--------------2.39.0
Content-Type: text/x-patch; name="0005-man2-reboot.2-show-BCD-dates-in-hex-not-decimal.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment; filename="0005-man2-reboot.2-show-BCD-dates-in-hex-not-decimal.patch"

diff --git a/man2/reboot.2 b/man2/reboot.2
index fcdc56a93e38..d20fdf31a451 100644
--- a/man2/reboot.2
+++ b/man2/reboot.2
@@ -51,16 +51,16 @@ equals
 .I magic2
 equals
 .B LINUX_REBOOT_MAGIC2
-(that is, 672274793).
+(that is, 0x28121969).
 However, since Linux 2.1.17 also
 .B LINUX_REBOOT_MAGIC2A
-(that is, 85072278)
+(that is, 0x05121996)
 and since Linux 2.1.97 also
 .B LINUX_REBOOT_MAGIC2B
-(that is, 369367448)
+(that is, 0x16041998)
 and since Linux 2.5.71 also
 .B LINUX_REBOOT_MAGIC2C
-(that is, 537993216)
+(that is, 0x20112000)
 are permitted as values for
 .IR magic2 .
 (The hexadecimal values of these constants are meaningful.)

--------------2.39.0--


