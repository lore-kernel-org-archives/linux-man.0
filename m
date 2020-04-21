Return-Path: <SRS0=WV/+=6F=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8620DC54FCB
	for <linux-man@archiver.kernel.org>; Tue, 21 Apr 2020 02:40:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6AD562078C
	for <linux-man@archiver.kernel.org>; Tue, 21 Apr 2020 02:40:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725989AbgDUCkZ (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Mon, 20 Apr 2020 22:40:25 -0400
Received: from zimbra.cs.ucla.edu ([131.179.128.68]:45030 "EHLO
        zimbra.cs.ucla.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725988AbgDUCkZ (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Mon, 20 Apr 2020 22:40:25 -0400
X-Greylist: delayed 336 seconds by postgrey-1.27 at vger.kernel.org; Mon, 20 Apr 2020 22:40:24 EDT
Received: from localhost (localhost [127.0.0.1])
        by zimbra.cs.ucla.edu (Postfix) with ESMTP id EDA9116008E;
        Mon, 20 Apr 2020 19:34:47 -0700 (PDT)
Received: from zimbra.cs.ucla.edu ([127.0.0.1])
        by localhost (zimbra.cs.ucla.edu [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id 8q_u3kJl4rI3; Mon, 20 Apr 2020 19:34:47 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by zimbra.cs.ucla.edu (Postfix) with ESMTP id 0941F160094;
        Mon, 20 Apr 2020 19:34:47 -0700 (PDT)
X-Virus-Scanned: amavisd-new at zimbra.cs.ucla.edu
Received: from zimbra.cs.ucla.edu ([127.0.0.1])
        by localhost (zimbra.cs.ucla.edu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id d3Gb1K0fY60G; Mon, 20 Apr 2020 19:34:46 -0700 (PDT)
Received: from [192.168.1.9] (cpe-23-242-74-103.socal.res.rr.com [23.242.74.103])
        by zimbra.cs.ucla.edu (Postfix) with ESMTPSA id CA2C616008E;
        Mon, 20 Apr 2020 19:34:46 -0700 (PDT)
Subject: Re: Errors in man pages, here: tzfile(5): Typo?
To:     "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>,
        Helge Kreutzmann <debian@helgefjell.de>
Cc:     linux-man@vger.kernel.org
References: <20200419064834.GA32494@Debian-50-lenny-64-minimal>
 <149e7d6f-1c0a-400d-7c34-a1bd4d284bdf@gmail.com>
From:   Paul Eggert <eggert@cs.ucla.edu>
Organization: UCLA Computer Science Department
Message-ID: <d9e4d306-3af0-e28a-526d-a97d832b6d86@cs.ucla.edu>
Date:   Mon, 20 Apr 2020 19:34:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <149e7d6f-1c0a-400d-7c34-a1bd4d284bdf@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

On 4/20/20 12:27 AM, Michael Kerrisk (man-pages) wrote:
> I think "UT" here is intended to mean "Universal Time", and as such
> should not be "UTC". Perhaps Paul can comment.

Yes, that's right. The tzfile format covers timestamps that predate the 
introduction of UTC in 1960, so the documentation uses the sloppier and 
more-general term "UT" instead of the more-precise term "UTC".
