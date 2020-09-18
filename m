Return-Path: <SRS0=SL3d=C3=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85F35C43463
	for <linux-man@archiver.kernel.org>; Fri, 18 Sep 2020 21:43:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 420D220848
	for <linux-man@archiver.kernel.org>; Fri, 18 Sep 2020 21:43:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CaKbkO9x"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726236AbgIRVnp (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Fri, 18 Sep 2020 17:43:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbgIRVnp (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Fri, 18 Sep 2020 17:43:45 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66509C0613CE
        for <linux-man@vger.kernel.org>; Fri, 18 Sep 2020 14:43:45 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id a17so6964087wrn.6
        for <linux-man@vger.kernel.org>; Fri, 18 Sep 2020 14:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=cc:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hB5/Jk1ENO3IsYKHzgJOAIMEqMgDoEM89Lp5V1eXlpc=;
        b=CaKbkO9xTPZUPACPQ/ip0iVZvLPpGrt69VhC3bwa+0NSDV9l2qEG4/4PS6E037c2S3
         m6hTig7Hyo6MWwvcAghRJmmJiQ+ulMqqnHOKCMVQ5a44jL9TonHE3PUuZV3/m1XdcCC3
         mmRuUko5AGFnz+1ss6ioa6tP5+dQkgW3eeeEK3C31s6wIbYICd6WG6ezsTtkJf0GZm9r
         mlyHNq3SlF+gZ0hbvMfACIiRO7kME1Elc8s1X1W64MgNX4sTJiM1AnyxN4hKTLiIqYTe
         Uaq/WY5lqkFclPfqjXOzRs+IcExzYXSlkqE5HP7lwmejyBCm5kM9Ng44AwMK5VgWkSD4
         v1ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:cc:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hB5/Jk1ENO3IsYKHzgJOAIMEqMgDoEM89Lp5V1eXlpc=;
        b=L8cMJagGX16zZqXgTpauphdT7EVFxWyFCWIw7UVPk2aZZVu8NrzSMfUfzTqZ8P8IqJ
         izEqymabYA9k1AvfizgxeWFSco3zL6Du1+1HUzU0ESA/nxZWb22/JAf2gxxTlKdy/Pze
         aIKJkx9cZxD7N/c1Sl/KW2rlsEcI0HPFpKf9uCj2AHLyVIT8X70PFo4HBsDJoY3RKJBE
         LIF9+159YhHew3gRUMhU6Fe2yvSRE+3rgRYq7CCcIhiAAXef30OU7o2yMN683TCi8+oO
         mlwewWdVPIA0/TS7FbQkUbE1i1W5WyWH9R8V4ZB64I+a6EEBGSGxq/1Us974PvnfMtip
         WF1A==
X-Gm-Message-State: AOAM5334zssR7hZEc+isrgdPZsbHtGfA2sJ+nog5xbRS9lLpqKWEVNdc
        Bx+KaVii6l63dn74U59EegY=
X-Google-Smtp-Source: ABdhPJyZzEMtU0JIGCDREQkr29Xzf/uaGh3Sn9QB7cnOWaO8C/9+g1fuqIbnQPeVlUqO7UaQWykkeA==
X-Received: by 2002:adf:ef48:: with SMTP id c8mr40426404wrp.370.1600465424139;
        Fri, 18 Sep 2020 14:43:44 -0700 (PDT)
Received: from ?IPv6:2001:a61:2479:6801:d8fe:4132:9f23:7e8f? ([2001:a61:2479:6801:d8fe:4132:9f23:7e8f])
        by smtp.gmail.com with ESMTPSA id i11sm7389173wre.32.2020.09.18.14.43.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2020 14:43:43 -0700 (PDT)
Cc:     mtk.manpages@gmail.com, linux-man@vger.kernel.org,
        libc-alpha@sourceware.org
Subject: Re: [PATCH 4/9] sigevent.3: New link to new documented type in
 system_data_types(7)
To:     Alejandro Colomar <colomar.6.4.3@gmail.com>
References: <20200918170442.94920-1-colomar.6.4.3@gmail.com>
 <20200918170442.94920-5-colomar.6.4.3@gmail.com>
 <8cea2a6b-bbe1-3289-a0c2-3baa75ec757a@gmail.com>
 <3f33a784-6771-d91f-ae15-2ba599c108ea@gmail.com>
From:   "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Message-ID: <de6a7e53-cd66-b58b-058a-f7eefb8d5984@gmail.com>
Date:   Fri, 18 Sep 2020 23:43:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3f33a784-6771-d91f-ae15-2ba599c108ea@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

On 9/18/20 11:39 PM, Alejandro Colomar wrote:
> Hi Michael,
> 
> On 2020-09-18 23:10, Michael Kerrisk (man-pages) wrote:
>> Hi Alex,
>>
>> On 9/18/20 7:04 PM, Alejandro Colomar wrote:
>>> Signed-off-by: Alejandro Colomar <colomar.6.4.3@gmail.com>
>>> ---
>>>   man3/sigevent.3 | 1 +
>>>   1 file changed, 1 insertion(+)
>>>   create mode 100644 man3/sigevent.3
>>
>> I think that I won't apply this, since it will hide sigevent(7).
>> Okay?
>>
>> Thanks,
>>
>> Michael
>>
>>
>>>
>>> diff --git a/man3/sigevent.3 b/man3/sigevent.3
>>> new file mode 100644
>>> index 000000000..db50c0f09
>>> --- /dev/null
>>> +++ b/man3/sigevent.3
>>> @@ -0,0 +1 @@
>>> +.so man7/system_data_types.7
>>>
>>
>>
> 
> 
> Fine,  sigevent(7) already documents the type, so it's perfect.  The 
> type will be documented in system_data_types.7 anyway, so no problem.
> 
> I guess you'll add a reference to system_data_types(7) in sigevent(7), 
> right?

Do you think it's needed? I"m not so sure...

Thanks,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
