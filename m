Return-Path: <linux-man-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 672CBC74A5B
	for <linux-man@archiver.kernel.org>; Sat, 11 Mar 2023 17:14:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbjCKRN7 (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sat, 11 Mar 2023 12:13:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229910AbjCKRN6 (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sat, 11 Mar 2023 12:13:58 -0500
Received: from static.213-239-213-133.clients.your-server.de (luckmann.name [213.239.213.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3D85968FE
        for <linux-man@vger.kernel.org>; Sat, 11 Mar 2023 09:13:57 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
  (uid 502)
  by static.213-239-213-133.clients.your-server.de with local
  id 0000000000E540F3.00000000640CB6D4.000012D6; Sat, 11 Mar 2023 18:13:56 +0100
Date:   Sat, 11 Mar 2023 18:13:56 +0100
From:   Helge Kreutzmann <debian@helgefjell.de>
To:     alx.manpages@gmail.com
Cc:     mario.blaettermann@gmail.com, linux-man@vger.kernel.org
Subject: Issue in man page session-keyring.7
Message-ID: <20230311171356.GA4805@Debian-50-lenny-64-minimal>
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

Issue:    PAM → B<PAM>(7)

"The session keyring is a keyring used to anchor keys on behalf of a "
"process.  It is typically created by B<pam_keyinit>(8)  when a user logs in "
"and a link will be added that refers to the B<user-keyring>(7).  Optionally, "
"PAM may revoke the session keyring on logout.  (In typical configurations, "
"PAM does do this revocation.)  The session keyring has the name "
"(description)  I<_ses>."
