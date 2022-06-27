Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E472C433EF
	for <linux-man@archiver.kernel.org>; Mon, 27 Jun 2022 12:41:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236174AbiF0MlV (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 27 Jun 2022 08:41:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236324AbiF0MlT (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Mon, 27 Jun 2022 08:41:19 -0400
X-Greylist: delayed 550 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 27 Jun 2022 05:41:17 PDT
Received: from smtp26.services.sfr.fr (smtp26.services.sfr.fr [93.17.128.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 667A9B4BD
        for <linux-man@vger.kernel.org>; Mon, 27 Jun 2022 05:41:17 -0700 (PDT)
X-mail-filterd: {"version":"1.3.4","queueID":"4LWnD36mSNz1LQL1r","contextId":"d984d6a6-66d4-4e09-8f95-60985446cfab"}
Received: from [192.168.0.22] (89-159-200-5.rev.numericable.fr [89.159.200.5])
        by msfrf2616.sfr.fr (SMTP Server) with ESMTP id 4LWnD36mSNz1LQL1r;
        Mon, 27 Jun 2022 14:32:03 +0200 (CEST)
X-mail-filterd: {"version":"1.3.4","queueID":"4LWnD35HRcz1LQKcr","contextId":"291aa456-40b5-42c8-aecf-69c5dbd52b8a"}
X-sfr-mailing: LEGIT
X-sfr-spamrating: 40
X-sfr-spam: not-spam
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=waika9.com; s=202006;
 t=1656333123; h=Date:To:Cc:From:Subject; bh=BNTn6ov78UhGmU06sZoPcLBkLatsL+mZd
  rRqCGqZrXs=; b=ZUltsqEUo3wMF91luiOW3d3Ay8zIUGNqZtV2g97m0Fjt5nF1bc8qUxOkpVAcU
  nb/GJS3/rWKkO92e0fbaBf8guPmRbtaJzaosBeBBPXFt6dhwHEG6zG0SNrgCnFw7MFgMekbBu176
  iPOmk6fLV0kJZkwzx1WCbHcH7OkIyipshi7G6cnU4UeJzG2Q2C8YQ74IMpBZqzJ65/aH5FUs9uw8
  N47b18WjZt7RxcRY+N/2buPvAty0Isf+JdZj63HtxCSlg8FN2xoZ02zxUMwGVX1NONlTkHq1Fzq0
  dBUq+sZRQbEgwwnECG/lXKJQOnMa37r5l3g56VXdiXHiRHiVksfxA==
Received: from [192.168.0.22] (89-159-200-5.rev.numericable.fr [89.159.200.5])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: lucien.gentis@waika9.com)
        by msfrf2616.sfr.fr (SMTP Server) with ESMTPSA id 4LWnD35HRcz1LQKcr;
        Mon, 27 Jun 2022 14:32:03 +0200 (CEST)
Authentication-Results: sfr.fr; auth=pass (PLAIN) smtp.auth=lucien.gentis@waika9.com
Message-ID: <74fc13bc-50da-feef-e29a-6fd590682cc9@waika9.com>
Date:   Mon, 27 Jun 2022 14:32:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: fr
To:     mtk.manpages@gmail.com, alx.manpages@gmail.com
Cc:     linux-man@vger.kernel.org
From:   Lucien Gentis <lucien.gentis@waika9.com>
Subject: possible bug in getmntent (3) manpage
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Distribution: Debian 11 Bullseye

Hello,

In getmntent_r function description:

Shouldn't it be:

"but stores the mntent struct in the provided *mntbuf"

instead of:

"but stores the struct mount in the provided *mntbuf"

(I don't understand what "the struct mount" refers to)

Best regards

Lucien

