Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 166DDC4742C
	for <linux-man@archiver.kernel.org>; Mon, 16 Nov 2020 08:44:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A06D221D93
	for <linux-man@archiver.kernel.org>; Mon, 16 Nov 2020 08:44:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="edKnpsQ9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726628AbgKPI1B (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 16 Nov 2020 03:27:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726297AbgKPI1A (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Mon, 16 Nov 2020 03:27:00 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65E72C0613CF
        for <linux-man@vger.kernel.org>; Mon, 16 Nov 2020 00:26:59 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id m17so17954136oie.4
        for <linux-man@vger.kernel.org>; Mon, 16 Nov 2020 00:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=FIGPkZ6ndNPVWQkZbZ45hudpmzphCjRFXIFlvnjNTXY=;
        b=edKnpsQ9aNkl8vNYKrRVCRLJbZUAk2ySe3d2IN3PytJdDkgFLtw0z5R6I6XrwTOMX2
         csPU1wPlCjdQY/CoKaMxH8UjTJ13FI55x2mh1z7KH+DZgVx6ccd6NUCBWRpFj+DWeP6q
         M7KIUmQiwR1SStiRH9uCPsEUj5nPkjACfx0ZrurrYHSJlNBCIU03AigKtn1i2yMAYTvp
         UFI7OrOmdoSYBk/tIhb/OI8gNlOtPcsGMS/AyYX2lxBdbMg8KX2D++PZwloKPEtnKARD
         qL5Vlnymxjb1KWxlIaMgGtleCO2aXg5yiNYBP7J9gBIKxGzUJXrcjBic6VVuQeXHTULG
         cDNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=FIGPkZ6ndNPVWQkZbZ45hudpmzphCjRFXIFlvnjNTXY=;
        b=c0l2k6oazBq9i70Um+EDCKTvMGWc1eqQNMkHtzl7tcdo7MLEOzMUfpr3peOgiJaeEi
         KW2Jo3Kag8+7ZMzzkaf4CG4hezcm//RqIlI6j56BnFmWipcpU5EQti1FLNqlvIV+5maA
         rSIWdECgzA/ksq/RK5yYdUQoUeg/Moog9zHqlSf82p+hs0F/pHraKQ9cyY6mlOX03AKI
         GDyPvYvMY5/ZWKZajYs9jC5sKKUrM1sJIqPurW0agF+q1Xo2Foeuj7E/3QGPp1T31nKZ
         Oso9A6xKWQoRM3l2FxK+E8G5zR6bvEIT31Aa2ueJdTKvSw0olkKz2XsBNpqRrYHFjRWg
         jKvA==
X-Gm-Message-State: AOAM5321yd5PsGViwNO5130GNZBtm5Y4t2Xf8rYqM8/zSXW2lGDmMYib
        QOJkROCJ6f/mbB32KlZFtWSwyH2yvjEFWKuk+0o=
X-Google-Smtp-Source: ABdhPJyVQN1q7b4d4U2I4WhHHa7Y2K00AIve6KbIjke/xJFmbRJPzFCW6B4xopCk5kZ/cOkplOjEjo1XIBXgTksOC7g=
X-Received: by 2002:aca:548e:: with SMTP id i136mr9377522oib.177.1605515218743;
 Mon, 16 Nov 2020 00:26:58 -0800 (PST)
MIME-Version: 1.0
References: <20201115165256.497403-1-alx.manpages@gmail.com> <accea029-e467-4928-af40-d4cc1bc0be21@gmail.com>
In-Reply-To: <accea029-e467-4928-af40-d4cc1bc0be21@gmail.com>
Reply-To: mtk.manpages@gmail.com
From:   "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Date:   Mon, 16 Nov 2020 09:26:47 +0100
Message-ID: <CAKgNAkjrvVA8f5at5i1rMxMQ2juVamiG0NGtitXg6Qkyi3HgRg@mail.gmail.com>
Subject: Re: [RFC] memusage.1, uri.7, user-keyring.7, user-session-keyring.7,
 ld.so.8, tzselect.8: srcfix: Replace \f markup by .
To:     Alejandro Colomar <alx.manpages@gmail.com>
Cc:     linux-man <linux-man@vger.kernel.org>,
        "G. Branden Robinson" <g.branden.robinson@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

On Sun, 15 Nov 2020 at 21:54, Michael Kerrisk (man-pages)
<mtk.manpages@gmail.com> wrote:
>
> Hi Alex,
>
> Briefly...
>
> > And I also found a few weird files (such as zic.8 and zdump.8).
> > Where do those come from?
> > I'll try to rewrite them using man(7) markup.
>
> Stop!! These pages are special. They are periodically imported from
> the tz project. It's an odd situation. Glibc imports these tools
> from the tz project, but does not release manual pages. So,
> periodically (when Paul Eggert reminds me), I resync the pages from
> the tz project. In general, I try to just leave them alone (although
> I have suggested a few fixes upstream to Paul), although I see
> I have touched some of those pages in global edits.
>
> > In the meantime,
> > I would also have to omit those files from the input to the script.
> > Do you have a list of such files?
>
> AFAIR, the only other special page is bpf-helpers.7, which
> is generated from the kernel source files using scripts.
> Every few months, I try to remember to run the scripts
> to resync.

One more page that I forgot: tzfile.5 also comes from the tz project.

Thanks,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
