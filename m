Return-Path: <SRS0=NCxk=W5=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 283F1C3A59B
	for <linux-man@archiver.kernel.org>; Mon,  2 Sep 2019 07:13:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EFE08214AE
	for <linux-man@archiver.kernel.org>; Mon,  2 Sep 2019 07:13:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729393AbfIBHN6 (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 2 Sep 2019 03:13:58 -0400
Received: from 7.mo3.mail-out.ovh.net ([46.105.57.200]:48346 "EHLO
        7.mo3.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729330AbfIBHN6 (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Mon, 2 Sep 2019 03:13:58 -0400
Received: from player770.ha.ovh.net (unknown [10.109.160.12])
        by mo3.mail-out.ovh.net (Postfix) with ESMTP id 716A4225B5B
        for <linux-man@vger.kernel.org>; Mon,  2 Sep 2019 08:55:46 +0200 (CEST)
Received: from jwilk.net (user-5-173-40-143.play-internet.pl [5.173.40.143])
        (Authenticated sender: jwilk@jwilk.net)
        by player770.ha.ovh.net (Postfix) with ESMTPSA id C4B76954CC86;
        Mon,  2 Sep 2019 06:55:43 +0000 (UTC)
From:   Jakub Wilk <jwilk@jwilk.net>
To:     Michael Kerrisk <mtk.manpages@gmail.com>
Cc:     linux-man@vger.kernel.org
Subject: [PATCH 2/4] fanotify_mark.2: ffix
Date:   Mon,  2 Sep 2019 08:55:34 +0200
Message-Id: <20190902065536.4878-2-jwilk@jwilk.net>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190902065536.4878-1-jwilk@jwilk.net>
References: <20190902065536.4878-1-jwilk@jwilk.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13614944627145430909
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrudeiledguddufecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecu
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk@jwilk.net>
---
 man2/fanotify_mark.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/fanotify_mark.2 b/man2/fanotify_mark.2
index 67e3a3d70..7a497f29c 100644
--- a/man2/fanotify_mark.2
+++ b/man2/fanotify_mark.2
@@ -176,7 +176,7 @@ Create an event when a read-only file or directory is closed.
 .B FAN_OPEN
 Create an event when a file or directory is opened.
 .TP
-.B FAN_OPEN_EXEC " (since Linux 5.0)"
+.BR FAN_OPEN_EXEC " (since Linux 5.0)"
 Create an event when a file is opened with the intent to be executed.
 See NOTES for additional details.
 .TP
-- 
2.23.0

