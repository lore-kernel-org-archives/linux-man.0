Return-Path: <linux-man-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE485C6FA99
	for <linux-man@archiver.kernel.org>; Fri, 10 Mar 2023 07:21:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230165AbjCJHVq (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Fri, 10 Mar 2023 02:21:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230171AbjCJHVm (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Fri, 10 Mar 2023 02:21:42 -0500
X-Greylist: delayed 370 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 09 Mar 2023 23:21:31 PST
Received: from smtp.smtpout.orange.fr (smtp-20.smtpout.orange.fr [80.12.242.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D33ECFFBC0
        for <linux-man@vger.kernel.org>; Thu,  9 Mar 2023 23:21:31 -0800 (PST)
Received: from [192.168.1.28] ([90.112.30.115])
        by smtp.orange.fr with ESMTPA
        id aX4Cpb5IZ6Nu8aX4CpcuNk; Fri, 10 Mar 2023 08:21:29 +0100
X-ME-Helo: [192.168.1.28]
X-ME-Auth: cGpmbG95ZEB3YW5hZG9vLmZy
X-ME-Date: Fri, 10 Mar 2023 08:21:29 +0100
X-ME-IP: 90.112.30.115
Message-ID: <c194ec03-df9d-aed4-0867-4219f9f6e8bf@wanadoo.fr>
Date:   Fri, 10 Mar 2023 08:21:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: Issues in manpage memalign
Content-Language: en-GB
To:     DJ Delorie <dj@redhat.com>,
        Alejandro Colomar <alx.manpages@gmail.com>
Cc:     libc-alpha@sourceware.org, linux-man@vger.kernel.org
References: <xnsfed48bl.fsf@greed.delorie.com>
From:   Paul Floyd <pjfloyd@wanadoo.fr>
In-Reply-To: <xnsfed48bl.fsf@greed.delorie.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org


On 10/03/2023 04:02, DJ Delorie wrote:
> Alejandro Colomar via Libc-alpha <libc-alpha@sourceware.org> writes:
>> I've CCd glibc, in case someone there can confirm in which direction they
>> would like the manual page to go.
> see https://sourceware.org/bugzilla/show_bug.cgi?id=20137
> and https://sourceware.org/pipermail/libc-alpha/2023-February/145858.html
>
> I've got this on my to-do list to fix aligned_alloc to conform to,
> probably, C17.  I'll send an update for the man page when I update the
> code, if you don't do it first ;-)
>
> I don't know of any discussions to change our stance on memalign() at
> this time.

Hi

Thanks for the links.

I don't see any need to change memalign since it's non-standard.


Regards

Paul

