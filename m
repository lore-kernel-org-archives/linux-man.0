Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD512C2BBCA
	for <linux-man@archiver.kernel.org>; Wed, 16 Dec 2020 07:36:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 849EA23343
	for <linux-man@archiver.kernel.org>; Wed, 16 Dec 2020 07:36:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726052AbgLPHf6 (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Wed, 16 Dec 2020 02:35:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49346 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725274AbgLPHf6 (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Wed, 16 Dec 2020 02:35:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1608104071;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=AgztrWxeV3ajWCxvWu+SXUHQOwquQPhM2XHp4gJTgkc=;
        b=UZIp/a1+292U9/dAxesjsFDek1wWIzgZ6gzLbKDPYde2TYzBYcWTeDNECojihEZ3BO6IB9
        fUk9V6ukU2K+kAZduroUVb5y2TLhREylQaP3O2WTA16ztBIrY1eyuUCQyOmBem7qwizxHc
        B8ObchKbzyObjWpOTtVWcZQ6mz5XsYw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-a5xbUi4wMoKQcR4WYCah4A-1; Wed, 16 Dec 2020 02:34:26 -0500
X-MC-Unique: a5xbUi4wMoKQcR4WYCah4A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48B4F107ACF7;
        Wed, 16 Dec 2020 07:34:24 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.40.192.98])
        by smtp.corp.redhat.com (Postfix) with SMTP id BCFD560C15;
        Wed, 16 Dec 2020 07:34:17 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
        oleg@redhat.com; Wed, 16 Dec 2020 08:34:24 +0100 (CET)
Date:   Wed, 16 Dec 2020 08:34:16 +0100
From:   Oleg Nesterov <oleg@redhat.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     "Alejandro Colomar (man-pages)" <alx.manpages@gmail.com>,
        Ted Estes <ted@softwarecrafters.com>,
        Pavel Emelyanov <xemul@openvz.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Michael Kerrisk <mtk.manpages@gmail.com>,
        Kees Cook <keescook@chromium.org>, Jann Horn <jann@thejh.net>,
        linux-man <linux-man@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Markus Gutschke <markus@google.com>,
        Roland McGrath <roland@redhat.com>,
        Andreas Hobein <ah2@delair.de>
Subject: Re: [Bug 210655] ptrace.2: documentation is incorrect about access
 checking threads in same thread group
Message-ID: <20201216073415.GA19511@redhat.com>
References: <feef4f9a-4ed8-8a2e-d330-88e7f516faae@gmail.com>
 <b416e106-c11d-1471-de3d-fb9d5b1b6747@softwarecrafters.com>
 <223477a0-0b92-3a01-46bb-c06f7d5d5901@gmail.com>
 <0df0ac9e-e881-88c7-cea9-5154077c95a9@gmail.com>
 <CAHk-=whppaJf=UoODaUP=tBjc9FjwSOX3hLBhZRgaGQKSKVW4A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whppaJf=UoODaUP=tBjc9FjwSOX3hLBhZRgaGQKSKVW4A@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

On 12/15, Linus Torvalds wrote:
>
> On Tue, Dec 15, 2020 at 2:48 PM Alejandro Colomar (man-pages)
> <alx.manpages@gmail.com> wrote:
> >
> > 1) Remove that paragraph, as if that behavior had never existed.
> 
> If it's been 15 years since that paragraph was relevant, I think just
> removing it is the right thing to do.

Agreed.

Oleg.

