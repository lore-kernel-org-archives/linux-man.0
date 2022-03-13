Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC4FEC4332F
	for <linux-man@archiver.kernel.org>; Sun, 13 Mar 2022 12:39:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233811AbiCMMkl (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sun, 13 Mar 2022 08:40:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233831AbiCMMkk (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sun, 13 Mar 2022 08:40:40 -0400
Received: from static.213-239-213-133.clients.your-server.de (luckmann.name [213.239.213.133])
        by lindbergh.monkeyblade.net (Postfix) with UTF8SMTPS id 3708B2B1AF
        for <linux-man@vger.kernel.org>; Sun, 13 Mar 2022 05:39:33 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
  (uid 502)
  by static.213-239-213-133.clients.your-server.de with local
  id 0000000000E541BB.00000000622DE4D3.00005880; Sun, 13 Mar 2022 13:34:27 +0100
Date:   Sun, 13 Mar 2022 13:34:27 +0100
From:   Helge Kreutzmann <debian@helgefjell.de>
To:     mtk.manpages@gmail.com
Cc:     mario.blaettermann@gmail.com, linux-man@vger.kernel.org
Subject: Issue in man page console_codes.4
Message-ID: <20220313123427.GA22641@Debian-50-lenny-64-minimal>
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

Issue:    Missing full stop?

"Cursor to lower left corner of screen (if enabled\n"
"by B<xterm>(1)'s B<hpLowerleftBugCompat> resource)"
