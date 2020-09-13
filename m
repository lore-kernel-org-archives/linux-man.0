Return-Path: <SRS0=Zlmw=CW=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44DADC433E2
	for <linux-man@archiver.kernel.org>; Sun, 13 Sep 2020 19:32:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 021BD208C7
	for <linux-man@archiver.kernel.org>; Sun, 13 Sep 2020 19:32:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ozbUBCaj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725943AbgIMTcX (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sun, 13 Sep 2020 15:32:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725966AbgIMTcR (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sun, 13 Sep 2020 15:32:17 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43ACEC06174A
        for <linux-man@vger.kernel.org>; Sun, 13 Sep 2020 12:32:17 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id t76so15488429oif.7
        for <linux-man@vger.kernel.org>; Sun, 13 Sep 2020 12:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wZsOmR16VAE04H7T88YvUjADxLu6sevmq/aT5mF/1KQ=;
        b=ozbUBCajC6vzwmw54yg04TLIjfr7Iv3ZkLySC6iLwpV8mq1Eyx0rWHjLQeZ2Dw2YgU
         6AH3kgRhorHKLUb9bZwTnEZ05UGpitUKWdTYibCy5SNv5OlunQCUSaBHggvfPwx1co+P
         lcERg8b3hryYy9ku1Zf4dklt9p6iluW29rR84X/cHdO3KtNwUzJOp5Bwgfh0h3Zglt2O
         CCVsg/zqtZn4SDRWCdsanyo69yJ/lsf7iASRStlPG2NS3lGmrDDU45Y4STvOkieiucBN
         /gaoCxGSMGtARCPnq3kt2JgoRdg0YJ87k4Yb2JKY0VGpXvyYlUmSALrPxMqiNv9w/41D
         04hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wZsOmR16VAE04H7T88YvUjADxLu6sevmq/aT5mF/1KQ=;
        b=h2++s+yB4r0ZHbuucCu/0/g6I83yLoMe1NTGPA8ol8AMJwC/HnlXFZ83Xb4EunfWcD
         sq3DKYr0WxwFhXQSpFNCkKHOKVxIFk9aDcs+iGbxxV0K4v4aNPeB3/EWAuIYvMUHu/er
         v+ic/DsciFxfVhOJ1DyG5LsW+eDKYSAQaNUeklDHs/NfBOBkhi1BKVvbS+Qv1gpln/BQ
         awCyKQaAMl37+FtyieLnPSoSOPjiCC9laYbptMCZYtV2tEtZDEGcptvy8A4rirmChytd
         HTE+kjYO7WrM2zuksX2Ky7VXPdwIFGZCxF3z+5WycPuvSH0ZPsSspcvqMT5hS0stwQ4T
         e4kA==
X-Gm-Message-State: AOAM533URz/PoKq6x2znKQeLlSSVu26bRj/JCu7MtGlUH3Xz6PJbPvPE
        vGwXuEPhjRXL1XVdGQqPozYtFkX+257lUiUtCCbufj9iNdg=
X-Google-Smtp-Source: ABdhPJyDjKzvjiGRiCCgM6dD5q6K0RyA/BSfetPwo7SBy+8Dvgb4XZV8OjsMfWQMEI5qd4K5UvBOUMz7MeJ7ltxv4I0=
X-Received: by 2002:a05:6808:8ca:: with SMTP id k10mr6125252oij.84.1600025536705;
 Sun, 13 Sep 2020 12:32:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200913182949.29815-1-kbukin@gmail.com> <68e2c613-3ccf-a62d-f2ae-3e33e9450a3a@gmail.com>
In-Reply-To: <68e2c613-3ccf-a62d-f2ae-3e33e9450a3a@gmail.com>
From:   Konstantin Bukin <kbukin@gmail.com>
Date:   Sun, 13 Sep 2020 12:32:05 -0700
Message-ID: <CAF98MAJoPx1YOyV6DQhFSj1S++1jffgUdae4989FqicpBYkuug@mail.gmail.com>
Subject: Re: [PATCH] stat.2: fixed inode printing in example program
To:     Alejandro Colomar <colomar.6.4.3@gmail.com>
Cc:     linux-man@vger.kernel.org, mtk.manpages@gmail.com,
        "Dmitry V. Levin" <ldv@altlinux.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Fair enough, cast is needed. I replied in the main thread with a fixed patc=
h.

Thank you,
Konstantin.

On Sun, Sep 13, 2020 at 11:43 AM Alejandro Colomar
<colomar.6.4.3@gmail.com> wrote:
>
> > Such erroneous reporting happens for inode values greater than maximum
> > value which can be stored in signed long. Casting does not seem to be
> > necessary here. Printing inode as unsigned long long fixes the issue.
>
> The cast is necessary.
>
> Relevant standard: C18 =C2=A76.5.2.2 6
>
> Details: 'ino_t' may (and will likely) be defined as 'unsigned long'.
> If you try to print an 'unsigned long' with "%llu" you will:
> - have Undefined Behavior (and a warning) if 'sizeof(long) < sizeof(long
> long)'.
> - have a warning if 'sizeof(long) =3D=3D sizeof(long long)'.
>
> So if you want to use 'unsigned long long', you'll need to cast.
>
> Cheers,
>
> Alex
