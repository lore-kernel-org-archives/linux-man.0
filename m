Return-Path: <SRS0=WDGa=6I=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9DA6C54FD0
	for <linux-man@archiver.kernel.org>; Fri, 24 Apr 2020 19:32:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C109B2075A
	for <linux-man@archiver.kernel.org>; Fri, 24 Apr 2020 19:32:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bCzbuH9N"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726793AbgDXTcV (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Fri, 24 Apr 2020 15:32:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725970AbgDXTcV (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Fri, 24 Apr 2020 15:32:21 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C36EC09B048
        for <linux-man@vger.kernel.org>; Fri, 24 Apr 2020 12:32:19 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id p16so8182165edm.10
        for <linux-man@vger.kernel.org>; Fri, 24 Apr 2020 12:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=76Dtxq9YBZ9JN3J/a2dwhYTsJu0wNCxI1tRKUrjx5Bw=;
        b=bCzbuH9NLsvIFm3wBoD+n3ZC+yaJfAruhqe3ihbSYCSFXLiqQ5+2xnFfomAt+RMvNh
         dCFaQP6PmnQNP6yFJ0GwUYlNBzD59ku/vKNvrFI8jDYsXtFHeiA5amXt2wSLC8+Tohuy
         RiVaWHLfYNEDl5O+xa42KyvJ5Nh5vT6I3iDrx33UdnUAZteXM379Lr+ORhCFkOiRMljb
         dFamSQGExDVn9lE0L5rjOyhC/5jx8ndCo07rFG6ljekWegVEjPaVtryHRtBepS9N4ULZ
         8O3Mmoir/MOhRGP0OkMcHa9xCzJoV+FsAPn0mmwcgGSJyWhZ2dq+WrFnX3m/Qr6KkiiZ
         lvpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=76Dtxq9YBZ9JN3J/a2dwhYTsJu0wNCxI1tRKUrjx5Bw=;
        b=EUV6p9T/FIhh8dhGTcCf6gLv0oB0U8Cze3FjGH4aHYeV+iVaOg5XfPMqLIu59cWcfE
         uHrUyzlAL1giOdlZfdQh51kR/lqCEokzdHWUt7fnOJcHRvTOAUQEqQ+v3Qjr7pTi/atA
         Tm2RZL2lduTuRBsVAluEPyQFxfbVuK3wWpBw4k/z02ET/gmXmWh1m6X0IMzq1vGqPi54
         hpLzcbwue7Fc2dQN6VTSwSAXN93G3fxy8s35mRMVytyT03GlIdbtX246aDO8J2cuAD1F
         Cm/8/EuPRx19GWFhfBaR2aAXxU/UMi1E4QwVdEMh6HItKT4J9nXpVa83wT8YJPW9IJvX
         sEsA==
X-Gm-Message-State: AGi0PuZg7+tdn6ayjNMCFj4r2K52UOuhrzi+FJWWVkyv9v/jl+MU3vN5
        Y2J3oL0daWFsB4xYrJwtf0gUtQv9TRh/gpEEzx4=
X-Google-Smtp-Source: APiQypIqXFYjpNpZVwoa+kFu0HqkJb/26usv1/zDmB6iWaCgp9A+gkqVCkEITW3pwO4HWuz3c4g40MKysTfN0FFudFY=
X-Received: by 2002:a05:6402:7d6:: with SMTP id u22mr8794707edy.149.1587756738277;
 Fri, 24 Apr 2020 12:32:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200419064824.GA31956@Debian-50-lenny-64-minimal>
 <b9cc503c-c302-2675-ba76-3d4b7ee6666e@gmail.com> <20200424184501.GA7401@Debian-50-lenny-64-minimal>
In-Reply-To: <20200424184501.GA7401@Debian-50-lenny-64-minimal>
Reply-To: mtk.manpages@gmail.com
From:   "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Date:   Fri, 24 Apr 2020 21:32:07 +0200
Message-ID: <CAKgNAkj4sBKOQxEjxhsEDuWZY_Bh4jDQJhLkFAsD_hCHc7yuqQ@mail.gmail.com>
Subject: Re: Errors in man pages, here: signal(7): Wording
To:     Helge Kreutzmann <debian@helgefjell.de>
Cc:     linux-man <linux-man@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

> Sorry for the noise, please close the report.

Ok.
-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
