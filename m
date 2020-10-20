Return-Path: <SRS0=wOXt=D3=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C3C1C4363A
	for <linux-man@archiver.kernel.org>; Tue, 20 Oct 2020 14:23:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 26A0222244
	for <linux-man@archiver.kernel.org>; Tue, 20 Oct 2020 14:23:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IlqC36rD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407990AbgJTOXY (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Tue, 20 Oct 2020 10:23:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407989AbgJTOXY (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Tue, 20 Oct 2020 10:23:24 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56055C061755
        for <linux-man@vger.kernel.org>; Tue, 20 Oct 2020 07:23:24 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id e17so2374796wru.12
        for <linux-man@vger.kernel.org>; Tue, 20 Oct 2020 07:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UG0rXrw3CBsfE3f/zeHuA1mFbFHv3bshR6MacpsGi50=;
        b=IlqC36rDfXo4UnrFmtf6yMeoUcuoFfW6TY4jzgbZPFhXMK2xpx+qxiKST4oL58KOkD
         6bzORObQZpLevTITf608rfaDwq2zRAYKit+L8N6hMcGNdZpB7B4ZUB6O9xHOP1r+ftRD
         XnBphQz7Ay/jRmWChguwBLsFtalg/vpnTWVl2x0g+3Wtx/KuH6ohjlJ9075SFiibsxIu
         99YyXhABZxGVAO19GyxOgnPNIHhj6KCFumh7SI6c7+YoamjPebt1wSt6tzy2K+XKR3fO
         Ju/K4z64InCmcmbLYA/ZBBHOowSXo9vsTEAsu9W0hwPdGWCuByx8tWIGiwpTpfdIhqX8
         l2lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UG0rXrw3CBsfE3f/zeHuA1mFbFHv3bshR6MacpsGi50=;
        b=FQvCTIxH9QI/8hKs6188Sw6bcKTnwVXnNFh8nDP6EzeedUa6rYABBnIUiId6y8DR0T
         k099cvJA9ewZielWZzu2nrKP1iO45Ks95a8xIaOKfuSf4gFg9qqwzhLug0kVQbPWylz/
         tEcOFSCvIZNwjNMA4x8HrktZTjsU2tjB1nzS/3VR3NbS9xWNO4JzUuslBS911D76oQFj
         ViraET0YAINORgewT8hsK2Qi9JmDkLEXsiUKh9mM/RdPZJKv4CtBC3VzXEncFK8aME0h
         4NV+8UV5GZ491e79l0qUjI0MTUi2GNZEPg6oy6NTAIUTI5yojkwnfo2+UM0axkjuALBB
         3D3A==
X-Gm-Message-State: AOAM5336yo8EH8+kmPgmenqTl/jA00yu/422zAiH+DwBSwNl/2ttg/9I
        A56yTLYScLhuzuK6ogHNeRiWHA2oHOg=
X-Google-Smtp-Source: ABdhPJxO0mpJSq6tekkU5+4USMzItV2/kqKwih9oGOCbWPkHDAdj5ey7z4JKEmUOCxYerTYUVevpew==
X-Received: by 2002:a05:6000:1151:: with SMTP id d17mr4082928wrx.363.1603203802854;
        Tue, 20 Oct 2020 07:23:22 -0700 (PDT)
Received: from localhost.localdomain ([170.253.60.68])
        by smtp.googlemail.com with ESMTPSA id s19sm3422153wmc.0.2020.10.20.07.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2020 07:23:22 -0700 (PDT)
From:   Alejandro Colomar <colomar.6.4.3@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     Alejandro Colomar <colomar.6.4.3@gmail.com>,
        linux-man@vger.kernel.org, libc-alpha@sourceware.org
Subject: [PATCH 02/22] list.3, queue.3: NAME: Move code from queue.3 to list.3
Date:   Tue, 20 Oct 2020 16:21:27 +0200
Message-Id: <20201020142146.61837-3-colomar.6.4.3@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201020142146.61837-1-colomar.6.4.3@gmail.com>
References: <20201020142146.61837-1-colomar.6.4.3@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Signed-off-by: Alejandro Colomar <colomar.6.4.3@gmail.com>
---
 man3/list.3  | 17 +++++++++++++++++
 man3/queue.3 | 17 -----------------
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/man3/list.3 b/man3/list.3
index 127c391f1..340b24f7c 100644
--- a/man3/list.3
+++ b/man3/list.3
@@ -31,6 +31,23 @@
 .\"
 .TH LIST 3 2020-10-19 "GNU" "Linux Programmer's Manual"
 .SH NAME
+.Nm LIST_EMPTY ,
+.Nm LIST_ENTRY ,
+.Nm LIST_FIRST ,
+.Nm LIST_FOREACH ,
+.\" .Nm LIST_FOREACH_FROM ,
+.\" .Nm LIST_FOREACH_SAFE ,
+.\" .Nm LIST_FOREACH_FROM_SAFE ,
+.Nm LIST_HEAD ,
+.Nm LIST_HEAD_INITIALIZER ,
+.Nm LIST_INIT ,
+.Nm LIST_INSERT_AFTER ,
+.Nm LIST_INSERT_BEFORE ,
+.Nm LIST_INSERT_HEAD ,
+.Nm LIST_NEXT ,
+.\" .Nm LIST_PREV ,
+.Nm LIST_REMOVE ,
+.\" .Nm LIST_SWAP ,
 .SH SYNOPSIS
 .SH DESCRIPTION
 .SH RETURN VALUE
diff --git a/man3/queue.3 b/man3/queue.3
index c48b4ba9f..17adfcf3b 100644
--- a/man3/queue.3
+++ b/man3/queue.3
@@ -71,23 +71,6 @@
 .Nm STAILQ_REMOVE_HEAD ,
 .Nm STAILQ_REMOVE ,
 .\" .Nm STAILQ_SWAP ,
-.Nm LIST_EMPTY ,
-.Nm LIST_ENTRY ,
-.Nm LIST_FIRST ,
-.Nm LIST_FOREACH ,
-.\" .Nm LIST_FOREACH_FROM ,
-.\" .Nm LIST_FOREACH_SAFE ,
-.\" .Nm LIST_FOREACH_FROM_SAFE ,
-.Nm LIST_HEAD ,
-.Nm LIST_HEAD_INITIALIZER ,
-.Nm LIST_INIT ,
-.Nm LIST_INSERT_AFTER ,
-.Nm LIST_INSERT_BEFORE ,
-.Nm LIST_INSERT_HEAD ,
-.Nm LIST_NEXT ,
-.\" .Nm LIST_PREV ,
-.Nm LIST_REMOVE ,
-.\" .Nm LIST_SWAP ,
 .Nm TAILQ_CONCAT ,
 .Nm TAILQ_EMPTY ,
 .Nm TAILQ_ENTRY ,
-- 
2.28.0

