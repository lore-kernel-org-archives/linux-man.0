Return-Path: <linux-man-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A1E0C38142
	for <linux-man@archiver.kernel.org>; Wed,  1 Feb 2023 19:39:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231482AbjBATjt (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Wed, 1 Feb 2023 14:39:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbjBATjt (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Wed, 1 Feb 2023 14:39:49 -0500
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85FB526856
        for <linux-man@vger.kernel.org>; Wed,  1 Feb 2023 11:39:47 -0800 (PST)
Received: by mail-qk1-x733.google.com with SMTP id d18so4462597qko.12
        for <linux-man@vger.kernel.org>; Wed, 01 Feb 2023 11:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X7W8bIOnHRgQe8HTzSrivLI89JLA+bi7mphq0XyLcq4=;
        b=O9Z4rR64zuKjH2xJWmzoxGJPgVaJBnV6t+l7LXM8hsqgJvoj2VEE3/QSeET8rY8sNH
         r6V1IA/IwJ/F6Fz23vWIfywMOTxiuc5k2qJ+9vO/CPx/+OOt7WtmKXaiSrQURtHDiile
         S4oY8kqiamLphLzoZ1eS82JMuyRwgB403KVG+xraGY33cfbK6rrw8CRlOqB0TMKdU1YG
         baJiioDwwKjPs4a/M7nxWkAOYqmDrrHQh4UheW69CPZQbA7W+4xbhDVxSPF9t0A8WmSd
         PlszayDmUIzRQ0f8PiMCT1VJgUtnyBns2Jn4WoNr1qrt1XmwyQEky5W7o5GOIfjGEt+Q
         efJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X7W8bIOnHRgQe8HTzSrivLI89JLA+bi7mphq0XyLcq4=;
        b=eCKjLAE/KBSyS233e9KElsUPMH39tEqxNCQOao0kU4v3thGc44ccvSXlHe2s3OLdXd
         lXQEuudY2Gmbgfjjzbw/Wd/6qRBsXNc22vXHjEA+tu0usM4TVYewiVnhSIa+DsiRrs5u
         YpcRZM99Tb+CaNnxZFWbWW+bBMwJ7GBgngujNw6BdvAebgSkPTxa2TnYaP+LmK9fu3Lq
         eFPzt6KIa7Mf+DczNWJHZj5FW+tJCgt7LaSz7NC4LeZynkNGpAZ6l5aQ3Vd3q/RuFNX+
         PS8i374keiMD06zR8Hv46I+UiYvEARLyJlpUz2LmRe1j3aTNxddq27n6jkUYxi/lWh7E
         QCbg==
X-Gm-Message-State: AO0yUKVXKwquaIXiVzwaIsR9zm3Nryzsavr9rGUu94nczXcD7++0V/jG
        n+qa+kJOTEvLiNCMAbAWU2lpyAya2l+e2Icf2zMmwA==
X-Google-Smtp-Source: AK7set9g4kqMSijPrRiVN0zfNxTMxxFM9+s6sDs0JmA2GFgGgmLh0JA+gdvpGmAoRsNcGU1dlM3JlXA3JKrnScJ0AUM=
X-Received: by 2002:a37:6302:0:b0:706:50f5:8c6d with SMTP id
 x2-20020a376302000000b0070650f58c6dmr321579qkb.20.1675280386413; Wed, 01 Feb
 2023 11:39:46 -0800 (PST)
MIME-Version: 1.0
References: <CAJgzZoqTHGh-VLMSN7H6t9K95TddyCRm2L6f-mnYv6dSquc3nQ@mail.gmail.com>
 <b1496bcd-4cf5-ba8c-8e83-c262f4af178e@gmail.com> <CAJgzZooXi8G=Ega2VN26KGBC7pKknRAW6E1tWXYr81_Dx2BZgA@mail.gmail.com>
 <9b541acf-4522-a74e-d3b7-bcdea6c8aded@gmail.com>
In-Reply-To: <9b541acf-4522-a74e-d3b7-bcdea6c8aded@gmail.com>
From:   enh <enh@google.com>
Date:   Wed, 1 Feb 2023 11:39:35 -0800
Message-ID: <CAJgzZoq4DXJXuNPp79XN0=bQ7iEcGkG+viEo9qKh337rsnOS9g@mail.gmail.com>
Subject: Re: [PATCH] vdso.7: fix risc-v symbol names.
To:     Alejandro Colomar <alx.manpages@gmail.com>
Cc:     linux-man <linux-man@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

On Tue, Jan 31, 2023 at 3:59 PM Alejandro Colomar
<alx.manpages@gmail.com> wrote:
>
> Hi Elliott,
>
> On 1/31/23 18:39, enh wrote:
> > On Tue, Jan 31, 2023 at 4:52 AM Alejandro Colomar
> > <alx.manpages@gmail.com> wrote:
> >>
> >> Hi!
> >>
> >> On 1/31/23 00:02, enh wrote:
> >>> The kernel git history says the names have always been "__vdso_" rather
> >>> than "__kernel_", so I assume this was a copy & paste mistake from a
> >>> different architecture.
> >>>
> >>> Luckily, the path to the kernel source that lets you confirm/deny this
> >>> _is_ correct :-)
> >>
> >> Could you please sign the patch?
> >
> > done.
>
> Patch applied.  Thanks!
>
> > (i did read that part of the docs, but assumed this counted as a
> > "trivial" patch :-) )
>
> :-)
>
> >
> >>
> >> Also, it seems something is broken in the patch; maybe the mailer broke it?  I
> >> can't seem to apply it.  Please check.
> >
> > ugh, yeah, gmail and tabs really don't get on, and this file is full
> > of tabs. trying again as an attachment...
>
> Heh :)  Any hopes that you can suggest google brings back full plain text
> support? :P

i think that was one of the first bugs i filed at google :-(

i remember when we could `| mail` from our desktops and it would just
work! that was a very long time ago...

> Cheers,
>
> Alex
>
> --
> <http://www.alejandro-colomar.es/>
