Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EE8AC433C1
	for <linux-man@archiver.kernel.org>; Sat, 20 Mar 2021 19:50:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2BD1561928
	for <linux-man@archiver.kernel.org>; Sat, 20 Mar 2021 19:50:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbhCTTuP (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Sat, 20 Mar 2021 15:50:15 -0400
Received: from albireo.enyo.de ([37.24.231.21]:46452 "EHLO albireo.enyo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229826AbhCTTuD (ORCPT <rfc822;linux-man@vger.kernel.org>);
        Sat, 20 Mar 2021 15:50:03 -0400
Received: from [172.17.203.2] (port=50453 helo=deneb.enyo.de)
        by albireo.enyo.de ([172.17.140.2]) with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        id 1lNhbk-0007pO-1n; Sat, 20 Mar 2021 19:50:00 +0000
Received: from fw by deneb.enyo.de with local (Exim 4.92)
        (envelope-from <fw@deneb.enyo.de>)
        id 1lNhbj-0003SH-W8; Sat, 20 Mar 2021 20:50:00 +0100
From:   Florian Weimer <fw@deneb.enyo.de>
To:     Seth David Schoen <schoen@loyalty.org>
Cc:     linux-man@vger.kernel.org, gnu@toad.com
Subject: Re: [PATCH 1/1] ip.7: Add "special and reserved addresses" section
References: <20210320002041.GZ2289@frotz.zork.net>
Date:   Sat, 20 Mar 2021 20:49:59 +0100
In-Reply-To: <20210320002041.GZ2289@frotz.zork.net> (Seth David Schoen's
        message of "Fri, 19 Mar 2021 17:20:41 -0700")
Message-ID: <87ft0pzjtk.fsf@mid.deneb.enyo.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

* Seth David Schoen:

> +On any locally-attached IP subnet, the lowest-numbered address and
> +highest-numbered address (e.g., the .0 and .255 addresses on a subnet
> +with netmask 255.255.255.0) are both designated as broadcast addresses.
> +These cannot usefully be assigned to an interface, and can only be
> +addressed with a socket on which the
> +.B SO_BROADCAST
> +option has been explicitly enabled.

I think the broadcast address is actually settable to some degree, and
/31 subnets do not have them.  I wouldn't be surprised if kernel
behavior also depended on the network device.
