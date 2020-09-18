Return-Path: <SRS0=SL3d=C3=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B353EC43464
	for <linux-man@archiver.kernel.org>; Fri, 18 Sep 2020 17:05:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7BB3A20DD4
	for <linux-man@archiver.kernel.org>; Fri, 18 Sep 2020 17:05:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XXQeEF4L"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725955AbgIRRFH (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Fri, 18 Sep 2020 13:05:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726250AbgIRRFH (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Fri, 18 Sep 2020 13:05:07 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD8E2C0613CF
        for <linux-man@vger.kernel.org>; Fri, 18 Sep 2020 10:05:06 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id z4so6348624wrr.4
        for <linux-man@vger.kernel.org>; Fri, 18 Sep 2020 10:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fxX4ISt0PhpLQBbe9U4z7go9zw8KkASTBVWH3HxBGwU=;
        b=XXQeEF4LrFUcLemyDj/gs8RIliJw6JUvvulNdGH56vYEsH/dswhCbStQ49EGAeCxxR
         JcG5pHsvYBvdibg71I1TBDDqWUdKUZy+Vp4XsWGL1VEAEfQu6w25JCCiZQAwyeSORBCM
         YQzmBXYyYBWitlquqnxArkRuQpdUGONfBTTqqfvfv6JbmwyNyGeSBzAScdMMPe7PQoz7
         K887yW+3bNm6BFkSEI38Jsy/Yyq6cHBgK3a4bfJA3VIzIWLvwBzQijk3lj+LUy0dirCs
         F1aZFpwIaMAW8s/z1FuoL1x2J60QygyU5EeHjWIrNS7IPGVEkTD83ACj/U3CtRV61C2B
         UJHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fxX4ISt0PhpLQBbe9U4z7go9zw8KkASTBVWH3HxBGwU=;
        b=c1PFJAmzXkjgwt6h5XLFQ4VNhEEpYASAOsy23bRrDS3FPr6IwTH+8SeTOFaxcNCBjT
         +VugQ8YtHbXpVw7iTyuRLKMbgP+XwlfrjGna4eoW73Pt8raEjymkwZ0eMXhu/ZqZBvUh
         4iCdJnPkPVeibpjTZVFP82vN5yBQ6Rv4JbUjM23+kNPONwlLITZQUMyjIUiPE5I3GjGj
         +MnULo2eZjQJACYWq8J4fo8WQnO38iVUao3glmuD3+FueM2JENQEY7hi0KdjfFZXEwdA
         yRt5GUNdbSkbe5/lLBoOqzmK81x50naSF6Gfg6/l12yzRi1a5esNn0eWu6Vez5xenjXY
         vK+Q==
X-Gm-Message-State: AOAM533h7Shi478XxVRgyF8fV4ldnxMI1eA9YNlzhyLUNHbZ/x1WZl7h
        HPPTZkptvEODC+BY9ZMnOAs=
X-Google-Smtp-Source: ABdhPJwpp4tzYMjcqKzz72YuyUjVvbb+Vejpf8ZZat6MNXvymIRZUWh5k8YY1nTDWywK/V+RIFmM0g==
X-Received: by 2002:adf:e304:: with SMTP id b4mr37446334wrj.141.1600448705370;
        Fri, 18 Sep 2020 10:05:05 -0700 (PDT)
Received: from localhost.localdomain ([170.253.60.68])
        by smtp.googlemail.com with ESMTPSA id q18sm6321208wre.78.2020.09.18.10.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2020 10:05:04 -0700 (PDT)
From:   Alejandro Colomar <colomar.6.4.3@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     linux-man@vger.kernel.org, libc-alpha@sourceware.org,
        Alejandro Colomar <colomar.6.4.3@gmail.com>
Subject: [PATCH 5/9] system_data_types.7: srcfix: cosmetic: Visually sparate types
Date:   Fri, 18 Sep 2020 19:04:39 +0200
Message-Id: <20200918170442.94920-6-colomar.6.4.3@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200918170442.94920-1-colomar.6.4.3@gmail.com>
References: <20200918170442.94920-1-colomar.6.4.3@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Signed-off-by: Alejandro Colomar <colomar.6.4.3@gmail.com>
---
 man7/system_data_types.7 | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/man7/system_data_types.7 b/man7/system_data_types.7
index 53c289e31..8c0c78954 100644
--- a/man7/system_data_types.7
+++ b/man7/system_data_types.7
@@ -61,6 +61,7 @@ system_data_types \- overview of system data types
 .\"		* Notes (optional)
 .\"
 .\"		* See also
+.\"------------------------------------- ptrdiff_t --------------------/
 .TP
 .I ptrdiff_t
 .IP
@@ -81,6 +82,7 @@ See also the
 and
 .I ssize_t
 types in this page.
+.\"------------------------------------- regmatch_t -------------------/
 .TP
 .I regmatch_t
 .IP
@@ -103,6 +105,7 @@ Conforming to: POSIX.1-2001 and later.
 .IP
 See also:
 .BR regexec (3)
+.\"------------------------------------- regoff_t ---------------------/
 .TP
 .I regoff_t
 .IP
@@ -132,6 +135,7 @@ structure and the
 and
 .I ssize_t
 types in this page.
+.\"------------------------------------- sigevent ---------------------/
 .TP
 .I sigevent
 .IP
@@ -177,6 +181,7 @@ See also:
 .\"See also the
 .\".I aiocb	FIXME
 .\"structure in this page.
+.\"------------------------------------- sigval -----------------------/
 .TP
 .I sigval
 .IP
@@ -206,6 +211,7 @@ structure
 .\".I siginfo_t	FIXME
 .\"type
 in this page.
+.\"------------------------------------- size_t -----------------------/
 .TP
 .I size_t
 .IP
@@ -301,6 +307,7 @@ See also the
 and
 .I ssize_t
 types in this page.
+.\"------------------------------------- ssize_t ----------------------/
 .TP
 .I ssize_t
 .IP
@@ -343,6 +350,7 @@ See also the
 and
 .I size_t
 types in this page.
+.\"------------------------------------- suseconds_t ------------------/
 .TP
 .I suseconds_t
 .IP
@@ -362,6 +370,7 @@ Conforming to: POSIX.1-2001 and later.
 See also the
 .I timeval
 structure in this page.
+.\"------------------------------------- time_t -----------------------/
 .TP
 .I time_t
 .IP
@@ -402,6 +411,7 @@ See also:
 .BR time (2),
 .BR ctime (3),
 .BR difftime (3)
+.\"------------------------------------- timer_t ----------------------/
 .TP
 .I timer_t
 .IP
@@ -422,6 +432,7 @@ See also:
 .BR timer_delete (2),
 .BR timer_getoverrun (2),
 .BR timer_settime (2)
+.\"------------------------------------- timespec ---------------------/
 .TP
 .I timespec
 .IP
@@ -457,6 +468,7 @@ See also:
 .BR nanosleep (2),
 .BR timerfd_gettime (2),
 .BR timer_gettime (2)
+.\"------------------------------------- timeval ----------------------/
 .TP
 .I timeval
 .IP
-- 
2.28.0

