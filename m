Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 622D5C47088
	for <linux-man@archiver.kernel.org>; Wed, 26 May 2021 17:35:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3FB1A613B9
	for <linux-man@archiver.kernel.org>; Wed, 26 May 2021 17:35:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233044AbhEZRgh (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Wed, 26 May 2021 13:36:37 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:37125 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231461AbhEZRgh (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Wed, 26 May 2021 13:36:37 -0400
Received: from 2.general.dannf.us.vpn ([10.172.65.1] helo=localhost)
        by youngberry.canonical.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <dann.frazier@canonical.com>)
        id 1llxQt-0004cM-UZ; Wed, 26 May 2021 17:35:04 +0000
From:   dann frazier <dann.frazier@canonical.com>
To:     linux-man@vger.kernel.org,
        Michael Kerrisk <mtk.manpages@gmail.com>,
        David Howells <dhowells@redhat.com>,
        Heinrich Schuchardt <xypron.glpk@gmx.de>
Cc:     linux-kernel@vger.kernel.org,
        Pedro Principeza <pedro.principeza@canonical.com>
Subject: [PATCH] kernel_lockdown.7: Remove description of lifting via SysRq (not upstream)
Date:   Wed, 26 May 2021 11:34:55 -0600
Message-Id: <20210526173455.971103-1-dann.frazier@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

The patch that implemented lockdown lifting via SysRq ended up getting
dropped[*] before the feature was merged upstream. Having the feature
documented but unsupported has caused some confusion for our users.

[*] http://archive.lwn.net:8080/linux-kernel/CACdnJuuxAM06TcnczOA6NwxhnmQUeqqm3Ma8btukZpuCS+dOqg@mail.gmail.com/

Signed-off-by: dann frazier <dann.frazier@canonical.com>
---
 man7/kernel_lockdown.7 | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/man7/kernel_lockdown.7 b/man7/kernel_lockdown.7
index 30863de62..29ffd55c3 100644
--- a/man7/kernel_lockdown.7
+++ b/man7/kernel_lockdown.7
@@ -33,12 +33,6 @@ where X indicates the process name and Y indicates what is restricted.
 .PP
 On an EFI-enabled x86 or arm64 machine, lockdown will be automatically enabled
 if the system boots in EFI Secure Boot mode.
-.PP
-If the kernel is appropriately configured, lockdown may be lifted by typing
-the appropriate sequence on a directly attached physical keyboard.
-For x86 machines, this is
-.IR SysRq+x .
-.\"
 .SS Coverage
 When lockdown is in effect, a number of features are disabled or have their
 use restricted.
-- 
2.31.1

