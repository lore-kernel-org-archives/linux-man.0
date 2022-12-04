Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C484DC3A5A7
	for <linux-man@archiver.kernel.org>; Sun,  4 Dec 2022 09:07:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbiLDJHe (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sun, 4 Dec 2022 04:07:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230056AbiLDJH1 (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sun, 4 Dec 2022 04:07:27 -0500
Received: from static.213-239-213-133.clients.your-server.de (luckmann.name [213.239.213.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E133C167D9
        for <linux-man@vger.kernel.org>; Sun,  4 Dec 2022 01:07:26 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
  (uid 502)
  by static.213-239-213-133.clients.your-server.de with local
  id 0000000000E541CC.00000000638C6348.000003F9; Sun, 04 Dec 2022 10:07:20 +0100
Date:   Sun, 4 Dec 2022 10:07:20 +0100
From:   Helge Kreutzmann <debian@helgefjell.de>
To:     alx.manpages@gmail.com
Cc:     mario.blaettermann@gmail.com, linux-man@vger.kernel.org
Subject: Issue in man page user_namespaces.7
Message-ID: <20221204090720.GA1002@Debian-50-lenny-64-minimal>
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

Issue:    I<usage()>  → I<usage>()

"The program below is designed to allow experimenting with user namespaces, "
"as well as other types of namespaces.  It creates namespaces as specified by "
"command-line options and then executes a command inside those namespaces.  "
"The comments and I<usage()> function inside the program provide a full "
"explanation of the program.  The following shell session demonstrates its "
"use."
