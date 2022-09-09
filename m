Return-Path: <linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32FF9ECAAD3
	for <linux-man@archiver.kernel.org>; Fri,  9 Sep 2022 12:43:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231451AbiIIMnD (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Fri, 9 Sep 2022 08:43:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230270AbiIIMnC (ORCPT
        <rfc822;linux-man@vger.kernel.org>); Fri, 9 Sep 2022 08:43:02 -0400
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 245CBB24B1
        for <linux-man@vger.kernel.org>; Fri,  9 Sep 2022 05:43:01 -0700 (PDT)
Received: from theinternet.molgen.mpg.de (theinternet.molgen.mpg.de [141.14.31.7])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        (Authenticated sender: buczek)
        by mx.molgen.mpg.de (Postfix) with ESMTPSA id AFDFC61EA1929;
        Fri,  9 Sep 2022 14:42:59 +0200 (CEST)
From:   Donald Buczek <buczek@molgen.mpg.de>
Subject: Repeated phrase in ipv6.7
To:     mtk.manpages@gmail.com, alx.manpages@gmail.com
Cc:     linux-man@vger.kernel.org
Message-ID: <0569b124-7069-cb6a-a487-8d7071f4e0ba@molgen.mpg.de>
Date:   Fri, 9 Sep 2022 14:42:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

[fixed cc]

IPv4 and IPv6 share the local port space.  When you get an IPv4
connection or packet to an IPv6 socket, its source address will
be mapped to v6 and it will be mapped to v6.
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^

D.

-- 
Donald Buczek
buczek@molgen.mpg.de
Tel: +49 30 8413 1433
