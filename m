Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEB6FC433DB
	for <linux-man@archiver.kernel.org>; Wed,  3 Feb 2021 18:47:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5C67864DE1
	for <linux-man@archiver.kernel.org>; Wed,  3 Feb 2021 18:47:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231388AbhBCSrG (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Wed, 3 Feb 2021 13:47:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232788AbhBCSrG (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Wed, 3 Feb 2021 13:47:06 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED75AC061573
        for <linux-man@vger.kernel.org>; Wed,  3 Feb 2021 10:46:25 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id m2so730745wmm.1
        for <linux-man@vger.kernel.org>; Wed, 03 Feb 2021 10:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vqCnLL4kYpwNTLWDWRoylZ2pdp7knAmqef7m27aInlA=;
        b=STngpdIv/tiTPbBrUxC5/Zm1BCUXmpFo1+HQAMhGUpQkhBCsd2nm9XnIcQWEF8QJnw
         vHswfx1AP9w/DiTbPq6W/RJQv1yzBN5BKmr783tcaaCAazuAfpKVNYRNa807W8C01WYs
         vBgdQBQAgaQLd4dfvbj7mAM5+Et4GIH2S0pO+3tCLyWsd0A2tnOmqj8shLHI1GL7+sVR
         w1cs4SrO9s6SUd8Zay/ET5RWWwKXIaPafWi/a9l0CgfcElGwZ2YsW/zzVHKy7Peq8KF6
         a+SFGIRbIZw+lzaYpQCXnswrnUN7CMfciPjAUg3xzdPtljfvyAKS3yHwet/OLk4oQcmx
         L6zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vqCnLL4kYpwNTLWDWRoylZ2pdp7knAmqef7m27aInlA=;
        b=HQl3J9VxcZVzSs0tw5UFWxrubrADhl7hACtMUmHCNTEUk+S4S56Ulg5GIk63sC8puM
         a3R4F9YXm7Y4bUaKG/JtuMQ3jqxX+PVkKVObpcNKf2zh1o2aeD0mPlvLA9esi7/TjcL2
         n+oiLU8MM6ENiNUhOoof5PDrQgEyxpY1Ia2LFMP/DHjtjDr5CGC/wBY2elNGVjR8uyJi
         0Y6zxi9Qmd5IBfIy0QChrSW02PuiRCRCQBvxtUPoRCQSqAPtKKLJ8amHobSZEZ6xEsII
         GULUM15fum+ApZ8glUgTl1DcaQ7S2KqH1dowR/CRF4C9bgMrYEhReVLghwWq5I1vHuun
         pfvQ==
X-Gm-Message-State: AOAM533WXIYzsOd3CpSPHzH4JP9O+vnQg6C8JN00BnMIl3+Yfkpkb+M4
        k8/cBcguvhbi8EnYXhVl65g=
X-Google-Smtp-Source: ABdhPJzTIIe7nA7nfxck7fZmq2uHyYYdmBEO/I+A5qklEgcaupT7rVVPbGUFcG9nxJ/n7QHttIG0kA==
X-Received: by 2002:a05:600c:2888:: with SMTP id g8mr4071008wmd.169.1612377984676;
        Wed, 03 Feb 2021 10:46:24 -0800 (PST)
Received: from debian.vlc ([170.253.51.130])
        by smtp.gmail.com with ESMTPSA id g16sm3514145wmi.30.2021.02.03.10.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 10:46:24 -0800 (PST)
From:   Alejandro Colomar <alx.manpages@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     Alejandro Colomar <alx.manpages@gmail.com>,
        linux-man@vger.kernel.org, David Drysdale <drysdale@google.com>
Subject: [PATCH] execveat.2: Fix prototype
Date:   Wed,  3 Feb 2021 19:45:18 +0100
Message-Id: <20210203184517.153948-1-alx.manpages@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

.../linux$ grep_syscall execveat
fs/exec.c:2062:
SYSCALL_DEFINE5(execveat,
		int, fd, const char __user *, filename,
		const char __user *const __user *, argv,
		const char __user *const __user *, envp,
		int, flags)
fs/exec.c:2083:
COMPAT_SYSCALL_DEFINE5(execveat, int, fd,
		       const char __user *, filename,
		       const compat_uptr_t __user *, argv,
		       const compat_uptr_t __user *, envp,
		       int,  flags)
include/linux/syscalls.h:980:
asmlinkage long sys_execveat(int dfd, const char __user *filename,
			const char __user *const __user *argv,
			const char __user *const __user *envp, int flags);
.../linux$

function grep_syscall()
{
	if ! [ -v 1 ]; then
		>&2 echo "Usage: ${FUNCNAME[0]} <syscall>";
		return ${EX_USAGE};
	fi

	find * -type f \
	|grep '\.c$' \
	|sort -V \
	|xargs pcregrep -Mn "(?s)^\w*SYSCALL_DEFINE.\(${1},.*?\)" \
	|sed -E 's/^[^:]+:[0-9]+:/&\n/';

	find * -type f \
	|grep '\.h$' \
	|sort -V \
	|xargs pcregrep -Mn "(?s)^asmlinkage \w+ \**sys_${1}\(.*?\)" \
	|sed -E 's/^[^:]+:[0-9]+:/&\n/';
}

Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>
---
 man2/execveat.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/execveat.2 b/man2/execveat.2
index 02d9c7331..d1ce4bee1 100644
--- a/man2/execveat.2
+++ b/man2/execveat.2
@@ -31,7 +31,7 @@ execveat \- execute program relative to a directory file descriptor
 .B #include <unistd.h>
 .PP
 .BI "int execveat(int " dirfd ", const char *" pathname ,
-.BI "             char *const " argv "[], char *const " envp [],
+.BI "             const char *const " argv "[], const char *const " envp [],
 .BI "             int " flags );
 .fi
 .PP
-- 
2.30.0

