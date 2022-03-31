Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C135BC43219
	for <linux-man@archiver.kernel.org>; Thu, 31 Mar 2022 16:35:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240039AbiCaQgx (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Thu, 31 Mar 2022 12:36:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240034AbiCaQgx (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Thu, 31 Mar 2022 12:36:53 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CECD71BBF62
        for <linux-man@vger.kernel.org>; Thu, 31 Mar 2022 09:35:05 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id a16-20020a17090a6d9000b001c7d6c1bb13so4177485pjk.4
        for <linux-man@vger.kernel.org>; Thu, 31 Mar 2022 09:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:organization:mime-version
         :content-transfer-encoding;
        bh=NIDy4E6pFmNGkxS7HNdvC8GJFBcEmy21a3pyT7BU9cM=;
        b=BfCDEB4IQNOIN4uf+69FOOpi8D5sMZne4igwqrdzvuXldjlissd4ZOheM84N8YjdyF
         yNa9ps86NsciSfRYYSLHPuvwRpjXQbxdehhz5c9RRNCMCfsgKnwTReDSXr1CNGfqNpTg
         u1HIaCY9S8qTExH2tl/Wws5MWc5TLLYOOeOSd8EfeUSAA+3Dy98HJeVw14PthO13ybSb
         MpaUtVX/tzW2T7m9yAE6jrBWxkSlkKEmDhFdjh/N8ZrmKDXd+yFBDBLmH3udNiLuZvxb
         UfXku6dNA9ra2B/CsxKE8aavwAEfHg2oZhLXFaBFuo+N+aG18Jk1gq/GBbZMCf7o3lLN
         O6xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:organization
         :mime-version:content-transfer-encoding;
        bh=NIDy4E6pFmNGkxS7HNdvC8GJFBcEmy21a3pyT7BU9cM=;
        b=n8ucNXY3tMo9e6sQVWG70ObE+TqTZdlRLDP3bn4ELWmhSnXtPI2Ix1vHe5S1+13oov
         ECG7CcEQZqENybsT7ITFpF4bo1kLwVuY/RdrgOFaachVFjjVLwyJ4R7uCpb+vlhRH7D6
         1YaqWb6HF2HfRZN4PLAhnX/aOZSYUlQISm11DCyu4ymPzG++nA7BASYxiQdX908XJP5N
         TRUrdTMSLOCOtmxNAhRjGXvImCdqO7RCN226O1gYBQTQW8cvEjAxGbO0jD8i3fEyvXrR
         BJJtWcvlV79Ve9eu7X3RSq9Dife7VExV7E0DiZOoVSH5ZPLhNSivLdveq0u44pFYit+z
         tVRg==
X-Gm-Message-State: AOAM533FQm7zffEcdcR8HEAms1grx8bqS3vUoG6KKIDP5Ki10KtM3tnQ
        +F1iC87iiAWoO5o9jqg49F8=
X-Google-Smtp-Source: ABdhPJw4GkITjzXR08HBFeJ/2gFD//EHGc8uAYYY3U3sgjN5/HzF7iUX7qCBhak9HA6gPOsv5n2JLg==
X-Received: by 2002:a17:90a:5a86:b0:1bf:7860:c0f6 with SMTP id n6-20020a17090a5a8600b001bf7860c0f6mr7049701pji.213.1648744505205;
        Thu, 31 Mar 2022 09:35:05 -0700 (PDT)
Received: from optimus ([2409:4042:2c85:97f7:745a:fd34:ba61:24bd])
        by smtp.gmail.com with ESMTPSA id n4-20020a637204000000b00398522203a2sm12837021pgc.80.2022.03.31.09.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Mar 2022 09:35:05 -0700 (PDT)
Date:   Thu, 31 Mar 2022 22:04:54 +0530
From:   Avinash Sonawane <rootkea@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     linux-man@vger.kernel.org, alx.manpages@gmail.com
Subject: Functions missing from missing_pages.html
Message-ID: <20220331220454.6474e671@optimus>
Organization: Hacker's Den
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Hello!

I just noticed that 5 C11 threads functions are missing
from "C11 Threads functions" section on "Manual pages that are missing
from Linux man-pages" page at
https://www.kernel.org/doc/man-pages/missing_pages.html

Those are: thrd_create(), thrd_current(), thrd_equal(), thrd_sleep()
and thrd_yield().

Thanks!

Regards,
Avinash Sonawane (rootKea)
https://www.rootkea.me
