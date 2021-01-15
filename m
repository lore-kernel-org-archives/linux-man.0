Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88A53C433DB
	for <linux-man@archiver.kernel.org>; Fri, 15 Jan 2021 15:35:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 569112313E
	for <linux-man@archiver.kernel.org>; Fri, 15 Jan 2021 15:35:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731111AbhAOPfo (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Fri, 15 Jan 2021 10:35:44 -0500
Received: from mx2.suse.de ([195.135.220.15]:60080 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729384AbhAOPfo (ORCPT <rfc822;linux-man@vger.kernel.org>);
        Fri, 15 Jan 2021 10:35:44 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id C98FCAC24;
        Fri, 15 Jan 2021 15:35:02 +0000 (UTC)
To:     mtk.manpages@gmail.com
Cc:     linux-man@vger.kernel.org
From:   Martin Doucha <mdoucha@suse.cz>
Subject: semctl(2): data type for SEM_STAT_ANY
Message-ID: <14010457-560b-5c2f-d840-782be5f0aeb8@suse.cz>
Date:   Fri, 15 Jan 2021 16:35:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Hello,
there's a minor error in the semctl(2) man page, the correct data type
for SEM_STAT_ANY return buffer is "struct semid_ds" because the kernel
code path is the same as for IPC_STAT and SEM_STAT:

https://github.com/torvalds/linux/blob/5ee88057889bbca5f5bb96031b62b3756b33e164/ipc/sem.c#L1789

The man page currently says that the data type for IPC_STAT and SEM_STAT
is "struct semid_ds" (correct) but then it says the data type for
SEM_STAT_ANY is "struct seminfo" (wrong).

https://man7.org/linux/man-pages/man2/semctl.2.html

-- 
Martin Doucha   mdoucha@suse.cz
QA Engineer for Software Maintenance
SUSE LINUX, s.r.o.
CORSO IIa
Krizikova 148/34
186 00 Prague 8
Czech Republic
