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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F7ECC433E0
	for <linux-man@archiver.kernel.org>; Wed,  3 Feb 2021 21:26:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CCD2E64E50
	for <linux-man@archiver.kernel.org>; Wed,  3 Feb 2021 21:26:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230033AbhBCV0d (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Wed, 3 Feb 2021 16:26:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231709AbhBCV0c (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Wed, 3 Feb 2021 16:26:32 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FEFEC061786
        for <linux-man@vger.kernel.org>; Wed,  3 Feb 2021 13:25:51 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id j11so1162020wmi.3
        for <linux-man@vger.kernel.org>; Wed, 03 Feb 2021 13:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tGRC8R9D+wpScXKVRPo4HTp3B1dMKeICwMDqRvr54A0=;
        b=p1D+4bbNavFvIaPGXReLV3BJsSAJVfFXXtpYzYFEPESsNC64Hs9fydIKv/kqBkN1J6
         zX6j0ZeXriJLLUBAe9TwhtFzose/j1mf07kzAT/JSRYasB+CBiBFU/kI5t6TsQqfK1Ni
         UvWV0CJPI3BcA5S6MGHBD540R1wWAVpBHKn1DF+vKuFa71PfmJL+8X9s7IJqGJG+0GRt
         UfwQJ/cuLk+mS34oPvpNjoRH/L4hbqvycpgTjy9jOggwHtE6CqdKGUVNurbeTGy20PzT
         yE7GbF+M3CmMgWzxm/4+Gre5ZsSygh0xG/9gPlxW+eca/Cim+E7ZKSUuBrqa12J/puXy
         4ENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tGRC8R9D+wpScXKVRPo4HTp3B1dMKeICwMDqRvr54A0=;
        b=YYKuN7U/ZvxNeHCCBp6nJ/jJFOTIjNiix2s0b/2z25OjMuCY7fqzsBcBmIjkRMjdT3
         L7Kgqkp4+Ic0sGMKPqodCynXyjoGfC3dhPRpE147JPOH2JZfvb/e3zudkUm8dJiHRamU
         6dEHiuSFYIsdnY2OMrrOlgOHsvcINvuY+KUHauynygtfnxcqSK0c1D3OHGDOSBZ6sC/g
         EWTxRGE7CGUj6qyemJlytEf12tI9ak5W0eToDJMioGhKIWdmNQ33aNKorCJd28IZkBT7
         nZFlgi48jpO2oCfsZVXJkw2XP9tMwDGimzMp/ji7gBnq+b+q77nz0XaytNfN2p2iUXj1
         323Q==
X-Gm-Message-State: AOAM531I8eHZHv6QGwDZo68yoWUtrKvpvQgT1h0h276tdzT/3Wnz4Fs/
        9d7tOAycgsQWKcbzxpjrq08=
X-Google-Smtp-Source: ABdhPJzimoWvB/UqS2ZM5Rg0VNWOImQ/mB7kmcHUIpDadcC/EARaqoE10UamFrX5M1fRmdtF2vHcCg==
X-Received: by 2002:a7b:c04c:: with SMTP id u12mr4674707wmc.185.1612387550398;
        Wed, 03 Feb 2021 13:25:50 -0800 (PST)
Received: from debian.vlc ([170.253.51.130])
        by smtp.gmail.com with ESMTPSA id l14sm5507728wrq.87.2021.02.03.13.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 13:25:49 -0800 (PST)
From:   Alejandro Colomar <alx.manpages@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     Alejandro Colomar <alx.manpages@gmail.com>,
        linux-man@vger.kernel.org, libc-alpha@sourceware.org,
        Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: [PATCH] getsockname.2: Use restrict in prototypes
Date:   Wed,  3 Feb 2021 22:25:09 +0100
Message-Id: <20210203212508.162239-1-alx.manpages@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

POSIX specifies that the 2nd and 3rd parameters to getsockname()
shall be 'restrict'.  Glibc uses 'restrict' too.
Let's use it here too.

......

.../glibc$ grep_syscall_wrapper getsockname
socket/sys/socket.h:116:
extern int getsockname (int __fd, __SOCKADDR_ARG __addr,
			socklen_t *__restrict __len) __THROW;
.../glibc$ grep -rn '# *define __SOCKADDR_ARG'
socket/sys/socket.h:58:
 # define __SOCKADDR_ARG		struct sockaddr *__restrict
.../glibc$

function grep_syscall_wrapper()
{
	if ! [ -v 1 ]; then
		>&2 echo "Usage: ${FUNCNAME[0]} <syscall>";
		return ${EX_USAGE};
	fi

	find * -type f \
	|grep '\.h$' \
	|sort -V \
	|xargs pcregrep -Mn \
	  "(?s)^[^\s#][\w\s]+\s+\**${1}\s*\([\w\s()[\]*,]*?(...)?\)[\w\s()]*;" \
	|sed -E 's/^[^:]+:[0-9]+:/&\n/';
}

Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>
---
 man2/getsockname.2 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man2/getsockname.2 b/man2/getsockname.2
index 55db4b84c..034c9d4ac 100644
--- a/man2/getsockname.2
+++ b/man2/getsockname.2
@@ -44,8 +44,8 @@ getsockname \- get socket name
 .nf
 .B #include <sys/socket.h>
 .PP
-.BI "int getsockname(int " sockfd ", struct sockaddr *" addr \
-", socklen_t *" addrlen );
+.BI "int getsockname(int " sockfd ", struct sockaddr *" addr ,
+.BI "                socklen_t *restrict " addrlen );
 .fi
 .SH DESCRIPTION
 .BR getsockname ()
-- 
2.30.0

