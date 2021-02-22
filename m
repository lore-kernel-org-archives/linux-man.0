Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4872C433DB
	for <linux-man@archiver.kernel.org>; Mon, 22 Feb 2021 16:44:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 827A964E2F
	for <linux-man@archiver.kernel.org>; Mon, 22 Feb 2021 16:44:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230184AbhBVQn7 (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 22 Feb 2021 11:43:59 -0500
Received: from vmicros1.altlinux.org ([194.107.17.57]:36764 "EHLO
        vmicros1.altlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231398AbhBVQnk (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Mon, 22 Feb 2021 11:43:40 -0500
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
        by vmicros1.altlinux.org (Postfix) with ESMTP id 8FFF172C8B3;
        Mon, 22 Feb 2021 19:42:57 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
        id 804257CC89C; Mon, 22 Feb 2021 19:42:57 +0300 (MSK)
Date:   Mon, 22 Feb 2021 19:42:57 +0300
From:   "Dmitry V. Levin" <ldv@altlinux.org>
To:     Michael Kerrisk <mtk.manpages@gmail.com>
Cc:     Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        linux-man@vger.kernel.org
Subject: [PATCH] ptrace.2: mention PTRACE_GET_SYSCALL_INFO in RETURN VALUE
 section
Message-ID: <20210222164256.GA1943@altlinux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Mirror the wording about PTRACE_GET_SYSCALL_INFO return value semantics
from "DESCRIPTION" section to "RETURN VALUE" section.

Reported-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Complements: fc91449cb "ptrace.2: Document PTRACE_GET_SYSCALL_INFO"
Signed-off-by: Dmitry V. Levin <ldv@altlinux.org>
---
 man2/ptrace.2 | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/man2/ptrace.2 b/man2/ptrace.2
index 5245338ba..c5e75c274 100644
--- a/man2/ptrace.2
+++ b/man2/ptrace.2
@@ -2327,8 +2327,11 @@ On success, the
 requests return the requested data (but see NOTES),
 the
 .B PTRACE_SECCOMP_GET_FILTER
-request returns the number of instructions in the BPF program, and
-other requests return zero.
+request returns the number of instructions in the BPF program,
+the
+.B PTRACE_GET_SYSCALL_INFO
+request returns the number of bytes available to be written by the kernel,
+and other requests return zero.
 .PP
 On error, all requests return \-1, and
 .I errno
-- 
ldv
