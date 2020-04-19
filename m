Return-Path: <SRS0=LENQ=6D=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 894B9C38A30
	for <linux-man@archiver.kernel.org>; Sun, 19 Apr 2020 15:30:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6B51121841
	for <linux-man@archiver.kernel.org>; Sun, 19 Apr 2020 15:30:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726091AbgDSPad (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sun, 19 Apr 2020 11:30:33 -0400
Received: from hypra.fr ([62.210.38.35]:40020 "EHLO hypra.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725939AbgDSPad (ORCPT <rfc822;linux-man@vger.kernel.org>);
        Sun, 19 Apr 2020 11:30:33 -0400
X-Greylist: delayed 354 seconds by postgrey-1.27 at vger.kernel.org; Sun, 19 Apr 2020 11:30:32 EDT
Received: from [192.168.0.21] (unknown [82.66.86.116])
        by hypra.fr (Postfix) with ESMTPSA id A0C3858379F;
        Sun, 19 Apr 2020 17:24:37 +0200 (CEST)
To:     mtk.manpages@gmail.com
From:   Jean-Philippe MENGUAL <jpmengual@debian.org>
Subject: Please remove the memusage.1 manpage
Cc:     linux-man@vger.kernel.org
Message-ID: <5689907b-69a6-090a-dfaf-d0e28babf6aa@debian.org>
Date:   Sun, 19 Apr 2020 17:24:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:77.0) Gecko/20100101
 Thunderbird/77.0a1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: fr
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Hi,

This manpage seems not to match to any command now on Linux, at least in 
Debian but not only. Should not the corresponding manpage be removed 
then. Keeping it makes us translate while useless now.

Regards

-- 
Jean-Philippe MENGUAL
Debian Developer non uploading
Community team member
Accessibility team member
debian-l10n-french team member
President of Debian France non-profit organization

