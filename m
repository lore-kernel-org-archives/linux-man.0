Return-Path: <linux-man-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EBE0C77B7A
	for <linux-man@archiver.kernel.org>; Fri, 26 May 2023 15:27:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237335AbjEZP13 (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Fri, 26 May 2023 11:27:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231158AbjEZP13 (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Fri, 26 May 2023 11:27:29 -0400
X-Greylist: delayed 424 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 26 May 2023 08:27:05 PDT
Received: from smtp96.iad3a.emailsrvr.com (smtp96.iad3a.emailsrvr.com [173.203.187.96])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ABEF10E7
        for <linux-man@vger.kernel.org>; Fri, 26 May 2023 08:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
        s=20221208-6x11dpa4; t=1685114400;
        bh=FwVw9MgTxvt44ViSdejFatlPoUFlkncQBgSDK7m6iEo=;
        h=From:To:Subject:Date:From;
        b=mqWLm0o8rq2d6m7dW67rqMmu1yp3u8kBPiqYT8R76Ewy4G6kIXdrgU01/LXWXZ3J5
         W4Ho20iykQFD5ZkD004StcJ1dYwQqSvESMQyr8nF2cZ/B/ncRc0imNy7BHcrSUHebb
         4M3ilmmFP03gwBT4wE67ZTQnUivdZ7QrEUJcJIO0=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp5.relay.iad3a.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id A896D2532B;
        Fri, 26 May 2023 11:19:59 -0400 (EDT)
From:   Ian Abbott <abbotti@mev.co.uk>
To:     Alejandro Colomar <alx@kernel.org>
Cc:     linux-man@vger.kernel.org, Ian Abbott <abbotti@mev.co.uk>
Subject: [PATCH] fgetc.3: Describe handling of ungetc(EOF, stream)
Date:   Fri, 26 May 2023 16:19:41 +0100
Message-Id: <20230526151941.25428-1-abbotti@mev.co.uk>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Classification-ID: 3f8bdd6b-cfdb-4050-9b47-a576a593079d-1-1
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

As per the C standard, calling ungetc() with the character parameter
equal to EOF causes it to fail, returning EOF.

Signed-off-by: Ian Abbott <abbotti@mev.co.uk>
---
 man3/fgetc.3 | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/man3/fgetc.3 b/man3/fgetc.3
index 75dcaeaf6..d6bf62327 100644
--- a/man3/fgetc.3
+++ b/man3/fgetc.3
@@ -62,7 +62,13 @@ A terminating null byte (\[aq]\e0\[aq])
 is stored after the last character in the buffer.
 .PP
 .BR ungetc ()
-pushes
+returns
+.B EOF
+if the value of
+.I c
+equals that of the macro
+.BR EOF ,
+otherwise it pushes
 .I c
 back to
 .IR stream ,
-- 
2.39.2

