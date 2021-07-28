Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98977C432BE
	for <linux-man@archiver.kernel.org>; Wed, 28 Jul 2021 20:20:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8033060ED4
	for <linux-man@archiver.kernel.org>; Wed, 28 Jul 2021 20:20:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231433AbhG1UUa (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Wed, 28 Jul 2021 16:20:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231519AbhG1UUa (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Wed, 28 Jul 2021 16:20:30 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D53DC061765
        for <linux-man@vger.kernel.org>; Wed, 28 Jul 2021 13:20:28 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id l18so4017984wrv.5
        for <linux-man@vger.kernel.org>; Wed, 28 Jul 2021 13:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eywB6MfZne00fULpUfvoMgjKu/O2HhZyw+IUKQyiR30=;
        b=RaWMvkNr+Xwbmj6JDC9EpdllrIpXzKw2MvIUsRBf1fdu45pJvLgrq59gN626x2qI6P
         1yoLPPfjq6qGEU6GHWy0O6wm4C/ofinrXP3uZZ+PBlkJAp+3Pgd35c2LDkQaUWf7XZ9z
         yrZsWeLfHgYPQqIRElIk2GiGJrGH+AAwqOUMf4lluWNYrCk3s/IwECarMPtvMIo7HhA8
         wwFq00Aa978pYzTjHcvB7UEGeY+RtQX8Bpf70SUoFjHCHiWyGIPruRR0QyCrrgK6aTOz
         KHCUQsa5mUJelzZLOd3u8wbQmfqn4L1GidkVguMkIuPZPPpkkH+VLuWwjM+KyOGtTykV
         eVag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eywB6MfZne00fULpUfvoMgjKu/O2HhZyw+IUKQyiR30=;
        b=kAyL22pyD6LobKxLwU4bD2L+KsMfSLSn6PLDWTMMV3UF/kaee5ohVNAgGv8Q+Evt2I
         OcgUyF+5LqxBDjxPSzM2Euhn2KXkZlL9V7LHHdwomonUjJdQAtV5S8asoff4bOXIk0wt
         oGBhnhulm4/ZmtEQp9Fxmqh9v57BJmTRfX8QjU7zgzBDo8mtM7noWW0J3UaVCETOHFxb
         Lq1jw4aKFJ+5ACetFSqgzTkVX/IsglLyRW9JHdS44Xl3wcXfjcBoMv7drMd6kgYjIhH5
         iyEhcBgVlFWjrerT4ov0/KZY1VrgV/Ugrk+ebuyJaBYEmlkwW3nd4X7RXSbZC5i7G0ng
         ZlSA==
X-Gm-Message-State: AOAM532H1jI0O3il2xkwac1Y6RTJaQyjeTIrfd3Jjw/mE/h7CjIu31fg
        rI3CElGie0s1p5HVGbpUNiey/qZxMtc=
X-Google-Smtp-Source: ABdhPJx3btQAu/xcRWV9eKqvL18F8IQS/LUv+feuGUQdB5+D22Pkv0lAKSNF4AH/sEDXZMUVqgAFJQ==
X-Received: by 2002:a05:6000:1001:: with SMTP id a1mr1096448wrx.121.1627503626927;
        Wed, 28 Jul 2021 13:20:26 -0700 (PDT)
Received: from sqli.sqli.com ([195.53.121.100])
        by smtp.googlemail.com with ESMTPSA id o29sm879703wms.13.2021.07.28.13.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 13:20:26 -0700 (PDT)
From:   Alejandro Colomar <alx.manpages@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     Kir Kolyshkin <kolyshkin@gmail.com>, linux-man@vger.kernel.org,
        Alejandro Colomar <alx.manpages@gmail.com>
Subject: [PATCH 14/32] capabilities.7, user_namespaces.7: describe CAP_SETFCAP
Date:   Wed, 28 Jul 2021 22:19:50 +0200
Message-Id: <20210728202008.3158-15-alx.manpages@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210728202008.3158-1-alx.manpages@gmail.com>
References: <20210728202008.3158-1-alx.manpages@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

From: Kir Kolyshkin <kolyshkin@gmail.com>

Signed-off-by: Kir Kolyshkin <kolyshkin@gmail.com>
Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>
---
 man7/capabilities.7    | 6 ++++++
 man7/user_namespaces.7 | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/man7/capabilities.7 b/man7/capabilities.7
index 9f8f0087f..2f9c9a61e 100644
--- a/man7/capabilities.7
+++ b/man7/capabilities.7
@@ -349,6 +349,12 @@ write a group ID mapping in a user namespace (see
 .TP
 .BR CAP_SETFCAP " (since Linux 2.6.24)"
 Set arbitrary capabilities on a file.
+.IP
+.\" commit db2e718a47984b9d71ed890eb2ea36ecf150de18
+Since Linux 5.12, this capability is
+also needed to map uid 0 (as in
+.BR unshare\ -Ur ,
+.RB see unshare (1).
 .TP
 .B CAP_SETPCAP
 If file capabilities are supported (i.e., since Linux 2.6.24):
diff --git a/man7/user_namespaces.7 b/man7/user_namespaces.7
index 518e7a3bb..3378b6057 100644
--- a/man7/user_namespaces.7
+++ b/man7/user_namespaces.7
@@ -577,6 +577,12 @@ or be in the parent user namespace of the process
 The mapped user IDs (group IDs) must in turn have a mapping
 in the parent user namespace.
 .IP 4.
+.\" commit db2e718a47984b9d71ed890eb2ea36ecf150de18
+If a writing process is root (i.e. UID 0) trying to map host user ID 0,
+it must have
+.B CAP_SETFCAP
+capability (since Linux 5.12).
+.IP 5.
 One of the following two cases applies:
 .RS
 .IP * 3
-- 
2.32.0

