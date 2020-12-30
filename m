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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4268EC433E9
	for <linux-man@archiver.kernel.org>; Wed, 30 Dec 2020 21:42:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 132482074D
	for <linux-man@archiver.kernel.org>; Wed, 30 Dec 2020 21:42:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726492AbgL3Vms (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Wed, 30 Dec 2020 16:42:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726486AbgL3Vms (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Wed, 30 Dec 2020 16:42:48 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAEBEC06179B
        for <linux-man@vger.kernel.org>; Wed, 30 Dec 2020 13:42:07 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id q75so5881021wme.2
        for <linux-man@vger.kernel.org>; Wed, 30 Dec 2020 13:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4W4scdcd8AwSJYvBrYmDqbFiEDjqvTV7PN3rAS6aIvs=;
        b=CJFKvaD2gUAPPHjzHzdaVVkElsbNfG+HQnVX/+z5iPN9esqI9myU7o7R7mx8qDtr2v
         J9yVQiyGSRTu2fqWOUebsd6w2zctsLTfX1xfEygco34QLZ8prKyWNNcyoQVJVItt5nHT
         fy5SwKMcOBkl9g1/MYmoUbK0PsI7bz+4z7CGtmGxODko1Rio+wfGWZhNPDl6PKiirpCo
         sAue0x0sbcctC7lOmSL3H6m5bi9DVZB8fYVP4QUd8GJqIwJcMQkD/PTKdY5uRbvp3bUF
         kr5pvqnAihYCCzSqznUSdKqQzyiQ97cjFFYGGxERSCUusiWqSnqQna4Hgh5q3+QovLCd
         cEpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4W4scdcd8AwSJYvBrYmDqbFiEDjqvTV7PN3rAS6aIvs=;
        b=MQB3H/R9F590xvnKBDY2KnX8zxY9LhW5c24IUGsCHuONorXGTOHr2XB59GjN8TBOdQ
         873FyYghGVUpg9Vc22b2ZUZGZSiiMPsbxR1rQ9qMnueNMDw5id8Rr+v/sL5j+ktso/ES
         LQX8X6RQor5fQ+Mh+KqVBHgE99WDyk2M/bIOvcqQHZUXBJ1ry0Dyw/R8cVayIaFWaccG
         nIDYBfLepPSFkbsTj3BaPeQTIYX6Ji3c109UnrLo1z2PAWQ9V9l5TfHaZgkEgZDsxU1s
         Og/ecDZx32CWZyGfHxMcF/YDMYKJkmEnhGiXaAeqCv1TJB9TsSviaX1ShIVRoCqnYFeV
         zGXw==
X-Gm-Message-State: AOAM530ZThPMIPRvrXxgu+c4ZGcSKM56lbOrGhGYQ8i19Bar9QPvMBxv
        2htW8W1ZR9jYl3xcKR9F2LEQA88dteQ=
X-Google-Smtp-Source: ABdhPJzyxG0u+JBopIYuoyhccYE2kk5Oqkuw2r36NPDcEKjTtxok4tyLbEiUiDBCQ8XHE6+AvN71Xg==
X-Received: by 2002:a1c:e084:: with SMTP id x126mr9108618wmg.109.1609364526748;
        Wed, 30 Dec 2020 13:42:06 -0800 (PST)
Received: from localhost.localdomain ([170.253.49.0])
        by smtp.googlemail.com with ESMTPSA id 67sm9519234wmb.47.2020.12.30.13.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Dec 2020 13:42:06 -0800 (PST)
From:   Alejandro Colomar <alx.manpages@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     Alejandro Colomar <alx.manpages@gmail.com>,
        linux-man@vger.kernel.org, Eugene Syromyatnikov <evgsyr@gmail.com>
Subject: [PATCH] keyctl.2: SYNOPSIS: Fix prototype parameter types
Date:   Wed, 30 Dec 2020 22:41:44 +0100
Message-Id: <20201230214147.874671-4-alx.manpages@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

The Linux kernel uses 'unsigned long'.
There's no reason to use the typedef '__kernel_ulong_t'.

......

$ syscall='keyctl';
$ find linux/ -type f -name '*.c' \
  |xargs pcregrep -Mn "(?s)^[\w_]*SYSCALL_DEFINE.\(${syscall},.*?\)";
linux/security/keys/keyctl.c:1869:
SYSCALL_DEFINE5(keyctl, int, option, unsigned long, arg2, unsigned long, arg3,
		unsigned long, arg4, unsigned long, arg5)
linux/security/keys/compat.c:17:
COMPAT_SYSCALL_DEFINE5(keyctl, u32, option,
		       u32, arg2, u32, arg3, u32, arg4, u32, arg5)

Cc: Eugene Syromyatnikov <evgsyr@gmail.com>
Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>
---
 man2/keyctl.2 | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/man2/keyctl.2 b/man2/keyctl.2
index 9311100cf..ea3a5d3dd 100644
--- a/man2/keyctl.2
+++ b/man2/keyctl.2
@@ -40,9 +40,9 @@ keyctl \- manipulate the kernel's key management facility
 .B #include <linux/keyctl.h>
 .B #include <unistd.h>
 .PP
-.BI "long syscall(__NR_keyctl, int " operation ", __kernel_ulong_t " arg2 ,
-.BI "             __kernel_ulong_t " arg3 ", __kernel_ulong_t " arg4 ,
-.BI "             __kernel_ulong_t " arg5 );
+.BI "long syscall(__NR_keyctl, int " operation ", unsigned long " arg2 ,
+.BI "             unsigned long " arg3 ", unsigned long " arg4 ,
+.BI "             unsigned long " arg5 );
 .fi
 .PP
 .IR Note :
-- 
2.29.2

