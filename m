Return-Path: <linux-man-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75DE0C001DB
	for <linux-man@archiver.kernel.org>; Sun, 13 Aug 2023 21:04:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229637AbjHMVEE (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sun, 13 Aug 2023 17:04:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbjHMVED (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sun, 13 Aug 2023 17:04:03 -0400
Received: from omta001.cacentral1.a.cloudfilter.net (omta001.cacentral1.a.cloudfilter.net [3.97.99.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C2C210D7
        for <linux-man@vger.kernel.org>; Sun, 13 Aug 2023 14:04:05 -0700 (PDT)
Received: from shw-obgw-4003a.ext.cloudfilter.net ([10.228.9.183])
        by cmsmtp with ESMTP
        id VAjVq2WOHLAoIVIFoqZEJQ; Sun, 13 Aug 2023 21:04:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1691960644; bh=3vulF0JT2NkTYd8eZD+XPmUFVIaLffKf59NeDueqQHo=;
        h=Date:Reply-To:To:Cc:From:Subject;
        b=sxTPfOwWPwxsS5GlJmXaddt4agm1uYecDM/KK20jvRzqY1W2S2aqEm7V2LUOXDzlS
         3AwvIHs+x3pPcJjP5+D2T2YhProetbGogi2Llbvth07Ikf/vw19wopxnn7yRXK/usv
         zQchtVhkhY8Zaz8Ce88scGSmar9wuIWZRQn1KURqyPIti0PeaJ6TbXm8javhQRCOic
         p9lOdgWvPOsE+6JCVnJQBY85maysla4iYxF0/0Y/vknnVDTr5WfhYh4iIJEBM27gAT
         dbbatsQuX926r4JdxmzzdE5da8yAW5aB6Ru1dGoBj6A5MtNMb0++Y9g0kudqmRJpOB
         s8kJVB2z968sg==
Received: from [10.0.0.5] ([184.64.102.149])
        by cmsmtp with ESMTP
        id VIFnqv0xycyvuVIFoqLLMK; Sun, 13 Aug 2023 21:04:04 +0000
X-Authority-Analysis: v=2.4 cv=VbHkgXl9 c=1 sm=1 tr=0 ts=64d94544
 a=DxHlV3/gbUaP7LOF0QAmaA==:117 a=DxHlV3/gbUaP7LOF0QAmaA==:17
 a=IkcTkHD0fZMA:10 a=VAkB0Of6K-62IzlWX-4A:9 a=QEXdDO2ut3YA:10
Message-ID: <4c6d1cd6-7b25-2818-108d-5af7afaa9680@Shaw.ca>
Date:   Sun, 13 Aug 2023 15:04:03 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Reply-To: Brian.Inglis@Shaw.ca
Content-Language: en-CA
To:     Linux Man-Pages <linux-man@vger.kernel.org>
Cc:     Alejandro Colomar <alx.manpages@gmail.com>,
        Deri <deri@chuzzlewit.myzen.co.uk>
From:   Brian Inglis <Brian.Inglis@Shaw.ca>
Subject: man-pages-posix: POSIX book build
Organization: Inglis
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfIF1cTbAX2uXMtxibLGQrQalWUo7JWw1q9wIFRbVTjMG9cqDfmsSqxU4DGq/2sVbPs3EUUxRCcS91KiKi/lkoRv1kwP+CVQoWm66M+aWk333a+qyRx06
 LbEuoA6RvaQzsUlb4OlJkMoe+tx8t9mZsGJh6Ea3vOPGPghoUw2xu0941NpAE53HEflk1ZWvbXmUG2gM5Op5VtPhl24e7GHZKxUbLggaS3MVJ/MdYKvlZ/fO
 5KcDWB8sSCVne02w2MCTHagoHW4zhN6RnbXz9Q1T7NY=
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Hi folks,

Just to see if making a POSIX book works, I copied 1.23.0 LinuxManBook as 
PosixManBook, BuildLinuxMan.pl to BuildPosixMan.pl, LMBfront.t to PMBfront.t 
with content changes, added sections "[013]p" and made other obvious perl script 
edits '%s/Linux/Posix/g', '%s/LMB/PMB/g'.

When I ran the perl script, eqn was growing into the GB memory, and eqn and 
troff were each hogging a cpu, so I left it running while we were out at dinner 
with friends, but *eqn* died after apparently exhausting all memory and using 
48GB page space, getting as far as limits.h(0p) for a 57 page PDF!

-- 
Take care. Thanks, Brian Inglis              Calgary, Alberta, Canada

La perfection est atteinte                   Perfection is achieved
non pas lorsqu'il n'y a plus rien à ajouter  not when there is no more to add
mais lorsqu'il n'y a plus rien à retirer     but when there is no more to cut
                                 -- Antoine de Saint-Exupéry
