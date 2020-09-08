Return-Path: <SRS0=SgYA=CR=vger.kernel.org=linux-man-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 685B6C433E2
	for <linux-man@archiver.kernel.org>; Tue,  8 Sep 2020 10:04:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 81AF02078B
	for <linux-man@archiver.kernel.org>; Tue,  8 Sep 2020 10:04:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=tuta.io header.i=@tuta.io header.b="JmUwkh/5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728904AbgIHKD7 (ORCPT <rfc822;linux-man@archiver.kernel.org>);
        Tue, 8 Sep 2020 06:03:59 -0400
Received: from w1.tutanota.de ([81.3.6.162]:55204 "EHLO w1.tutanota.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728726AbgIHKD6 (ORCPT <rfc822;linux-man@vger.kernel.org>);
        Tue, 8 Sep 2020 06:03:58 -0400
Received: from w3.tutanota.de (unknown [192.168.1.164])
        by w1.tutanota.de (Postfix) with ESMTP id A2B1DFBF2F0;
        Tue,  8 Sep 2020 10:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1599559434;
        s=s1; d=tuta.io;
        h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Cc:Date:Date:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:Sender;
        bh=1vWbNBQS5h1vMQCeMXmE7QJnuCMf381OC+iW2durxaw=;
        b=JmUwkh/5XIay4PqqzKbcGe/mcr3UV0kP5+ugIxBd/8EbCSe1kUWV/oq4fENeOqbD
        DrW41rt+zGagwVfvpvgsJz/I4CWOfL+fQ49fbgOn68uQajZi7pganUWtAO1fWbbqMvU
        XICNlheKXvh9/mxddggtkezsaX0lZJaW0WAuXqiI6VceZHYqus0ax6hIzeLFjn+bH+n
        ySLuuewigYh9qRIi8LTu+1ttPjpXarRMun18CibViw0VvjrVMBjf1rZee7l8To7XK6J
        xJ7Y8/cj0oF7o+/wRnhZCqKuRclBB3UhkjqoSA3dFC8zmDNAVWAmzfinomoaoktqGjH
        bNSo1yl5XQ==
Date:   Tue, 8 Sep 2020 12:03:54 +0200 (CEST)
From:   michael.saunders@tuta.io
To:     mtk.manpages@gmail.com
Cc:     linux-man@vger.kernel.org
Message-ID: <MGh9xxx--3-2@tuta.io>
Subject: possible typo in `man 3 getopt`
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-man-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-man.vger.kernel.org>
X-Mailing-List: linux-man@vger.kernel.org

Think this is just a one char bug.

In the first example provided, the if statement checks for `optind >= argc`,
which I believe should be `<` or maybe `<=`.
Thanks for the truly indespensable work.
