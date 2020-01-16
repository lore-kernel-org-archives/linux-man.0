Return-Path: <SRS0=rlzB=3F=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 187D2C33CAF
	for <linux-man@archiver.kernel.org>; Thu, 16 Jan 2020 21:15:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E00D720728
	for <linux-man@archiver.kernel.org>; Thu, 16 Jan 2020 21:15:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387487AbgAPVPM (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Thu, 16 Jan 2020 16:15:12 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:51104 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729991AbgAPVPM (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Thu, 16 Jan 2020 16:15:12 -0500
Received: from 1.general.msalvatore.us.vpn ([10.172.66.92])
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <mike.salvatore@canonical.com>)
        id 1isCTu-0003Q5-I6; Thu, 16 Jan 2020 21:15:10 +0000
To:     mtk.manpages@gmail.com
Cc:     linux-man@vger.kernel.org
From:   Mike Salvatore <mike.salvatore@canonical.com>
Subject: [patch] getcwd.3: wfix
Message-ID: <bf93b481-e246-d281-f952-a7ece96aa697@canonical.com>
Date:   Thu, 16 Jan 2020 16:15:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

This patch is a minor wording fix in getcwd.3 that changes "In the case 
getcwd()" to "In the case of getcwd()". This patch should apply cleanly to the 
master branch of the git repository.

Regards,
Mike Salvatore

 From 3b68ad225dbaada2b1b55153dc57807b04531cd6 Mon Sep 17 00:00:00 2001
From: Mike Salvatore <mike.salvatore@canonical.com>
Date: Thu, 16 Jan 2020 16:08:08 -0500
Subject: [PATCH] getcwd.3: wfix

Signed-off-by: Mike Salvatore <mike.salvatore@canonical.com>
---
  man3/getcwd.3 | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/getcwd.3 b/man3/getcwd.3
index c8a691b4a..e5ed2c5d9 100644
--- a/man3/getcwd.3
+++ b/man3/getcwd.3
@@ -155,7 +155,7 @@ is deprecated.
  .SH RETURN VALUE
  On success, these functions return a pointer to a string containing
  the pathname of the current working directory.
-In the case
+In the case of
  .BR getcwd ()
  and
  .BR getwd ()
-- 
2.20.1

