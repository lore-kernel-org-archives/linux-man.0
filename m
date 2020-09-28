Return-Path: <SRS0=Wb1v=DF=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 700F1C2D0A8
	for <linux-man@archiver.kernel.org>; Mon, 28 Sep 2020 09:07:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 126A421D7F
	for <linux-man@archiver.kernel.org>; Mon, 28 Sep 2020 09:07:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JrbIg+Dy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726500AbgI1JHM (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 28 Sep 2020 05:07:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726497AbgI1JHM (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Mon, 28 Sep 2020 05:07:12 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5138BC061755
        for <linux-man@vger.kernel.org>; Mon, 28 Sep 2020 02:07:12 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id x14so322694wrl.12
        for <linux-man@vger.kernel.org>; Mon, 28 Sep 2020 02:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SvbL/FWkkLWFHjYYCwQ3y1U1DTXWy/KiVlWKc6oKseY=;
        b=JrbIg+Dy5rGTdt2+RaRvya0t0dR/B0iaWCriP92LzmZrpzlrPjRjWsh5/xc2o2fYwB
         sTru18bP4KEDTqCTc0Qzu6Hm2JbbRkSgUiw/MtwcAWNS8GtuZTj6m/ZBRmJlxoEcPExJ
         MxwqFdPkdeKjDTSZuJ/J/cruyzPcdDTChiVtHGt+h3dwUqe7GCQfNN30Mp02mwZ77gMn
         YPek1FQUWy0W6JIoajkI5GXNPisvno1/gODchZvzwclsirGpJyOnn0g8gPGU+CtkpR2B
         e0dIvZOA21wjSOPqyhPqu9gH1tzcZYrA/nwGHxf3bHO+qW7M0TUAdQevhZw78HnhFK/K
         KETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SvbL/FWkkLWFHjYYCwQ3y1U1DTXWy/KiVlWKc6oKseY=;
        b=RP7geskFkE7AxmQNnq0LRWyKx0ts09QbigH1ve/hefT2D2PBA3+KKjEIAg9C7mX45A
         lTSt9utTk8OFRwl95AfjuK6KcvMR50dP2tunoNvj328im7/KcB6wVSG3YfvuFMjo3foM
         TxHsChKIfobHnzEZMtXJkbtmZ4okCon6qwKffUMmHfYLbAfnHJVeKtjvFImIQ6+vIjHY
         rRUta5i+UPcgjzf0C32I9FWuIOQwQufHytZ0GrN+9wOHm5u9kA3lP7ysgEqTMtf7k2Hp
         rlsgGGEU15tN7Tg/9V4rYOV4h5IdnOQxXSD6bLRdtQBOsl7WeXEqUxwC5h70qSOPyrQi
         HLiQ==
X-Gm-Message-State: AOAM533XiX2ZdF1aPIk40uLPE0bDaIML1cXVAnF+n7GpcnJQxY0DRpst
        4hNhFK0zj9Dnli/pxuObsYFVsubTQfM=
X-Google-Smtp-Source: ABdhPJydgCphw2qrpbhb90D5z5o1RXayfB1DUqp5emxmqkLi12KFYTCba++B21pwI7mGvWB6J2TrVg==
X-Received: by 2002:adf:f885:: with SMTP id u5mr528724wrp.382.1601284031060;
        Mon, 28 Sep 2020 02:07:11 -0700 (PDT)
Received: from localhost.localdomain ([170.253.60.68])
        by smtp.googlemail.com with ESMTPSA id 10sm372825wmi.37.2020.09.28.02.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 02:07:10 -0700 (PDT)
From:   Alejandro Colomar <colomar.6.4.3@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     linux-man@vger.kernel.org, libc-alpha@sourceware.org,
        g.branden.robinson@gmail.com,
        Alejandro Colomar <colomar.6.4.3@gmail.com>
Subject: [PATCH v2 2/3] system_data_types.7: Add 'FILE'
Date:   Mon, 28 Sep 2020 11:06:58 +0200
Message-Id: <20200928090657.2221-1-colomar.6.4.3@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <1a517588-29c1-f728-37ec-49e9825be321@gmail.com>
References: <1a517588-29c1-f728-37ec-49e9825be321@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Signed-off-by: Alejandro Colomar <colomar.6.4.3@gmail.com>
---
 man7/system_data_types.7 | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

Hi Michael,

Please hold until the ffix is applied (or not).

Thanks,

Alex

diff --git a/man7/system_data_types.7 b/man7/system_data_types.7
index ff0403df9..16930985e 100644
--- a/man7/system_data_types.7
+++ b/man7/system_data_types.7
@@ -197,6 +197,29 @@ Conforming to: C99 and later; POSIX.1-2001 and later.
 See also:
 .BR fenv (3)
 .RE
+.\"------------------------------------- FILE -------------------------/
+.TP
+.I FILE
+.RS
+.br
+Include:
+.IR <stdio.h> ;
+or
+.IR <wchar.h> .
+.PP
+An object type used for streams.
+.PP
+Conforming to: C99 and later; POSIX.1-2001 and later.
+.PP
+See also:
+.BR fclose (3),
+.BR flockfile (3),
+.BR fopen (3),
+.BR fprintf (3),
+.BR fread (3),
+.BR fscanf (3),
+.BR stdin (3),
+.BR stdio (3)
+.RE
 .\"------------------------------------- float_t ----------------------/
 .TP
 .I float_t
-- 
2.28.0

