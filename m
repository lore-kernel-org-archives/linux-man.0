Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5436C4332F
	for <linux-man@archiver.kernel.org>; Tue, 22 Nov 2022 18:32:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232665AbiKVScZ (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Tue, 22 Nov 2022 13:32:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233715AbiKVScY (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Tue, 22 Nov 2022 13:32:24 -0500
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2F7E88FAC
        for <linux-man@vger.kernel.org>; Tue, 22 Nov 2022 10:32:22 -0800 (PST)
X-KPN-MessageId: 04673a05-6a94-11ed-bd66-005056994fde
Received: from smtp.kpnmail.nl (unknown [10.31.155.8])
        by ewsoutbound.so.kpn.org (Halon) with ESMTPS
        id 04673a05-6a94-11ed-bd66-005056994fde;
        Tue, 22 Nov 2022 19:32:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xs4all.nl; s=xs4all01;
        h=mime-version:message-id:date:subject:to:from;
        bh=SZyWmV+fJ3f3mUPJNcKHoaaOwqZOP4CPjkSSmDjnmQc=;
        b=r3a3ikDnVORfsD6iRfaWbrxIoDvg+n1k43h3CZV/O+qDt+yq/BydUox4RFx0IMBnesGKcwQM4W1tT
         q1/TZ2JaeA2MSVc8Sg35yYM3PKyo38Y+VNvTtfHK1wUU5QoCXJgKYzzRqHyFOp7cqV/8LMQtSjTSKe
         r69vG7scReWFvDeq2DVoVxQ8c91flY8hftnfbXt1bcGSbjvo8rLbi2KzSRKJH8Vaa+rnvQTHnkdWw8
         lJQ0Ated4uqlBxxnG13YsVt/NZtPMR/u01O05PXehZAIz5xb26LMuhZLv00/4EtxWBr6zgPNZdLo1j
         tJJHWKQw7RrB64pCB4ny9b67rQoD+Zg==
X-KPN-MID: 33|mXUdGHqE9CE6st7XpU5H4sJOds0DC48tCAIRWhyKV0Ww88rfYfatmIyL7CA4UX0
 OOQO1y5411u9HvYVCbV/HFjHE7BqbqPg5+1VijzADP1g=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|GCVPtqjXQwIFzXq6r512BtmCkWN54sZ44sC4WltdGKI7wUcyfYRe2JanSTkzJCe
 zlwXay0nOg7+Mu4ILzWDkpw==
X-Originating-IP: 77.173.35.122
Received: from frodo.. (77-173-35-122.fixed.kpn.net [77.173.35.122])
        by smtp.xs4all.nl (Halon) with ESMTPSA
        id ffd784b0-6a93-11ed-9b28-00505699d6e5;
        Tue, 22 Nov 2022 19:32:20 +0100 (CET)
From:   "J.H. van de Water" <henri.van.de.water@xs4all.nl>
To:     Alejandro Colomar <alx@kernel.org>,
        Michael Kerrisk <mtk.manpages@gmail.com>
Cc:     linux-man@vger.kernel.org
Subject: [PATCH v2] select.2: blocks on the read end (if the write end of the fifo has never been opened).
Date:   Tue, 22 Nov 2022 19:32:20 +0100
Message-Id: <20221122183220.2460-1-henri.van.de.water@xs4all.nl>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221122153027.10943-1-henri.van.de.water@xs4all.nl>
References: <20221122153027.10943-1-henri.van.de.water@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Clarify that select(2) will block on the read end of a pipe/fifo, if the
write end of the pipe/fifo has never been opened before, unlike read(2).

Signed-off-by: J.H. vd Water <henri.van.de.water@xs4all.nl>
---
 man2/select.2 | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/man2/select.2 b/man2/select.2
index 199522a01..673d626a9 100644
--- a/man2/select.2
+++ b/man2/select.2
@@ -77,6 +77,15 @@ perform a corresponding I/O operation (e.g.,
 or a sufficiently small
 .BR write (2))
 without blocking.
+.PP
+However, note that
+.BR select ()
+will block on the read end of a pipe/fifo, if the write end of
+the pipe/fifo has never been opened before, unlike
+.BR read (2).
+(read(2) will always return with zero if the write end of
+the pipe/fifo is closed - see pipe(7) where the text starts with
+I/O on pipes and FIFOs).
 .\"
 .SS fd_set
 A structure type that can represent a set of file descriptors.
-- 
2.38.1

