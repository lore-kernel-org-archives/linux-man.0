Return-Path: <SRS0=MTOS=76=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF313C433E0
	for <linux-man@archiver.kernel.org>; Wed, 17 Jun 2020 17:52:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B7BC521527
	for <linux-man@archiver.kernel.org>; Wed, 17 Jun 2020 17:52:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726594AbgFQRwE (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Wed, 17 Jun 2020 13:52:04 -0400
Received: from gateway34.websitewelcome.com ([192.185.148.140]:16448 "EHLO
        gateway34.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726558AbgFQRwE (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Wed, 17 Jun 2020 13:52:04 -0400
X-Greylist: delayed 1302 seconds by postgrey-1.27 at vger.kernel.org; Wed, 17 Jun 2020 13:52:03 EDT
Received: from cm13.websitewelcome.com (cm13.websitewelcome.com [100.42.49.6])
        by gateway34.websitewelcome.com (Postfix) with ESMTP id B63588A7AEA
        for <linux-man@vger.kernel.org>; Wed, 17 Jun 2020 12:30:18 -0500 (CDT)
Received: from gator3278.hostgator.com ([198.57.247.242])
        by cmsmtp with SMTP
        id lbtCjIP8XwgQAlbtCjq7B2; Wed, 17 Jun 2020 12:30:18 -0500
X-Authority-Reason: nr=8
Received: from 89-69-237-178.dynamic.chello.pl ([89.69.237.178]:60364 helo=localhost)
        by gator3278.hostgator.com with esmtpa (Exim 4.93)
        (envelope-from <arkadiusz@drabczyk.org>)
        id 1jlbtB-000GNW-Bo; Wed, 17 Jun 2020 12:30:17 -0500
Date:   Wed, 17 Jun 2020 19:30:10 +0200
From:   Arkadiusz Drabczyk <arkadiusz@drabczyk.org>
To:     Walter Harms <wharms@bfs.de>
Cc:     Jakub Wilk <jwilk@jwilk.net>,
        Michael Kerrisk <mtk.manpages@gmail.com>,
        "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>
Subject: Re: [PATCH] fread.3: Explain that file position is moved after
 calling fread()/fwrite()
Message-ID: <20200617173010.vekk35vrslmtdm6r@comp.lan>
References: <20200616182659.12365-1-arkadiusz@drabczyk.org>
 <20200616190017.5y3pwpb22w2jeqls@jwilk.net>
 <20200616225034.e4uzibuemo7lpmet@comp.lan>
 <3294b2a2fae14460984e2f3162f7ec35@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3294b2a2fae14460984e2f3162f7ec35@bfs.de>
User-Agent: NeoMutt/20180716
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator3278.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - drabczyk.org
X-BWhitelist: no
X-Source-IP: 89.69.237.178
X-Source-L: No
X-Exim-ID: 1jlbtB-000GNW-Bo
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 89-69-237-178.dynamic.chello.pl (localhost) [89.69.237.178]:60364
X-Source-Auth: arkadiusz@drabczyk.org
X-Email-Count: 1
X-Source-Cap: cmt1bXZicmg7cmt1bXZicmg7Z2F0b3IzMjc4Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

On Wed, Jun 17, 2020 at 07:46:25AM +0000, Walter Harms wrote:
> Hi,
> i do not think character is correct it would confuse fseek() it says:
> "The new position, measured in bytes"

ok, v2 already sent.

> to make things more complicated fread has a "size" and returns the
> number of "things" read (" This number equals the number of bytes 
> transferred only  when size  is 1.").
> 
> therefor i would suggest to move the success case
> > > +The file position indicator for the stream is advanced by the number
> > > +of characters successfully read or written.
> into the "description section"

ok, let's see what Michael thinks about it.

> And add a word about partial reads into the "return value" section. E.g.
> to make clear what happens when you try to read size=10 while only 4 are left.
> 

Isn't it already covered by this fragment:

"If an error occurs, or the end of the file is reached, the return
value is a short item count (or zero)."

?

-- 
Arkadiusz Drabczyk <arkadiusz@drabczyk.org>
