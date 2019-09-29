Return-Path: <SRS0=Bd6V=XY=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F616C4360C
	for <linux-man@archiver.kernel.org>; Sun, 29 Sep 2019 03:01:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1EC202082F
	for <linux-man@archiver.kernel.org>; Sun, 29 Sep 2019 03:01:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="in0Cgfja"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728696AbfI2DBt (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sat, 28 Sep 2019 23:01:49 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:39233 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728569AbfI2DBt (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sat, 28 Sep 2019 23:01:49 -0400
Received: by mail-qt1-f193.google.com with SMTP id n7so12409644qtb.6
        for <linux-man@vger.kernel.org>; Sat, 28 Sep 2019 20:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=nVabI4r0kWg2EE6O+87WdKa2V8ufKiiplYeRRiqlIOs=;
        b=in0CgfjaXgJW4vEAspczhdNTD+2vKe6NPXfQ7GVBUS98naR5ARYOV27OAaYjD7ie1r
         qjNBlR7+a+8Cr1HHO7zRFutv3g7OVcvOJBRLm3et7GcTZ7/A5DSgy+MHBeH4FuRACCMF
         Py6BdJjp0aqEEIuESI/jBYySh5lneUKXz7X/fYO3yGPEb8TXgzAFuXxX2dIxb+V401TS
         4FMWlCyzutRohbHT5KS7w/GEqbM545bBBNkg1M9OBAjVIC2OntnurhTcAijuRKSWTEnz
         5000yDSqj5ZjpCx60Z7QRJrPTWOChP3bfbsh1cBoazplSy0ZoRa5tbOsEJUSuH5S83fl
         IjqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=nVabI4r0kWg2EE6O+87WdKa2V8ufKiiplYeRRiqlIOs=;
        b=PzPXYQ/PB5XGXvMJWLvd6B1orRTM9BZrp/ZSs7JUa/dsT3AoFLg38ANLOBSJpqPkrT
         n4PKJAVVYwl+dBjSKTF2u9aHkrkSeBDIqpdQDy2PGgXKHfD3lq9vyu7SBpF5+A9usom4
         KKnHZod8zyKtufrxF2n52m/tcsqV1vg2NTQmw1mXe8As/O3EPwJoSoh2k6Owq0GxeWOk
         6V2YxJWEV68B4JAHiTrzfAjFKPTudIbV6wIWt1k3cxyVOVb6NiFZuf5xaHfQ/srtDCam
         jfzzEaYNv14Ui+I+uK+p8sBESuF+R9fk1oy7Iiao0e3i5kbBECzc14jUQM3TjZc9mkCD
         5BhA==
X-Gm-Message-State: APjAAAXEdQkzkmQxO3yU5GALs8xDCa6JqxOkGOJIwNWxUlrPkGcBBDqY
        bJ+r91DUbeGIHE3XewyDVw9YUcXF/9GS0LeFIYU=
X-Google-Smtp-Source: APXvYqyTZFmSC/C4+zJWtn42yge79rwYMcYB2M2/YhgXuZfKBdoNfuf0abu22lwYux8kathrg+7hLGcEbPzbxo3wtNo=
X-Received: by 2002:ac8:342a:: with SMTP id u39mr18361856qtb.7.1569726108424;
 Sat, 28 Sep 2019 20:01:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0c:ad6d:0:0:0:0:0 with HTTP; Sat, 28 Sep 2019 20:01:47
 -0700 (PDT)
From:   "Joseph C. Sible" <josephcsible@gmail.com>
Date:   Sat, 28 Sep 2019 23:01:47 -0400
Message-ID: <CABpewhH=F8OV_RNOhuH6HAPnMj7eUMJ_+qD6F+HZgvP0D+OhGQ@mail.gmail.com>
Subject: [patch] open.2: Document fs.protected_fifos and fs.protected_regular
To:     mtk.manpages@gmail.com
Cc:     linux-man@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

The sysctls fs.protected_fifos and fs.protected_regular can cause
open(2) to fail with EACCES (see Documentation/sysctl/fs.txt for
details.)

Signed-off-by: Joseph C. Sible <josephcsible@gmail.com>
---
 man2/open.2 | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/man2/open.2 b/man2/open.2
index b0f485b..9ee42b2 100644
--- a/man2/open.2
+++ b/man2/open.2
@@ -958,6 +958,16 @@ is not allowed.
 (See also
 .BR path_resolution (7).)
 .TP
+.B EACCES
+.\" commit 30aba6656f61ed44cba445a3c0d38b296fa9e8f5
+Where
+.B O_CREAT
+is specified, the fs.protected_fifos or fs.protected_regular sysctl is
+enabled, the file already exists and is a FIFO or regular file, the
+owner of the file is neither the current user nor the owner of the
+containing directory, and the containing directory is both world- or
+group-writable and sticky.
+.TP
 .B EDQUOT
 Where
 .B O_CREAT
--
2.7.4
