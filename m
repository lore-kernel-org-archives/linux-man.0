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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B5C9C433DB
	for <linux-man@archiver.kernel.org>; Tue,  9 Feb 2021 12:10:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F396564E56
	for <linux-man@archiver.kernel.org>; Tue,  9 Feb 2021 12:10:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229759AbhBIMKP (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Tue, 9 Feb 2021 07:10:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230174AbhBIMIV (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Tue, 9 Feb 2021 07:08:21 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD1D3C061788
        for <linux-man@vger.kernel.org>; Tue,  9 Feb 2021 04:07:40 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id w4so2870497wmi.4
        for <linux-man@vger.kernel.org>; Tue, 09 Feb 2021 04:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NdsTCATYwcu02euMWgj//0uUzaQWuxy+LA4/qb4ONcc=;
        b=BJRbt2hSkRWy5nYFenvgasd/wQJWGgxIzVrqTnIW/JpTihnX2BudLxgyHcZVHaig1A
         vDAxyr7izrc3p1Ubs8E5b54ZmkKrTxNez/7zcTJDpArKyzbZlovjH1+AjG6Ee3HJPsGu
         kHop3BBD+GogkAdAtqPVPl/oTC/b1iCXm+ofNKmgvOeQzu3APhsHEAhCozsQqwGRgSoh
         k7id5IhONiVtSFc8odvfLpkprzi4/KMG+Gz69om2ML67UktBf+YA9kGmHKhgaKo+k7Ho
         H7bmZQm0fial+m5JaCsZ4iqiUW5Wy9iGtGzjfa69iLGGJvPOjcJyC0RI/hEuwOFaRqmG
         Hk0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NdsTCATYwcu02euMWgj//0uUzaQWuxy+LA4/qb4ONcc=;
        b=gOvqpT7ddVuDrYCHB39PE1HuGB0vqHEh0FSk20qQWsVcNzgClOob5QRSoFwTDY2/Tr
         4tku/pP5p9TPhRvNZoQBhcCjhWb7EFE4Ykvqe/U5oy/RXREt91bjYNW6dhIwI1VTLu0w
         1USDTFbJr+JdgVGolEgNL8BOs+F4B+7+QkN4QWuWe/4j0ftXUjI5g+14Q+QQSJMHThtY
         BMlwSj4D+IoWaYUvAD6JvxfkZiwrfcMMq2ME17ZBqi3TppZXdTpcA1iH+gOg8IG56Xzr
         S3pRqpY0rgjPUF1xx5WVkan0TfVDm2c3enExjaTGE3TkyGbhIpzo24Am1Trk2gZsTDaU
         vz1g==
X-Gm-Message-State: AOAM530EEtmQghei4HHMCHXgIiUT31pAsqTE0WQyWduKrPZm5i6iw63n
        MK73SpbUqpSJDjGVDyHH7Lo=
X-Google-Smtp-Source: ABdhPJzZXpXjN2wfjekQ2lwKqGKkcg96No85FHtefjjXxPL171gqHMedCLUm2gaDadXIMYchK7+IYQ==
X-Received: by 2002:a1c:4483:: with SMTP id r125mr3067771wma.80.1612872459671;
        Tue, 09 Feb 2021 04:07:39 -0800 (PST)
Received: from debian.vlc ([170.253.51.130])
        by smtp.gmail.com with ESMTPSA id f7sm1430041wrw.81.2021.02.09.04.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 04:07:39 -0800 (PST)
From:   Alejandro Colomar <alx.manpages@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     Jonathan Wakely <jwakely@redhat.com>, linux-man@vger.kernel.org,
        Alejandro Colomar <alx.manpages@gmail.com>
Subject: [PATCH] stat.2: Remove <unistd.h> from synopsis
Date:   Tue,  9 Feb 2021 13:01:17 +0100
Message-Id: <20210209120116.15711-1-alx.manpages@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

From: Jonathan Wakely <jwakely@redhat.com>

There seems to be no reason <unistd.h> is shown here, so remove it.

Signed-off-by: Jonathan Wakely <jwakely@redhat.com>
Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>
---
 man2/stat.2 | 1 -
 1 file changed, 1 deletion(-)

diff --git a/man2/stat.2 b/man2/stat.2
index 734c74b04..fed926715 100644
--- a/man2/stat.2
+++ b/man2/stat.2
@@ -43,7 +43,6 @@ stat, fstat, lstat, fstatat \- get file status
 .nf
 .B #include <sys/types.h>
 .B #include <sys/stat.h>
-.B #include <unistd.h>
 .PP
 .BI "int stat(const char *" pathname ", struct stat *" statbuf );
 .BI "int fstat(int " fd ", struct stat *" statbuf );
-- 
2.30.0

