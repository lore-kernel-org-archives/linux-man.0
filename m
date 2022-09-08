Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4690EECAAD5
	for <linux-man@archiver.kernel.org>; Thu,  8 Sep 2022 08:05:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230337AbiIHIFD (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Thu, 8 Sep 2022 04:05:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231338AbiIHIE5 (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Thu, 8 Sep 2022 04:04:57 -0400
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43F062EF19
        for <linux-man@vger.kernel.org>; Thu,  8 Sep 2022 01:04:50 -0700 (PDT)
Received: by mail-vs1-xe2a.google.com with SMTP id c3so17443557vsc.6
        for <linux-man@vger.kernel.org>; Thu, 08 Sep 2022 01:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=vh17VZbgUaOci0M4Vi06sRxkQlF7zJM8vMYQL6yh65c=;
        b=CYOH58f6R815qPSHCOVD89hgBqnHyQuX5ucspfBXPmwnqAWKVna8SINTmsskofgkVo
         SkIFMzgvpov6zBMPqhyHEKHpRVIKy437xJxbw3AwvP46ESOI+J19u1cM32llhQmdf5Eb
         rgXArb+7A3tDQwCT0yDqHgoGelqVI4xrpyMYiEx4oSOfNI59PrlWUK1FCGyEFSlIcIKS
         9mnjEgJGW254V2Yo0hQByfpbmEONSe2LGoSBl5jknREkfILl527wOe9C7llkyFAY/enj
         FejJKsmLMYG2+b8dvfJh1lVwmNdqcXi0OUEMr3MLDpmSI4YTWMoFhMXoG6PNNhOH1ZzD
         qOnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=vh17VZbgUaOci0M4Vi06sRxkQlF7zJM8vMYQL6yh65c=;
        b=tBqMSso0e/54QJM8O6aidch5K/gXWlq9q1r6OTla9ZiV0WOufgWmPkYz82kL//W4Mf
         kZ47qILpOgaLfUFzrHxVcU+dUvLIo9A4SjjkJdOn13+yRwqg5yTpGsiynZ5fhJljXjw0
         lbT62Kl/T+U/Gv+5LSNwAyYEZbsZNk1MOlDP6BK/otpDT61ci82g7aAcTqDTfiMTz+df
         LjTH8Iq7iz1ggxakAPjCx+YCxbefg1EsrudDFri1ZQUCYHM12DJbLWcVcDehzX7HZq5F
         YgKaOvmCsKWM4We5QWxe50jLtIlAn6XoElos0VNYd7mYSXD5iPBAbqmzNfHAsAu2eBGg
         4Bew==
X-Gm-Message-State: ACgBeo0JrQk2UfY/bVPtOkCNBeaPPra5mWeVqtRZTu4ygtf4+Auqpvyb
        XCTMOlnhcJrUD4Oy+xNb0Tx52/MYV7Nki7s6TnM=
X-Google-Smtp-Source: AA6agR6lnRRe9vcgJuLgYnBQoXil36i9aQ1pzEmo086gxjakoJqugSJs6qsTc32Pz6LQgpBitf97razv+gU9YQ7S8fA=
X-Received: by 2002:a67:c18a:0:b0:398:2f16:3f94 with SMTP id
 h10-20020a67c18a000000b003982f163f94mr898892vsj.36.1662624289336; Thu, 08 Sep
 2022 01:04:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220904155113.2623371-1-amir73il@gmail.com> <Yxg+OAeugyp1R1FJ@google.com>
 <CAOQ4uxgTxAqv-W7Ds+K0Mh=0v-tfS0VGxkJ6bGWwVqSQkTtNew@mail.gmail.com> <Yxk2wNx0MK333sks@google.com>
In-Reply-To: <Yxk2wNx0MK333sks@google.com>
From:   Amir Goldstein <amir73il@gmail.com>
Date:   Thu, 8 Sep 2022 11:04:37 +0300
Message-ID: <CAOQ4uxgxxhiyiDMzOznpmi-i39RJAtJEhLcQB5a4HhfLmDjtgw@mail.gmail.com>
Subject: Re: [RFC][PATCH] fanotify_mark.2: Document FAN_MARK_IGNORE
To:     Matthew Bobrowski <repnop@google.com>
Cc:     Alejandro Colomar <alx.manpages@gmail.com>,
        Jan Kara <jack@suse.cz>, linux-man <linux-man@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

> > FYI, I pushed the fixes to:
> >
> > https://github.com/amir73il/man-pages/commits/fan_mark_ignore
>
> One optional suggestion, but apart from that the refactoring LGTM.
>

Fixed and pushed.

> Reviewed-by: Matthew Bobrowski <repnop@google.com>
>

Unless Alex has any more comments on v1,
I will post the reviewed v2 after v6.0 release.

Thanks!
Amir.
