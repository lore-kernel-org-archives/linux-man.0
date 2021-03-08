Return-Path: <SRS0=phoQ=IG=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65B10C433E6
	for <linux-man@archiver.kernel.org>; Mon,  8 Mar 2021 11:05:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1F17E651D3
	for <linux-man@archiver.kernel.org>; Mon,  8 Mar 2021 11:05:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231334AbhCHLFX (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 8 Mar 2021 06:05:23 -0500
Received: from mail-out.m-online.net ([212.18.0.9]:43768 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230444AbhCHLFX (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Mon, 8 Mar 2021 06:05:23 -0500
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4DvFqj5kWLz1qsk9;
        Mon,  8 Mar 2021 12:05:21 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4DvFqj5G9jz1r1M1;
        Mon,  8 Mar 2021 12:05:21 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id achqku7gSnhy; Mon,  8 Mar 2021 12:05:20 +0100 (CET)
X-Auth-Info: a2i9v9G115IXmxAFM6yKq+BjGaS25t6LuRS+wDgEzTbUUrPS6WiW6hNGbIx5fvqj
Received: from igel.home (ppp-46-244-182-153.dynamic.mnet-online.de [46.244.182.153])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Mon,  8 Mar 2021 12:05:20 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
        id 4D5FE2C37B5; Mon,  8 Mar 2021 12:05:20 +0100 (CET)
From:   Andreas Schwab <schwab@linux-m68k.org>
To:     "Alejandro Colomar (man-pages) via Libc-alpha" 
        <libc-alpha@sourceware.org>
Cc:     "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>,
        Florian Weimer <fweimer@redhat.com>,
        "Alejandro Colomar (man-pages)" <alx.manpages@gmail.com>,
        linux-man <linux-man@vger.kernel.org>
Subject: Re: pthread_cleanup_push_defer_np.3: missing functions in glibc
References: <1ee301e5-d3a4-2e0e-3473-6b0eea304266@gmail.com>
X-Yow:  Spreading peanut butter reminds me of opera!!  I wonder why?
Date:   Mon, 08 Mar 2021 12:05:20 +0100
In-Reply-To: <1ee301e5-d3a4-2e0e-3473-6b0eea304266@gmail.com> (Alejandro
        Colomar via Libc-alpha's message of "Mon, 8 Mar 2021 11:35:35 +0100")
Message-ID: <87lfax52j3.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1.91 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

On Mär 08 2021, Alejandro Colomar (man-pages) via Libc-alpha wrote:

> While adding 'restrict' to the prototypes, I found that the functions
> defined in this page don't exist on glibc (or I couldn't find them).

sysdeps/nptl/pthread.h:#   define pthread_cleanup_push_defer_np(routine, arg) \
sysdeps/nptl/pthread.h:#   define pthread_cleanup_pop_restore_np(execute) \
sysdeps/nptl/pthread.h:#   define pthread_cleanup_push_defer_np(routine, arg) \
sysdeps/nptl/pthread.h:#   define pthread_cleanup_pop_restore_np(execute) \
sysdeps/nptl/pthread.h:#  define pthread_cleanup_push_defer_np(routine, arg) \
sysdeps/nptl/pthread.h:#  define pthread_cleanup_pop_restore_np(execute) \

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
