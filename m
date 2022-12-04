Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9831FC4708D
	for <linux-man@archiver.kernel.org>; Sun,  4 Dec 2022 09:07:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230015AbiLDJH0 (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sun, 4 Dec 2022 04:07:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230041AbiLDJHV (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sun, 4 Dec 2022 04:07:21 -0500
Received: from static.213-239-213-133.clients.your-server.de (luckmann.name [213.239.213.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61F711705D
        for <linux-man@vger.kernel.org>; Sun,  4 Dec 2022 01:07:20 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
  (uid 502)
  by static.213-239-213-133.clients.your-server.de with local
  id 0000000000E541A7.00000000638C6344.000002EB; Sun, 04 Dec 2022 10:07:16 +0100
Date:   Sun, 4 Dec 2022 10:07:16 +0100
From:   Helge Kreutzmann <debian@helgefjell.de>
To:     alx.manpages@gmail.com
Cc:     mario.blaettermann@gmail.com, linux-man@vger.kernel.org
Subject: Issue in man page symlink.2
Message-ID: <20221204090716.GA732@Debian-50-lenny-64-minimal>
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

Issue:   in enabled → is enabled

"The permissions of a symbolic link are irrelevant; the ownership is ignored "
"when following the link (except when the I<protected_symlinks> feature in "
"enabled, as explained in B<proc>(5)), but is checked when removal or "
"renaming of the link is requested and the link is in a directory with the "
"sticky bit (B<S_ISVTX>)  set."
