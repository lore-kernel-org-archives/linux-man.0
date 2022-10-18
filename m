Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06842C43217
	for <linux-man@archiver.kernel.org>; Tue, 18 Oct 2022 21:54:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229509AbiJRVy4 (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Tue, 18 Oct 2022 17:54:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbiJRVyz (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Tue, 18 Oct 2022 17:54:55 -0400
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com [IPv6:2001:4860:4864:20::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37B0540E33
        for <linux-man@vger.kernel.org>; Tue, 18 Oct 2022 14:54:54 -0700 (PDT)
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-132fb4fd495so18448697fac.12
        for <linux-man@vger.kernel.org>; Tue, 18 Oct 2022 14:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vg0Pcs10Y92MsNWsNPF7sv/sR53jtyZyeD2Za0Kgcdw=;
        b=N4HpQK/GZ7fxikFLN08ygHMbQJ0CNQnd6j6xW4f4tUOgjLxGJ1QtijxStMRMu4coEW
         +H1382tHH0EzW22OPoEwiRb7pqB7fiv5LAvys2V3MnBUyTelJvfFFUjHEJDL1HuYDXTt
         XQSTXgrgqHcyZPkHYkQsrqH+QaOHBZcMdn55mUBDLN5VGqzNPqzazlzpqJjImG6X/8VA
         0EyWdl6XmprwvsPgS3t/Xm2I+cLcmyT9+5vfc13rEC95Kjqo78jvK3H3sLagrbqZHLZC
         s8qxC7ETrRsOLq27Qem5DG6ePFU53V/I21zBiTUWwccIlxseRlmT3jnADQaxskQXTdW8
         jttQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vg0Pcs10Y92MsNWsNPF7sv/sR53jtyZyeD2Za0Kgcdw=;
        b=00rxLkgOAt+MCzgw8VCMf9g5dK9hmLSLdryY7CdDncHT+cwyU055vSYUwzbtyLeIPg
         cnexaVf6sdmzWbLHs36waz1Z/OsTQbu8pAI3bLOOe44EXPhNW4j8E2jPnB+0V4girxTg
         51GuCBPAaCXyWzU4fgzaT6CZX5dwD2LZ5Dd7XYbnZY/6X30StexRmyHxkeIAyNE6aKsO
         4xZxBSqJGHih3XTxlt066avIW8BRF6WvF7DGhNtizksuwuCaZPMZ1tFcKwbodnHJZKI6
         v2FZBf/JPMvGTZrnyW0aQniScq+Nfy9Z3mkEiqtUvCAMEdfFuMIk8umPmGEQrSQvrJ2a
         ub4A==
X-Gm-Message-State: ACrzQf1u238uOXY+22HJGoqptO6ZyRJajFpavBUk4EfpYSczvOMDyglL
        ZYta07bFtu4ALDLPYqSu25z2PA+mH7Y435QobqdRmw==
X-Google-Smtp-Source: AMsMyM7XrQbi06W+gjRcTz+WgL5SSxyvGih+iSbwSDcckk/j7tSXbhbXjZ7M9kVfJKHI/MqHEp3GVEtc8Wrxi+0fkU8=
X-Received: by 2002:a05:6870:7023:b0:132:538:43e7 with SMTP id
 u35-20020a056870702300b00132053843e7mr2852494oae.123.1666130093426; Tue, 18
 Oct 2022 14:54:53 -0700 (PDT)
MIME-Version: 1.0
References: <20221017175523.2048887-1-zokeefe@google.com> <20221017175523.2048887-5-zokeefe@google.com>
 <0e980bc2-d8a8-1ad0-2660-cc9f7f8568a3@gmail.com>
In-Reply-To: <0e980bc2-d8a8-1ad0-2660-cc9f7f8568a3@gmail.com>
From:   "Zach O'Keefe" <zokeefe@google.com>
Date:   Tue, 18 Oct 2022 14:54:17 -0700
Message-ID: <CAAa6QmRu6CkLi9N0BxXmuj0kcwaG386iBqu6MesT-=Kt_HmkhA@mail.gmail.com>
Subject: Re: [PATCH man-pages 4/4] madvise.2: add documentation for MADV_COLLAPSE
To:     Alex Colomar <alx.manpages@gmail.com>
Cc:     Yang Shi <shy828301@gmail.com>, linux-mm@kvack.org,
        linux-man@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Hey Alex,

On Tue, Oct 18, 2022 at 3:47 AM Alex Colomar <alx.manpages@gmail.com> wrote:
>
> Hi Zach,
>
> On 10/17/22 19:55, Zach OKeefe wrote:
> > From: Zach O'Keefe <zokeefe@google.com>
> >
> > Linux 6.1 introduced MADV_COLLAPSE in upstream commit 7d8faaf15545
> > ("mm/madvise: introduce MADV_COLLAPSE sync hugepage collapse") and
> > upstream commit 34488399fa08 ("mm/madvise: add file and shmem support to
> > MADV_COLLAPSE").  Update the man-pages for madvise(2) and
> > process_madvise(2).
> >
> > Link: https://lore.kernel.org/linux-mm/20220922224046.1143204-1-zokeefe@google.com/
> > Link: https://lore.kernel.org/linux-mm/20220706235936.2197195-1-zokeefe@google.com/
> > Signed-off-by: Zach O'Keefe <zokeefe@google.com>
>
> Please see some comments below.
> There are a few more cases were I'd break the lines at different points,
> but there are few, so I'll apply them with an amend.
>
> Thanks!
>
> Alex

Thank you :) Greatly appreciated. I'll take a look at the patch
post-amend to see what I could have done. All the mentioned fixes
(thanks for pointing them out) will be included in v2.

Best,
Zach
