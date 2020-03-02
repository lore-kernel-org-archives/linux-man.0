Return-Path: <SRS0=AS3v=4T=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 084B7C3F2CD
	for <linux-man@archiver.kernel.org>; Mon,  2 Mar 2020 21:16:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CDE0122B48
	for <linux-man@archiver.kernel.org>; Mon,  2 Mar 2020 21:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583183813;
	bh=AmcgR0L68UQrsf01FBsdUlkw3hy/bPVrmnWudTAk5x8=;
	h=Date:From:To:Subject:List-ID:From;
	b=um5BhtjbWk4jLait1lcMDTx5UjmudplUF9+fXxyO5AfBYWMWDMlC1MD3iPB/gMCKQ
	 HwcS1N6bjjCKk/ekc3SBnxuyRvEONGrkgsxwn7wmgH9g17XOfKL9LkMuWoyLbYcPMy
	 pi7Q8tgfAO3Km0Pxxd1PIA1EjZaexP68BJ6mcwf4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726925AbgCBVQx (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 2 Mar 2020 16:16:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:52746 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725911AbgCBVQx (ORCPT <rfc822;linux-man@vger.kernel.org>);
        Mon, 2 Mar 2020 16:16:53 -0500
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net [73.231.172.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1066820873;
        Mon,  2 Mar 2020 21:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583183811;
        bh=AmcgR0L68UQrsf01FBsdUlkw3hy/bPVrmnWudTAk5x8=;
        h=Date:From:To:Subject:From;
        b=KlLVHvCRU+kk79v1xHdG7cOR1juvDs7U4dXCH8OziBWYXAXJyAhpofn/zDlUMx33N
         tqKW8btmQGwdFCJkPXD9QcYq7dUxjfhE+pTlSBMyj1rhocU6ZbVBGVGDn58HGfXK7Y
         rIy1Xb29cyxLhfN6IE+7RMBkNZbOXvHT8HJfxVDk=
Date:   Mon, 02 Mar 2020 13:16:50 -0800
From:   akpm@linux-foundation.org
To:     alexander.h.duyck@linux.intel.com, axboe@kernel.dk,
        bgeffon@google.com, christian@brauner.io, dancol@google.com,
        hannes@cmpxchg.org, jannh@google.com, joaodias@google.com,
        joel@joelfernandes.org, ktkhai@virtuozzo.com,
        linux-man@vger.kernel.org, mhocko@suse.com, minchan@kernel.org,
        mm-commits@vger.kernel.org, oleksandr@redhat.com,
        shakeelb@google.com, sj38.park@gmail.com, sjpark@amazon.de,
        sonnyrao@google.com, sspatil@google.com, surenb@google.com,
        timmurray@google.com
Subject:  + mm-madvise-allow-ksm-hints-for-remote-api.patch added
 to -mm tree
Message-ID: <20200302211650.NHXDF6iT1%akpm@linux-foundation.org>
User-Agent: s-nail v14.8.16
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org


The patch titled
     Subject: mm/madvise: allow KSM hints for remote API
has been added to the -mm tree.  Its filename is
     mm-madvise-allow-ksm-hints-for-remote-api.patch

This patch should soon appear at
    http://ozlabs.org/~akpm/mmots/broken-out/mm-madvise-allow-ksm-hints-for-remote-api.patch
and later at
    http://ozlabs.org/~akpm/mmotm/broken-out/mm-madvise-allow-ksm-hints-for-remote-api.patch

Before you just go and hit "reply", please:
   a) Consider who else should be cc'ed
   b) Prefer to cc a suitable mailing list as well
   c) Ideally: find the original patch on the mailing list and do a
      reply-to-all to that, adding suitable additional cc's

*** Remember to use Documentation/process/submit-checklist.rst when testing your code ***

The -mm tree is included into linux-next and is updated
there every 3-4 working days

------------------------------------------------------
From: Oleksandr Natalenko <oleksandr@redhat.com>
Subject: mm/madvise: allow KSM hints for remote API

It all began with the fact that KSM works only on memory that is marked by
madvise().  And the only way to get around that is to either:

  * use LD_PRELOAD; or
  * patch the kernel with something like UKSM or PKSM.

(i skip ptrace can of worms here intentionally)

To overcome this restriction, lets employ a new remote madvise API.  This
can be used by some small userspace helper daemon that will do auto-KSM
job for us.

I think of two major consumers of remote KSM hints:

  * hosts, that run containers, especially similar ones and especially in
    a trusted environment, sharing the same runtime like Node.js;

  * heavy applications, that can be run in multiple instances, not
    limited to opensource ones like Firefox, but also those that cannot be
    modified since they are binary-only and, maybe, statically linked.

Speaking of statistics, more numbers can be found in the very first
submission, that is related to this one [1].  For my current setup with
two Firefox instances I get 100 to 200 MiB saved for the second instance
depending on the amount of tabs.

1 FF instance with 15 tabs:

   $ echo "$(cat /sys/kernel/mm/ksm/pages_sharing) * 4 / 1024" | bc
   410

2 FF instances, second one has 12 tabs (all the tabs are different):

   $ echo "$(cat /sys/kernel/mm/ksm/pages_sharing) * 4 / 1024" | bc
   592

At the very moment I do not have specific numbers for containerised
workload, but those should be comparable in case the containers share
similar/same runtime.

[1] https://lore.kernel.org/patchwork/patch/1012142/

Link: http://lkml.kernel.org/r/20200302193630.68771-8-minchan@kernel.org
Signed-off-by: Oleksandr Natalenko <oleksandr@redhat.com>
Signed-off-by: Minchan Kim <minchan@kernel.org>
Reviewed-by: SeongJae Park <sjpark@amazon.de>
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
Cc: Shakeel Butt <shakeelb@google.com>
Cc: Sonny Rao <sonnyrao@google.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Tim Murray <timmurray@google.com>
Cc: <linux-man@vger.kernel.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 mm/madvise.c |    4 ++++
 1 file changed, 4 insertions(+)

--- a/mm/madvise.c~mm-madvise-allow-ksm-hints-for-remote-api
+++ a/mm/madvise.c
@@ -1005,6 +1005,10 @@ process_madvise_behavior_valid(int behav
 	switch (behavior) {
 	case MADV_COLD:
 	case MADV_PAGEOUT:
+#ifdef CONFIG_KSM
+	case MADV_MERGEABLE:
+	case MADV_UNMERGEABLE:
+#endif
 		return true;
 	default:
 		return false;
_

Patches currently in -mm which might be from oleksandr@redhat.com are

mm-madvise-employ-mmget_still_valid-for-write-lock.patch
mm-madvise-allow-ksm-hints-for-remote-api.patch

