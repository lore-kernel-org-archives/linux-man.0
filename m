Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A936C43334
	for <linux-man@archiver.kernel.org>; Wed,  6 Jul 2022 18:20:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbiGFSU3 (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Wed, 6 Jul 2022 14:20:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229757AbiGFSU2 (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Wed, 6 Jul 2022 14:20:28 -0400
X-Greylist: delayed 1801 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 06 Jul 2022 11:20:27 PDT
Received: from smtp.umanwizard.com (smtp.umanwizard.com [54.203.248.109])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 47B3D1EACD
        for <linux-man@vger.kernel.org>; Wed,  6 Jul 2022 11:20:27 -0700 (PDT)
X-Fes-Received-For: linux-man@vger.kernel.org
X-Fes-Received-From: brennan@umanwizard.com
Received: From [10.10.1.216] ([173.205.212.102]) By umanwizard.com ; 6 Jul 2022 17:50:25+0000
Message-ID: <03d96648-b20d-7ceb-20bf-5936242c76c4@umanwizard.com>
Date:   Wed, 6 Jul 2022 13:50:23 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To:     mtk.manpages@gmail.com, alx.manpages@gmail.com
Cc:     linux-man@vger.kernel.org
From:   Brennan Vincent <brennan@umanwizard.com>
Subject: Incomplete list of possible error codes in getsockopt.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Fes-Encrypted: true
X-Fes-Ehlo-Domain: [10.10.1.216]
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Hello,

ENOENT is not documented in the ERRORS section of getsockopt.2.

But ENOENT can be returned for the option SO_ORIGINAL_DST, as can
be seen here: https://github.com/torvalds/linux/blob/b00ed48bb0a7/net/netfilter/nf_conntrack_proto.c#L305-L305

Thanks,
