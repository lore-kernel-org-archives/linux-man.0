Return-Path: <SRS0=7FQr=6J=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BABE7C54FCB
	for <linux-man@archiver.kernel.org>; Sat, 25 Apr 2020 22:58:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 897412072B
	for <linux-man@archiver.kernel.org>; Sat, 25 Apr 2020 22:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1587855486;
	bh=HzmG73uzjdDN7/koEinr4ujhDNMtpAcSZa3xTfL6IEY=;
	h=Date:From:To:Subject:List-ID:From;
	b=lPi/UKCZEbkBHqcckLpyvKznEnCipVr7sh9hS6iUyzF9/0TurLT0kvr6PJFMvmlWL
	 Ku1g0jh6dzsoxQJGxRxOgNPjv6Qwe/d6+0S1kif6oOMIpViZrrn2Xck8ziniBk2eR7
	 5vwJqMdXTm5ly/br07GVMpY4msItgdCqCV0sIA/Q=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726241AbgDYW6G (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sat, 25 Apr 2020 18:58:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:51804 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726232AbgDYW6F (ORCPT <rfc822;linux-man@vger.kernel.org>);
        Sat, 25 Apr 2020 18:58:05 -0400
Received: from localhost.localdomain (c-71-198-47-131.hsd1.ca.comcast.net [71.198.47.131])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1D8E32071C;
        Sat, 25 Apr 2020 22:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587855484;
        bh=HzmG73uzjdDN7/koEinr4ujhDNMtpAcSZa3xTfL6IEY=;
        h=Date:From:To:Subject:From;
        b=ec+qrw3C8HayHqAvesyzlfc6dXvgUJoCUWr1Kz1QvA85K/5mXa0G+T/A6Sp+CPv0u
         K7VeRvsP/OFTxjDkwndoGWvpJ8CddmfZohZmvGLFGT8aeE7fGnuDzoy0d7GxO91dmd
         76dBxC0L6TrkrZy/3hcA600mzEWAt8wtCunKdJeY=
Date:   Sat, 25 Apr 2020 15:58:03 -0700
From:   akpm@linux-foundation.org
To:     alexander.h.duyck@linux.intel.com, axboe@kernel.dk,
        bgeffon@google.com, christian@brauner.io, dancol@google.com,
        hannes@cmpxchg.org, jannh@google.com, joaodias@google.com,
        joel@joelfernandes.org, ktkhai@virtuozzo.com,
        linux-man@vger.kernel.org, mhocko@suse.com, minchan@kernel.org,
        mm-commits@vger.kernel.org, oleksandr@redhat.com,
        shakeelb@google.com, sj38.park@gmail.com, sjpark@amazon.de,
        sonnyrao@google.com, sspatil@google.com, surenb@google.com,
        timmurray@google.com, vbabka@suse.cz
Subject:  [alternative-merged]
 mm-madvise-employ-mmget_still_valid-for-write-lock.patch removed from -mm
 tree
Message-ID: <20200425225803.791VDzjAS%akpm@linux-foundation.org>
User-Agent: s-nail v14.8.16
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org


The patch titled
     Subject: mm/madvise: employ mmget_still_valid() for write lock
has been removed from the -mm tree.  Its filename was
     mm-madvise-employ-mmget_still_valid-for-write-lock.patch

This patch was dropped because an alternative patch was merged

------------------------------------------------------
From: Oleksandr Natalenko <oleksandr@redhat.com>
Subject: mm/madvise: employ mmget_still_valid() for write lock

Do the very same trick as we already do since 04f5866e41fb.  KSM hints
will require locking mmap_sem for write since they modify vm_flags, so for
remote KSM hinting this additional check is needed.

Link: http://lkml.kernel.org/r/20200302193630.68771-7-minchan@kernel.org
Signed-off-by: Oleksandr Natalenko <oleksandr@redhat.com>
Signed-off-by: Minchan Kim <minchan@kernel.org>
Reviewed-by: Suren Baghdasaryan <surenb@google.com>
Cc: Alexander Duyck <alexander.h.duyck@linux.intel.com>
Cc: Brian Geffon <bgeffon@google.com>
Cc: Christian Brauner <christian@brauner.io>
Cc: Daniel Colascione <dancol@google.com>
Cc: Jann Horn <jannh@google.com>
Cc: Jens Axboe <axboe@kernel.dk>
Cc: Joel Fernandes <joel@joelfernandes.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>
Cc: John Dias <joaodias@google.com>
Cc: Kirill Tkhai <ktkhai@virtuozzo.com>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Sandeep Patil <sspatil@google.com>
Cc: SeongJae Park <sj38.park@gmail.com>
Cc: SeongJae Park <sjpark@amazon.de>
Cc: Shakeel Butt <shakeelb@google.com>
Cc: Sonny Rao <sonnyrao@google.com>
Cc: Tim Murray <timmurray@google.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: <linux-man@vger.kernel.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 mm/madvise.c |    3 +++
 1 file changed, 3 insertions(+)

--- a/mm/madvise.c~mm-madvise-employ-mmget_still_valid-for-write-lock
+++ a/mm/madvise.c
@@ -1124,6 +1124,8 @@ int do_madvise(struct task_struct *targe
 	if (write) {
 		if (down_write_killable(&mm->mmap_sem))
 			return -EINTR;
+		if (current->mm != mm && !mmget_still_valid(mm))
+			goto skip_mm;
 	} else {
 		down_read(&mm->mmap_sem);
 	}
@@ -1175,6 +1177,7 @@ int do_madvise(struct task_struct *targe
 	}
 out:
 	blk_finish_plug(&plug);
+skip_mm:
 	if (write)
 		up_write(&mm->mmap_sem);
 	else
_

Patches currently in -mm which might be from oleksandr@redhat.com are

mm-madvise-allow-ksm-hints-for-remote-api.patch

