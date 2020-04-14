Return-Path: <SRS0=WE5q=56=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44F50C2BA19
	for <linux-man@archiver.kernel.org>; Tue, 14 Apr 2020 18:10:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2577620767
	for <linux-man@archiver.kernel.org>; Tue, 14 Apr 2020 18:10:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731313AbgDNSKE (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Tue, 14 Apr 2020 14:10:04 -0400
Received: from mx2.suse.de ([195.135.220.15]:60838 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731269AbgDNSKD (ORCPT <rfc822;linux-man@vger.kernel.org>);
        Tue, 14 Apr 2020 14:10:03 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id EC39EAE24;
        Tue, 14 Apr 2020 18:10:01 +0000 (UTC)
Date:   Tue, 14 Apr 2020 20:10:01 +0200
From:   Petr Vorel <pvorel@suse.cz>
To:     "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc:     linux-man@vger.kernel.org, David Howells <dhowells@redhat.com>
Subject: Re: [PATCH 1/1] getdents.2: Mention glibc support for getdents64()
Message-ID: <20200414181001.GA619561@x230>
Reply-To: Petr Vorel <pvorel@suse.cz>
References: <20191007135315.2214-1-pvorel@suse.cz>
 <39488d73-6d42-3213-98c3-5dc4f54203aa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <39488d73-6d42-3213-98c3-5dc4f54203aa@gmail.com>
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Hi Michael,

> On 10/7/19 3:53 PM, Petr Vorel wrote:
> > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> > ---
> >  man2/getdents.2 | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)

> > diff --git a/man2/getdents.2 b/man2/getdents.2
> > index 712d23c58..a6b7aad1f 100644

> Thanks. Patch applied.
Thanks a lot. I still don't see this patch in master (nor in other branches),
but you just maybe haven't pushed the changes.

BTW it'd be great if you push patch "Add manpage for fsopen(2), fspick(2) and
fsmount(2)" [1] and "Add manpages for move_mount(2) and open_tree(2)" [2] I sent
2 months ago. It's based on David Howells' work with few obvious fixes.
It might not be perfect, but IMHO it's a good start and it'd be great to have
these recent syscalls documented.

Kind regards,
Petr

[1] https://marc.info/?l=linux-man&m=158109737807969&w=2
[2] https://marc.info/?l=linux-man&m=158109737907972&w=2
