Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DD50C433F5
	for <linux-man@archiver.kernel.org>; Fri, 20 May 2022 14:44:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237173AbiETOou (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Fri, 20 May 2022 10:44:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237092AbiETOor (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Fri, 20 May 2022 10:44:47 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16698170F21
        for <linux-man@vger.kernel.org>; Fri, 20 May 2022 07:44:46 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id h205-20020a1c21d6000000b003972dda143eso1055958wmh.3
        for <linux-man@vger.kernel.org>; Fri, 20 May 2022 07:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:cc:from:in-reply-to:content-transfer-encoding;
        bh=+VYiZmmXLGtELG9S5wEvECjhGpXL2yX9OIJYzdjS0F0=;
        b=c47rIPrTZ0SUp+HIS5/qMFVG1XAy2XCQkRubSZeXl9K3ToN6N1fVtqV5zVpGf5qx0V
         CEa2uzDtzuTZzpNjvoRgVx7WZ8ixXrykYXNGSRYmC8U669AW00bZGrcdI+nGOhXS3e6z
         WzY6YMR5ybyVWMguL1zbgKHTzFHa4B4OYPme702chii1cfyEV57Df4T7Rsx9OJMKvL68
         phVM4NhhS4gkx/y/YPvMcsHy4MAF+tB8spDhB2bBVx78PEI2/cbvXWzux3oeG6ZKvXVg
         9gDlK8vo3neHxk80hS2Dy8cfK/eOIzIDn/qGZJh7r2cews2IzIJwaQEIkE54qhtiNMdy
         /iJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:cc:from:in-reply-to
         :content-transfer-encoding;
        bh=+VYiZmmXLGtELG9S5wEvECjhGpXL2yX9OIJYzdjS0F0=;
        b=hExcswqTGIJ9AXPsKPoGoQPi/aZVuj+Spaj1Ou/qOQbb9nMajahSLEJMBrlLX7rhl8
         CA2gzIsXGuHvN28mKv+zRa+HQtCHW0sugxOCs4X3YjBd30Ikyxzd8vVbsc2s05d9PSh+
         KhDaFYLQT4LN5gk950MJyOMSMzQqeqg02QUDpuzODLSugtiO5QY/myrRvn0k6LvMvpei
         9/Sv94ZYfts4TY8nioJdDpdr0Q1MAFp2s42uTeSi/0aWBmhVgSAUYMlpS/hDZtBtUYHo
         SleJIIJx00WKw6dQIpvCTua/glKZ3OUAbeCV5fV/CDoQ+3AQYcrgcceZeyp0LQbkYYef
         XXFA==
X-Gm-Message-State: AOAM530fHCbeiGA2j5dsLdcOOER3j/WuKDOXsbftvO5e/vEmXexObWkM
        csY4PcYw9OFXCZpsXSV4q5rTC7qhmz8=
X-Google-Smtp-Source: ABdhPJwDcD0wYj89AcXBm3SL5GKDIs+eDaLevF9ewOGbH3FbBxBRTBzaRbmYcDyJ7dne7+8PmY5IPA==
X-Received: by 2002:a1c:4443:0:b0:397:38a7:30 with SMTP id r64-20020a1c4443000000b0039738a70030mr3104772wma.14.1653057884569;
        Fri, 20 May 2022 07:44:44 -0700 (PDT)
Received: from [192.168.0.160] ([170.253.36.171])
        by smtp.gmail.com with ESMTPSA id m6-20020adfa3c6000000b0020d02ddf4d5sm2852501wrb.5.2022.05.20.07.44.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 May 2022 07:44:44 -0700 (PDT)
Message-ID: <ca8d1d17-4bde-6728-fa15-8655f3e14c3c@gmail.com>
Date:   Fri, 20 May 2022 16:44:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] printf.3: Document 'l' length modifier for a, A, e, E, f,
 F, g, and G
Content-Language: en-US
To:     Vincent Lefevre <vincent@vinc17.net>
References: <20220520141040.1136383-1-vincent@vinc17.net>
Cc:     linux-man@vger.kernel.org
From:   Alejandro Colomar <alx.manpages@gmail.com>
In-Reply-To: <20220520141040.1136383-1-vincent@vinc17.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Hi Vincent,

On 5/20/22 16:10, Vincent Lefevre wrote:
> Signed-off-by: Vincent Lefevre <vincent@vinc17.net>
> ---
>   man3/printf.3 | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/printf.3 b/man3/printf.3
> index 4fa1f11f3..63ea3092f 100644
> --- a/man3/printf.3
> +++ b/man3/printf.3
> @@ -502,7 +502,17 @@ argument, or a following
>   .B s
>   conversion corresponds to a pointer to
>   .I wchar_t
> -argument.
> +argument. In C99, on a following


Why "in C99"?  Is there a different meaning for non-C99?
Do we need to specify?

Also, see man-pages(7):

    Use semantic newlines
        In the source of a manual page, new sentences  should  be
        started on new lines, long sentences should be split into
        lines  at  clause breaks (commas, semicolons, colons, and
        so on), and long clauses should be split at phrase bound‐
        aries.  This convention,  sometimes  known  as  "semantic
        newlines",  makes it easier to see the effect of patches,
        which often operate at the level of individual sentences,
        clauses, or phrases.

Thanks,

Alex

> +.BR a ,
> +.BR A ,
> +.BR e ,
> +.BR E ,
> +.BR f ,
> +.BR F ,
> +.BR g ,
> +or
> +.B G
> +conversion, this length modifier is ignored.
>   .TP
>   .B ll
>   (ell-ell).

-- 
Alejandro Colomar
Linux man-pages comaintainer; https://www.kernel.org/doc/man-pages/
http://www.alejandro-colomar.es/
