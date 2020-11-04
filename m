Return-Path: <SRS0=MEtt=EK=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67CEAC2D0A3
	for <linux-man@archiver.kernel.org>; Wed,  4 Nov 2020 16:42:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 08E15206DB
	for <linux-man@archiver.kernel.org>; Wed,  4 Nov 2020 16:42:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HrjbsMBG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731196AbgKDQml (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Wed, 4 Nov 2020 11:42:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731189AbgKDQml (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Wed, 4 Nov 2020 11:42:41 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DABB4C0613D3
        for <linux-man@vger.kernel.org>; Wed,  4 Nov 2020 08:42:40 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id l10so2680336lji.4
        for <linux-man@vger.kernel.org>; Wed, 04 Nov 2020 08:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KI2EVxXmhKig6AR+BJoyCebe5SydFFdN3VoQv+qRTB0=;
        b=HrjbsMBGx+1UI83TelvtO0rvWeOO5rJr/ZsVTqBcDpj1wPLGagpqBAuCgsjeMQDWxJ
         h3O6geV7SjfJzYZrCikctUyXR2XXXmujDcQtpTzn0q6ioQqHR7uu217Qr7CTo/gByUl6
         BgAA57WO2vD5m0vWwwRQ+ZdMbvADL+X3f4xOZWoxRsHXhsyB0Zl0F3xLGVXvFfi01jLQ
         MyOa7EvmG2XX7ctZ4mbM/VBZyR4hmys7hezQapAqneDiTzjsn5UnpkT6ZFs/TbPeY6Ld
         gA+nOlLb4AQRCakkA9n1YH5SnvwOXp+a7lunTdkqw4y990zBrkUK1NyOBgSmGOFEi9tG
         axCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KI2EVxXmhKig6AR+BJoyCebe5SydFFdN3VoQv+qRTB0=;
        b=Hw/vWx3ixeUt8zj33r9V0gJIb0d9zzqLSa6V6MUK9P1s37uj80gV7Lg13SCRhGFG3h
         d6aiaJGU5uLzDsB/lwl49IeXteTFL4E24ZAUtnKMZAaIRVz6KKufnc9qK05W2ydwOUjF
         suxtauBpr4ilZK2fWxKHfpOp0NSeOGwb57t5L8yid34P37lFpISb6x8OWUWx00JgAlJg
         IguEwMApzKpUKnb8W26LT/b6Ynr6ltOTHn7WYNAZ5Vd+oPHhHS65WNW/qQeRo+f8Pc0N
         Ed87VUHjIE5UUJ12ptH8GyxmN0v/s3HTFZ637uv80BFptcJYjVfSuDShzHEhPvehu7wr
         +Vvg==
X-Gm-Message-State: AOAM532ioTHkk3INKrbXskra8vxJyioK0PkFHC/X6QdJrCprixO7KxzL
        Ti62oy7OeV1KGhXDHk0M1WkLj0jNCpu2nZk4HXHTYA==
X-Google-Smtp-Source: ABdhPJxCrj22sr28us0p4uTjqQBErgPvznTaOtSJFSBHaG9S5gGYWPJ/XTqnGnRag/dz0xkJJBUnnNPOXgVlQzNDh5k=
X-Received: by 2002:a2e:8e35:: with SMTP id r21mr8485139ljk.389.1604508159110;
 Wed, 04 Nov 2020 08:42:39 -0800 (PST)
MIME-Version: 1.0
References: <CAPNVh5e_u0JcF7dE0sOs6DZrnw1zAw1f9VzCu4B+gO2fOF7AMA@mail.gmail.com>
 <20201104162943.4823-1-colomar.6.4.3@gmail.com>
In-Reply-To: <20201104162943.4823-1-colomar.6.4.3@gmail.com>
From:   Peter Oskolkov <posk@google.com>
Date:   Wed, 4 Nov 2020 08:42:27 -0800
Message-ID: <CAPNVh5d4d1tTSL0aY6yf=deQjfAgdBW1oE4itcpdMOtv+VzojQ@mail.gmail.com>
Subject: Re: [PATCH v3] membarrier.2: Update membarrier manual page for 5.10
To:     Alejandro Colomar <colomar.6.4.3@gmail.com>
Cc:     Michael Kerrisk <mtk.manpages@gmail.com>,
        linux-man <linux-man@vger.kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        Paul Turner <pjt@google.com>,
        Chris Kennelly <ckennelly@google.com>,
        Peter Oskolkov <posk@posk.io>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

On Wed, Nov 4, 2020 at 8:30 AM Alejandro Colomar
<colomar.6.4.3@gmail.com> wrote:
>
[...]
>
> Hi Peter,
>
> I added those changes to the patch,
> and added a signed-off-by on your behalf.
> I think it's ready right now.
[...]

Hi Alex,

Thanks a lot for your help! This looks good to me.

Thanks,
Peter
