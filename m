Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEC3BC48BE8
	for <linux-man@archiver.kernel.org>; Sat, 12 Jun 2021 08:32:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C171461249
	for <linux-man@archiver.kernel.org>; Sat, 12 Jun 2021 08:32:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229819AbhFLIez (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sat, 12 Jun 2021 04:34:55 -0400
Received: from mail-wm1-f41.google.com ([209.85.128.41]:39573 "EHLO
        mail-wm1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230400AbhFLIex (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sat, 12 Jun 2021 04:34:53 -0400
Received: by mail-wm1-f41.google.com with SMTP id l18-20020a1ced120000b029014c1adff1edso9922673wmh.4
        for <linux-man@vger.kernel.org>; Sat, 12 Jun 2021 01:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ibwh6A5lc2r1HNGbK/LmQRv9sSjpxDdd9y5anmCPQmE=;
        b=LTxebVI36v0k/nJwnAS6pM5DualYO3deDfE0HfUh2hCH8k/zqJgsMl3RZUVTiFCHFr
         WReL4q85RfjXJTbdATvB17fHQpNZqYKeRcKxYDbsbfkJkoQZg4JqoWuaglE3HVQKi5JU
         6guFlF1zJOXHeFzIJ9x9o1KFg7mi9tN5Mn16eItjB5hPGv6GxGh7d76pk7gxuGkWv4rd
         mk5lPFaLTIRLwCibysjon3ohh2NrdneCWmFnWpO+SK8Al27/McpKfmb7JzCKLhOxBEqz
         ltTdkYE2Dls9N5IKAtDLFmc3TVeMCxg2X+t4tJog59PL8cyod4qoXvmvkbeP8jLXaDjb
         J30g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ibwh6A5lc2r1HNGbK/LmQRv9sSjpxDdd9y5anmCPQmE=;
        b=sbujQOY4X82AYRdDYGXWzWly1oR9lfh6itJMhcDt4NyxDElFHsJVcHPXdAsuJUrdVa
         TK29j3UbNI+p5BOoRxMBvPxasWKjpp7TUNgK1vL+fi3om7omk6EmO4q0H6t2Sj4iJ2Kf
         0Sid8bqbGARomtWb+ZcSRLUkjqF2/dwRn51hCJkGoqy7l6Sw5qe5MwBKU9owMIrQ7Bbo
         qbW48q+nczG/RzP4xRjn7lvVgDTJBoxQl9JqgGOKy5BnUGcW7qrEn6+gmJc41w/atBHY
         UfkBO6ps7mrQL+oPG0W0DQUDvLrupY/IFEEUl+oFiriDYECWGLvKqvQFYXfCBCHglGkX
         G4gQ==
X-Gm-Message-State: AOAM530e9IhlWntEQBHrk9yc9+wooDd9ZQZ1MR3Nx3pfXguBUl6z2L8A
        6TRephz0i0yIR1lPtdMmMmlUaYHj75g=
X-Google-Smtp-Source: ABdhPJwsbDkiLUyS/hkXwJ72Yh827Ykmn+JRmoWqWOH3XDEZk94R2jjwW1fc/Yof6yo/Cr4j0nJlDA==
X-Received: by 2002:a1c:b403:: with SMTP id d3mr7433949wmf.79.1623486713727;
        Sat, 12 Jun 2021 01:31:53 -0700 (PDT)
Received: from localhost.localdomain ([170.253.36.171])
        by smtp.googlemail.com with ESMTPSA id c12sm11165110wrr.90.2021.06.12.01.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jun 2021 01:31:53 -0700 (PDT)
From:   Alejandro Colomar <alx.manpages@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     Alejandro Colomar <alx.manpages@gmail.com>,
        linux-man@vger.kernel.org
Subject: [PATCH 08/28] statx.2: SYNOPSIS: Fix includes
Date:   Sat, 12 Jun 2021 10:31:25 +0200
Message-Id: <20210612083145.12485-9-alx.manpages@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210612083145.12485-1-alx.manpages@gmail.com>
References: <20210612083145.12485-1-alx.manpages@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

<unistd.h> doesn't seem to be needed:
  AT_* constants come from <fcntl.h>
  STATX_* constants come from <sys/stat.h>
  'struct statx' comes from <sys/stat.h>

Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>
---
 man2/statx.2 | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/man2/statx.2 b/man2/statx.2
index a14880630..62e86fb1b 100644
--- a/man2/statx.2
+++ b/man2/statx.2
@@ -32,9 +32,8 @@
 statx \- get file status (extended)
 .SH SYNOPSIS
 .nf
+.BR "#include <fcntl.h>           " "/* Definition of " AT_* " constants */"
 .B #include <sys/stat.h>
-.B #include <unistd.h>
-.BR "#include <fcntl.h>           " "/* Definition of AT_* constants */"
 .PP
 .BI "int statx(int " dirfd ", const char *restrict " pathname ", int " flags ,
 .BI "          unsigned int " mask ", struct statx *restrict " statxbuf );
-- 
2.32.0

