Return-Path: <SRS0=SL3d=C3=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE235C43463
	for <linux-man@archiver.kernel.org>; Fri, 18 Sep 2020 12:05:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 97AA020848
	for <linux-man@archiver.kernel.org>; Fri, 18 Sep 2020 12:05:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jWHQ0T3O"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726126AbgIRMFD (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Fri, 18 Sep 2020 08:05:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725955AbgIRMFD (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Fri, 18 Sep 2020 08:05:03 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77BE9C06174A
        for <linux-man@vger.kernel.org>; Fri, 18 Sep 2020 05:05:02 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id a17so5353567wrn.6
        for <linux-man@vger.kernel.org>; Fri, 18 Sep 2020 05:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bs5d3L8E3eyZ7mwqAL8u/Ypq4XIrY1R9/kAUbd8hYN8=;
        b=jWHQ0T3O2/MTuQYMUxrb6RzLdbeXS8HitKNulZkVmGV6cCH/MC+jLV4qoKnN59OsEU
         IHX5tmjx2+NxNs/owQkpL0/+Bgw5N3pr2EKILnFJyOPD5L+rqhKeLf/PXHL/8jOxQuRj
         U9+AvfePE90OfP3kkDOwdqEm5SKuFzlBCCCv0O9l+pomSObKOLTwVNP07sJywWvj7iAm
         fTIR+IAAuM7HomZxN0gEbrD9HZS3+NjjuaCVQ0aMGCO2xReOl6EX4vdNMfuG9s+YJkg3
         dza8QGutjmpFAHZugZD6HnaBRuu004rIxGJ89H9i3uHqw6e1llPRiXBcGrg7C9u8sX+u
         4cDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bs5d3L8E3eyZ7mwqAL8u/Ypq4XIrY1R9/kAUbd8hYN8=;
        b=ONZ1YBHlimMmaAQQRjqmkZXhr+EuLt8T1olfvkxz1jqBMtM127TnHiOpEiaVhMv6x5
         GyjTT5ocpGQMuk3aCYC+IMyn4qEQuPZn5z12xqMI+tsie/mBklCdmliY+08CUWciSkRv
         10sGuw8rUCqF0lL9//mHlJ1uECgiFQ+XTKpFAS9yiX0ijemMujrshQRl+Wsxg9KIcv3C
         6PP7RIZAY0Bd+xXchXTGbpOmsf9l/gQ1LljmbxywM2rYrkhB1gjmvDs8tv5MvzfuFxjY
         eYrUpYxV8cwzyLgaTbEt9xU8FsxnXgFCTJfOr55/Gj5B+++DJumQGsnRDUQJAUJd3wD8
         N1dA==
X-Gm-Message-State: AOAM531CuYMsEANHgBVnVpL8uGO/RjrcQ4AstPEtfck2YMc7cpFJOoSy
        m0MEV8HxKKKbNOolYTNnunZwTQEN6djeHQ==
X-Google-Smtp-Source: ABdhPJzyZH1Lx0CPv6UAJYvBBh1AA4Ioygw0BvVb8ZRsXVTHd+aj/LKYIaYflj8TZiDzwFNusSo0Hg==
X-Received: by 2002:adf:84c3:: with SMTP id 61mr36784019wrg.131.1600430700430;
        Fri, 18 Sep 2020 05:05:00 -0700 (PDT)
Received: from localhost.localdomain ([170.253.60.68])
        by smtp.googlemail.com with ESMTPSA id n4sm4862502wrp.61.2020.09.18.05.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2020 05:04:59 -0700 (PDT)
From:   Alejandro Colomar <colomar.6.4.3@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     linux-man@vger.kernel.org, libc-alpha@sourceware.org,
        Alejandro Colomar <colomar.6.4.3@gmail.com>
Subject: [PATCH 0/4] Document ptrdiff_t (and a few minor patches)
Date:   Fri, 18 Sep 2020 14:04:37 +0200
Message-Id: <20200918120440.30281-1-colomar.6.4.3@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Hi Michael,

Documentation for ptrdiff_t + a few minor patches.
(apply after size_t patches)

Cheers,

Alex.

Alejandro Colomar (4):
  system_data_types.7: srcfix: Remove TODO comment
  system_data_types.7: wfix: sort referenced types
  system_data_types.7: Document ptrdiff_t
  ptrdiff_t.3: New link to new documented type in system_data_types(7)

 man3/ptrdiff_t.3         |  1 +
 man7/system_data_types.7 | 32 ++++++++++++++++++++++++++------
 2 files changed, 27 insertions(+), 6 deletions(-)
 create mode 100644 man3/ptrdiff_t.3

-- 
2.28.0

