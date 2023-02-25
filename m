Return-Path: <linux-man-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4BE1C7EE2D
	for <linux-man@archiver.kernel.org>; Sat, 25 Feb 2023 10:42:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229504AbjBYKmF (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sat, 25 Feb 2023 05:42:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbjBYKmF (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sat, 25 Feb 2023 05:42:05 -0500
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2F0A8BBAF
        for <linux-man@vger.kernel.org>; Sat, 25 Feb 2023 02:42:04 -0800 (PST)
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
        by vmicros1.altlinux.org (Postfix) with ESMTP id 6916772C90B;
        Sat, 25 Feb 2023 13:42:03 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
        id 3A11C7CFDF8; Sat, 25 Feb 2023 13:42:03 +0300 (MSK)
Date:   Sat, 25 Feb 2023 13:42:03 +0300
From:   "Dmitry V . Levin" <ldv@strace.io>
To:     =?utf-8?B?zqbPjs+EzrfPgiDOks6xzrvOsc+DzrnOrM60zrfPgg==?= 
        <fvalasiad@gmail.com>
Cc:     linux-man@vger.kernel.org,
        Alejandro Colomar <alx.manpages@gmail.com>,
        Michael Kerrisk <mtk.manpages@gmail.com>,
        Elvira Khabirova <lineprinter0@gmail.com>
Subject: Re: [PATCH] ptrace.2: Add details about usage of
 PTRACE_GET_SYSCALL_INFO
Message-ID: <20230225104203.GA17229@altlinux.org>
References: <20230225024212.31500-1-fvalasiad@gmail.com>
 <20230225101014.GB16562@altlinux.org>
 <b8941b80-2f6d-68b0-d793-71542f96b6bb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b8941b80-2f6d-68b0-d793-71542f96b6bb@gmail.com>
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

On Sat, Feb 25, 2023 at 12:33:15PM +0200, Φώτης Βαλασιάδης wrote:
> On 25/2/23 12:10, Dmitry V . Levin wrote:
> > I'm not sure about the word "fix" in this context as we are not
> > correcting some wrong information but simply extending the documentation.
> >
> > How about the following wording:
> >
> > Document the role of PTRACE_O_TRACESYSGOOD option in connection with
> > PTRACE_GET_SYSCALL_INFO.
> 
> Sure! Do I use Cowritten-by, Acked-by or Reviewed-by?

Cowritten-by seems to suit better in this case.


-- 
ldv
