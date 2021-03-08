Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEC94C433E6
	for <linux-man@archiver.kernel.org>; Mon,  8 Mar 2021 18:46:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A18706527E
	for <linux-man@archiver.kernel.org>; Mon,  8 Mar 2021 18:46:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230446AbhCHSpg (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 8 Mar 2021 13:45:36 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:53199 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230246AbhCHSpG (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Mon, 8 Mar 2021 13:45:06 -0500
Received: from localhost (unknown [50.39.163.217])
        (Authenticated sender: josh@joshtriplett.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 58AD6200002;
        Mon,  8 Mar 2021 18:45:00 +0000 (UTC)
Date:   Mon, 8 Mar 2021 10:44:57 -0800
From:   Josh Triplett <josh@joshtriplett.org>
To:     linux-man@vger.kernel.org
Cc:     Alejandro Colomar <alx.manpages@gmail.com>,
        Michael Kerrisk <mtk.manpages@gmail.com>
Subject: Should getaddrinfo_a be marked "MT-Safe env locale" (not "MT-Safe")?
Message-ID: <YEZwqXhBTzbMAyzo@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

getaddrinfo_a uses a thread to call getaddrinfo asynchronously. However,
as far as I can tell this means it still has all the same caveats as
getaddrinfo. Notably, it will result in a getenv call, making it unsafe
if another thread concurrently touches the environment.

Given this, I *think* it would make sense for getaddrinfo_a to be marked
"MT-Safe env locale" just like getaddrinfo. This would make sure people
know that getaddrinfo_a does not avoid the thread-safety issues of
getaddrinfo.

- Josh Triplett
