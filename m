Return-Path: <SRS0=zzzS=6E=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18D01C54FCC
	for <linux-man@archiver.kernel.org>; Mon, 20 Apr 2020 22:50:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F2AC220BED
	for <linux-man@archiver.kernel.org>; Mon, 20 Apr 2020 22:50:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726437AbgDTWul (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 20 Apr 2020 18:50:41 -0400
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:54617 "EHLO
        smtpout1.mo804.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726006AbgDTWul (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Mon, 20 Apr 2020 18:50:41 -0400
Received: from mxplan6.mail.ovh.net (unknown [10.108.20.195])
        by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 774A0370D16E;
        Tue, 21 Apr 2020 00:50:39 +0200 (CEST)
Received: from jwilk.net (37.59.142.106) by DAG4EX2.mxp6.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1779.2; Tue, 21 Apr
 2020 00:50:38 +0200
Date:   Tue, 21 Apr 2020 00:50:36 +0200
From:   Jakub Wilk <jwilk@jwilk.net>
To:     Michael Kerrisk <mtk.manpages@gmail.com>
CC:     Helge Kreutzmann <debian@helgefjell.de>,
        <linux-man@vger.kernel.org>
Subject: Re: Errors in man pages, here: tzfile(5): Punctuation
Message-ID: <20200420225036.kecqxc57ond764za@jwilk.net>
References: <20200419064834.GA32517@Debian-50-lenny-64-minimal>
 <95611010-1ec8-c461-8502-71515373c961@gmail.com>
 <20200420222616.yoc26jiehdn4cgaj@jwilk.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200420222616.yoc26jiehdn4cgaj@jwilk.net>
User-Agent: NeoMutt/20180716
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG5EX2.mxp6.local (172.16.2.42) To DAG4EX2.mxp6.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 04cf0ed4-f6ed-4498-868e-57688c11a248
X-Ovh-Tracer-Id: 2827979092472747997
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrgeeggdduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepfffhvffukfhfgggtugfgjggfihesthekredttderjeenucfhrhhomheplfgrkhhusgcuhghilhhkuceojhifihhlkhesjhifihhlkhdrnhgvtheqnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpuggvsghirghnrdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghniedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehjfihilhhksehjfihilhhkrdhnvghtpdhrtghpthhtoheplhhinhhugidqmhgrnhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

>* Michael Kerrisk <mtk.manpages@gmail.com>, 2020-04-20, 11:13:
>>>Final comma → fullstop
>>>
>>>"Some readers may mishandle time zone abbreviations that contain fewer than 3 "
>>>"or more than 6 characters, or that contain ASCII characters other than "
>>>"alphanumerics,"
>>
>>I can't find this text. Please elaborate/check.

This text is from the tz's man page:
https://github.com/eggert/tz/blob/2019c/tzfile.5#L348

But the sentence in question does not end with the comma.
I guess it's a bug in the software that processed the man page?


>This text was added in a Debian patch:
>https://sources.debian.org/src/manpages/4.16-2/debian/patches/0010-tzfile.5.patch/

(Blargh! I meant to sent this to the other thread about tzfile(5).)

-- 
Jakub Wilk
