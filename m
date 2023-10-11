Return-Path: <linux-man-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18EC3CDB467
	for <linux-man@archiver.kernel.org>; Wed, 11 Oct 2023 16:43:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346812AbjJKQnn convert rfc822-to-8bit (ORCPT
        <rfc822;linux-man@archiver.kernel.org>);
        Wed, 11 Oct 2023 12:43:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235149AbjJKQnm (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Wed, 11 Oct 2023 12:43:42 -0400
Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29201E4;
        Wed, 11 Oct 2023 09:43:40 -0700 (PDT)
Received: from imladris.home.surriel.com ([10.0.13.28] helo=imladris.surriel.com)
        by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.96.1)
        (envelope-from <riel@shelob.surriel.com>)
        id 1qqcJ8-0004S7-2t;
        Wed, 11 Oct 2023 12:43:38 -0400
Message-ID: <6347cb90238ce61fb21a8203da53497663cee60a.camel@surriel.com>
Subject: Re: [PATCH v2] execve.2: execve also returns E2BIG if a string is
 too long
From:   Rik van Riel <riel@surriel.com>
To:     Alejandro Colomar <alx@kernel.org>
Cc:     linux-man@vger.kernel.org, kernel-team@meta.com,
        LKML <linux-kernel@vger.kernel.org>,
        Eric Biederman <ebiederm@xmission.com>,
        Matthew House <mattlloydhouse@gmail.com>
Date:   Wed, 11 Oct 2023 12:43:38 -0400
In-Reply-To: <ZSbD59Y5y3zNGC1h@debian>
References: <20231011101134.709b8089@imladris.surriel.com>
         <ZSbD59Y5y3zNGC1h@debian>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
Sender: riel@surriel.com
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

On Wed, 2023-10-11 at 17:48 +0200, Alejandro Colomar wrote:
> Hi Rik,
> 
> On Wed, Oct 11, 2023 at 10:11:34AM -0400, Rik van Riel wrote:
> > The execve syscall returns -E2BIG in 3 cases:
> > - The total length of the command line arguments and environment is
> > too large.
> > - An argument or environment string is longer than MAX_ARG_STRLEN.
> 
> Please mention that this includes the terminating NUL, as Matthew
> confirmed.  Otherwise, to user-space programmers, this would usually
> be
> interpreted as `strlen(p) > MAX_ARG_STRLEN`.
> 
> An example program that demonstrates the limit would be very
> interesting
> here.

Thank you for the detailed review.

I think all the comments are addressed in version 3.
-- 
All Rights Reversed.
