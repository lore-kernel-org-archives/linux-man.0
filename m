Return-Path: <SRS0=TgrO=D6=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30F3EC5517A
	for <linux-man@archiver.kernel.org>; Fri, 23 Oct 2020 14:58:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BAE1E2085B
	for <linux-man@archiver.kernel.org>; Fri, 23 Oct 2020 14:58:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iNhlwyzE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S461349AbgJWO6b (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Fri, 23 Oct 2020 10:58:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S461220AbgJWO6b (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Fri, 23 Oct 2020 10:58:31 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05473C0613CE
        for <linux-man@vger.kernel.org>; Fri, 23 Oct 2020 07:58:31 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id c16so1957366wmd.2
        for <linux-man@vger.kernel.org>; Fri, 23 Oct 2020 07:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sYFzSQVDqRsskAf3tDWckAwmMx1ZucpWZy+IsUAmVbk=;
        b=iNhlwyzEOBnuOOyX59p6CHMwc0GOBDKvXeHYKuXRI1Yo+ZDs8tf0rxlrjRTEIzl/hH
         HA2juPq1Axw6LTovrecX9HKXdPEDcpbeg7zlgxtIsbnvHmJ4PaZJxViy8Q1B8yGWMCcv
         yISleLSy2olNiO9yJeXv9HSpI8AsESoVzbt6jxM5IKyPOIBkboYj9KTUUEGbZt1LWSgH
         sZh6hwOGtZ67Dn0JhgpLHcjY+9eylpnvZ5uFlXfXEJUrY3gW2DQSwqNMHMXsVVdV/zOt
         1Nrvp2CHj8ADBTOwvPp5QbYkworKCeX1zWHUkBuqwQEUP4rfKIHi89npc6ZABWk1wTSe
         0bzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sYFzSQVDqRsskAf3tDWckAwmMx1ZucpWZy+IsUAmVbk=;
        b=OcZWXVgm27A0QrLKkH8i6+gl+jT1Hu8g7z9A03szY6YUMJAV5D5vPZmTGIeufspI2k
         60C8zNu1yqseK8OWwalexlDzVMHYkShr4V3RLDsXqkOA1FjJ/1W3Z1ytlq7vHgmt/5UG
         KhYSW0ZAv3ua28jwjqUenOVp7TBPKHje+gO2Ni+E8oDTiWNgWfR7Cf0LsTEG1+guyHpM
         bZiXwdr0/eJwZiWxrkYAshL/10cPVcx7YcsXvkALgY71J7JgGXApXpC+CSP/KHdZKnGg
         q38p8uD8PTGf6USaIaUDasNwKR5DCb/8MjHd9v+bEU+HCzu09d51WEsvAznIo7dZgY+t
         2ahw==
X-Gm-Message-State: AOAM532PlswpscPuTIgV3oFCTq5u6hRI25Oei1qgzzleKyO/1PCZJbnI
        VZsvl+3Y5H4BuBCwdpHrb78zQITqpF0=
X-Google-Smtp-Source: ABdhPJysRQQsppCtPQgxVI9ULt0KFn37as3LC3ZZh8dOuw1b264dXGe6ONWD6ZTJherNOj7EBk4Aig==
X-Received: by 2002:a1c:7d49:: with SMTP id y70mr2735901wmc.103.1603465109776;
        Fri, 23 Oct 2020 07:58:29 -0700 (PDT)
Received: from localhost.localdomain ([170.253.60.68])
        by smtp.googlemail.com with ESMTPSA id m8sm3755268wrw.17.2020.10.23.07.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 07:58:28 -0700 (PDT)
From:   Alejandro Colomar <colomar.6.4.3@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     Alejandro Colomar <colomar.6.4.3@gmail.com>,
        linux-man@vger.kernel.org, libc-alpha@sourceware.org
Subject: [PATCH 02/11] circleq.3, queue.3: NAME: Move code from queue-3 to circleq.3
Date:   Fri, 23 Oct 2020 16:57:28 +0200
Message-Id: <20201023145736.102750-3-colomar.6.4.3@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201023145736.102750-1-colomar.6.4.3@gmail.com>
References: <20201023145736.102750-1-colomar.6.4.3@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Signed-off-by: Alejandro Colomar <colomar.6.4.3@gmail.com>
---
 man3/circleq.3 | 18 ++++++++++++++++++
 man3/queue.3   | 18 ------------------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/man3/circleq.3 b/man3/circleq.3
index 39920948a..bb024d697 100644
--- a/man3/circleq.3
+++ b/man3/circleq.3
@@ -31,6 +31,24 @@
 .\"
 .TH CIRCLEQ 3 2020-10-21 "GNU" "Linux Programmer's Manual"
 .SH NAME
+.Nm CIRCLEQ_EMPTY ,
+.Nm CIRCLEQ_ENTRY ,
+.Nm CIRCLEQ_FIRST ,
+.Nm CIRCLEQ_FOREACH ,
+.Nm CIRCLEQ_FOREACH_REVERSE ,
+.Nm CIRCLEQ_HEAD ,
+.Nm CIRCLEQ_HEAD_INITIALIZER ,
+.Nm CIRCLEQ_INIT ,
+.Nm CIRCLEQ_INSERT_AFTER ,
+.Nm CIRCLEQ_INSERT_BEFORE ,
+.Nm CIRCLEQ_INSERT_HEAD ,
+.Nm CIRCLEQ_INSERT_TAIL ,
+.Nm CIRCLEQ_LAST ,
+.Nm CIRCLEQ_LOOP_NEXT ,
+.Nm CIRCLEQ_LOOP_PREV ,
+.Nm CIRCLEQ_NEXT ,
+.Nm CIRCLEQ_PREV ,
+.Nm CIRCLEQ_REMOVE
 .SH SYNOPSIS
 .SH DESCRIPTION
 .SH RETURN VALUE
diff --git a/man3/queue.3 b/man3/queue.3
index 36432718d..1b68275d5 100644
--- a/man3/queue.3
+++ b/man3/queue.3
@@ -78,24 +78,6 @@
 .Nm TAILQ_PREV ,
 .Nm TAILQ_REMOVE ,
 .\" .Nm TAILQ_SWAP ,
-.Nm CIRCLEQ_EMPTY ,
-.Nm CIRCLEQ_ENTRY ,
-.Nm CIRCLEQ_FIRST ,
-.Nm CIRCLEQ_FOREACH ,
-.Nm CIRCLEQ_FOREACH_REVERSE ,
-.Nm CIRCLEQ_HEAD ,
-.Nm CIRCLEQ_HEAD_INITIALIZER ,
-.Nm CIRCLEQ_INIT ,
-.Nm CIRCLEQ_INSERT_AFTER ,
-.Nm CIRCLEQ_INSERT_BEFORE ,
-.Nm CIRCLEQ_INSERT_HEAD ,
-.Nm CIRCLEQ_INSERT_TAIL ,
-.Nm CIRCLEQ_LAST ,
-.Nm CIRCLEQ_LOOP_NEXT ,
-.Nm CIRCLEQ_LOOP_PREV ,
-.Nm CIRCLEQ_NEXT ,
-.Nm CIRCLEQ_PREV ,
-.Nm CIRCLEQ_REMOVE
 .Nd implementations of singly-linked lists, singly-linked tail queues,
 lists, tail queues, and circular queues
 .Sh SYNOPSIS
-- 
2.28.0

