Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EECCC4332F
	for <linux-man@archiver.kernel.org>; Sun,  4 Dec 2022 09:07:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230039AbiLDJH0 (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sun, 4 Dec 2022 04:07:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230015AbiLDJHV (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sun, 4 Dec 2022 04:07:21 -0500
Received: from static.213-239-213-133.clients.your-server.de (luckmann.name [213.239.213.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61EF9167D9
        for <linux-man@vger.kernel.org>; Sun,  4 Dec 2022 01:07:20 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
  (uid 502)
  by static.213-239-213-133.clients.your-server.de with local
  id 0000000000E540D4.00000000638C6344.000002D2; Sun, 04 Dec 2022 10:07:16 +0100
Date:   Sun, 4 Dec 2022 10:07:16 +0100
From:   Helge Kreutzmann <debian@helgefjell.de>
To:     alx.manpages@gmail.com
Cc:     mario.blaettermann@gmail.com, linux-man@vger.kernel.org
Subject: Issue in man page strcat.3
Message-ID: <20221204090716.GA707@Debian-50-lenny-64-minimal>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
X-Public-Key-URL: http://www.helgefjell.de/data/debian_neu.asc
X-homepage: http://www.helgefjell.de/debian
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Without further ado, the following was found:

Issue:   The variable I<size> is not defined above in the summary? Is this I<n>?

"This function appends the null-terminated string I<src> to the string "
"I<dest>, copying at most I<size-strlen(dest)-1> from I<src>, and adds a "
"terminating null byte to the result, I<unless> I<size> is less than "
"I<strlen(dest)>.  This function fixes the buffer overrun problem of "
"B<strcat>(), but the caller must still handle the possibility of data loss "
"if I<size> is too small.  The function returns the length of the string "
"B<strlcat>()  tried to create; if the return value is greater than or equal "
"to I<size>, data loss occurred.  If data loss matters, the caller I<must> "
"either check the arguments before the call, or test the function return "
"value.  B<strlcat>()  is not present in glibc and is not standardized by "
"POSIX, but is available on Linux via the I<libbsd> library."
