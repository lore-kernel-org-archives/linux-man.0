Return-Path: <SRS0=F1MC=WW=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FE4EC3A59F
	for <linux-man@archiver.kernel.org>; Mon, 26 Aug 2019 21:45:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5FFC5217F5
	for <linux-man@archiver.kernel.org>; Mon, 26 Aug 2019 21:45:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ujPDXs47"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726182AbfHZVp4 (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 26 Aug 2019 17:45:56 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:53264 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725817AbfHZVp4 (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Mon, 26 Aug 2019 17:45:56 -0400
Received: by mail-wm1-f66.google.com with SMTP id 10so925564wmp.3
        for <linux-man@vger.kernel.org>; Mon, 26 Aug 2019 14:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=cc:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fD36GSL7IL4qm5owkRH+6PIjM0eOpqH7eNU7Qa4hmYc=;
        b=ujPDXs47A3aIaE5b3M84s+q49iiJGIBx8oel1Uoyeb/BAa1S/7Ew1Mr3+xNcw541Vu
         mSj2vGKORwfAV5oBpzD5sGOOt1h6G3uMdb4svd8NEGtdUPwt4ak8dW99qIccshGYMwu+
         o1ctxVlJpIdMrXN6Mkj8nAdw/AZmhYbYtMRNnwGKIiI0GbhNP7RtIevLj876c2FkQA9N
         2CUmdg3s80pRAMZUhGW9OBF6k171GHvIG8GztuxrnxfyhKL5MYVMR/iEHpdkuj3VNEMs
         RLWKmavxrqMlvc2CcypSx/dqktCaGkxj0cs21/E3e10Nc0BNEhEZPLW6TQkvOXb8brfh
         nMhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:cc:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fD36GSL7IL4qm5owkRH+6PIjM0eOpqH7eNU7Qa4hmYc=;
        b=FcAfzItvzaGEoG51eDAYlHVT+wgsFa9NiZyd4KI9nM+hshW9eIS/yyrFYpG6ugXHeG
         7sj61B9kkbK+UVYrBO+Rv+DuFuwpCOAHKMfyeZEO9r+0aUGqvFzGv6UyaYwwQqqpIyTM
         05Y4YgyeKx7VU+kYuaOBzFlzBorwJ7/0cPDjJqZKPWzcW4ix+5GpRJAX23/V06ht4ojq
         2BWGvXC47mmoX+ksnE6DCyKnLWna647eJSdAMWa4HL3jmJKjiztRx1ZKFSpJYVVyIVn7
         DVAChQuGFvFAsMatP6ECbq3LGIIzsj1qzUOf3et8Qr26eZnOKtzoijUNwG/DJl/ltbNA
         dTdQ==
X-Gm-Message-State: APjAAAV/derbENk5NIwedOKMDdEbEpypgxjc9GJVu8MFcKNGpiTjVYGv
        2Z9nJjcqt36Oe1B4weRj59j0zbXx
X-Google-Smtp-Source: APXvYqxzv45bwTpUTcs2vhk0+/+h6KM2n91U4iX5DlNvjmcc5Gpm5t/5nKF52RRNV3T+T1bf5CFS5Q==
X-Received: by 2002:a1c:3944:: with SMTP id g65mr24988775wma.68.1566855954527;
        Mon, 26 Aug 2019 14:45:54 -0700 (PDT)
Received: from ?IPv6:2001:a61:257e:2f01:31ee:f41e:c688:df4? ([2001:a61:257e:2f01:31ee:f41e:c688:df4])
        by smtp.gmail.com with ESMTPSA id a19sm39824091wra.2.2019.08.26.14.45.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2019 14:45:54 -0700 (PDT)
Cc:     mtk.manpages@gmail.com, linux-man@vger.kernel.org,
        Kevin.Barnett@microchip.com, scott.teel@microchip.com,
        Justin.Lindley@microchip.com, scott.benesh@microchip.com,
        bader.alisaleh@microchip.com, gerry.morong@microchip.com,
        mahesh.rajashekhara@microchip.com,
        Gilbert Wu <gilbert.wu@microsemi.com>
Subject: Re: [PATCH V3 3/5] smartpqi: add module param expose ld first
To:     Don Brace <don.brace@microsemi.com>
References: <156683390892.32298.878243674084910282.stgit@brunhilda>
 <156683409930.32298.9345147165757445811.stgit@brunhilda>
From:   "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Message-ID: <e1624e83-8c7d-49e6-2a10-a57f2511d729@gmail.com>
Date:   Mon, 26 Aug 2019 23:45:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <156683409930.32298.9345147165757445811.stgit@brunhilda>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Hello Don

Patch applied. But a question below.

On 8/26/19 5:41 PM, Don Brace wrote:
> From: Gilbert Wu <gilbert.wu@microsemi.com>
> 
> Reviewed-by: Matt Perricone <matt.perricone@microsemi.com>
> Reviewed-by: Scott Benesh <scott.benesh@microsemi.com>
> Reviewed-by: Kevin Barnett <kevin.barnett@microsemi.com>
> Signed-off-by: Gilbert Wu <gilbert.wu@microsemi.com>
> Signed-off-by: Don Brace <don.brace@microsemi.com>
> ---
>  man4/smartpqi.4 |    5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/man4/smartpqi.4 b/man4/smartpqi.4
> index dc9ef1020..5389b8453 100644
> --- a/man4/smartpqi.4
> +++ b/man4/smartpqi.4
> @@ -15,6 +15,7 @@ smartpqi \- Microsemi Smart Family SCSI driver
>  .RB [ disable_heartbeat= { 0 | 1 }]
>  .RB [ disable_ctrl_shutdown= { 0 | 1 }]
>  .RB [ lockup_action= { none | reboot | panic }]
> +.RB [ expose_ld_first= { 0 | 1 }]
>  .YS
>  .SH DESCRIPTION
>  .B smartpqi
> @@ -91,6 +92,10 @@ parameter	action
>  \fBreboot\fP	reboot the system
>  \fBpanic\fP	panic the system
>  .TE
> +.TP
> +.BR expose_ld_first= { 0 | 1 }
> +This option enables support for exposing logical devices to OS before physical devices.

Should "OS' instead be "the operating system"?

> +The default value is 0.
>  .SH FILES
>  .SS Device nodes
>  Logical drives are accessed via the SCSI disk driver

Thanks,

Michael



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
