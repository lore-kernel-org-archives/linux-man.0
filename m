Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87E86C07E96
	for <linux-man@archiver.kernel.org>; Tue,  6 Jul 2021 22:16:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6A8DF61CA7
	for <linux-man@archiver.kernel.org>; Tue,  6 Jul 2021 22:16:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229919AbhGFWT0 (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Tue, 6 Jul 2021 18:19:26 -0400
Received: from albireo.enyo.de ([37.24.231.21]:53668 "EHLO albireo.enyo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229811AbhGFWTZ (ORCPT <rfc822;linux-man@vger.kernel.org>);
        Tue, 6 Jul 2021 18:19:25 -0400
X-Greylist: delayed 307 seconds by postgrey-1.27 at vger.kernel.org; Tue, 06 Jul 2021 18:19:25 EDT
Received: from [172.17.203.2] (port=51547 helo=deneb.enyo.de)
        by albireo.enyo.de ([172.17.140.2]) with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        id 1m0tI1-0000dp-IR; Tue, 06 Jul 2021 22:11:37 +0000
Received: from fw by deneb.enyo.de with local (Exim 4.92)
        (envelope-from <fw@deneb.enyo.de>)
        id 1m0tI1-00036M-Fa; Wed, 07 Jul 2021 00:11:37 +0200
From:   Florian Weimer <fw@deneb.enyo.de>
To:     Jonny Grant <jg@jguk.org>
Cc:     linux-man <linux-man@vger.kernel.org>,
        Michael Kerrisk <mtk.manpages@gmail.com>
Subject: Re: strlen
References: <0bf239e9-cfc7-8889-ca00-b1d1566bd174@jguk.org>
        <87lfhpgxf8.fsf@mid.deneb.enyo.de>
        <017a5a66-ba66-7cc8-c607-f851c2e54fc4@jguk.org>
        <87363whf2z.fsf@mid.deneb.enyo.de>
        <48e874cb-2b95-2783-ddfc-ae12d9aaf8f5@jguk.org>
Date:   Wed, 07 Jul 2021 00:11:37 +0200
In-Reply-To: <48e874cb-2b95-2783-ddfc-ae12d9aaf8f5@jguk.org> (Jonny Grant's
        message of "Tue, 6 Jul 2021 21:30:18 +0100")
Message-ID: <87bl7fozxi.fsf@mid.deneb.enyo.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

* Jonny Grant:

> The reason it does not crash appears to be because of this warning
> which removes the call to strlen due to the return not being
> checked?

GCC uses the information that the argument to strlen cannot be null on
that particular path.

> strlen.c:11:3: warning: statement with no effect [-Wunused-value]
>    11 |   strlen (str);
>       |   ^~~~~~~~~~~~
>
> https://godbolt.org/z/caoes5nGa

That site probably uses different library headers.

As posted, with Debian's GCC 8.3, I get this for the main function:

main:
	xorl	%eax, %eax
	ret
