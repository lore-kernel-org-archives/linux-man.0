Return-Path: <SRS0=vWXC=DZ=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9520C433DF
	for <linux-man@archiver.kernel.org>; Sun, 18 Oct 2020 05:46:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 80D73208B8
	for <linux-man@archiver.kernel.org>; Sun, 18 Oct 2020 05:46:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fJ1aO0BP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725306AbgJRFqd (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sun, 18 Oct 2020 01:46:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725275AbgJRFqc (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Sun, 18 Oct 2020 01:46:32 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B333C061755
        for <linux-man@vger.kernel.org>; Sat, 17 Oct 2020 22:46:32 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id d81so7211145wmc.1
        for <linux-man@vger.kernel.org>; Sat, 17 Oct 2020 22:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=cc:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=a14FegYy0vmj8rO405PcLHVax1VOaPdSOQgy+w1Jco0=;
        b=fJ1aO0BPLLt3FlidB+h0QZ5qdooJFXN6VJh2SaCw0x2yMwKoeDAn+NpICY9urUJpWR
         INSyXX729UFMg+/IboNz9Edn9F6ujV5K7Tko+f+HPIrNAQRkA4aTAav5MAfsjDi6CpH+
         UBOU7WoeH8ePdKo+OPms8Ck/D6ifvH7NW9G0xd3b22XkUnTYeh/GCkjAYO4ulu79n5Fy
         E8a1YpoLRtyQ5uNf7IfE+Ig8LEMbOkofHjl5bq7zz1XSug2sOSamy7ynwnyjOsadgRYZ
         FZvx3pCPGsXO9qYtxqCzSTOpZx2r+eVh83twTLIoB5kWsYOC94PPAsc+Rko55qopG61U
         PoJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:cc:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=a14FegYy0vmj8rO405PcLHVax1VOaPdSOQgy+w1Jco0=;
        b=RRyJEUgEugP8inEduKTln9Uw0Owe4aUx09exUkL81SVo8qIVe9kNzEiKNLHY+jjNE9
         /LsmgmN3W9trCRZsEawVUPtO/+XAifz+aiFbzN7Zvn+2+NxRJpBlb3zGnIPs0HE+hwNU
         U3Ajdtqy1N9vllGcTNV+0JhknwMwfi8OfUyZW32zhCo1B8bEywNDNxSKQlOG/HqJ5HYv
         q46b4U3O59HE5Ex+5TF3zSlCW+Yfzy7b3SZ27iyh3hj1bdkx1swOBaZXaR6Lt6xKzFKp
         oA8mTKCaWIFFpIDVb3gsmTxKFuXh4FYMLEpGUYcYqHLUsK/fMnXQekL3BJsJ8xVaD0on
         thdw==
X-Gm-Message-State: AOAM533RBuBu8QXnHqq/NkeqdPHLHw3sZpyNh68OZkA1iN7ZbmgIExSJ
        96PM+84rFLJh1zQiquMtrs8=
X-Google-Smtp-Source: ABdhPJx1CGu5Dkgsu2ADJz+az0TGOHMQJVo4xEoFonhNOsr00gaQPut1uX9kMohwyhHMRkunyWE/XA==
X-Received: by 2002:a1c:7214:: with SMTP id n20mr11488667wmc.93.1602999990995;
        Sat, 17 Oct 2020 22:46:30 -0700 (PDT)
Received: from [192.168.1.10] (static-176-175-73-29.ftth.abo.bbox.fr. [176.175.73.29])
        by smtp.gmail.com with ESMTPSA id r1sm12494441wro.18.2020.10.17.22.46.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2020 22:46:30 -0700 (PDT)
Cc:     mtk.manpages@gmail.com, linux-man@vger.kernel.org,
        libc-alpha@sourceware.org
Subject: Re: [PATCH 1/3] system_data_types.7: time_t: Add Versions note
To:     Paul Eggert <eggert@cs.ucla.edu>,
        Alejandro Colomar <colomar.6.4.3@gmail.com>
References: <20201017213758.9270-1-colomar.6.4.3@gmail.com>
 <7dc0c08b-ebf8-3d79-75c8-7579f537cd48@cs.ucla.edu>
From:   "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Message-ID: <78f7baf9-bd40-39d5-bbca-403381ec369a@gmail.com>
Date:   Sun, 18 Oct 2020 07:46:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <7dc0c08b-ebf8-3d79-75c8-7579f537cd48@cs.ucla.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

On 10/18/20 3:05 AM, Paul Eggert wrote:
> On 10/17/20 2:37 PM, Alejandro Colomar via Libc-alpha wrote:
>>   since POSIX.1-2008.
>> +.PP
>> +Prior to POSIX.1-2008,
>> +the type was either an integer type or a real-floating type.
> 
> No actual POSIXish implementation ever made it a real-floating type, though, and 
> that point should be made lest some conscientious programmer worry about a 
> nonexistent porting issue.

Thanks for catching this, Paul!

Alex, I suggest either we drop this patch, or you could reword as
something like: 

"In POSIX.1-2001, the type was specified as being either an integer 
type or a real-floating type. However, existing implementations
used an integer type, and POSIX.1-2008 tightened the specification
to reflect this."

Thanks,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
