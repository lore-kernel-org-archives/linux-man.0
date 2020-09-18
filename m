Return-Path: <SRS0=SL3d=C3=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 911AFC4346A
	for <linux-man@archiver.kernel.org>; Fri, 18 Sep 2020 12:46:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 43C1820717
	for <linux-man@archiver.kernel.org>; Fri, 18 Sep 2020 12:46:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JgUUzjuF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726935AbgIRMqp (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Fri, 18 Sep 2020 08:46:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726635AbgIRMqn (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Fri, 18 Sep 2020 08:46:43 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48CA3C061788
        for <linux-man@vger.kernel.org>; Fri, 18 Sep 2020 05:46:43 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id z1so5510091wrt.3
        for <linux-man@vger.kernel.org>; Fri, 18 Sep 2020 05:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Cmxu3JFNPBfeoSZaLw65kng+fKGIsZZMp0RzJya8YdA=;
        b=JgUUzjuFWfY2Mu0yCTMf2csa/UVXuW8JU/GUokZ26p/fsmeJ9tvDIPkX+GbFInSqda
         mAmK5prdcomSDROM+9PUH7gyD3ntCDKlchCSsmSMOOpAWg7pTAvcKh1osieN2C7D7ieL
         WUBBObHTIaYbH3Ly9jLXk9QDCN8PbibHrqMxLKspdXm1VH05xQzVYrDi5BEkuBQeusor
         s43/dLJRgfyFDb+Cy4xLUpZs8e3wD/ztLrMfhxnotYd4TkCsaDb3mnWIkoSV7aYewKkx
         yVmXkZhRoVVse6f4JlO307CoWIZ+EXZDix3qd7Z0t9UzYDDJN9aa6cFdw1P6bvkaLEQG
         7/iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Cmxu3JFNPBfeoSZaLw65kng+fKGIsZZMp0RzJya8YdA=;
        b=c/zyPv6sBxQtoJ6HOPrV7gzPbJ8Swaxze0Qsaft7cELajZy34vIdOUNiuwtPERgqNu
         CV/OQtdwSsNx9zea6TFj4nYfegaPHY7np9UjAWgKzKhUyBDgHEyUyl0gVtfCrbmoZBGq
         5X49LfwBAuIIUo5Gqz0tKES4fqjox00Ua3hw2+uH+EiUsBj83FTLIH4XUzhoPUYfgBAZ
         jpsZSRVlJyvF1xBej9nEgdimGDXZTlm3/GFvaooYDpC3yvWaCWcSZqGveYy/kfY12Vrl
         CgX0naKNOYMrKkT8ozhblFtdH7bvpY+nbhdCoa9sQ5EJScxYWZZbrR2PCik9IPxbu9zX
         UH0w==
X-Gm-Message-State: AOAM532U+ZrqxUGatqwL2BUbz3mlpVE27ppvvoX4diTubZvj6Utb+eOO
        5MFD8Vldzi3PRjXzUH6z/sM=
X-Google-Smtp-Source: ABdhPJyKCm4rx31XQFLw9VUZZMITIF42vxa9utNsOB94/CQeuMpPP+dvAjHVr+qi5kxQ9hcYWqg/gw==
X-Received: by 2002:adf:b602:: with SMTP id f2mr36082982wre.186.1600433202019;
        Fri, 18 Sep 2020 05:46:42 -0700 (PDT)
Received: from localhost.localdomain ([170.253.60.68])
        by smtp.googlemail.com with ESMTPSA id h76sm5254410wme.10.2020.09.18.05.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2020 05:46:41 -0700 (PDT)
From:   Alejandro Colomar <colomar.6.4.3@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     linux-man@vger.kernel.org, libc-alpha@sourceware.org,
        Alejandro Colomar <colomar.6.4.3@gmail.com>
Subject: [PATCH 2/4] system_data_types.7: Document regoff_t
Date:   Fri, 18 Sep 2020 14:45:53 +0200
Message-Id: <20200918124554.46308-3-colomar.6.4.3@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200918124554.46308-1-colomar.6.4.3@gmail.com>
References: <20200918124554.46308-1-colomar.6.4.3@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Signed-off-by: Alejandro Colomar <colomar.6.4.3@gmail.com>
---
 man7/system_data_types.7 | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/man7/system_data_types.7 b/man7/system_data_types.7
index 8969ee966..d96703b1d 100644
--- a/man7/system_data_types.7
+++ b/man7/system_data_types.7
@@ -77,12 +77,40 @@ capable of storing values in the range
 Conforming to: C99 and later; POSIX.1-2001 and later.
 .IP
 See also the
-.\".I regoff_t ,	FIXME: uncomment when regoff_t is documented.
 .I size_t
 and
 .I ssize_t
 types in this page.
 .TP
+.I regoff_t
+.IP
+Include:
+.I <regex.h>.
+.IP
+According to POSIX, it shall be a signed integer type
+capable of storing the largest value that can be stored in either a
+.I ptrdiff_t
+type or a
+.I ssize_t
+type.
+.IP
+Conforming to: POSIX.1-2001 and later.
+.IP
+Notes: Prior to POSIX.1-2008, the type was capable of storing
+the largest value that can be stored in either an
+.I off_t
+type or a
+.I ssize_t
+type.
+.IP
+See also the
+.\".I regmatch_t	FIXME
+.\"structure and the
+.I ptrdiff_t
+and
+.I ssize_t
+types in this page.
+.TP
 .I sigval
 .IP
 Include:
-- 
2.28.0

