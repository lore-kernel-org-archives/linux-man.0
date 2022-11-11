Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAD09C4332F
	for <linux-man@archiver.kernel.org>; Fri, 11 Nov 2022 18:11:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234019AbiKKSLn (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Fri, 11 Nov 2022 13:11:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234267AbiKKSLY (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Fri, 11 Nov 2022 13:11:24 -0500
X-Greylist: delayed 91 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 11 Nov 2022 10:11:23 PST
Received: from omta002.cacentral1.a.cloudfilter.net (omta002.cacentral1.a.cloudfilter.net [3.97.99.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17EAA729B5
        for <linux-man@vger.kernel.org>; Fri, 11 Nov 2022 10:11:22 -0800 (PST)
Received: from shw-obgw-4002a.ext.cloudfilter.net ([10.228.9.250])
        by cmsmtp with ESMTP
        id tUPYojOZDyQ9etYTOo6ZSL; Fri, 11 Nov 2022 18:09:50 +0000
Received: from [10.0.0.5] ([184.64.124.72])
        by cmsmtp with ESMTP
        id tYTOoyKoqomIwtYTOowODw; Fri, 11 Nov 2022 18:09:50 +0000
X-Authority-Analysis: v=2.4 cv=LM91/ba9 c=1 sm=1 tr=0 ts=636e8fee
 a=oHm12aVswOWz6TMtn9zYKg==:117 a=oHm12aVswOWz6TMtn9zYKg==:17
 a=IkcTkHD0fZMA:10 a=CCpqsmhAAAAA:8 a=t8vAJgLVPhGRq8TaxOkA:9 a=QEXdDO2ut3YA:10
 a=ul9cdbp4aOFLsgKbc677:22
Message-ID: <25e512c8-33d7-ef98-aded-552082c6744b@SystematicSw.ab.ca>
Date:   Fri, 11 Nov 2022 11:09:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
To:     linux-man@vger.kernel.org
Cc:     alx@kernel.org, mtk.manpages@gmail.com, andrew@digital-domain.net
Subject: Re: [PATCH v3] memmem.3: Add list of known systems where this is
 available
Reply-To: Brian.Inglis@SystematicSw.ab.ca
Content-Language: en-CA
In-Reply-To: <20221111012724.11558-1-andrew@digital-domain.net>
From:   Brian Inglis <Brian.Inglis@SystematicSw.ab.ca>
Organization: Systematic Software
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfF0EjLIa0z4rQgFI4h+pERJXJ7A3XydqZkV5AUeIhTZJZLfDTyCDktp+GvrfcZdQOzES73ZEWtmYZkbXu7cZpSSh5nJyIfhwpuUa/ONCC2ywdIb7r9D0
 zRhWDIfP6Rnmd2gSDDcXXZwmYYoMNQTxd2tbyRlbEtMSNzOuQvlNjzV4xzIPXdxYN2nn1UnGvZpMY0Bbf6t/BJKQrY3kM3wUp67O2sCKvrrcZS5fFs6mLWCm
 RatMOxod1Eq0uKSEMl3d8q1lrmDjSMQ3PGflo7Kq7GVv+i8iLd1v0KKlS1o4ukXb08eB6x15EB5C6ARhXTPI5Q==
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

On Fri, 11 Nov 2022 01:27:24 +0000, Andrew Clayton wrote:
> While looking at which systems provide memmem(3) I have been able to
> discern the following:
> 
>   musl libc since v0.9.7 (2012)
>   bionic since Android 9 (2018)
> 
>   FreeBSD since 6.0 (2005)
>   OpenBSD since 5.4 (2013)
>   NetBSD
>   macOS
>   Illumos

FYI:

Newlib added on 2008-01-12
https://sourceware.org/git/?p=newlib-cygwin.git;a=commit;h=40617efc8b9309006af1f0c72425fc4a404f40d4

tagged as 1.16 2008-09-04
https://sourceware.org/git/?p=newlib-cygwin.git&a=search&h=refs%2Ftags%2Fnewlib-1_16_0&st=commit&s=memmem

Cygwin added on 2005-11-08 replaced by newlib 2008-01-15 untagged releases 
between about 1.4 and 1.6

-- 
Take care. Thanks, Brian Inglis			Calgary, Alberta, Canada

La perfection est atteinte			Perfection is achieved
non pas lorsqu'il n'y a plus rien à ajouter	not when there is no more to add
mais lorsqu'il n'y a plus rien à retirer	but when there is no more to cut
			-- Antoine de Saint-Exupéry
