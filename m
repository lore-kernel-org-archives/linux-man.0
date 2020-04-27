Return-Path: <SRS0=EslP=6L=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D86D0C55199
	for <linux-man@archiver.kernel.org>; Mon, 27 Apr 2020 08:45:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B3871206D4
	for <linux-man@archiver.kernel.org>; Mon, 27 Apr 2020 08:45:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726183AbgD0IpY (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 27 Apr 2020 04:45:24 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:48513 "EHLO
        smtpout1.mo529.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725899AbgD0IpY (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Mon, 27 Apr 2020 04:45:24 -0400
Received: from mxplan6.mail.ovh.net (unknown [10.109.143.58])
        by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 59CFB3205B2C;
        Mon, 27 Apr 2020 10:45:22 +0200 (CEST)
Received: from jwilk.net (37.59.142.99) by DAG4EX2.mxp6.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1779.2; Mon, 27 Apr
 2020 10:45:21 +0200
Date:   Mon, 27 Apr 2020 10:45:20 +0200
From:   Jakub Wilk <jwilk@jwilk.net>
To:     Helge Kreutzmann <debian@helgefjell.de>
CC:     Michael Kerrisk <mtk.manpages@gmail.com>,
        <linux-man@vger.kernel.org>
Subject: Re: Errors in man pages, here: wprintf(3): Wording
Message-ID: <20200427084520.j4ykkbqjazd2phdi@jwilk.net>
References: <20200419064838.GA32725@Debian-50-lenny-64-minimal>
 <1c1b7919-7cba-5ef0-621e-891844931db2@gmail.com>
 <20200426163005.GB23062@Debian-50-lenny-64-minimal>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20200426163005.GB23062@Debian-50-lenny-64-minimal>
User-Agent: NeoMutt/20180716
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG1EX2.mxp6.local (172.16.2.2) To DAG4EX2.mxp6.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 63df997b-4875-4cc6-a10f-dd9de2342463
X-Ovh-Tracer-Id: 11214526022227056605
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrheelgddtiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepfffhvffukfhfgggtuggjfghisehttdertddtredvnecuhfhrohhmpeflrghkuhgsucghihhlkhcuoehjfihilhhksehjfihilhhkrdhnvghtqeenucffohhmrghinheptghpphhrvghfvghrvghntggvrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnheirdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepjhifihhlkhesjhifihhlkhdrnhgvthdprhgtphhtthhopehlihhnuhigqdhmrghnsehvghgvrhdrkhgvrhhnvghlrdhorhhg
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

* Helge Kreutzmann <debian@helgefjell.de>, 2020-04-26, 18:30:
>But I noticed another possible issue when reading the text: Is the 
>(L\\(aq\\e0\\(aq) korrekt? Is the "L" supposed to be some markup?

In the source that is:

   L\(aq\e0\(aq

which is rendered by groff as

   L'\0'

which is C syntax for null wide character:
https://en.cppreference.com/w/c/language/character_constant

-- 
Jakub Wilk
