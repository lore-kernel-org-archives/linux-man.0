Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A296C433EF
	for <linux-man@archiver.kernel.org>; Fri, 13 May 2022 17:44:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382157AbiEMRoi (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Fri, 13 May 2022 13:44:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242071AbiEMRoh (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Fri, 13 May 2022 13:44:37 -0400
X-Greylist: delayed 904 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 13 May 2022 10:44:35 PDT
Received: from brightrain.aerifal.cx (brightrain.aerifal.cx [216.12.86.13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89448E733B
        for <linux-man@vger.kernel.org>; Fri, 13 May 2022 10:44:35 -0700 (PDT)
Date:   Fri, 13 May 2022 13:29:30 -0400
From:   Rich Felker <dalias@libc.org>
To:     Michael Kerrisk <mtk.manpages@gmail.com>
Cc:     linux-man@vger.kernel.org
Subject: Erroneous text about POSIX in tmpfile(3) man page
Message-ID: <20220513172929.GA15832@brightrain.aerifal.cx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

tmpfile.3 contains the following text:

NOTES
       POSIX.1-2001 specifies: an error message may be written to stdout if
       the stream cannot be opened.

I can find no such text in POSIX.1-2001 (looking at
https://pubs.opengroup.org/onlinepubs/007904975/functions/tmpfile.html)
and such an allowance would contradict ISO C which makes no such
allowance for it to write to stdout. I'm not sure where this came from
but it should probably be removed, or changed to indicate whichever
historical implementation wrongly did this if there was one.

Rich
