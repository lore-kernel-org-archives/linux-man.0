Return-Path: <SRS0=qeIG=EC=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35C4AC56202
	for <linux-man@archiver.kernel.org>; Tue, 27 Oct 2020 10:36:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CDBB422264
	for <linux-man@archiver.kernel.org>; Tue, 27 Oct 2020 10:36:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Bg0yRl3D"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2898480AbgJ0KgG (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Tue, 27 Oct 2020 06:36:06 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:41733 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2898468AbgJ0KgF (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Tue, 27 Oct 2020 06:36:05 -0400
Received: by mail-lf1-f67.google.com with SMTP id 126so1640631lfi.8
        for <linux-man@vger.kernel.org>; Tue, 27 Oct 2020 03:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mDAK9Qmkus2JuFVmISrLkJzFGr6N2n2S3A2eNKiZQ80=;
        b=Bg0yRl3DQQJVxqp9z1MVtlyenRDUqs8aPuoR+xoioHWwUWs0lLufTQ0M8jBvgOSIIc
         WyfviguwJb7eVf2UjVyKrPR05ZUJbF9hf+dbjaJLfq1Uv2VIu9tph4Kf3oE+CFQIoZAI
         Oyd+2XK2nSYUtOcFK29xdNgF+TC5C09ayB9mAe/r2rAvftzT6MiOX3csfK2KaAL2kEEh
         t+QAlfivOX8He8/C0Kta3s0rQz+3ri+d/JFFoQmKw8e6hW9h2vSJNV7BjzLovAjAL7Ep
         w310lf/AxYh0alfxlvPz+OW5hevPCYRk9fnNgsPYOQC8q86pup6ZK3hd9vCYw3tWMSCX
         +ahA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mDAK9Qmkus2JuFVmISrLkJzFGr6N2n2S3A2eNKiZQ80=;
        b=m+b7pE+ud4SkhIv3qA4bEF1l1DBSS+OIsu7i97o3ftZbYaQz6m5ntduo+gMJyvcCrD
         xcT8HUSmF7YmOanhStTQ6BDmd0cC4DZtkNfOOTmcMKKVcjazdxEivRWwIERpXcJQMopr
         rD+TFWYN+E4CxkAxH7XA5wH4u/3MJLE73xgR1vSnz+0Uwn5VN2e1I6kiq199SV2PmJCT
         aUGMOFX2DFttmVHScwAfp0U69mi9eE7Qut3Z3o9/vhvSMmwbLrcsbDVMP1v+ewfFetGj
         RH1ja9IkOJoQfW0UtOnfbC/yiCxjKEuEWiheEBdsw/JEalQIzvp8jAeEru5YMwn0WD7l
         0YFQ==
X-Gm-Message-State: AOAM532YG+nUbkUkRB3J4dl6MHE/VmVQONXBx2GWaJ//2cGlZLcMcDRu
        SZCaJEL55LTnGGpGONwGFxPATA3LataHgMsqt2pS4ZsIa6E=
X-Google-Smtp-Source: ABdhPJzzd0v9qutxuBdKKI7KWhwYgFAlqxH6SXNpsTX8Meps08NuGo/cq13wdOHWuN7X4eo0Or1tURBcsH7krfoPslg=
X-Received: by 2002:a19:e308:: with SMTP id a8mr587547lfh.573.1603794962371;
 Tue, 27 Oct 2020 03:36:02 -0700 (PDT)
MIME-Version: 1.0
References: <20201012114940.1317510-1-jannh@google.com> <CAG48ez17=x9eHLGR-Uyx3xsVJv3W=4WsTs3HG5Fam5UP=CWXbQ@mail.gmail.com>
 <0a090c14-6b70-4284-bb2d-4fbfd1146aaf@gmail.com>
In-Reply-To: <0a090c14-6b70-4284-bb2d-4fbfd1146aaf@gmail.com>
From:   Jann Horn <jannh@google.com>
Date:   Tue, 27 Oct 2020 11:35:35 +0100
Message-ID: <CAG48ez2gigjfi3_nmbyhDnb2bsi9K0Yc24y7HdSNDvtumWGbiw@mail.gmail.com>
Subject: Re: [PATCH] proc.5: Document inaccurate RSS due to SPLIT_RSS_COUNTING
To:     "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc:     linux-man <linux-man@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        Mark Mossberg <mark.mossberg@gmail.com>,
        Michal Hocko <mhocko@suse.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

On Tue, Oct 27, 2020 at 8:05 AM Michael Kerrisk (man-pages)
<mtk.manpages@gmail.com> wrote:
> On 10/12/20 4:52 PM, Jann Horn wrote:
> > On Mon, Oct 12, 2020 at 1:49 PM Jann Horn <jannh@google.com> wrote:
> >> Since 34e55232e59f7b19050267a05ff1226e5cd122a5 (introduced back in
> >> v2.6.34), Linux uses per-thread RSS counters to reduce cache contention on
> >> the per-mm counters. With a 4K page size, that means that you can end up
> >> with the counters off by up to 252KiB per thread.
> >
> > Actually, as Mark Mossberg pointed out to me off-thread, the counters
> > can actually be off by many times more...
>
> So, does your patch to proc.5 need tweaking, or can I just apply as is?

The "(up to 63 pages per thread)" would have to go, the rest should be correct.

But as Michal said, if someone volunteers to get rid of this
optimization, maybe we don't need the documentation after all? But
that would probably require actually doing some careful
heavily-multithreaded benchmarking on a big machine with a few dozen
cores, or something like that, so that we know whether this
optimization actually is unimportant enough that we can just get rid
of it...
