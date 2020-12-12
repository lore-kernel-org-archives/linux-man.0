Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 465ECC4361B
	for <linux-man@archiver.kernel.org>; Sat, 12 Dec 2020 12:17:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 106BF22D6F
	for <linux-man@archiver.kernel.org>; Sat, 12 Dec 2020 12:17:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438831AbgLLMRG (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sat, 12 Dec 2020 07:17:06 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:55286 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438832AbgLLMRG (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sat, 12 Dec 2020 07:17:06 -0500
Received: from ip5f5af0a0.dynamic.kabel-deutschland.de ([95.90.240.160] helo=wittgenstein)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <christian.brauner@ubuntu.com>)
        id 1ko3p2-0005u3-44; Sat, 12 Dec 2020 12:16:24 +0000
Date:   Sat, 12 Dec 2020 13:16:23 +0100
From:   Christian Brauner <christian.brauner@ubuntu.com>
To:     "Alejandro Colomar (man-pages)" <alx.manpages@gmail.com>
Cc:     Stephen Kitt <steve@sk2.org>, linux-man@vger.kernel.org,
        Michael Kerrisk <mtk.manpages@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] close_range.2: new page documenting close_range(2)
Message-ID: <20201212121623.tqkobuaptzm3qdib@wittgenstein>
References: <20201209220023.17912-1-steve@sk2.org>
 <e50183ce-3ccb-c41c-9d30-bfb622b3b1f5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e50183ce-3ccb-c41c-9d30-bfb622b3b1f5@gmail.com>
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

On Thu, Dec 10, 2020 at 01:24:28AM +0100, Alejandro Colomar (man-pages) wrote:
> Hi Stephen,
> 
> A few more comments below.
> 
> Michael, please have a look at them too.
> 
> Christian, do you have any program that you used to test the syscall
> that could be added as an example program to the page?

As with all non-trivial feature patchsets going through my tree we've
added selftests. :)

tools/testing/selftests/core/close_range_test.c

It should be fairly simply to extract a tinified example from there.

Thanks!
Christian
