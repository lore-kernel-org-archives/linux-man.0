Return-Path: <SRS0=j4e1=77=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C444C433DF
	for <linux-man@archiver.kernel.org>; Thu, 18 Jun 2020 14:26:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 22163207E8
	for <linux-man@archiver.kernel.org>; Thu, 18 Jun 2020 14:26:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729572AbgFRO0C (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Thu, 18 Jun 2020 10:26:02 -0400
Received: from gateway20.websitewelcome.com ([192.185.53.25]:47920 "EHLO
        gateway20.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726988AbgFRO0C (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Thu, 18 Jun 2020 10:26:02 -0400
X-Greylist: delayed 1500 seconds by postgrey-1.27 at vger.kernel.org; Thu, 18 Jun 2020 10:26:02 EDT
Received: from cm17.websitewelcome.com (cm17.websitewelcome.com [100.42.49.20])
        by gateway20.websitewelcome.com (Postfix) with ESMTP id 77520400C7B30
        for <linux-man@vger.kernel.org>; Thu, 18 Jun 2020 07:16:47 -0500 (CDT)
Received: from gator3278.hostgator.com ([198.57.247.242])
        by cmsmtp with SMTP
        id luitjghQnBb5dluitjzcum; Thu, 18 Jun 2020 08:36:56 -0500
X-Authority-Reason: nr=8
Received: from 89-69-237-178.dynamic.chello.pl ([89.69.237.178]:36494 helo=localhost)
        by gator3278.hostgator.com with esmtpa (Exim 4.93)
        (envelope-from <arkadiusz@drabczyk.org>)
        id 1jluit-0018vX-0J; Thu, 18 Jun 2020 08:36:55 -0500
Date:   Thu, 18 Jun 2020 15:36:47 +0200
From:   Arkadiusz Drabczyk <arkadiusz@drabczyk.org>
To:     Walter Harms <wharms@bfs.de>
Cc:     "mtk.manpages@gmail.com" <mtk.manpages@gmail.com>,
        "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>
Subject: Re: [PATCH] fread.3: Add example
Message-ID: <20200618133647.rq2w6lanuatoweri@comp.lan>
References: <20200617184530.20811-1-arkadiusz@drabczyk.org>
 <be5391cc853c41a683069fa0c42d0a88@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be5391cc853c41a683069fa0c42d0a88@bfs.de>
User-Agent: NeoMutt/20180716
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator3278.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - drabczyk.org
X-BWhitelist: no
X-Source-IP: 89.69.237.178
X-Source-L: No
X-Exim-ID: 1jluit-0018vX-0J
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 89-69-237-178.dynamic.chello.pl (localhost) [89.69.237.178]:36494
X-Source-Auth: arkadiusz@drabczyk.org
X-Email-Count: 1
X-Source-Cap: cmt1bXZicmg7cmt1bXZicmg7Z2F0b3IzMjc4Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

On Thu, Jun 18, 2020 at 08:49:53AM +0000, Walter Harms wrote:
> +    size_t ret = fread(buffer, 4, 1, fp);
> this is the core of the example and should be a bit more verbose:
> maybe this is a bit to cryptic
>    ret = fread(buffer,sizeof (buffer)/sizeof (*buffer), sizeof (*buffer), fp);

ok, I'll use this version in v2.

> +    printf("ELF magic: %#x%x%x%x\en", buffer[0], buffer[1], buffer[2],
> +           buffer[3]);
> +
> this works for /bin/sh but if the user plays round this may show confusing results
> so you could simply do:
>     printf("ELF magic: %#02x%02x%02x%02x\en",
> so you are consistent in all cased. 

ok, I'll do it in v2.

> (until some will test this on a big endian, no idea
> what will happen then).

Nothing, in ELF spec it says that "the initial bytes of the file
specify how to interpret the file, independent of the processor on
which the inquiry is made and independent of the file's remaining
contents.". And of course I tested this example on my router which has
MIPS CPU which is big-endian and runs big-edian ELFs:

$ file sh
sh: ELF 32-bit MSB executable, MIPS, MIPS32 rel2 version 1, dynamically linked, interpreter /lib/ld-uClibc.so.0, corrupted section header size

and output of the example program is the same as on x86.

> 
> +    ret = fread(buffer, 1, 1, fp);
> +    if (ret != 1) {
> +        fprintf(stderr, "fread() failed: %zu\en", ret);
> +        exit(EXIT_FAILURE);
> +    }
> +
> please drop a line what case you want to explain here, looks like the same as above.

As said a few lines above, this retrieves ELF class. I wanted to show
that file pointer moves automatically after fread() finishes.

-- 
Arkadiusz Drabczyk <arkadiusz@drabczyk.org>
