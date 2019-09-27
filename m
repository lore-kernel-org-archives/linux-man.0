Return-Path: <SRS0=yH+2=XW=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BC99C4360C
	for <linux-man@archiver.kernel.org>; Fri, 27 Sep 2019 01:00:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 50CFB21D6C
	for <linux-man@archiver.kernel.org>; Fri, 27 Sep 2019 01:00:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726105AbfI0BAQ (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Thu, 26 Sep 2019 21:00:16 -0400
Received: from smtpq5.tb.mail.iss.as9143.net ([212.54.42.168]:60042 "EHLO
        smtpq5.tb.mail.iss.as9143.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725808AbfI0BAQ (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Thu, 26 Sep 2019 21:00:16 -0400
X-Greylist: delayed 977 seconds by postgrey-1.27 at vger.kernel.org; Thu, 26 Sep 2019 21:00:15 EDT
Received: from [212.54.42.118] (helo=lsmtp4.tb.mail.iss.as9143.net)
        by smtpq5.tb.mail.iss.as9143.net with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.90_1)
        (envelope-from <carlo@alinoe.com>)
        id 1iDeMW-0002f8-QK; Fri, 27 Sep 2019 02:43:56 +0200
Received: from 92-109-146-195.cable.dynamic.v4.ziggo.nl ([92.109.146.195] helo=mail9.alinoe.com)
        by lsmtp4.tb.mail.iss.as9143.net with esmtp (Exim 4.90_1)
        (envelope-from <carlo@alinoe.com>)
        id 1iDeMW-0003GP-MX; Fri, 27 Sep 2019 02:43:56 +0200
Received: from carlo by mail9.alinoe.com with local (Exim 4.90_1)
        (envelope-from <carlo@alinoe.com>)
        id 1iDeMW-0003Wa-Dv; Fri, 27 Sep 2019 02:43:56 +0200
Date:   Fri, 27 Sep 2019 02:43:56 +0200
From:   Carlo Wood <carlo@alinoe.com>
To:     mtk.manpages@gmail.com
Cc:     linux-man@vger.kernel.org
Subject: Bug man page futex(2) FUTEX_CMP_REQUEUE
Message-ID: <20190927024356.618e1122@hikaru>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: carlo@alinoe.com
X-SA-Exim-Scanned: No (on mail9.alinoe.com); SAEximRunCond expanded to false
X-SourceIP: 92.109.146.195
X-Ziggo-spambar: /
X-Ziggo-spamscore: 0.0
X-Ziggo-spamreport: CMAE Analysis: v=2.3 cv=br/4+3Si c=1 sm=1 tr=0 a=at3gEZHPcpTZPMkiLtqVSg==:17 a=kj9zAlcOel0A:10 a=J70Eh1EUuV4A:10 a=GcyzOjIWAAAA:8 a=BjFOTwK7AAAA:8 a=9eetA0UQLwoe3TrCXgEA:9 a=CjuIK1q_8ugA:10 a=jXinXE1SwkIA:10 a=hQL3dl6oAZ8NdCsdz28n:22 a=N3Up1mgHhB-0MyeZKEz1:22
X-Ziggo-Spam-Status: No
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Man page http://man7.org/linux/man-pages/man2/futex.2.html
states for FUTEX_CMP_REQUEUE

              Typical values to specify for val are 0 or 1.

How is a value of 0 useful?

              (Specifying
              INT_MAX is not useful, because it would make the
              FUTEX_CMP_REQUEUE operation equivalent to FUTEX_WAKE.)

This is incorrect because FUTEX_WAKE doesn't have the expected (val3)
parameter.

Same for the remark that follows this statement after "The
              limit value specified via val2 is typically either 1 or
              INT_MAX.":

              (Specifying the argument as 0 is not useful, because
              it would make the FUTEX_CMP_REQUEUE operation equivalent
              to FUTEX_WAIT.)


-- 
Carlo Wood <carlo@alinoe.com>
