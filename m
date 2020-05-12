Return-Path: <SRS0=0E5y=62=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1653CA90AF
	for <linux-man@archiver.kernel.org>; Tue, 12 May 2020 16:37:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B70B0206CC
	for <linux-man@archiver.kernel.org>; Tue, 12 May 2020 16:37:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726324AbgELQhr (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Tue, 12 May 2020 12:37:47 -0400
Received: from foss.arm.com ([217.140.110.172]:58158 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725851AbgELQhr (ORCPT <rfc822;linux-man@vger.kernel.org>);
        Tue, 12 May 2020 12:37:47 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9622B1FB;
        Tue, 12 May 2020 09:37:46 -0700 (PDT)
Received: from e103592.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E73F43F305;
        Tue, 12 May 2020 09:37:45 -0700 (PDT)
From:   Dave Martin <Dave.Martin@arm.com>
To:     mtk.manpages@gmail.com
Cc:     linux-man@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 01/14] prctl.2: tfix clarify that prctl can apply to threads
Date:   Tue, 12 May 2020 17:36:46 +0100
Message-Id: <1589301419-24459-2-git-send-email-Dave.Martin@arm.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1589301419-24459-1-git-send-email-Dave.Martin@arm.com>
References: <1589301419-24459-1-git-send-email-Dave.Martin@arm.com>
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

The current synopsis for prctl(2) misleadingly claims that prctl
operates on a process.  Rather, some (in fact, most) prctls operate
on a thread.

The wording probably dates back to the old days when Linux didn't
really have threads at all.

Reword as appropriate.

Signed-off-by: Dave Martin <Dave.Martin@arm.com>
---
 man2/prctl.2 | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/man2/prctl.2 b/man2/prctl.2
index 7a5af76..7932ada 100644
--- a/man2/prctl.2
+++ b/man2/prctl.2
@@ -53,7 +53,7 @@
 .\"
 .TH PRCTL 2 2020-04-11 "Linux" "Linux Programmer's Manual"
 .SH NAME
-prctl \- operations on a process
+prctl \- operations on a process or thread
 .SH SYNOPSIS
 .nf
 .B #include <sys/prctl.h>
@@ -63,6 +63,10 @@ prctl \- operations on a process
 .fi
 .SH DESCRIPTION
 .BR prctl ()
+manipulates various aspects of the behavior
+of the calling thread or process.
+.PP
+.BR prctl ()
 is called with a first argument describing what to do
 (with values defined in \fI<linux/prctl.h>\fP), and further
 arguments with a significance depending on the first one.
-- 
2.1.4

