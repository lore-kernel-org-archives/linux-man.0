Return-Path: <SRS0=S6P1=CQ=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F7DBC43461
	for <linux-man@archiver.kernel.org>; Mon,  7 Sep 2020 09:21:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 467B82078E
	for <linux-man@archiver.kernel.org>; Mon,  7 Sep 2020 09:21:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728247AbgIGJVL (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 7 Sep 2020 05:21:11 -0400
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:47912
        "EHLO mail3-relais-sop.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728141AbgIGJVK (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Mon, 7 Sep 2020 05:21:10 -0400
X-IronPort-AV: E=Sophos;i="5.76,359,1592863200"; 
   d="scan'208";a="358266513"
Received: from unknown (HELO function) ([193.50.111.115])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Sep 2020 11:21:08 +0200
Received: from samy by function with local (Exim 4.94)
        (envelope-from <samuel.thibault@ens-lyon.org>)
        id 1kFDKl-0002Us-Pe; Mon, 07 Sep 2020 11:21:07 +0200
Date:   Mon, 7 Sep 2020 11:21:07 +0200
From:   Samuel Thibault <samuel.thibault@ens-lyon.org>
To:     Alejandro Colomar <colomar.6.4.3@gmail.com>
Cc:     "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>,
        linux-man@vger.kernel.org, libc-alpha@sourceware.org
Subject: Re: Bug or misdocumented feature in pthread_setaffinity_np.3
Message-ID: <20200907092107.26imngxsr3n7m4sx@function>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
        Alejandro Colomar <colomar.6.4.3@gmail.com>,
        "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>,
        linux-man@vger.kernel.org, libc-alpha@sourceware.org
References: <486f9d85-2828-2b60-990c-3499b2a89559@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <486f9d85-2828-2b60-990c-3499b2a89559@gmail.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Hello,

Alejandro Colomar via Libc-alpha, le lun. 07 sept. 2020 11:00:05 +0200, a ecrit:
> Or is it that those functions return an error code that corresponds to a
> valid `errno` error number?  In that case it could be documented better
> IMHO.
> 
> If that is the case, do those functions set `errno` and also return that
> same `errno` value redundantly?

All pthread functions return E* values on errors, and do not touch
errno.

Samuel
