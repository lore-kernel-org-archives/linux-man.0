Return-Path: <SRS0=cO9Y=BD=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B63ADC433E0
	for <linux-man@archiver.kernel.org>; Fri, 24 Jul 2020 15:18:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8F892206D7
	for <linux-man@archiver.kernel.org>; Fri, 24 Jul 2020 15:18:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="u9byQAYx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726397AbgGXPSI (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Fri, 24 Jul 2020 11:18:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726170AbgGXPSH (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Fri, 24 Jul 2020 11:18:07 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACC6EC0619D3
        for <linux-man@vger.kernel.org>; Fri, 24 Jul 2020 08:18:07 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id t4so8285629oij.9
        for <linux-man@vger.kernel.org>; Fri, 24 Jul 2020 08:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=vmWH0D8CCWuPQVvwXsprqqs4bfq8vhGaZ84vTzrfUkI=;
        b=u9byQAYxypcl8wk3BZue72rRPoIq5BfxxIIRvYF9QCGDjvRwvZ1MHRGKrwv4S2rdaV
         zUlD7es8h5NsBciWM4GobtWfDaFlKUhzEQpYovtV4VBDFDCT1g504QdNx7RI9ebpkcg9
         dR1zY5tRWCLyI6ICfUyBHR5vzXjELQu6DZvN8ugo9UGCU2kb8LPBeIdmMf9rREyI7toA
         wSFEHEXvEHwZq+JHN4VeP9v7fwDbCPB8UNzsgnBd85tgx2Y+/gCdpl9+oY8T1SEXh/Zs
         UE5bpAhfcKiuQFRw4wyZKvlRXADXbYr4Fc7mAPF2WMfoUiXKTJzbcf06NO2oCq+Ri5U8
         TOMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=vmWH0D8CCWuPQVvwXsprqqs4bfq8vhGaZ84vTzrfUkI=;
        b=Xai1TCL+t1JEx4GBTEjLe0E3PTaeRl8t/Eg59KwHaCgqlAidQZvwvY1lIWP8L4lwHl
         93HfV22Pz5lIauLDRYojzAOtA2cg68UzTTmkxs/UVKpjrKch4UUqE6XC466yPH72Xscb
         go+/2/5enjKP9dDibl+UjgD3N+ts3xmj7pGx2HE5GIa4wYZzMj3nse2Jf0npL+sg7KCO
         3grcDZGz4LUPO/wcm1m0Q2+3cNVgLbmJ63DRtjkGMcRBeyUUDRuMPzyccTTFqSIeJ+bt
         3af2JSb6bq4QLJUpEPlpEPVauVzMEmiNY8imutju4ME29N6VX0R5uuOVOE8yNqkrtn3C
         mE9g==
X-Gm-Message-State: AOAM533uTtMOE0Cbo4VYpMzFYEDPrwFQdeOIeoOeNnIOGOjttZnSgGOB
        26PrR8zjvpZ6yeAWzMyvVlSp5R7HPJfJQoQSGkxtrQ==
X-Google-Smtp-Source: ABdhPJzVU30nqgr0ueFwHwKinspi1PiUI9h1K32aI/PhPr292kMFK0JnT6pzKcJurAEGArAb98PhSnTLiUR0pv3Lnvo=
X-Received: by 2002:aca:5683:: with SMTP id k125mr8507322oib.159.1595603887051;
 Fri, 24 Jul 2020 08:18:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200723215333.13779-1-vapier@gentoo.org> <20200724000315.yx5otylik6oqqy6d@localhost.localdomain>
 <CAKgNAkjwwxrM_ry-b1rtrVc8YjfNE=p4iAht85P+mBs6Eq0U-w@mail.gmail.com>
 <20200724121555.e4l2okob3x3fzk5z@localhost.localdomain> <beb87fab-b925-fb57-541f-fe5c77ce5cbe@gmail.com>
 <CACKs7VCLbSwr+3Tjc=y=Os-1R7iHU8H8145FkZ_Sojg86AuPNg@mail.gmail.com>
In-Reply-To: <CACKs7VCLbSwr+3Tjc=y=Os-1R7iHU8H8145FkZ_Sojg86AuPNg@mail.gmail.com>
Reply-To: mtk.manpages@gmail.com
From:   "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Date:   Fri, 24 Jul 2020 17:17:54 +0200
Message-ID: <CAKgNAkj4HxfC_gJFefGdTVFb+tswTOKFMAk9SYT-v=cCCcCwMw@mail.gmail.com>
Subject: Re: [PATCH] drop spurious t comment header
To:     Stefan Puiu <stefan.puiu@gmail.com>
Cc:     "G. Branden Robinson" <g.branden.robinson@gmail.com>,
        linux-man <linux-man@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Hi Stefan,

On Fri, 24 Jul 2020 at 15:13, Stefan Puiu <stefan.puiu@gmail.com> wrote:
>
> Hi Michael,
>
> I think I noticed one typo in your description text (and I also see it in git):
>
> On Fri, Jul 24, 2020 at 3:30 PM Michael Kerrisk (man-pages)
> <mtk.manpages@gmail.com> wrote:
> > Historically, a comment of the following form at the top of a
> > manual page was used to indicate too man(1) that the use of tbl(1)
>
> s/too man/to man?

Yes, I spotted it too, but too late...

Thanks,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
