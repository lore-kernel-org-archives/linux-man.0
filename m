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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A593C43464
	for <linux-man@archiver.kernel.org>; Fri, 18 Sep 2020 21:03:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EA716221EC
	for <linux-man@archiver.kernel.org>; Fri, 18 Sep 2020 21:03:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jj0NDjOt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726269AbgIRVDv (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Fri, 18 Sep 2020 17:03:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726118AbgIRVDv (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Fri, 18 Sep 2020 17:03:51 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBADFC0613CE
        for <linux-man@vger.kernel.org>; Fri, 18 Sep 2020 14:03:50 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id g4so6900118wrs.5
        for <linux-man@vger.kernel.org>; Fri, 18 Sep 2020 14:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=cc:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=W2IC2VOxIgWgy6PQeRMYc6zJLglTt91qrfvQqye7VC8=;
        b=Jj0NDjOtvKhUO5ynsys6QQ34GEFJi/RFrfXJUC9m//oK8L7dvzMzyTuWfYYx5a/j0P
         r/8S+wYFGKjSpRNxp7HHzbARFpHYfrX6w9ZXpw0CsbePLvAYpz68BW51GH5W2wQM85bw
         wjjeDQCPdxSxPqecpBA8WFbZHXquPhBpaF/8FheVkqd7gESNcIEYbhECdcboQWWL51GL
         Qj2JzXzfGgXHuz9vU44SgGzz7QjJU/d5mgMf/5P4QSa/XdcJ86eYBSSe2dsTMOy4mQ3k
         tFYxfdGTRAM8SfvDtiMda7aYMFE6mzGvbYu9FaNoSh1Q9X5pQGAYCXnkgyoyF05w1j0R
         /6vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:cc:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=W2IC2VOxIgWgy6PQeRMYc6zJLglTt91qrfvQqye7VC8=;
        b=jzymmuv2CaXri33KEJR1PJVFgOezyIzZOJHLNSwv4zog7+27cOJnDtY/DQqTEOKSnp
         VI6UxAbT/bmNkObKAcNQQqrt5fXNeA/2enK0uhgAB6r5rX517u/dGXsOdQpHTI0XXJzY
         tgoq352Plz5AkY+WE1pmDLyoqb8b+JSldbvc70rIUtOhyLNPAkf+PAyYLU5jG2r3xeyP
         bSi/2Gs++S+D05dC5VICHvDVa3g2HCHvJktmFmuSXvD+85bl7UfoxfyfydB6vK1E1pqo
         4g0pzzqiJFICkkP833mhd5En6wU0IwtsyFjtBmumOA5EuLvur3OnnvBohUulX7TkgUfF
         kGqw==
X-Gm-Message-State: AOAM533U+EVdWo3zfihrQMPgWNll4yntHo3Onbs277WP16jOQkc25hyf
        TVF24uphVQspGVqr9YPHQHXvyTJm4fE=
X-Google-Smtp-Source: ABdhPJxMwcbLnZ9C0k0NJAjgJPkwJABQzS9KIuZnoMmgXzoPmCQ6EqecnLiwN+CIeP0M4dqmYhRTCA==
X-Received: by 2002:adf:dbc3:: with SMTP id e3mr21591771wrj.1.1600463029544;
        Fri, 18 Sep 2020 14:03:49 -0700 (PDT)
Received: from ?IPv6:2001:a61:2479:6801:d8fe:4132:9f23:7e8f? ([2001:a61:2479:6801:d8fe:4132:9f23:7e8f])
        by smtp.gmail.com with ESMTPSA id m10sm6624225wmi.9.2020.09.18.14.03.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2020 14:03:48 -0700 (PDT)
Cc:     mtk.manpages@gmail.com, linux-man@vger.kernel.org,
        libc-alpha@sourceware.org
Subject: Re: [PATCH 2/9] system_data_types.7: srcfix: Add FIXME note: Add
 descriptions
To:     Alejandro Colomar <colomar.6.4.3@gmail.com>
References: <20200918170442.94920-1-colomar.6.4.3@gmail.com>
 <20200918170442.94920-3-colomar.6.4.3@gmail.com>
 <8e140181-ff02-6cb5-a46b-7057436d685e@gmail.com>
From:   "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Message-ID: <87b7b1b8-7a37-7ff6-49b5-11a9e7710276@gmail.com>
Date:   Fri, 18 Sep 2020 23:03:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8e140181-ff02-6cb5-a46b-7057436d685e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Hi Alex,

On 9/18/20 10:50 PM, Michael Kerrisk (man-pages) wrote:
> On 9/18/20 7:04 PM, Alejandro Colomar wrote:
>> Signed-off-by: Alejandro Colomar <colomar.6.4.3@gmail.com>
> 
> 
> Thanks, Alex. Patch applied.

Sorry -- I misspoke. This pach doesn't apply. It wasn't obvious why.

But, yes, I think adding a description would be good.

Thanks,

Michael

>> ---
>>  man7/system_data_types.7 | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/man7/system_data_types.7 b/man7/system_data_types.7
>> index 5352f3ef2..48871e4eb 100644
>> --- a/man7/system_data_types.7
>> +++ b/man7/system_data_types.7
>> @@ -96,6 +96,8 @@ typedef struct {
>>                          * the end of substring */
>>  } regmatch_t;
>>  .EE
>> +.\".IP
>> +.\" FIXME: Add a description?
>>  .IP
>>  Conforming to: POSIX.1-2001 and later.
>>  .IP
>>
> 
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
