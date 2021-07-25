Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B9F6C4338F
	for <linux-man@archiver.kernel.org>; Sun, 25 Jul 2021 20:37:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5534160C51
	for <linux-man@archiver.kernel.org>; Sun, 25 Jul 2021 20:37:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229709AbhGYT4l (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sun, 25 Jul 2021 15:56:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbhGYT4l (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sun, 25 Jul 2021 15:56:41 -0400
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62F4AC061757
        for <linux-man@vger.kernel.org>; Sun, 25 Jul 2021 13:37:10 -0700 (PDT)
Received: by mail-oo1-xc2d.google.com with SMTP id s21-20020a4ae5550000b02902667598672bso1774199oot.12
        for <linux-man@vger.kernel.org>; Sun, 25 Jul 2021 13:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc:content-transfer-encoding;
        bh=e3LfmWh0yfXzQoXWCLlYib6h1ttE4TH7CIXSlTFtiSM=;
        b=S2svixAArGdBhdDGoM1XV9CboiLUgBpEzwpzwPe3awMpUazko4u373W+ATFGTU19Gz
         ovoMJdGDiLsVoQHQaSi7TGwZhqpLTe7hA/vaN6PGxxlB2/lpl4mX/eo2rifNRSpQxStg
         g+zWKQjrw2eKVQulVDtPNPeN51GqjEBGiPGcLY78I0KwzW3GYxq9PF1P/C1UbXZrA24f
         mF+HcArIsLGM176EGbuqt6oaIKccByP1+d4rh3OXqCZBE4ylbdmuDhVBSOqWhcnRWASj
         Ew2AsdfvrIMib+iy04DR8KEhHJof3/SFMNakp5rt38uJDWNmoDxXPjvh7Ia3dSWqa/Q7
         d6TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc:content-transfer-encoding;
        bh=e3LfmWh0yfXzQoXWCLlYib6h1ttE4TH7CIXSlTFtiSM=;
        b=sjKe9cJPsCmvpUuVG1MGk/J2H1+g40VeJ2Q0ko99WWrg+V4LMC1QuF1N8puhnshNsP
         oV1mTQWc2a4WKoOiHZV3YH4kGKenlFkgNss8pdJVZ9SuIrLW2ourftPcMLDJ5DmGJeHA
         a0+XeZ/JWXBHjMIU78oVlXXThKhBJ87CsTrO8oPr2jxiDcIWRU6N0PS4lh6JVP4dMO49
         JFqVQy736VekZiwWknbzfZL+iw777kGbdRyuzRzWc4k3k+GkDFWrAUHSs5JhF5/VHo8l
         6+sTyqMvtiLyOcgnBAU2FTelij7IbdHfW/wbP6b7UC0n7PEVvYRnfNvAXXxG8Xrs9ICH
         eUzg==
X-Gm-Message-State: AOAM532CsWvJbYPUw4FehV2VLcIuXLp0A8i+wrrM28ig1b9ZQvp4T5vp
        BLUyC6iHwgqH5BKPe9YKGsWh5Kj5uRJ8iRAUV3Q=
X-Google-Smtp-Source: ABdhPJyPSn8qrqQgmRIWe/2qNp3YpUHGCHDeXakF9B4+OcYSGYr6Q62LjHhWu41sBDUq/UV3z4zBzkkmrni4kIXpG2c=
X-Received: by 2002:a4a:9783:: with SMTP id w3mr8465038ooi.80.1627245429815;
 Sun, 25 Jul 2021 13:37:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210725171058.GA17019@Debian-50-lenny-64-minimal>
In-Reply-To: <20210725171058.GA17019@Debian-50-lenny-64-minimal>
Reply-To: mtk.manpages@gmail.com
From:   "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Date:   Sun, 25 Jul 2021 22:36:58 +0200
Message-ID: <CAKgNAkiERX-ADKgdGG1pWSx2twPDDN3Kdb6+JGOb=BL8ucqnAg@mail.gmail.com>
Subject: Re: Errors in man pages, here: uri.7
To:     Helge Kreutzmann <debian@helgefjell.de>
Cc:     linux-man <linux-man@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

> Man page: uri.7.po
> Issue: uppercase and lowercase English letters =E2=86=92 uppercase and lo=
wercase Latin letters
>
> "Unreserved characters may be included in a URI.  Unreserved characters "
> "include uppercase and lowercase English letters, decimal digits, and the=
 "
> "following limited set of punctuation marks and symbols:"

Thanks, Helge. Fixed as you suggest.

Cheers,

Michael

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
