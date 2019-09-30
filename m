Return-Path: <SRS0=XFQd=XZ=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2328EC32792
	for <linux-man@archiver.kernel.org>; Mon, 30 Sep 2019 21:12:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E70CB206BB
	for <linux-man@archiver.kernel.org>; Mon, 30 Sep 2019 21:12:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R3rxaWp7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731991AbfI3VMU (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 30 Sep 2019 17:12:20 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:42803 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731050AbfI3VMU (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Mon, 30 Sep 2019 17:12:20 -0400
Received: by mail-wr1-f66.google.com with SMTP id n14so12911067wrw.9
        for <linux-man@vger.kernel.org>; Mon, 30 Sep 2019 14:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=cc:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=guG+UYqmKwQweVDX64MqXehhkwBENdrl9FLgBwZkBN4=;
        b=R3rxaWp7s7WPDT6+fLEbHu42NQwJVifpPaDyU2eDCnsefK2EB4ycpzYXcVWsxFv4P/
         FkBDdgZjcxuMpRcPf+qRazwYx4raEfvwF3ow/XEV9mhN59O45gHK+rirwh1BuVv/fGqe
         dOkYUDegT3t1RDCJQiaZgod6haPwHkKajl3KksJiOCVE/WM/PgyUVXaDPcuNfYoxOJvi
         0/GND1ciBAmv0UQjjTvIwAucaCY88VllIBOVE3l3JuSBqUCQfXokl+lYZsdjLUuXRsAr
         TLjYV1go7isAE77u3JJociu6NJLcnGMMvDZ5fibDbVpPFetkSngYB5qIPyTRwliELQ4/
         Ku3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:cc:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=guG+UYqmKwQweVDX64MqXehhkwBENdrl9FLgBwZkBN4=;
        b=qdF5mVXbgeUIaHlEodPeRWwhU+DLzNwKSQ0/iay3fmTHU5J8J7zIhJ0mcHeXkT7KrB
         MEk5MzTowQNOz3U2zM4gpn2kzLhU72/CRH5Yw90kFZwU5qeARYzuxtJ7D5qIkIx8g5uU
         aZmyH2QUDTsCs4lMbzQfwZSYdcm+nfQNyb335ZG36wfFYFv3SBxqq06SVhTZvhUsYr5i
         sDWT+8OVElM27OjLFel5dF3e7DiFGkbRmD1Q/+Budeh/5uK/Ta3dcm8ZohYpi/oDLyEk
         vKIs//EjQezjlhWjAngOePATikUanYmLJ1HLCYwrDfoMz8pw6DEftMHAH6R1avqvfJJX
         eoJQ==
X-Gm-Message-State: APjAAAUYPsMap6WaUw+mfNMQbkivOKe9orduQuGEbNYOqFoq1SAyBCQa
        PfRjm2ygGi/nKlmA9+n1clLKFCKc
X-Google-Smtp-Source: APXvYqzVzUWF+gYCg6vqM/Upqy7ERrrUx4V3UU4dLO9AAT2Rkm1xhTvHhzQs3hkVsfnNIs+TMeQY+Q==
X-Received: by 2002:adf:eb42:: with SMTP id u2mr14699872wrn.307.1569877938138;
        Mon, 30 Sep 2019 14:12:18 -0700 (PDT)
Received: from ?IPv6:2001:a61:24d6:4e01:ef75:e978:47cd:1c50? ([2001:a61:24d6:4e01:ef75:e978:47cd:1c50])
        by smtp.gmail.com with ESMTPSA id w12sm22749757wrg.47.2019.09.30.14.12.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2019 14:12:17 -0700 (PDT)
Cc:     mtk.manpages@gmail.com, linux-man@vger.kernel.org
Subject: Re: Bug: Small typo in gnutls_x509_crq_get_pk_oid(3)
To:     Toni Kontinen <toni.kontinen@pm.me>
References: <db037e4d-5e89-ef11-5dce-61939326b316@pm.me>
From:   "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Message-ID: <1b6e8acf-0ff3-67cd-b41b-789af7d9055d@gmail.com>
Date:   Mon, 30 Sep 2019 23:12:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <db037e4d-5e89-ef11-5dce-61939326b316@pm.me>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Hello Toni,

On 9/30/19 1:50 PM, Toni Kontinen wrote:
> Hey,
> 
> There's a small typo in the description section of 
> "gnutls_x509_crq_get_pk_oid(3)" page. It reads "This is function is..." 
> when it should read "This function is..."

For bug reports on this page, please see:
http://man7.org/linux/man-pages/man3/gnutls_x509_crq_get_pk_oid.3.html#COLOPHON

Thanks,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
