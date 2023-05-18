Return-Path: <linux-man-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54106C7EE29
	for <linux-man@archiver.kernel.org>; Thu, 18 May 2023 23:21:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230071AbjERXVF (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Thu, 18 May 2023 19:21:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbjERXVF (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Thu, 18 May 2023 19:21:05 -0400
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E6E9E66
        for <linux-man@vger.kernel.org>; Thu, 18 May 2023 16:21:02 -0700 (PDT)
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-3f38a9918d1so44171cf.1
        for <linux-man@vger.kernel.org>; Thu, 18 May 2023 16:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684452061; x=1687044061;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3r7z1CMbar01ZdXs3gh1BNTXqG+ifgrWhMVJ5qLmpzA=;
        b=GwJA4prvdM4TFkVOKwr7Uq/0tAYHrkrqvaFzA4jBPt04UjLsV3ALkzm9SbX/y4778g
         SF9YsRzuNihqcTahv2szZCYmtaaa9D5PWaYi7sbqdaI4fLLIj/vnrQV6O24/eg9ei71S
         St13Mv1SshAKBPjWyQU++5XkoIow/qqzd9/mtnhP8ll/xW9Gg6s3oa5KjaJTnclvkWah
         175Gbmnj9WfqHRH2VFt9jyL5i0HoL8utGi47jMDSIOm7t5Uh+wlR9DvTbx5Y63L6mW43
         32ZDVSqdDQ66HMilG+tjY62lmhoViHwXcckJyNzSEFk3Uldgw2YOur0+YsX0RIdLk4zL
         9/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684452061; x=1687044061;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3r7z1CMbar01ZdXs3gh1BNTXqG+ifgrWhMVJ5qLmpzA=;
        b=LbFEClBAP1YNQMYAcpjl8ZX678Ue5TCzjUkrZL43cXX+FMyng7eHFoBBBkb0TBujnP
         Av8njdWKP+29rhynXXZzr/WdiYlHNACiU7B/ihUFsWuQx3Tt4oYSeFebAoiooaaW0hm7
         93+CMj/2lCG9v42wS20GC3x4SlTFXu8RRoTurNHROXDuYRkfN8xgSglI3wVjU7wOJF3F
         FUv0O0CKqhMzue5DmY28lYvKktljQXsvzI4j9laWX4SAy83s+xgxSTPClcAunrN2V3JX
         VrGerr+Z5lBz2bC1ttHDS+lRiXxU890ZlU+yMgdEr3oijCAzRUvaXLCEgKmlm/wHCKSw
         pyYQ==
X-Gm-Message-State: AC+VfDw/wm51t0N1/R9ppuMkF1rQPqkeYXqWEZlloKLVvku1Vzev8HOQ
        KpjNh6r5ZK0FWoayokzlSKNChxktWVD70e7OuN2/JA==
X-Google-Smtp-Source: ACHHUZ7CBd2wUHK8k2lgRrAuRCD05zXuyItA3V96++DWtYfbbflwkOBx5803VCm2uJlW3Pd5gPmSaLahxqRgaSxm8dA=
X-Received: by 2002:a05:622a:14d:b0:3ef:2f55:2204 with SMTP id
 v13-20020a05622a014d00b003ef2f552204mr43260qtw.6.1684452061154; Thu, 18 May
 2023 16:21:01 -0700 (PDT)
MIME-Version: 1.0
From:   Zijun Zhao <zijunzhao@google.com>
Date:   Thu, 18 May 2023 16:20:50 -0700
Message-ID: <CAELULbeXgZWn+Nw_rpUzkGgNCtb7oFf1+JS=KnNVuLhcF5Vabg@mail.gmail.com>
Subject: [PATCH] Fix the man page
To:     alx@kernel.org
Cc:     linux-man@vger.kernel.org, Elliott Hughes <enh@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Hi there,
  We are annotating settimeofday(), gettimeofday() and we will make tv
Nonnull if compilation warnings will

result. But after checking
https://elixir.bootlin.com/linux/latest/source/kernel/time/time.c#L199
nd https://elixir.bootlin.com/linux/latest/source/kernel/time/time.c#L224,

we think tv is okay to be nullable. So we make the fix to make it more clear.

Best,

Zijun Zhao
