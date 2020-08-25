Return-Path: <SRS0=F5uD=CD=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C57FC433E1
	for <linux-man@archiver.kernel.org>; Tue, 25 Aug 2020 11:54:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4BEE32075B
	for <linux-man@archiver.kernel.org>; Tue, 25 Aug 2020 11:54:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V4SQrofs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729885AbgHYLyp (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Tue, 25 Aug 2020 07:54:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728836AbgHYLyo (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Tue, 25 Aug 2020 07:54:44 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BFF3C061574
        for <linux-man@vger.kernel.org>; Tue, 25 Aug 2020 04:54:44 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id t7so10130022otp.0
        for <linux-man@vger.kernel.org>; Tue, 25 Aug 2020 04:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=JSNTlpsq+EBwr4VSGj6/A+zyq03BigtzAIeto3YVcsw=;
        b=V4SQrofsrhi3HICsxja9YWLVAB6d2ubWVpBf2gvUQkQGFTNclDW1NJYmfdBTCM+D9i
         JX9QOhUkKjxEaN0aWmPOEkLMAexPsp5h1wYn8SZDK5VxZV2kVq/4PcT7lMMRcbQWCOKK
         Si0ED4iKItn1KAkZ3S+gCqBJvKBf+fWe5AxAI8QsDriOG+w/q4gFVfCvfHhYg4yL2aeY
         Tdpb1xJActpJs0BVTJml4XNCQ0ISMubYQKDN7uRCleXCwzf1U2QaYkKoDR8fgxMOCf0b
         OJqIy+eaQ8hvGekPbX4ZrH5m9d/k4GHRegI8AgMARGWAYx5YgObOLv5P+oZvAUMXwydz
         8nYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=JSNTlpsq+EBwr4VSGj6/A+zyq03BigtzAIeto3YVcsw=;
        b=bzgqqnQTG9QVehfy2qdVF61VuqJ1cTeOpsZm+difjfN0fhtefSBWeVsCAYi1wgKvnx
         pHP39x1FN2uLyVwVyDwIpLdcwCJ1XjaA/TUoHocCywA4F0QaB3ZOHPTNsmBW030S7vUy
         /5V88IIUpFkRsWM7/77Oy2ixQ8Fxfsi3+/l78c3h6Pd7COoTUTL9pdpAsOlLuxa4qRHP
         gaOq28bf6eiyccb3aM03tBmtaKYJB0f+je7vrueb7Pe3mCIkiXMpLjt4iXLKKFagf5Ee
         nNCEPjBWAIK+p3hNxNanAfht8btn1flnSEDjowcSWD+XwvSbWmkL0Fv/k8jbRGJQFR8q
         YG1w==
X-Gm-Message-State: AOAM532draIqCDsTYJLrVIzSW2F6I54PQg+WMcs7J229BFaIkONNaTzC
        TmggvhNIo5sKr6Z9ebXwKyIzO9WhAsNai5pfoZo=
X-Google-Smtp-Source: ABdhPJzXDRsCYrbgFn8HH4QFWZ44Nl/BBXHG43iBEbiDN/gJaaK92xXTuJRQqibqVYlK47SAwEL8c1VtkjDp1g7CWrM=
X-Received: by 2002:a05:6830:148f:: with SMTP id s15mr6934104otq.323.1598356483863;
 Tue, 25 Aug 2020 04:54:43 -0700 (PDT)
MIME-Version: 1.0
References: <6cf23265-7ed5-4a33-accf-5c0e8f67f85f@gmail.com> <20200825111336.lk5va5qjdv5n5scc@jwilk.net>
In-Reply-To: <20200825111336.lk5va5qjdv5n5scc@jwilk.net>
Reply-To: mtk.manpages@gmail.com
From:   "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Date:   Tue, 25 Aug 2020 13:54:32 +0200
Message-ID: <CAKgNAkjFD-aeQE8E0ZscBQrx2_QoLynJkeX-tNaRgBQjFsX4tw@mail.gmail.com>
Subject: Re: [bug] Makefile: Broken link
To:     Jakub Wilk <jwilk@jwilk.net>
Cc:     linux-man <linux-man@vger.kernel.org>,
        Alejandro Colomar <colomar.6.4.3@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Alex, thanks for the bug report.

Jakub, thanks (again!) for jumping in.

On Tue, 25 Aug 2020 at 13:13, Jakub Wilk <jwilk@jwilk.net> wrote:
>
> * Alejandro Colomar <colomar.6.4.3@gmail.com>, 2020-08-25, 12:51:
> >Line 32 on the Makefile has a broken link in a comment:
> >
> >https://lintian.debian.org/tags/manpage-has-errors-from-man.html
>
> This Lintian tag was renamed recently:
> https://salsa.debian.org/lintian/lintian/commit/844278682aafa1da
>
> The current URL is:
> https://lintian.debian.org/tags/groff-message.html

I've updated the URL.

Thanks,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
