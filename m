Return-Path: <linux-man-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3F7DC4167B
	for <linux-man@archiver.kernel.org>; Wed,  1 Nov 2023 14:07:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235137AbjKAOHQ (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Wed, 1 Nov 2023 10:07:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235094AbjKAOHQ (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Wed, 1 Nov 2023 10:07:16 -0400
Received: from mail.helgefjell.de (unknown [IPv6:2a01:4f8:261:4d55::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 422BE83
        for <linux-man@vger.kernel.org>; Wed,  1 Nov 2023 07:07:12 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
  (uid 1002)
  by mail.helgefjell.de with local
  id 000000000002076D.0000000065425A62.000FABB1; Wed, 01 Nov 2023 14:02:10 +0000
Date:   Wed, 1 Nov 2023 14:02:10 +0000
From:   Helge Kreutzmann <debian@helgefjell.de>
To:     alx.manpages@gmail.com
Cc:     mario.blaettermann@gmail.com, linux-man@vger.kernel.org
Subject: Issue in man page getdents.2
Message-ID: <ZUJaYgHOEqVzhGhP@meinfjell.helgefjelltest.de>
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

Issue:    Zero padding byte →  null padding byte?

msgid ""
"struct linux_dirent {\n"
"    unsigned long  d_ino;     /* Inode number */\n"
"    unsigned long  d_off;     /* Offset to next I<linux_dirent> */\n"
"    unsigned short d_reclen;  /* Length of this I<linux_dirent> */\n"
"    char           d_name[];  /* Filename (null-terminated) */\n"
"                      /* length is actually (d_reclen - 2 -\n"
"                         offsetof(struct linux_dirent, d_name)) */\n"
"    /*\n"
"    char           pad;       // Zero padding byte\n"
"    char           d_type;    // File type (only since Linux\n"
"                              // 2.6.4); offset is (d_reclen - 1)\n"
"    */\n"
"}\n"
