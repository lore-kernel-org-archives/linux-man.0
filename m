Return-Path: <SRS0=wOXt=D3=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E553DC4363A
	for <linux-man@archiver.kernel.org>; Tue, 20 Oct 2020 14:23:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8487C22244
	for <linux-man@archiver.kernel.org>; Tue, 20 Oct 2020 14:23:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vKRTHF2M"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408036AbgJTOXl (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Tue, 20 Oct 2020 10:23:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407989AbgJTOXk (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Tue, 20 Oct 2020 10:23:40 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BCE5C061755
        for <linux-man@vger.kernel.org>; Tue, 20 Oct 2020 07:23:40 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id d81so1997474wmc.1
        for <linux-man@vger.kernel.org>; Tue, 20 Oct 2020 07:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jbkBjfvwtbmvjHEYZB8dIAYP4PDfKaSkHZNncV8uSXc=;
        b=vKRTHF2M7/6YEQ3JtcTxZOT+RYyJLC4YcOONDktN/bDBtRQeN1lfq9hq76PMw3zncy
         b7UHEnyBD3HmMxZZ3f/6MjlGcyiVINWOS07Pw+QINXcvf7Kfai3LXocR5xZ7Gq3xB1eC
         jsEAsgGxgxOzu30lYwijinM8RtR0eixt5oxsuiMPqYwIU4JcUgVVGtzWYPK0BgvZQyql
         u9FxTk/NLWvQTH3ia74VkLvS1dNoe1qDqG+dWx0x8F9NNqpFQC29xEgAt+s1bKyU+/N2
         ek/tcWqnf8YbjCL+l7Exc6QjfHEnOkAiX0mZ8X4bDxfPyXAbnGQSFqjUGQRfU+IqilDt
         IlmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jbkBjfvwtbmvjHEYZB8dIAYP4PDfKaSkHZNncV8uSXc=;
        b=brQTNFSJyQXqQmxD0ZY7SwmxirGtuq3ZnDVrblfK5tfujbKjhirz7oJ91KEX4HeZh8
         67dXTMDKqYPz0x3s5cnQe0FSbrF/kaa15LrzGZIDLL8aBk9oBdrnKGcpLQo3HdAobEgM
         NGhA3/wTDTz2lwX1Zn4bDYEbT3Ots4qcMeVuwOkA0iyttZUvpL2o0sqRa1TNK4BOilzw
         biPWuI3ZYyZRJVxutCFsb7HA+iLYW3hEg8J+Wn1IpFNHhYEFIgEtP7YGaneiJz+ktuWb
         uU32ZO4EYHJNgzb/pkdaK21idiGJFjzU5nRND+ho3nKUANOoAeDcSpMnlBNjaxtg6g1J
         AgQA==
X-Gm-Message-State: AOAM5306REmyra/fNZV+y10tfb8RtP6+uhU9BTPtyZ6RpPjjqt5W1Irs
        g8CGWLF3LWSG6YWw7ACb2as=
X-Google-Smtp-Source: ABdhPJwUdVbyuXIXUwcihyfslEXAKg1kndI5cGGFoeywFBIBDfjxNQdNTBomHptrjDR/eSttYOmOkg==
X-Received: by 2002:a1c:e244:: with SMTP id z65mr1312394wmg.40.1603203819135;
        Tue, 20 Oct 2020 07:23:39 -0700 (PDT)
Received: from localhost.localdomain ([170.253.60.68])
        by smtp.googlemail.com with ESMTPSA id s19sm3422153wmc.0.2020.10.20.07.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2020 07:23:38 -0700 (PDT)
From:   Alejandro Colomar <colomar.6.4.3@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     Alejandro Colomar <colomar.6.4.3@gmail.com>,
        linux-man@vger.kernel.org, libc-alpha@sourceware.org
Subject: [PATCH 17/22] list.3: CONFORMING TO: ffix: Use man markup
Date:   Tue, 20 Oct 2020 16:21:42 +0200
Message-Id: <20201020142146.61837-18-colomar.6.4.3@gmail.com>
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
 man3/list.3 | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/man3/list.3 b/man3/list.3
index 2a873deab..478fa2bf3 100644
--- a/man3/list.3
+++ b/man3/list.3
@@ -259,8 +259,7 @@ from the list.
 .SH CONFORMING TO
 Not in POSIX.1, POSIX.1-2001 or POSIX.1-2008.
 Present on the BSDs
-(LIST macros first appeared in
-.Bx 4.4 ).
+(LIST macros first appeared in 4.4BSD).
 .SH BUGS
 .SH EXAMPLES
 .SH SEE ALSO
-- 
2.28.0

