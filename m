Return-Path: <linux-man-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F0F7C71153
	for <linux-man@archiver.kernel.org>; Sun,  3 Sep 2023 11:27:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236488AbjICL12 (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sun, 3 Sep 2023 07:27:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229599AbjICL12 (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sun, 3 Sep 2023 07:27:28 -0400
X-Greylist: delayed 1200 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 03 Sep 2023 04:27:23 PDT
Received: from mail.smrk.net (mail.smrk.net [IPv6:2001:19f0:6c01:2788:5400:4ff:fe27:adaa])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D741010B
        for <linux-man@vger.kernel.org>; Sun,  3 Sep 2023 04:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smrk.net; s=20221002;
        t=1693738840;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XzRQNhDNEzFg0sEiBkCaNCE/qdLC7juyVwmYgPVWWyQ=;
        b=pXvsl73/nCWg1GJR972G/mGo3p9Kc6wOkKpXSd1OZ+EzbzVC+gbh/YEeg4xmczPomcWKcM
        5lrDtNrISytov/nRyaQbwpThOvgJ8KoTGGH7FVr3Sc3g5RwtY6WJKayFGQ1l4l9/cxuNpA
        RspLb0fy9vhwCFh+b7ew14WTDkiCFxCmqtAALokAzbfp0oYNrqkoJdtH3+82BV2oZLZir8
        4Ng/Ht+jDfanSlH+G7RfD6s59kkAgrr0jovPrMBlUFKaSH/ACOHbTGBsYn6UQWKDPHWv2n
        XLSOdLXwxPphMl/6T/NOyfA3S0FqeSFRIHST5P84eyNnYjUyZROaZe0qB5reeQ==
Received: from localhost (<unknown> [192.168.5.2])
        by smrk (OpenSMTPD) with ESMTPSA id c7c0890c (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
        Sun, 3 Sep 2023 13:00:40 +0200 (CEST)
From:   =?utf-8?B?xaB0xJtww6FuIE7Em21lYw==?= <stepnem@smrk.net>
To:     Peter Lafreniere <peter@n8pjl.ca>
Cc:     Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org
Subject: Re: [patch] sln.8: wfix
In-Reply-To: <20230902230459.12115-1-peter@n8pjl.ca> (Peter Lafreniere's
        message of "Sat, 2 Sep 2023 19:04:58 -0400")
References: <20230902230459.12115-1-peter@n8pjl.ca>
User-Agent: Gnus/5.13 (Gnus v5.13)
Date:   Sun, 03 Sep 2023 13:00:39 +0200
Message-ID: <20230903130039+0200.513903-stepnem@smrk.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

On Sat,  2 Sep 2023 19:04:58 -0400
Peter Lafreniere wrote:

> The description for the second form of sln(8) can be taken at a first
> reading as saying that `filelist' is a list of paths passed via the
> command line, when it is really a path to a file containing that list.
>
> Although the confusion can be resolved from the surrounding context, it
> is better to be explicit about filelist being a path.
>
> Signed-off-by: Peter Lafreniere <peter@n8pjl.ca>
> ---
>  man8/sln.8 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/man8/sln.8 b/man8/sln.8
> index 448d0bf07..2a7ed13e5 100644
> --- a/man8/sln.8
> +++ b/man8/sln.8
> @@ -29,7 +29,7 @@ as a new symbolic link to
>  .PP
>  In the second form,
>  .I filelist
> -is a list of space-separated pathname pairs,
> +points to a list of space-separated pathname pairs,
>  and the effect is as if
>  .B sln
>  was executed once for each line of the file,

I find your version more confusing than the original (or rather, I
didn't really find the original confusing).

If you want to be explicit, why don't you say "names a file containing a
list of..."?

--=20
=C5=A0t=C4=9Bp=C3=A1n
