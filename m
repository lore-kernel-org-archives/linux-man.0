Return-Path: <SRS0=LENQ=6D=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32E22C4CC77
	for <linux-man@archiver.kernel.org>; Sun, 19 Apr 2020 06:53:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1B2322076A
	for <linux-man@archiver.kernel.org>; Sun, 19 Apr 2020 06:53:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726091AbgDSGxF (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sun, 19 Apr 2020 02:53:05 -0400
Received: from luckmann.name ([213.239.213.133]:55513 "EHLO
        static.213-239-213-133.clients.your-server.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726055AbgDSGxF (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sun, 19 Apr 2020 02:53:05 -0400
Received: from localhost (localhost [127.0.0.1])
  (uid 502)
  by static.213-239-213-133.clients.your-server.de with local
  id 0000000000E5614E.000000005E9BF423.00007813; Sun, 19 Apr 2020 08:48:03 +0200
Date:   Sun, 19 Apr 2020 08:48:03 +0200
From:   Helge Kreutzmann <debian@helgefjell.de>
To:     mtk.manpages@gmail.com
Cc:     linux-man@vger.kernel.org
Subject: Errors in man pages, here: gethostbyname(3): Mixed brackets
Message-ID: <20200419064803.GA30724@Debian-50-lenny-64-minimal>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
X-Public-Key-URL: http://www.helgefjell.de/data/debian_neu.asc
X-homepage: http://www.helgefjell.de/debian
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Dear manpages maintainers.
the manpage-l10n project maintains a large number of translations of
man pages both from a large variety of sources (including manpages) as
well for a large variety of target languages.

During their work translators notice different possible issues in the
original (english) man pages. Sometiems this is a straightforward
typo, sometimes a hard to read sentence, sometimes this is a convention
not held up and sometimes we simply do not understand the original.

We use several distributions as sources and update regularly (at
least every 2 month). This means we are fairly recent (some
distributions like archlinux also update frequently) but might miss
the latest upstream version once a while, so the error might be
already fixed. We apologize and ask you to close the issue immediately
if this should be the case, but given the huge volume of projects and
the very limited number of volunteers we are not able to double check
each and every issue.

Secondly we translators see the manpages in the neutral po format,
i.e. converted and harmonized, but not the original source (be it man,
groff, xml or other). So we cannot provide a true patch (where
possible), but only an approximation which you need to translate into
your source format.

Finally the issues I'm reporting have accumulated over time and are
not always discovered by me, so sometimes my description of the
problem my be a bit limited - do not hesitate to ask so we can clarify
them.

I'm now reporting the errors for your project. As requested, each
issue is sent in an unique mail for easier tracking on your side. If
future reports should use another channel, please let me know.

**

Second last line: s/(B<nsswitch.conf(5))>/(B<nsswitch.conf(5)>)/

"The domain name queries carried out by B<gethostbyname>()  and "
"B<gethostbyaddr>()  rely on the Name Service Switch (B<nsswitch.conf>(5))  "
"configured sources or a local name server (B<named>(8)).  The default action "
"is to query the Name Service Switch (B<nsswitch.conf(5))> configured "
"sources, failing that, a local name server (B<named>(8))."

-- 
      Dr. Helge Kreutzmann                     debian@helgefjell.de
           Dipl.-Phys.                   http://www.helgefjell.de/debian.php
        64bit GNU powered                     gpg signed mail preferred
           Help keep free software libre: http://www.ffii.de/
