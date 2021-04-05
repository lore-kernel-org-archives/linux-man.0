Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19D13C433ED
	for <linux-man@archiver.kernel.org>; Mon,  5 Apr 2021 11:10:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E849C613AD
	for <linux-man@archiver.kernel.org>; Mon,  5 Apr 2021 11:10:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232721AbhDELK6 (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 5 Apr 2021 07:10:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232476AbhDELK5 (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Mon, 5 Apr 2021 07:10:57 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E239FC061756
        for <linux-man@vger.kernel.org>; Mon,  5 Apr 2021 04:10:50 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id w3so16305035ejc.4
        for <linux-man@vger.kernel.org>; Mon, 05 Apr 2021 04:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=cc:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/8wa4saeXPGfoPpME+fY85CaYaj+sEh+sC2kb4/FmVA=;
        b=msyOOrY+QW3qUhEbeR0v5GoBUE6z1PIY2qdRnDg45jNnonY4pjFJh4owenXBqimfIA
         jBmzBQK7JNpoT4+GfFnNfi64F+IP/vOZLkfVJ9PJQN0GVuk3v/OMXm9kp0cIUF/3KJfG
         y3Ju2SkTCMclaK1h+4UXNls+2b3xdUvQNmxt6eI5/MAzc64nJ2MaBlyk2h1+3jmTIvPj
         JO8Ylj9kFIjzsp86SQD8RAfLbXa0R06M7NfWIja5m4oyJJetFZnlOfLMrSNCd40hoCAB
         6RNbSq0II9+/JlLxNg9hnNDqTnio1mEoIjWgcTNiTR+qG/0rWJTahZc87zCQCOqycChU
         Y2oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:cc:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/8wa4saeXPGfoPpME+fY85CaYaj+sEh+sC2kb4/FmVA=;
        b=AnYEIpXwDXgtkOURllFoIJvw0hFYXG5vpH0FzvoM4jZx3wkQ+bLIOsG/eVkioTp6kv
         5d+orPOTsH1a17ycg2nHvcMa9+qn5h9x7ny1auPPI64A3SbZwSWYIhXVo+4x0Q330Axh
         b8zWNqI1DtyhzZwLMogCt4jVSb7rZmcAJSrLUoGljuprgmfm8mPdNJ8UkozvTR7mnGQo
         zJ1KMjds/t7yNoVk+Eg0AmTsPF+PUClTo0CgGi4hj5t2M41hdrQl9JXPuVhSNxWe4UEG
         UK6eKxz+nJ+D99lvK14Zo2nH9dcP+nRWW53v6NZVgUmjpfc+4UB4g4D2d4od8WJlWTtH
         T+hA==
X-Gm-Message-State: AOAM530yCwFfsMpBp/K2HNnyIDMSEH21k0AfDIda7h39EkUPiCsVpF0K
        2ohir8YcT5Ufh4YQGYhDvA0=
X-Google-Smtp-Source: ABdhPJx5xIEg+EYZMikpnD/azmQMqmJB+R0KCGyjQQ8yiC0JwF7mW3z/WqFo4WXijOEniK191smqVQ==
X-Received: by 2002:a17:907:3353:: with SMTP id yr19mr28170652ejb.8.1617621049649;
        Mon, 05 Apr 2021 04:10:49 -0700 (PDT)
Received: from ?IPv6:2001:a61:2553:a401:cfc6:2039:a9ec:21ff? ([2001:a61:2553:a401:cfc6:2039:a9ec:21ff])
        by smtp.gmail.com with ESMTPSA id x1sm8659215eji.8.2021.04.05.04.10.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Apr 2021 04:10:49 -0700 (PDT)
Cc:     mtk.manpages@gmail.com, linux-man@vger.kernel.org,
        libc-alpha@sourceware.org
Subject: Re: [PATCH v5 33/35] ioctl_fslabel.2: ffix
To:     Alejandro Colomar <alx.manpages@gmail.com>
References: <20210403194026.102818-1-alx.manpages@gmail.com>
 <20210404115847.78166-34-alx.manpages@gmail.com>
From:   "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Message-ID: <157c88cb-2085-1e3c-362f-813017877166@gmail.com>
Date:   Mon, 5 Apr 2021 13:10:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210404115847.78166-34-alx.manpages@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Hi ALex,

On 4/4/21 1:58 PM, Alejandro Colomar wrote:
> Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>
> ---
>  man2/ioctl_fslabel.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)


Patch applied.

Thanks,

Michael


> diff --git a/man2/ioctl_fslabel.2 b/man2/ioctl_fslabel.2
> index 9f5e0dbbd..af17256f0 100644
> --- a/man2/ioctl_fslabel.2
> +++ b/man2/ioctl_fslabel.2
> @@ -36,7 +36,7 @@ If a filesystem supports online label manipulation, these
>  .BR ioctl (2)
>  operations can be used to get or set the filesystem label for the filesystem
>  on which
> -.B fd
> +.I fd
>  resides.
>  The
>  .B FS_IOC_SETFSLABEL
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
