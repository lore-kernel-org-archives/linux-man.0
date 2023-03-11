Return-Path: <linux-man-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1472C61DA4
	for <linux-man@archiver.kernel.org>; Sat, 11 Mar 2023 18:56:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbjCKS4p (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sat, 11 Mar 2023 13:56:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbjCKS4o (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sat, 11 Mar 2023 13:56:44 -0500
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 517BF1B57E
        for <linux-man@vger.kernel.org>; Sat, 11 Mar 2023 10:56:42 -0800 (PST)
Received: (Authenticated sender: schoen@loyalty.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 6D9CD1BF203;
        Sat, 11 Mar 2023 18:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=loyalty.org; s=gm1;
        t=1678561000;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=1FquB8fhQlHTQMm2qVdsQ3+yJq62GvhmOjOGJPXJ+0Q=;
        b=FspjPXZQ7lV07ZiDWBefsgo2QkG45OeEvnom1v51s18G/YbHQKN/KK5cDaHxtusr2q1bqt
        QnEBnw+eBk7Dlyd01GAju0VZ1unvt+yY9GYKYrcWtOqIaz2y4cmQaysYkVfmiGkQ0hWP35
        5asRYV+w7rVCEZ8MjRj8Nk8cSmhJ84RgS63c45A4FoUvBizGhKLcRQZzVjgJcWvqFZXD86
        RHtDeBLgL/3QkaQTss9fPrQ3n8hEGxOOOzSoD/ss50yySgiZTgJ7Y0m3e/73l7tQC2LxEh
        2v1bNOgKjLs5JNbz7pqbMTJtUqPdTkngiJKMgh+1663THtHJxsf8cQo3VocJAg==
Date:   Sat, 11 Mar 2023 10:56:34 -0800
From:   Seth David Schoen <schoen@loyalty.org>
To:     Helge Kreutzmann <debian@helgefjell.de>
Cc:     alx.manpages@gmail.com, mario.blaettermann@gmail.com,
        linux-man@vger.kernel.org
Subject: Re: Dear linux man-pages maintainer,
Message-ID: <20230311185634.GA441010@demorgan>
References: <20230311171354.GA4709@Debian-50-lenny-64-minimal>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230311171354.GA4709@Debian-50-lenny-64-minimal>
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Hi Helge,

I am not the maintainer or anything, but I think it's great that
translators give feedback on the original text.

I have two disagreements with your changes:

(1) You proposed correcting "null byte" to "NUL byte".  However, "null
byte" is a standard way to refer to a byte with the numerical value of
zero.  This byte is also the same as the ASCII character NUL; it could
be regarded as the "encoding" of that character.

(2) You proposed correcting "runlevel" to "run level".  The word
"runlevel" is a coinage by operating system developers; in ordinary
English it would indeed have to be two words, but it's common to write
it with no space in this context.

https://en.wikipedia.org/wiki/Runlevel
