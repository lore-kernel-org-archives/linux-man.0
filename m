Return-Path: <SRS0=nt57=AT=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82D42C433E0
	for <linux-man@archiver.kernel.org>; Wed,  8 Jul 2020 19:29:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 695512065D
	for <linux-man@archiver.kernel.org>; Wed,  8 Jul 2020 19:29:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YucinVul"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726174AbgGHT37 (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Wed, 8 Jul 2020 15:29:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbgGHT35 (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Wed, 8 Jul 2020 15:29:57 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3F68C061A0B
        for <linux-man@vger.kernel.org>; Wed,  8 Jul 2020 12:29:56 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id t15so1613177pjq.5
        for <linux-man@vger.kernel.org>; Wed, 08 Jul 2020 12:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=6Puh7HkOXLJF7c2DATxGMIyEZcoXZXQIV2J/84SrIMw=;
        b=YucinVulMNchhbIAhyLmQFBAMZeCt5gHIUZoieM3zSzBn3Raha9+HcVPlhZqBhclxL
         CZwbVYeLCH96nRm/FREQ3FLOAtRr7f1pUaQfgYCP9E+RGFI/RfKFchd8qvxCxmuN2vAO
         GQGXgAVCTjr01Oz0jlu/VULq0qOgnkagJSoaY7tsUmXxShtmzWX3H7Y/XcrnlHxMAhRK
         3nSBJHhvbhM5KFYaMw7eOi13vj5HD3OJB+myMRCxKXB6E1eTYzUUxG1a6DeQWWGiJZ+A
         cD5digBmiYdAyQZ/bMRia3nKqb1ZcwY+f4BhU2NWEr5RSD0nk5+hFX3anK7kt/xRCx7F
         JUrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=6Puh7HkOXLJF7c2DATxGMIyEZcoXZXQIV2J/84SrIMw=;
        b=o9DG5gSJBhqJnxy9liO+9kbkp9lWN/giwiVaJlT8x6Qv2Qt7yymqoQ/aaHwAmqb2Kh
         9clcl+N4g2iDS1m4X2XvKVNCCBHHLDo/xAquk6bnhTCGtyxu3NHZI/aygYnroE3Zqh3d
         DYH3ysAizab4iw7Wrm9kUDkU/bJLNVcD5wY8tiWWAdxonq29lLUJz34v4nXvfKlPI+Au
         NR2ySf9kock7jT2XNGt/ABERjNM/HgHHrxsYP57c45Wc0ko+GdOTO2ibpZFwCXU/vCY0
         De0jhh7dp61VpVpIjF7ZJYKdXEa7646GiO5uch572KfMVo3yhkzpq4JdpuJ5JQFeH53p
         pN8Q==
X-Gm-Message-State: AOAM5322igtHl/MvwT3YSnAbei8FvHM8LX6iAr0yML5c18mew2NQ0VaW
        pe/iaCiACVxEy+bO61zqKwQ=
X-Google-Smtp-Source: ABdhPJyQBOnkT/Z9FdqouaF0saNVuGUn3JmdCxwulpEKrPColMyVDIj4ZmhslehAnzwf+F4+mwH5Kw==
X-Received: by 2002:a17:90a:ff16:: with SMTP id ce22mr11620331pjb.160.1594236596628;
        Wed, 08 Jul 2020 12:29:56 -0700 (PDT)
Received: from skynet-desktop.skynet ([49.207.196.160])
        by smtp.gmail.com with ESMTPSA id ml8sm299514pjb.47.2020.07.08.12.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 12:29:56 -0700 (PDT)
From:   Saikiran Madugula <hummerbliss@gmail.com>
To:     mtk.manpages@gmail.com
Cc:     linux-man@vger.kernel.org,
        Saikiran Madugula <hummerbliss@gmail.com>
Subject: [PATCH] capabilities.7: Add two more items for POSIX message queues
Date:   Thu,  9 Jul 2020 00:59:35 +0530
Message-Id: <20200708192935.18381-1-hummerbliss@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

/proc/sys/fs/mqueue/msg_max and /proc/sys/fs/mqueue/msgsize_max
also require CAP_SYS_RESOURCE

Signed-off-by: Saikiran Madugula <hummerbliss@gmail.com>
---
 man7/capabilities.7 | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/man7/capabilities.7 b/man7/capabilities.7
index fd841b4f1..adb8bad5b 100644
--- a/man7/capabilities.7
+++ b/man7/capabilities.7
@@ -722,7 +722,10 @@ to increase the capacity of a pipe above the limit specified by
 .IR /proc/sys/fs/pipe-max-size ;
 .IP *
 override
-.I /proc/sys/fs/mqueue/queues_max
+.I /proc/sys/fs/mqueue/queues_max,
+.I /proc/sys/fs/mqueue/msg_max,
+and
+.I /proc/sys/fs/mqueue/msgsize_max
 limit when creating POSIX message queues (see
 .BR mq_overview (7));
 .IP *
-- 
2.17.1

