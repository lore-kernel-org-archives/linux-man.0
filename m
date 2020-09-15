Return-Path: <SRS0=kogJ=CY=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=3.0 tests=BAYES_50,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C2E0C43461
	for <linux-man@archiver.kernel.org>; Tue, 15 Sep 2020 09:03:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B60862076C
	for <linux-man@archiver.kernel.org>; Tue, 15 Sep 2020 09:03:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bloggeroutreachagency.com header.i=@bloggeroutreachagency.com header.b="TWsFpvZI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726208AbgIOJDh (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Tue, 15 Sep 2020 05:03:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726102AbgIOJDg (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Tue, 15 Sep 2020 05:03:36 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CACA7C06174A
        for <linux-man@vger.kernel.org>; Tue, 15 Sep 2020 02:03:35 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id l15so7608651wmh.1
        for <linux-man@vger.kernel.org>; Tue, 15 Sep 2020 02:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bloggeroutreachagency.com; s=google;
        h=mime-version:from:reply-to:to:subject:content-transfer-encoding
         :date:message-id;
        bh=FsQLSqbxO2hcJKgtSJSicQP9qAJejvvjRZLoT/wDhdM=;
        b=TWsFpvZIpeQVQU3QFpdYaT9eTbvak6CTcTGMEebMQSc0wwIfo2Du5KP16LWkluiZwi
         YE59rrN+s+Q+EIYHx2iwt3OmIX0Y9Hrn2Vr2VjQ+GCXscUD8mttO8ss9dXpq+4YeJQPo
         sD3nlhWk7dr7k9eg8JdE5LgXtgP68GQJElJoIykh6B4OizwoweIB9WMAjDVJhx//iKGN
         O/Z9W3R8y/SkcTtOwhjf6S4tFgtVqz2FRgUyG+pgU8Vqd6JGEumh8Air+1vx0uxZtBML
         Kq3dACgucuYVM93RXtReW4NstuaN+tYOtybtBtXRExysH8/9qov+T9I9oBifazFq3rw1
         TgpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:reply-to:to:subject
         :content-transfer-encoding:date:message-id;
        bh=FsQLSqbxO2hcJKgtSJSicQP9qAJejvvjRZLoT/wDhdM=;
        b=Iq4nbrdXvE92DcP5PPs+jEefv5GyJQuPsSxOlMN5wefLVeso3GT5CMkmIEFCxtMYN8
         gqXbl4KnAq3QRDWyAfdgnxOAXSe0j3v+GB17qdxBPEmXl97UpcK9n7KCKBN9xOkFXVR/
         ZNQLuCXvUJeIeqJ50KM/7KP7f2ExvB252NvpPFqM9LkqcC/k+fglTZqxrpnlbvt/Vxui
         mxqLJ+k+6pAdR7DLhY5M2Q7XiI3zDuHo62WqMhsSm2Vsn2KiyAk/t0Qt2RQEt6xMidju
         cW9rp+WM2ayD9620+LskctSbfE09GB0t+2sZ7C8Nj1QpZlnb34XY71ghpXRG9evPIlH7
         i7dw==
X-Gm-Message-State: AOAM532rwOChKKHaTbdcVEZl5DcqP/hUwWohKDMQG7h8Xfx+qoxJvYEM
        GjsDPNWhicq7AFJIUyr7+My4qCHqyu578Q==
X-Google-Smtp-Source: ABdhPJxdJjaLkNgvB/rGJVGOJfeRdM2Iq3oABh1OEcSGGbA/EpMS3fYJqnAfPacHdyjO2XDHNJa2/A==
X-Received: by 2002:a1c:9e0e:: with SMTP id h14mr3552835wme.18.1600160613829;
        Tue, 15 Sep 2020 02:03:33 -0700 (PDT)
Received: from 72.255.36.144 ([72.255.36.144])
        by smtp.gmail.com with ESMTPSA id b2sm23001286wmh.47.2020.09.15.02.03.32
        for <linux-man@vger.kernel.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 15 Sep 2020 02:03:33 -0700 (PDT)
MIME-Version: 1.0
From:   "jorge costilla" <jorge@bloggeroutreachagency.com>
Reply-To: jorge@bloggeroutreachagency.com
To:     linux-man@vger.kernel.org
Subject: Paid Post
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-Mailer: Smart_Send_3_1_6
Date:   Tue, 15 Sep 2020 14:03:30 +0500
Message-ID: <104521351939762200222291@DESKTOP-FB7ULH6>
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Hi!

Hope you are having a great day! I have come across your site, and I strong=
ly feel that your website is a perfect match for us.
We are a content marketing agency, and we=92d be thrilled if you=92d allow =
us to post relevant and non-promotional content on your website. You can he=
lp us by placing an article with a do-follow link on your site.
Let us know how much you charge for a do-follow link. We make payments thro=
ugh PayPal. We look forward to having a long-term relationship with you.

We=92ll be happy to hear from you soon.



Kind Regards
