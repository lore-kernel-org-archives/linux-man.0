Return-Path: <linux-man-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 073D4C4167B
	for <linux-man@archiver.kernel.org>; Wed,  1 Nov 2023 14:07:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344238AbjKAOHW (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Wed, 1 Nov 2023 10:07:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235583AbjKAOHU (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Wed, 1 Nov 2023 10:07:20 -0400
Received: from mail.helgefjell.de (unknown [IPv6:2a01:4f8:261:4d55::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05C9010F
        for <linux-man@vger.kernel.org>; Wed,  1 Nov 2023 07:07:17 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
  (uid 1002)
  by mail.helgefjell.de with local
  id 00000000000211D4.0000000065425A63.000FACAE; Wed, 01 Nov 2023 14:02:11 +0000
Date:   Wed, 1 Nov 2023 14:02:11 +0000
From:   Helge Kreutzmann <debian@helgefjell.de>
To:     alx.manpages@gmail.com
Cc:     mario.blaettermann@gmail.com, linux-man@vger.kernel.org
Subject: Issue in man page motd.5
Message-ID: <ZUJaY2kc5oHbc9TR@meinfjell.helgefjelltest.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Public-Key-URL: http://www.helgefjell.de/data/debian_neu.asc
X-homepage: http://www.helgefjell.de/debian
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Without further ado, the following was found:

Issue:    B<issue>(5)  B<pam_motd>(8) → B<issue>(5), B<pam_motd>(8)

"B<login>(1), B<issue>(5)  B<pam_motd>(8)"
