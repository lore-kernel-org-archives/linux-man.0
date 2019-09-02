Return-Path: <SRS0=NCxk=W5=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C30FEC3A59E
	for <linux-man@archiver.kernel.org>; Mon,  2 Sep 2019 12:39:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9E99A216C8
	for <linux-man@archiver.kernel.org>; Mon,  2 Sep 2019 12:39:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729690AbfIBMjB (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 2 Sep 2019 08:39:01 -0400
Received: from vmicros1.altlinux.org ([194.107.17.57]:52250 "EHLO
        vmicros1.altlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729658AbfIBMjB (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Mon, 2 Sep 2019 08:39:01 -0400
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
        by vmicros1.altlinux.org (Postfix) with ESMTP id 1645C72CC6C;
        Mon,  2 Sep 2019 15:38:59 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
        id E33767CC7AF; Mon,  2 Sep 2019 15:38:58 +0300 (MSK)
Date:   Mon, 2 Sep 2019 15:38:58 +0300
From:   "Dmitry V. Levin" <ldv@altlinux.org>
To:     Michael Kerrisk <mtk.manpages@gmail.com>
Cc:     Elvira Khabirova <lineprinter@altlinux.org>,
        linux-man@vger.kernel.org
Subject: [PATCH] ptrace.2: document PTRACE_GET_SYSCALL_INFO
Message-ID: <20190902123858.GA8956@altlinux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

PTRACE_GET_SYSCALL_INFO request was introduced by Linux kernel commit
201766a20e30f982ccfe36bebfad9602c3ff574a aka v5.3-rc1~65^2~23.

Signed-off-by: Dmitry V. Levin <ldv@altlinux.org>
---
 man2/ptrace.2 | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/man2/ptrace.2 b/man2/ptrace.2
index 8b8daf238..3b774f87b 100644
--- a/man2/ptrace.2
+++ b/man2/ptrace.2
@@ -1005,6 +1005,27 @@ of the
 .IR "struct user_desc"
 is ignored; in other words,
 this ptrace operation can't be used to allocate a free TLS entry.)
+.TP
+.BR PTRACE_GET_SYSCALL_INFO " (since Linux 5.3)"
+.\" commit 201766a20e30f982ccfe36bebfad9602c3ff574a
+Retrieve information about the syscall that caused the stop.
+The information is placed into the buffer pointed by
+.I data
+argument, which should be a pointer to a buffer of type
+.IR "struct ptrace_syscall_info" .
+The
+.I addr
+argument contains the size of the buffer pointed to
+by
+.I data
+argument (i.e.,
+.IR "sizeof(struct ptrace_syscall_info)" ).
+The return value contains the number of bytes available
+to be written by the kernel.
+If the size of data to be written by the kernel exceeds the size
+specified by
+.I addr
+argument, the output is truncated.
 .\"
 .SS Death under ptrace
 When a (possibly multithreaded) process receives a killing signal

-- 
ldv
