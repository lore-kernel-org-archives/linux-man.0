Return-Path: <SRS0=rizQ=6U=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6226FC28CBC
	for <linux-man@archiver.kernel.org>; Wed,  6 May 2020 10:34:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4358020663
	for <linux-man@archiver.kernel.org>; Wed,  6 May 2020 10:34:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728716AbgEFKe5 (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Wed, 6 May 2020 06:34:57 -0400
Received: from foss.arm.com ([217.140.110.172]:33354 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728890AbgEFKe4 (ORCPT <rfc822;linux-man@vger.kernel.org>);
        Wed, 6 May 2020 06:34:56 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A2101FB;
        Wed,  6 May 2020 03:34:56 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 843823F71F;
        Wed,  6 May 2020 03:34:55 -0700 (PDT)
Date:   Wed, 6 May 2020 11:34:53 +0100
From:   Dave Martin <Dave.Martin@arm.com>
To:     "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc:     Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-man@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] syscall.2: arm: Use real register names for arm/OABI
Message-ID: <20200506103453.GS30377@arm.com>
References: <1588692280-15878-1-git-send-email-Dave.Martin@arm.com>
 <1588692280-15878-2-git-send-email-Dave.Martin@arm.com>
 <9c75b89f-be1e-52a7-e98c-46b7dfe89d1d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c75b89f-be1e-52a7-e98c-46b7dfe89d1d@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

On Wed, May 06, 2020 at 12:05:00PM +0200, Michael Kerrisk (man-pages) wrote:
> On 5/5/20 5:24 PM, Dave Martin wrote:
> > The arm OABI syscall interface is currently documented in terms of
> > register name aliases defined by the ARM Procedure Call Standard
> > (APCS).  However, these don't make sense in the context of a binary
> > interface that doesn't comply (or need to comply) with APCS.
> > 
> > Use the real architectural register names instead.
> > 
> > The names a1-a4, v1... are just aliases for r0-r3, r4... anyway, so
> > the interface is just the same regardless of which set of names is
> > used.
> > 
> > Signed-off-by: Dave Martin <Dave.Martin@arm.com>
> 
> Thanks, Dave. Patch applied, with Russell's Acked-by added.
> 
> Cheers,
> 
> Michael

Thanks!
---Dave
