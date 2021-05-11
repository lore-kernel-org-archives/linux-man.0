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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C015C43460
	for <linux-man@archiver.kernel.org>; Tue, 11 May 2021 10:11:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 624A3610C9
	for <linux-man@archiver.kernel.org>; Tue, 11 May 2021 10:11:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231332AbhEKKNA (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Tue, 11 May 2021 06:13:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231177AbhEKKNA (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Tue, 11 May 2021 06:13:00 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6867EC061574
        for <linux-man@vger.kernel.org>; Tue, 11 May 2021 03:11:54 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id n84so10823364wma.0
        for <linux-man@vger.kernel.org>; Tue, 11 May 2021 03:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/Ea9o4Aem2E71tdfYd+GE1bHwM91L2x3KWl4SqhZyCA=;
        b=bJ1yT3PTv5xx2QpmZLk9sIkHzNWSi51R9MuAmIhY/lCQpnUvixxPbRcE+Ne77q3vGt
         cyL370fGo8z9eMDHbEG9UYvDWCMUO3U0TZaDb/oxkLdfNktRJFKP4rLI8Pc4cO/bTxF9
         K28ZkVQL2At7Z9F416/Tu2wn+MZmpYBWwmENYpPu9ByLZI/P3qZFFvo9rZjEaeq/emcm
         bXV7DAvnrB57giTmhUtVm4eVutegDCo6JtX4DLsAxTjOeeMs6J9CtIGEBwKxmCHH/cPA
         +B5nAFOw8jQ6HpFtypS7K3PzjbRbK6k3gxbsuoFBdM8lqT6y2B7LdOW7iOwTxowAcenO
         92hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/Ea9o4Aem2E71tdfYd+GE1bHwM91L2x3KWl4SqhZyCA=;
        b=VKPwhHXITxecMgEWVqcOWfmYcpRtgMjTyWW4pyusGSUCvw0EYnKlzVH6njnh1HFA88
         uvOs1ppAr6PT++LUvi523ltvK2OnKk7J380Z8hrZebwUmav7/c7KBzF7C7UCyguEphz4
         bFYCz/baOiViYN0baWT5sdNoRMD43flG6AgzvdYLoqwWM7o9u132kjUGOIjkXFKh4PeY
         AW/Zv69KxDB0zISO9rzwgi3gvEXJoo1356rGDtyrxeNgtqT7kTUA5JFirO+msw+RWUD9
         DQ9GsDwDWrc+nsCQEuhbZb9nFwWzE9ILA96FqqLbdPdIGJ67dFAahOjRzNYPftAodrTo
         K0Ww==
X-Gm-Message-State: AOAM5322xoFmBtAmRG2QbrjiwSBliZeD+S7z+8yWOVofVxzSXVXEewH1
        FvjtRN0QVvCHAyVnBjEHIpY=
X-Google-Smtp-Source: ABdhPJzaoN0p8ySmZ7w8OJYDWrxyXXSMjvfapgXeNAsPDlrD094NmVVKbgv0cDH7vJtEFBPadpVVMQ==
X-Received: by 2002:a1c:3b44:: with SMTP id i65mr4557407wma.31.1620727913212;
        Tue, 11 May 2021 03:11:53 -0700 (PDT)
Received: from msi.alejandro-colomar.es ([46.222.232.120])
        by smtp.googlemail.com with ESMTPSA id g25sm3171338wmk.43.2021.05.11.03.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 03:11:52 -0700 (PDT)
From:   Alejandro Colomar <alx.manpages@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     Akihiro Motoki <amotoki@gmail.com>, linux-man@vger.kernel.org,
        Alejandro Colomar <alx.manpages@gmail.com>
Subject: [PATCH 3/5] capabilities.7: ffix
Date:   Tue, 11 May 2021 12:11:45 +0200
Message-Id: <20210511101147.24399-3-alx.manpages@gmail.com>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d
In-Reply-To: <20210511101147.24399-1-alx.manpages@gmail.com>
References: <20210511101147.24399-1-alx.manpages@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

From: Akihiro Motoki <amotoki@gmail.com>

Signed-off-by: Akihiro Motoki <amotoki@gmail.com>
Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>
---
 man7/capabilities.7 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man7/capabilities.7 b/man7/capabilities.7
index 17bb997b9..7e79b2fb6 100644
--- a/man7/capabilities.7
+++ b/man7/capabilities.7
@@ -761,8 +761,8 @@ to increase the capacity of a pipe above the limit specified by
 .IR /proc/sys/fs/pipe\-max\-size ;
 .IP *
 override
-.I /proc/sys/fs/mqueue/queues_max,
-.I /proc/sys/fs/mqueue/msg_max,
+.IR /proc/sys/fs/mqueue/queues_max ,
+.IR /proc/sys/fs/mqueue/msg_max ,
 and
 .I /proc/sys/fs/mqueue/msgsize_max
 limits when creating POSIX message queues (see
-- 
2.31.1.498.g6c1eba8ee3d

