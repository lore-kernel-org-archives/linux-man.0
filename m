Return-Path: <SRS0=Ai/G=2H=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DA74C43603
	for <linux-man@archiver.kernel.org>; Tue, 17 Dec 2019 15:59:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7A67C2146E
	for <linux-man@archiver.kernel.org>; Tue, 17 Dec 2019 15:59:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727627AbfLQP7Y (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Tue, 17 Dec 2019 10:59:24 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:34282 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726933AbfLQP7Y (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Tue, 17 Dec 2019 10:59:24 -0500
Received: from [213.220.153.21] (helo=wittgenstein)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <christian.brauner@ubuntu.com>)
        id 1ihFFm-0002Qx-O3; Tue, 17 Dec 2019 15:59:18 +0000
Date:   Tue, 17 Dec 2019 16:59:18 +0100
From:   Christian Brauner <christian.brauner@ubuntu.com>
To:     Adrian Reber <areber@redhat.com>
Cc:     mtk.manpages@gmail.com, linux-man@vger.kernel.org
Subject: Re: [PATCH v3] clone.2: added clone3() set_tid information
Message-ID: <20191217155917.i2sjixmihbkarnqt@wittgenstein>
References: <20191217150505.417628-1-areber@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191217150505.417628-1-areber@redhat.com>
User-Agent: NeoMutt/20180716
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

On Tue, Dec 17, 2019 at 04:05:05PM +0100, Adrian Reber wrote:
> Signed-off-by: Adrian Reber <areber@redhat.com>

Acked-by: Christian Brauner <christian.brauner@ubuntu.com>
