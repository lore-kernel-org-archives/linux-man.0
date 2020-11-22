Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 556C3C5519F
	for <linux-man@archiver.kernel.org>; Sun, 22 Nov 2020 12:48:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2CB9A2078D
	for <linux-man@archiver.kernel.org>; Sun, 22 Nov 2020 12:48:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727783AbgKVMsi (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sun, 22 Nov 2020 07:48:38 -0500
Received: from albireo.enyo.de ([37.24.231.21]:52086 "EHLO albireo.enyo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727646AbgKVMsi (ORCPT <rfc822;linux-man@vger.kernel.org>);
        Sun, 22 Nov 2020 07:48:38 -0500
X-Greylist: delayed 319 seconds by postgrey-1.27 at vger.kernel.org; Sun, 22 Nov 2020 07:48:38 EST
Received: from [172.17.203.2] (helo=deneb.enyo.de)
        by albireo.enyo.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        id 1kgoi6-0006xX-Nc; Sun, 22 Nov 2020 12:43:18 +0000
Received: from fw by deneb.enyo.de with local (Exim 4.92)
        (envelope-from <fw@deneb.enyo.de>)
        id 1kgoi6-00018P-KM; Sun, 22 Nov 2020 13:43:18 +0100
From:   Florian Weimer <fw@deneb.enyo.de>
To:     Alejandro Colomar <alx.manpages@gmail.com>
Cc:     mtk.manpages@gmail.com, linux-man@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] lseek.2: SYNOPSIS: Use correct types
References: <20201121173054.12172-1-alx.manpages@gmail.com>
Date:   Sun, 22 Nov 2020 13:43:18 +0100
In-Reply-To: <20201121173054.12172-1-alx.manpages@gmail.com> (Alejandro
        Colomar's message of "Sat, 21 Nov 2020 18:30:56 +0100")
Message-ID: <87wnydblzt.fsf@mid.deneb.enyo.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

* Alejandro Colomar:

> The Linux kernel uses 'unsigned int' instead of 'int' for 'fd' and
> 'whence'.  As glibc provides no wrapper, use the same types the
> kernel uses.

lseek is a POSIX interface, and glibc provides it.  POSIX uses int for
file descriptors (and the whence parameter in case of lseek).

The llseek system call is a different matter, that's indeed
Linux-specific.
