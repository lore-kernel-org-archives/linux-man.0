Return-Path: <SRS0=zzzS=6E=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55F41C3815B
	for <linux-man@archiver.kernel.org>; Mon, 20 Apr 2020 09:55:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0879320CC7
	for <linux-man@archiver.kernel.org>; Mon, 20 Apr 2020 09:55:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oeUGCZkg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725865AbgDTJzm (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 20 Apr 2020 05:55:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725775AbgDTJzm (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Mon, 20 Apr 2020 05:55:42 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F19E8C061A0C
        for <linux-man@vger.kernel.org>; Mon, 20 Apr 2020 02:55:40 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id i10so11286557wrv.10
        for <linux-man@vger.kernel.org>; Mon, 20 Apr 2020 02:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=cc:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=irS4hIZ6Fu1xx5YlGPRY3daCBJM0QT/O/EdUhLahk40=;
        b=oeUGCZkgbvVJvKdFaIsCEgPievXfLjPztDpadYrXJJaLydMVOON7dsRoya4YMSnyQp
         sPGHJr5zUeL+b2WJe4604pqugNEG6o1OAdD1qRZ2bHJd56Q84AMGA+s5ROURp6bx27Cg
         cTu5pEFSJgp08MmGRv+L2eZpC6MnWWs5ErgH2xtWlHVOqCGGu+c832WowI1s3pxPzwAp
         VJu27uL546NFi0Ls6yJCUcwN58+F+MAnhlYfxT14pgZx9qDrspviq7zQb7k3XJegxHp9
         z2jJ9+7cZEh9Mina9MDA4vD9Tzc0vP14iLcv+1Y+mSPpu4QvZMrk0FYjgRnxxhdCK1Nd
         xwBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:cc:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=irS4hIZ6Fu1xx5YlGPRY3daCBJM0QT/O/EdUhLahk40=;
        b=LuquxOgTkvkPNXuaQggqQ7IHc1zsEgI7MSuQtEuSZfOlblvjj28oVctoLzxs5e7Xzp
         MyqxpVYIOf7kRs7mK/7N2hXvWmmWrL4UjvHIAydXFM2dubFUZxRSZgD1lXpCiKwTyX86
         4JcW/4eJwH1G2p03JxtZ+k5eUCN8bXIgPtOxpELl7U//sa28gnHshutnbagZbYHGiX9v
         5WBnNnqNaMo5UMG0mGZ8E0bFGxQE9EADGv4XVx+rkqznmzqh/bxpO27TwveEY708WC3u
         3P0JdJJJqsT5hbULO6PSlzvl4gTd++UvOGPGkz0/UXe7UWSft5sr/JFIHZ4uMpIhjJdk
         DG8Q==
X-Gm-Message-State: AGi0PuaqshFcvpgDUFzT+vWcN6Mb2xWBkr7FfCwbjXE78czFUnaKVL+R
        ctQU7HnvQgPXHCgIOt5XNAK6CSTZ
X-Google-Smtp-Source: APiQypJLQBIemmpTQRwiMf2CZOXJUAECM/1V+ASNRzC+eymev6BNvT//T5Iel6SKiYpvTv/tQW3Svw==
X-Received: by 2002:adf:c402:: with SMTP id v2mr16742436wrf.281.1587376539530;
        Mon, 20 Apr 2020 02:55:39 -0700 (PDT)
Received: from ?IPv6:2001:a61:2482:101:3351:6160:8173:cc31? ([2001:a61:2482:101:3351:6160:8173:cc31])
        by smtp.gmail.com with ESMTPSA id t63sm699999wmt.37.2020.04.20.02.54.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2020 02:55:02 -0700 (PDT)
Cc:     mtk.manpages@gmail.com, linux-man@vger.kernel.org
Subject: Re: Errors in man pages, here: getgrent(3): Understanding
To:     Helge Kreutzmann <debian@helgefjell.de>
References: <20200419064802.GA30678@Debian-50-lenny-64-minimal>
From:   "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Message-ID: <e4a94746-86b5-de7c-73cb-3c939910a404@gmail.com>
Date:   Mon, 20 Apr 2020 11:54:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200419064802.GA30678@Debian-50-lenny-64-minimal>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

On 4/19/20 8:48 AM, Helge Kreutzmann wrote:
> Dear manpages maintainers.
> the manpage-l10n project maintains a large number of translations of
> man pages both from a large variety of sources (including manpages) as
> well for a large variety of target languages.
> 
> During their work translators notice different possible issues in the
> original (english) man pages. Sometiems this is a straightforward
> typo, sometimes a hard to read sentence, sometimes this is a convention
> not held up and sometimes we simply do not understand the original.
> 
> We use several distributions as sources and update regularly (at
> least every 2 month). This means we are fairly recent (some
> distributions like archlinux also update frequently) but might miss
> the latest upstream version once a while, so the error might be
> already fixed. We apologize and ask you to close the issue immediately
> if this should be the case, but given the huge volume of projects and
> the very limited number of volunteers we are not able to double check
> each and every issue.
> 
> Secondly we translators see the manpages in the neutral po format,
> i.e. converted and harmonized, but not the original source (be it man,
> groff, xml or other). So we cannot provide a true patch (where
> possible), but only an approximation which you need to translate into
> your source format.
> 
> Finally the issues I'm reporting have accumulated over time and are
> not always discovered by me, so sometimes my description of the
> problem my be a bit limited - do not hesitate to ask so we can clarify
> them.
> 
> I'm now reporting the errors for your project. As requested, each
> issue is sent in an unique mail for easier tracking on your side. If
> future reports should use another channel, please let me know.
> 
> **
> 
> explain|reword "broken-out" or skip it
> 
> "The B<getgrent>()  function returns a pointer to a structure containing the "
> "broken-out fields of a record in the group database (e.g., the local group "
> "file I</etc/group>, NIS, and LDAP).  The first time B<getgrent>()  is "
> "called, it returns the first entry; thereafter, it returns successive "
> "entries."

I don't really see what the problem is. "broken-out" seems 
reasonably clear to me. I'm ignoring this for now.

Thanks,

Michael



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
