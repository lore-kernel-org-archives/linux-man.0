Return-Path: <SRS0=zzzS=6E=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34CC8C54FCC
	for <linux-man@archiver.kernel.org>; Mon, 20 Apr 2020 06:12:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 14F4F206F6
	for <linux-man@archiver.kernel.org>; Mon, 20 Apr 2020 06:12:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AEISNCLs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725896AbgDTGMR (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 20 Apr 2020 02:12:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725780AbgDTGMR (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Mon, 20 Apr 2020 02:12:17 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42291C061A0F
        for <linux-man@vger.kernel.org>; Sun, 19 Apr 2020 23:12:17 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id d17so10552013wrg.11
        for <linux-man@vger.kernel.org>; Sun, 19 Apr 2020 23:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=cc:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=U5CWvB+eOPHeLkeyanTz7CvdXCrMqG8/d+9bXhr7k8Y=;
        b=AEISNCLs82jW3D9q5HS+E1C0osMeintMvkyl5qv5AbVW2+DVP7KR5B/s42M49jsU+Q
         f4za1qb/s5/OLc9MWT7T/e2g/sMvqISGvOTnFZO1PLrII3OUmcRTeySQHtVt/+Olc2rO
         rdTyuVcpBB03LGj7XFtStjEW65UQBy6bWuEXn+RJfLESJg9/PkSfBjqzH0WCFKiEpeHE
         T9dTPWI5Og47xiok7w7WzrOOimD+09jCot4Gab0Tp0I9ILe8cGAwtMN7fx2oEm5/O/9J
         11JATdePT2iMAYqb5ifI62jg6XFzCKiN4PmXh+3B0wMRR9U/kMV8LTBu0EPdEJRhmXY3
         IqfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:cc:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=U5CWvB+eOPHeLkeyanTz7CvdXCrMqG8/d+9bXhr7k8Y=;
        b=Hmga61Xu1DOQM3IB8S/ikLvgdXDZw3YGqe8hIP9BaiRh9+5WZmnG+0VEPMmy7hk+Ed
         SRZud70M+kLsaZaJfvvldCuwG3q9RyKq8ix346RJ6WMM5BcoDT0uAl3BbttS5E1o8w5i
         htKq85jbPMsO0fd9wRb1UVzFCsVOzk1YtUIRmXvmloYnbxXFjV7VVaLroZoA9wPo37Bh
         uHnj/LDSDCvCKix0pRtcUPHrVbFvlpdQwNdT96dYPSkImeij2FVDHEbSyziCO1Km0gui
         c1TtfOdAYDeXa1APzgWmup+0Z2Wd8Cr1tt6refBlPngpYuKUtEIcpG5qRgNhjFwGGC/E
         XDaw==
X-Gm-Message-State: AGi0PuY+Ya2t31QM/4xLnKguBWRr8LOapXzm0PuWB6O/hjz6Kaq0n7US
        msKPWbOnwX5w9Vg70Go2SxiEFUZ0
X-Google-Smtp-Source: APiQypKV6He5UR0NdCkq8Z2JKbd/hZVh8fp4SVUYaNhkqFlWyhQ4FDA/suZn4HCl4NgrV1x66Vpjkg==
X-Received: by 2002:a5d:500b:: with SMTP id e11mr16708322wrt.272.1587363135861;
        Sun, 19 Apr 2020 23:12:15 -0700 (PDT)
Received: from ?IPv6:2001:a61:2482:101:3351:6160:8173:cc31? ([2001:a61:2482:101:3351:6160:8173:cc31])
        by smtp.gmail.com with ESMTPSA id 74sm31245650wrk.30.2020.04.19.23.12.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Apr 2020 23:12:15 -0700 (PDT)
Cc:     mtk.manpages@gmail.com, linux-man@vger.kernel.org
Subject: Re: Errors in man pages, here: readdir(3): Wording
To:     Helge Kreutzmann <debian@helgefjell.de>
References: <20200419064819.GA31677@Debian-50-lenny-64-minimal>
From:   "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Message-ID: <c51794f5-3dbf-ca0b-f996-713f5e23a784@gmail.com>
Date:   Mon, 20 Apr 2020 08:12:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200419064819.GA31677@Debian-50-lenny-64-minimal>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
> "and from an errror" → "from an error"
> 
> "If the end of the directory stream is reached, NULL is returned and I<errno> "
> "is not changed.  If an error occurs, NULL is returned and I<errno> is set "
> "appropriately.  To distinguish end of stream and from an error, set I<errno> "
> "to zero before calling B<readdir>()  and then check the value of I<errno> if "
> "NULL is returned."

Fixed.

Thanks,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
