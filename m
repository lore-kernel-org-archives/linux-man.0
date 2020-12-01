Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E66FC64E7B
	for <linux-man@archiver.kernel.org>; Tue,  1 Dec 2020 11:32:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0265E206A5
	for <linux-man@archiver.kernel.org>; Tue,  1 Dec 2020 11:32:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=o2.pl header.i=@o2.pl header.b="tpn1lLai"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727852AbgLALcp (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Tue, 1 Dec 2020 06:32:45 -0500
Received: from mx-out.tlen.pl ([193.222.135.142]:45488 "EHLO mx-out.tlen.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727557AbgLALcp (ORCPT <rfc822;linux-man@vger.kernel.org>);
        Tue, 1 Dec 2020 06:32:45 -0500
X-Greylist: delayed 396 seconds by postgrey-1.27 at vger.kernel.org; Tue, 01 Dec 2020 06:32:44 EST
Received: (wp-smtpd smtp.tlen.pl 17746 invoked from network); 1 Dec 2020 12:23:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o2.pl; s=1024a;
          t=1606821812; bh=v/yyVJsYCj+zDHhWj6hKGM7zRpJo5TcqDGaNRaoXKp0=;
          h=From:To:Cc:Subject;
          b=tpn1lLaiTU1M3HI7mKzhZbdH72mxfdL0y1a0IAEgZ80GVeDGxbQpD4dX7uXxEUH/Q
           nLNarxU9NRgqgIRYTaAbPEmOtP9M95esIHAp7dhZAwByXZbjRnNei8517REhHNKKxI
           gz4dOETmaKwVcrAOjrpxyd7prRKmquFDLa/lWXR0=
Received: from 89-64-60-175.dynamic.chello.pl (HELO localhost.localdomain) (arek_koz@o2.pl@[89.64.60.175])
          (envelope-sender <arek_koz@o2.pl>)
          by smtp.tlen.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <mtk.manpages@gmail.com>; 1 Dec 2020 12:23:32 +0100
From:   Arusekk <arek_koz@o2.pl>
To:     mtk.manpages@gmail.com
Cc:     linux-man@vger.kernel.org, Arusekk <arek_koz@o2.pl>
Subject: [PATCH] keyctl.2: tfix
Date:   Tue,  1 Dec 2020 12:22:45 +0100
Message-Id: <20201201112245.11764-1-arek_koz@o2.pl>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-DKIM-Status: good (id: o2.pl)                                      
X-WP-MailID: 2835fd72012e41e8aec48ce642626fab
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 0000001 [0VIg]                               
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Fixes: fa76da808eff
---
 man2/keyctl.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/keyctl.2 b/man2/keyctl.2
index 8930fb78b..4fa54bc14 100644
--- a/man2/keyctl.2
+++ b/man2/keyctl.2
@@ -33,7 +33,7 @@ keyctl \- manipulate the kernel's key management facility
 .B #include <sys/types.h>
 .B #include <keyutils.h>
 .PP
-.BI "long keyctl(int " operation ", ...)"
+.BI "long keyctl(int " operation ", ...);"
 
 .B "/* For direct call via syscall(2): */"
 .B #include <asm/unistd.h>
-- 
2.29.2

