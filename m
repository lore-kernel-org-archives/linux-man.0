Return-Path: <linux-man-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 369B3C4167B
	for <linux-man@archiver.kernel.org>; Wed, 28 Dec 2022 17:09:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233110AbiL1RJa (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Wed, 28 Dec 2022 12:09:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233822AbiL1RJ3 (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Wed, 28 Dec 2022 12:09:29 -0500
Received: from a3.inai.de (a3.inai.de [IPv6:2a01:4f8:10b:45d8::f5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C20E2AB;
        Wed, 28 Dec 2022 09:09:24 -0800 (PST)
Received: by a3.inai.de (Postfix, from userid 25121)
        id 692E059654580; Wed, 28 Dec 2022 18:09:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by a3.inai.de (Postfix) with ESMTP id 55C14621FDF9D;
        Wed, 28 Dec 2022 18:09:21 +0100 (CET)
Date:   Wed, 28 Dec 2022 18:09:21 +0100 (CET)
From:   Jan Engelhardt <jengelh@inai.de>
To:     oss-security@lists.openwall.com
cc:     Alejandro Colomar <alx.manpages@gmail.com>,
        Michael Kerrisk <mtk.manpages@gmail.com>,
        linux-kernel@vger.kernel.org, linux-man@vger.kernel.org
Subject: Re: [oss-security] [patch] proc.5: tell how to parse /proc/*/stat
 correctly
In-Reply-To: <Y6xzIR9P+a6uaaEx@itl-email>
Message-ID: <99n882p8-41oq-9763-314-24r434o4549o@vanv.qr>
References: <Y6SJDbKBk471KE4k@p183> <Y6TUJcr/IHrsTE0W@codewreck.org> <1a1963aa1036ba07@orthanc.ca> <20221228152458.6xyksrxunukjrtzx@mutt-hbsd> <Y6xzIR9P+a6uaaEx@itl-email>
User-Agent: Alpine 2.25 (LSU 592 2021-09-18)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org


On Wednesday 2022-12-28 17:47, Demi Marie Obenour wrote:
>> Examples:
>> 
>> 1. /proc/pid/stats.json
>> 2. /proc/pid/stats.xml
>> 3. /proc/pid/stats.yaml_shouldnt_be_a_thing
>
>A binary format would be even better.  No risk of ambiguity.

So like EBML?
