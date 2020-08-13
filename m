Return-Path: <SRS0=jGXo=BX=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64591C433E1
	for <linux-man@archiver.kernel.org>; Thu, 13 Aug 2020 16:24:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 413C220855
	for <linux-man@archiver.kernel.org>; Thu, 13 Aug 2020 16:24:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726192AbgHMQYq (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Thu, 13 Aug 2020 12:24:46 -0400
Received: from brightrain.aerifal.cx ([216.12.86.13]:42618 "EHLO
        brightrain.aerifal.cx" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726131AbgHMQYp (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Thu, 13 Aug 2020 12:24:45 -0400
Date:   Thu, 13 Aug 2020 12:24:43 -0400
From:   Rich Felker <dalias@libc.org>
To:     "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc:     linux-man@vger.kernel.org
Subject: seccomp(2) example still uses SECCOMP_RET_KILL
Message-ID: <20200813162440.GA16696@brightrain.aerifal.cx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

I noticed while reading seccomp(2) today that the example code still
uses SECCOMP_RET_KILL. This is unsafe in a multithreaded process and
should be considered deprecated -- having a thread asynchronously
cease to exist inherently leaves the process in a permanently
inconsistent and possibly corrupt state.

The example should be updated to use SECCOMP_RET_KILL_PROCESS and a
note that SECCOMP_RET_KILL[_THREAD] is unsafe and deprecated should
probably be added as well.

Rich
