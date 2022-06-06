Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A80FC433EF
	for <linux-man@archiver.kernel.org>; Mon,  6 Jun 2022 21:10:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229725AbiFFVK4 (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 6 Jun 2022 17:10:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229559AbiFFVK4 (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Mon, 6 Jun 2022 17:10:56 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39E4F22B3C
        for <linux-man@vger.kernel.org>; Mon,  6 Jun 2022 14:10:55 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 71170101D08; Mon,  6 Jun 2022 22:10:53 +0100 (BST)
Date:   Mon, 6 Jun 2022 22:10:53 +0100
From:   Sean Young <sean@mess.org>
To:     Alejandro Colomar <alx.manpages@gmail.com>
Cc:     linux-man@vger.kernel.org
Subject: Re: [PATCH] lirc.4: document lirc changes in the kernel
Message-ID: <Yp5tXfE/rn2C7uC+@gofer.mess.org>
References: <Yos/9usw6be5l4jh@gofer.mess.org>
 <ab4bc63e-f497-d5e3-1a9a-f58e12f52b0c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab4bc63e-f497-d5e3-1a9a-f58e12f52b0c@gmail.com>
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Hi Alex,

On Mon, Jun 06, 2022 at 09:14:22PM +0200, Alejandro Colomar wrote:
> On 5/23/22 10:04, Sean Young wrote:
> > Linux 5.17 makes LIRC_SET_REC_TIMEOUT_REPORTS an no-op and 5.18
> > introduces LIRC_OVERFLOW. Also some rewording to clarify.
> > 
> > Signed-off-by: Sean Young <sean@mess.org>
> 
> Could you please provide some kernel commits that show these changes?
> It would be nice to be able to easily check.

Of course, I should have included that in the first place

68a99f6a0ebfe media: lirc: report ir receiver overflow
74747dda582dc media: lirc: always send timeout reports

Thanks,
Sean
