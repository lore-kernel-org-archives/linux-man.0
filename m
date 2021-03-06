Return-Path: <SRS0=dKvZ=IE=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=3.0 tests=BAYES_00,FORGED_MUA_MOZILLA,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D22C3C433E6
	for <linux-man@archiver.kernel.org>; Sat,  6 Mar 2021 00:11:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A2827650B6
	for <linux-man@archiver.kernel.org>; Sat,  6 Mar 2021 00:11:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229631AbhCFAKY (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Fri, 5 Mar 2021 19:10:24 -0500
Received: from correo.us.es ([193.147.175.20]:59954 "EHLO mail.us.es"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229629AbhCFAKX (ORCPT <rfc822;linux-man@vger.kernel.org>);
        Fri, 5 Mar 2021 19:10:23 -0500
Received: from antivirus1-rhel7.int (unknown [192.168.2.11])
        by mail.us.es (Postfix) with ESMTP id 24AC9117721
        for <linux-man@vger.kernel.org>; Sat,  6 Mar 2021 01:10:18 +0100 (CET)
Received: from antivirus1-rhel7.int (localhost [127.0.0.1])
        by antivirus1-rhel7.int (Postfix) with ESMTP id 0DDABDA78B
        for <linux-man@vger.kernel.org>; Sat,  6 Mar 2021 01:10:18 +0100 (CET)
Received: by antivirus1-rhel7.int (Postfix, from userid 99)
        id 02B11DA73D; Sat,  6 Mar 2021 01:10:18 +0100 (CET)
Received: from antivirus1-rhel7.int (localhost [127.0.0.1])
        by antivirus1-rhel7.int (Postfix) with ESMTP id C8CD1DA722;
        Sat,  6 Mar 2021 01:10:15 +0100 (CET)
Received: from 192.168.1.97 (192.168.1.97)
 by antivirus1-rhel7.int (F-Secure/fsigk_smtp/550/antivirus1-rhel7.int);
 Sat, 06 Mar 2021 01:10:15 +0100 (CET)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/antivirus1-rhel7.int)
Received: from us.es (unknown [90.77.255.23])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: 1984lsi)
        by entrada.int (Postfix) with ESMTPSA id AC69E42DF561;
        Sat,  6 Mar 2021 01:10:15 +0100 (CET)
Date:   Sat, 6 Mar 2021 01:10:15 +0100
X-SMTPAUTHUS: auth mail.us.es
From:   Pablo Neira Ayuso <pablo@netfilter.org>
To:     Florian Westphal <fw@strlen.de>
Cc:     Alexander Ahring Oder Aring <aahringo@redhat.com>,
        netdev@vger.kernel.org, linux-man@vger.kernel.org,
        David Teigland <teigland@redhat.com>
Subject: Re: [PATCH resend] netlink.7: note not reliable if NETLINK_NO_ENOBUFS
Message-ID: <20210306001015.GA1638@salvia>
References: <20210304205728.34477-1-aahringo@redhat.com>
 <20210305030437.GA4268@salvia>
 <CAK-6q+iBhzFVgm5NQaPCZhJ8tEvVVeTt2OAEGH4QkOfHqfYzaA@mail.gmail.com>
 <20210305203657.GA9426@salvia>
 <20210305232159.GB10808@breakpoint.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210305232159.GB10808@breakpoint.cc>
User-Agent: Mozilla/5.0
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

On Sat, Mar 06, 2021 at 12:21:59AM +0100, Florian Westphal wrote:
> Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> > > If I understand correctly, the connection tracking netlink interface
> > > is an exception here because it has its own handling of dealing with
> > > congestion ("more reliable"?) so you need to disable the "default
> > > congestion control"?
> > 
> > In conntrack, you have to combine NETLINK_NO_ENOBUFS with
> > NETLINK_BROADCAST_ERROR, then it's the kernel turns on the "more
> > reliable" event delivery.
> 
> The "more reliable" event delivery guarantees that the kernel will
> deliver at least the DESTROY notification (connection close).
> 
> If the userspace program is stuck, kernel has to hold on the expired
> entries.  Eventually conntrack stops accepting new connections because
> the table is full.
> 
> So this feature can't be recommended as a best-practice for conntrack
> either.

There are two use-cases for this:

- If you run conntrackd and you really want to sure you backup firewall
  does not get out of sync.

- If you run ulogd2 and you want to make sure your connection log is
  complete (no events got lost).

In both cases, this might comes at the cost of dropping packets if the
table gets full. So it's placing the pressure on the conntrack side.
With the right policy you could restrict the number of connection per
second.

I agree though that combination of NETLINK_NO_ENOBUFS and
NETLINK_BROADCAST_ERROR only makes sense for very specific use-cases.
