Return-Path: <SRS0=fI7i=XE=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75A1CC433EF
	for <linux-man@archiver.kernel.org>; Mon,  9 Sep 2019 09:08:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1BD492089F
	for <linux-man@archiver.kernel.org>; Mon,  9 Sep 2019 09:08:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bfs.de header.i=@bfs.de header.b="Jj7gBBW1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728044AbfIIJIo (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 9 Sep 2019 05:08:44 -0400
Received: from mx01-fr.bfs.de ([193.174.231.67]:48731 "EHLO mx01-fr.bfs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726496AbfIIJIo (ORCPT <rfc822;linux-man@vger.kernel.org>);
        Mon, 9 Sep 2019 05:08:44 -0400
Received: from mail-fr.bfs.de (mail-fr.bfs.de [10.177.18.200])
        by mx01-fr.bfs.de (Postfix) with ESMTPS id CCBF120380;
        Mon,  9 Sep 2019 11:08:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bfs.de; s=dkim201901;
        t=1568020116; h=from:from:sender:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=N4Yy6ed+T3KEimqXYOwWKr1VSawehXf/ERjcjmN86Rk=;
        b=Jj7gBBW1BVjk814eXlYsT01c4Ua57phLePKQ0smp8AIXs3lIOQcp1//5GJmToM4Low1vfX
        57jGagzxHgHMiHIZyZFk2tQrTGXr3T155nCTFRfUuLecdyfxF6z6arQYFTPT2VJ/kaaF+U
        T3p3FJ98Jo9p5/OCdsO00WqreP8ffy/ZQ1HrShYpYyzzMZ9vG/mkHMU/hzLeX0PsdBBulc
        cqeQWCyr+X1V323el9X3lAe9v7GbUhw7TeX6HmLCV3qYPu+mfii1AFdTLGNK6z5WWzsVEB
        H3Jy2bHaosnQlib63fJAlwvcB8RBPXNLP1gnNdm93F8psuBSTB8dE9CVWSHaQw==
Received: from [134.92.181.33] (unknown [134.92.181.33])
        by mail-fr.bfs.de (Postfix) with ESMTPS id B344CBEEBD;
        Mon,  9 Sep 2019 11:08:35 +0200 (CEST)
Message-ID: <5D761692.9090905@bfs.de>
Date:   Mon, 09 Sep 2019 11:08:34 +0200
From:   walter harms <wharms@bfs.de>
Reply-To: wharms@bfs.de
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; de; rv:1.9.1.16) Gecko/20101125 SUSE/3.0.11 Thunderbird/3.0.11
MIME-Version: 1.0
To:     mtk.manpages@gmail.com
CC:     Florin Blanaru <florin.blanaru96@gmail.com>,
        linux-man <linux-man@vger.kernel.org>,
        Adam Borowski <kilobyte@angband.pl>
Subject: Re: Quick fix for syscall man page
References: <CAMkHNDzkn10oZLyK9S8-UnjGn=OyMy=P8Bx7+vf0iEBwpc5p2g@mail.gmail.com> <CAKgNAkhOCxB_go-+qSJBAabJxi67c=iBXfajTY09CXUMUj=hnQ@mail.gmail.com>
In-Reply-To: <CAKgNAkhOCxB_go-+qSJBAabJxi67c=iBXfajTY09CXUMUj=hnQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Authentication-Results: mx01-fr.bfs.de
X-Spamd-Result: default: False [-3.10 / 7.00];
         ARC_NA(0.00)[];
         HAS_REPLYTO(0.00)[wharms@bfs.de];
         BAYES_HAM(-3.00)[100.00%];
         FROM_HAS_DN(0.00)[];
         RCPT_COUNT_THREE(0.00)[4];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         TAGGED_RCPT(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         REPLYTO_ADDR_EQ_FROM(0.00)[];
         HAS_WP_URI(0.00)[];
         FREEMAIL_ENVRCPT(0.00)[gmail.com];
         DKIM_SIGNED(0.00)[];
         NEURAL_HAM(-0.00)[-0.999,0];
         FREEMAIL_TO(0.00)[gmail.com];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         FREEMAIL_CC(0.00)[gmail.com];
         MID_RHS_MATCH_FROM(0.00)[];
         RCVD_TLS_ALL(0.00)[];
         RCVD_COUNT_TWO(0.00)[2]
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org



Am 09.09.2019 10:52, schrieb Michael Kerrisk (man-pages):
> [Adding Adam Borowski in CC, since he wrote the riscv text back at the
> start of 2018, andand he may have a comment.]
> 
> On Thu, 5 Sep 2019 at 18:35, Florin Blanaru <florin.blanaru96@gmail.com> wrote:
>>
>> http://man7.org/linux/man-pages/man2/syscall.2.html
>>
>> In the first table, for the riscv Arch/ABI, the instruction should be
>> ecall instead of scall.
>>
>> According the official manual, the instruction has been renamed.
>> https://content.riscv.org/wp-content/uploads/2017/05/riscv-spec-v2.2.pdf
>>
>> "The SCALL and SBREAK instructions have been renamed to ECALL and
>> EBREAK, re-spectively. Their encoding and functionality are
>> unchanged."
> 

Maybe it would be helpful to add a "footnote" that this is a rename only.
Otherwise people may get confused.

jm2c
wh

> Thanks for all of the details. I've applied the patch below.
> 
> Cheers,
> 
> Michael
> 
> diff --git a/man2/syscall.2 b/man2/syscall.2
> index 77e6bccdd..33e5ea655 100644
> --- a/man2/syscall.2
> +++ b/man2/syscall.2
> @@ -196,7 +196,7 @@ mips        syscall v0      v0      v1      a3      1, 6
>  nios2  trap    r2      r2      -       r7
>  parisc ble 0x100(%sr2, %r0)    r20     r28     -       -
>  powerpc        sc      r0      r3      -       r0      1
> -riscv  scall   a7      a0      a1      -
> +riscv  ecall   a7      a0      a1      -
>  s390   svc 0   r1      r2      r3      -       3
>  s390x  svc 0   r1      r2      r3      -       3
>  superh trap #0x17      r3      r0      r1      -       4, 6
> 
