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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B06BC43466
	for <linux-man@archiver.kernel.org>; Fri, 18 Sep 2020 17:05:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C902F20DD4
	for <linux-man@archiver.kernel.org>; Fri, 18 Sep 2020 17:05:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LxBydw63"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726247AbgIRRFD (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Fri, 18 Sep 2020 13:05:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725955AbgIRRFD (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Fri, 18 Sep 2020 13:05:03 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15134C0613CE
        for <linux-man@vger.kernel.org>; Fri, 18 Sep 2020 10:05:03 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id k18so6279545wmj.5
        for <linux-man@vger.kernel.org>; Fri, 18 Sep 2020 10:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qrrVlClRGR+0YnylhOmUXyCLJbI+UH7yC3u8JnLNdbc=;
        b=LxBydw63CK48uerXZXGkLVLgJL5cvI99itWs7AaFY6l3Sjo3VFNqmSVgL2cspqvrtq
         jol6K0HHdTqMUsGoDlJvL79nvVNokJKUPOAtw7/Bj3Z7m6Xb9hrO1HHhvcHioIIJQKYP
         RVl9pXRY4P/o+DjDIZ92vt/+zPnj0FGrtqXXek1wp4kHwgoiNmdHdnYpaKAxs1nrJL6c
         uGjOFRDtD1vxLf44lDBSVKe6AwM7mc0ZlqVcpezlf9yA6IahJItUgUknJUHIB0Z5/oQ7
         mQmMNY3l9UGvLwpdrkd4pw45WjsGe2zD+i9uoNk2T7HuNyLuYTcIQd4bC8V6udVc3eX5
         DcJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qrrVlClRGR+0YnylhOmUXyCLJbI+UH7yC3u8JnLNdbc=;
        b=SlNWRp2eRa4pISjaYlywqcolddt6772BMiloS9wNJPDW+iUilhYpun8XQC6J/R/N43
         0TpLZb/CCnvNT2fnGELl1LPOi7QGURY60bjarX2b69ayJjHYxJMpjGsshLE0Vl4SxUdp
         FkraRYHfkZ4rOE/HUaShU5yKOVlUPwnPgTWTraEEXkIVJJGUVzyXCRkCcTwH7EpsqG/H
         3Jb6WuPNDmw20DXnMimtg0SPwlsHbnpPks6ET3jqZmWG0Wpne+hgSTGmoL7j6881bs6u
         DT7hU4gvYGgQkHuklUWsoluRslDXrEdXffEKxCdhh3cq73vYRSV6z22ZN2DbKOAKwwbJ
         Vwmw==
X-Gm-Message-State: AOAM530szpFs1fHD/T9XU0AGl0eF7akklpmmR00dze99GHiX33kzVDUt
        NSxlcbMergc/TrojJ1C7BJg=
X-Google-Smtp-Source: ABdhPJyT0AHR9eVpHfycIR1JwKPCEUM5CghevfKDArTS2mFuZrggxyDwC0UMr6EMeSnyr25s6N1rjg==
X-Received: by 2002:a05:600c:414b:: with SMTP id h11mr16670942wmm.20.1600448701711;
        Fri, 18 Sep 2020 10:05:01 -0700 (PDT)
Received: from localhost.localdomain ([170.253.60.68])
        by smtp.googlemail.com with ESMTPSA id q18sm6321208wre.78.2020.09.18.10.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2020 10:05:00 -0700 (PDT)
From:   Alejandro Colomar <colomar.6.4.3@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     linux-man@vger.kernel.org, libc-alpha@sourceware.org,
        Alejandro Colomar <colomar.6.4.3@gmail.com>
Subject: [PATCH 2/9] system_data_types.7: srcfix: Add FIXME note: Add descriptions
Date:   Fri, 18 Sep 2020 19:04:36 +0200
Message-Id: <20200918170442.94920-3-colomar.6.4.3@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200918170442.94920-1-colomar.6.4.3@gmail.com>
References: <20200918170442.94920-1-colomar.6.4.3@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Signed-off-by: Alejandro Colomar <colomar.6.4.3@gmail.com>
---
 man7/system_data_types.7 | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/man7/system_data_types.7 b/man7/system_data_types.7
index 5352f3ef2..48871e4eb 100644
--- a/man7/system_data_types.7
+++ b/man7/system_data_types.7
@@ -96,6 +96,8 @@ typedef struct {
                         * the end of substring */
 } regmatch_t;
 .EE
+.\".IP
+.\" FIXME: Add a description?
 .IP
 Conforming to: POSIX.1-2001 and later.
 .IP
-- 
2.28.0

