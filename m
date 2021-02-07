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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6810C433E6
	for <linux-man@archiver.kernel.org>; Sun,  7 Feb 2021 11:50:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A919064E3C
	for <linux-man@archiver.kernel.org>; Sun,  7 Feb 2021 11:50:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230058AbhBGLuo (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sun, 7 Feb 2021 06:50:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbhBGLui (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sun, 7 Feb 2021 06:50:38 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA75BC06174A
        for <linux-man@vger.kernel.org>; Sun,  7 Feb 2021 03:49:57 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id m13so13595441wro.12
        for <linux-man@vger.kernel.org>; Sun, 07 Feb 2021 03:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oDitlDcrgh45gwUFJcvFTRAvrbjtBrsS0NglI+HJRSc=;
        b=JrVwQZpdcyvExH8cT3pGBgA2F6ccEJ3eWNZz7BzqaTmHcQk9BXDPf45FzB3IWp9aox
         OHzRY/BMx6vGWr9TuI5S0VRzF+5gENndo3P7cTLOadlipn4mmnWpalu7Iz6gZHGwPk/U
         4Ew0yeQ6URImXhonEovFE21ob8pJ/CdEwsxwHCdGfDDCBTCBsnamgVkzDsdNby1itoa2
         Ie6x5Jx75oPl83lMkDpAAsTzczsmyavZOLSxVIPmBugK2wTczBSDAXsdIEp1tu8smp2+
         8fgeXG1jLv/2TX7nKkd5Hs5VPJp7bVZaRuG5KPBFzbu8lhQhVaC+u8atUhCy15frJra0
         Vpew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oDitlDcrgh45gwUFJcvFTRAvrbjtBrsS0NglI+HJRSc=;
        b=CECO7UuPf3VynEBZuDS0z5kBgh9X5Y2486I2dkrMT4Dss/rfLr0+rexyjt+DKF2hb6
         p9fBsYCW7ugeaATzt7sYX9GgJacSFkFctNiHvnGVjDsq6D9Cv+Y9jlFgmO6v3dbCdCqz
         zwpJZKwCIoTNswjMqGR3mTGung+aqoRcA7VnzPamTYauXj9Cyb7p9tpOw73M0oo2r0fu
         fpvd7KrKJRfiyYV23oRwLv+ywNIKf4KEfz47vo7W/G0rmm0RKgGWqF16PZaKfOwcyO22
         UP6z83tTq6VdgP8RNUUCYtA2iHBIkZk01qMm7ZDJHUHmWPcmd/H0hx33pytDj8PM8tLt
         +6Dw==
X-Gm-Message-State: AOAM530p4kZb44FIlAnv3u4yGqvsimknRXiaioPKVrZIMdBvSxhMpLRR
        W2x9t7zX9x7ftqlLrBCE+lI=
X-Google-Smtp-Source: ABdhPJwPtVeLLW4RZbFg0WlK3pCaIATnf/gF1atZwICXRJrhEWFGC5or6ncwAIZWX2CBkDWUAB+FRg==
X-Received: by 2002:adf:ab11:: with SMTP id q17mr2647933wrc.192.1612698596691;
        Sun, 07 Feb 2021 03:49:56 -0800 (PST)
Received: from localhost.localdomain ([170.253.49.0])
        by smtp.googlemail.com with ESMTPSA id z18sm22123081wro.91.2021.02.07.03.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 03:49:56 -0800 (PST)
From:   Alejandro Colomar <alx.manpages@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     Alejandro Colomar <alx.manpages@gmail.com>,
        linux-man@vger.kernel.org, David Drysdale <drysdale@google.com>
Subject: [PATCH v2] execveat.2: Fix prototype
Date:   Sun,  7 Feb 2021 12:43:25 +0100
Message-Id: <20210207114324.106586-1-alx.manpages@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <CAKgNAkgW=1GE4qcmWsTvfpj2y_N8Bp_ePKtV4VyE8t_b9Ro85w@mail.gmail.com>
References: <CAKgNAkgW=1GE4qcmWsTvfpj2y_N8Bp_ePKtV4VyE8t_b9Ro85w@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

It's been 6 years since execveat(2) was added to the kernel,
and there's still no glibc wrapper.  Let's document the kernel
syscall prototype.

I reported a bug against glibc requesting a wrapper;
when glibc adds the wrapper, this commit should probably be
reverted.

......

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
include/linux/compat.h:815:
asmlinkage long compat_sys_execveat(int dfd, const char __user *filename,
		     const compat_uptr_t __user *argv,
		     const compat_uptr_t __user *envp, int flags);
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
	|grep '\.[ch]$' \
	|sort -V \
	|xargs pcregrep -Mn "(?s)^asmlinkage\s+[\w\s]+\**sys_${1}\s*\(.*?\)" \
	|sed -E 's/^[^:]+:[0-9]+:/&\n/';
}

Glibc bug: <https://sourceware.org/bugzilla/show_bug.cgi?id=27364>
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

