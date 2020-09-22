Return-Path: <SRS0=K4+z=C7=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED067C2D0E2
	for <linux-man@archiver.kernel.org>; Tue, 22 Sep 2020 08:58:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A44852396D
	for <linux-man@archiver.kernel.org>; Tue, 22 Sep 2020 08:58:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MzUcHPX9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726428AbgIVI6o (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Tue, 22 Sep 2020 04:58:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726366AbgIVI6o (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Tue, 22 Sep 2020 04:58:44 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F9ECC061755
        for <linux-man@vger.kernel.org>; Tue, 22 Sep 2020 01:58:44 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id z4so16142137wrr.4
        for <linux-man@vger.kernel.org>; Tue, 22 Sep 2020 01:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rTH86IIAmNbsgoWpkYBxj5Y+ASsQs/0lRJXfsSq6BCA=;
        b=MzUcHPX9Nv5cl+NYddY9F6XgCEZ1Jt5ZfFkc8mB4h5csFUxAyBVcK4lZ4oP3CGHYIH
         mRYaSAtuCD84eICP8jvkFULnTaxu1sdQsoIUXbeujKOddo1Ns6Xsa2D6eY+6C6H5rMfm
         HQlHYS5/mJoTxuKMAAZFqG2Aq30vxSmzhxSEhxiUirJ1m0/UkJbzjVNw696FJywqd7hH
         nNun8GGi+/OFpwt6mmjdQGUsYDs5/O9eBhxjC3B73YUaphaE8eVSkiX7OMLTMNJf+Swr
         O3aO0KtijZVCIc1MYnufgJjbILmSNAJXdELAXkZJQgNo7EHEBhYlTLU1gbRPPuLzVLPs
         b+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rTH86IIAmNbsgoWpkYBxj5Y+ASsQs/0lRJXfsSq6BCA=;
        b=EAvkn3H6Og7HVjR9tQuR5kcLkMmjrF5eYwFnIUjCbdznwe9JIoQFh1FWgijo1VglzJ
         sx0DH6K2vjNkPIvIuiShCuk6nmbgod9JWqZafYpzifmqPyo9EJHaNJ6igyDM4VYhZHnJ
         VoRsPPhS6/hsMBMQGJ5GhkzexJXtfzzKAek8dFzAK3wS8JzmBizI0cP7weMIPNx4rtQq
         AvHd627VmcjmE6xhDVYrlBVz7a8P+MYUzDNGjrvSFzxLX2+l/k+HxDfsX1UWv1gUQTRc
         Hwpyp17aUxQP8V4OJzgc7oDxScnP2qV2T6iVi69t0TBzsASxuLg6FTTMwh2YPcSlOVLS
         yTAw==
X-Gm-Message-State: AOAM530LWuWXdx5odV1citNhsRceGlexMogUCSXevSRXaXyIXLXUxatj
        rtW4yMIbAl3Ucq8cFYSBBwf4zWB+JWo=
X-Google-Smtp-Source: ABdhPJwacYVJw9IrZSsozg3C1WIoNb/H9E3FtNWnDBT9gmde1JI3GnmvrUHgyFZXTruHmFHiGXHrjw==
X-Received: by 2002:adf:a28a:: with SMTP id s10mr2715567wra.300.1600765123073;
        Tue, 22 Sep 2020 01:58:43 -0700 (PDT)
Received: from localhost.localdomain ([170.253.60.68])
        by smtp.googlemail.com with ESMTPSA id t124sm3806842wmg.31.2020.09.22.01.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 01:58:42 -0700 (PDT)
From:   Alejandro Colomar <colomar.6.4.3@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     linux-man@vger.kernel.org,
        Alejandro Colomar <colomar.6.4.3@gmail.com>
Subject: [PATCH] system_data_types.7: ffix
Date:   Tue, 22 Sep 2020 10:58:14 +0200
Message-Id: <20200922085813.17449-1-colomar.6.4.3@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Signed-off-by: Alejandro Colomar <colomar.6.4.3@gmail.com>
---
 man7/system_data_types.7 | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/man7/system_data_types.7 b/man7/system_data_types.7
index b026541b0..59c64fb89 100644
--- a/man7/system_data_types.7
+++ b/man7/system_data_types.7
@@ -158,10 +158,10 @@ or
 A type used to hold a general identifier.
 According to POSIX,
 this shall be an integer type that can be used to contain a
-.IR pid_ t ,
-.IR uid_ t ,
+.IR pid_t ,
+.IR uid_t ,
 or
-.IR gid_ t .
+.IR gid_t .
 .IP
 Conforming to: POSIX.1-2001 and later.
 .IP
-- 
2.28.0

