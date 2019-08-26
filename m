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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E05BEC3A59F
	for <linux-man@archiver.kernel.org>; Mon, 26 Aug 2019 21:06:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AD8C0217F5
	for <linux-man@archiver.kernel.org>; Mon, 26 Aug 2019 21:06:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HumADR2o"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726150AbfHZVGN (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 26 Aug 2019 17:06:13 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:40674 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725866AbfHZVGN (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Mon, 26 Aug 2019 17:06:13 -0400
Received: by mail-wr1-f68.google.com with SMTP id c3so16627587wrd.7
        for <linux-man@vger.kernel.org>; Mon, 26 Aug 2019 14:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=cc:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ecy+gR3RfG8vpj61nytBJlnmKov//vQk3IdAz4fhs/4=;
        b=HumADR2oC/ugZhf3Vpbm7I2aP+sBB35AT7bJp+J+OXftClrjNj0X9xnH+jPicENgc9
         UMzeI4WreegORB8l33TpBAxK85wLgIeoptPlzdF6Nb+Phvi++T6CTFc/bf6Wf+Ngw06i
         XA8c5kqS+Obfxso5ctUYpgX2EdUwH3EdoFSsptT6WCo1UyRYwSfcwfSp1Jx3nJDFEPOd
         ZGL4J4Gj7xgcx02U4YPI8rnawTbVSlULA5Wruy1C5MSgbnpLi+Yw262+fL9m0LLM2cNL
         NE66+0gNc4M2+SOd+CZQuiAF1aQn8MWuvk6F/JX3f1Wrmh6hjhMifdqT9ZbYHR4OeItP
         nPHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:cc:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ecy+gR3RfG8vpj61nytBJlnmKov//vQk3IdAz4fhs/4=;
        b=bUvIHyNout6zrT9dkB5Ry3ZBXJPVLUlOOK1iK6JphL3f2pv4AsiznMLYSJb7Hubd3d
         nonEhTQULCYgNNQv+hyOEjcBq656JDtjhE0N6yeLiFIarfX1B/EhaWfKBnpJnem0779Y
         FPdEkWCTVEZioQlYQCkFfrS6aBPBCBmrPc1g+EDOMYifjHoeoceC5GuIwSUTGA6gRc8R
         QnPVrmmUbK2I4GtwMeXgso2fwytbd+LgvNgInp0xMPiYDAt+ToiwJlZNvBdEofKwqLWx
         3kVst46qZoLREo53GHn13wsV/ju+Jbf1IHxJ38lUvmlrPiY2vEIM32YykXcSyJYx3rr6
         XZfw==
X-Gm-Message-State: APjAAAXXfOSKRr3vLenLX6o014RpPwwOUSmIRINtce8Bn7X7V0N18mQX
        bpPelQJH9kA+WoJdjHiXdXPLzZQX
X-Google-Smtp-Source: APXvYqwfWBZUfO8Bo7y9DRTIeoKlHHTuaWz7WtgGMPm/WtJnHFbqBf/4aKSOkFvFgIN0486FY+sV2A==
X-Received: by 2002:a5d:4250:: with SMTP id s16mr24736008wrr.318.1566853570981;
        Mon, 26 Aug 2019 14:06:10 -0700 (PDT)
Received: from ?IPv6:2001:a61:257e:2f01:31ee:f41e:c688:df4? ([2001:a61:257e:2f01:31ee:f41e:c688:df4])
        by smtp.gmail.com with ESMTPSA id f197sm1719286wme.22.2019.08.26.14.06.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2019 14:06:10 -0700 (PDT)
Cc:     mtk.manpages@gmail.com, linux-man@vger.kernel.org
Subject: Re: [PATCH] cgroups.7: tfix
To:     Eric Biggers <ebiggers@kernel.org>
References: <20190824211154.17028-1-ebiggers@kernel.org>
From:   "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Message-ID: <189d070f-c3b6-882a-441b-e6370d857fbb@gmail.com>
Date:   Mon, 26 Aug 2019 23:06:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190824211154.17028-1-ebiggers@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

On 8/24/19 11:11 PM, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>

Thanks. Patch applied.

Cheers,

Michael

> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  man7/cgroups.7 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man7/cgroups.7 b/man7/cgroups.7
> index 7a349c1dd..ca212cb98 100644
> --- a/man7/cgroups.7
> +++ b/man7/cgroups.7
> @@ -919,7 +919,7 @@ Changing the ownership of this file means that the delegatee
>  can move processes into the root of the delegated subtree.
>  .TP
>  .IR /dlgt_grp/cgroup.subtree_control " (cgroups v2 only)"
> -Changing the ownership of this file means that that the delegatee
> +Changing the ownership of this file means that the delegatee
>  can enable controllers (that are present in
>  .IR /dlgt_grp/cgroup.controllers )
>  in order to further redistribute resources at lower levels in the subtree.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
