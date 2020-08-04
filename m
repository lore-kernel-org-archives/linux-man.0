Return-Path: <SRS0=w1KE=BO=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C489C433DF
	for <linux-man@archiver.kernel.org>; Tue,  4 Aug 2020 19:09:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8076B2086A
	for <linux-man@archiver.kernel.org>; Tue,  4 Aug 2020 19:09:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dPKeTYL5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726360AbgHDTJY (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Tue, 4 Aug 2020 15:09:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726026AbgHDTJW (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Tue, 4 Aug 2020 15:09:22 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 647F2C06174A
        for <linux-man@vger.kernel.org>; Tue,  4 Aug 2020 12:09:22 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id l4so43598571ejd.13
        for <linux-man@vger.kernel.org>; Tue, 04 Aug 2020 12:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=cc:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=TTkCs6ZoEG1RJtpgtLJgcwAx0r4F8NFdzfW8jpODLHc=;
        b=dPKeTYL5NTTpR2hs7LrYT/KQXUZ4Pc8cW4v645myQUHQTCzJ+LMnz0EYbTVDkOJ/tV
         UaoqULDkTzyVxk8HSxmRV9PsrlQOWVzIk2OI+XMux9Z2eO/+zLJHMYXQPu2KzedM+BDT
         3E+AqHO+Py5R0rFz3cJqPpwSuu6NlVpacq1GtrYIVjC2FLJXDtipvkGirWtfLofvnkHR
         eetIcxNLNFi9bG69RHX3GwhlOMB2xCLP/EsmC1HlTxmRpv+84p/zo+tGYaLzuofsEJeO
         NWs5peXCCJ4JoE/6k8V3vATzuzh6zvuCqDyMVfGVuVFLsJDEOWS0ybFggXrrhMVSz1Ad
         RKKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:cc:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TTkCs6ZoEG1RJtpgtLJgcwAx0r4F8NFdzfW8jpODLHc=;
        b=uSiovMZAeUo5rVi1jOK4QJkDmfG7CzncMcOmM8cWgSpu8yp2F5CguwY0r+o9cvmRFB
         TQud6g7wyoT0XX7gvOz+0OcWjuwlTAx7IzzOpEz/5ZpI5xxBATnJwB+DDu9jiSQ4D7V8
         3hI8HOKN0ufnHWBzVxh4N8qtRKHaytJr/Cm1N3PPlottzUGN7UyRfplqMYKpzmThgwY2
         0AAzvLsUeBHc0P1Bqtu+sIOot/md+VzqOfXBYhSUIfSQF4NQV+UHpe1e6JShLcCSyuNi
         U7Qy8emcM4Y1CMCFbU1UbtXkT6Y0+soUw4fb5P/0YtXSfskRktzHUuCNSiWUszJPy93q
         Vxcg==
X-Gm-Message-State: AOAM532tbEmrdz2JO9mWx273VOOrlUoVjrDnudTf85B0l+tYJaf+Hs6l
        wMNuPqcwBG8VUPHKYv+yNm/fZJwi
X-Google-Smtp-Source: ABdhPJzYIiqmvwI4xEM4wdxKrVpoDjFgIxxRQW2CUVgLi4GAlE68SAeDDMWjSYY49/NcvaSBNjk8EQ==
X-Received: by 2002:a17:906:26c3:: with SMTP id u3mr22371197ejc.483.1596568160704;
        Tue, 04 Aug 2020 12:09:20 -0700 (PDT)
Received: from ?IPv6:2001:a61:241a:1101:8c63:f991:aa91:da82? ([2001:a61:241a:1101:8c63:f991:aa91:da82])
        by smtp.gmail.com with ESMTPSA id a16sm18817561ejy.78.2020.08.04.12.09.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2020 12:09:19 -0700 (PDT)
Cc:     mtk.manpages@gmail.com, linux-man@vger.kernel.org
Subject: Re: [patch] math_error.7: tfix 'fettestexcept'
To:     John Scott <jscott@posteo.net>
References: <2307706.5A7OvHLFAv@t450>
From:   "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Message-ID: <0a08869a-4e1c-50f5-0ab0-91d267db5e14@gmail.com>
Date:   Tue, 4 Aug 2020 21:09:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2307706.5A7OvHLFAv@t450>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

On 8/4/20 5:13 PM, John Scott wrote:
> Hi,
> 
> I've added a patch based on git, or you may merge from master
> on https://salsa.debian.org/jscott/man-pages.git
> 
> diff --git a/man7/math_error.7 b/man7/math_error.7
> index 876c1d8fc..6f022166f 100644
> --- a/man7/math_error.7
> +++ b/man7/math_error.7
> @@ -193,7 +193,7 @@ This identifier is supposed to indicate which of the two
> error-notification mechanisms
> .RI ( errno ,
> exceptions retrievable via
> -.BR fettestexcept (3))
> +.BR fetestexcept (3))
> is in use.
> The standards require that at least one be in use,
> but permit both to be available.

Hi John,

Thanks for the patch. Unfortunately, your mail client broke it,
but I have applied the change manually.

Cheers,

Michael

 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
