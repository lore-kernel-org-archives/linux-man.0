Return-Path: <linux-man-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE73BC6FD20
	for <linux-man@archiver.kernel.org>; Fri, 24 Mar 2023 12:47:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231228AbjCXMrX (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Fri, 24 Mar 2023 08:47:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230329AbjCXMrW (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Fri, 24 Mar 2023 08:47:22 -0400
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7EAF1C591
        for <linux-man@vger.kernel.org>; Fri, 24 Mar 2023 05:47:21 -0700 (PDT)
Received: from submission (posteo.de [185.67.36.169]) 
        by mout02.posteo.de (Postfix) with ESMTPS id 6E270240654
        for <linux-man@vger.kernel.org>; Fri, 24 Mar 2023 13:47:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
        t=1679662040; bh=8+Zo9flUL/LL3Jax3REuh0zQHYjhP/14U7NIfXWk2uM=;
        h=Date:Cc:Subject:From:To:From;
        b=Nb0PljvrWBz3Rns0cKcC/PnPu2Xa9W4fGLj78Njg8TbF+B0kgLQFQMOt+c6hrC4WN
         Qa0DdXfAv/+TDy9aWC64N1HiAJIhIX9m/Vmsg0uuLpe7ASTUBvucv4dbRi6p9a6gFH
         +amtxOqWjZZiSpsmBIg64YITVdWzGf/m10yDlrLuIkvIAdxNcBwM2FlWq0oQFjDdOJ
         Emjh4qLGlIzUvCcqWWTs1d2fTA37Dpr3NW77oU6qFoWNOtmbgZt9bnI57KJ4KSKEAR
         ZNae1ddNUTJcPHpGDBhGmfDg3tbkcX37W/UF4joxhdAzi9tc1YUzmtW00BT0zVztpX
         8wR0U2egEtlNg==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4Pjhn24b0dz6tmL;
        Fri, 24 Mar 2023 13:47:18 +0100 (CET)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 24 Mar 2023 12:46:31 +0000
Message-Id: <CREMHEG9VJ7R.2DKYU7GIT4J8V@morphine>
Cc:     <linux-man@vger.kernel.org>, "Guillem Jover" <guillem@hadrons.org>,
        "Brian Inglis" <Brian.Inglis@Shaw.ca>,
        "Matt Jolly" <Matt.Jolly@footclan.ninja>
Subject: Re: [PATCH v2] stdc: some improvements
From:   "Tom Schwindl" <schwindl@posteo.de>
To:     "Alejandro Colomar" <alx.manpages@gmail.com>,
        "Oskari Pirhonen" <xxc3ncoredxx@gmail.com>,
        "Sam James" <sam@gentoo.org>
References: <ZB0v95XCMia3ibVj@dj3ntoo>
 <a16c019b-66dd-adc1-769c-8a6fb813e288@gmail.com>
In-Reply-To: <a16c019b-66dd-adc1-769c-8a6fb813e288@gmail.com>
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

> > +
> > +# vim: set noexpandtab:
>
> I'm not sure we want vim comments like this one for every file.  Aren't
> they too noisy?  But maybe it's just me.  I use things like the following
> for when I contribute regularly to projects that use a different rule for
> indentation:
>

I second this. Vim comments pollute source files and are way too editor
specific. It's also questionable if they're that useful. If someone sends
a patch with spaces instead of tabs, that's easy to catch and fix.

--=20
Best Regards,
Tom Schwindl
