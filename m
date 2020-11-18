Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4181FC6369E
	for <linux-man@archiver.kernel.org>; Wed, 18 Nov 2020 15:00:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B53622470D
	for <linux-man@archiver.kernel.org>; Wed, 18 Nov 2020 15:00:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="JlMuJcCm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726299AbgKRPAo (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Wed, 18 Nov 2020 10:00:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbgKRPAo (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Wed, 18 Nov 2020 10:00:44 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE843C0613D4;
        Wed, 18 Nov 2020 07:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=4ZAMfgrFUzuUjDjqhjvyKWs7Yyb4zhoUH2cqBpb/P9Y=; b=JlMuJcCm7YsUkcT6ezUZZXkyvN
        SK1fXCTZScBC0MnqyguO2d9UmA2OcR+j91CuRP1icUZO8IfGIgkqMwR51CULZ7WTzb5SmDvpDt2qS
        DlteLNjU5QqSn4FoM5FbSn2YjIymrPK7sHvFZfCRnaXQ4O0SDPxIvv1g4AR9BMSLBjEPsnsCljRRO
        uP1Fq5WswgXiWncCLl9odTz4Jc7OxifS2fLNpwN2XkpXeNsmriKDes02I5D+l20QGwcSSQdHZTuHE
        /9R+nVK/ZIOdSdph3Ao90ssdQu4oAgREvhnrL21tjaew8qpkfpzLN3jaDY+Hi8RoqZSOAezcNzqRR
        +DtMTm6Q==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kfOws-0005lu-1d; Wed, 18 Nov 2020 15:00:42 +0000
Date:   Wed, 18 Nov 2020 15:00:41 +0000
From:   Matthew Wilcox <willy@infradead.org>
To:     Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc:     linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        viro@zeniv.linux.org.uk, akpm@linux-foundation.org,
        soheil.kdev@gmail.com, arnd@arndb.de, shuochen@google.com,
        linux-man@vger.kernel.org, Willem de Bruijn <willemb@google.com>
Subject: Re: [PATCH v3 1/2] epoll: add nsec timeout support with epoll_pwait2
Message-ID: <20201118150041.GF29991@casper.infradead.org>
References: <20201118144617.986860-1-willemdebruijn.kernel@gmail.com>
 <20201118144617.986860-2-willemdebruijn.kernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201118144617.986860-2-willemdebruijn.kernel@gmail.com>
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

On Wed, Nov 18, 2020 at 09:46:15AM -0500, Willem de Bruijn wrote:
> -static inline struct timespec64 ep_set_mstimeout(long ms)
> +static inline struct timespec64 ep_set_nstimeout(s64 timeout)
>  {
> -	struct timespec64 now, ts = {
> -		.tv_sec = ms / MSEC_PER_SEC,
> -		.tv_nsec = NSEC_PER_MSEC * (ms % MSEC_PER_SEC),
> -	};
> +	struct timespec64 now, ts;
>  
> +	ts = ns_to_timespec64(timeout);
>  	ktime_get_ts64(&now);
>  	return timespec64_add_safe(now, ts);
>  }

Why do you pass around an s64 for timeout, converting it to and from
a timespec64 instead of passing around a timespec64?

