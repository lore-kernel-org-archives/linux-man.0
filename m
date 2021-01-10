Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48DCFC433DB
	for <linux-man@archiver.kernel.org>; Sun, 10 Jan 2021 17:51:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 09BFA2253A
	for <linux-man@archiver.kernel.org>; Sun, 10 Jan 2021 17:51:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726263AbhAJRvY (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sun, 10 Jan 2021 12:51:24 -0500
Received: from vmicros1.altlinux.org ([194.107.17.57]:59974 "EHLO
        vmicros1.altlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726250AbhAJRvY (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sun, 10 Jan 2021 12:51:24 -0500
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
        by vmicros1.altlinux.org (Postfix) with ESMTP id 456A572C8BB;
        Sun, 10 Jan 2021 20:50:43 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
        id 365CC7CC89F; Sun, 10 Jan 2021 20:50:43 +0300 (MSK)
Date:   Sun, 10 Jan 2021 20:50:43 +0300
From:   "Dmitry V. Levin" <ldv@altlinux.org>
To:     Bruno Haible <bruno@clisp.org>
Cc:     mtk.manpages@gmail.com, linux-man@vger.kernel.org
Subject: Re: [patch] chmod.2, lchmod.3: Document lchmod()
Message-ID: <20210110175042.GD25737@altlinux.org>
References: <39277473.ZaUlkdM7pu@omega>
 <20210110074159.GA20991@altlinux.org>
 <1945428.G7aTUhjore@omega>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1945428.G7aTUhjore@omega>
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

On Sun, Jan 10, 2021 at 11:05:16AM +0100, Bruno Haible wrote:
> Dmitry V. Levin wrote:
> > > Here is a patch to update the man pages accordingly.
> > 
> > Please note the important limitation of that implementation:
> > it doesn't work when /proc is not mounted, see
> > https://sourceware.org/bugzilla/show_bug.cgi?id=26401
> 
> Thanks for the pointer. Revised patch attached.

LGTM, thanks.


-- 
ldv
