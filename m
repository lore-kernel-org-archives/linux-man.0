Return-Path: <SRS0=zzzS=6E=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 155E5C3A5A0
	for <linux-man@archiver.kernel.org>; Mon, 20 Apr 2020 06:52:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E35E021473
	for <linux-man@archiver.kernel.org>; Mon, 20 Apr 2020 06:52:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oQYUy4p2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726054AbgDTGwk (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 20 Apr 2020 02:52:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725815AbgDTGwk (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Mon, 20 Apr 2020 02:52:40 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70CFAC061A0C
        for <linux-man@vger.kernel.org>; Sun, 19 Apr 2020 23:52:38 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id t63so8688103wmt.3
        for <linux-man@vger.kernel.org>; Sun, 19 Apr 2020 23:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=cc:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=aUeLwO1OTlcDh6TaO434Mz7oef5uNnLsJKbpQxNCEig=;
        b=oQYUy4p23ThiAUUzr8ONFL3GP4jLjqEfddeP8YgJp802jL0y2uIfNdXs9E3guRUL/G
         Zt1LY5HABJQOH9ZwTnbN6naDvJm/NdFlUboSV/Pdln9kh89FJP89AQC87bRwMxKMxFpg
         NoZ2ZhOZ9xGK7Rh+nWNxU9JEZ+cLXoYSIcnZmgEHsJDkYkVYhbRQ5Sl4ooKglGErsdB0
         zoAhAGRUS4iPTA23tAfS0w89qqYBJ7ZihXpBzAAsAc8zgcwbB9X/t24v6z6wCfMCKUFD
         tALpWAGGzmE/5AxEjavw7tuJtQBIKoX+6Q1D9yZWtoDmd9m1qS+4obbQM2PnD/7Xn5H6
         /tGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:cc:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aUeLwO1OTlcDh6TaO434Mz7oef5uNnLsJKbpQxNCEig=;
        b=DsLNfjUrDI89SKlnuJYgByL2HgkHgu0W4QTlYSo0+nzV5dqVE8Srpkig4G2MzknSZ8
         Jtiax7QmJITxT8GZk/UkvngOL9zNOu4MZnTy+mDn1zGss+888nCi7KjKF3EtuA0WPw5F
         D3yZyu/0b1hQf6n0h8g4qX78UxUB/+EAkW/X63fwIYkYVKxAlYtEP6MMZhABniU4/X7N
         tIAYyGwzyyCvmKU+n+ovCx+6Uh9dQl6EDcwqO3fTkdGe0t7G6O5dEmu/+vdGPaa6hAhi
         /jTkcLlbzJIIwJf8fVVPhCMJDIxi9QRAXhXFq/4xQTCQeDGINmL6B9r/h1+Q15oZ4TC5
         mNeg==
X-Gm-Message-State: AGi0PuY/nEL8osrIaOXa0j3+6WBFksLbIwhLImGuEOOHanaN7/GNZZEP
        C8IIYF7IyYH+XWPm0ZdLu1o+Lmp3
X-Google-Smtp-Source: APiQypI/TK7htZ7myLPxFSxmapq9pfy1mJ3Mll7b3QZupHai+kV7VuKObqks2sweu1Yh+Jxf0UE/zQ==
X-Received: by 2002:a05:600c:2306:: with SMTP id 6mr17089051wmo.17.1587365557053;
        Sun, 19 Apr 2020 23:52:37 -0700 (PDT)
Received: from ?IPv6:2001:a61:2482:101:3351:6160:8173:cc31? ([2001:a61:2482:101:3351:6160:8173:cc31])
        by smtp.gmail.com with ESMTPSA id b66sm99776wmh.12.2020.04.19.23.52.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Apr 2020 23:52:36 -0700 (PDT)
Cc:     mtk.manpages@gmail.com, linux-man@vger.kernel.org
Subject: Re: Errors in man pages, here: getdtablesize(3): Formatting
To:     Helge Kreutzmann <debian@helgefjell.de>
References: <20200419064801.GA30654@Debian-50-lenny-64-minimal>
From:   "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Message-ID: <81dfe813-2ce0-60ee-1afc-da68e114d9b7@gmail.com>
Date:   Mon, 20 Apr 2020 08:52:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200419064801.GA30654@Debian-50-lenny-64-minimal>
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
> Formatting of B<getrlimit>(2) ??
> Is it s/getrlimit/getdtablesize/  
> 
> "SVr4, 4.4BSD (the B<getdtablesize>()  function first appeared in 4.2BSD).  "
> "It is not specified in POSIX.1; portable applications should employ "
> "I<sysconf(_SC_OPEN_MAX)> instead of this call."

Either I don't understand the report, or it is incorrect. More details please.

Thanks,

Michael



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
