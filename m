Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08A94C4707A
	for <linux-man@archiver.kernel.org>; Sun, 23 May 2021 11:22:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DAE5F61168
	for <linux-man@archiver.kernel.org>; Sun, 23 May 2021 11:22:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231718AbhEWLX4 (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sun, 23 May 2021 07:23:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231709AbhEWLX4 (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sun, 23 May 2021 07:23:56 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3142C061574
        for <linux-man@vger.kernel.org>; Sun, 23 May 2021 04:22:28 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id v12so25501879wrq.6
        for <linux-man@vger.kernel.org>; Sun, 23 May 2021 04:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jRSnLAD1m0up/pdufl3JkEwp6ccXPU1uxh7aQU4povk=;
        b=OM4quTdj24sXpTYh755akz0iBiHhUq8mXocZFZ+skhjz0SOu9M9tbnttX8HeuQ/KUS
         Zt026SOgjFbJYmQehQpLstqTGbocq9Ej+S8fwhaDtLxbKadKZ2bi0tgVcEEfxXm3SjNI
         EeVoGSqYs3lqCpCDl+yckSrz2+OwOz99AAvq3XIXD5jWHpGYIw3kOHlTf/UfIFy1S+tP
         QXSYIicpquTZEtpCT4Ry60slXE3jBSQduDeDE/hb7Bl/sW9CN0xmprs5sx5WZMEmlmQK
         A2/mAoSjgF7HGW76/+B9pOZiIJmlreipJx2Owd/4/uEZTwz8s35d81yHMgmyyUx9HXHN
         uPDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jRSnLAD1m0up/pdufl3JkEwp6ccXPU1uxh7aQU4povk=;
        b=ZmQ/sf8P8U/AT6CR1r78Vv2kQhIgnkuzjHrZzwEg19wkcXXx4j/CmhA0xFBzvn61h8
         eoQktA6XHnOcR67+V99uuUvTf5Hu3xx8ckK3dlZXI9W1ThcrfMjbxi3eb7gwuATixVsa
         oJy9Kzrm0P7BJaMhiLoTBvfGyKIVwu0H0TjYZd/6U78VOfcVabXX1RZChLqTeWGkXz+z
         WOhCEIPQ8V6cquSvvThVNBK0yTK8UtGy6GJ0t8OH8QL7GfStVKxqkpK2s6M0eM8jMGMB
         wMrQI3udoRTfXCHTc3SqQgOHe5hQ3pjvEeAdH/R0tK0DHWMQAmuZd5ZxM5ZqaLdxJIGX
         TtBA==
X-Gm-Message-State: AOAM532C/A0fBygJ0TtZGMpAkQvovKoD7zknx/MBpc+qS9eDjKL7AWby
        X3+uFz4n2jZpCzexJumF7Ro=
X-Google-Smtp-Source: ABdhPJxdl7D8La7eec28lPXU0oLm9CAneUDe7gRZdyVZ7d4XBj7s1N3k509MKdlCx3WffhI6jZHBnA==
X-Received: by 2002:a05:6000:1189:: with SMTP id g9mr17314340wrx.385.1621768947595;
        Sun, 23 May 2021 04:22:27 -0700 (PDT)
Received: from sqli.sqli.com ([195.53.121.100])
        by smtp.googlemail.com with ESMTPSA id x10sm8273921wrt.65.2021.05.23.04.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 May 2021 04:22:27 -0700 (PDT)
From:   Alejandro Colomar <alx.manpages@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     Alejandro Colomar <alx.manpages@gmail.com>,
        linux-man@vger.kernel.org
Subject: [PATCH 3/8] system_data_types.7: Add 'cc_t'
Date:   Sun, 23 May 2021 13:22:08 +0200
Message-Id: <20210523112213.170202-3-alx.manpages@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210523112213.170202-1-alx.manpages@gmail.com>
References: <20210523112213.170202-1-alx.manpages@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>
---
 man7/system_data_types.7 | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/man7/system_data_types.7 b/man7/system_data_types.7
index fc9893e41..c8e6961da 100644
--- a/man7/system_data_types.7
+++ b/man7/system_data_types.7
@@ -104,6 +104,23 @@ POSIX.1-2001 and later.
 .IR "See also" :
 .BR stat (2)
 .RE
+.\"------------------------------------- cc_t -------------------------/
+.TP
+.I cc_t
+.RS
+.IR Include :
+.IR <termios.h> .
+.PP
+Used for terminal special characters.
+According to POSIX,
+it shall be an unsigned integer type.
+.PP
+.IR "Conforming to" :
+POSIX.1-2001 and later.
+.PP
+.IR "See also" :
+.BR termios (3)
+.RE
 .\"------------------------------------- clock_t ----------------------/
 .TP
 .I clock_t
-- 
2.31.1

