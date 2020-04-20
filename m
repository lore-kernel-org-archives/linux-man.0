Return-Path: <SRS0=zzzS=6E=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A002EC54FCC
	for <linux-man@archiver.kernel.org>; Mon, 20 Apr 2020 06:13:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7D1F9206F6
	for <linux-man@archiver.kernel.org>; Mon, 20 Apr 2020 06:13:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NweH4pRQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725959AbgDTGNI (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 20 Apr 2020 02:13:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725780AbgDTGNI (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Mon, 20 Apr 2020 02:13:08 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0ADFC061A0C
        for <linux-man@vger.kernel.org>; Sun, 19 Apr 2020 23:13:07 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id k1so10603660wrx.4
        for <linux-man@vger.kernel.org>; Sun, 19 Apr 2020 23:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=cc:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=E8TfOONizcZFMf6pyPQzO7hKKSOyxtwX3EWyWHcRvyU=;
        b=NweH4pRQ720oYsRDNxvgCq3GXRKVshZByiWaa+g2URetI65Du21VKuD3PBNELuNhwe
         XS3o+yzQfZKf4l2JSqBllbdDzNf70esz77itH5DJxgVW3hGKU4/dS2xUJZQmKkladQki
         mUytlFsVP0dnNOJNL+KX5VMsu02Bn5qa6Y63Tq0Ek/iygISTiDr44KmulGi4tDz6R0JK
         oBRe8REC47rZg36Rt4tKH64RVNk4bmAGSP/u8MIGg8AxTTNgaoBcNwd27EPcG/5HyYtI
         H/Cz9SX+s0M44UbZ+aRTQAuya8X4yDbq44NMi/0MxNBJ2lF2GmHQ/dfc5L3NLkM/fVGk
         B/8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:cc:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=E8TfOONizcZFMf6pyPQzO7hKKSOyxtwX3EWyWHcRvyU=;
        b=dE7i5CSwRx6YiYkgT5DvW0Pdi1LIwhoU2SxceL2HRVFjFADXWpgmDrzApj6pBaqw5H
         Zj5pvzpaemCD6/q4Ntdt4K1BI7tb0tOFvd1DWfgqpStwh25VhxKh9OnPfcBLwTiiNtZq
         CjF19D/573Tt/ssiKfrbc1/UTzki6dajnL4BGpjNKCh88b8NQcTmr+48dLEDXxgfQaHx
         BJMcMWVKDKC7II5pA1IgjnGMw0pEh6/WMAVy0fJZwkqvTrUTSJPyun+b3KHh8gXPHu6p
         z6zxsTCXb5WsGy+gvdEOy8iIm7qV+YC8GU+DNUkT7ZYoR6OrjEOCeQih55XXRgtmvrxz
         YbmA==
X-Gm-Message-State: AGi0PuaXEmkxWjcVXn+OyMv0I+LnVYaEcRCMJMQNNHOv8nVR62jDzulz
        Em0jA8uuVcllWFyJWd7AE9nXVbaZ
X-Google-Smtp-Source: APiQypLDfCp9Zovhr/0yolbi5Xfa0v9HRFd/pDv652HGh1IPJFOsEq9qXGS99hoALfiL4RsNgMt/7Q==
X-Received: by 2002:adf:ee0c:: with SMTP id y12mr18355916wrn.0.1587363186325;
        Sun, 19 Apr 2020 23:13:06 -0700 (PDT)
Received: from ?IPv6:2001:a61:2482:101:3351:6160:8173:cc31? ([2001:a61:2482:101:3351:6160:8173:cc31])
        by smtp.gmail.com with ESMTPSA id l16sm27524366wrp.91.2020.04.19.23.13.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Apr 2020 23:13:05 -0700 (PDT)
Cc:     mtk.manpages@gmail.com, linux-man@vger.kernel.org
Subject: Re: Errors in man pages; here: initrd(4): Grammar
To:     Helge Kreutzmann <debian@helgefjell.de>
References: <20200419064807.GA30978@Debian-50-lenny-64-minimal>
From:   "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Message-ID: <c204bded-8fbc-6c3c-d7ae-dad741254b0e@gmail.com>
Date:   Mon, 20 Apr 2020 08:13:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200419064807.GA30978@Debian-50-lenny-64-minimal>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

On 4/19/20 8:48 AM, Helge Kreutzmann wrote:
> Dear manpages maintainers.
> the manpage-l10n project maintains a large number of translations of
> man pages both from a large variety of sources (including manpages) as
> well for a large variety of target languages.
> 
> During their work translators notice different possible issues in the
> original (english) man pages. Sometiems this is a straightforward
> typo, sometimes a hard to read sentence, sometimes this is a convention
> not held up and sometimes we simply do not understand the original.
> 
> We use several distributions as sources and update regularly (at
> least every 2 month). This means we are fairly recent (some
> distributions like archlinux also update frequently) but might miss
> the latest upstream version once a while, so the error might be
> already fixed. We apologize and ask you to close the issue immediately
> if this should be the case, but given the huge volume of projects and
> the very limited number of volunteers we are not able to double check
> each and every issue.
> 
> Secondly we translators see the manpages in the neutral po format,
> i.e. converted and harmonized, but not the original source (be it man,
> groff, xml or other). So we cannot provide a true patch (where
> possible), but only an approximation which you need to translate into
> your source format.
> 
> Finally the issues I'm reporting have accumulated over time and are
> not always discovered by me, so sometimes my description of the
> problem my be a bit limited - do not hesitate to ask so we can clarify
> them.
> 
> I'm now reporting the errors for your project. As requested, each
> issue is sent in an unique mail for easier tracking on your side. If
> future reports should use another channel, please let me know.
> 
> **
> 
> s/give/given/
> 
> "Users of I</dev/initrd> should not depend on the behavior give in the above "
> "notes.  The behavior may change in future versions of the Linux kernel."

Fixed.

Thanks,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
