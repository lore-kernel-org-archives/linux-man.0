Return-Path: <SRS0=zzzS=6E=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49E2DC3A5A0
	for <linux-man@archiver.kernel.org>; Mon, 20 Apr 2020 08:51:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 281D920A8B
	for <linux-man@archiver.kernel.org>; Mon, 20 Apr 2020 08:51:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725896AbgDTIvr (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 20 Apr 2020 04:51:47 -0400
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:39191 "EHLO
        smtpout1.mo804.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725865AbgDTIvq (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Mon, 20 Apr 2020 04:51:46 -0400
Received: from mxplan6.mail.ovh.net (unknown [10.109.146.15])
        by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 0D93E36DE4BB;
        Mon, 20 Apr 2020 10:51:45 +0200 (CEST)
Received: from jwilk.net (37.59.142.96) by DAG4EX2.mxp6.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1779.2; Mon, 20 Apr
 2020 10:51:44 +0200
Date:   Mon, 20 Apr 2020 10:51:42 +0200
From:   Jakub Wilk <jwilk@jwilk.net>
To:     Michael Kerrisk <mtk.manpages@gmail.com>
CC:     Helge Kreutzmann <debian@helgefjell.de>,
        <linux-man@vger.kernel.org>
Subject: Re: Errors in man pages, here: msr(4): Content
Message-ID: <20200420085142.yprljwogzustfuxt@jwilk.net>
References: <20200419064811.GA31233@Debian-50-lenny-64-minimal>
 <CAKgNAkh=65cH6S2xigJF6hjEMu+90=Co+GDV8OSzHU0C2XVYPQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <CAKgNAkh=65cH6S2xigJF6hjEMu+90=Co+GDV8OSzHU0C2XVYPQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG4EX1.mxp6.local (172.16.2.31) To DAG4EX2.mxp6.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: bfe4874a-f3d8-4b06-8b6f-5db8407f8326
X-Ovh-Tracer-Id: 7106680213302204381
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrgeefgddtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepfffhvffukfhfgggtuggjfghisehttdertddtredvnecuhfhrohhmpeflrghkuhgsucghihhlkhcuoehjfihilhhksehjfihilhhkrdhnvghtqeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghniedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehjfihilhhksehjfihilhhkrdhnvghtpdhrtghpthhtoheplhhinhhugidqmhgrnhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

* Michael Kerrisk (man-pages) <mtk.manpages@gmail.com>, 2020-04-19, 22:48:
>>/dev/cpu not on my system
>Maybe this is a Debian thing? I have /dev/cpu on my Fedora system.

FWIW, it does exist on my Debian system:

   $ sudo modprobe msr
   $ find /dev/cpu
   /dev/cpu
   /dev/cpu/1
   /dev/cpu/1/msr
   /dev/cpu/0
   /dev/cpu/0/msr

-- 
Jakub Wilk
