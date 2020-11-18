Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6081C63798
	for <linux-man@archiver.kernel.org>; Wed, 18 Nov 2020 14:46:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3FE3D246EA
	for <linux-man@archiver.kernel.org>; Wed, 18 Nov 2020 14:46:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="USgVAi0Z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727059AbgKROqW (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Wed, 18 Nov 2020 09:46:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726590AbgKROqW (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Wed, 18 Nov 2020 09:46:22 -0500
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA47EC0613D4;
        Wed, 18 Nov 2020 06:46:21 -0800 (PST)
Received: by mail-qt1-x841.google.com with SMTP id v11so1701422qtq.12;
        Wed, 18 Nov 2020 06:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a2t5AC/LyOIXB7jblxMOM9mVXhxNY++q5sdZhjIQ5zY=;
        b=USgVAi0ZRpO6fOLA6HrFTwARmz36wNcGjU4hPG2t+axZrJVnafnchSoVBL1tJhpUab
         vBbFAxBPksWskEkugErnRsztEu+k0rpqg8TW8TIyT19AILEvweyiWLQg6A1MT0Pa9Lrp
         l/zDdb1IpFR9f4fl53koChAdwuFmHc+DGiDTMI8YNmSImv4Cwzy3QNYmlGcGoGxyCKfX
         DoXdcbptNbQabtOdGwLPkKTieUUSQNYeIf3VBnmR5yFL6ooAA9sIV8aWBL7cd7sZypJs
         72dTTA7KNUZzy/ybSUCAH6LUoieyDl/kk1PRQhAJ4eP7QR5LsiwCv72HdDmwtHd+pWgo
         ZhsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a2t5AC/LyOIXB7jblxMOM9mVXhxNY++q5sdZhjIQ5zY=;
        b=j8vqqz2YwJxBYq0F1nvhsmaFGiAb3eIkZi/xgOEegpYef5m+NakiC+z4Flo04HFu9a
         cZoEjxQyyObF1Bp2Psk+pjRaFdLrM2jVDGR7vhOax3hJYO+/ll3NaGk261V6dEogxUgw
         BD0vt2ktD3PYdAY3pjnLD15T0be27YAvoS8VxXOTz0d36Az732piaxWNDM9PBHw2/Wra
         +02nmQ0Dg81gD5WgItr3a9Wg/2jiMZIbbcEAomymcb/ZiDf76L+FbNgVDZq1RUjWXXU5
         jb2bwsUzE6Mg3HT/CNyt/gm22UCYvbM9RIqv3y3L+ZAXlzics40j/L+HfE/XhMHfzHe+
         qa7A==
X-Gm-Message-State: AOAM531b2CdeyVe7a5+ERI1RDmgRtKZFu1ze9ZoB6UtuUw640LPftn7u
        Bgu5/gtvzOMR2E5j5+2OE4nSpomDRTs=
X-Google-Smtp-Source: ABdhPJwNbQVAci1BVWQebrVWHqjqxNEWcq5AbThbzUTLsr/Rqcd7BVfYffrz2Jvxa6SHuKzo7LCqsQ==
X-Received: by 2002:ac8:3805:: with SMTP id q5mr5105535qtb.53.1605710780597;
        Wed, 18 Nov 2020 06:46:20 -0800 (PST)
Received: from willemb.nyc.corp.google.com ([2620:0:1003:312:f693:9fff:fef4:3e8a])
        by smtp.gmail.com with ESMTPSA id k188sm4910810qkd.98.2020.11.18.06.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 06:46:19 -0800 (PST)
From:   Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To:     linux-fsdevel@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk,
        akpm@linux-foundation.org, soheil.kdev@gmail.com, arnd@arndb.de,
        shuochen@google.com, linux-man@vger.kernel.org,
        Willem de Bruijn <willemb@google.com>
Subject: [PATCH v3 0/2] add epoll_pwait2 syscall
Date:   Wed, 18 Nov 2020 09:46:14 -0500
Message-Id: <20201118144617.986860-1-willemdebruijn.kernel@gmail.com>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

From: Willem de Bruijn <willemb@google.com>

Enable nanosecond timeouts for epoll.

Analogous to pselect and ppoll, introduce an epoll_wait syscall
variant that takes a struct timespec instead of int timeout.

See patch 1 for more details.

patch 1: new syscall
patch 2: selftest

Willem de Bruijn (2):
  epoll: add nsec timeout support with epoll_pwait2
  selftests/filesystems: expand epoll with epoll_pwait2

 arch/alpha/kernel/syscalls/syscall.tbl        |   1 +
 arch/arm/tools/syscall.tbl                    |   1 +
 arch/arm64/include/asm/unistd.h               |   2 +-
 arch/arm64/include/asm/unistd32.h             |   2 +
 arch/ia64/kernel/syscalls/syscall.tbl         |   1 +
 arch/m68k/kernel/syscalls/syscall.tbl         |   1 +
 arch/microblaze/kernel/syscalls/syscall.tbl   |   1 +
 arch/mips/kernel/syscalls/syscall_n32.tbl     |   1 +
 arch/mips/kernel/syscalls/syscall_n64.tbl     |   1 +
 arch/mips/kernel/syscalls/syscall_o32.tbl     |   1 +
 arch/parisc/kernel/syscalls/syscall.tbl       |   1 +
 arch/powerpc/kernel/syscalls/syscall.tbl      |   1 +
 arch/s390/kernel/syscalls/syscall.tbl         |   1 +
 arch/sh/kernel/syscalls/syscall.tbl           |   1 +
 arch/sparc/kernel/syscalls/syscall.tbl        |   1 +
 arch/x86/entry/syscalls/syscall_32.tbl        |   1 +
 arch/x86/entry/syscalls/syscall_64.tbl        |   1 +
 arch/xtensa/kernel/syscalls/syscall.tbl       |   1 +
 fs/eventpoll.c                                | 106 +++++++++++++++---
 include/linux/compat.h                        |   6 +
 include/linux/syscalls.h                      |   5 +
 include/uapi/asm-generic/unistd.h             |   4 +-
 kernel/sys_ni.c                               |   2 +
 .../filesystems/epoll/epoll_wakeup_test.c     |  70 ++++++++++++
 24 files changed, 193 insertions(+), 20 deletions(-)

-- 
2.29.2.454.gaff20da3a2-goog

