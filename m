Return-Path: <SRS0=CitK=EB=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 571FFC2D0A3
	for <linux-man@archiver.kernel.org>; Mon, 26 Oct 2020 07:01:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F414B2087C
	for <linux-man@archiver.kernel.org>; Mon, 26 Oct 2020 07:01:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mEliIwil"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1736775AbgJZHB4 (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 26 Oct 2020 03:01:56 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:35385 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1736774AbgJZHB4 (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Mon, 26 Oct 2020 03:01:56 -0400
Received: by mail-oi1-f196.google.com with SMTP id w191so9569924oif.2
        for <linux-man@vger.kernel.org>; Mon, 26 Oct 2020 00:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=zUJdfXOVZyub4Q0/iCXshqW67joTR+a5K0ak8gI5+vw=;
        b=mEliIwilByOOwrTW//IakV2/FkWS/xLuJzUIGBoK4Uewv2AaoSQd4Q6fv1v6pG33Xb
         QnIVzEDCP5DCiSViy/qcdBqomXPQoAsJ6b0vHQxtlOJFyhiKLvYw3/AgeVJuFjCSeEjK
         oVhrzjU82RKWrhhhByCHoORly3JvX0f3bxRs4wCNf7aPgbJNMRp3k9Rmlt36rw3sEg/K
         VcbiM81fsdTUFqfZoTUroHeNWYD/FRlhMTVPeuRrWUYjanA65B2IohYrTqaKtuOKXEpc
         BJnqx2a9tMjKyxGwhVUzVW+Wbc+sQt3X6F3zokzGcQsEfp8Q1+LAbHR/YBP2q6aOLwUi
         iY0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=zUJdfXOVZyub4Q0/iCXshqW67joTR+a5K0ak8gI5+vw=;
        b=P5OrSN4xoASj+ZkQCh3MMv2Xr+8+ZsIrqSxHJe/a8jWGERAqSxlDtsm+wrVGYB+3X7
         x3CsgAIrL/nzDbxYQNPZxxX+UZKbjmQbzXC7UavfXJcKQMhMW1YuHnxcoYA/t2VTxofb
         08Rnh9fpDJDHuOjn8P226yv6lKicJq5nFD+URjY33BnbyImlNEl0X0meFc/5RQ/v5SZb
         EtNCbUSq0OheqfSE9hxcC+22iJcX6VGjDlozGoyHoNc7Tv02qXjgmMQy77qJL4to2+q9
         dHa7/4UMBM3eOVyVbjDCkaxFJMWUm6LDjswAh/dL0yjodqwRoBEw/bponjL+GU59Wli5
         3dpg==
X-Gm-Message-State: AOAM5339+d5m16d3zsyyg3TPTQ6fMezCl5Nn25KOsfjDKoWpcTYkqedB
        D/V8jAJ8zv1K8/x0D2haHqxR56DYbUxiUqutAUY3VsNb
X-Google-Smtp-Source: ABdhPJy5U8KDqkBxzdrmRe/2xFtyvbmkWbXN/wBKgawm1yaBFPNig1X4C6wdnu1STeBeJAv7e0X44IV1pUD8y8rj1fA=
X-Received: by 2002:a05:6808:91a:: with SMTP id w26mr11770827oih.159.1603695715040;
 Mon, 26 Oct 2020 00:01:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200920214012.454410-1-colomar.6.4.3@gmail.com>
 <61f4e2a4-d468-ceba-2ccf-ce0c061aa20b@gmail.com> <f70c7f62-9d61-71aa-67cf-43501a29bccc@gmail.com>
 <CAKgNAki7=AJ7p2AwPkf9+4AkYKdOL6b4D0NyVdwZzu-qHFvGiA@mail.gmail.com>
 <20200921141552.tpuhdxo24lc6e7dh@localhost.localdomain> <35b5a9ff-4133-8301-bb75-4b13f7861c9a@gmail.com>
 <20200930120242.vylnz5khajri5sz4@localhost.localdomain> <20200930125417.ovlnfxhk5zgtuj46@localhost.localdomain>
 <CAKgNAkgOYEV0HR-Y=a-FpeW4_Qoe6WAoZ6SAEbN=Yuz_g3z5Zw@mail.gmail.com>
In-Reply-To: <CAKgNAkgOYEV0HR-Y=a-FpeW4_Qoe6WAoZ6SAEbN=Yuz_g3z5Zw@mail.gmail.com>
Reply-To: mtk.manpages@gmail.com
From:   "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Date:   Mon, 26 Oct 2020 08:00:00 +0100
Message-ID: <CAKgNAkhvWp1L=3-krBWQ7rZ_Z7J5gPqwAzVpBF-3BPGfJ4Ojbw@mail.gmail.com>
Subject: Re: man-pages.7: Simplify indentation of structure definitions, shell
 session logs, and so on
To:     "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc:     linux-man <linux-man@vger.kernel.org>,
        Michael Kerrisk <mtk.manpages@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Hi Brnaden,

A ping on the below, in case you have some thoughts.

Thanks,

Michael

On Thu, 1 Oct 2020 at 09:33, Michael Kerrisk (man-pages)
<mtk.manpages@gmail.com> wrote:
>
> Hi Branden,
>
> Sorry -- I think I'm still not getting it.
>
> On Wed, 30 Sep 2020 at 14:54, G. Branden Robinson
> <g.branden.robinson@gmail.com> wrote:
> >
> > At 2020-09-30T22:02:43+1000, G. Branden Robinson wrote:
> > > [...] you can call .RE [...] as ".RE 2" to say "go back two
> > > indentation levels"
> >
> > Nope, that's wrong.  Forget I said that; I think I might now see
> > something I can further improve in the documentation.
> >
> > You can see I'm still bedeviled by relative insets.  :-|
> >
> > I tend to never use the argument to .RE; I just call .RE multiple times
> > to balance out my .RS calls, just like parentheses.  When I do that, I
> > don't get surprised.
> >
> > > without having to track or remember any indentation measurements.
> >
> > This part remains true.  :)
>
> Currently, I use the idiom
>
> .PP
> .in +4n
> .EX
> <code>
> .EE
> .in
> .PP
>
> or, if we're in indented paragraph territory:
>
> .IP
> .in +4n
> .EX
> <code>
> .EE
> .in
> .IP
>
> This is of course hacky, and of course in order to get it right, I
> need to know where to use .IP vs .PP.
>
> I'd happily replace this with the use of ".RS 4/.EX/.EE/.RE", but
> what, if anything do I surround it with? And can I do it in a way that
> I don't need to care whether I'm currently in an indented zone of
> text?
>
> I mean, if I use:
>
> .RS
> .RS 4
> .PP
> .EX
> int
> main(void)
> {
>     printf("Hello world\n");
> }
> .EE
> .PP
> .RE
> .RE
>
> That produces the desired results (4-space indent) if I am currently
> in an indented zone (.TP or .IP). (But it starts to get even more
> horribly verbose, in terms of markup, than what I currently use.)
>
> But if I use that same form in an unindented zone, then <code> is
> massively (12 spaces) indented. Instead, seem to need to say just:
>
> .RS +4
> .PP
> .EX
> int
> main(void)
> {
>     printf("Hello world\n");
> }
> .EE
> .PP
> .RE
>
> What I'd *ideally* like is a solution for indented code blocks that
> (in order or priority):
>
> 1) is not more verbose than the current solution
> 2) uses more idiomatic mark-up than the current solution
> 3) uses exactly the same form, regardless of whether I'm currently in
> an indented region of text.
>
> So far, I don't see such a solution.
>
> Thanks,
>
> Michael
>
> --
> Michael Kerrisk
> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
> Linux/UNIX System Programming Training: http://man7.org/training/



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
