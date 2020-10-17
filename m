Return-Path: <SRS0=eBIi=DY=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8EA9C433DF
	for <linux-man@archiver.kernel.org>; Sat, 17 Oct 2020 10:25:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9E0AB20714
	for <linux-man@archiver.kernel.org>; Sat, 17 Oct 2020 10:25:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EjP/ST/g"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437222AbgJQKZZ (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sat, 17 Oct 2020 06:25:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437221AbgJQKZY (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sat, 17 Oct 2020 06:25:24 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 536E2C061755
        for <linux-man@vger.kernel.org>; Sat, 17 Oct 2020 03:25:24 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id d81so5799134wmc.1
        for <linux-man@vger.kernel.org>; Sat, 17 Oct 2020 03:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=cc:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=D3io6yMvlEpvtbRLr9kZx2vIlOvSteAgaJsFMcNeWss=;
        b=EjP/ST/gTPzMjaGO3bdbq3sJMDJa/gFIQTsUKMsfQkrYAOE7dzrOcdTe2QCaiMfOA3
         S9juRjIXlMFP3svwyljr8PTzJazuQZby8MPPG6TLaY8IHK/OWpsI9DQISj9iwWqKFXoq
         ibfKHTiyP/H8DjOMXKKBtbLaKEEA3omGZ7bTUMeaMXod8LiHwHkjwm7OeK/sBjaPI+GM
         b5YhNjk8hgEEc4IAF7XOxzq4yhP19JckJ3Dz7R8u/9vQx9/GX+F3yvAPzEP46kVX8Mr0
         C3/Nin4ldaoUlrSrtc0oYnEpx5oKBEuSBhHEzwlF7ZnDgTx0baBZOyyHiolzCJ2J6I/E
         4npA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:cc:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=D3io6yMvlEpvtbRLr9kZx2vIlOvSteAgaJsFMcNeWss=;
        b=TSTTT/94ZAhP7sF8GW1f6P6fS0aOiJK1jKWfvW3HMnEys7ZwCkrMC3c6MsPR8GSRBV
         KvXkGIzJ7ldF7qCdwP7w8YlVj9YFi4Jq8pnRTbxhBy3NWvjsdITkPjBgIwZuyk1wFMv7
         lgBK9REvQ1V5Tmted4CnMDqhvsOU0GoyJ+/i8aTxc7HsjHdHFI67/0amURJZGh32Z2Dp
         HfyarPN8aMJTnYm2b7LuOXyJxxrO1mMe1+m5ejzNxZBNzm+iwaAHvzuFTPklpkoQ8iET
         PyaRcHaUKBcjwmsmJwxYByM7tjyK5Dac8AvOsNyOK2r829y3Vs5WC+lxKYNPTIpj720z
         dG2A==
X-Gm-Message-State: AOAM5327Nx6TnRvnfYN9CEW5u8chEnxwUlnWCvlBK0XWF8ERsBsz2+36
        Ec6QABRPIpWHNGzAHD2SHMQ=
X-Google-Smtp-Source: ABdhPJwinlxthsSVJz2JBMMgRn6t1PlT1ReD+QYJ0Ao+P5+JaMeVIOEFaghyCRkYuIHCpiVmwCimfg==
X-Received: by 2002:a1c:dfd4:: with SMTP id w203mr7836712wmg.178.1602930322762;
        Sat, 17 Oct 2020 03:25:22 -0700 (PDT)
Received: from [192.168.1.10] (static-176-175-73-29.ftth.abo.bbox.fr. [176.175.73.29])
        by smtp.gmail.com with ESMTPSA id 24sm6515614wmg.8.2020.10.17.03.25.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2020 03:25:22 -0700 (PDT)
Cc:     mtk.manpages@gmail.com, linux-man <linux-man@vger.kernel.org>,
        Matthew Garrett <mjg59@google.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        David Howells <dhowells@redhat.com>
Subject: Re: [PATCH 1/1] kernel_lockdown.7: describe LSM activation
To:     Heinrich Schuchardt <xypron.glpk@gmx.de>
References: <20201016190337.5126-1-xypron.glpk@gmx.de>
From:   "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Message-ID: <e10078ef-c485-a82a-5bb4-9efac98daea2@gmail.com>
Date:   Sat, 17 Oct 2020 12:25:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201016190337.5126-1-xypron.glpk@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

On 10/16/20 9:03 PM, Heinrich Schuchardt wrote:
> Describe the activation of the Kernel Lockdown feature via Kconfig and the
> command line.
> 
> Cf. Documentation/admin-guide/kernel-parameters.rst.
> 
> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>

Thanks, Heinrich. Patch applied.

Cheers,

Michael

> ---
>  man7/kernel_lockdown.7 | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/man7/kernel_lockdown.7 b/man7/kernel_lockdown.7
> index 04de4d1fe..5aedd96e9 100644
> --- a/man7/kernel_lockdown.7
> +++ b/man7/kernel_lockdown.7
> @@ -104,4 +104,17 @@ whether or not they are specified on the command line,
>  for both the built-in and custom policies in secure boot lockdown mode.
>  .SH VERSIONS
>  The Kernel Lockdown feature was added in Linux 5.4.
> +.SH NOTES
> +The Kernel Lockdown feature is enabled by CONFIG_SECURITY_LOCKDOWN_LSM.
> +The
> +.I lsm=lsm1,...,lsmN
> +command line parameter controls the sequence of the initialization of
> +Linux Security Modules.
> +It must contain the string
> +.I lockdown
> +to enable the Kernel Lockdown feature.
> +If the command line parameter is not specified,
> +the initialization falls back to the value of the deprecated
> +.I security=
> +command line parameter and further to the value of CONFIG_LSM.
>  .\" commit 000d388ed3bbed745f366ce71b2bb7c2ee70f449
> --
> 2.28.0
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
