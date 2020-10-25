Return-Path: <SRS0=EgWi=EA=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE381C388F7
	for <linux-man@archiver.kernel.org>; Sun, 25 Oct 2020 21:19:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8F05E208B3
	for <linux-man@archiver.kernel.org>; Sun, 25 Oct 2020 21:19:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="u5EZ6X9Z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1418855AbgJYVT6 (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sun, 25 Oct 2020 17:19:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728497AbgJYVT5 (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sun, 25 Oct 2020 17:19:57 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04C6CC061755
        for <linux-man@vger.kernel.org>; Sun, 25 Oct 2020 14:19:56 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id q5so10661073wmq.0
        for <linux-man@vger.kernel.org>; Sun, 25 Oct 2020 14:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=cc:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=luOCfkIxXUM5QQF2sWQvZd2Kn9TFAiPB/SbjNbF4pco=;
        b=u5EZ6X9Zg8uGVpCVzuzu9W1aDIPoqM6Hg38qm+ejeRhGxBoPfLWra4JDrXxA5MhZho
         otNdlhUroIJv6u1sLgo88Wrm5EWcnZzThGUqmBu3YknEwBM5NQLLWWsDdSr2Y4jszAd2
         I9ApF7yhaoXLB6H/U/sfOFKVj+h2TlJw+KyUHL0xFoiT8jrrKlurdkA6WOFDUpAFV6bR
         t295cKfSALBbF69j4JcaLZlv+gwnOSnDPX0sIujMJmKqUChc5ddlS53x3mD0fAwDnfQh
         5IOTTejIt14L2O+Y80+caD5Np9KiAL9+gksuOpxB73BFMwkT7FBnRNdM9T4WFrGs7MSG
         Pywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:cc:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=luOCfkIxXUM5QQF2sWQvZd2Kn9TFAiPB/SbjNbF4pco=;
        b=OBFVBx5CR0i5Bz4iDJbxD05A64XIu87RluXePgF+d3s2SpSr7rP75ogJhOxS6o1yIw
         O8It0FcnKUFVzhGK8/2L6SwBE3eexyYkKWLp2IuVa+VCqEJOAQqhPvuUaUdP35x54sdc
         LONy69Wb7pTOuf9ChSYXxfjdv+VWqzFqNEWryqUmOOqHRmWaaJYPUg0rFzfMJyc5KNQZ
         QrMCZkFLnwHeQYs4zzTjC7pcwFdViFWufoIuaYAZNuU9NSvckrEe/GV3kok8EEkQfwn4
         TJbXloB2Q5yf7PKvTxgpXdX0GsRjndMKeduZTirh9Yi+8vXrMH/zl8GU4a4y4xPUZbpF
         oiYA==
X-Gm-Message-State: AOAM532UCozRuWWl0QaUCVaPdO7O8ra4qtusTmXoYV7udfxGe+gRYe/N
        beXny3wq5eRQtlCQwTkw4Uk=
X-Google-Smtp-Source: ABdhPJy09ZNmWiaykh1IEN5U369cuQNYO98nkgAyrrRB9NTZ7cImUmu5MyXOpYCzehbbdOPEfWzQ0Q==
X-Received: by 2002:a1c:35c7:: with SMTP id c190mr12480879wma.7.1603660794713;
        Sun, 25 Oct 2020 14:19:54 -0700 (PDT)
Received: from ?IPv6:2001:a61:245a:d801:2e74:88ad:ef9:5218? ([2001:a61:245a:d801:2e74:88ad:ef9:5218])
        by smtp.gmail.com with ESMTPSA id q2sm19124740wrw.40.2020.10.25.14.19.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2020 14:19:54 -0700 (PDT)
Cc:     mtk.manpages@gmail.com, linux-man@vger.kernel.org,
        libc-alpha@sourceware.org
Subject: Re: [PATCH 2/2] clockid_t: New link to system_data_types(7)
To:     Alejandro Colomar <colomar.6.4.3@gmail.com>
References: <20201025210816.8072-1-colomar.6.4.3@gmail.com>
 <20201025210816.8072-2-colomar.6.4.3@gmail.com>
From:   "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Message-ID: <96271c74-b48e-50d5-ae3b-7fec68f09912@gmail.com>
Date:   Sun, 25 Oct 2020 22:19:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201025210816.8072-2-colomar.6.4.3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

On 10/25/20 10:08 PM, Alejandro Colomar wrote:
> Signed-off-by: Alejandro Colomar <colomar.6.4.3@gmail.com>

Thanks, Alex. Patch applied.

Cheers,

Michael

> ---
>  man3/clockid_t.3 | 1 +
>  1 file changed, 1 insertion(+)
>  create mode 100644 man3/clockid_t.3
> 
> diff --git a/man3/clockid_t.3 b/man3/clockid_t.3
> new file mode 100644
> index 000000000..db50c0f09
> --- /dev/null
> +++ b/man3/clockid_t.3
> @@ -0,0 +1 @@
> +.so man7/system_data_types.7
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
