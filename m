Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5857DC433EF
	for <linux-man@archiver.kernel.org>; Sat,  4 Sep 2021 02:29:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3447060E8B
	for <linux-man@archiver.kernel.org>; Sat,  4 Sep 2021 02:29:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231389AbhIDCaM (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Fri, 3 Sep 2021 22:30:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234937AbhIDCaL (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Fri, 3 Sep 2021 22:30:11 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCB9EC061575
        for <linux-man@vger.kernel.org>; Fri,  3 Sep 2021 19:29:10 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id i21so1656807ejd.2
        for <linux-man@vger.kernel.org>; Fri, 03 Sep 2021 19:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=MrlN2AHnvuqoewEuf77VsbHFTuDPR9jtKRN0UKq0Zjs=;
        b=e8+1yFjqHkpM/qKSl32qAdRQTfafdpmh6PxALkBFQGUB/a85UJCCpGrQKca+AvkM8p
         /7++o/iFv4Lqc+5ojNPd3AzDJRjVTq1JTyn7RcVOZFMgOR+AFbXREpabhqfUvSiL9mrk
         xdwQWE+deReWUV7x6m2BWMv6MJUilDg3GkDkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=MrlN2AHnvuqoewEuf77VsbHFTuDPR9jtKRN0UKq0Zjs=;
        b=ec6Mt04BZ40HhNr/JwEk+LGd1LPqkAoXyfHT7XIiiavgmCOR4UyPxvTpCcDnuP2ts6
         4qWJcHekGbulZaoLXeIn4BojnOFEKcTC40frmvrJbvhIzB67tQChd7BCuVTPlwZNai7P
         Kcqy0bm9lI7ykrOIJ3wDJ0Wd4fybmV2UIhPSYvMucJ3Y0wowa4qrX2YM/3h9QbVWwZVh
         HMXFlqTpoDthq3fTchNfhTvc94QNEnGCDt6Bj9ix9Thdo15MmcJVuJhpgv6UbCWyF/3p
         NemafV5b+rcHkAMjSaMj7GTYLJNXDkKdWZFbk67eGbyYJFZ2rW678jQTJfPRZEHU/kiZ
         g+eg==
X-Gm-Message-State: AOAM530UX8vVqBfL4hMRgcRj8xm+AWIl9U0oeRZmT3itqfHjr7z2tXyA
        WO9d78uf223E8quO0Z2WUJvS2W9Zh9Q2gwMDwDDlRYo+6bXx4A==
X-Google-Smtp-Source: ABdhPJxerY273HKvxeY0GVF3yPwk1xhThBh8PU/2A8wR4/Gf12eUvu/UOSO5xVGb2EYEi4tmJR8X65mGlX9ZxXjnbOc=
X-Received: by 2002:a17:906:7154:: with SMTP id z20mr1992097ejj.547.1630722549134;
 Fri, 03 Sep 2021 19:29:09 -0700 (PDT)
MIME-Version: 1.0
From:   Sagar Patel <sagarmp@cs.unc.edu>
Date:   Fri, 3 Sep 2021 22:28:58 -0400
Message-ID: <CAMGmevBaX-PAuNfN6fANjipxnMO9JmnKdjTxaRVWMM78zC3mCQ@mail.gmail.com>
Subject: Meaning of "Signed-off-by"
To:     linux-man@vger.kernel.org
Cc:     "Alejandro Colomar (man-pages)" <alx.manpages@gmail.com>,
        mtk.manpages@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Hello,

Does the man-pages project define the meaning of the "Signed-off-by"
clause in a commit message? Per git-commit(1),

> The meaning of a signoff depends on the project to which you're committin=
g.

But I couldn't find a reference to the meaning for man-pages. Is it
the same as the linux kernel [1]?

Since I couldn't find the meaning, I submitted a patch (which was
subsequently accepted) without signing off on it. Sorry about that.

[1]: https://github.com/torvalds/linux/blob/master/Documentation/process/su=
bmitting-patches.rst#sign-your-work---the-developers-certificate-of-origin

Thank you,
=E2=80=94Sagar Patel
