Return-Path: <linux-man-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FCE3C6FD1C
	for <linux-man@archiver.kernel.org>; Sat, 11 Mar 2023 17:14:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229628AbjCKROH (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sat, 11 Mar 2023 12:14:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229937AbjCKROE (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sat, 11 Mar 2023 12:14:04 -0500
Received: from static.213-239-213-133.clients.your-server.de (luckmann.name [213.239.213.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CA8F474CF
        for <linux-man@vger.kernel.org>; Sat, 11 Mar 2023 09:14:02 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
  (uid 502)
  by static.213-239-213-133.clients.your-server.de with local
  id 0000000000E540EB.00000000640CB6D8.00001406; Sat, 11 Mar 2023 18:14:00 +0100
Date:   Sat, 11 Mar 2023 18:14:00 +0100
From:   Helge Kreutzmann <debian@helgefjell.de>
To:     alx.manpages@gmail.com
Cc:     mario.blaettermann@gmail.com, linux-man@vger.kernel.org
Subject: Issue in man page charsets.7
Message-ID: <20230311171400.GA5109@Debian-50-lenny-64-minimal>
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

Issue:    ISO 8859 → ISO/IEC 8859

"For most texts in ISO 8859 character sets, this means that the characters "
"outside of ASCII are now coded with two bytes.  This tends to expand "
"ordinary text files by only one or two percent.  For Russian or Greek texts, "
"this expands ordinary text files by 100%, since text in those languages is "
"mostly outside of ASCII.  For Japanese users this means that the 16-bit "
"codes now in common use will take three bytes.  While there are algorithmic "
"conversions from some character sets (especially ISO 8859-1) to Unicode, "
"general conversion requires carrying around conversion tables, which can be "
"quite large for 16-bit codes."
