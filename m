Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D041C43331
	for <linux-man@archiver.kernel.org>; Mon,  4 Jan 2021 18:06:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 674AC21D1B
	for <linux-man@archiver.kernel.org>; Mon,  4 Jan 2021 18:06:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726497AbhADSGg (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 4 Jan 2021 13:06:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726452AbhADSGg (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Mon, 4 Jan 2021 13:06:36 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7AABC061574
        for <linux-man@vger.kernel.org>; Mon,  4 Jan 2021 10:05:55 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id e25so116883wme.0
        for <linux-man@vger.kernel.org>; Mon, 04 Jan 2021 10:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5rKDud63D/LlAcCaYHwUDZhnvMnVq2qTO5WjsGNouGA=;
        b=WwdAMG/Pm1gOyNjU8dr+/TBzBkSaKIM1XNnn74nGHbhkd8e6a9hjMPg4X3iGJRYVzz
         /Omf7TE47vK2h6BxFJ9xvbi24AvFzpH0jRZLA13Lam4Uu2erXfPCVlPB4/W7/MwRtIGX
         8a49m3CBTU4p4+3fUpQGQlOU6JCsdgMPMH9lp2xu2keNNowTiXWRjsKXn/2XG0YVQFxL
         oX7v4a8/VwkdUr50tdeiy22yZz8YNIXfoaHkszyuiQ4f0xxIhHg/WksJY8CAfW+hqIhi
         2mkOVrQo2H6xmwCh658xdWTwnJD2ZFRpVl9hBEPhJ0TSQVFZFuA0VHe08XIPJt5xyR/b
         M1eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5rKDud63D/LlAcCaYHwUDZhnvMnVq2qTO5WjsGNouGA=;
        b=jn0H7+8UuxwYEfnKbAM3T189MYDCIHMaYMdBdX796NbUYn3kfjPMmxuDGsy43qtDkt
         DgUXsIBNAw88dCO6rqShDLvJBp6FlT78o8/abfKEK0O8ckCGyXhj3YNhGFhidFWj22x5
         nmvCp/By1AgHcoB6Q3oNtvCPgQ5WrU/NquoncQ76hG8fGHIbbmVn7CG2uZsNHJChqpt9
         rl4JMfD5COHIuOo11R/r20KsgM/nXsEZwpCHvBh8bwRyitP+TGKQ4Zxr/UdIEbbtfjGM
         My7oZV13HpkHMVJ3HRYUfuiem4sYRH7XquzKLkiMK3mXcLK2B4r/H1GB8Loed1GrGwup
         KyPQ==
X-Gm-Message-State: AOAM533dKJQmLM38Y5kV1wOtOTulXt60hwnY4gEp7SxMpreNnxPNTacE
        gwPMU87WziLyzaVTEr0pBtc=
X-Google-Smtp-Source: ABdhPJy6lzCLUcXloijpyrUVrlR4VkFV1tl4/z8dF9rNL9JtGzAk0CtmBH75H1qyleDCEe4ckUs18g==
X-Received: by 2002:a1c:6506:: with SMTP id z6mr79058wmb.55.1609783554631;
        Mon, 04 Jan 2021 10:05:54 -0800 (PST)
Received: from debian.vlc ([170.253.51.130])
        by smtp.gmail.com with ESMTPSA id h29sm103578929wrc.68.2021.01.04.10.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 10:05:54 -0800 (PST)
From:   Alejandro Colomar <alx.manpages@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     libc-alpha@sourceware.org,
        Alejandro Colomar <alx.manpages@gmail.com>,
        linux-man@vger.kernel.org,
        Ciprian Dorin Craciun <ciprian.craciun@gmail.com>,
        Florian Weimer <fweimer@redhat.com>
Subject: [PATCH] system.3: Document bug and workaround when the command name starts with a hypen
Date:   Mon,  4 Jan 2021 19:04:21 +0100
Message-Id: <20210104180420.74092-1-alx.manpages@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <CA+Tk8fykJjf=KzYjW7YMonnZ1qAdQJhqKDRrX0FNGyAYjSnkqg@mail.gmail.com>
References: <CA+Tk8fykJjf=KzYjW7YMonnZ1qAdQJhqKDRrX0FNGyAYjSnkqg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

man-pages bug: 211029
 https://bugzilla.kernel.org/show_bug.cgi?id=211029

Reported-by: Ciprian Dorin Craciun <ciprian.craciun@gmail.com>
Cc: Florian Weimer <fweimer@redhat.com>
Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>
---
 man3/system.3 | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/man3/system.3 b/man3/system.3
index aef40417a..0310d9a04 100644
--- a/man3/system.3
+++ b/man3/system.3
@@ -250,6 +250,40 @@ are not executed.
 Such risks are especially grave when using
 .BR system ()
 from a privileged program.
+.SH BUGS
+./" [BUG 211029](https://bugzilla.kernel.org/show_bug.cgi?id=211029)
+./" [Glibc bug](https://sourceware.org/bugzilla/show_bug.cgi?id=27143)
+./" [POSIX bug](https://www.austingroupbugs.net/view.php?id=1440)
+If the command name starts with a hyphen,
+.BR sh (1)
+interprets the command name as an option,
+and the behavior is undefined
+(See the
+.B \-c
+option in
+.BR sh (1).).
+To work around this problem,
+prepend the command with a space as below:
+.PP
+.RS 4
+.EX
+/* system_hyphen.c */
+
+#include <stdlib.h>
+
+int
+main(void)
+{
+    system(" -echo Hello world!");
+    exit(EXIT_SUCCESS);
+}
+.PP
+.RB "$" " sudo ln \-s \-T /usr/bin/echo /usr/bin/\-echo;"
+.RB "$" " cc \-o system_hyphen system_hyphen.c;"
+.RB "$" " ./system_hyphen;"
+Hello world!
+.EE
+.RE
 .SH SEE ALSO
 .BR sh (1),
 .BR execve (2),
-- 
2.29.2

