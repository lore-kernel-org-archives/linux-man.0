Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_50,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABE6BC433B4
	for <linux-man@archiver.kernel.org>; Thu,  6 May 2021 11:43:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7A4D5613D6
	for <linux-man@archiver.kernel.org>; Thu,  6 May 2021 11:43:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230145AbhEFLor (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Thu, 6 May 2021 07:44:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229777AbhEFLoq (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Thu, 6 May 2021 07:44:46 -0400
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com [IPv6:2607:f8b0:4864:20::a30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC937C061574
        for <linux-man@vger.kernel.org>; Thu,  6 May 2021 04:43:47 -0700 (PDT)
Received: by mail-vk1-xa30.google.com with SMTP id q135so1154197vke.1
        for <linux-man@vger.kernel.org>; Thu, 06 May 2021 04:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=6ck8XWFvEa2y1uAwHldCJad0aupfA1kgfECMEShFh+o=;
        b=vBshhWhuzDpHdt03w83e2vG6G0pGGaASo1dB0RVP60OxfwxHDk2+snT9rY735EzsIb
         OAt0PPWmDqFDbR1EgCf7JGqHud8bO4Eu+3rmaa2KGBL5DASldZQHVP7fxwboLt1r3mR6
         m09nISGnuFUU3GLKPXjLhHghjyWJdcijyNvhTbdNMcs4K1VPj7z86y72S7gGlTsrT1Na
         /YNJ/xfPE+HUccrqC1HWfrtdtcF9uipIouUvXpc3j6HCI9EZlzY/My1pOgT//hX7iCXf
         /l5PzDYe3W2cHTeYVXZtuzc0ZOvz8n0PwyKYESl/NO1L44rN9WB2HRKPXp9mZL9Qffnp
         fAxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=6ck8XWFvEa2y1uAwHldCJad0aupfA1kgfECMEShFh+o=;
        b=JCXwGiaprViFBHSChR1NlvgdnqAeShy4MJSAGSV3la6WykFXfV+tSasri6qNVfZ3H0
         Bl17fIeWu3ZTzj/0Esg+O2VZA+wSR+ct98lq97HW3xvA1VDF58vB+HlE3f159l0H2mRw
         TXBUawjQBw9ixBSp+6hDXO4Hcq0l9fQQoQyouMcM+y40aYZlqqsfMT0UlPY4cLwwNA/x
         GMZxKQh+KdyOmyKwq639bbUir7QxRj6lIHlpkphBVxUfBFNRoezQv8U6ikOTOUr+tyNs
         1b9yjC54Uei2F80A6DsG/mokAim6HPRzj4bICT+18ozm0niMvE+W6JEXcihxnI2KDSel
         Vb9Q==
X-Gm-Message-State: AOAM531Zlztc/rMnLTr845z0rd6GQZH8ZJ5w/dcjivkc4u5JtJcPlnjx
        zWJ1sobLFJ8axUbr3vXihZkL01g0jStBMzgMQTrvaii0q0wZQg==
X-Google-Smtp-Source: ABdhPJyP4BttihDOVS4T58L3qbmel6s+s5gpwXIlANboRd1CLvHSEgezIJzR6Ly0kGq8b/27td6wyTrfaibN99t1N8c=
X-Received: by 2002:a1f:9b92:: with SMTP id d140mr2577488vke.10.1620301426388;
 Thu, 06 May 2021 04:43:46 -0700 (PDT)
MIME-Version: 1.0
From:   Akihiro Motoki <amotoki@gmail.com>
Date:   Thu, 6 May 2021 20:45:04 +0900
Message-ID: <CALhU9t=kyQT98yoGVKuiGOzfk9ACZ8fpNEYdyQqBUNTzDgAyNA@mail.gmail.com>
Subject: [patch] semctl.2: ffix
To:     linux-man@vger.kernel.org
Cc:     "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>,
        alx.manpages@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

diff --git a/man2/semctl.2 b/man2/semctl.2
index 504cdf9da..bea27aa37 100644
--- a/man2/semctl.2
+++ b/man2/semctl.2
@@ -378,7 +378,7 @@ the semaphore set.
 .TP
 .B SETVAL
 Set the semaphore value
-.BR ( semval )
+.RB ( semval )
 to
 .I arg.val
 for the
