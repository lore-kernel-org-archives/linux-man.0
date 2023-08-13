Return-Path: <linux-man-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3661EB64DD
	for <linux-man@archiver.kernel.org>; Sun, 13 Aug 2023 13:53:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229612AbjHMNxe (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sun, 13 Aug 2023 09:53:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbjHMNxd (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sun, 13 Aug 2023 09:53:33 -0400
Received: from mail.hallyn.com (mail.hallyn.com [178.63.66.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5180EAB
        for <linux-man@vger.kernel.org>; Sun, 13 Aug 2023 06:53:35 -0700 (PDT)
Received: by mail.hallyn.com (Postfix, from userid 1001)
        id E3295B41; Sun, 13 Aug 2023 08:53:33 -0500 (CDT)
Date:   Sun, 13 Aug 2023 08:53:33 -0500
From:   "Serge E. Hallyn" <serge@hallyn.com>
To:     Alejandro Colomar <alx@kernel.org>
Cc:     "Serge E. Hallyn" <serge@hallyn.com>, linux-man@vger.kernel.org,
        Sargun Dhillon <sargun@sargun.me>,
        John Watts <contact@jookia.org>
Subject: Re: [PATCH v2] clone.2: Fix outdated statement about CLONE_NEWPID
Message-ID: <20230813135333.GA1148436@mail.hallyn.com>
References: <CAMp4zn-BHvCAKWTiVTWb6oEzkFRzd0jHXWHBE1h-BQ+mGUD=WQ@mail.gmail.com>
 <20230813131727.35849-1-alx@kernel.org>
 <20230813133527.GA1148081@mail.hallyn.com>
 <915f236b-499d-a9c1-0d60-c8edd0eba962@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <915f236b-499d-a9c1-0d60-c8edd0eba962@kernel.org>
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

On Sun, Aug 13, 2023 at 03:40:36PM +0200, Alejandro Colomar wrote:
> Hi Serge,
> 
> On 2023-08-13 15:35, Serge E. Hallyn wrote:
> [...]
> 
> > 
> > Well no, I don't think that's right.  That implies that the
> > CLONE_PARENT check was a long standing one.  In fact, the
> > point was that it was a regression introduced in
> > 
> > 40a0d32d1 (Wed Sep 11 14:19:41 2013 -0700)
> > 
> > and then fixed in 1f7f4dde5 two months later.
> 
> Thanks!  I'll rewrite the commit accordingly (more like Sargun's v1)
> and include this info.

Thanks :)

-serge
