Return-Path: <SRS0=m/Ld=AF=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6776AC433DF
	for <linux-man@archiver.kernel.org>; Wed, 24 Jun 2020 17:36:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 507502078A
	for <linux-man@archiver.kernel.org>; Wed, 24 Jun 2020 17:36:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405546AbgFXRgJ (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Wed, 24 Jun 2020 13:36:09 -0400
Received: from foss.arm.com ([217.140.110.172]:47362 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404908AbgFXRgI (ORCPT <rfc822;linux-man@vger.kernel.org>);
        Wed, 24 Jun 2020 13:36:08 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2EE5D1FB;
        Wed, 24 Jun 2020 10:36:08 -0700 (PDT)
Received: from e103592.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0BAB13F71E;
        Wed, 24 Jun 2020 10:36:06 -0700 (PDT)
From:   Dave Martin <Dave.Martin@arm.com>
To:     Michael Kerrisk <mtk.manpages@gmail.com>
Cc:     linux-man@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Will Deacon <will@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>
Subject: [PATCH v3 0/2] prctl.2 man page updates for Linux 5.6
Date:   Wed, 24 Jun 2020 18:36:00 +0100
Message-Id: <1593020162-9365-1-git-send-email-Dave.Martin@arm.com>
X-Mailer: git-send-email 2.1.4
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

A bunch of updates to the prctl(2) man page to fill in missing
prctls (mostly) up to Linux 5.6 (along with a few other tweaks and
fixes).

Patches from the v2 series [1] that have been applied or rejected
already have been dropped.

All that remain here now are the SVE and tagged address ABI controls
for arm64.



[1] https://lore.kernel.org/linux-man/1590614258-24728-1-git-send-email-Dave.Martin@arm.com/


Dave Martin (2):
  prctl.2: Add SVE prctls (arm64)
  prctl.2: Add tagged address ABI control prctls (arm64)

 man2/prctl.2 | 331 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 331 insertions(+)

-- 
2.1.4

