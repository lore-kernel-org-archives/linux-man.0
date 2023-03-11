Return-Path: <linux-man-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47B89C6FD1C
	for <linux-man@archiver.kernel.org>; Sat, 11 Mar 2023 17:14:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229919AbjCKROB (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sat, 11 Mar 2023 12:14:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229908AbjCKROA (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sat, 11 Mar 2023 12:14:00 -0500
Received: from static.213-239-213-133.clients.your-server.de (luckmann.name [213.239.213.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 987AFA02A9
        for <linux-man@vger.kernel.org>; Sat, 11 Mar 2023 09:13:59 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
  (uid 502)
  by static.213-239-213-133.clients.your-server.de with local
  id 0000000000E5416A.00000000640CB6D5.00001327; Sat, 11 Mar 2023 18:13:57 +0100
Date:   Sat, 11 Mar 2023 18:13:57 +0100
From:   Helge Kreutzmann <debian@helgefjell.de>
To:     alx.manpages@gmail.com
Cc:     mario.blaettermann@gmail.com, linux-man@vger.kernel.org
Subject: Issue in man page wcsncpy.3
Message-ID: <20230311171357.GA4888@Debian-50-lenny-64-minimal>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Public-Key-URL: http://www.helgefjell.de/data/debian_neu.asc
X-homepage: http://www.helgefjell.de/debian
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Without further ado, the following was found:

Issue:    null wide characters → NUL wide characters?

"The B<wcsncpy>()  function is the wide-character equivalent of the "
"B<strncpy>(3)  function.  It copies at most I<n> wide characters from the "
"wide-character string pointed to by I<src>, including the terminating null "
"wide character (L\\[aq]\\e0\\[aq]), to the array pointed to by I<dest>.  "
"Exactly I<n> wide characters are written at I<dest>.  If the length "
"I<wcslen(src)> is smaller than I<n>, the remaining wide characters in the "
"array pointed to by I<dest> are filled with null wide characters.  If the "
"length I<wcslen(src)> is greater than or equal to I<n>, the string pointed "
"to by I<dest> will not be terminated by a null wide character."
