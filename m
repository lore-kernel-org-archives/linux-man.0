Return-Path: <SRS0=pEEh=DI=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C47EC4727C
	for <linux-man@archiver.kernel.org>; Thu,  1 Oct 2020 09:36:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E1B8D2087D
	for <linux-man@archiver.kernel.org>; Thu,  1 Oct 2020 09:36:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f5fCOzly"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731131AbgJAJgp (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Thu, 1 Oct 2020 05:36:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725975AbgJAJgp (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Thu, 1 Oct 2020 05:36:45 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C4D5C0613E2
        for <linux-man@vger.kernel.org>; Thu,  1 Oct 2020 02:36:45 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id d4so2182477wmd.5
        for <linux-man@vger.kernel.org>; Thu, 01 Oct 2020 02:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=cc:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=E9nLHjM2/ZnnzrKJoiGqdmA+BFQNm/5inLz9sQJ3K7Y=;
        b=f5fCOzlynzVPMz38yvmjWP7ENJdKUI+ULLFKCynBCQkwvAfeALZCAhFFuALF0owQ9M
         R5KfpPSzn7wVcBA0jKs7ix+8rj1oKMcd6WlqklHBWHvBVpGEJBf/KmGHR9CgArkalh+9
         KXYfn9GJvmmHAD82o/jsJRfYkwBlUf8A5OLPQ2AFOumg9TXzJp5gzSWZcUmLpb3JF9K+
         6JxUEEyCgTNoneT7ntdpQEnmqxZ7lv1vXGrztLw6iYesFRLekZvXYR6nDgqXBe4LtJ9l
         qGwv6wAlZWij2jQXCWhySfLDUc4PE/Zy1PSqefEaUfbnxNWlmTUPpUYadODjrdWuyVpS
         xPNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:cc:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=E9nLHjM2/ZnnzrKJoiGqdmA+BFQNm/5inLz9sQJ3K7Y=;
        b=FmferLzCksrxexaR5HbvPd721+AfgXuysgZ9nWOLU4fiRp+4qWzbwQ94GzI0m2n1U/
         YveEoMyhuy/GMxkHwzlPH31FG4HEIxVyKKxbSh1ram57LdSShWOuOzuoHt+gImy3I91K
         xknF1p93wRKZzlsXGU5JcSGF6j6OYqNM0AXXcij6ZhErqyy6kbd7tnPR0skZ/BtZxWks
         LEt1QmRjO/Ak0tZJXbMRXlu1qIi0HXLobeoJl5YsEFzE7Brhom0YfN/+5QoNzM6+CoA1
         z+eNFB8pMD97slfu47LGsHrFJR103a4uOMz63Gde5zG+H2joZeYVIgoL0oNwVn8veEbl
         97vA==
X-Gm-Message-State: AOAM533IwnY87mUt4C7WK+AGt1q+eNgP/KfG7fe3EEpS0VEVuwLGnRUy
        R9VWq3KrNQEbiVmTM95SSx4=
X-Google-Smtp-Source: ABdhPJy4NB7Vi0v6Vhc3rtHR8kr08mlqBsAend1uQvvSuellrWZ3DjETevHUFM5OOfc2LuGLVTfo2w==
X-Received: by 2002:a1c:9612:: with SMTP id y18mr790213wmd.55.1601545003734;
        Thu, 01 Oct 2020 02:36:43 -0700 (PDT)
Received: from ?IPv6:2001:a61:2479:6801:d8fe:4132:9f23:7e8f? ([2001:a61:2479:6801:d8fe:4132:9f23:7e8f])
        by smtp.gmail.com with ESMTPSA id v2sm8181044wrm.16.2020.10.01.02.36.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2020 02:36:42 -0700 (PDT)
Cc:     mtk.manpages@gmail.com,
        "G. Branden Robinson" <g.branden.robinson@gmail.com>,
        linux-man@vger.kernel.org, libc-alpha@sourceware.org
Subject: Re: [PATCH v2 1/3] system_data_types.7: ffix
To:     Alejandro Colomar <colomar.6.4.3@gmail.com>
References: <836b6d7d-4433-18d0-78aa-542c419c02f2@gmail.com>
 <20200928090322.2058-1-colomar.6.4.3@gmail.com>
 <20200928130558.4qi6jitfwxg6ccm7@localhost.localdomain>
 <1fe937db-8874-a8fb-5e65-88b4b15702fe@gmail.com>
 <20200930104322.6ffed5lw3uqmlzph@localhost.localdomain>
 <f9871768-cc7a-fac0-3500-6a0ccaa78099@gmail.com>
 <d145931a-3bea-7924-e353-08834cc592f0@gmail.com>
 <a2e64aae-4f3b-a7ce-f5ec-fba5e4efdc18@gmail.com>
From:   "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Message-ID: <60194c92-29b5-b50d-a1f2-cda025935631@gmail.com>
Date:   Thu, 1 Oct 2020 11:36:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a2e64aae-4f3b-a7ce-f5ec-fba5e4efdc18@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

On 10/1/20 9:52 AM, Alejandro Colomar wrote:
> Hi Michael,
> 
> On 2020-10-01 09:37, Michael Kerrisk (man-pages) wrote:
>> PS Alex, I believe we are at a sync point right now (i.e., I think
>> that I do not have any unprocessed patches from you). Let me know if
>> I'm wrong.
>>
> 
> There's only one patch missing:
> 
> https://lore.kernel.org/linux-man/20200929151047.GN6642@arm.com/T/#m7e7fe3066750196cfe26afd53a1a2a7896ddfa96
> 
> I hope it still applies.

It does. Applied and pushed.

Thanks,

Michael



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
