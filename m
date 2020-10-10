Return-Path: <SRS0=gQ/3=DR=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96A95C433DF
	for <linux-man@archiver.kernel.org>; Sat, 10 Oct 2020 23:12:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5E3552075E
	for <linux-man@archiver.kernel.org>; Sat, 10 Oct 2020 23:12:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kJJjJn1b"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389526AbgJJWzq (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sat, 10 Oct 2020 18:55:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731306AbgJJTIO (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sat, 10 Oct 2020 15:08:14 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C6C8C0613BD
        for <linux-man@vger.kernel.org>; Sat, 10 Oct 2020 12:08:14 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id p15so13101179wmi.4
        for <linux-man@vger.kernel.org>; Sat, 10 Oct 2020 12:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HxYIqShqUwX/LrhzvlYue50MUqLP4Tibu2JhffDUYnc=;
        b=kJJjJn1b5MGE90kLJlcRNHE1IA19aqA1vVHPz2ub2oLGe9Ei0BJacbVxbuyTpwIxxt
         4Y4+PrFZCG1OgVEBvjm0YbANEjHEQKRJM9hQ5SHnqudz6NtExFDQdPIoRee4zY9YZDCR
         4d6OEmGCK3PZzfl/hClDTwFlrUb8VxwpVQAH/f96mj87j0hEhGXl5sBX06UKBd9RsrQp
         vKLwp4ZnqfrGgRJVo30nniRp4e+Yb3TGxrgzoE5VGzjYq9OWn9e3wMXVCo+AaeYPnH0j
         G1s1BR7vhNZKEfyJSgH2VQH8r3+ascBVfQYxmCX8ToCl76EgcN6GxZ5lqRAYukvao1bW
         X7yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HxYIqShqUwX/LrhzvlYue50MUqLP4Tibu2JhffDUYnc=;
        b=jaAGUh5KyBz4KbXpCY1EFf79FC3I1hxiwquZOjevBOzVAa6NsX0mNoyqbneDrFWWfq
         6ZjMJpi3qT1/GBFcy9lhmGcCmU2ouiIcJ+6ppRpe/e5u7g6S98/brsVfqIbaZ+KST76H
         fDqSEKg8r/m3L3UdeB0yA8WcvY8UuJefktcPFUkOrVijhfBPvLeaHMyml4U0bZjUc7S5
         oblR9suQYewgf7eMMTSJ1t4tkBH9LUxleJ2+YmizVFZ4e7ksHiEsk9YjrpSIVdTiTwfO
         XeDT+RwCSwBs3kCKORZy6A6qy0LeAct47qxjxthLEWV7hQMbl7+SEQL632dwYucW92bc
         9YvA==
X-Gm-Message-State: AOAM532Su6joiLDXF8AL7Lw0s4vEm2w0F6URvMeqJ1nrGvZQ5/ntvKMz
        VOVpJOkkHBnVO5WlCAm1RYY=
X-Google-Smtp-Source: ABdhPJyumLShAn1shuhTcx4ItFRdBZ4kC5zFWoXKn1jihP4s22yNDbIjTx4LO2vTzQdui4y4Ajpq7w==
X-Received: by 2002:a7b:c7c3:: with SMTP id z3mr3660904wmk.43.1602356892695;
        Sat, 10 Oct 2020 12:08:12 -0700 (PDT)
Received: from [192.168.1.143] ([170.253.60.68])
        by smtp.gmail.com with ESMTPSA id n2sm16731869wma.29.2020.10.10.12.08.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Oct 2020 12:08:12 -0700 (PDT)
Subject: Re: [PATCH] queue.3: Replace incomplete example by a complete example
To:     mtk.manpages@gmail.com
Cc:     linux-man@vger.kernel.org, libc-alpha@sourceware.org
References: <20201010190226.19236-1-colomar.6.4.3@gmail.com>
From:   Alejandro Colomar <colomar.6.4.3@gmail.com>
Message-ID: <92309e12-1a90-955b-45da-aedcfe72492a@gmail.com>
Date:   Sat, 10 Oct 2020 21:08:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201010190226.19236-1-colomar.6.4.3@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org



On 2020-10-10 21:02, Alejandro Colomar wrote:
> I thought about having queue.h with an overview of all the different
I meant queue.3 (instead of queue.h).
However, thinking about it,
if we strip if from the details about all of the macros,
it might be better as queue.7.
