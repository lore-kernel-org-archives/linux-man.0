Return-Path: <linux-man-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76503EB64DA
	for <linux-man@archiver.kernel.org>; Sat, 22 Jul 2023 12:23:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229643AbjGVMW4 (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sat, 22 Jul 2023 08:22:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbjGVMW4 (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sat, 22 Jul 2023 08:22:56 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8061D1BF
        for <linux-man@vger.kernel.org>; Sat, 22 Jul 2023 05:22:55 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-ca429c9dc0bso306948276.0
        for <linux-man@vger.kernel.org>; Sat, 22 Jul 2023 05:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690028574; x=1690633374;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=P1Sui0Psiom76eHcCDhKR2aPlYbiuAVoW17f4ys7QwI=;
        b=e6Y6+b51y3MBprO+RHjCXPQEcGWtFE+GYVpIhUafPVVfgh4XjP53rr9pgWZdR0W6lv
         JK7qS6mNjX6PCOEGSMTNWjh24G6uv9A92sIG1PoBbYy5e56QaXneXiBFOpo68fHc/xY0
         45/1nIbY5e9XhXke1W/DnlTYkA3tGAHBoAT+KvyTVQcphlVsLTKrNL/CGvwsGT7ShBWl
         3bJkzI8fjakQotKgSF460qkOHYhd17/b7kByooqyT3dWZn6TXa65FEZvCWOPV5vZY30Q
         gHIsiBLH/CDwYQ1TAhZrpb/84x0JF/hCyfa0h5hBeCvhoNZba+SbDcPSc18wT3gFwVp6
         iqZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690028574; x=1690633374;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P1Sui0Psiom76eHcCDhKR2aPlYbiuAVoW17f4ys7QwI=;
        b=Iv9B/9heAsDP/e8mtSAGXdqbWacL7vlYHPsG/brbz+f/izGhQupGRUNHND+AC5rCgs
         +XJju4wIwCWsPN47Rcb/Ign3XnYBpL62l9AR7Fw3crJyTeN5CrnwEkeQPbgIn2xilBoo
         hkvhc93SOvmJkFo0rmudJE3mQ+K5/pP4mp35fEJE3FTmQuS0cJbmIUltWFlGwXyz1/uH
         EnTX1g/HQn86dCTLr+nWOQAjaQGXHtLRG6SUXcsInikMxYdfd9cDuYOv0jubE1hDsS7F
         oxGkgRSHvOwzPuAGHudsk9DEglR2B0wU6uk62u+HE9Kc+s3r99bNd8zSeVSw0GeY+Igy
         YWwA==
X-Gm-Message-State: ABy/qLaEzI5YyWBFRrzU+z3yDD48p+2nJxaVq6i9V7xubz3GnawBGm1f
        bBoXuhJXAyKDUhL5zHMk+zpfYAyl/8OBFm4VJe6xgnc1pfY=
X-Google-Smtp-Source: APBJJlHgnbjaXlmxxlV+ZMwxORss5hvSpkyn64AiqlroFu6f0h1IUmCkg2G0QovqdXT9tO0wNnN02dpfByulTQ3FlHc=
X-Received: by 2002:a81:4f13:0:b0:573:2346:ea55 with SMTP id
 d19-20020a814f13000000b005732346ea55mr2272193ywb.2.1690028574725; Sat, 22 Jul
 2023 05:22:54 -0700 (PDT)
MIME-Version: 1.0
From:   Askar Safin <safinaskar@gmail.com>
Date:   Sat, 22 Jul 2023 15:22:18 +0300
Message-ID: <CAPnZJGCoHfwngQe5B1PgZ6kO7UK+GU7+G4vfVXxNpBZ6n-nB2g@mail.gmail.com>
Subject: shutdown(2) is underdocumented
To:     Alejandro Colomar <alx@kernel.org>
Cc:     linux-man <linux-man@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

shutdown(2) is underdocumented. Here is a lot of more details on
shutdown(2): https://github.com/WebAssembly/WASI/issues/547 . I
discovered them by experiment. So, please, document them

-- 
Askar Safin
