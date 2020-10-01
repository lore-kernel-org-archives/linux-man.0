Return-Path: <SRS0=pEEh=DI=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC5BFC4727F
	for <linux-man@archiver.kernel.org>; Thu,  1 Oct 2020 09:22:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6EC832087D
	for <linux-man@archiver.kernel.org>; Thu,  1 Oct 2020 09:22:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731673AbgJAJWW (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Thu, 1 Oct 2020 05:22:22 -0400
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:37023 "EHLO
        smtpout1.mo804.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725975AbgJAJWW (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Thu, 1 Oct 2020 05:22:22 -0400
Received: from mxplan6.mail.ovh.net (unknown [10.109.143.158])
        by mo804.mail-out.ovh.net (Postfix) with ESMTPS id D6DB36781FEB;
        Thu,  1 Oct 2020 11:22:19 +0200 (CEST)
Received: from jwilk.net (37.59.142.103) by DAG4EX2.mxp6.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Thu, 1 Oct 2020
 11:22:19 +0200
Authentication-Results: garm.ovh; auth=pass (GARM-103G005c289efaf-536c-4954-8c5b-b57a533ef6e7,
                    F0B14C18231B464551FFF2B9AFC0668EFF10C516) smtp.auth=jwilk@jwilk.net
Date:   Thu, 1 Oct 2020 11:22:17 +0200
From:   Jakub Wilk <jwilk@jwilk.net>
To:     Christoph Kalchreuter <christoph@kalchreuter.de>
CC:     <linux-man@vger.kernel.org>
Subject: Re: Typo in stat(2)
Message-ID: <20201001092217.qwhjfuto7qnnxthx@jwilk.net>
References: <373374d2-851f-67f6-4059-90130aaab344@kalchreuter.de>
 <87pn63tpx4.fsf@oldenburg2.str.redhat.com>
 <060e7ecf-3590-2fcb-9f28-a1534d97ac7b@gmail.com>
 <013759c3-5ca3-749e-abe9-120c00f6007c@kalchreuter.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <013759c3-5ca3-749e-abe9-120c00f6007c@kalchreuter.de>
User-Agent: NeoMutt/20180716
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG6EX1.mxp6.local (172.16.2.51) To DAG4EX2.mxp6.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: b9828a20-7ba9-45b0-a163-f5605f946365
X-Ovh-Tracer-Id: 11514296875648014234
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrfeeggdduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkfhggtggugfgjfghisehtkeertddtreejnecuhfhrohhmpeflrghkuhgsucghihhlkhcuoehjfihilhhksehjfihilhhkrdhnvghtqeenucggtffrrghtthgvrhhnpefhffdtueelvedvffefgfejveehudejgfeikeetudejieeuvdfghfduudegffeujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnheirdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepjhifihhlkhesjhifihhlkhdrnhgvthdprhgtphhtthhopehlihhnuhigqdhmrghnsehvghgvrhdrkhgvrhhnvghlrdhorhhg
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

* Christoph Kalchreuter <christoph@kalchreuter.de>, 2020-10-01, 08:20:
>But the compiler complained: "‘const struct stat’ has no member named 
>‘st_mtim’

glibc doesn't always expose the st_mtim member (see the NOTES section 
for details), but it should be available by default.

Did you use any compiler options, or define any feature test macros?

-- 
Jakub Wilk
