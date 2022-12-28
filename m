Return-Path: <linux-man-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CD1BC4708D
	for <linux-man@archiver.kernel.org>; Wed, 28 Dec 2022 02:00:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231218AbiL1CAa (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Tue, 27 Dec 2022 21:00:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232572AbiL1CAF (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Tue, 27 Dec 2022 21:00:05 -0500
X-Greylist: delayed 301 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 27 Dec 2022 18:00:04 PST
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE92FFE9
        for <linux-man@vger.kernel.org>; Tue, 27 Dec 2022 18:00:04 -0800 (PST)
Received: from list by ciao.gmane.io with local (Exim 4.92)
        (envelope-from <glm-linux-man@m.gmane-mx.org>)
        id 1pALen-0005Yo-RQ
        for linux-man@vger.kernel.org; Wed, 28 Dec 2022 02:55:01 +0100
X-Injected-Via-Gmane: http://gmane.org/
To:     linux-man@vger.kernel.org
From:   Tavis Ormandy <taviso@gmail.com>
Subject: Re: [oss-security] [patch] proc.5: tell how to parse /proc/*/stat
 correctly
Followup-To: gmane.comp.security.oss.general
Date:   Wed, 28 Dec 2022 01:50:03 -0000 (UTC)
Message-ID: <tog7cb$105a$1@ciao.gmane.io>
References: <Y6SJDbKBk471KE4k@p183> <Y6TUJcr/IHrsTE0W@codewreck.org>
 <1a1963aa1036ba07@orthanc.ca>
User-Agent: slrn/pre1.0.4-5 (Linux)
Cc:     linux-kernel@vger.kernel.org, oss-security@lists.openwall.com
Cc:     linux-kernel@vger.kernel.org, linux-man@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

On 2022-12-28, Lyndon Nerenberg (VE7TFX/VE6BBM) wrote:
> Dominique Martinet writes:
>
>> But, really, I just don't see how this can practically be said to be parsable...
>
> In its current form it never will be.  The solution is to place
> this variable-length field last.  Then you can "cut -d ' ' -f 51-"
> to get the command+args part (assuming I counted all those fields
> correctly ...)
>
> Of course, this breaks backwards compatability.
>

I think that cut command doesn't handle newlines, you probably need cut
-z, which looks a bit hacky to me. There already is 'ps -q $$ -o comm=',
of course, and that works fine - as well as libprocps.

I don't know, I think just adding the strrchr note seems acceptable.

Tavis.


-- 
 _o)            $ lynx lock.cmpxchg8b.com
 /\\  _o)  _o)  $ finger taviso@sdf.org
_\_V _( ) _( )  @taviso

