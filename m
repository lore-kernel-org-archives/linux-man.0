Return-Path: <SRS0=Zlmw=CW=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9062BC43461
	for <linux-man@archiver.kernel.org>; Sun, 13 Sep 2020 18:30:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 50E5620663
	for <linux-man@archiver.kernel.org>; Sun, 13 Sep 2020 18:30:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LKC0s5+H"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725936AbgIMSam (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sun, 13 Sep 2020 14:30:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725938AbgIMSak (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sun, 13 Sep 2020 14:30:40 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0178C06174A
        for <linux-man@vger.kernel.org>; Sun, 13 Sep 2020 11:30:39 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id b17so4217262pji.1
        for <linux-man@vger.kernel.org>; Sun, 13 Sep 2020 11:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=NPM268/7ZOp7pHCF1TMxDH+fnOrZEIgVbpSBG2fRDAI=;
        b=LKC0s5+H37Y+2XaoAyZdv+DVcHAjlEK5PialRNb7vAQjpY2qzSpXHquBKNwKJD/RHr
         bkaNGUvUDpuVuxUugWmwlj78/56Vq9NyvL8DpNQD9bZsldcjMPTaUsOfTLs0MerXOlp+
         3Dlz0Dgz6pw32d4uMf1mZyzdsUk0/Jsi0H83qXAWOKq1x6ted24oKVlVj+gMh5NqHxVL
         jBCTC4o5Eb9L95Pn16ECiTawel1zX47DfS+3Zy3zeIetMs0OYgCFLQTewfkShzezvgj/
         /g1KcpsjNuknq0Ubof9b7BJiHVKMyrQnBqyPojH+O35BKkggeWP4+dkWqLL1wYUmNZq2
         AFfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=NPM268/7ZOp7pHCF1TMxDH+fnOrZEIgVbpSBG2fRDAI=;
        b=syLehltFsIrZyQ2evJI3kilTgD1YDWGVAMciz6Lba0J4/DLYRBW3eO0FhTon5kpdrE
         EUbS6yfmP5/CLf+zMQq3d56vwYAEtbIr2fW4AUUBNn96/VztxmZCjTcrai4vKFr4RITq
         W9X4ohKFsIB92fQwmDWRhENcC8xXVeJl06Z8WzJTkF2E1Fw4rGBPaDmi10dQ8TNKlD9C
         G1sGm/bE0pkLX+5OAUDETbOYbTdCoQXAueYvlXasXdcETwJAdxOPOfRofnrsJplcqoTu
         cqG+K6MfnRtpom1vpMtpTgrSFxGRE+rj3uiu1dFZOsw4BN835iB+ATOSQNuvrauropCB
         CAMQ==
X-Gm-Message-State: AOAM5321z9W2r4cUWZX52DjP3FmU4sjQP8EHfuasHa/PKBRyGMgvDN5w
        BbUjCSzseEgXamgCpjvO4PEKuAOnlwk=
X-Google-Smtp-Source: ABdhPJyguTdpvpm5eCK36J+jokc36lH6YHR+XpY5Pd+QG5FDuRwOMzXqd8AyB9k6Tg+HBG5w0q4MgA==
X-Received: by 2002:a17:90b:611:: with SMTP id gb17mr10597583pjb.71.1600021839419;
        Sun, 13 Sep 2020 11:30:39 -0700 (PDT)
Received: from sc-xterm-41.nvidia.com. (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.googlemail.com with ESMTPSA id k35sm6534450pgb.39.2020.09.13.11.30.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 13 Sep 2020 11:30:38 -0700 (PDT)
From:   Konstantin Bukin <kbukin@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     Konstantin Bukin <kbukin@gmail.com>, linux-man@vger.kernel.org
Subject: [PATCH] stat.2: fixed inode printing in example program
Date:   Sun, 13 Sep 2020 11:29:49 -0700
Message-Id: <20200913182949.29815-1-kbukin@gmail.com>
X-Mailer: git-send-email 2.17.0
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

inode numbers are expected to be positive. Casting them to a signed type
may result in printing negative values. E.g. running example program on
the following file:

$ ls -li test.txt
9280843260537405888 -r--r--r-- 1 kbukin hardware 300 Jul 21 06:36 test.txt

resutls in the following output:

$ ./example test.txt
ID of containing device:  [0,480]
File type:                regular file
I-node number:            -9165900813172145728
Mode:                     100444 (octal)
Link count:               1
Ownership:                UID=2743   GID=30
Preferred I/O block size: 32768 bytes
File size:                300 bytes
Blocks allocated:         8
Last status change:       Tue Jul 21 06:36:50 2020
Last file access:         Sat Sep 12 14:13:38 2020
Last file modification:   Tue Jul 21 06:36:50 2020

Such erroneous reporting happens for inode values greater than maximum
value which can be stored in signed long. Casting does not seem to be
necessary here. Printing inode as unsigned long long fixes the issue.
---
 man2/stat.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/stat.2 b/man2/stat.2
index 7e5417480..89990e581 100644
--- a/man2/stat.2
+++ b/man2/stat.2
@@ -681,7 +681,7 @@ main(int argc, char *argv[])
     default:       printf("unknown?\en");                break;
     }
 
-    printf("I\-node number:            %ld\en", (long) sb.st_ino);
+    printf("I\-node number:            %llu\en", sb.st_ino);
 
     printf("Mode:                     %lo (octal)\en",
             (unsigned long) sb.st_mode);
-- 
2.17.0

