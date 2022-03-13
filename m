Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F91BC433FE
	for <linux-man@archiver.kernel.org>; Sun, 13 Mar 2022 12:39:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233668AbiCMMkd (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sun, 13 Mar 2022 08:40:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233764AbiCMMkd (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sun, 13 Mar 2022 08:40:33 -0400
Received: from static.213-239-213-133.clients.your-server.de (luckmann.name [213.239.213.133])
        by lindbergh.monkeyblade.net (Postfix) with UTF8SMTPS id E0DAB2AE30
        for <linux-man@vger.kernel.org>; Sun, 13 Mar 2022 05:39:25 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
  (uid 502)
  by static.213-239-213-133.clients.your-server.de with local
  id 0000000000E541A0.00000000622DE4CF.0000579A; Sun, 13 Mar 2022 13:34:23 +0100
Date:   Sun, 13 Mar 2022 13:34:23 +0100
From:   Helge Kreutzmann <debian@helgefjell.de>
To:     mtk.manpages@gmail.com
Cc:     mario.blaettermann@gmail.com, linux-man@vger.kernel.org
Subject: Issue in man page proc.5
Message-ID: <20220313123423.GA22411@Debian-50-lenny-64-minimal>
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

Issue:    As of linux 5.10.103 the fields differ (more present)

"sl  local_address rem_address   st tx_queue rx_queue tr rexmits  tm-E<gt>when uid\n"
" 1: 01642C89:0201 0C642C89:03FF 01 00000000:00000001 01:000071BA 00000000 0\n"
" 1: 00000000:0801 00000000:0000 0A 00000000:00000000 00:00000000 6F000100 0\n"
" 1: 00000000:0201 00000000:0000 0A 00000000:00000000 00:00000000 00000000 0\n"
