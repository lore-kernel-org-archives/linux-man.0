Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2CB9C48BE8
	for <linux-man@archiver.kernel.org>; Sun, 20 Jun 2021 03:51:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D03256109F
	for <linux-man@archiver.kernel.org>; Sun, 20 Jun 2021 03:51:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229899AbhFTDxb (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sat, 19 Jun 2021 23:53:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbhFTDxa (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sat, 19 Jun 2021 23:53:30 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35F10C061574
        for <linux-man@vger.kernel.org>; Sat, 19 Jun 2021 20:51:17 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id t13so11210277pgu.11
        for <linux-man@vger.kernel.org>; Sat, 19 Jun 2021 20:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=cc:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0hWyrWsvDJSvOVGFF9MGK7JGvkt68gpmxF88VJocjY0=;
        b=LCtKoOprhmDAxd15sjzrmGZk90Md3b3JXZpvP6MLz7MKEziV1II8zbk1XjWA3fvXYE
         ZWTWpA/RjxvlbfyfHjED2vDgeNRhwj5q/fZ+bHgJ+gT07quqVZ1OahScqP/gqtzQINSg
         2O0i/yDkWhJDm4W1pB59dBVPW1zSqhN4lusbp03Mjc7mC7493r3c930obecscjZ1TYW9
         SuSoHZizyR8tLlVFZzfFJ1L8dru5v0NuMYPfeAwtC14eXwPAVyQqWHghPZFXh5oGMHAu
         1BCVpwc75L7UbLp1p/fYoCLa22aOdnJqnAAoYYJ8WdFhnXh97vVyHBReki80QDueFr3Z
         A+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:cc:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0hWyrWsvDJSvOVGFF9MGK7JGvkt68gpmxF88VJocjY0=;
        b=EScykq8Yd/878+DwERIypB/WOUudEyLMYh0p/q7Roglw7ovkPSjgAx5DBPE3AvF+LD
         h55gxTlOkdiKBxm/Srkzuiw2l+vi6xmrWUDKo6m79Kkgy3xv37/7fOmIwunYzmokILg5
         3oxtoYSniQfzf9V23hOULJG+KWDalvSchAICmQ0YaFnZFhWJVztOKJpvS6vnNK/JleyO
         mfojm/KztEZrQnIC3KSz4DdExLp+DZXPQhFlPeqtesfEq2iPlUG+RhKKxMhyxyfdLtik
         NEfGH6WdUlamlgHvdC6F52lUudRyw4DgnWY9jQXZ7uckh6RNF3gILjWxkfWVzHAvuS5w
         pJ9w==
X-Gm-Message-State: AOAM533YiuyBfSqp5ocTEYf0P+HfVSqWnzuqCfQjybTkNB94/NQD3aTC
        GBpW7ERQ3AHWF2wPvZKFrNY=
X-Google-Smtp-Source: ABdhPJwYELpXJ6WNkbiGrGGuGZhYvCxJARzcvWP1imx9w5RvU7wnOGKmRcHfB/Aov7o7xkce609ouA==
X-Received: by 2002:aa7:921a:0:b029:2cf:b55b:9d52 with SMTP id 26-20020aa7921a0000b02902cfb55b9d52mr12847016pfo.35.1624161076825;
        Sat, 19 Jun 2021 20:51:16 -0700 (PDT)
Received: from [192.168.1.70] (122-61-176-117-fibre.sparkbb.co.nz. [122.61.176.117])
        by smtp.gmail.com with ESMTPSA id r134sm7936790pfc.68.2021.06.19.20.51.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Jun 2021 20:51:16 -0700 (PDT)
Cc:     mtk.manpages@gmail.com, linux-man@vger.kernel.org,
        =?UTF-8?B?xaB0xJtww6FuIE7Em21lYw==?= <stepnem@gmail.com>
Subject: Re: [PATCH 3/3] strcmp.3: tfix
To:     Alejandro Colomar <alx.manpages@gmail.com>
References: <20210612082741.12211-1-alx.manpages@gmail.com>
 <20210612082741.12211-3-alx.manpages@gmail.com>
From:   "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Message-ID: <196eeea4-92b2-2a78-1ada-b59fdf18f60e@gmail.com>
Date:   Sun, 20 Jun 2021 15:51:12 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210612082741.12211-3-alx.manpages@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Hello Štěpán and Alex,

On 6/12/21 8:27 PM, Alejandro Colomar wrote:
> With a simple backslash, '\0' ended up as ' ' in the man output.
> 
> Reported-by: Štěpán Němec <stepnem@gmail.com>
> Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>

Thanks. Patch applied.

Cheers,

Michael

> ---
>  man3/strcmp.3 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man3/strcmp.3 b/man3/strcmp.3
> index c1992c184..3c5a5a6ad 100644
> --- a/man3/strcmp.3
> +++ b/man3/strcmp.3
> @@ -143,7 +143,7 @@ First, some examples using
>  .EX
>  $ \fB./string_comp ABC ABC\fP
>  <str1> and <str2> are equal
> -$ \fB./string_comp ABC AB\fP      # \(aqC\(aq is ASCII 67; \(aqC\(aq \- \(aq\0\(aq = 67
> +$ \fB./string_comp ABC AB\fP      # \(aqC\(aq is ASCII 67; \(aqC\(aq \- \(aq\e0\(aq = 67
>  <str1> is greater than <str2> (67)
>  $ \fB./string_comp ABA ABZ\fP     # \(aqA\(aq is ASCII 65; \(aqZ\(aq is ASCII 90
>  <str1> is less than <str2> (\-25)
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
