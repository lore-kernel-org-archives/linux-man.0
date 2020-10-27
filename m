Return-Path: <SRS0=qeIG=EC=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4F0EC4363A
	for <linux-man@archiver.kernel.org>; Tue, 27 Oct 2020 17:21:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 45C7520809
	for <linux-man@archiver.kernel.org>; Tue, 27 Oct 2020 17:21:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="syW756cP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1818516AbgJ0RUy (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Tue, 27 Oct 2020 13:20:54 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:34454 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1818090AbgJ0RRY (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Tue, 27 Oct 2020 13:17:24 -0400
Received: by mail-ot1-f66.google.com with SMTP id k3so1819493otp.1
        for <linux-man@vger.kernel.org>; Tue, 27 Oct 2020 10:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=XfU59GVu1OejAamPvb8R/EXxyEvafD/eweMzY70O9ok=;
        b=syW756cPGqe3eq6TtjMXTaoQVj8qTzKigFJXQV67/OhOSrneJvNw1Kmcod35HOYobr
         GwdYCf+eZpZ6JdCMHGNCZhy3e61w5BeTyqXZRI3vZXylva35fHQrIaNxivsWnt30dtdt
         2qtp3Qxke4kzLuip4k0qokkWrhQi0BHH3skE931JOGkXowPWk0pELfWNVBgsWIbrM8xK
         3aCxlVZS7fAV4rJJQj4sS+R8QUYTJDzCIUrrV43DQmPx0gpR1te1c4YZ08POJ8FkhMde
         DoRUEm9QwKSEhnmH/Rfae5rTWsWlfMT6DG4ZzBBNBgNEqs3FdA64aAnZQif/mC4zFM+r
         Bz6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=XfU59GVu1OejAamPvb8R/EXxyEvafD/eweMzY70O9ok=;
        b=tdVwEZPPiqAbgdv0aL70hY/7QABi8Yahw3eu/Zl+Her7PDe8znO2vzYhIUJ6vDoYlm
         2KLyleur7smJvsFfOkWgBGYuqQFPIkjItonI9vylpbI84379eH0bI6JZkEwZyNW3tmYj
         yhUsntT8x5Zwn/kuJl/F5Rp+iSYKukPQ9Ykr8jlh6a54E7dMMcCFFSPlOnVrDgID+hmn
         TAfZGZ3i3if1lsBxEmsHxXrgB3ODPhEjM/kfbKC7haD0C8upb57VoJDtbe5lzRlQu2D2
         NgDW6cCYI1JHTT0iVVwm1sgRv9BvFz2MYsGCzNOYHmNRLdiexX/3LQ5uA9uQG6pIgPp3
         OorA==
X-Gm-Message-State: AOAM533wUVgyFkQOWAPNW0zc2NMB/entGdEJtiAM5mxzQuJ1lWwF7H+v
        YtvwcHPVKoL3vvBNghR1HDgh3bCMBtSNaWY7xpc=
X-Google-Smtp-Source: ABdhPJyESfoG1tbAiDDxzhX0oz6V0ALL3ybbp6vwdO84zESH8G14X+X4Kc9/DKmWh39OKpnDBBOOfndt0+RzeheCEN4=
X-Received: by 2002:a9d:5183:: with SMTP id y3mr2317372otg.308.1603819042015;
 Tue, 27 Oct 2020 10:17:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200904161203.598281-1-zwisler@google.com> <CAKgNAkiAkyUjd=cUvASaT2tyhaCdiMF48KA3Ov_1mQf0=J2PXw@mail.gmail.com>
 <20201027170231.GA8939@google.com>
In-Reply-To: <20201027170231.GA8939@google.com>
Reply-To: mtk.manpages@gmail.com
From:   "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Date:   Tue, 27 Oct 2020 18:17:10 +0100
Message-ID: <CAKgNAkjpowN0khPSn9E-D2OQLW7kaU3g=OO+2Cwgd8UTrHQfQw@mail.gmail.com>
Subject: Re: [PATCH] Add NOSYMFOLLOW flags to mount(2) and statfs(2)
To:     Ross Zwisler <zwisler@google.com>
Cc:     Ross Zwisler <zwisler@chromium.org>,
        linux-man <linux-man@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Hey Ross,

On Tue, 27 Oct 2020 at 18:02, <zwisler@google.com> wrote:
>
> On Mon, Sep 07, 2020 at 09:13:08AM +0200, Michael Kerrisk (man-pages) wrote:
> > Hello Ross,
> >
> > On Fri, 4 Sep 2020 at 18:12, Ross Zwisler <zwisler@chromium.org> wrote:
> > >
> > > These flags should first appear in Linux kernel version v5.10.
> > >
> > > Signed-off-by: Ross Zwisler <zwisler@google.com>
> >
> > Thanks for the patch. I will try to keep track of this, but if you
> > happened to notice whether this goes in in 5.10, and pinged this mail
> > thread, that would be great.
>
> Hey Michael,
>
> The associated kernel patches were successfully merged in the v5.10 merge
> window:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=dab741e0e02bd3c4f5e2e97be74b39df2523fc6e

Thank you very much for the ping! I've now merged that patch into a
branch for the next man-pages-5.10 release.

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
