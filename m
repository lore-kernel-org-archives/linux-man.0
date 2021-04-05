Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76452C43460
	for <linux-man@archiver.kernel.org>; Mon,  5 Apr 2021 13:13:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4758E613A3
	for <linux-man@archiver.kernel.org>; Mon,  5 Apr 2021 13:13:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232702AbhDENNV (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 5 Apr 2021 09:13:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237306AbhDENNV (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Mon, 5 Apr 2021 09:13:21 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50CF8C061756
        for <linux-man@vger.kernel.org>; Mon,  5 Apr 2021 06:13:15 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id d191so5702698wmd.2
        for <linux-man@vger.kernel.org>; Mon, 05 Apr 2021 06:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UASrRWR/AQExBTAcdhyS8HnSsJAz2TGvv0Bt/UhdIcg=;
        b=pzBAgbRS43HpXAEp6rx8hYRoju80jWkvBLn2FAZyuE/NfbY5KsTuu7JZ6BXjdr++1h
         shfnRFJ+v5ckkQloynHwUU77AH/27FjVgiPjZX15skfwZXiZW4GOLUiEV4RJz3NyeMTJ
         WA5AiqsA0BnYFRYCzpQl6Lwh9P5TBkCqc9ixlRGZ/XhfzFyi0oPEeaW/NLGRm6IiQy0N
         1EqciRodJCvwoDD8WU9jsaKOEPwfoEhgrpOpX58Qwq/ZLk4Z4Fmb1rjch6HsooOnfP0J
         B/rpx0f7tUH92sJdXK/mO0dKxxSVrUf/IzXsmWXRCuNEAELguuzlFLc4ozuN2EMFlC8M
         TBLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UASrRWR/AQExBTAcdhyS8HnSsJAz2TGvv0Bt/UhdIcg=;
        b=UtYZTxrEyxFDBmSPmqLqBbyvjX+PBcv7fxooa52r3SS+RQBkuvR0i7CnprHDe2I9pV
         GWfZLoXhVpcIDDyfiCWLS6IHXKShakpO6kGpygX+LHmAVVnbrKfF2Ww2SIunQ/qKvJpa
         kT9G+A6jIEk0OhmSB+uPEMQWLUyMuNf9vuz9pPpdywUDdFIecW2bhIlvySqngdkm4mll
         bNaClt9MP610xSRgx+1tbleANp60ig4QDjUnDbiAYR/wpRPaesqA8JxY2Xkr6iakpKg6
         KvArggE/Jmcvu8qWRZ7TjxCIAD8pQeDOT5rdpNbSGky62wi//VlqSeKagQP1i/oqHbra
         KQLA==
X-Gm-Message-State: AOAM533dOQav8EWmeCIVwFeoj8WNFYfmLMLkHuAGQA9erhRGt7Yt+Rdi
        dW96USEIvxtl180tHScT+PowoUQWSpc=
X-Google-Smtp-Source: ABdhPJw9XgoW+45RLJ9AKoUoSGg7Lmzcx7XnancHc4JCS2pFWofZnk6oyFkG0tH21hCuu0n2PDDbeQ==
X-Received: by 2002:a7b:cb05:: with SMTP id u5mr1876887wmj.183.1617628394081;
        Mon, 05 Apr 2021 06:13:14 -0700 (PDT)
Received: from localhost.localdomain ([170.253.36.171])
        by smtp.googlemail.com with ESMTPSA id p12sm27657929wrx.28.2021.04.05.06.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 06:13:13 -0700 (PDT)
From:   Alejandro Colomar <alx.manpages@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     Alejandro Colomar <alx.manpages@gmail.com>,
        linux-man@vger.kernel.org
Subject: [PATCH 0/5] Merged patches from others
Date:   Mon,  5 Apr 2021 15:13:03 +0200
Message-Id: <20210405131307.2892-1-alx.manpages@gmail.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Hi Michael,

These are the patches I have merged from others.

Cheers,

Alex


Alyssa Ross (1):
  scanf.3: clarify that %n supports type modifiers

Peter Xu (4):
  userfaultfd.2: Add UFFD_FEATURE_THREAD_ID docs
  userfaultfd.2: Add write-protect mode
  ioctl_userfaultfd.2: Add UFFD_FEATURE_THREAD_ID docs
  ioctl_userfaultfd.2: Add write-protect mode docs

 man2/ioctl_userfaultfd.2 |  91 ++++++++++++++++++++++++++++-
 man2/userfaultfd.2       | 121 +++++++++++++++++++++++++++++++++++++--
 man3/scanf.3             |   4 +-
 3 files changed, 208 insertions(+), 8 deletions(-)

-- 
2.31.0

