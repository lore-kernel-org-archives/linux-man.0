Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F13EFC63703
	for <linux-man@archiver.kernel.org>; Sat,  3 Dec 2022 20:23:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229481AbiLCUXZ (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sat, 3 Dec 2022 15:23:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229852AbiLCUXX (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sat, 3 Dec 2022 15:23:23 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEAAE186E4;
        Sat,  3 Dec 2022 12:23:22 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id y16so12966558wrm.2;
        Sat, 03 Dec 2022 12:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p6ya6znZ96V95551lKZLSiEtPK8TPi1T5K+8D6GKx50=;
        b=nsqU5A7Mp6JGIW59rSMPPQzAYQq0MHbMb1GFw3dBZsTM1eLNgJ45TeQQ8WMepH9MF7
         jEE8VAvc86jmIwQ7N4kuXRrViC6mcgvTmwPDlZXe8aA6UlgBCncOnaxA59WRX9UMqOqG
         MeFF9ivo6XSOFef7ehxNeVqOOQ13/h5Cv9YMgraSg4+Nl67gDVozSrN53LXJZiifKDHp
         TsEvxWSibgR9MQBtuwlPBjgYEsyqPzTKzVMrBhWx/0gen1IwP1/Sl2thGTFNJt0rthPy
         16TZAMWx5sOmNLJgCDOmf+4hd4+VN357o3LIAK6dAbkZyYWg3i4iRH/f3Rz5ZjBNEb8G
         o4og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p6ya6znZ96V95551lKZLSiEtPK8TPi1T5K+8D6GKx50=;
        b=tTS3yb4NyZnrOtYQ+JvdEmwD1yj1ZyIfAgkcitbRMRMo4Zjh7wLbbL19t2xWdSyOQt
         Z3wsmvKR0p/2zU0F4w9fpxCm2I2zEDMBKVBcGVLUfXzWr3AXBWkc+xdJDpBu1UkzH4c1
         qW2Vjf+kFls9kw7J6s6B1g0HURtR+fXpKVpuj/5B9mCKBrbsB+5CNBArXsHn4UtA/4yJ
         pmna9uKIGbFSDtv1YjF1ptEfdX21FPTdP7rEPmjgVwdXEI1qYm1r+7mRK8FPZm2ymDzA
         SgcuLMGUaLg6Na36aT8DrKE5+l1uJgD+BONl2nYoy9awnUThtPJu+ZsNOvKzzzwexCpj
         Zg1Q==
X-Gm-Message-State: ANoB5pktRh1b9YNCJFuPEvYRWoW7wLfo5rS7gOOFLh5G7B/LY6ImmThI
        7HBIEYmmT5QRtRX0hi1iATgc4Lhug04=
X-Google-Smtp-Source: AA0mqf5+sLRYm3EkCrGxceC/1ml5sj7EXWTC2lZ/bgWkboIzb7C022Kzz2fwvo1Ae96X/mdEmeDMIQ==
X-Received: by 2002:a5d:4741:0:b0:242:140d:43be with SMTP id o1-20020a5d4741000000b00242140d43bemr18909445wrs.623.1670099001519;
        Sat, 03 Dec 2022 12:23:21 -0800 (PST)
Received: from asus5775.alejandro-colomar.es ([170.253.36.171])
        by smtp.googlemail.com with ESMTPSA id p17-20020a5d68d1000000b002420cfcd13dsm10064481wrw.105.2022.12.03.12.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Dec 2022 12:23:21 -0800 (PST)
From:   Alejandro Colomar <alx.manpages@gmail.com>
X-Google-Original-From: Alejandro Colomar <alx@kernel.org>
To:     linux-man@vger.kernel.org
Cc:     Alejandro Colomar <alx@kernel.org>, libc-alpha@sourceware.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 02/41] acct.2: SYNOPSIS: Add _Nullable
Date:   Sat,  3 Dec 2022 21:22:38 +0100
Message-Id: <20221203202317.252789-3-alx@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221203202317.252789-1-alx@kernel.org>
References: <20221203202317.252789-1-alx@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Signed-off-by: Alejandro Colomar <alx@kernel.org>
---
 man2/acct.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/acct.2 b/man2/acct.2
index 1a676b7c7..f9fc1cd5c 100644
--- a/man2/acct.2
+++ b/man2/acct.2
@@ -19,7 +19,7 @@ .SH SYNOPSIS
 .nf
 .B #include <unistd.h>
 .PP
-.BI "int acct(const char *" filename );
+.BI "int acct(const char *_Nullable " filename );
 .fi
 .PP
 .RS -4
-- 
2.38.1

