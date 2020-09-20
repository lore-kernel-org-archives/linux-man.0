Return-Path: <SRS0=ulXM=C5=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B92AFC43465
	for <linux-man@archiver.kernel.org>; Sun, 20 Sep 2020 18:16:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7578920897
	for <linux-man@archiver.kernel.org>; Sun, 20 Sep 2020 18:16:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m/k8X1b7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726126AbgITSQD (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sun, 20 Sep 2020 14:16:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726055AbgITSQD (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sun, 20 Sep 2020 14:16:03 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B63EBC061755
        for <linux-man@vger.kernel.org>; Sun, 20 Sep 2020 11:16:02 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id t10so10474876wrv.1
        for <linux-man@vger.kernel.org>; Sun, 20 Sep 2020 11:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ImOsI6jJCc0HkrX9+nhemcSJxcFzyUYEkqd2JR683Z4=;
        b=m/k8X1b7NIWkWpFJ0mat3FQ53er+Iho5WqaggyiwodDOE/LG1qfzimwx6j68ei0pNK
         08r7NhxgPhLZnGdz30mV3E0TDJfcLo2gzUWNd469AEf4nbPwtDkIvaEJSre3UpkWzz1E
         2GBhwZMxK8TUaf+J7Sv/0JoUnE7DosFivXId6NNgycA2mzqD+5eLUZEX8TkwL+eeq3C8
         g2IQPqN1xvXlSHE21rxv+dmaHX5C2xHf664nnXJdjOdLFKFOf3u9xU/IHFpyAbFxorWX
         abUQEorlqZi4UnLO4A1ZWOFm+Mhrlrjiy4TF09oY+PrPOwH/5UL5RPi7NX0Q9ii9l3WO
         Mv7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ImOsI6jJCc0HkrX9+nhemcSJxcFzyUYEkqd2JR683Z4=;
        b=qRGIca7AWesHntaA/7ixbtKXXz3QgcWXf7WUkGFfI6GrZROQ8MjM+SB3SJoiYZ1AAW
         hpyd5uUh54Tw5eANjuQ/JneDU4dgyDP6/96P2P0PmOHXM4yh1oVsnwoISC2dDCtNH7xp
         adzz5jvuNmJjuSpHNIppRPA5U0mYje/OzU8zcxWg2tQdLpQMG2+8d2ixrvvFEnIfJp6O
         J9T3ZIVyRDxwyg35y7wUFLv9bJ10ocpOOOOTI/ZYwfDUhprjhiZ+S87yzXR4sD/rGtzU
         ZijLWZjWjmTCE1z4n/felvHaYy88aFBPtI4aLlRmmZTsLU4ABeRo4SL0e0Ro88hA1Xzx
         rfKQ==
X-Gm-Message-State: AOAM531YlEdKJFQVeOEicdhAFgSN6DU+6Rs5fsHDPFYQXulai7BjmHXo
        1Ar0TWultgPk6+UT4o1rDeJsHdfq/PE=
X-Google-Smtp-Source: ABdhPJwflWYO8oAkkdhO5fiQ4eTdEm8OszCIzRKqASueEnpYs0SAsbxD/wr1hJnDCjrZk6J9C8/b8Q==
X-Received: by 2002:adf:ee8d:: with SMTP id b13mr52560010wro.249.1600625761080;
        Sun, 20 Sep 2020 11:16:01 -0700 (PDT)
Received: from localhost.localdomain ([93.115.133.118])
        by smtp.googlemail.com with ESMTPSA id i6sm18368902wra.1.2020.09.20.11.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2020 11:16:00 -0700 (PDT)
From:   Alejandro Colomar <colomar.6.4.3@gmail.com>
To:     eggert@cs.ucla.edu, mtk.manpages@gmail.com
Cc:     linux-man@vger.kernel.org, fweimer@redhat.com,
        Alejandro Colomar <colomar.6.4.3@gmail.com>
Subject: [PATCH v2] system_data_types.7: Specify the length modifiers for the variables that have them
Date:   Sun, 20 Sep 2020 20:14:08 +0200
Message-Id: <20200920181407.77667-1-colomar.6.4.3@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Reported-by: Florian Weimer <fweimer@redhat.com>
Reported-by: Paul Eggert <eggert@cs.ucla.edu>
Signed-off-by: Alejandro Colomar <colomar.6.4.3@gmail.com>
---

Hello Paul,

On 9/18/20 10:24 PM, Paul Eggert wrote:
> I suggest saying "values" instead of "variables", here and elsewhere,
> since variables need not be involved.

Yes.

> This sort of thing should use ".B" not ".BR". There are multiple
> instances of this.

Oops. A few typos.

> POSIX does provide that length modifier; however, it doesn't say it
> works with ssize_t. I suggest rewording "Glibc provides a length
> modifier" to "Glibc and most other implementations provide a length
> modifier", and changing the last two sentences to:
> 
> 
> Although
> .B z
> works
> for
> .I ssize_t
> on Glibc and most other implementations, portable POSIX programs should
> avoid it, e.g., by converting to
> .I intmax_t
> and using its length modifier.

Much better wording.  Check the new one, please.

Thanks,

Alex

 man7/system_data_types.7 | 56 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/man7/system_data_types.7 b/man7/system_data_types.7
index 080f0057f..5128e1f01 100644
--- a/man7/system_data_types.7
+++ b/man7/system_data_types.7
@@ -108,6 +108,22 @@ capable of storing values in the range
 .BR "" [ PTRDIFF_MIN ,
 .BR PTRDIFF_MAX ].
 .IP
+The length modifier for
+.I ptrdiff_t
+for the
+.BR printf (3)
+and the
+.BR scanf (3)
+families of functions is
+.BR t ;
+resulting commonly in
+.B %td
+or
+.B %ti
+for printing
+.I ptrdiff_t
+values.
+.IP
 Conforming to: C99 and later; POSIX.1-2001 and later.
 .IP
 See also the
@@ -343,6 +359,22 @@ it shall be an unsigned integer type
 capable of storing values in the range [0,
 .BR SIZE_MAX ].
 .IP
+The length modifier for
+.I size_t
+for the
+.BR printf (3)
+and the
+.BR scanf (3)
+families of functions is
+.BR z ;
+resulting commonly in
+.B %zu
+or
+.B %zx
+for printing
+.I size_t
+values.
+.IP
 Conforming to: C99 and later; POSIX.1-2001 and later.
 .IP
 Notes:
@@ -403,6 +435,30 @@ According to POSIX, it shall be a signed integer type
 capable of storing values at least in the range [-1,
 .BR SSIZE_MAX ].
 .IP
+Glibc and most other implementations provide a length modifier for
+.I ssize_t
+for the
+.BR printf (3)
+and the
+.BR scanf (3)
+families of functions, which is
+.BR z ;
+resulting commonly in
+.B %zd
+or
+.B %zi
+for printing
+.I ssize_t
+values.
+Although
+.B z
+works for
+.I ssize_t
+on most implementations, portable POSIX programs should avoid using it,
+e.g., by converting the value to
+.I intmax_t
+and using its length modifier.
+.IP
 Conforming to: POSIX.1-2001 and later.
 .IP
 See also:
-- 
2.28.0

