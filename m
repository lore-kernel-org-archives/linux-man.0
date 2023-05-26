Return-Path: <linux-man-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2128C7EE23
	for <linux-man@archiver.kernel.org>; Fri, 26 May 2023 15:41:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244103AbjEZPlv (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Fri, 26 May 2023 11:41:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237396AbjEZPlv (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Fri, 26 May 2023 11:41:51 -0400
Received: from smtp92.iad3a.emailsrvr.com (smtp92.iad3a.emailsrvr.com [173.203.187.92])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D71BAA3
        for <linux-man@vger.kernel.org>; Fri, 26 May 2023 08:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
        s=20221208-6x11dpa4; t=1685115709;
        bh=1U7/KcdogV5bvJgRj7xc48RDmZMh7DUnYrGm0zDLo9A=;
        h=From:To:Subject:Date:From;
        b=tiJicjXhE+zL5s9rrj15TQjAl1+eLXb8JpBvoBXgR5WWCIznEDX/WfMwJBJpSCMIt
         tvGEa7nLPmAArPSS8Ap3+56COdFmsi2OBjGJikGZETon8GcDpqSW25Xpvx8qVUABI9
         5oheDihPXtbzzFK4ZeL4rP1I46SS8cx6AVoGIIPE=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp20.relay.iad3a.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id 6537D24949;
        Fri, 26 May 2023 11:41:48 -0400 (EDT)
From:   Ian Abbott <abbotti@mev.co.uk>
To:     Alejandro Colomar <alx@kernel.org>
Cc:     linux-man@vger.kernel.org, Ian Abbott <abbotti@mev.co.uk>
Subject: [PATCH v2] fgetc.3: Describe handling of ungetc(EOF, stream)
Date:   Fri, 26 May 2023 16:41:32 +0100
Message-Id: <20230526154132.26865-1-abbotti@mev.co.uk>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230526151941.25428-1-abbotti@mev.co.uk>
References: <20230526151941.25428-1-abbotti@mev.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Classification-ID: e3462b5f-09a4-4c70-bb01-2e2e72030bb6-1-1
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

As per the C standard, calling ungetc() with the character parameter
equal to EOF causes it to fail, returning EOF.

Signed-off-by: Ian Abbott <abbotti@mev.co.uk>
---
v2: Correct English grammar usage for "otherwise".
---
 man3/fgetc.3 | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/man3/fgetc.3 b/man3/fgetc.3
index 75dcaeaf6..751a00407 100644
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
+.BR EOF .
+Otherwise, it pushes
 .I c
 back to
 .IR stream ,
-- 
2.39.2

