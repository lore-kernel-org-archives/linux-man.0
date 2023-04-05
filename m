Return-Path: <linux-man-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8994EC76188
	for <linux-man@archiver.kernel.org>; Wed,  5 Apr 2023 18:03:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230204AbjDESDq (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Wed, 5 Apr 2023 14:03:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229748AbjDESDp (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Wed, 5 Apr 2023 14:03:45 -0400
Received: from mx10.gouders.net (mx10.gouders.net [202.61.206.94])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E14527AB2
        for <linux-man@vger.kernel.org>; Wed,  5 Apr 2023 11:02:54 -0700 (PDT)
Received: from localhost (ip-109-42-176-62.web.vodafone.de [109.42.176.62])
        (authenticated bits=0)
        by mx10.gouders.net (8.17.1.9/8.16.1) with ESMTPSA id 335I245U019764
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Wed, 5 Apr 2023 20:02:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gouders.net; s=gnet;
        t=1680717724; bh=IYewkQ44qjaiB0sUqJcP+vwKU1CMs2lqBr32kzLc8oY=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date;
        b=QTFTnfBfAqlefVxwh6LpCoJSvfPfjul2xQYhxaiqhxyusyeauXwNbyemV/FTzzDh6
         ymF2DZb0PDmCX/21xTL/+gQeF8LkoVAC9W+KtCZAC7OKGovvm8OevoXNHy32yIW430
         Wk7Af121YDfSDbaHvWnJmCMkYXZH47XP7p2jsCy0=
From:   Dirk Gouders <dirk@gouders.net>
To:     Arsen =?utf-8?Q?Arsenovi=C4=87?= <arsen@aarsen.me>
Cc:     Alejandro Colomar <alx.manpages@gmail.com>,
        linux-man@vger.kernel.org, help-texinfo@gnu.org
Subject: Re: Playground pager lsp(1)
In-Reply-To: <87y1n6o1b3.fsf@aarsen.me> ("Arsen =?utf-8?Q?Arsenovi=C4=87?=
 =?utf-8?Q?=22's?= message of "Wed,
        05 Apr 2023 16:19:53 +0200")
References: <ghileoo9dk.fsf@gouders.net> <ghbkkgo8x8.fsf@gouders.net>
        <073413e2-7d35-f0d7-26eb-f66908d7af6a@gmail.com>
        <ghedoy8x5y.fsf@gouders.net> <87y1n6o1b3.fsf@aarsen.me>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date:   Wed, 05 Apr 2023 20:01:56 +0200
Message-ID: <ghpm8iyzqj.fsf@gouders.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Arsen Arsenovi=C4=87 <arsen@aarsen.me> writes:

>>>>        =E2=80=A2   In windowing environments lsp does complete resizes=
 when windows
>>>>            get resized. This means it also reloads the manual page to =
fit the
>>>>            new window size.
>>>
>>> Good.  This I miss it in less(1) often.  Not sure if they had any strong
>>> reason to not support that.
>>
>> Unfortunately, info(1) also doesn't do full resizes (on my system).
>
> Do you mean the info pages' column limit or that the viewer itself
> doesn't resize to fit the frame?  The latter would be a bug.

Yes, I meant the column limit.  Sorry for not having expressed this very
clear.

Dirk
