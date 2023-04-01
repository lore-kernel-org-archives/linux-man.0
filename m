Return-Path: <linux-man-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98438C76196
	for <linux-man@archiver.kernel.org>; Sat,  1 Apr 2023 02:02:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233605AbjDACCd (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Fri, 31 Mar 2023 22:02:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233791AbjDACCV (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Fri, 31 Mar 2023 22:02:21 -0400
X-Greylist: delayed 313 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 31 Mar 2023 19:01:37 PDT
Received: from joooj.vinc17.net (joooj.vinc17.net [IPv6:2001:4b99:1:3:216:3eff:fe20:ac98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05F7723B6D
        for <linux-man@vger.kernel.org>; Fri, 31 Mar 2023 19:01:36 -0700 (PDT)
Received: from smtp-zira.vinc17.net (128.119.75.86.rev.sfr.net [86.75.119.128])
        by joooj.vinc17.net (Postfix) with ESMTPSA id 1B9A22E1;
        Sat,  1 Apr 2023 03:46:05 +0200 (CEST)
Received: by zira.vinc17.org (Postfix, from userid 1000)
        id 9C15B28001BB; Sat,  1 Apr 2023 03:46:04 +0200 (CEST)
Date:   Sat, 1 Apr 2023 03:46:04 +0200
From:   Vincent Lefevre <vincent@vinc17.net>
To:     Alejandro Colomar <alx.manpages@gmail.com>
Cc:     linux-man@vger.kernel.org
Subject: Re: [PATCH] printf.3: Fix wording for the 0 flag with given precision
Message-ID: <20230401014604.GC7123@zira.vinc17.org>
References: <20230331143332.3649621-1-vincent@vinc17.net>
 <756bf5f3-a368-be05-5177-b113abf5741e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <756bf5f3-a368-be05-5177-b113abf5741e@gmail.com>
X-Mailer-Info: https://www.vinc17.net/mutt/
User-Agent: Mutt/2.2.10+60 (d2ed5d18) vl-149028 (2023-03-25)
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Hi,

On 2023-03-31 21:35:19 +0200, Alejandro Colomar wrote:
> On 3/31/23 16:33, Vincent Lefevre wrote:
> > When a precision is given, the 0 flag is ignored only for integer
> > conversions, not for all numeric conversions.
> 
> I think I've seen some related discussion in some other list,
> right?  Could you please link to it in the commit message?

If you mean my message "printf: 0 flag and given precision for %b" in
the libc-alpha list, then this does not concern the printf man page
yet, because this man page currently does not mention %b at all (%b
is rather new, and not in the current C standard). This should be
added to the man page, but this is not trivial, and I think that the
inconsistency I've mentioned should be resolve in one way or the
other before %b is added to the man page (in order to make sure that
it does not contain something that could become obsolete).

So, does one really need the link in the commit message, while %b is
not in the man page yet?

-- 
Vincent Lefèvre <vincent@vinc17.net> - Web: <https://www.vinc17.net/>
100% accessible validated (X)HTML - Blog: <https://www.vinc17.net/blog/>
Work: CR INRIA - computer arithmetic / AriC project (LIP, ENS-Lyon)
