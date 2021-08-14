Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34638C4338F
	for <linux-man@archiver.kernel.org>; Sat, 14 Aug 2021 08:09:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 05AB160F42
	for <linux-man@archiver.kernel.org>; Sat, 14 Aug 2021 08:09:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237305AbhHNIJ4 (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sat, 14 Aug 2021 04:09:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:49486 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236519AbhHNIJz (ORCPT <rfc822;linux-man@vger.kernel.org>);
        Sat, 14 Aug 2021 04:09:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2E69E60F14;
        Sat, 14 Aug 2021 08:09:24 +0000 (UTC)
Date:   Sat, 14 Aug 2021 10:09:22 +0200
From:   Christian Brauner <christian.brauner@ubuntu.com>
To:     Michael Kerrisk <mtk.manpages@gmail.com>
Cc:     ebiederm@xmission.com, linux-man <linux-man@vger.kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        containers@lists.linux-foundation.org,
        Alejandro Colomar <alx.manpages@gmail.com>,
        linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCHi, man-pages] mount_namespaces.7: More clearly explain
 "locked mounts"
Message-ID: <20210814080922.spcv65hjfak4ermg@wittgenstein>
References: <20210813220120.502058-1-mtk.manpages@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210813220120.502058-1-mtk.manpages@gmail.com>
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

On Sat, Aug 14, 2021 at 12:01:20AM +0200, Michael Kerrisk wrote:
> For a long time, this manual page has had a brief discussion of
> "locked" mounts, without clearly saying what this concept is, or
> why it exists. Expand the discussion with an explanation of what
> locked mounts are, why mounts are locked, and some examples of the
> effect of locking.
> 
> Thanks to Christian Brauner for a lot of help in understanding
> these details.
> 
> Link: https://lore.kernel.org/r/20210813220120.502058-1-mtk.manpages@gmail.com
> Reported-by: Christian Brauner <christian.brauner@ubuntu.com>
> Signed-off-by: Michael Kerrisk <mtk.manpages@gmail.com>
> ---

Looks good. Thank you!
Acked-by: Christian Brauner <christian.brauner@ubuntu.com>
