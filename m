Return-Path: <SRS0=r36n=DJ=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B9E5C4363D
	for <linux-man@archiver.kernel.org>; Fri,  2 Oct 2020 13:51:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 54AF220679
	for <linux-man@archiver.kernel.org>; Fri,  2 Oct 2020 13:51:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387412AbgJBNv2 (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Fri, 2 Oct 2020 09:51:28 -0400
Received: from mailout.hrz.tu-darmstadt.de ([130.83.252.150]:48933 "EHLO
        mail-relay150.hrz.tu-darmstadt.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726090AbgJBNv2 (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Fri, 2 Oct 2020 09:51:28 -0400
Received: from Bounce.nt.e-technik.tu-darmstadt.de (Bounce.nt.e-technik.tu-darmstadt.de [130.83.228.113])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by mail-relay150.hrz.tu-darmstadt.de (Postfix) with ESMTPS id 4C2rxp1nkFz43qm;
        Fri,  2 Oct 2020 15:51:26 +0200 (CEST)
Received: from [130.83.18.82] (Gstoder.nt.e-technik.tu-darmstadt.de [130.83.18.82])
        (authenticated bits=0)
        by Bounce.nt.e-technik.tu-darmstadt.de (8.15.2/8.15.2) with ESMTPSA id 092DpP1b011770
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Fri, 2 Oct 2020 15:51:25 +0200 (CEST)
Subject: Re: strsignal(3) mentions sys_siglist, which is gone
To:     mtk.manpages@gmail.com
Cc:     linux-man <linux-man@vger.kernel.org>
References: <20201002103027636420.e5d6e3ba@spg.tu-darmstadt.de>
 <CAKgNAkjVGqh7BKa3JnKSg6o5fQsqvKg4Om9q1t9uPih4a=BshA@mail.gmail.com>
From:   Hauke Fath <hf@spg.tu-darmstadt.de>
Organization: TU Darmstadt
Message-ID: <c0433862-1393-976c-fb00-c19bf2d31e00@spg.tu-darmstadt.de>
Date:   Fri, 2 Oct 2020 15:51:25 +0200
User-Agent: Mozilla/5.0 (X11; NetBSD amd64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKgNAkjVGqh7BKa3JnKSg6o5fQsqvKg4Om9q1t9uPih4a=BshA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

On 2020-10-02 13:12, Michael Kerrisk (man-pages) wrote:
> There's actually more problems. Through some accident of
> history, sys_siglist was documented in both psignal(3) and
> strsignal(3). I've consolidated the discussion to strsignal(3) and
> noted that sys_siglist is no longer exported by glibc since v2.32.

Thanks for the quick fix!

Cheerio,
Hauke

-- 
      The ASCII Ribbon Campaign                    Hauke Fath
()     No HTML/RTF in email	        Institut für Nachrichtentechnik
/\     No Word docs in email                     TU Darmstadt
      Respect for open standards              Ruf +49-6151-16-21344
