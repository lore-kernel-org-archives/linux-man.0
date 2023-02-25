Return-Path: <linux-man-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AA56C64ED8
	for <linux-man@archiver.kernel.org>; Sat, 25 Feb 2023 00:08:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbjBYAIf (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Fri, 24 Feb 2023 19:08:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbjBYAIe (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Fri, 24 Feb 2023 19:08:34 -0500
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 32EAF18AAB
        for <linux-man@vger.kernel.org>; Fri, 24 Feb 2023 16:08:33 -0800 (PST)
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
        by vmicros1.altlinux.org (Postfix) with ESMTP id 6DA2672C90B;
        Sat, 25 Feb 2023 03:08:32 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
        id 5DD1B7CFDF4; Sat, 25 Feb 2023 03:08:32 +0300 (MSK)
Date:   Sat, 25 Feb 2023 03:08:32 +0300
From:   "Dmitry V. Levin" <ldv@strace.io>
To:     =?utf-8?B?zqbPjs+EzrfPgiDOks6xzrvOsc+DzrnOrM60zrfPgg==?= 
        <fvalasiad@gmail.com>
Cc:     linux-man@vger.kernel.org, alx.manpages@gmail.com,
        mtk.manpages@gmail.com, Nate Eldredge <nate@thatsmathematics.com>,
        Elvira Khabirova <lineprinter0@gmail.com>
Subject: Re: [PATCH] ptrace.2: Add details about usage of
 PTRACE_GET_SYSCALL_INFO
Message-ID: <20230225000832.GA10444@altlinux.org>
References: <20230224163142.29934-1-fvalasiad@gmail.com>
 <20230224185347.GB7758@altlinux.org>
 <2d242bd0-becc-71d3-3666-43c9271d143b@gmail.com>
 <20230224220502.GA9955@altlinux.org>
 <23a102ec-e146-0e82-c5d2-434e9ae56b28@gmail.com>
 <20230224233148.GB9955@altlinux.org>
 <c8931c0d-afa2-e43f-cc53-4c29114f322f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c8931c0d-afa2-e43f-cc53-4c29114f322f@gmail.com>
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

On Sat, Feb 25, 2023 at 01:43:18AM +0200, Φώτης Βαλασιάδης wrote:
> Better?
> 
> diff --git a/man2/ptrace.2 b/man2/ptrace.2
> index 55d9fd36d..ad0543b0b 100644
> --- a/man2/ptrace.2
> +++ b/man2/ptrace.2
> @@ -1111,6 +1111,15 @@ stop.
>   .B PTRACE_SYSCALL_INFO_NONE
>   No component of the union contains relevant information.
>   .RE
> +.IP
> +Note that in case of
> +syscall entry or exit stops, the data returned by
> +.B PTRACE_GET_SYSCALL_INFO
> +is limited to type
> +.B PTRACE_SYSCALL_INFO_NONE
> +unless
> +.B PTRACE_O_TRACESYSGOOD
> +option is set before the corresponding ptrace stop has occurred.
>   .\"
>   .SS Death under ptrace
>   When a (possibly multithreaded) process receives a killing signal

LGTM, thanks.


-- 
ldv
