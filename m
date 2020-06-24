Return-Path: <SRS0=m/Ld=AF=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16E37C433E0
	for <linux-man@archiver.kernel.org>; Wed, 24 Jun 2020 10:29:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ED2FD20706
	for <linux-man@archiver.kernel.org>; Wed, 24 Jun 2020 10:29:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388176AbgFXK3s (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Wed, 24 Jun 2020 06:29:48 -0400
Received: from foss.arm.com ([217.140.110.172]:59164 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390433AbgFXK3p (ORCPT <rfc822;linux-man@vger.kernel.org>);
        Wed, 24 Jun 2020 06:29:45 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C9DAF1FB;
        Wed, 24 Jun 2020 03:29:44 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C9B133F6CF;
        Wed, 24 Jun 2020 03:29:43 -0700 (PDT)
Date:   Wed, 24 Jun 2020 11:29:41 +0100
From:   Dave Martin <Dave.Martin@arm.com>
To:     "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        linux-man <linux-man@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Will Deacon <will@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>
Subject: Re: [RFC PATCH v2 6/6] prctl.2: Add tagged address ABI control
 prctls (arm64)
Message-ID: <20200624102941.GC25945@arm.com>
References: <1590614258-24728-1-git-send-email-Dave.Martin@arm.com>
 <1590614258-24728-7-git-send-email-Dave.Martin@arm.com>
 <20200609172232.GA63286@C02TF0J2HF1T.local>
 <20200610100641.GF25945@arm.com>
 <20200610152634.GJ26099@gaia>
 <20200610164209.GH25945@arm.com>
 <20200610174205.GL26099@gaia>
 <20200615145115.GL25945@arm.com>
 <CAKgNAkgnH7f4bNiF8q-GOY_xz1x9gYnDjMTw=vpR7ONxoL=cdw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKgNAkgnH7f4bNiF8q-GOY_xz1x9gYnDjMTw=vpR7ONxoL=cdw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

On Wed, Jun 24, 2020 at 11:54:45AM +0200, Michael Kerrisk (man-pages) wrote:
> Hi Dave
> 
> Is there a plan for future work on this patch?

I think we have agreement on the content.  Mainly this is waiting for me
to repost.

Cheers
---Dave

[...]
