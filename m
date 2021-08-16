Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6361EC4338F
	for <linux-man@archiver.kernel.org>; Mon, 16 Aug 2021 21:39:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3CB7A60EE4
	for <linux-man@archiver.kernel.org>; Mon, 16 Aug 2021 21:39:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232058AbhHPVju convert rfc822-to-8bit (ORCPT
        <rfc822;linux-man@archiver.kernel.org>);
        Mon, 16 Aug 2021 17:39:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229987AbhHPVju (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Mon, 16 Aug 2021 17:39:50 -0400
X-Greylist: delayed 222 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 16 Aug 2021 14:39:17 PDT
Received: from herc.mirbsd.org (herc.mirbsd.org [IPv6:2001:470:1f15:10c:202:b3ff:feb7:54e8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id F0CD0C061764
        for <linux-man@vger.kernel.org>; Mon, 16 Aug 2021 14:39:17 -0700 (PDT)
Received: from herc.mirbsd.org (tg@herc.mirbsd.org [192.168.0.82])
        by herc.mirbsd.org (8.14.9/8.14.5) with ESMTP id 17GLYxxl001289
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
        for <linux-man@vger.kernel.org>; Mon, 16 Aug 2021 21:35:06 GMT
Date:   Mon, 16 Aug 2021 21:34:59 +0000 (UTC)
From:   Thorsten Glaser <tg@debian.org>
X-X-Sender: tg@herc.mirbsd.org
To:     linux-man@vger.kernel.org
Subject: request: calling conventions documentation
Message-ID: <Pine.BSM.4.64L.2108162130380.2192@herc.mirbsd.org>
Content-Language: de-DE-1901, en-GB
X-Message-Flag: Your mailer is broken. Get an update at http://www.washington.edu/pine/getpine/pcpine.html for free.
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Hi,

I hope I’m right here, I wasn’t sure whether Bugzilla is also for
feature requests.

syscall(2) on my Debian systems has these wonderful tables for the
calling conventions on all kinds of CPU architectures. I often have
to debug various things in various libcs on various platforms for
various bugs ☺ and would love it if this information could somehow
be extended by the relevant userspace calling conventions (so I can
read “foreign”, i.e. not i8086/i386 Intel, assembly more easily,
figure out the bugs in their {,sig}{set,long}jmp implementations,
write patches without extra digging, etc.

I’m aware that linux-man is probably more kernel-oriented and
conventions can differ by libcs (e.g. I’ve seen libcs that use
a regparm convention on i386), but the “standard” case should
be sufficiently on topic (especially as I think the vDSO would
also use these conventions).

Things like, what arguments go into which registers, which are
saved by who, etc.

Thanks in advance,
//mirabilos
-- 
FWIW, I'm quite impressed with mksh interactively. I thought it was much
*much* more bare bones. But it turns out it beats the living hell out of
ksh93 in that respect. I'd even consider it for my daily use if I hadn't
wasted half my life on my zsh setup. :-) -- Frank Terbeck in #!/bin/mksh
