Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08103C433F5
	for <linux-man@archiver.kernel.org>; Sun, 13 Mar 2022 12:39:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233628AbiCMMka (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sun, 13 Mar 2022 08:40:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230181AbiCMMk3 (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sun, 13 Mar 2022 08:40:29 -0400
Received: from static.213-239-213-133.clients.your-server.de (luckmann.name [213.239.213.133])
        by lindbergh.monkeyblade.net (Postfix) with UTF8SMTPS id EA0E62AE02
        for <linux-man@vger.kernel.org>; Sun, 13 Mar 2022 05:39:20 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
  (uid 502)
  by static.213-239-213-133.clients.your-server.de with local
  id 0000000000E54054.00000000622DE4CB.00005688; Sun, 13 Mar 2022 13:34:19 +0100
Date:   Sun, 13 Mar 2022 13:34:19 +0100
From:   Helge Kreutzmann <debian@helgefjell.de>
To:     mtk.manpages@gmail.com
Cc:     mario.blaettermann@gmail.com, linux-man@vger.kernel.org
Subject: Issue in man page mount_namespaces.7
Message-ID: <20220313123419.GA22137@Debian-50-lenny-64-minimal>
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

Issue:    Documentation/filesystems/sharedsubtree.txt → Documentation/filesystems/sharedsubtree.rst

"For further details, see I<Documentation/filesystems/sharedsubtree.txt> in "
"the kernel source tree."
