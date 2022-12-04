Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21FA7C4332F
	for <linux-man@archiver.kernel.org>; Sun,  4 Dec 2022 09:07:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229785AbiLDJHf (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sun, 4 Dec 2022 04:07:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230059AbiLDJH1 (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sun, 4 Dec 2022 04:07:27 -0500
Received: from static.213-239-213-133.clients.your-server.de (luckmann.name [213.239.213.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C3DF186F9
        for <linux-man@vger.kernel.org>; Sun,  4 Dec 2022 01:07:26 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
  (uid 502)
  by static.213-239-213-133.clients.your-server.de with local
  id 0000000000E541CE.00000000638C6349.00000414; Sun, 04 Dec 2022 10:07:21 +0100
Date:   Sun, 4 Dec 2022 10:07:21 +0100
From:   Helge Kreutzmann <debian@helgefjell.de>
To:     alx.manpages@gmail.com
Cc:     mario.blaettermann@gmail.com, linux-man@vger.kernel.org
Subject: Issue in man page user_namespaces.7
Message-ID: <20221204090720.GA1027@Debian-50-lenny-64-minimal>
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

Issue:    Text missing? in order to drop → in order to drop privileges?

"/* Linux 3.19 made a change in the handling of setgroups(2) and the\n"
"   \\(aqgid_map\\(aq file to address a security issue. The issue allowed\n"
"   *unprivileged* users to employ user namespaces in order to drop\n"
"   The upshot of the 3.19 changes is that in order to update the\n"
"   \\(aqgid_maps\\(aq file, use of the setgroups() system call in this\n"
"   user namespace must first be disabled by writing \"deny\" to one of\n"
"   the /proc/PID/setgroups files for this namespace.  That is the\n"
"   purpose of the following function. */\n"
