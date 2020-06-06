Return-Path: <SRS0=GwIw=7T=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15FA7C433E0
	for <linux-man@archiver.kernel.org>; Sat,  6 Jun 2020 14:50:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E0835207C4
	for <linux-man@archiver.kernel.org>; Sat,  6 Jun 2020 14:50:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727894AbgFFOuH (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sat, 6 Jun 2020 10:50:07 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:55733 "EHLO
        smtpout1.mo529.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727770AbgFFOuH (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sat, 6 Jun 2020 10:50:07 -0400
Received: from mxplan6.mail.ovh.net (unknown [10.109.138.210])
        by mo529.mail-out.ovh.net (Postfix) with ESMTPS id F1B4A3AA0530;
        Sat,  6 Jun 2020 16:50:04 +0200 (CEST)
Received: from jwilk.net (37.59.142.103) by DAG4EX2.mxp6.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1779.2; Sat, 6 Jun 2020
 16:50:04 +0200
Authentication-Results: garm.ovh; auth=pass (GARM-103G005b728ba14-fe36-4d81-b109-3b08a34f7b44,58FC589207A6C1BE588D5DA612DEF25583F6B3FC) smtp.auth=jwilk@jwilk.net
Date:   Sat, 6 Jun 2020 16:50:03 +0200
From:   Jakub Wilk <jwilk@jwilk.net>
To:     Jonny Grant <jg@jguk.org>
CC:     Michael Kerrisk <mtk.manpages@gmail.com>,
        <linux-man@vger.kernel.org>
Subject: Re: core(5)
Message-ID: <20200606145003.x37j5hywuyn32lpf@jwilk.net>
References: <9000a831-9a0f-0577-5755-95b301218383@jguk.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <9000a831-9a0f-0577-5755-95b301218383@jguk.org>
User-Agent: NeoMutt/20180716
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG8EX1.mxp6.local (172.16.2.71) To DAG4EX2.mxp6.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 8f3efe96-6115-4539-bcf6-03198e9dcba8
X-Ovh-Tracer-Id: 12473845070942754781
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrudeghedgkeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfhfgggtuggjfghisehttdertddtredvnecuhfhrohhmpeflrghkuhgsucghihhlkhcuoehjfihilhhksehjfihilhhkrdhnvghtqeenucggtffrrghtthgvrhhnpefhfedvfeehvefhkeeltdejgeelteefvdefvdduvdefgfduueeitdeitedvtdehgfenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnheirdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepjhifihhlkhesjhifihhlkhdrnhgvthdprhgtphhtthhopehlihhnuhigqdhmrghnsehvghgvrhdrkhgvrhhnvghlrdhorhhg
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

* Jonny Grant <jg@jguk.org>, 2020-06-06, 14:18:
>3) Could i ask to clarify my understanding. For this "The binary being 
>executed by the process does not have read
>          permission enabled."
>-- is this when the binary permissions are changed after it starts 
>running?

No, AFAICS the permission check is done when the process starts.

>4) I noticed %P always gave me P1200 even after a reboot I recall, I 
>had expected it be '1', do you see similar?

Here %P expands to the pid of the process, as expected:

   $ uname -rv
   5.6.0-2-amd64 #1 SMP Debian 5.6.14-1 (2020-05-23)

   $ sudo sysctl -w kernel.core_pattern="%P-%e-%s.core"
   kernel.core_pattern = %P-%e-%s.core

   $ ulimit -c unlimited

   $ sh -c 'kill -ABRT $$'
   Aborted (core dumped)

   $ ls *.core
   7154-sh-6.core

-- 
Jakub Wilk
