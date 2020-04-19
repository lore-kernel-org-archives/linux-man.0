Return-Path: <SRS0=LENQ=6D=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C919DC38A30
	for <linux-man@archiver.kernel.org>; Sun, 19 Apr 2020 20:48:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 979BD21473
	for <linux-man@archiver.kernel.org>; Sun, 19 Apr 2020 20:48:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l9tcl2Ej"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725932AbgDSUs7 (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sun, 19 Apr 2020 16:48:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725848AbgDSUs7 (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sun, 19 Apr 2020 16:48:59 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4152C061A0C
        for <linux-man@vger.kernel.org>; Sun, 19 Apr 2020 13:48:58 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id n17so6191767ejh.7
        for <linux-man@vger.kernel.org>; Sun, 19 Apr 2020 13:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=N2anX6Pi/LV+7O0UHcvXJOJMoYFSz9HqJ0pzLlo2bTU=;
        b=l9tcl2Ej6mRrlOIJuDci4rbAlkjZTOpZnEKOkApGhomlcBUgQLyl+9E2h+taWjkRG3
         w7FuKs+NCLrvM0JcUOl0mObio0Fw7t4iSXkOVZqqO4ZbGS4eNyk1IkzA5t8aFjPTXQRy
         SP1alnRP2Z9vQg86w3tO/X5yVFNPHPjDefQ+UZmmbFRlGqrwyb4Sil2DPFA9KbE+Ek0S
         NMoecAnvBvbomCVqoXrSfO+FWlxaYSLQ2r34rejDXcuM558eXrx16FuZS+gvsbzlBGZV
         9uMGtNC/opG+urfNGFlA95tIIu4Wk8fUIngePs5Kz8znig+UyTllmzRfUHyhLDQFyVHx
         hIQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=N2anX6Pi/LV+7O0UHcvXJOJMoYFSz9HqJ0pzLlo2bTU=;
        b=a6yXctH0dxRmWeroHFrYlAPyE6q/yoA5MFZQ9YBAOo8CGhZ33Zi6Soe0exR2ouudwu
         yFpG3h/92SNS6bgNzdDkj/DgXKsg4yEC+9PZ/gyh9UuhreziBjpn8rkTRAvfYRGN6U/4
         NCefElsE9CDvWpjfksLzX6S4UpbGj3jbtaRPpbtzJjDqv46ahMkQ81lnGakbIJBaUNKA
         ZcEWOwmChLCPvaIz86RzxjoDbZpS6bTmPtF46fppFCuoTUPYr7eRoFICT/bbNt128ayz
         WpAt+x7ZrQ2uscNePk2yNXfNEUsfOPvpryaMxRWtPFIWZKaCI+2Qx4EddSEWlwoQgQZo
         NnsA==
X-Gm-Message-State: AGi0PuZMVWgIQnRXG6PQ9E+fwQuKrvpd5AZ+t7oEJoFhUIuUaYWkuZBN
        ybFUGxaOiK3Cf7L9aCzCpPFoaMCXXoBYPggxVYulcA==
X-Google-Smtp-Source: APiQypLmdJ7MD19/X7DzFIXsXEOtavlnJs4jNIFfkjS4igeCSiQhdeYZMjW4JCatapUVIUyGxExJ/JQ2wMKcVcK66mU=
X-Received: by 2002:a17:906:1fd6:: with SMTP id e22mr13328421ejt.150.1587329337452;
 Sun, 19 Apr 2020 13:48:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200419064811.GA31233@Debian-50-lenny-64-minimal>
In-Reply-To: <20200419064811.GA31233@Debian-50-lenny-64-minimal>
Reply-To: mtk.manpages@gmail.com
From:   "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Date:   Sun, 19 Apr 2020 22:48:46 +0200
Message-ID: <CAKgNAkh=65cH6S2xigJF6hjEMu+90=Co+GDV8OSzHU0C2XVYPQ@mail.gmail.com>
Subject: Re: Errors in man pages, here: msr(4): Content
To:     Helge Kreutzmann <debian@helgefjell.de>
Cc:     linux-man <linux-man@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

> /dev/cpu not on my system

Maybe this is a Debian thing? I have /dev/cpu on my Fedora system.

Thanks,

Michael

> "I</dev/cpu/CPUNUM/msr> provides an interface to read and write the model-"
> "specific registers (MSRs) of an x86 CPU.  I<CPUNUM> is the number of the CPU "
> "to access as listed in I</proc/cpuinfo>."
>
> --
>       Dr. Helge Kreutzmann                     debian@helgefjell.de
>            Dipl.-Phys.                   http://www.helgefjell.de/debian.php
>         64bit GNU powered                     gpg signed mail preferred
>            Help keep free software libre: http://www.ffii.de/



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
