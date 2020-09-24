Return-Path: <SRS0=d1fi=DB=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8944FC4363D
	for <linux-man@archiver.kernel.org>; Thu, 24 Sep 2020 11:05:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3A5CE20702
	for <linux-man@archiver.kernel.org>; Thu, 24 Sep 2020 11:05:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WL2OQkkd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726805AbgIXLFm (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Thu, 24 Sep 2020 07:05:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726303AbgIXLFl (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Thu, 24 Sep 2020 07:05:41 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C89FC0613CE
        for <linux-man@vger.kernel.org>; Thu, 24 Sep 2020 04:05:41 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id e22so2933105edq.6
        for <linux-man@vger.kernel.org>; Thu, 24 Sep 2020 04:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=cc:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ntyGMuGK0HLy5fkoGJIf6vp3gPJan6kd4CJKDAFJ4fc=;
        b=WL2OQkkdvpRg6VDcn9iUDdMbqSqcMUee3jLlf9aeZnCXisEnCzB7o9e3CFCDLkFJPT
         E/TY6S20YEL9zTFw7HUDjOkdWA0leedt3+i5pPPYQb+mC9ad7/pasF0MkpqMrHw3iRYJ
         IuL0PjS6p41/TByZ6PZWtCxci4jxNgbr7381cSUc1idnbpaN6tjZa7oOh2vQd2L6vz5v
         6sqGFWdS+xiM5UhwCo5/i9OOOVTq7k6UeRqmgdA2A8NC8RbNuZzJiHnGGGRFBwuqie4B
         EzORXh1gxvjxU67OSL8CGJzWokYrhhIArZzBrI1EVSxNXtL1ocywsXQ9kxX305n8dapy
         MYfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:cc:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ntyGMuGK0HLy5fkoGJIf6vp3gPJan6kd4CJKDAFJ4fc=;
        b=ggGwwrU2jhDQkM99p42Iv7UF3IkEkhgESMrDDn95K4Cs+nxpZLeDuIyVYzMQOUoIlr
         3AQ2rqP2eJ6mLuiy44FCCbXAE4y/mfyGnKxeBpaooblJqSkrzp3u3p0tUv2i6MhKb2eI
         DIZ4lBYGjWAsBnjt/Po3kRzk3RDChTmyQDrJuf/p6i8emxYSfkFPr2M2QRLdKdy+tqid
         aD/1Ob7yKLcJ/DQGVdPYsTUfIEaDHl0RIvrB020g7IktvtRJqUVl5ZX9Bq4q3NFmcLZj
         0gPHIK5XCoPTR9O6mZLOhsua+15QTfLhw4iYtUoehtTP2ndsRQV1USZ+B3DjMZ6jvwFW
         lj+w==
X-Gm-Message-State: AOAM530bBph3r7n9Sgg1xruyJvq2DSMn1Wj69i6nobZaUi8OUE5bXozE
        puZePQADEqcF7Y61m6q9OehnvjLQn8Y=
X-Google-Smtp-Source: ABdhPJzoWlY0FjwWRCHjxs1hXKkW+oM8cU8MCk/xPW1TTWmo9T/as2O6axVrKBktJNhAFuJwhntwXQ==
X-Received: by 2002:a05:6402:1219:: with SMTP id c25mr423601edw.220.1600945540000;
        Thu, 24 Sep 2020 04:05:40 -0700 (PDT)
Received: from ?IPv6:2001:a61:2479:6801:d8fe:4132:9f23:7e8f? ([2001:a61:2479:6801:d8fe:4132:9f23:7e8f])
        by smtp.gmail.com with ESMTPSA id q12sm2333908edj.19.2020.09.24.04.05.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2020 04:05:39 -0700 (PDT)
Cc:     mtk.manpages@gmail.com, linux-man@vger.kernel.org
Subject: Re: [PATCH 2/6] div_t.3: New link to system_data_types(7)
To:     Alejandro Colomar <colomar.6.4.3@gmail.com>
References: <20200924101308.78204-1-colomar.6.4.3@gmail.com>
 <20200924101308.78204-2-colomar.6.4.3@gmail.com>
From:   "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Message-ID: <01aad9e7-e554-11de-9d37-1139d578340f@gmail.com>
Date:   Thu, 24 Sep 2020 13:05:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200924101308.78204-2-colomar.6.4.3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

On 9/24/20 12:13 PM, Alejandro Colomar wrote:
> Signed-off-by: Alejandro Colomar <colomar.6.4.3@gmail.com>
> ---
>  man3/div_t.3 | 1 +
>  1 file changed, 1 insertion(+)
>  create mode 100644 man3/div_t.3
> 
> diff --git a/man3/div_t.3 b/man3/div_t.3
> new file mode 100644
> index 000000000..db50c0f09
> --- /dev/null
> +++ b/man3/div_t.3
> @@ -0,0 +1 @@
> +.so man7/system_data_types.7
> 


Applied.

Thanks,

Michael



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
