Return-Path: <SRS0=3wPr=23=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E814FC32767
	for <linux-man@archiver.kernel.org>; Mon,  6 Jan 2020 06:16:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BC498215A4
	for <linux-man@archiver.kernel.org>; Mon,  6 Jan 2020 06:16:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726695AbgAFGQe (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 6 Jan 2020 01:16:34 -0500
Received: from mail.cn.fujitsu.com ([183.91.158.132]:41022 "EHLO
        heian.cn.fujitsu.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726338AbgAFGQe (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Mon, 6 Jan 2020 01:16:34 -0500
X-IronPort-AV: E=Sophos;i="5.69,401,1571673600"; 
   d="scan'208";a="81340927"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 06 Jan 2020 14:16:31 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
        by cn.fujitsu.com (Postfix) with ESMTP id 394B04CE20E1;
        Mon,  6 Jan 2020 14:07:29 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Mon, 6 Jan 2020 14:16:27 +0800
Subject: Re: [PATCH] userfaultfd.2: add EPERM error
To:     <mtk.manpages@gmail.com>
CC:     <linux-man@vger.kernel.org>
References: <1576649587-20008-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
From:   Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <27c9ce8e-c9da-967b-f354-35c2b9978252@cn.fujitsu.com>
Date:   Mon, 6 Jan 2020 14:16:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <1576649587-20008-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 394B04CE20E1.ABBAD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Hi
Ping.
> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> ---
>   man2/userfaultfd.2 | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/man2/userfaultfd.2 b/man2/userfaultfd.2
> index 8d0a66ed9..2b432f043 100644
> --- a/man2/userfaultfd.2
> +++ b/man2/userfaultfd.2
> @@ -440,6 +440,11 @@ reached.
>   .TP
>   .B ENOMEM
>   Insufficient kernel memory was available.
> +.TP
> +.B EPERM
> +Unprivileged user(without SYS_CAP_PTRACE capability) uses this call when
> +set unprivileged_userfaultfd to 0. It was introduced since Linux 5.2.
> +.\" cefdca0a86be517bc390fc4541e3674b8e7803b0
>   .SH VERSIONS
>   The
>   .BR userfaultfd ()
> 


