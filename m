Return-Path: <linux-man-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E6B4C61DA4
	for <linux-man@archiver.kernel.org>; Thu, 16 Feb 2023 21:40:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229532AbjBPVkY (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Thu, 16 Feb 2023 16:40:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjBPVkX (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Thu, 16 Feb 2023 16:40:23 -0500
Received: from smtpout2.mo529.mail-out.ovh.net (smtpout2.mo529.mail-out.ovh.net [79.137.123.220])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EB3337B7D
        for <linux-man@vger.kernel.org>; Thu, 16 Feb 2023 13:40:21 -0800 (PST)
Received: from mxplan6.mail.ovh.net (unknown [10.109.146.228])
        by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 5C1FD20658;
        Thu, 16 Feb 2023 21:40:19 +0000 (UTC)
Received: from jwilk.net (37.59.142.101) by DAG4EX1.mxp6.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 16 Feb
 2023 22:40:18 +0100
Authentication-Results: garm.ovh; auth=pass (GARM-101G00428043560-4c35-4498-889d-c70b8527434b,
                    158DAA81E5F1EC814CF3FE90E94DE06310EE4A7A) smtp.auth=jwilk@jwilk.net
X-OVh-ClientIp: 5.172.255.249
Date:   Thu, 16 Feb 2023 22:40:17 +0100
From:   Jakub Wilk <jwilk@jwilk.net>
To:     Brian Inglis <Brian.Inglis@Shaw.ca>
CC:     <linux-man@vger.kernel.org>,
        Alejandro Colomar <alx.manpages@gmail.com>
Subject: Re: [PATCH v3 1/6] man2/: use IEC or ISO multiples to clarify long
 numeric digit strings
Message-ID: <20230216214017.jl2ncbmzoevhuuqy@jwilk.net>
References: <cover.1676489380.git.Brian.Inglis@Shaw.ca>
 <4a3350ac873f45df96abf9045cfe1605839f490d.1676489381.git.Brian.Inglis@Shaw.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <4a3350ac873f45df96abf9045cfe1605839f490d.1676489381.git.Brian.Inglis@Shaw.ca>
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG8EX1.mxp6.local (172.16.2.71) To DAG4EX1.mxp6.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 564fc240-d290-4aaf-b2ce-61c324f6d50a
X-Ovh-Tracer-Id: 11728217858531121117
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrudeijedgudeglecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjihesthdtredttddtvdenucfhrhhomheplfgrkhhusgcuhghilhhkuceojhifihhlkhesjhifihhlkhdrnhgvtheqnecuggftrfgrthhtvghrnhepuedttdetlefhffduvdehgfefudejledtkeehudevkeekleefudeuvdegjedufffgnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeojhifihhlkhesjhifihhlkhdrnhgvtheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepuehrihgrnhdrkfhnghhlihhssefuhhgrfidrtggrpdhlihhnuhigqdhmrghnsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdgrlhigrdhmrghnphgrghgvshesghhmrghilhdrtghomhdpoffvtefjohhsthepmhhohedvledpmhhouggvpehsmhhtphhouhht
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

I'm afaird most of this patch makes the text less readable.

Moreover:

>-meaning that the maximum CPU number that can be represented is 1023.
>+meaning that the maximum CPU number that can be represented is 1\[aq]023.

This does not match the patch subject.

>-this limit should not be raised above 1000,
>+this limit should not be raised above 1\[aq]000,

Ditto.

-- 
Jakub Wilk
