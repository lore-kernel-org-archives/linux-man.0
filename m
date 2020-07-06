Return-Path: <SRS0=q/pW=AR=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51476C433E0
	for <linux-man@archiver.kernel.org>; Mon,  6 Jul 2020 11:04:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2D414206E9
	for <linux-man@archiver.kernel.org>; Mon,  6 Jul 2020 11:04:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728819AbgGFLEP (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 6 Jul 2020 07:04:15 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:60641 "EHLO
        smtpout1.mo529.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728739AbgGFLEO (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Mon, 6 Jul 2020 07:04:14 -0400
Received: from mxplan6.mail.ovh.net (unknown [10.109.138.84])
        by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 55C2843B1088;
        Mon,  6 Jul 2020 13:04:13 +0200 (CEST)
Received: from jwilk.net (37.59.142.101) by DAG4EX2.mxp6.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Mon, 6 Jul 2020
 13:04:11 +0200
Authentication-Results: garm.ovh; auth=pass (GARM-101G0041fdeaf61-661e-43e4-8688-76244f55191b,46907DD7FEC5841C66EC7F8F4BE39465BDB61822) smtp.auth=jwilk@jwilk.net
Date:   Mon, 6 Jul 2020 13:04:07 +0200
From:   Jakub Wilk <jwilk@jwilk.net>
To:     Helge Kreutzmann <debian@helgefjell.de>
CC:     Michael Kerrisk <mtk.manpages@gmail.com>,
        <linux-man@vger.kernel.org>
Subject: Re: Errors in man pages, here: shmop.2: singular/plural
Message-ID: <20200706110407.s6gag6j474fjhe75@jwilk.net>
References: <20200706101634.GA26824@Debian-50-lenny-64-minimal>
 <039c4923-5470-2607-1b1c-a7e818e0df9b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <039c4923-5470-2607-1b1c-a7e818e0df9b@gmail.com>
User-Agent: NeoMutt/20180716
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG7EX2.mxp6.local (172.16.2.62) To DAG4EX2.mxp6.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 0b8be0ca-977b-4be6-a112-6cffbe767c48
X-Ovh-Tracer-Id: 372954347685861341
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrudefgdefiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepfffhvffukfhfgggtugfgjggfihesthekredttderjeenucfhrhhomheplfgrkhhusgcuhghilhhkuceojhifihhlkhesjhifihhlkhdrnhgvtheqnecuggftrfgrthhtvghrnhephffftdeuleevvdfffefgjeevhedujefgieektedujeeiuedvgffhuddugeffueejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghniedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehjfihilhhksehjfihilhhkrdhnvghtpdhrtghpthhtoheplhhinhhugidqmhgrnhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

* Michael Kerrisk <mtk.manpages@gmail.com>, 2020-07-06, 12:52:
>>Man page: shmop.2
>>Issue: file is → files are
>>
>>"The following header file is included by the \"reader\" and \"writer\" "
>>"programs."
>
>This isn't correct. "is" agrees with the singular "header file".

Indeed. Note that here "header file" refers to (singular) 
svshm_string.h, not to the bunch of #include'd headers in the source.

-- 
Jakub Wilk
