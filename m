Return-Path: <SRS0=d1fi=DB=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B994DC2D0E2
	for <linux-man@archiver.kernel.org>; Thu, 24 Sep 2020 09:59:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 53D9021D91
	for <linux-man@archiver.kernel.org>; Thu, 24 Sep 2020 09:59:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gaiu6b8m"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727338AbgIXJ73 (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Thu, 24 Sep 2020 05:59:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727171AbgIXJ72 (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Thu, 24 Sep 2020 05:59:28 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91602C0613CE
        for <linux-man@vger.kernel.org>; Thu, 24 Sep 2020 02:59:28 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id a17so3111083wrn.6
        for <linux-man@vger.kernel.org>; Thu, 24 Sep 2020 02:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mpQG0JtfD1JG9vgwND9rH3nTiYyxT0aXpd54kxEDoOc=;
        b=Gaiu6b8mkIKExXYirm4OZpu9dky0c2ZID477r6cCYwQL8+fhlks9vvmV/tU0IV49tf
         XBiDZ8kDNI0BaJl8utsXBiBFCQ7UPaJPiHYznu+7KaBoEnC8DbpklFKGfdWfM+VSp30k
         zURMFrYjJe337OSnSRsipqLduVCH28NLTkIVOtOauGERpZii0AxMspwwGo8IWRc472qe
         WmDsPIudDKEFQT2J0FToSgrTaX+ZXKslaxFggi0dgJ7DY217r1ftvyVkNj+eCRUANwG+
         +n5HjyI2UgmUPsCIh+azQrV7QB82uw+qBt1D+zAhp87OuOdwvRyGvI4O+5BA6THI0U38
         e3iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mpQG0JtfD1JG9vgwND9rH3nTiYyxT0aXpd54kxEDoOc=;
        b=QjjeyWxkWkCYCmXzNyqJFA/j7tW5tQzD6fBGCivfzrUspCPXnTuzvDX8wd9gOlChrW
         RP1h4fMyCXef+AmJI+FC380TB7nwDepFwACKlHwL95FXFDO5GGeofQTTQvbt3QDS85NV
         MJD41fVyjM8UGH6+wZC2X24FIqlGzHAE5ZzOLgYaD2qf7FOhaUYgyR/XJ9Gj1+0Gw4Qo
         r6S1zbY9FfwMPlKTaxvmO2qpk7onfjEQEo1W+p5rzl7LuCeeNryZcS/CX0EITXrFs8T9
         FcixjsAOsz0b6bDodmhwJA5nwVk6fTiwWe9/nse6POeWsT5OafVeqKNapxZuk6JknmLX
         uC3g==
X-Gm-Message-State: AOAM532ThXVE4JJiD2Zi1/wrf6cWsLW9tLYHB8m68eYNOSg8T5AjinHm
        HdX9RnQnhi6oVX5nYhmOBNI=
X-Google-Smtp-Source: ABdhPJyJ8CjaBDVi8QuSgg8Hi79DzjlqYja79lI4wbKXMG9Va5SV6X3bYmqZBBV7h8p+x9OFFGn2tg==
X-Received: by 2002:adf:9504:: with SMTP id 4mr4343165wrs.27.1600941567261;
        Thu, 24 Sep 2020 02:59:27 -0700 (PDT)
Received: from localhost.localdomain ([170.253.60.68])
        by smtp.googlemail.com with ESMTPSA id t15sm2707961wmj.15.2020.09.24.02.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2020 02:59:26 -0700 (PDT)
From:   Alejandro Colomar <colomar.6.4.3@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     linux-man@vger.kernel.org,
        Alejandro Colomar <colomar.6.4.3@gmail.com>
Subject: [PATCH 2/2] imaxdiv_t.3: New link to system_data_types(7)
Date:   Thu, 24 Sep 2020 11:58:55 +0200
Message-Id: <20200924095854.77221-2-colomar.6.4.3@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200924095854.77221-1-colomar.6.4.3@gmail.com>
References: <20200924095854.77221-1-colomar.6.4.3@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Signed-off-by: Alejandro Colomar <colomar.6.4.3@gmail.com>
---
 man3/imaxdiv_t.3 | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 man3/imaxdiv_t.3

diff --git a/man3/imaxdiv_t.3 b/man3/imaxdiv_t.3
new file mode 100644
index 000000000..db50c0f09
--- /dev/null
+++ b/man3/imaxdiv_t.3
@@ -0,0 +1 @@
+.so man7/system_data_types.7
-- 
2.28.0

