Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3142BC4332F
	for <linux-man@archiver.kernel.org>; Sun,  4 Dec 2022 09:07:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230057AbiLDJHb (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sun, 4 Dec 2022 04:07:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229834AbiLDJHZ (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sun, 4 Dec 2022 04:07:25 -0500
Received: from static.213-239-213-133.clients.your-server.de (luckmann.name [213.239.213.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 530A01741A
        for <linux-man@vger.kernel.org>; Sun,  4 Dec 2022 01:07:25 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
  (uid 502)
  by static.213-239-213-133.clients.your-server.de with local
  id 0000000000E541CA.00000000638C6347.000003B2; Sun, 04 Dec 2022 10:07:19 +0100
Date:   Sun, 4 Dec 2022 10:07:19 +0100
From:   Helge Kreutzmann <debian@helgefjell.de>
To:     alx.manpages@gmail.com
Cc:     mario.blaettermann@gmail.com, linux-man@vger.kernel.org
Subject: Issue in man page user_namespaces.7
Message-ID: <20221204090719.GA929@Debian-50-lenny-64-minimal>
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

Issue 1:  I</proc/ pid /setgroups> → I</proc/>pidI</setgroups>
Issue 2:  I</proc/ pid /gid_map> → I</proc/>pidI</gid_map>
Issue 3:  I</proc/ pid /gid_map> → I</proc/>pidI</gid_map>

"Writing \"I<deny>\" to the I</proc/ pid /setgroups> file before writing to "
"I</proc/ pid /gid_map> will permanently disable B<setgroups>(2)  in a user "
"namespace and allow writing to I</proc/ pid /gid_map> without having the "
"B<CAP_SETGID> capability in the parent user namespace."
