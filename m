Return-Path: <SRS0=WRlO=A4=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62239C433E4
	for <linux-man@archiver.kernel.org>; Fri, 17 Jul 2020 08:14:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4085620737
	for <linux-man@archiver.kernel.org>; Fri, 17 Jul 2020 08:14:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UNYqfqD2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728235AbgGQIOg (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Fri, 17 Jul 2020 04:14:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726240AbgGQIOg (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Fri, 17 Jul 2020 04:14:36 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01A59C061755
        for <linux-man@vger.kernel.org>; Fri, 17 Jul 2020 01:14:36 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id q15so13759705wmj.2
        for <linux-man@vger.kernel.org>; Fri, 17 Jul 2020 01:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=cc:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Rmc0G3O2DspQbd7hyYWFkbqoyG9H9j3obLtHIngva+Q=;
        b=UNYqfqD2jThIRzQI+Ulp82UJSS/VMymZ/AqFNhuBzb3/UwIl5hGTa6qhZDdkoIlUnq
         iluTdkclUiwKJah7MRfBOrd7m2Qory6HZbt2hz13ps0p0RtW5e5f/5cH7xVgYzKjCET7
         j6Za1xPjP0IXxrs4fLuR3sbmX+A7l/fHvqnPYuvSV+Bb67li3XSYu4e05AkBryKTg5rV
         A0VtTAucKh8fzcAcXHazdF0XzbknopMEpQ7N9oobEh+nVhuOxFziGrKA+O9mVyfJpl45
         YcTJ69upR7VYXghO/xAI5UGlGOyN1wjapIM62fyhhfRdQzdxaS9z6386GlMCLh+AqPJ9
         Qxxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:cc:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Rmc0G3O2DspQbd7hyYWFkbqoyG9H9j3obLtHIngva+Q=;
        b=CriBq22JRtZ0a+eKp6YoQJs/EQcOVd88iJLNtXJqbGzxMI7s6BRt92RijuJDeg3124
         ZgXumv6TbwYMGBW4vGPQdSB4by6zgwkTXFXc1Ih3T5fchGR2FDxch11OJA5cWBZeeEk+
         tVHcFDT0FbaXJ0e04zyMwCXsfUbc1ijsNT7wbq6asnIGa15Zv2Za1DK8mVoRdcs1NKw5
         fV/FtPGZXmoqzg0vrWYUjQbY7WrShwjy+3Xa/JM0Povgjh/UXKzMIqY2JYIo7sTPdCh2
         V3iUwp9Hq1MN7menHNLlmRmkNiwWz8V1KHeTDScUccnhTO30uGpl+8PCxYRw4QcUfn4y
         5dJg==
X-Gm-Message-State: AOAM530sgit1atOl6dj7EohW2hCna4/YLDKhe4jY3RyKXfE7/mokwt4L
        R5MIDLcOYcw2EbRb6G0KwAU=
X-Google-Smtp-Source: ABdhPJz5Xx9ApbEgbRkvtvugM+qJEJ2sDsAFGZofvz6lPh4CnNgJV0K23i+OlXMfogd8ziBciXlsfA==
X-Received: by 2002:a1c:bc8a:: with SMTP id m132mr7769292wmf.1.1594973674749;
        Fri, 17 Jul 2020 01:14:34 -0700 (PDT)
Received: from ?IPv6:2001:a61:3adb:8201:9649:88f:51f8:6a21? ([2001:a61:3adb:8201:9649:88f:51f8:6a21])
        by smtp.gmail.com with ESMTPSA id y16sm13255655wro.71.2020.07.17.01.14.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2020 01:14:34 -0700 (PDT)
Cc:     mtk.manpages@gmail.com, linux-man@vger.kernel.org,
        cluster-devel@redhat.com
Subject: Re: [PATCH] lseek.2: List gfs2 support for SEEK_HOLE/SEEK_DATA
To:     Andrew Price <anprice@redhat.com>
References: <20200709130317.582038-1-anprice@redhat.com>
From:   "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Message-ID: <d57b1028-21e5-f573-6f66-0a53748d1be0@gmail.com>
Date:   Fri, 17 Jul 2020 10:14:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200709130317.582038-1-anprice@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

On 7/9/20 3:03 PM, Andrew Price wrote:
> Signed-off-by: Andrew Price <anprice@redhat.com>

Thanks, Andrew. Patch applied.

Cheers,

Michael

> ---
>  man2/lseek.2 | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/man2/lseek.2 b/man2/lseek.2
> index a20b10431..22de446fc 100644
> --- a/man2/lseek.2
> +++ b/man2/lseek.2
> @@ -182,6 +182,9 @@ NFS (since Linux 3.18)
>  .IP *
>  FUSE (since Linux 4.5)
>  .\" commit 0b5da8db145bfd44266ac964a2636a0cf8d7c286
> +.IP *
> +GFS2 (since Linux 4.15)
> +.\" commit 3a27411cb4bc3ce31db228e3569ad01b462a4310
>  .SH RETURN VALUE
>  Upon successful completion,
>  .BR lseek ()
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
