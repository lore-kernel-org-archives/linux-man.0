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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76B67C4363D
	for <linux-man@archiver.kernel.org>; Fri, 18 Sep 2020 12:47:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3BDCD208B8
	for <linux-man@archiver.kernel.org>; Fri, 18 Sep 2020 12:47:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hozP3cxR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727013AbgIRMrJ (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Fri, 18 Sep 2020 08:47:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726780AbgIRMqo (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Fri, 18 Sep 2020 08:46:44 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BE69C06178A
        for <linux-man@vger.kernel.org>; Fri, 18 Sep 2020 05:46:44 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id w5so5489833wrp.8
        for <linux-man@vger.kernel.org>; Fri, 18 Sep 2020 05:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yxqpPaP6sT76tEtJoNqM0DW4g/DkJ26KVSZttsEJll8=;
        b=hozP3cxRKhaTpw4c6nDO4h9+4tt8bX3R0/0jtjfWqNI1BEJCeMqejKA38ea7ZTw7E0
         39ORRnV4UOhEKJYxNqIQuQkQ1Pi9r6UO1xOSjk8B3GHWUFGkT09KvDjr3WSK5maneLzQ
         JtFv+28hmuaTJFKrJCUDFC5T5DO8+x+1zLM2KIyqCqCTBEbci4hfzmYWdjOv+I9J4MmJ
         G+TsS0wLEAVTt/CC3gWNiNR0uf9gJzSg15q1QuxDqMFEYJU+5VXU8od6cC/e5KgHAkdu
         Y+fR0YLZ6ZTLxpFSrEPHlJBcsyLsjDCR350/aaTgAR4+fwbt/opGlc5zJ76BZPlft5f/
         M/gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yxqpPaP6sT76tEtJoNqM0DW4g/DkJ26KVSZttsEJll8=;
        b=X3ZIBEXH/4SfwtcJkP4xOTsgQbie9M1uNMw21te0HI4UpWtvzIVBZZEnHKhxLz/tlo
         /sOdLM5lPsGOc23uRdpXKo1aliZc+U4jctgz4g1OBkIsAsml+EIsAvm4mRf8qhImRATX
         wAx6WnJFagZ65owjhN61w2AoHtnuAw/AIAofwaMatad/nBUzbyOJccobfFcbGzbABcPU
         5T95ASWvGR1eVwE+5EFlffJkTHpBMErrqD6dslp6lX7hcycd3BC4Xm2GEur+vph2OPIo
         7udkW5geJ0EcBsTw9yPjspHvORN2vZc5UvLdtjT/nXep+saGufJPiQhhcvYlDf8zxJCo
         laPw==
X-Gm-Message-State: AOAM5308pjWB30L2YjffsLuVXpaiaOfAAZTXSx9ODom5OsOkkCzpqxxq
        waPY5TTp9BXgjMGgvfjKYX4=
X-Google-Smtp-Source: ABdhPJwFP41ee5fv7/u0A36aq3SVAwLubarOUaa1pogwmXI9p+ap3d0d/Mhc/+I+qMS0FThaNHgCeg==
X-Received: by 2002:a5d:4d8a:: with SMTP id b10mr37138892wru.82.1600433203017;
        Fri, 18 Sep 2020 05:46:43 -0700 (PDT)
Received: from localhost.localdomain ([170.253.60.68])
        by smtp.googlemail.com with ESMTPSA id h76sm5254410wme.10.2020.09.18.05.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2020 05:46:42 -0700 (PDT)
From:   Alejandro Colomar <colomar.6.4.3@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     linux-man@vger.kernel.org, libc-alpha@sourceware.org,
        Alejandro Colomar <colomar.6.4.3@gmail.com>
Subject: [PATCH 3/4] regoff_t.3: New link to new documented type in system_data_types(7)
Date:   Fri, 18 Sep 2020 14:45:54 +0200
Message-Id: <20200918124554.46308-4-colomar.6.4.3@gmail.com>
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
 man3/regoff_t.3 | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 man3/regoff_t.3

diff --git a/man3/regoff_t.3 b/man3/regoff_t.3
new file mode 100644
index 000000000..db50c0f09
--- /dev/null
+++ b/man3/regoff_t.3
@@ -0,0 +1 @@
+.so man7/system_data_types.7
-- 
2.28.0

