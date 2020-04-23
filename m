Return-Path: <SRS0=0AyU=6H=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFE3EC54FCB
	for <linux-man@archiver.kernel.org>; Thu, 23 Apr 2020 15:14:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A2F2F206EC
	for <linux-man@archiver.kernel.org>; Thu, 23 Apr 2020 15:14:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="hVrM1hgx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729031AbgDWPOh (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Thu, 23 Apr 2020 11:14:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729020AbgDWPOh (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Thu, 23 Apr 2020 11:14:37 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32EF7C08E934
        for <linux-man@vger.kernel.org>; Thu, 23 Apr 2020 08:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=kM3j6YY/YKMU719ZwGJht6WuJU82Z61OqQTxAdV4c10=; b=hVrM1hgxljhgHwRl7btgGZ2g41
        jYkGxdWlUtLCmGbILf5HSnIY1MwBZl2Q/rwL+YyS54Jr850X8hso0T/DBItBW+NTSqJu9atY4b5wM
        02WKz1v2ktvOFFd4JpspOA/RQBlDczD3QPfBJ8whDmQQKG1CBcXFbnh/zkKD6SsTBPoDixPW97T8m
        6g5zFY/wFryJf0L0Gcgsyq5i3K6VBk1TdlRCYbu0HNflmi//rdx1MxTXXOnMlC06KGmTXuH+x55Ai
        COXxzTnlrZClzY2Q6M1pBvC4hYOeq4eUDPHABRJUvAiGxsMDPzeIYtslYI9GG8cKqkD1a8iGvaCOd
        5/oHl2CQ==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jRdYI-0007bU-HR; Thu, 23 Apr 2020 15:14:10 +0000
Date:   Thu, 23 Apr 2020 08:14:10 -0700
From:   Matthew Wilcox <willy@infradead.org>
To:     Minchan Kim <minchan@kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-mm <linux-mm@kvack.org>, Jens Axboe <axboe@kernel.dk>,
        Jann Horn <jannh@google.com>,
        David Rientjes <rientjes@google.com>,
        Arjun Roy <arjunroy@google.com>,
        Tim Murray <timmurray@google.com>,
        Daniel Colascione <dancol@google.com>,
        Sonny Rao <sonnyrao@google.com>,
        Brian Geffon <bgeffon@google.com>,
        Shakeel Butt <shakeelb@google.com>,
        John Dias <joaodias@google.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        SeongJae Park <sj38.park@gmail.com>,
        Oleksandr Natalenko <oleksandr@redhat.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Sandeep Patil <sspatil@google.com>,
        Michal Hocko <mhocko@suse.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Vlastimil Babka <vbabka@suse.cz>, linux-man@vger.kernel.org
Subject: Re: [PATCH 2/2] mm: support vector address ranges for process_madvise
Message-ID: <20200423151410.GC13910@bombadil.infradead.org>
References: <20200423145215.72666-1-minchan@kernel.org>
 <20200423145215.72666-2-minchan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200423145215.72666-2-minchan@kernel.org>
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

On Thu, Apr 23, 2020 at 07:52:15AM -0700, Minchan Kim wrote:
> +SYSCALL_DEFINE6(process_madvise, int, which, pid_t, upid,
> +		const struct iovec __user *, vec, unsigned long, vlen,
> +		int, behavior, unsigned long, flags)
> +{

Don't we now need a compat version of this that calls compat_import_iovec()?
