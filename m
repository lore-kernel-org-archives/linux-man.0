Return-Path: <SRS0=Yzcv=6S=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14557C3A5A9
	for <linux-man@archiver.kernel.org>; Mon,  4 May 2020 12:43:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F0EFD20661
	for <linux-man@archiver.kernel.org>; Mon,  4 May 2020 12:43:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728846AbgEDMni (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 4 May 2020 08:43:38 -0400
Received: from mx2.suse.de ([195.135.220.15]:36564 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727813AbgEDMni (ORCPT <rfc822;linux-man@vger.kernel.org>);
        Mon, 4 May 2020 08:43:38 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id A80C4AF2A;
        Mon,  4 May 2020 12:43:38 +0000 (UTC)
Date:   Mon, 4 May 2020 14:43:34 +0200
From:   Petr Vorel <pvorel@suse.cz>
To:     Jann Horn <jannh@google.com>,
        Michael Kerrisk-manpages <mtk.manpages@gmail.com>
Cc:     linux-man <linux-man@vger.kernel.org>
Subject: Re: open_tree() manpage submission fell through the cracks?
Message-ID: <20200504124334.GA19904@dell5510>
Reply-To: Petr Vorel <pvorel@suse.cz>
References: <CAG48ez3xjhUDd3qMm=cEa+asLvrQOXEpVs4_w6Y6MuerymMbCg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG48ez3xjhUDd3qMm=cEa+asLvrQOXEpVs4_w6Y6MuerymMbCg@mail.gmail.com>
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Hi Jann,

> I noticed that open_tree() doesn't have a manpage yet; and while
> looking for a WIP manpage on the lists, I found this mail, which is
> from February, submits manpages for open_tree() and other related
> syscalls, and doesn't seem to have a response from you:

> https://lore.kernel.org/linux-fsdevel/20200207174236.18882-1-pvorel@suse.cz/

> I wonder whether maybe you haven't seen that mail in the first place.
> It was addressed to linux-man@vger.kernel.org as "To" and
> mtk.manpages@gmail.com as "Cc", which is the reverse of what's
> suggested at <https://www.kernel.org/doc/man-pages/patches.html>...
> maybe that runs into some filter on your side? Or maybe it just landed
> in a spam filter somewhere or something like that?

Thanks for pointing out this patchset and also preferred way to send patches.

I'd also appreciate these new syscalls were documented, thus
I've pinged Michael some time ago and got his reply:
https://lore.kernel.org/linux-man/9655825c-be5d-3941-60da-ccb8e5e433cb@gmail.com/

He's probably just too busy.

Kind regards,
Petr
