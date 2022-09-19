Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6937BECAAD3
	for <linux-man@archiver.kernel.org>; Mon, 19 Sep 2022 16:55:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229555AbiISQzL (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 19 Sep 2022 12:55:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229813AbiISQzI (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Mon, 19 Sep 2022 12:55:08 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B85CDFC3
        for <linux-man@vger.kernel.org>; Mon, 19 Sep 2022 09:55:06 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id o2so45752260lfc.10
        for <linux-man@vger.kernel.org>; Mon, 19 Sep 2022 09:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=SwNvvehCjAg3qxRMvcvOZou8ETYO8QonZxD2l9ju69Y=;
        b=FgAEvuPsUzyqbVl1Bva8U6rck6QoJQqdTlPgSbB/AtSl5+mVcr5rb84CjTz9emz+WO
         hjLEGlmpq7exOx7NokL5W8IM/GvyMfImglId5uwZYgxlBja8M2gUgN/eUUA6rRDx3esr
         CFK+pWNL6kiE+AlrzQ1I8MqqoVSupwJ2/KfbgFEzLWyRC2MCH99yYaQ1cxgdXU9JaFg6
         8E8Xp1nKQRbvwQpkXLV2/YpcFcX0QiiBHzMa87iDriIHvZCnyCAWwvwU/pOBP0fqSeLT
         K1QFrIX9UR/zQGomv9nMegZeQFz0U/ocP02HFuJ0b+ko/48mq2bGSa4jRqEwbtCvDsWf
         76+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=SwNvvehCjAg3qxRMvcvOZou8ETYO8QonZxD2l9ju69Y=;
        b=wa8L/9OnpFJMeBkmoJ8MnnutVHEFteKi0HUI0bpjkwbgvcvOjp74Z8ljju4I+fl4HP
         DDJLKk+TbHUF+jOyScdyw5q9+QLAhw4tFuKMrIcCchb6d37cc4gkn5KBt1ZEFa2hJsET
         oRUxCYH+7uxpRp7Nfq6vuae4SRfKmex/R/zcz8KiEewUHTGxhxxhM2J9vuIxP8+c2wbX
         xQt6fYBdiBZ4tuVnX7+G4IEste1xffNTZ1JK/qIIAwN76fqybsSQZiEHwhXHiIKKGGic
         /Pdrkrluuyc33ICaNcmdmXC0NevOBepGW8LjkhhUlZdHel5QNmW7YY8DU+tMkko7NsVW
         lWqw==
X-Gm-Message-State: ACrzQf3F0+D5vOQm+ZcoSmIO1oyRBGHG4f7LZUr4t4I8CNmsYWnfoCCe
        p8lmx7ojrHEl9N+MsW724OYYrwm2oIojiw==
X-Google-Smtp-Source: AMsMyM7rXJLrXyy8ixZ1du40h1S3yCzQPB2q2QODrPnYwpS0Ld/Rari1Fr+GePooqhwFcYY6N8M6Vw==
X-Received: by 2002:a05:6512:6c3:b0:49a:d227:1b5b with SMTP id u3-20020a05651206c300b0049ad2271b5bmr6203034lff.386.1663606504546;
        Mon, 19 Sep 2022 09:55:04 -0700 (PDT)
Received: from dell7760.lan ([31.169.55.19])
        by smtp.googlemail.com with ESMTPSA id m11-20020ac24acb000000b0049496855494sm5263815lfp.104.2022.09.19.09.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 09:55:04 -0700 (PDT)
From:   Alex Colomar <alx.manpages@gmail.com>
To:     linux-man@vger.kernel.org
Cc:     Alex Colomar <alx.manpages@gmail.com>,
        Walter Harms <wharms@bfs.de>, Radisson97@gmx.de,
        "G. Branden Robinson" <g.branden.robinson@gmail.com>,
        libc-alpha@sourceware.org
Subject: [RFC v3 3/4] printf_arginfo_size_function.3type, printf_function.3type, printf_info.3type, printf_va_arg_function.3type: Add links to printf.h(3head)
Date:   Mon, 19 Sep 2022 18:54:55 +0200
Message-Id: <20220919165456.28289-4-alx.manpages@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220918221640.19942-1-alx.manpages@gmail.com>
References: <20220918221640.19942-1-alx.manpages@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Cc: Walter Harms <wharms@bfs.de>
Cc: <Radisson97@gmx.de>
Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: <libc-alpha@sourceware.org>
Signed-off-by: Alex Colomar <alx.manpages@gmail.com>
---
 man3type/printf_arginfo_size_function.3type | 1 +
 man3type/printf_function.3type              | 1 +
 man3type/printf_info.3type                  | 1 +
 man3type/printf_va_arg_function.3type       | 1 +
 4 files changed, 4 insertions(+)
 create mode 100644 man3type/printf_arginfo_size_function.3type
 create mode 100644 man3type/printf_function.3type
 create mode 100644 man3type/printf_info.3type
 create mode 100644 man3type/printf_va_arg_function.3type

diff --git a/man3type/printf_arginfo_size_function.3type b/man3type/printf_arginfo_size_function.3type
new file mode 100644
index 000000000..ad10bad38
--- /dev/null
+++ b/man3type/printf_arginfo_size_function.3type
@@ -0,0 +1 @@
+.so man3head/printf.h.3head
diff --git a/man3type/printf_function.3type b/man3type/printf_function.3type
new file mode 100644
index 000000000..ad10bad38
--- /dev/null
+++ b/man3type/printf_function.3type
@@ -0,0 +1 @@
+.so man3head/printf.h.3head
diff --git a/man3type/printf_info.3type b/man3type/printf_info.3type
new file mode 100644
index 000000000..ad10bad38
--- /dev/null
+++ b/man3type/printf_info.3type
@@ -0,0 +1 @@
+.so man3head/printf.h.3head
diff --git a/man3type/printf_va_arg_function.3type b/man3type/printf_va_arg_function.3type
new file mode 100644
index 000000000..ad10bad38
--- /dev/null
+++ b/man3type/printf_va_arg_function.3type
@@ -0,0 +1 @@
+.so man3head/printf.h.3head
-- 
2.37.2

